# Copilot Instructions — Nebble

Nebble is a Nim wrapper for the Pebble smartwatch SDK (4.9.127+). It has a two-layer architecture: low-level FFI bindings generated from C headers and a high-level idiomatic Nim API on top.

## Build & Test Commands

```bash
nimble build             # Build CLI tool
nimble test              # Full suite: unit + integration + size checks
nimble testUnit          # Fast host-side unit tests only (run this most often)
nimble testSize          # Check Aplite binary < 24KB (skipped on macOS)
```

### Running a single test

```bash
# Host-side test — compiles and executes on your local machine
nim c --skipProjCfg -d:pebbleBasalt -r tests/test_macros.nim

# Device-side test — compile-only check (cannot run locally)
nim c -d:pebbleBasalt --compileOnly tests/test_highlevel.nim
```

`--skipProjCfg` bypasses `tests/nim.cfg` (cross-compilation config). Host tests use `tests/host.cfg` and mock headers from `tests/mocks/`.

## Architecture

### Two-Layer Design

**Layer 1 — FFI (`src/nebble/ffi/`)**: Auto-generated 1:1 C bindings via Futhark. One file per platform in `ffi/generated/` (e.g., `basalt.nim`). `ffi.nim` multiplexes them via `-d:pebble<Platform>` compile flags. Preserves C naming (`snake_case`).

**Layer 2 — High-Level API (`src/nebble/`)**: Nim-idiomatic wrappers organized by subsystem: `ui/`, `foundation/`, `graphics/`, `input/`, `comms/`. `src/nebble.nim` is the umbrella re-export. Prefer `import nebble` over `import nebble/ffi` in user code.

### Managed Handles (ARC Memory Safety)

All UI resources use `*Handle` types (e.g., `WindowHandle`, `TextLayerHandle`) defined by the `DefineUniqueHandle` macro in `src/nebble/ffi/managed.nim`. They track ownership state:

- `hoOwned` — Nim will call C `_destroy` on scope exit
- `hoParented` — added to a parent layer; SDK owns memory, Nim skips `_destroy`
- `hoUnowned` — wraps a system-provided pointer, never destroyed by Nim

`=copy` is disabled (`{.error.}`); use move semantics. `addChild` automatically transitions ownership to `hoParented`. Removing from a parent transitions back to `hoOwned`.

### `nebbleApp` / `nebbleWatchface` Macro

Defined in `src/nebble/ui/declarative.nim`. Generates the full app skeleton (entry point, window, event loop, `NimMain`, `_exit` stubs). Supports responsive layout keywords: `fullWidth`, `fullHeight`, `x=center`, `y=center`.

### Build Pipeline

The `nebble` CLI (in `src/nebble/cli/`) drives a three-phase build:
1. **Nim → C**: `nim c --os:any --cpu:arm --mm:arc --compileOnly` — outputs C files to platform-specific dirs (`src/c/aplite/`, `src/c/basalt/`, etc.)
2. **Bridge**: CLI generates `package.json` with all target platforms
3. **Pebble → .pbw**: `pebble build` via waf produces a unified bundle for all platforms

## Key Conventions

### Naming
- High-level API: `camelCase` procs and variables (`newTextLayer`, `win.push`)
- FFI layer: `snake_case` matching C SDK (`text_layer_create`)
- Constants: `UPPER_SNAKE_CASE` (`GColorBlack`, `BUTTON_ID_SELECT`)
- Platform defines: `pebble` + `CamelCase` (`-d:pebbleBasalt`, `-d:pebbleChalk`)

### Device Code Constraints
- **Never** import `os`, `times`, `asyncdispatch`, or any stdlib module that uses syscalls
- Use `cstring` instead of `string` (avoids heap allocation)
- Use `std/` prefix for all stdlib imports (e.g., `import std/macros`)
- Exceptions are disabled (`--os:any`); use `doAssert condition, "message"` for checks
- All callbacks passed to the SDK must be `{.cdecl.}` and **cannot be closures**
- App entry points use `{.exportc, cdecl.}`

### Platform Feature Detection
```nim
when declared(GColorRed):
  # Color platforms only (Basalt, Chalk, Emery, Gabbro)
  textLayer.textColor = GColorRed
```
`when declared(...)` compiles to zero code on unsupported platforms.

### Heap-Free Strings
`FixedString[N]` provides stack-allocated string formatting via the `f` macro. Use `.cstr` to get a `cstring`. **The `FixedString` must outlive its `cstring` pointer** — `text_layer_set_text` stores the pointer without copying, so always use global or field-level `FixedString` for persistent text.

### Formatting
- 2-space indentation, 100 char line limit
- Major sections separated with `# ===` banners

## Supported Platforms

| Define | Hardware | Display | Color |
|--------|----------|---------|-------|
| `-d:pebbleAplite` | Pebble Classic | 144×168 | B&W |
| `-d:pebbleBasalt` | Pebble Time | 144×168 | Color |
| `-d:pebbleChalk` | Pebble Time Round | 180×180 round | Color |
| `-d:pebbleDiorite` | Pebble 2 | 144×168 | B&W |
| `-d:pebbleFlint` | Pebble 2 Duo | 144×168 | B&W |
| `-d:pebbleEmery` | Pebble Time 2 | 200×228 | Color |
| `-d:pebbleGabbro` | Pebble Round 2 | 260×260 round | Color |

Use `-d:pebbleBasalt` as the default for testing. Aplite has the tightest constraints (24KB binary limit, no color).

## Debug Flags

- `-d:nebbleManagedDebug` — enables runtime assertions and logging in managed handles
- `-d:nebbleManagedStrict` — enables extra assertions and panics on misuse

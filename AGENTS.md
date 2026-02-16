# AGENTS.md — Nebble (Nim + Pebble SDK)

Nebble is a Nim wrapper for the Pebble SDK, featuring a two-layer architecture: low-level FFI bindings and a high-level idiomatic Nim API.

## Build & Test Commands

### Development Pipeline
```bash
nimble build             # Build CLI
nimble test              # Full suite (Unit + Compile + Examples)
nimble testUnit          # Fast host-side unit tests
nimble testSize          # Check Aplite binary size < 24KB
```

### Running Single Tests
```bash
# Run host-side test (uses local Nim runtime)
nim c --skipProjCfg -d:pebbleBasalt -r tests/test_macros.nim

# Compile device-side test (no execution)
nim c -d:pebbleBasalt --compileOnly tests/test_highlevel.nim
```

### CLI Workflow
```bash
nebble new my_app        # Scaffold new project
nebble build --platform basalt
nebble install --emulator basalt
nebble logs --emulator basalt
```

## Code Style Guidelines

### 1. Imports & Core Constraints
- **Prefix:** Always use `std/` for standard library modules (e.g., `import std/macros`).
- **Device Code:** NEVER import modules that use syscalls (e.g., `os`, `times`, `asyncdispatch`).
- **API Choice:** Prefer `import nebble` (high-level) over direct FFI.

### 2. Naming Conventions
- **High-Level:** `camelCase` for procs, variables, and parameters (e.g., `newTextLayer`).
- **FFI Layer:** `snake_case` to match C SDK (e.g., `text_layer_create`).
- **Constants:** `UPPER_SNAKE_CASE` (e.g., `GColorBlack`).
- **Platforms:** `pebble` + `CamelCase` (e.g., `-d:pebbleBasalt`).

### 3. Types & Memory
- **Handles:** Use Managed Handles (e.g., `WindowHandle`) for automatic cleanup via ARC.
- **Pointers:** Raw pointers (`ptr T`) should only be used in `{.cdecl.}` callbacks.
- **Strings:** Use `cstring` for device code. Avoid `string` to prevent heap allocations.
- **ARC:** The project uses `--mm:arc -d:useMalloc` for deterministic memory management.

### 4. Error Handling
- **Exceptions:** Disabled via `--os:any`.
- **Assertions:** Use `doAssert condition, "message"` for runtime checks.
- **Results:** Check return codes from FFI calls (e.g., `AppMessageResult`).

### 5. Formatting & Structure
- **Indentation:** 2 spaces.
- **Line Length:** 100 characters max.
- **Banners:** Separate major sections with `# ===` banners.
- **Pragmas:** Callbacks MUST use `{.cdecl.}`. Entry points use `{.exportc, cdecl.}`.

## Implementation Details
- **Managed Handles:** Defined using the `DefineUniqueHandle` macro in `managed.nim`.
- **Declarative DSL:** Use `nebbleApp` or `nebbleWatchface` for minimal boilerplate.
- **Heap-Free:** Use `FixedString[N]` for dynamic string formatting without fragmentation.

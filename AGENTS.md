# AGENTS.md — Nebble (Nim + Pebble SDK)

Nim wrapper for the Pebble smartwatch SDK. Two-layer architecture: low-level
FFI bindings (Futhark-generated, committed to VCS) + future high-level
idiomatic Nim API on top.

## Project Layout

```
nebble.nimble                     # Package metadata & tasks
cli/                              # Nebble CLI tool source
src/nebble/ffi.nim                # Platform selector — includes correct generated/*.nim + macros.nim
src/nebble/ffi/generate.nim       # Futhark generator (run on HOST, not cross-compiled)
src/nebble/ffi/macros.nim         # Manual Nim replacements for C macros Futhark cannot wrap
src/nebble/ffi/generated/*.nim    # ~10k-line generated bindings per platform (DO NOT hand-edit)
tests/test_ffi.nim                # Compile-only verification test (Low-level FFI)
tests/test_highlevel.nim          # Compile-only verification test (High-level API)
tests/test_macros.nim             # Host-side unit tests (Runtime)
tests/nim.cfg                     # Cross-compilation flags for tests
examples/                         # Sample apps
```

## Build & Test Commands

### 1. Library Development (Testing Nebble itself)

Use `nimble` to run tests for the Nebble library/bindings:

- `nimble test` - Run ALL tests (unit, compile, examples, size checks).
- `nimble testUnit` - Run host-side unit tests (runtime on macOS).
- `nimble testCompile` - Run compile-only checks for all 6 platforms.

### 2. App Development (Using Nebble CLI)

**Prerequisite:** Ensure the `nebble` CLI is installed (`cd cli && nimble build`).
Agents should use the `nebble` CLI for all app creation, building, and deployment tasks.

**Create New App:**
```bash
nebble new my_app              # Create a new app
nebble new my_clock --watchface # Create a watchface
```

**Build App:**
```bash
cd my_app
nebble build                   # Build for all platforms
nebble build --platform basalt # Build for specific platform
```

**Install/Run:**
```bash
nebble install --emulator basalt
nebble install --phone         # Install to connected phone
```

**Check Size (Aplite 24KB limit):**
```bash
nebble size --platform aplite
```

**Clean:**
```bash
nebble clean
```

### Debugging Crashes on Emulator

**IMPORTANT:** The Pebble emulator can enter a corrupted state after a crash.
**Symptoms:** Persistent crashes even after fixing code, or successful installs that still crash.

**Solution:**
1. Make code change.
2. `nebble clean && nebble build`
3. **KILL AND RESTART** the emulator completely (do not reuse running instance).
4. `nebble install --emulator basalt`

## Code Style

### General
- **Linting:** No automated linter. Strictly follow these conventions.
- **Imports:** Use `import` for modules (e.g., `import nebble`). Use `include` ONLY for generated platform files.
- **Cross-Compile:** **NEVER** import modules requiring syscalls (`os`, `times`, `streams`) in device code.

### Naming Conventions
| Layer | Convention | Examples |
|-------|-----------|----------|
| FFI (generated) | C `snake_case` preserved | `window_create`, `text_layer_set_text` |
| High-Level | Nim `camelCase` | `makeGPoint`, `newWindow`, `sTextLayer` |
| Constants | `UPPER_SNAKE_CASE` | `BUTTON_ID_SELECT`, `TRIG_MAX_ANGLE` |
| Platform flags | `camelCase` + `pebble` | `-d:pebbleBasalt`, `-d:pebbleAplite` |
| Types | Nim C-types | `cint`, `int16`, `uint32`, `ptr T` |

### Exports and Visibility
- **Public:** Use `*` export marker (e.g., `proc init*()`).
- **Internal:** Omit `*`.

### Pragmas & Callbacks
- **Callbacks:** **MUST** use `{.cdecl.}`. **NEVER** use Nim closures or capture environment at FFI boundary.
- **Export:** `{.exportc, cdecl.}` for `main()`.
- **Inline:** `{.inline.}` for wrappers.
- **Warning:** `{.warning.}` for features expensive on Aplite (24KB RAM).

### Templates vs Macros
- **Template:** Simple inline expansions/constants.
- **Macro:** `varargs[untyped]` wrappers (e.g., `APP_LOG`).

### Documentation
- Use `##` doc comments.
- Reference equivalent C macro/function names where applicable.

### Types & Error Handling
- **Types:** Use `ptr T` for C pointers. **NEVER** use `ref` or GC-managed types.
- **Errors:** Check return values (NULL pointers, status codes). **DO NOT** raise exceptions (disabled with `--os:any`).

### Memory Management
- **ARC:** Compiled with `--mm:arc` and `-d:useMalloc`.
- **No GC:** No cycle collector. No hidden heap allocations.
- **Lifecycle:** Use Pebble's `*_create` / `*_destroy` pairs manually.

## Platform Differences

| Feature | Aplite | Basalt | Chalk | Diorite | Emery | Flint |
|:---|:---:|:---:|:---:|:---:|:---:|:---:|
| Color | No | Yes | Yes | No | Yes | No |
| Round | No | No | Yes | No | No | No |
| Health | Stub | Real | Real | Real | Real | Real |
| Mic | No | Yes | Yes | Yes | Yes | Yes |
| Smartstrap | No | Yes | Yes | Yes | Yes | No |
| Display | 144x168 | 144x168 | 180x180 | 144x168 | 200x228 | 144x168 |

Use `when defined(pebbleAplite):` to guard platform-specific code.

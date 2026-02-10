# AGENTS.md — Nebble (Nim + Pebble SDK)

Nim wrapper for the Pebble smartwatch SDK. Two-layer architecture: low-level FFI bindings (Futhark-generated) + high-level idiomatic Nim API.

## Project Layout

```
nebble.nimble                     # Package metadata & nimble tasks
cli/                              # Nebble CLI tool source
src/nebble/
  core/                           # App, window, layer, clicks, animation
  ui/                             # TextLayer, MenuLayer, ScrollLayer, etc.
  graphics/                       # Graphics, draw_command, gpath, bitmap ops
  system/                         # System services (merged: battery, vibes, etc.)
  health/                         # Health Service API
  comms/                          # AppMessage, AppSync, DataLogging
  input/                          # Accel, dictation, unobstructed_area
  storage/                        # Persistent storage, resources, fonts
  advanced/                       # Math, UUID utilities
  ffi.nim                         # Platform selector + FFI exports
  ffi/generated/*.nim             # ~10k-line bindings per platform
  ffi/macros.nim                  # Manual C macro replacements

tests/
  test_ffi.nim                    # Compile-only FFI verification
  test_highlevel.nim              # Compile-only API verification
  test_macros.nim                 # Host-side unit tests (runtime)
  nim.cfg                         # ARM cross-compilation flags

examples/                         # Sample apps
```

## Build & Test Commands

### Library Development

```bash
# Run all tests (unit + compile + examples)
nimble test

# Run only host-side unit tests (fast, macOS native)
nimble testUnit

# Compile-only verification for all 6 platforms
nimble testCompile

# Run a single test file
nim c --skipProjCfg -d:pebbleBasalt -r tests/test_macros.nim

# Compile specific test for one platform
nim c -d:pebbleBasalt tests/test_ffi.nim
nim c -d:pebbleAplite tests/test_highlevel.nim
```

### App Development (via CLI)

```bash
# Build CLI first
cd cli && nimble build

# Create new app
nebble new my_app
nebble new my_clock --watchface

# Build
nebble build
nebble build --platform basalt

# Install
nebble install --emulator basalt
nebble install --phone

# Size check (Aplite 24KB limit)
nebble size --platform aplite

# Clean
nebble clean
```

## Code Style Guidelines

### Imports
- Use `import nebble/ffi` for FFI layer access
- Use `include` ONLY for generated platform files in `ffi.nim`
- **NEVER** import `os`, `times`, `streams` in device code (no syscalls on Pebble)
- Standard library modules only from `std/` prefix (e.g., `import std/macros`)

### Naming Conventions

| Layer | Convention | Examples |
|-------|-----------|----------|
| FFI (generated) | C `snake_case` preserved | `window_create`, `text_layer_set_text` |
| High-Level | Nim `camelCase` | `newWindow`, `makeGPoint`, `sTextLayer` |
| Constants | `UPPER_SNAKE_CASE` | `BUTTON_ID_SELECT`, `TRIG_MAX_ANGLE` |
| Platform defines | `camelCase` + `pebble` | `-d:pebbleBasalt`, `-d:pebbleAplite` |
| Types | Nim C-types | `cint`, `int16`, `uint32`, `ptr T` |

### Exports and Visibility
- **Public:** Use `*` export marker: `proc init*()`
- **Internal:** Omit `*`: `proc helper()`
- Export types needed by callbacks or public procs

### Pragmas
- **Callbacks:** MUST use `{.cdecl.}`. NEVER use Nim closures at FFI boundary
- **Main:** `{.exportc, cdecl.}` for `main()`
- **Inline:** `{.inline.}` for wrapper procs (zero overhead)
- **Warnings:** Use `{.warning: "message".}` for Aplite-expensive features

### Types & Error Handling
- **Pointers:** Use `ptr T` for C pointers. NEVER use `ref` or GC types
- **Strings:** Use `cstring` for C strings. Avoid Nim `string` in device code
- **Errors:** Check return values (NULL pointers, status codes)
- **No Exceptions:** Disabled with `--os:any`. Do not use `try/except/raise`

### Memory Management
- **ARC:** Compiled with `--mm:arc -d:useMalloc`
- **No GC:** No cycle collector, no hidden heap allocations
- **Lifecycle:** Manual `*_create` / `*_destroy` pairs

### Platform Guards
```nim
when defined(pebbleAplite):
  # Aplite-specific code (no color, limited RAM)
elif defined(pebbleColor):
  # Color platform code
when declared(ffi.some_function):
  # Guard for APIs not on all platforms
```

### Documentation
- Use `##` doc comments for all public procs
- Reference equivalent C function/macro name
- Include usage examples for complex procs

### Formatting
- 2-space indentation
- Max line length: 100 characters
- Separate sections with `# ===` banners
- Group related procs together

## Debugging

**Emulator crashes:** Kill and restart emulator completely after fixing code. Do not reuse running instance.

## Platform Differences

| Feature | Aplite | Basalt | Chalk | Diorite | Emery | Flint |
|:---|:---:|:---:|:---:|:---:|:---:|:---:|
| Color | No | Yes | Yes | No | Yes | No |
| Round | No | No | Yes | No | No | No |
| Health | Stub | Real | Real | Real | Real | Real |
| Mic | No | Yes | Yes | Yes | Yes | Yes |
| RAM | 24KB | 64KB | 64KB | 64KB | 128KB | 256KB |

## Module Organization (Post-Restructure)

- **core/**: app, window, layer, clicks, animation
- **ui/**: text_layer, bitmap_layer, menu_layer, scroll_layer, action_bar, status_bar, action_menu, number_window, simple_menu_layer, content_indicator
- **graphics/**: graphics, draw_command, draw_command_detail, gpath, rot_bitmap_layer, bitmap_sequence, text_attributes
- **system/**: system (consolidated 9 modules), time
- **health/**: health
- **comms/**: message, app_sync, app_comm, data_logging, worker, wakeup
- **input/**: accel, dictation, unobstructed_area
- **storage/**: storage, resources, fonts
- **advanced/**: math, uuid

# AGENTS.md — Nebble (Nim + Pebble SDK)

Nim wrapper for the Pebble smartwatch SDK. Two-layer architecture: low-level FFI bindings (Futhark-generated) + high-level idiomatic Nim API.

## Project Layout

```
nebble.nimble                     # Package metadata & nimble tasks
cli/                              # Nebble CLI tool source
src/nebble/
  foundation/                     # Core Foundation APIs
    app.nim                       # App lifecycle, pebbleApp macro
    events/                       # Event Services (7 services)
      accel.nim, battery.nim, compass.nim, connection.nim
      focus.nim, health.nim, tick.nim
    time.nim, timer.nim, storage.nim, wakeup.nim
    watch_info.nim, logging.nim, i18n.nim, memory.nim, platform.nim
  ui/                             # User Interface
    window.nim, layer.nim, animation.nim, clicks.nim
    text_layer.nim, bitmap_layer.nim, menu_layer.nim
    action_bar.nim, status_bar.nim, vibes.nim, light.nim
  graphics/                       # Low-level drawing
    graphics.nim, fonts.nim, gpath.nim, draw_command.nim
  comms/                          # Communication
    message.nim, app_sync.nim, smartstrap.nim
  input/                          # Input methods
    dictation.nim
  util/                           # Utilities
    math.nim, uuid.nim
  ffi.nim                         # Platform selector + FFI exports
  ffi/generated/*.nim             # ~10k-line bindings per platform
  ffi/macros.nim                  # Manual C macro replacements
tests/                            # Test suite
examples/                         # Sample apps
```

## Build & Test Commands

### Full Test Suite

```bash
nimble test              # Run all tests (unit + compile + examples)
nimble testUnit          # Run only host-side unit tests (fast)
nimble testCompile       # Compile-only tests for all 6 platforms
nimble testExamples      # Build all examples for all platforms
nimble testSize          # Check Aplite binary size < 24KB
```

### Running Single Tests

```bash
# Run a single test file (skip project config to avoid ARM flags)
nim c --skipProjCfg -d:pebbleBasalt -r tests/test_macros.nim

# Compile single test for specific platform
nim c -d:pebbleBasalt tests/test_ffi.nim
nim c -d:pebbleAplite tests/test_highlevel.nim

# Test specific example manually
cd examples/hello_world
nim c -d:pebbleBasalt --compileOnly src/hello_world.nim
```

### CLI Development Workflow

```bash
# Build CLI
cd cli && nimble build

# Create and build app
nebble new my_app
nebble build --platform basalt
nebble install --emulator basalt
nebble size --platform aplite    # Check 24KB limit
```

## Code Style Guidelines

### Imports

```nim
# Use std/ prefix for standard library
import std/macros
import std/strutils

# NEVER import these in device code (no syscalls on Pebble)
# import os, times, streams  # ❌ Forbidden

# FFI layer access
import nebble/ffi

# Module imports use full paths
import nebble/foundation/events/battery
import nebble/ui/animation
import nebble/graphics/fonts
```

### Naming Conventions

| Layer | Convention | Examples |
|-------|-----------|----------|
| FFI (generated) | C `snake_case` | `window_create`, `text_layer_set_text` |
| High-Level | Nim `camelCase` | `newWindow`, `makeGPoint`, `addChild` |
| Constants | `UPPER_SNAKE_CASE` | `BUTTON_ID_SELECT`, `TRIG_MAX_ANGLE` |
| Platform defines | `camelCase` + `pebble` | `-d:pebbleBasalt` |
| Types | Nim C-types | `cint`, `int16`, `uint32`, `ptr T` |

### Visibility & Exports

```nim
# Public API - use * marker
proc subscribe*(handler: BatteryStateHandler) {.inline.} =
  ## Subscribe to battery state changes.
  ffi.battery_state_service_subscribe(handler)

# Internal - no *
proc helper() =
  discard

# Export types needed by callbacks
export ffi.BatteryStateHandler, ffi.BatteryChargeState
```

### Pragmas

```nim
# Callbacks MUST use {.cdecl.} - NEVER use Nim closures at FFI boundary
proc batteryHandler(state: BatteryChargeState) {.cdecl.} =
  discard

# Main entry point
proc main(): cint {.exportc, cdecl.} =
  discard

# Wrapper procs use {.inline.} for zero overhead
proc chargePercent*(): uint8 {.inline.} =
  result = chargeState().charge_percent
```

### Types & Error Handling

```nim
# Use ptr T for C pointers - NEVER use ref or GC types
var window: ptr Window  # ✓ Good
# var window: ref Window  # ❌ Bad

# Use cstring for C strings - avoid Nim string in device code
proc setText*(text: cstring) {.inline.} =
  ffi.text_layer_set_text(layer, text)

# Check return values (NULL pointers, status codes)
let handle = resource_get_handle(resourceId)
if handle == nil:
  return  # Handle error

# No exceptions - disabled with --os:any
doAssert condition  # Use assertions, not try/except/raise
```

### Memory Management

- **ARC:** Compiled with `--mm:arc -d:useMalloc`
- **No GC:** No cycle collector, no hidden heap allocations
- **Lifecycle:** Manual `*_create` / `*_destroy` pairs

```nim
# Create
let layer = newTextLayer(frame)
# Use...
# Destroy
layer.destroy()
```

### Platform Guards

```nim
# Platform-specific code
when defined(pebbleAplite):
  # Aplite-specific (no color, limited RAM)
  discard
elif defined(pebbleColor):
  # Color platforms
  discard

# Feature availability (preferred method)
when declared(ffi.health_service_sum_today):
  let steps = health.sumToday(HealthMetricStepCount)
```

### Documentation

```nim
## High-level Nim wrapper for Pebble Battery Service API.
##
## Provides battery charge state monitoring and event subscriptions.

proc subscribe*(handler: BatteryStateHandler) {.inline.} =
  ## Subscribe to battery state change events.
  ## Equivalent to C function `battery_state_service_subscribe(handler)`.
  ffi.battery_state_service_subscribe(handler)
```

### Formatting

- 2-space indentation
- Max line length: 100 characters
- Separate sections with `# ===` banners
- Group related procs together

## Platform Differences

| Feature | Aplite | Basalt | Chalk | Diorite | Emery | Flint |
|:---|:---:|:---:|:---:|:---:|:---:|:---:|
| Color | No | Yes | Yes | No | Yes | No |
| Round | No | No | Yes | No | No | No |
| Health | Stub | Real | Real | Real | Real | Real |
| Mic | No | Yes | Yes | Yes | Yes | Yes |
| RAM | 24KB | 64KB | 64KB | 64KB | 128KB | 256KB |

## Debugging Tips

**Emulator crashes:** Kill and restart emulator completely after fixing code. Do not reuse running instance.

**Test failures:** Use `nimble testUnit` for quick iteration, then `nimble testCompile` before committing.

**Import errors:** Examples use `--path:"../../src"` in nim.cfg to find local nebble source.

# Nebble

**Nim wrapper library for Pebble smartwatch development**

Nebble (Nim + Pebble) provides comprehensive, type-safe Nim bindings for the Pebble SDK, enabling you to write Pebble apps in idiomatic Nim while maintaining full access to the C SDK.

## Features

- ✅ **Complete SDK Coverage** - FFI bindings for all 6 Pebble platforms (Aplite, Basalt, Chalk, Diorite, Emery, Flint)
- ✅ **Two-Layer API** - Low-level FFI bindings + high-level idiomatic Nim wrappers
- ✅ **Type Safety** - Nim's type system catches errors at compile time
- ✅ **Zero Overhead** - Direct C interop with no runtime cost
- ✅ **Cross-Platform** - Platform-specific features handled via compile-time checks
- ✅ **Build Tooling** - `nebble` CLI for project scaffolding and building
- ✅ **Comprehensive Tests** - 41 unit tests covering all API modules
- ✅ **Rich Examples** - 10 example apps demonstrating common patterns
- ✅ **Full Documentation** - HTML API docs, migration guide, tutorials

## Quick Start

### Installation

```bash
# Install Nim (>= 2.2.0)
brew install nim

# Install Pebble SDK
# See: https://developer.rebble.io/developer.pebble.com/sdk/install/index.html

# Install Nebble
nimble install nebble
```

### Create Your First App

```bash
# Create a new project
nebble new my_watchface
cd my_watchface

# Build for Pebble
nebble build

# Install on emulator
nebble install --emulator basalt
```

### Hello World Example

```nim
import nebble/ffi as ffi
from nebble/app import eventLoop

var
  window: ptr ffi.Window
  textLayer: ptr ffi.TextLayer

proc windowLoad(win: ptr ffi.Window) {.cdecl.} =
  let bounds = ffi.layer_get_bounds(ffi.window_get_root_layer(win))
  textLayer = ffi.text_layer_create(bounds)
  ffi.text_layer_set_text(textLayer, "Hello, Pebble!")
  ffi.text_layer_set_text_alignment(textLayer, ffi.GTextAlignmentCenter)
  ffi.layer_add_child(
    ffi.window_get_root_layer(win),
    ffi.text_layer_get_layer(textLayer)
  )

proc windowUnload(win: ptr ffi.Window) {.cdecl.} =
  ffi.text_layer_destroy(textLayer)

proc init() {.cdecl.} =
  window = ffi.window_create()
  ffi.window_set_window_handlers(window, ffi.WindowHandlers(
    load: windowLoad,
    unload: windowUnload
  ))
  ffi.window_stack_push(window, true)

proc deinit() {.cdecl.} =
  ffi.window_destroy(window)

proc main() {.exportc, cdecl.} =
  init()
  eventLoop()
  deinit()
```

## Architecture

Nebble uses a **two-layer architecture**:

### Layer 1: Low-Level FFI Bindings (`nebble/ffi`)

- Direct 1:1 mapping of Pebble C SDK (Futhark-generated)
- Preserves C naming conventions (`snake_case`)
- Platform-specific bindings for all 6 platforms
- ~10k lines of generated code per platform

```nim
import nebble/ffi as ffi

let window = ffi.window_create()
ffi.window_stack_push(window, true)
```

### Layer 2: High-Level Idiomatic API (`nebble/*`)

- Nim-friendly wrappers with OOP patterns (31 modules)
- `camelCase` naming conventions
- Type-safe constructors and convenience templates
- Currently under active development

```nim
from nebble/geometry import makeGRect
from nebble/window import create, push

let bounds = makeGRect(0, 0, 144, 168)
let window = create()
window.push(animated = true)
```

Both layers can be mixed in the same application.

## Example Applications

Nebble includes 10 example apps demonstrating common patterns:

| Example | Description | Features Demonstrated |
|---------|-------------|----------------------|
| **hello_world** | Basic app structure | Text layers, click handlers, window lifecycle |
| **simple_clock** | Digital watchface | Tick timer service, time formatting |
| **menu_demo** | Menu interface | Menu layer, sections, item callbacks |
| **animation_demo** | UI animations | Property animations, easing curves |
| **battery_status** | Battery monitoring | Battery service, status bar layer |
| **accelerometer_demo** | Motion sensing | Accelerometer data, tap detection |
| **persist_demo** | Data persistence | Persistent storage (read/write) |
| **vibes_demo** | Haptic feedback | Vibration patterns (short, long, custom) |
| **action_bar_demo** | Action buttons | Action bar with icon buttons |
| **health_demo** | Fitness tracking | Health service (steps, distance) |

Build and run examples:

```bash
cd examples/hello_world
../../cli/bin/nebble build
../../cli/bin/nebble install --emulator basalt
```

## Documentation

### Guides

- **[Getting Started Guide](docs/GETTING_STARTED.md)** - Installation, first app tutorial, common patterns
- **[Migration Guide](MIGRATION.md)** - C SDK to Nebble Nim mapping reference
- **[Roadmap](ROADMAP.md)** - Project status and future plans
- **[Agent Instructions](AGENTS.md)** - Development guidelines and conventions

### API Reference

- **HTML Documentation** - `docs/html/nebble.html` (open in browser)
  - 33 modules with full API documentation
  - Searchable index
  - Dark/light theme support

Generate latest docs:

```bash
nim doc --project --index:on --outdir:docs/html \
  --git.url:https://github.com/zawa-t/nebble \
  --git.commit:main src/nebble.nim
```

## Platform Support

Nebble supports all 6 Pebble hardware platforms:

| Platform | Display | Color | Round | Health | Microphone |
|----------|---------|-------|-------|--------|------------|
| **Aplite** | 144×168 | ❌ | ❌ | Stub | ❌ |
| **Basalt** | 144×168 | ✅ | ❌ | ✅ | ✅ |
| **Chalk** | 180×180 | ✅ | ✅ | ✅ | ✅ |
| **Diorite** | 144×168 | ❌ | ❌ | ✅ | ✅ |
| **Emery** | 200×228 | ✅ | ❌ | ✅ | ✅ |
| **Flint** | 144×168 | ❌ | ❌ | ✅ | ✅ |

Target specific platforms:

```bash
nebble build -d:pebbleAplite   # Black & white, rectangular
nebble build -d:pebbleBasalt   # Color, rectangular [default]
nebble build -d:pebbleChalk    # Color, round
```

Platform-specific code using compile-time checks:

```nim
when declared(GColorClear):  # Color platforms only
  ffi.text_layer_set_background_color(layer, ffi.GColorClear)

when declared(health_service_sum_today):  # Not available on Aplite
  let steps = ffi.health_service_sum_today(ffi.HealthMetricStepCount)
```

## Project Structure

```
nebble/
├── nebble.nimble              # Package metadata
├── src/
│   ├── nebble.nim             # Top-level module (re-exports all)
│   ├── nebble/
│   │   ├── ffi.nim            # Platform selector (includes generated bindings)
│   │   ├── ffi/
│   │   │   ├── generate.nim   # Futhark generator script
│   │   │   ├── macros.nim     # Manual macro replacements
│   │   │   ├── generated/     # Auto-generated FFI bindings (6 platforms)
│   │   │   └── stubs/         # Stub headers for build-generated files
│   │   ├── window.nim         # High-level window API
│   │   ├── layer.nim          # High-level layer API
│   │   ├── geometry.nim       # Geometry types and constructors
│   │   └── ...                # 28 more high-level modules
├── cli/                       # nebble CLI build tool
├── tests/                     # Test suite (41 tests)
├── examples/                  # Example apps (10 apps)
├── docs/
│   ├── html/                  # Generated API documentation
│   └── GETTING_STARTED.md     # Tutorial guide
├── MIGRATION.md               # C to Nim migration guide
├── ROADMAP.md                 # Project roadmap
└── AGENTS.md                  # Development guidelines
```

## Build System

### Build Tooling

The `nebble` CLI tool manages the build process:

1. **Nim Compilation** - Compiles `.nim` to C (`nim c --compileOnly`)
2. **File Organization** - Copies generated C files into Pebble project structure
3. **Pebble Build** - Runs `pebble build` (Waf + ARM GCC) to create `.pbw`

```bash
nebble build                    # Build for default platform (Basalt)
nebble build -d:pebbleAplite   # Build for specific platform
nebble install --emulator chalk # Install on emulator
nebble clean                    # Clean build artifacts
```

### Cross-Compilation Flags

All Pebble builds use these Nim flags (configured in `nim.cfg`):

```
--os:any          # Bare-metal target (no OS)
--cpu:arm         # ARM Cortex-M architecture
--mm:arc          # ARC memory management
-d:useMalloc      # Use C malloc (Pebble SDK manages heap)
--noMain          # No Nim main (we provide main)
--compileOnly     # Generate C only (Pebble SDK links)
-d:danger         # Maximum optimization
--threads:off     # No threading support
```

## Testing

Run the complete test suite:

```bash
nimble test
```

This runs:
- ✅ **41 unit tests** - API module tests
- ✅ **Compile tests** - Cross-compilation verification for all platforms
- ✅ **Example builds** - All 10 examples build successfully
- ✅ **Size gates** - FFI binding size limits (<150 KB per platform)

Individual test suites:

```bash
nim c -r tests/test_geometry.nim       # Single module test
nim c tests/test_ffi.nim                # FFI compile test
cd examples/hello_world && nebble build # Example build test
```

## Development

### Regenerating FFI Bindings

**Note:** End users do not need to regenerate bindings. Generated files are committed to the repository.

To regenerate (requires Futhark >= 0.15.0 and libclang):

```bash
# Single platform
nim r -d:futharkRebuild -d:opirRebuild -d:platform=basalt src/nebble/ffi/generate.nim

# All platforms
for p in aplite basalt chalk diorite emery flint; do
  nim r -d:futharkRebuild -d:opirRebuild -d:platform=$p src/nebble/ffi/generate.nim
done
```

After regeneration, remove `from os import parentDir` from each generated file (breaks `--os:any`).

### Code Style

See [AGENTS.md](AGENTS.md) for complete style guide. Key conventions:

- **FFI layer**: C `snake_case` preserved exactly
- **High-level API**: Nim `camelCase`
- **Constructors**: `make` prefix (e.g., `makeGRect`)
- **Callbacks**: Must have `{.cdecl.}` pragma
- **Exports**: Use `*` marker for public symbols

### Contributing

Contributions welcome! Please:

1. Read [AGENTS.md](AGENTS.md) for conventions
2. Add tests for new features
3. Update documentation
4. Ensure all tests pass (`nimble test`)

## Roadmap

### Current Status: ~90% Complete

- ✅ **Phase 0** - Feasibility (complete)
- ✅ **Phase 1** - FFI bindings for all 6 platforms (complete)
- ✅ **Phase 2** - High-level idiomatic API (31 modules, complete)
- ✅ **Phase 3** - Build tooling (nebble CLI, complete)
- ✅ **Phase 4** - Testing & quality (41 tests, complete)
- ✅ **Phase 5** - Documentation & examples (10 examples, complete)
- 🟡 **Phase 6** - Advanced features (planned)

See [ROADMAP.md](ROADMAP.md) for detailed status.

## Requirements

- **Nim** >= 2.2.0
- **Pebble SDK** v4.x (v4.9.77 tested)
- **Futhark** >= 0.15.0 (only for regenerating FFI bindings)

## License

MIT License - See LICENSE file

## Acknowledgments

- **Pebble Technology** - Original Pebble SDK
- **Rebble Alliance** - Keeping Pebble alive
- **Futhark** - FFI binding generator
- **Nim Community** - Language and ecosystem

## Resources

### Pebble Development

- **Rebble Developer Portal** - https://developer.rebble.io
- **Pebble SDK Docs** - https://developer.rebble.io/developer.pebble.com/docs/c/
- **Rebble Services** - https://rebble.io (app store, weather, voice)
- **/r/pebble** - https://reddit.com/r/pebble

### Nim Language

- **Nim Website** - https://nim-lang.org
- **Nim Manual** - https://nim-lang.org/docs/manual.html
- **Nim Forum** - https://forum.nim-lang.org

### Nebble

- **GitHub** - https://github.com/zawa-t/nebble
- **Issues** - https://github.com/zawa-t/nebble/issues
- **Discussions** - https://github.com/zawa-t/nebble/discussions

---

**Built with ❤️ for the Pebble community**

*Nebble is not affiliated with Pebble Technology Corp. Pebble is a registered trademark.*

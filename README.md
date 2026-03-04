# Nebble

**Nim wrapper library for Pebble smartwatch development**

[![CI](https://github.com/Brokezawa/nebble/actions/workflows/ci.yml/badge.svg)](https://github.com/Brokezawa/nebble/actions/workflows/ci.yml)
[![Docs](https://github.com/Brokezawa/nebble/actions/workflows/docs.yml/badge.svg)](https://brokezawa.github.io/nebble/)
[![Version](https://img.shields.io/badge/version-1.1.0-blue)](https://github.com/Brokezawa/nebble/releases/tag/v1.1.0) 
[![Nim](https://img.shields.io/badge/nim-2.0%2B-orange)](https://nim-lang.org/) 
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE) 

Nebble (Nim + Pebble) provides comprehensive, type-safe Nim bindings for the Pebble SDK, enabling you to write Pebble apps in idiomatic Nim with automatic memory management and modern language features.

## Why Nebble?

- **Automatic Memory Management** - Managed types (Handles) use ARC to handle resource cleanup automatically.
- **Type Safety** - Nim's type system catches errors at compile time that C would miss.
- **Zero Overhead** - Compiles to efficient C code with zero runtime cost.
- **Modern Syntax** - Clean, expressive code with property-style accessors and OOP patterns.
- **Complete Coverage** - Full FFI bindings for all 7 Pebble platforms.
- **Nim Everywhere** - Use Nim on watch and on phone.

## Quick Start

### 1. Installation

```bash
# Install Nim (>= 2.2.0) using choosenim
curl https://nim-lang.org/choosenim/init.sh -sSf | sh

# Install Pebble SDK (standard installation)
# Install Nebble
nimble install nebble
```

### 2. Create Your First App

```bash
# Create a new project
nebble new my_app
cd my_app

# Build and Run
nebble build
nebble install --emulator basalt
```

### 3. Declarative DSL Example

```nim
import nebble

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  vibes.shortPulse()

nebbleApp:
  textLayer:
    id = messageLayer
    fullWidth = true
    y = center
    h = 40
    text = "Hello Nim!"
    alignment = GTextAlignmentCenter
    
  clicks:
    BUTTON_ID_SELECT = selectClickHandler
```

## Managed API Quick Reference

Managed types (Handles) are the recommended way to use Nebble. They automatically manage transitions between handle-owned and SDK-owned memory.

| Feature | Managed Type | Creation |
|---------|--------------|----------|
| **Window** | `WindowHandle` | `newWindow()` |
| **Text Layer** | `TextLayerHandle` | `newTextLayer(frame)` |
| **Bitmap Layer** | `BitmapLayerHandle` | `newBitmapLayer(frame)` |
| **Animation** | `AnimationHandle` | `newAnimationHandle()` |
| **Layer** | `LayerHandle` | `newLayer(frame)` |

### Common Operations (Managed)
- `win.push(animated = true)` - Push window to stack.
- `win.pop()` - Pop window from stack.
- `parent.addChild(child)` - Add child layer to parent (handles ownership automatically).
- `textLayer.text = "Hello"` - Set text content.
- `textLayer.text = countStr` - Set text using a heap-free `FixedString`.

## Documentation

 Official docs (GitHub Pages): https://brokezawa.github.io/nebble

- **[Getting Started](docs/GETTING_STARTED.md)** - Comprehensive setup and first app guide.
- **[Examples](docs/EXAMPLES.md)** - Overview of included example projects.
- **[Quick Reference](docs/QUICK_REFERENCE.md)** - Fast look at common APIs.
- **[CLI Reference](docs/CLI.md)** - Build tool commands and usage.
- **[Declarative DSL](docs/DECLARATIVE_DSL.md)** - Guide to building UIs with `nebbleApp`.
- **[Full-Stack Guide](docs/NIM_PKJS.md)** - Writing phone-side logic in Nim.
- **[Nim Features](docs/NIM_FEATURES.md)** - Overview of Nim features used in Nebble.
- **[Migration Guide](docs/MIGRATION.md)** - Translation reference for C developers.
- **[Zero-Heap Performance](docs/HEAP_FREE.md)** - How Nebble avoids RAM fragmentation.
- **[Architecture](docs/ARCHITECTURE.md)** - Details on managed types and the build pipeline.
- **[Testing](docs/TESTING.md)** - Guide to running Nebble's test suite.
- **[Roadmap](docs/ROADMAP.md)** - Project status and future plans.
- **[Contributing](docs/CONTRIBUTING.md)** - Guide for contributing to Nebble.

## Examples

Nebble includes two sets of examples to help you get started:

### Ported Examples (C SDK Parity)

Official Pebble SDK examples ported to Nim. These demonstrate how Nebble's high-level API translates C Pebble code:

```bash
git clone https://github.com/Brokezawa/ported-examples
cd ported-examples/simple_analog
nebble build && nebble install --emulator basalt
```

**Features demonstrated:**
- `simple_analog`: GPath, custom drawing, trigonometry (watchface)
- `ks_clock_face`: Custom animations, unobstructed area, round display
- `classio_battery_connection`: Battery/Bluetooth events, FixedString formatting
- `feature_persist_counter`: Persistent storage, ActionBar, click handling
- `feature_accel_discs`: Accelerometer physics, collision detection
- And 5 more...

See [ported-examples repository](https://github.com/Brokezawa/ported-examples) for the full list.

### Nebble Native Examples

Nebble-idiomatic examples demonstrating features unique to Nim development:

```bash
git clone https://github.com/Brokezawa/nebble-examples
cd nebble-examples/hello_world
nebble build && nebble install --emulator basalt
```

**Features demonstrated:**
- `hello_world`: Minimal declarative app
- `animation_demo`: Property animations, event-driven sequences
- `comms_demo`: Full-stack Nim with phone-side logic (PKJS)
- `health_watchface`: Health service integration
- And 3 more...

See [nebble-examples repository](https://github.com/Brokezawa/nebble-examples) for the full list.

## Special Thanks

*   **[PMunch](https://github.com/PMunch)** and the **[Futhark](https://github.com/PMunch/futhark)** contributors for the fantastic tool that powers our FFI binding generation.
*   The **[Rebble Alliance](https://rebble.io/)** and the original **Pebble** team for their enduring hardware, SDK, and documentation that made this project possible.

---

**Built for the Pebble community**

# Nebble

[![CI](https://github.com/Brokezawa/nebble/actions/workflows/ci.yml/badge.svg)](https://github.com/Brokezawa/nebble/actions/workflows/ci.yml)

**Nim wrapper library for Pebble smartwatch development**

Nebble (Nim + Pebble) provides comprehensive, type-safe Nim bindings for the Pebble SDK, enabling you to write Pebble apps in idiomatic Nim with automatic memory management and modern language features.

## Why Nebble?

- **Automatic Memory Management** - Managed types (Handles) use ARC to handle resource cleanup automatically.
- **Type Safety** - Nim's type system catches errors at compile time that C would miss.
- **Zero Overhead** - Compiles to efficient C code with zero runtime cost.
- **Modern Syntax** - Clean, expressive code with property-style accessors and OOP patterns.
- **Complete Coverage** - Full FFI bindings for all 6 Pebble platforms.

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

- **[Architecture](docs/ARCHITECTURE.md)** - Details on managed types and the build pipeline.
- **[Contributing](docs/CONTRIBUTING.md)** - Guide for contributing to Nebble.
- **[Declarative DSL](docs/DECLARATIVE_DSL.md)** - Guide to building UIs with `nebbleApp`.
- **[Examples](docs/EXAMPLES.md)** - Overview of included example projects.
- **[Getting Started](docs/GETTING_STARTED.md)** - Comprehensive setup and first app guide.
- **[Zero-Heap Performance](docs/HEAP_FREE.md)** - How Nebble avoids RAM fragmentation.
- **[Migration Guide](docs/MIGRATION.md)** - Translation reference for C developers.
- **[Nim Features](docs/NIM_FEATURES.md)** - Overview of Nim features used in Nebble.
- **[Full-Stack Guide](docs/NIM_PKJS.md)** - Writing phone-side logic in Nim.
- **[Quick Reference](docs/QUICK_REFERENCE.md)** - Fast look at common APIs.
- **[Roadmap](docs/ROADMAP.md)** - Project status and future plans.
- **[Testing](docs/TESTING.md)** - Guide to running Nebble's test suite.
- **[CLI Reference](cli/README.md)** - Build tool commands and usage.

## Examples

Check the `examples/` directory for complete working apps:
- `hello_world`: Basic structure and responsive layout.
- `accelerometer_demo`: Real-time data with heap-free formatting.
- `persist_demo`: Using the idiomatic storage API.
- `animation_demo`: Property animations and sequences.

## Special Thanks

*   **[PMunch](https://github.com/PMunch)** and the **[Futhark](https://github.com/PMunch/futhark)** contributors for the fantastic tool that powers our FFI binding generation.
*   The **[Rebble Alliance](https://rebble.io/)** and the original **Pebble** team for their enduring hardware, SDK, and documentation that made this project possible.

---

**Built for the Pebble community**

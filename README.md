# Nebble

[![CI](https://github.com/zawa-t/nebble/actions/workflows/ci.yml/badge.svg)](https://github.com/zawa-t/nebble/actions/workflows/ci.yml)

**Nim wrapper library for Pebble smartwatch development**

Nebble (Nim + Pebble) provides comprehensive, type-safe Nim bindings for the Pebble SDK, enabling you to write Pebble apps in idiomatic Nim with automatic memory management and modern language features.

## Why Nebble?

- ✅ **Automatic Memory Management** - Managed types (Handles) use ARC to handle resource cleanup automatically.
- ✅ **Type Safety** - Nim's type system catches errors at compile time that C would miss.
- ✅ **Zero Overhead** - Compiles to efficient C code with zero runtime cost.
- ✅ **Modern Syntax** - Clean, expressive code with property-style accessors and OOP patterns.
- ✅ **Complete Coverage** - Full FFI bindings for all 6 Pebble platforms.

## Quick Start

### 1. Installation

```bash
# Install Nim (>= 2.2.0)
brew install nim

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

### 3. Basic "Managed" Example

```nim
import nebble
import nebble/ui/window_managed
import nebble/ui/text_layer_managed

var 
  mainWindow: WindowHandle
  messageLayer: TextLayerHandle

proc windowLoad(win: ptr Window) {.cdecl.} =
  let bounds = win.rootLayer.bounds
  messageLayer = newTextLayerHandle(makeGRect(0, 60, bounds.size.w, 40))
  messageLayer.text = "Hello Nim!"
  messageLayer.textAlignment = GTextAlignmentCenter
  win.rootLayer.addChild(messageLayer.getLayer())

pebbleApp(load = windowLoad)
```

## Managed API Quick Reference

Managed types (Handles) are the recommended way to use Nebble. They automatically call `_destroy` functions when they go out of scope.

| Feature | Managed Type | Creation |
|---------|--------------|----------|
| **Window** | `WindowHandle` | `newWindowHandle()` |
| **Text Layer** | `TextLayerHandle` | `newTextLayerHandle(frame)` |
| **Bitmap Layer** | `BitmapLayerHandle` | `newBitmapLayerHandle(frame)` |
| **Animation** | `AnimationHandle` | `newAnimationHandle()` |
| **Layer** | `LayerHandle` | `newLayerHandle(frame)` |

### Common Operations (Managed)
- `win.push(animated = true)` - Push window to stack.
- `win.pop()` - Pop window from stack.
- `layer.addChild(childLayer)` - Add managed child to managed parent (parent takes ownership).
- `textLayer.text = "Hello"` - Set text content.
- `textLayer.staticText(buffer, "Dynamic: " & $val)` - Safely set dynamic text using a persistent buffer.

## Documentation

- **[Pebble C to Nim Migration Guide](docs/MIGRATION.md)** - Translation reference for C developers.
- **[Nim Features for Pebble](docs/NIM_FEATURES.md)** - Why Nim is great for embedded development.
- **[Roadmap](docs/ROADMAP.md)** - Current status and upcoming features.
- **[CLI Reference](cli/README.md)** - Build tool commands and usage.
- **[API Reference](docs/html/nebble.html)** - Full module documentation.

## Examples

Check the `examples/` directory for complete working apps:
- `hello_world`: Basic structure and click handlers.
- `simple_clock`: Digital watchface with tick timer.
- `managed_demo`: Comprehensive use of managed types.
- `offscreen_render`: Advanced graphics manipulation.

---

**Built with ❤️ for the Pebble community**

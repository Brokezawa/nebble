# Nebble Examples

Nebble includes a comprehensive set of example applications demonstrating various features of the Pebble SDK using idiomatic Nim. All examples use ARC-managed types for memory safety.

## Core Concepts

| Example | Description | Key Features |
|---------|-------------|--------------|
| **[hello_world](../examples/hello_world)** | The "Hello World" of Nebble | `nebbleWatchface` macro, `TextLayer`, click handlers |
| **[dsl_watchface](../examples/dsl_watchface)** | Modern Declarative Watchface | Full `nebbleWatchface` DSL, `TickTimer`, layers |
| **[simple_clock](../examples/simple_clock)** | Digital watchface | `TickTimer` service, time formatting, custom fonts |
| **[window_stack_demo](../examples/window_stack_demo)** | Window lifecycle | `WindowHandle`, stack push/pop, multiple windows |
| **[managed_demo](../examples/managed_demo)** | Managed types showcase | ARC lifecycle, automatic cleanup |

## User Interface

| Example | Description | Key Features |
|---------|-------------|--------------|
| **[menu_demo](../examples/menu_demo)** | Standard menu | `MenuLayer`, sections, callbacks |
| **[simple_menu](../examples/simple_menu)** | Simplified menu | `MenuLayerCallbacks`, helper drawing procs |
| **[action_bar_demo](../examples/action_bar_demo)** | Side action bar | `ActionBarLayer`, icons, click config |
| **[scroll_demo](../examples/scroll_demo)** | Scrolling content | `ScrollLayer`, content size, paging |
| **[hierarchy_demo](../examples/hierarchy_demo)** | Layer hierarchy | Parent/child relationships, relative frames |

## Graphics & Animation

| Example | Description | Key Features |
|---------|-------------|--------------|
| **[animation_demo](../examples/animation_demo)** | UI Animation | `PropertyAnimation`, curves, sequences |
| **[graphics_demo](../examples/graphics_demo)** | Custom drawing | `LayerUpdateProc`, `GPath`, primitives |
| **[offscreen_render](../examples/offscreen_render)** | Advanced graphics | `GBitmap` manipulation, pixel access, framebuffer |
| **[shared_resources_demo](../examples/shared_resources_demo)** | Resource management | `GBitmapRef`, `GFontRef`, sub-bitmaps |

## System Services

| Example | Description | Key Features |
|---------|-------------|--------------|
| **[accelerometer_demo](../examples/accelerometer_demo)** | Motion sensing | `Accel` service, tap detection, data sampling |
| **[battery_status](../examples/battery_status)** | Power management | `Battery` service, state tracking |
| **[vibes_demo](../examples/vibes_demo)** | Haptics | `Vibes`, custom vibration patterns |
| **[persist_demo](../examples/persist_demo)** | Data storage | `Storage` (Persistent), read/write integers/strings |
| **[health_demo](../examples/health_demo)** | Health tracking | `Health` service, steps, distance |
| **[health_history](../examples/health_history)** | Health history | Minute-by-minute history access |

## Running Examples

To build and install an example:

```bash
cd examples/hello_world
nebble build
nebble install --emulator basalt
```

## Creating Your Own

Use the `nebble` CLI to scaffold a new project based on these patterns:

```bash
nebble new my_app
```

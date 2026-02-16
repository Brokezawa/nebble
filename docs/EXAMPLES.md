# Nebble Examples

Nebble includes a comprehensive set of example applications demonstrating various features of the Pebble SDK using idiomatic Nim. All examples use ARC-managed types for memory safety and the declarative DSL.

## Core Examples

| Example | Description | Key Features |
|---------|-------------|--------------|
| **[hello_world](../examples/hello_world)** | The fundamental example | `nebbleApp` macro, `TextLayer`, responsive layout |
| **[accelerometer_demo](../examples/accelerometer_demo)** | Motion sensing | `Accel` service, heap-free formatting with `FixedString` |
| **[animation_demo](../examples/animation_demo)** | UI Animation | `PropertyAnimation`, sequences, state tracking |
| **[battery_status](../examples/battery_status)** | Power management | `Battery` service, status bar integration |
| **[comms_demo](../examples/comms_demo)** | Communication | `AppMessage`, Bluetooth connection, Compass service |
| **[glance_menu_demo](../examples/glance_menu_demo)** | App Glance & Menus | `AppGlance` API, dynamic `MenuLayer` callbacks |
| **[graphics_demo](../examples/graphics_demo)** | Custom drawing | `GContext`, `GPath`, drawing primitives |
| **[health_watchface](../examples/health_watchface)** | Health tracking | `Health` service, background data access |
| **[menu_demo](../examples/menu_demo)** | Standard menus | `SimpleMenuLayer`, sections, selection handling |
| **[persist_demo](../examples/persist_demo)** | Data storage | `Storage` API, persistent settings |
| **[vibes_demo](../examples/vibes_demo)** | Haptics | `Vibes` API, vibration patterns |

## Running Examples

To build and run an example in the emulator:

1.  Navigate to the example directory:
    ```bash
    cd examples/hello_world
    ```
2.  Build for all platforms:
    ```bash
    nebble build
    ```
3.  Install to the emulator:
    ```bash
    nebble install --emulator basalt
    ```

## Learning from Examples

- **Responsive Layout**: Look at `hello_world` or `accelerometer_demo` to see how to use `fullWidth = true` and `y = center` to support different screen shapes.
- **Memory Management**: See `animation_demo` or `glance_menu_demo` for examples of how Managed Handles automatically clean up resources.
- **Heap-Free String Formatting**: Check `accelerometer_demo` for the `FixedString` pattern.

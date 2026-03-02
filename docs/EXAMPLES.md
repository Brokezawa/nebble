# Nebble Examples

Nebble provides two complementary sets of examples:

## Ported Examples (Pebble SDK Examples in Nim)

Official Pebble SDK examples ported to demonstrate how Nebble's high-level API maps to C code. Perfect for developers migrating from C or wanting C-SDK parity.

**Repository:** [ported-examples](https://github.com/Brokezawa/ported-examples)

| Example | Type | Key Features |
|---------|------|--------------|
| **simple_analog** | Watchface | GPath, custom drawing, trigonometry, responsive layout |
| **ks_clock_face** | Watchface | Custom AnimationImplementation, UnobstructedArea (Quick View), animations |
| **classio_battery_connection** | Watchface | Battery events, Bluetooth status, FixedString formatting |
| **time_dots** | Watchface | Radial graphics, custom layer drawing, platform-adaptive colors |
| **feature_persist_counter** | App | Persistent storage, ActionBarLayer, click handling |
| **feature_accel_discs** | App | Accelerometer physics, collision detection, round display support |
| **feature_custom_font** | App | Custom fonts (GFontRef), resource loading, ARC-managed handles |
| **feature_image_transparent** | App | GBitmap, BitmapLayer, compositing modes, transparency |
| **pdc_image** | App | PDC vector graphics, GDrawCommandImage, resource centering |
| **content_indicator_demo** | App | ScrollLayer, ContentIndicator configuration, managed handles |

## Nebble Native Examples

Examples written in idiomatic Nim, demonstrating Nebble-specific features and patterns not present in C Pebble development.

**Repository:** [nebble-examples](https://github.com/Brokezawa/nebble-examples)

| Example | Type | Key Features |
|---------|------|--------------|
| **hello_world** | App | Declarative `nebbleApp` DSL, text layers, click handlers |
| **animation_demo** | App | PropertyAnimation, event-driven sequences, animation handlers |
| **comms_demo** | App | Full-stack Nim with phone-side PKJS logic, typed AppMessage |
| **health_watchface** | Watchface | Health service integration, activity metrics, background data |
| **glance_menu_demo** | App | AppGlance API, dynamic menu callbacks, timeline integration |
| **menu_demo** | App | SimpleMenuLayer, sections, selection handling, item callbacks |
| **vibes_demo** | App | Vibes API, vibration patterns, haptic feedback |

## Running Examples

To build and run an example:

1.  Clone the examples repository:
    ```bash
    git clone https://github.com/Brokezawa/ported-examples    # For C SDK parity
    git clone https://github.com/Brokezawa/nebble-examples     # For Nebble native
    ```

2.  Navigate to the example directory:
    ```bash
    cd ported-examples/simple_analog  # or nebble-examples/hello_world
    ```

3.  Build for all platforms:
    ```bash
    nebble build
    ```

4.  Install to the emulator:
    ```bash
    nebble install --emulator basalt
    ```

## Learning from Examples

- **Responsive Layout**: Look at `hello_world` (nebble-examples) or `simple_analog` (ported-examples) to see how to use `fullWidth = true` and `y = center` to support different screen shapes.
- **Memory Management**: See `animation_demo` or any example using managed handles for how ARC automatically cleans up resources.
- **Heap-Free String Formatting**: Check `classio_battery_connection` for the `FixedString` pattern.
- **Custom Drawing**: Study `pdc_image`, `simple_analog`, or `time_dots` for GContext, GPath, and drawing primitives.
- **Full-Stack Development**: See `comms_demo` for writing Pebble phone-side logic in Nim.

# Declarative DSL (nebbleApp)

Nebble provides a powerful, macro-based Domain Specific Language (DSL) called `nebbleApp` (or its alias `nebbleWatchface`). This DSL eliminates repetitive Pebble boilerplate and enables a more modern, reactive-style UI definition.

## Core Concepts

The DSL transforms a declarative block into optimized C code that handles:
1. **Global Variable Management**: Automatically declares managed handles for every UI component.
2. **Lifecycle Synchronization**: Ensures the window is pushed *before* your initialization code runs.
3. **Automatic Cleanup**: Resets all handles to `default` in the window's `unload` callback.
4. **Responsive Layout**: Calculates coordinates at runtime based on the parent's actual bounds.

## Basic Usage

```nim
import nebble

nebbleApp:
  window:
    backgroundColor = GColorBlack

  textLayer:
    id = timeLabel
    fullWidth = true
    y = center
    h = 30
    text = "12:00"
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_28_BOLD

  init:
    logInfo("App started!")
```

## Supported Components

The DSL supports all major Pebble layers:
- `textLayer`: Standard text display.
- `bitmapLayer`: Static image display.
- `statusBarLayer`: System status bar.
- `actionBarLayer`: Side-bar for icons/actions.
- `menuLayer` / `simpleMenuLayer`: Vertical lists.
- `scrollLayer`: Scrollable containers.
- `rotBitmapLayer`: Rotated images.
- `layer`: Generic drawing layer.

### Action Bar Icons

The `actionBarLayer` DSL block automatically manages action bar icons as reference-counted bitmaps. Icons are created from resource IDs and their lifetime is automatically managed by the DSL.

**Example:**
```nim
nebbleApp:
  actionBarLayer:
    id = actionBar
    backgroundColor = GColorWhite
    icons:
      up = RESOURCE_ID_IMAGE_UP
      down = RESOURCE_ID_IMAGE_DOWN
      select = RESOURCE_ID_IMAGE_SELECT
```

The DSL creates internal `GBitmapRef` variables for each icon and manages their lifecycle, ensuring proper cleanup when the app exits. This eliminates memory leaks from unmanaged bitmap creation.

## Layout Properties

The DSL introduces high-level layout properties that make cross-platform development (Chalk, Emery, Basalt) significantly easier:

| Property | Description |
| :--- | :--- |
| `fullWidth = true` | Sets width to 100% of the parent (usually the window). |
| `fullHeight = true` | Sets height to 100% of the parent. |
| `fullScreen = true` | Sets both width and height to 100% of the parent. |
| `x = center` | Horizontally centers the layer relative to its parent. |
| `y = center` | Vertically centers the layer relative to its parent. |
| `parent = handle` | Attaches this layer to another layer instead of the root window. |

## Event Handling

### Clicks
Register click handlers directly within the DSL block:

```nim
proc selectHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  vibes.shortPulse()

nebbleApp:
  # ... layers ...
  clicks:
    BUTTON_ID_SELECT = selectHandler
```

### Tick Timer
Subscribe to time updates:

```nim
proc onTick(tickTime: ptr tm, units: TimeUnits) {.cdecl.} =
  # Update UI
  discard

nebbleApp:
  # ... layers ...
  tickTimer:
    handler = onTick
    unit = TimeUnitsMinute
```

## Lifecycle Blocks

- `init`: Runs once after the window is pushed and layers are created. Use this for service subscriptions.
- `deinit`: Runs once when the app is closing. Use this for unsubscribing or saving data.

## Why use the DSL?

Standard Pebble C apps require careful ordering of `window_create`, `layer_add_child`, and `window_stack_push`. A mistake in this order often leads to `nil` pointer dereferences. The `nebbleApp` macro enforces the correct order and ensures every resource is safely tracked by Nim's ARC.

# Pebble C to Nebble Nim Migration Guide

This guide helps you translate common Pebble C SDK patterns into idiomatic Nebble Nim code.

## Table of Contents

- [Managed Types (Handles)](#managed-types-handles)
- [Declarative UI (DSL)](#declarative-ui-dsl)
- [Module Structure](#module-structure)
- [Window Lifecycle](#window-lifecycle)
- [Layer Hierarchy](#layer-hierarchy)
- [Text Rendering](#text-rendering)
- [Click Handlers](#click-handlers)
- [Animations](#animations)
- [Services](#services)
- [Persistent Storage](#persistent-storage)
- [App Messaging](#app-messaging)

---

## Managed Types (Handles)

Nebble uses **Managed Types** (handles) which leverage Nim's ARC memory management to automatically handle resource cleanup. These are your default choice for building safe apps.

| Manual C API Type | Managed Nim Handle | Creation | Destruction |
|-------------------|--------------------|----------|-------------|
| `Window*` | `WindowHandle` | `newWindow()` | Automatic (Stack-Aware) |
| `TextLayer*` | `TextLayerHandle` | `newTextLayer()` | Automatic (Hierarchy-Aware) |
| `BitmapLayer*` | `BitmapLayerHandle` | `newBitmapLayer()` | Automatic (Hierarchy-Aware) |
| `ActionBarLayer*` | `ActionBarLayerHandle` | `newActionBarLayer()` | Automatic (Stack-Aware) |
| `MenuLayer*` | `MenuLayerHandle` | `newMenuLayer()` | Automatic (Hierarchy-Aware) |
| `ScrollLayer*` | `ScrollLayerHandle` | `newScrollLayer()` | Automatic (Hierarchy-Aware) |
| `GPath*` | `GPathHandle` | `newGPath()` | Automatic |

### Benefits of Managed Types
1. **ARC RAII Semantics**: Resources are freed when the handle goes out of scope or is reassigned.
2. **Enum-Based Ownership**: Handles track whether they are `hoOwned` (Nim destroys), `hoParented` (SDK destroys), or `hoUnowned` (transient).
3. **Double-Free Prevention**: Adding a layer to a parent automatically transitions the handle to `hoParented` status.
4. **Stack Safety**: `WindowHandle` tracks its state on the window stack and avoids destruction if it's currently `rsActive`.

---

## Declarative UI (DSL)

The most idiomatic way to build Nebble apps is using the `nebbleWatchface` macro. It eliminates almost all boilerplate by generating the window, layers, and lifecycle automatically.

**Nim (Modern DSL):**
```nim
import nebble

proc selectHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  vibes.shortPulse()

nebbleWatchface:
  window:
    backgroundColor = GColorBlack

  textLayer:
    id = myLabel
    frame = (0, 60, 144, 40)
    text = "Hello Nim!"
    alignment = GTextAlignmentCenter
    
  clicks:
    BUTTON_ID_SELECT = selectHandler
```

---

## Module Structure

Nebble's high-level API is organized to match the Pebble SDK structure. All high-level modules are re-exported by the top-level `import nebble`.

```
nebble/
├── foundation/          # Core SDK Foundation APIs
│   ├── app.nim         # App lifecycle, pebbleApp macro
│   ├── time.nim        # Wall time functions
│   └── events/         # Event Services (accel, battery, health...)
├── ui/                  # User Interface (window, layers, animation)
├── graphics/            # Drawing, fonts, paths
└── comms/               # Messaging and Sync
```

---

## Window Lifecycle

### Creating and Showing a Window (Without DSL)

If you aren't using the DSL, use `WindowHandle`:

**C (Manual):**
```c
static Window *window;
window = window_create();
window_stack_push(window, true);
// Must destroy in window_unload or deinit
```

**Nim (Managed):**
```nim
import nebble/ui/window

var window: WindowHandle 
window = newWindow()
window.push(animated = true)
# No destroy() needed! ARC handles it.
```

---

## Layer Hierarchy

### Adding Child Layers

**C:**
```c
layer_add_child(root_layer, text_layer_get_layer(text_layer));
```

**Nim (Modern):**
```nim
# Hierarchy operations are generic and handle ownership automatically.
# Works with any managed handle (TextLayer, BitmapLayer, etc.)
parent.addChild(child)
```

---

## Text Rendering

### Dynamic Text (Safe Pattern)

**C:**
```c
static char buffer[32];
snprintf(buffer, sizeof(buffer), "Count: %d", counter);
text_layer_set_text(text_layer, buffer);
```

**Nim (Modern):**
```nim
var displayStr: FixedString[32]
displayStr.f("Count: ", counter)
textLayer.text = displayStr
```

---

## Click Handlers

**DSL Style (Recommended):**
```nim
nebbleWatchface:
  clicks:
    BUTTON_ID_SELECT = myHandler
```

**Manual Style:**
```nim
import nebble/ui/clicks
onClick(BUTTON_ID_SELECT, selectHandler)
```

**Note:** All callback procs must have the `{.cdecl.}` pragma!

---

## Tips and Gotchas

1. **All callbacks must be `{.cdecl.}`** - This is required for C interop.
2. **No Nim closures at FFI boundary** - The Pebble SDK doesn't support environment pointers.
3. **Use constants from `nebble`** - Avoid `import nebble/ffi` unless you need low-level access.
4. **Binary Size** - Pebble Aplite has a 24KB limit. Use `--mm:arc` and `-d:danger` for production.

---

## Need Help?

- **API Documentation:** See `docs/html/nebble.html` for full API reference.
- **Examples:** Browse `examples/` for updated code using the DSL and managed handles.

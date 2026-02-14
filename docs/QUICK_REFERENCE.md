# Nebble API Quick Reference

This guide provides a quick look at the most commonly used high-level APIs in Nebble.

## 1. Declarative UI (`nebbleApp` DSL)

The recommended way to build Pebble apps. It handles window creation, layer management, and event subscription automatically.

```nim
import nebble

# Handlers
proc selectHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  vibes.shortPulse()

# App Definition
nebbleApp:
  window:
    backgroundColor = GColorBlack

  textLayer:
    id = myLabel
    fullWidth = true
    y = center
    h = 40
    text = "Hello Nim!"
    alignment = GTextAlignmentCenter
    
  clicks:
    BUTTON_ID_SELECT = selectHandler
```

### DSL Keywords
- `window`: Configure global window properties.
- `textLayer`: Define a text display area.
- `bitmapLayer`: Define an image display area.
- `statusBarLayer`: Add the system status bar.
- `actionBarLayer`: Add a side action bar.
- `scrollLayer`: Create a scrollable container.
- `tickTimer`: Configure the time service.
- `clicks`: Map buttons to handler procs.
- `init` / `deinit`: Custom setup/cleanup blocks.

---

## 2. Managed Handles (Manual)

If you need manual control, use **Managed Handles** which use ARC for memory safety. They automatically manage transitions between handle-owned and SDK-owned memory.

| Handle Type | Creation | Get Underlying Layer |
|-------------|----------|-----------------------|
| `WindowHandle` | `newWindow()` | `h.rootLayer()` |
| `TextLayerHandle` | `newTextLayer(frame)` | `h.getLayer()` |
| `BitmapLayerHandle` | `newBitmapLayer(frame)` | `h.getLayer()` |
| `ActionBarLayerHandle` | `newActionBarLayer()` | `h.getLayer()` |
| `MenuLayerHandle` | `newMenuLayer(frame)` | `h.getLayer()` |
| `ScrollLayerHandle` | `newScrollLayer(frame)` | `h.getLayer()` |
| `GPathHandle` | `newGPath(points)` | N/A (Drawing) |

---

## 3. Persistent Storage (`nebble/foundation/storage`)

```nim
const KEY_SCORE = 1
storage.writeInt(KEY_SCORE, 42)
let score = storage.readInt(KEY_SCORE)
```

---

## 4. Graphics and Colors (`nebble/graphics/graphics`)

- `GColorBlack`, `GColorWhite`, `GColorClear`, `GColorRed`, etc.
- `ctx.strokeColor = color`, `ctx.fillColor = color`
- `ctx.drawLine(p0, p1)`, `ctx.drawRect(rect)`, `ctx.fillRect(rect)`

---

## 5. Event Services

### Tick Timer
```nim
subscribe(MINUTE_UNIT, handleTick)
```

### Battery
```nim
let state = battery.state()
let percent = battery.chargePercent()
```

---

## 6. Important Pragma

All callbacks (clicks, timers, etc.) **MUST** use `{.cdecl.}`:

```nim
proc myHandler(r: ClickRecognizerRef, c: pointer) {.cdecl.} =
  discard
```

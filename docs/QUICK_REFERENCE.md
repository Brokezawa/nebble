# Nebble API Quick Reference

This guide provides a quick look at the most commonly used high-level APIs in Nebble.

## 1. Managed Handles (Memory Safety)

All UI and system resources use **Managed Handles** which utilize Nim's ARC for automatic cleanup.

| Handle Type | Creation | Underlying Layer Access |
| :--- | :--- | :--- |
| `WindowHandle` | `newWindow()` | `h.rootLayer()` |
| `TextLayerHandle` | `newTextLayer(frame)` | `h.getLayer()` |
| `BitmapLayerHandle` | `newBitmapLayer(frame)` | `h.getLayer()` |
| `ActionBarLayerHandle` | `newActionBarLayer()` | `h.getLayer()` |
| `MenuLayerHandle` | `newMenuLayer(frame)` | `h.getLayer()` |
| `SimpleMenuLayerHandle`| `newSimpleMenuLayer(...)`| `h.getLayer()` |
| `ScrollLayerHandle` | `newScrollLayer(frame)` | `h.getLayer()` |
| `StatusBarLayerHandle` | `newStatusBarLayer()` | `h.getLayer()` |
| `RotBitmapLayerHandle` | `newRotBitmapLayer(bmp)` | `h.getLayer()` |
| `GPathHandle` | `newGPath(points)` | N/A |
| `TimerHandle` | `after(ms, callback)` | N/A |
| `DataLoggingSessionHandle`| `newDataLoggingSession(...)`| N/A |
| `AppSyncHandle` | `newAppSyncHandle(...)` | N/A |
| `ActionMenuHandle` | `openActionMenu(config)`| N/A |
| `ContentIndicatorHandle` | `newContentIndicator()` | N/A |
| `GBitmapRef` | `newBitmapRef(resource)` | `h.bitmap` |

## 2. Declarative UI (`nebbleApp`)

The recommended way to define your app structure.

```nim
nebbleApp:
  window:
    backgroundColor = GColorBlack

  textLayer:
    id = titleLabel
    fullWidth = true
    y = center
    h = 30
    text = "Hello!"
    alignment = GTextAlignmentCenter

  clicks:
    BUTTON_ID_SELECT = selectHandler
```

### Layout Properties
- `fullWidth = true` / `fullHeight = true`
- `x = center` / `y = center`
- `fullScreen = true`

## 3. String Formatting (Heap-Free)

Use `FixedString` to avoid memory fragmentation.

```nim
var s: FixedString[32]
s.f("Steps: ", steps)
label.text = s
```

## 4. Graphics & Drawing

Inside a `LayerUpdateProc`:
- `ctx.strokeColor = GColorRed`
- `ctx.fillColor = GColorBlue`
- `ctx.strokeWidth = 2`
- `ctx.drawLine(p1, p2)`
- `ctx.fillRect(rect)`
- `ctx.fillCircle(center, radius)`

## 5. Event Services

- **Connection**: `connection.isConnected()`
- **Battery**: `battery.state()`, `battery.chargePercent()`
- **Accel**: `accel.subscribe(handler)`, `accel.setRawMode(true)`
- **Compass**: `compass.subscribe(handler)`
- **Health**: `health.sumToday(HealthMetricStepCount)`

## 6. Communication

- **AppMessage**: `open(inbox, outbox)`, `onInboxReceived(handler)`
- **AppSync**: `h.set(tuplets)`, `h.get(key)`

## 7. Phone Component (PKJS in Nim)

In `src/pkjs.nim`:
- `onReady(handler)`: JS environment initialized.
- `onAppMessage(handler)`: Received message from watch.
- `Pebble.sendAppMessage(data)`: Send data to watch.
- `Pebble.showSimpleNotificationOnPebble(title, msg)`: Show watch notification.

## Important Note: Callbacks
All callbacks MUST use the `{.cdecl.}` pragma to be compatible with the Pebble C SDK.
```nim
proc myHandler(r: ClickRecognizerRef, c: pointer) {.cdecl.} = discard
```

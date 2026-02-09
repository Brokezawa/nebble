# Known Issues and Gotchas

## Critical Issue #1: Null Pointer Dereference - Updating UI Before Initialization

### Problem
**CRITICAL BUG:** Attempting to update UI elements (like TextLayers) before they are created in `windowLoad()` causes null pointer dereference → **immediate crash**.

### Example of INCORRECT code (crashes):
```nim
proc init() =
  window = newWindow()
  window.setHandlers(load = windowLoad, unload = windowUnload)
  window.push(animated = true)
  
  updateTime()  # ❌ CRASH! timeLayer is still nil!
  # windowLoad() hasn't been called yet, so timeLayer/dateLayer don't exist

proc windowLoad(win: ptr Window) {.cdecl.} =
  # This is called AFTER init() pushes the window
  timeLayer = newTextLayer(...)  # Created here
  dateLayer = newTextLayer(...)
```

### Example of CORRECT code:
```nim
proc init() =
  window = newWindow()
  window.setHandlers(load = windowLoad, unload = windowUnload)
  window.push(animated = true)
  # ✓ Don't call updateTime() here!

proc windowLoad(win: ptr Window) {.cdecl.} =
  timeLayer = newTextLayer(...)
  dateLayer = newTextLayer(...)
  
  rootLayer.addChild(timeLayer.getLayer())
  rootLayer.addChild(dateLayer.getLayer())
  
  updateTime()  # ✓ Call it here, after layers are created!
```

### Why This Happens
1. `window.push()` is **asynchronous** - it queues the window to be shown
2. `windowLoad()` callback is called **later** when the window is actually loaded
3. If you call `updateTime()` in `init()`, the layers are still `nil`
4. Dereferencing `nil` pointer → **instant crash**

### Execution Order
```
init() called
  ↓
window.push() queues window
  ↓
init() returns
  ↓
[Event loop processes window push]
  ↓
windowLoad() called ← Layers created HERE
  ↓
Now safe to update layers
```

### Symptoms
- ✗ App crashes immediately on launch
- ✗ Crash before any UI is shown
- ✗ Emulator becomes corrupted and won't load other apps
- ✗ "Segmentation fault" or similar error

### Real-World Example
The `simple_clock` watchface had this bug:
```nim
# ❌ WRONG - crashed on launch
proc init() =
  window = newWindow()
  window.setHandlers(load = windowLoad, unload = windowUnload)
  window.push(animated = true)
  tickTimerServiceSubscribe(TimeUnits.MINUTE_UNIT, tickHandler)
  updateTime()  # ❌ timeLayer is nil!

# ✓ FIXED
proc windowLoad(win: ptr Window) {.cdecl.} =
  # Create layers...
  timeLayer = newTextLayer(...)
  dateLayer = newTextLayer(...)
  # Add to window...
  updateTime()  # ✓ Safe - layers exist now!

proc init() =
  window = newWindow()
  window.setHandlers(load = windowLoad, unload = windowUnload)
  window.push(animated = true)
  tickTimerServiceSubscribe(TimeUnits.MINUTE_UNIT, tickHandler)
  # ✓ Don't call updateTime() here
```

## Critical Issue #2: Text Buffer Lifetime Issue

### Problem
**CRITICAL BUG:** Local buffers used for dynamic text in callbacks become invalid when they go out of scope, causing crashes and memory corruption.

### Example of INCORRECT code (crashes):
```nim
proc updateDisplay() =
  var buffer: array[32, char]  # ❌ LOCAL buffer - goes out of scope!
  let text = "Value: " & $someValue
  for i in 0..<min(text.len, 31):
    buffer[i] = text[i]
  buffer[min(text.len, 31)] = '\0'
  
  textLayer.text = cast[cstring](addr buffer[0])  # ❌ DANGLING POINTER!
  # When this function returns, buffer is destroyed
  # but textLayer still points to it -> CRASH
```

### Example of CORRECT code:
```nim
var
  textLayer: ptr TextLayer
  textBuffer: array[32, char]  # ✓ MODULE-SCOPE buffer persists

proc updateDisplay() =
  let text = "Value: " & $someValue
  for i in 0..<min(text.len, 31):
    textBuffer[i] = text[i]
  textBuffer[min(text.len, 31)] = '\0'
  
  textLayer.text = cast[cstring](addr textBuffer[0])  # ✓ Safe!
  # textBuffer stays alive for the entire program lifetime
```

### Why This Happens
1. TextLayer stores a pointer to your text buffer
2. If the buffer is local (stack-allocated), it's destroyed when the function returns
3. TextLayer now has a **dangling pointer** to freed memory
4. When Pebble tries to render the text, it reads invalid memory → **crash or garbage text**

### When This Matters
This is **critical** for:
- **Timer callbacks** (tick handlers, app timers)
- **Click handlers** (button callbacks)
- **Any callback that updates text dynamically**

### Safe Patterns

#### Pattern 1: Module-scope buffers (recommended for callbacks)
```nim
var
  timeBuffer: array[16, char]
  dateBuffer: array[32, char]

proc updateTime() =
  # ... format into timeBuffer ...
  timeLayer.text = cast[cstring](addr timeBuffer[0])
```

#### Pattern 2: Static strings (for constant text)
```nim
proc buttonClick(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  textLayer.text = "Button pressed!"  # ✓ Static string is safe
```

#### Pattern 3: Global string storage
```nim
var
  displayText: string = ""

proc updateDisplay() =
  displayText = "Value: " & $someValue
  textLayer.text = displayText  # ✓ string stays alive
```

### Symptoms of This Bug
- ✗ App crashes immediately on launch
- ✗ App crashes when timer fires or button is pressed
- ✗ Text shows garbage characters
- ✗ Emulator becomes unstable or crashes
- ✗ Hardware watch reboots

### Real-World Example
The `simple_clock` example had this bug in its initial version:
```nim
# ❌ WRONG - caused crashes and broke emulators
proc updateTime() =
  var timeBuffer: array[16, char]  # Local!
  discard strftime(addr timeBuffer[0], 16, "%H:%M", localTime)
  timeLayer.text = cast[cstring](addr timeBuffer[0])  # Crash!

# ✓ FIXED - buffers at module scope
var timeBuffer: array[16, char]  # Module scope!
var dateBuffer: array[32, char]

proc updateTime() =
  discard strftime(addr timeBuffer[0], 16, "%H:%M", localTime)
  timeLayer.text = cast[cstring](addr timeBuffer[0])  # Safe!
```

## Other Known Issues

### 1. Enum Value Qualification
**Issue:** Enum values must be qualified with their type name.

**Example:**
```nim
# ❌ Wrong
textLayer.textAlignment = GTextAlignmentCenter

# ✓ Correct
textLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
```

**Reason:** Nim limitation with module re-exports.

### 2. Button ID Constants Not Exported
**Issue:** `BUTTON_ID_*` constants are not available from `nebble` module.

**Workaround:**
```nim
import nebble
import nebble/ffi  # For BUTTON_ID_SELECT, etc.
```

### 3. Font Key String Literals
**Issue:** Font keys must be string literals, not constants.

**Example:**
```nim
# ✓ Correct
let font = getSystemFont("RESOURCE_ID_BITHAM_42_BOLD")

# ❌ Won't work (constant not exported)
let font = getSystemFont(FONT_KEY_BITHAM_42_BOLD)
```

### 4. Dynamic String Conversion Warnings
**Issue:** Compiler warns about temporary cstring conversion.

**Example:**
```nim
# ⚠ Warning: implicit conversion
textLayer.text = "Count: " & $count

# ✓ No warning: use buffer pattern (see above)
```

## Best Practices

### Memory Management
1. **Never use local buffers for text that outlives the function**
2. Use module-scope `var` for buffers referenced by UI elements
3. Keep buffers in scope for the lifetime they're needed
4. Aplite has only 24 KB RAM - be mindful of buffer sizes

### Callbacks
1. All callbacks must be `{.cdecl.}` proc types
2. Never use Nim closures at FFI boundary
3. Keep callback functions simple and fast
4. Store state in module-level variables, not captured vars

### Text Handling
1. Prefer static strings when possible
2. Use module-scope buffers for dynamic text
3. Always null-terminate char arrays used as cstrings
4. Size buffers appropriately for your content

### Testing
1. Test on emulators before hardware
2. Test all 6 platforms (especially Aplite for RAM constraints)
3. Test timer callbacks and button handlers thoroughly
4. Watch for crashes on startup or after events

## Platform Differences

### Aplite (Original Pebble)
- Only 24 KB RAM - most constrained
- Black and white display
- No color APIs available
- Test here first for memory issues

### Basalt/Chalk/Diorite/Emery/Flint
- More RAM available
- Color support (except Diorite)
- Additional APIs (Health, Microphone, etc.)
- Generally less constrained

## When in Doubt
- Keep text buffers at module scope
- Test on Aplite emulator
- Run `test_build_matrix.sh` before committing
- Check RAM usage with `arm-none-eabi-size`

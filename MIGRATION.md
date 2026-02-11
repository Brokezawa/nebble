# Pebble C to Nebble Nim Migration Guide

This guide helps you translate common Pebble C SDK patterns into idiomatic Nebble Nim code.

## Table of Contents

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

## Module Structure

Nebble's high-level API is organized to match the Pebble SDK structure:

```
nebble/
├── foundation/          # Core SDK Foundation APIs
│   ├── app.nim         # App lifecycle, pebbleApp macro
│   ├── time.nim        # Wall time functions
│   ├── timer.nim       # App timers
│   ├── storage.nim     # Persistent storage
│   ├── wakeup.nim      # Wakeup scheduling
│   ├── watch_info.nim  # Watch hardware info
│   ├── logging.nim     # APP_LOG macros
│   ├── i18n.nim        # Internationalization
│   ├── memory.nim      # Heap stats, cache control
│   ├── platform.nim    # Platform conditionals
│   └── events/         # Event Services (7 services)
│       ├── accel.nim
│       ├── battery.nim
│       ├── compass.nim
│       ├── connection.nim
│       ├── focus.nim
│       ├── health.nim
│       └── tick.nim
│
├── ui/                  # User Interface
│   ├── window.nim      # Window management
│   ├── layer.nim       # Base layer
│   ├── animation.nim   # Animations
│   ├── clicks.nim      # Click handlers
│   ├── text_layer.nim
│   ├── bitmap_layer.nim
│   ├── menu_layer.nim
│   ├── action_bar.nim
│   ├── status_bar.nim
│   ├── light.nim       # Backlight
│   ├── vibes.nim       # Vibration
│   └── ...
│
├── graphics/            # Low-level drawing
│   ├── graphics.nim    # Primitives, context
│   ├── fonts.nim       # Font loading
│   ├── gpath.nim       # Graphics paths
│   └── ...
│
├── comms/               # Communication
│   ├── message.nim     # AppMessage
│   ├── app_sync.nim    # AppSync
│   └── ...
│
├── input/               # Input methods
│   └── dictation.nim   # Voice dictation
│
└── util/                # Utilities
    ├── math.nim        # Math helpers
    └── uuid.nim        # UUID utilities
```

### Import Examples

```nim
# Import everything (includes all modules)
import nebble

# Import specific modules
import nebble/foundation/events/accel
import nebble/foundation/events/battery
import nebble/foundation/time
import nebble/ui/animation
import nebble/ui/action_bar
import nebble/ui/vibes
import nebble/graphics/fonts

# Import FFI for low-level access
import nebble/ffi
```

---

## Window Lifecycle

### Creating and Showing a Window

**C:**
```c
static Window *window;

window = window_create();
window_stack_push(window, true);
```

**Nim:**
```nim
var window: ptr Window

window = newWindow()
window.push(animated = true)
```

### Window Handlers

**C:**
```c
static void window_load(Window *window) {
  // Create UI elements
}

static void window_unload(Window *window) {
  // Destroy UI elements
}

window_set_window_handlers(window, (WindowHandlers) {
  .load = window_load,
  .unload = window_unload
});
```

**Nim:**
```nim
proc windowLoad(win: ptr Window) {.cdecl.} =
  # Create UI elements
  discard

proc windowUnload(win: ptr Window) {.cdecl.} =
  # Destroy UI elements
  discard

window.setHandlers(
  load = windowLoad,
  unload = windowUnload
)
```

### Background Color

**C:**
```c
window_set_background_color(window, GColorBlack);
```

**Nim:**
```nim
window.backgroundColor = GColorBlack
```

---

## Layer Hierarchy

### Creating Layers

**C:**
```c
Layer *layer = layer_create(GRect(0, 0, 144, 168));
```

**Nim:**
```nim
let layer = newLayer(makeGRect(0, 0, 144, 168))
```

### Adding Child Layers

**C:**
```c
Layer *root_layer = window_get_root_layer(window);
layer_add_child(root_layer, text_layer_get_layer(text_layer));
```

**Nim:**
```nim
let rootLayer = window.rootLayer
rootLayer.addChild(textLayer.getLayer())
```

### Frame vs Bounds

**C:**
```c
GRect frame = layer_get_frame(layer);
GRect bounds = layer_get_bounds(layer);
layer_set_frame(layer, GRect(10, 20, 100, 50));
```

**Nim:**
```nim
let frame = layer.frame
let bounds = layer.bounds
layer.frame = makeGRect(10, 20, 100, 50)
```

---

## Text Rendering

### Creating TextLayer

**C:**
```c
static TextLayer *text_layer;

text_layer = text_layer_create(GRect(0, 60, 144, 40));
text_layer_set_text(text_layer, "Hello World");
text_layer_set_text_alignment(text_layer, GTextAlignmentCenter);
text_layer_set_font(text_layer, fonts_get_system_font(FONT_KEY_GOTHIC_28_BOLD));
```

**Nim:**
```nim
var textLayer: ptr TextLayer

textLayer = newTextLayer(makeGRect(0, 60, 144, 40))
textLayer.text = "Hello World"
textLayer.textAlignment = GTextAlignmentCenter
textLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_28_BOLD")
```

### Dynamic Text (Important!)

**C:**
```c
static char text_buffer[32];

snprintf(text_buffer, sizeof(text_buffer), "Count: %d", counter);
text_layer_set_text(text_layer, text_buffer);
```

**Nim:**
```nim
var textBuffer: array[32, char] # Must be module-scope to persist

# Use the staticText template to copy text to buffer and set layer text
textLayer.staticText(textBuffer, "Count: " & $counter)
```

**Note:** Nim string literals are okay for static text, but dynamic text requires a module-scope buffer because the TextLayer doesn't copy the string. The `staticText` template handles the copying and null-termination for you.

---

## Click Handlers

### Single Click Handlers

**C:**
```c
static void select_click_handler(ClickRecognizerRef recognizer, void *context) {
  // Handle SELECT button
}

static void click_config_provider(void *context) {
  window_single_click_subscribe(BUTTON_ID_SELECT, select_click_handler);
}

window_set_click_config_provider(window, click_config_provider);
```

**Nim:**
```nim
import nebble/ffi # For BUTTON_ID_*

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  # Handle SELECT button
  discard

proc clickConfigProvider(context: pointer) {.cdecl.} =
  onClick(BUTTON_ID_SELECT, selectClickHandler)

window.clickConfig = clickConfigProvider
```

**Note:** All callback procs must have the `{.cdecl.}` pragma!

---

## Animations

### Property Animation (Layer Frame)

**C:**
```c
static PropertyAnimation *prop_anim;

GRect to_frame = GRect(10, 120, 100, 50);
prop_anim = property_animation_create_layer_frame(layer, NULL, &to_frame);
Animation *anim = property_animation_get_animation(prop_anim);

animation_set_duration(anim, 500);
animation_set_curve(anim, AnimationCurveEaseInOut);
animation_schedule(anim);
```

**Nim:**
```nim
import nebble/ui/animation

var propAnim: ptr PropertyAnimation

let toFrame = makeGRect(10, 120, 100, 50)
propAnim = newLayerFrameAnimation(layer, nil, addr toFrame)
let anim = propAnim.getAnimation()

# Configure animation
anim.duration = 500
anim.curve = AnimationCurveEaseInOut
discard anim.schedule()
```

---

## Services

### Battery Service

**C:**
```c
static void battery_handler(BatteryChargeState state) {
  // Handle battery change
}

battery_state_service_subscribe(battery_handler);
BatteryChargeState initial = battery_state_service_peek();
```

**Nim:**
```nim
import nebble/foundation/events/battery

proc batteryHandler(state: BatteryChargeState) {.cdecl.} =
  # Handle battery change
  discard

battery.subscribe(batteryHandler)
let initial = battery.state()
```

### Tick Timer Service

**C:**
```c
static void tick_handler(struct tm *tick_time, TimeUnits units_changed) {
  // Update time display
}

tick_timer_service_subscribe(MINUTE_UNIT, tick_handler);
```

**Nim:**
```nim
import nebble/foundation/events/tick

proc tickHandler(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  # Update time display
  discard

tick.subscribe(MINUTE_UNIT, tickHandler)
```

### Accelerometer Service

**C:**
```c
static void accel_data_handler(AccelData *data, uint32_t num_samples) {
  // Handle data
}

accel_data_service_subscribe(10, accel_data_handler);
```

**Nim:**
```nim
import nebble/foundation/events/accel

proc accelDataHandler(data: ptr AccelData; numSamples: uint32) {.cdecl.} =
  # Handle data
  discard

accel.subscribe(10, accelDataHandler)
```

### Health Service (not on Aplite)

**C:**
```c
HealthValue steps = health_service_sum_today(HealthMetricStepCount);
```

**Nim:**
```nim
import nebble/foundation/events/health

when declared(health.sumToday) and declared(HealthMetricStepCount):
  let steps = health.sumToday(HealthMetricStepCount)
```

---

## Persistent Storage

### Reading and Writing

**C:**
```c
#define PERSIST_KEY_COUNTER 1

int32_t counter = 0;

if (persist_exists(PERSIST_KEY_COUNTER)) {
  counter = persist_read_int(PERSIST_KEY_COUNTER);
}

persist_write_int(PERSIST_KEY_COUNTER, counter);
```

**Nim:**
```nim
import nebble/foundation/storage

const PERSIST_KEY_COUNTER = 1

var counter: int32 = 0

if storage.exists(PERSIST_KEY_COUNTER):
  counter = storage.readInt(PERSIST_KEY_COUNTER)

discard storage.writeInt(PERSIST_KEY_COUNTER, counter)
```

---

## App Messaging

### Opening AppMessage

**C:**
```c
app_message_open(128, 128);
```

**Nim:**
```nim
discard message.open(128, 128)
```

### Sending a Message

**C:**
```c
DictionaryIterator *iter;
app_message_outbox_begin(&iter);
dict_write_uint8(iter, MESSAGE_KEY_Temperature, 25);
app_message_outbox_send();
```

**Nim:**
```nim
var iter: ptr DictionaryIterator
discard message.outboxBegin(addr iter)
discard message.writeUint8(iter, MESSAGE_KEY_Temperature, 25)
discard message.outboxSend()
```

---

## Platform Conditional Compilation

### Color vs Black-and-White

**C:**
```c
#ifdef PBL_COLOR
  text_layer_set_background_color(layer, GColorClear);
#else
  text_layer_set_background_color(layer, GColorWhite);
#endif
```

**Nim:**
```nim
when declared(GColorClear):
  textLayer.backgroundColor = GColorClear
else:
  textLayer.backgroundColor = GColorWhite
```

### Feature Availability

**C:**
```c
#ifdef PBL_HEALTH
  HealthValue steps = health_service_sum_today(HealthMetricStepCount);
#endif
```

**Nim:**
```nim
when declared(health.sumToday):
  let steps = health.sumToday(HealthMetricStepCount)
```

---

## Common Patterns

### Main Entry Point

**C:**
```c
int main(void) {
  init();
  eventLoop();
  deinit();
  return 0;
}
```

**Nim:**
```nim
# Manual way:
proc main(): cint {.exportc, cdecl.} =
  init()
  eventLoop()
  deinit()
  return 0

# Preferred way (macro):
pebbleApp(init = init, deinit = deinit)
```

### Module-Scope Variables

**C:**
```c
static Window *window;
static TextLayer *text_layer;
static char text_buffer[32];
```

**Nim:**
```nim
var
  window: ptr Window
  textLayer: ptr TextLayer
  textBuffer: array[32, char]
```

### Memory Management

**C:**
```c
window = window_create();
// Use window
window_destroy(window);
```

**Nim:**
```nim
window = newWindow()
# Use window
window.destroy()
```

**Note:** Same pattern for all Pebble objects - `new*()` to create, `.destroy()` to clean up.

---

## Tips and Gotchas

1. **All callbacks must be `{.cdecl.}`** - This is required for C interop
2. **No Nim closures at FFI boundary** - Use global procs or static context pointers
3. **Use `staticText` for dynamic text** - TextLayer doesn't copy strings, so you need a persistent buffer
4. **Use `when declared()` for platform checks** - Not `#ifdef`
5. **Use the `pebbleApp` macro** - Removes boilerplate
6. **Import specific modules for services** - Event services are in `nebble/foundation/events/`, UI in `nebble/ui/`
7. **Import `nebble/ffi` for constants** - High-level modules don't always re-export C constants
8. **Discard return values explicitly** - Nim requires `discard` for unused return values
9. **Use `addr` for C pointers** - Nim's `addr` operator gives you `ptr` types

---

## Examples

For complete working examples, see the `examples/` directory:

- `hello_world` - Basic app with click handlers
- `simple_clock` - Watchface with tick timer
- `menu_demo` - Menu layer with sections
- `animation_demo` - Property animations
- `battery_status` - Battery service
- `accelerometer_demo` - Accelerometer and tap detection
- `persist_demo` - Persistent storage
- `vibes_demo` - Vibration patterns
- `action_bar_demo` - Action bar with buttons
- `health_demo` - Health service (steps, distance)

---

## Need Help?

- **API Documentation:** See `docs/html/nebble.html` for full API reference
- **Examples:** Browse `examples/` for working code
- **Issues:** Report bugs at https://github.com/zawa-t/nebble/issues

# Pebble C to Nebble Nim Migration Guide

This guide helps you translate common Pebble C SDK patterns into idiomatic Nebble Nim code.

## Table of Contents

- [Window Lifecycle](#window-lifecycle)
- [Layer Hierarchy](#layer-hierarchy)
- [Text Rendering](#text-rendering)
- [Click Handlers](#click-handlers)
- [Animations](#animations)
- [Services](#services)
- [Persistent Storage](#persistent-storage)
- [App Messaging](#app-messaging)

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
textLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
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
var textBuffer: array[32, char]

let text = "Count: " & $counter
for i in 0..<min(text.len, 31):
  textBuffer[i] = text[i]
textBuffer[min(text.len, 31)] = '\0'
textLayer.text = cast[cstring](addr textBuffer[0])
```

**Note:** Nim string literals are okay for static text, but dynamic text requires a module-scope buffer because the TextLayer doesn't copy the string.

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
  window_single_click_subscribe(BUTTON_ID_UP, up_click_handler);
  window_single_click_subscribe(BUTTON_ID_DOWN, down_click_handler);
}

window_set_click_config_provider(window, click_config_provider);
```

**Nim:**
```nim
import nebble/ffi  # For BUTTON_ID_* constants

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  # Handle SELECT button
  discard

proc clickConfigProvider(context: pointer) {.cdecl.} =
  onClick(BUTTON_ID_SELECT, selectClickHandler)
  onClick(BUTTON_ID_UP, upClickHandler)
  onClick(BUTTON_ID_DOWN, downClickHandler)

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
var propAnim: ptr PropertyAnimation

let toFrame = makeGRect(10, 120, 100, 50)
propAnim = property_animation_create_layer_frame(layer, nil, addr toFrame)
let anim = property_animation_get_animation(propAnim)

discard animation_set_duration(anim, 500)
discard animation_set_curve(anim, AnimationCurveEaseInOut)
discard animation_schedule(anim)
```

**Note:** Property animation functions are in the low-level FFI, use `import nebble/ffi`.

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
proc batteryHandler(state: BatteryChargeState) {.cdecl.} =
  # Handle battery change
  discard

battery.subscribe(batteryHandler)
let initial = battery.peek()
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
proc tickHandler(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  # Update time display
  discard

tick.subscribe(TimeUnits.MINUTE_UNIT, tickHandler)
```

### Accelerometer Service

**C:**
```c
static void accel_data_handler(AccelData *data, uint32_t num_samples) {
  int16_t x = data[0].x;
  int16_t y = data[0].y;
  int16_t z = data[0].z;
}

accel_data_service_subscribe(10, accel_data_handler);
```

**Nim:**
```nim
proc accelDataHandler(data: ptr AccelData; numSamples: uint32) {.cdecl.} =
  if numSamples > 0:
    let sample = data[]
    let x = sample.x
    let y = sample.y
    let z = sample.z

accelDataServiceSubscribe(10, accelDataHandler)
```

### Health Service (not on Aplite)

**C:**
```c
HealthValue steps = health_service_sum_today(HealthMetricStepCount);
```

**Nim:**
```nim
when declared(health_service_sum_today) and declared(HealthMetricStepCount):
  let steps = health_service_sum_today(HealthMetricStepCount)
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
import nebble/ffi as ffi  # To avoid ambiguous calls

const PERSIST_KEY_COUNTER = 1

var counter: int32 = 0

if ffi.persist_exists(PERSIST_KEY_COUNTER):
  counter = ffi.persist_read_int(PERSIST_KEY_COUNTER)

discard ffi.persist_write_int(PERSIST_KEY_COUNTER, counter)
```

**Note:** Use `import nebble/ffi as ffi` to avoid ambiguous calls between high-level and low-level persist functions.

---

## App Messaging

### Opening AppMessage

**C:**
```c
app_message_open(128, 128);
```

**Nim:**
```nim
discard appMessageOpen(128, 128)
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
discard appMessageOutboxBegin(addr iter)
discard dictWriteUint8(iter, MESSAGE_KEY_Temperature, 25)
discard appMessageOutboxSend()
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
when declared(health_service_sum_today):
  let steps = health_service_sum_today(HealthMetricStepCount)
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
proc main(): cint {.exportc, cdecl.} =
  init()
  eventLoop()
  deinit()
  return 0
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
3. **String literals are okay for static text** - But use module-scope buffers for dynamic text
4. **Use `when declared()` for platform checks** - Not `#ifdef`
5. **FFI function names use underscores** - High-level wrappers use camelCase
6. **Import `nebble/ffi as ffi`** - When you need both high-level and low-level APIs
7. **Discard return values explicitly** - Nim requires `discard` for unused return values
8. **Use `addr` for C pointers** - Nim's `addr` operator gives you `ptr` types

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

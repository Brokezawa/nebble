## accelerometer_demo - Pebble app demonstrating accelerometer in Nim
##
## Shows accelerometer data (X, Y, Z) and tap/shake detection.

import nebble/ffi
from nebble/app import eventLoop

var
  window: ptr Window
  xLayer, yLayer, zLayer: ptr TextLayer
  tapLayer: ptr TextLayer
  xBuffer, yBuffer, zBuffer: array[16, char]
  tapBuffer: array[32, char]
  tapCount = 0

proc updateAccelDisplay(x, y, z: int16) =
  ## Update the accelerometer display with current values
  
  # Format X value
  let xText = "X: " & $x
  for i in 0..<min(xText.len, 15):
    xBuffer[i] = xText[i]
  xBuffer[min(xText.len, 15)] = '\0'
  text_layer_set_text(xLayer, cast[cstring](addr xBuffer[0]))
  
  # Format Y value
  let yText = "Y: " & $y
  for i in 0..<min(yText.len, 15):
    yBuffer[i] = yText[i]
  yBuffer[min(yText.len, 15)] = '\0'
  text_layer_set_text(yLayer, cast[cstring](addr yBuffer[0]))
  
  # Format Z value
  let zText = "Z: " & $z
  for i in 0..<min(zText.len, 15):
    zBuffer[i] = zText[i]
  zBuffer[min(zText.len, 15)] = '\0'
  text_layer_set_text(zLayer, cast[cstring](addr zBuffer[0]))

proc accelDataHandler(data: ptr AccelData; numSamples: uint32) {.cdecl.} =
  ## Called when accelerometer data is available
  if numSamples > 0:
    # Display the most recent sample
    let sample = data[]
    updateAccelDisplay(sample.x, sample.y, sample.z)

when declared(AccelAxisType):
  proc accelTapHandler(axis: AccelAxisType; direction: int32) {.cdecl.} =
    ## Called when a tap is detected
    when declared(ACCEL_AXIS_X):
      inc tapCount
      
      let axisName = 
        case axis
        of ACCEL_AXIS_X: "X"
        of ACCEL_AXIS_Y: "Y"
        of ACCEL_AXIS_Z: "Z"
      
      let dirName = if direction > 0: "+" else: "-"
      
      let tapText = "Tap #" & $tapCount & " " & dirName & axisName
      for i in 0..<min(tapText.len, 31):
        tapBuffer[i] = tapText[i]
      tapBuffer[min(tapText.len, 31)] = '\0'
      text_layer_set_text(tapLayer, cast[cstring](addr tapBuffer[0]))

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = window_get_root_layer(win)
  let bounds = layer_get_bounds(rootLayer)
  
  # Create title layer
  let titleLayer = text_layer_create(makeGRect(0, 20, bounds.size.w, 30))
  text_layer_set_text(titleLayer, "Accelerometer")
  text_layer_set_text_alignment(titleLayer, GTextAlignmentCenter)
  text_layer_set_font(titleLayer, fonts_get_system_font(FONT_KEY_GOTHIC_24_BOLD))
  when declared(GColorClear):
    text_layer_set_background_color(titleLayer, GColorClear)
  layer_add_child(rootLayer, text_layer_get_layer(titleLayer))
  
  # Create X, Y, Z value layers
  xLayer = text_layer_create(makeGRect(20, 55, bounds.size.w - 40, 20))
  text_layer_set_font(xLayer, fonts_get_system_font(FONT_KEY_GOTHIC_18))
  when declared(GColorClear):
    text_layer_set_background_color(xLayer, GColorClear)
  layer_add_child(rootLayer, text_layer_get_layer(xLayer))
  
  yLayer = text_layer_create(makeGRect(20, 75, bounds.size.w - 40, 20))
  text_layer_set_font(yLayer, fonts_get_system_font(FONT_KEY_GOTHIC_18))
  when declared(GColorClear):
    text_layer_set_background_color(yLayer, GColorClear)
  layer_add_child(rootLayer, text_layer_get_layer(yLayer))
  
  zLayer = text_layer_create(makeGRect(20, 95, bounds.size.w - 40, 20))
  text_layer_set_font(zLayer, fonts_get_system_font(FONT_KEY_GOTHIC_18))
  when declared(GColorClear):
    text_layer_set_background_color(zLayer, GColorClear)
  layer_add_child(rootLayer, text_layer_get_layer(zLayer))
  
  # Create tap counter layer
  tapLayer = text_layer_create(makeGRect(0, 125, bounds.size.w, 25))
  text_layer_set_text(tapLayer, "Tap the watch!")
  text_layer_set_text_alignment(tapLayer, GTextAlignmentCenter)
  text_layer_set_font(tapLayer, fonts_get_system_font(FONT_KEY_GOTHIC_18_BOLD))
  when declared(GColorClear):
    text_layer_set_background_color(tapLayer, GColorClear)
  layer_add_child(rootLayer, text_layer_get_layer(tapLayer))
  
  # Initialize display with zeros
  updateAccelDisplay(0, 0, 0)

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  text_layer_destroy(xLayer)
  text_layer_destroy(yLayer)
  text_layer_destroy(zLayer)
  text_layer_destroy(tapLayer)

proc init() {.cdecl.} =
  ## Initialize the app
  window = window_create()
  window_set_window_handlers(window, WindowHandlers(
    load: windowLoad,
    unload: windowUnload
  ))
  
  # Subscribe to accelerometer data (10 samples per update, ~10Hz)
  accel_data_service_subscribe(10, accelDataHandler)
  
  # Subscribe to tap events (if available)
  when declared(AccelAxisType):
    accel_tap_service_subscribe(accelTapHandler)
  
  window_stack_push(window, true)

proc deinit() {.cdecl.} =
  ## Deinitialize the app
  accel_data_service_unsubscribe()
  when declared(AccelAxisType):
    accel_tap_service_unsubscribe()
  window_destroy(window)

proc main() {.exportc, cdecl.} =
  ## App entry point
  init()
  eventLoop()
  deinit()

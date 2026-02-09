## accelerometer_demo - Pebble app demonstrating accelerometer in Nim
##
## Shows accelerometer data (X, Y, Z) and tap/shake detection.

import nebble/ffi
import nebble/accel
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
  ffi.text_layer_set_text(xLayer, cast[cstring](addr xBuffer[0]))
  
  # Format Y value
  let yText = "Y: " & $y
  for i in 0..<min(yText.len, 15):
    yBuffer[i] = yText[i]
  yBuffer[min(yText.len, 15)] = '\0'
  ffi.text_layer_set_text(yLayer, cast[cstring](addr yBuffer[0]))
  
  # Format Z value
  let zText = "Z: " & $z
  for i in 0..<min(zText.len, 15):
    zBuffer[i] = zText[i]
  zBuffer[min(zText.len, 15)] = '\0'
  ffi.text_layer_set_text(zLayer, cast[cstring](addr zBuffer[0]))

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
      ffi.text_layer_set_text(tapLayer, cast[cstring](addr tapBuffer[0]))

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = ffi.window_get_root_layer(win)
  let bounds = ffi.layer_get_bounds(rootLayer)
  
  # Create title layer
  let titleLayer = ffi.text_layer_create(makeGRect(0, 20, bounds.size.w, 30))
  ffi.text_layer_set_text(titleLayer, "Accelerometer")
  ffi.text_layer_set_text_alignment(titleLayer, GTextAlignmentCenter)
  ffi.text_layer_set_font(titleLayer, ffi.fonts_get_system_font(FONT_KEY_GOTHIC_24_BOLD))
  when declared(GColorClear):
    ffi.text_layer_set_background_color(titleLayer, GColorClear)
  ffi.layer_add_child(rootLayer, ffi.text_layer_get_layer(titleLayer))
  
  # Create X, Y, Z value layers
  xLayer = ffi.text_layer_create(makeGRect(20, 55, bounds.size.w - 40, 20))
  ffi.text_layer_set_font(xLayer, ffi.fonts_get_system_font(FONT_KEY_GOTHIC_18))
  when declared(GColorClear):
    ffi.text_layer_set_background_color(xLayer, GColorClear)
  ffi.layer_add_child(rootLayer, ffi.text_layer_get_layer(xLayer))
  
  yLayer = ffi.text_layer_create(makeGRect(20, 75, bounds.size.w - 40, 20))
  ffi.text_layer_set_font(yLayer, ffi.fonts_get_system_font(FONT_KEY_GOTHIC_18))
  when declared(GColorClear):
    ffi.text_layer_set_background_color(yLayer, GColorClear)
  ffi.layer_add_child(rootLayer, ffi.text_layer_get_layer(yLayer))
  
  zLayer = ffi.text_layer_create(makeGRect(20, 95, bounds.size.w - 40, 20))
  ffi.text_layer_set_font(zLayer, ffi.fonts_get_system_font(FONT_KEY_GOTHIC_18))
  when declared(GColorClear):
    ffi.text_layer_set_background_color(zLayer, GColorClear)
  ffi.layer_add_child(rootLayer, ffi.text_layer_get_layer(zLayer))
  
  # Create tap counter layer
  tapLayer = ffi.text_layer_create(makeGRect(0, 125, bounds.size.w, 25))
  ffi.text_layer_set_text(tapLayer, "Tap the watch!")
  ffi.text_layer_set_text_alignment(tapLayer, GTextAlignmentCenter)
  ffi.text_layer_set_font(tapLayer, ffi.fonts_get_system_font(FONT_KEY_GOTHIC_18_BOLD))
  when declared(GColorClear):
    ffi.text_layer_set_background_color(tapLayer, GColorClear)
  ffi.layer_add_child(rootLayer, ffi.text_layer_get_layer(tapLayer))
  
  # Initialize display with zeros
  updateAccelDisplay(0, 0, 0)

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  ffi.text_layer_destroy(xLayer)
  ffi.text_layer_destroy(yLayer)
  ffi.text_layer_destroy(zLayer)
  ffi.text_layer_destroy(tapLayer)

proc init() {.cdecl.} =
  ## Initialize the app
  window = ffi.window_create()
  ffi.window_set_window_handlers(window, WindowHandlers(
    load: windowLoad,
    unload: windowUnload
  ))
  
  # Subscribe to accelerometer data (10 samples per update, ~10Hz)
  accel.subscribe(10, accelDataHandler)
  
  # Subscribe to tap events (if available)
  when declared(AccelAxisType):
    accel.subscribe(accelTapHandler)
  
  ffi.window_stack_push(window, true)

proc deinit() {.cdecl.} =
  ## Deinitialize the app
  accel.unsubscribeData()
  when declared(AccelAxisType):
    accel.unsubscribeTap()
  ffi.window_destroy(window)

proc main() {.exportc, cdecl.} =
  ## App entry point
  init()
  eventLoop()
  deinit()

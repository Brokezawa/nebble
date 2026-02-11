## accelerometer_demo - Pebble app demonstrating accelerometer in Nim
##
## Shows accelerometer data (X, Y, Z) and tap/shake detection.

import nebble
import nebble/foundation/events/accel
import nebble/ffi # For AccelAxisType enum values

var
  xLayer, yLayer, zLayer: ptr TextLayer
  tapLayer: ptr TextLayer
  xBuffer, yBuffer, zBuffer: array[16, char]
  tapBuffer: array[32, char]
  tapCount = 0

proc updateAccelDisplay(x, y, z: int16) =
  ## Update the accelerometer display with current values
  
  xLayer.staticText(xBuffer, "X: " & $x)
  yLayer.staticText(yBuffer, "Y: " & $y)
  zLayer.staticText(zBuffer, "Z: " & $z)

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
      
      tapLayer.staticText(tapBuffer, "Tap #" & $tapCount & " " & dirName & axisName)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create title layer
  let titleLayer = newTextLayer(makeGRect(0, 20, bounds.size.w, 30))
  titleLayer.text = "Accelerometer"
  titleLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  titleLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_24_BOLD")
  when declared(GColorClear):
    titleLayer.backgroundColor = GColorClear
  rootLayer.addChild(titleLayer.getLayer())
  
  # Create X, Y, Z value layers
  xLayer = newTextLayer(makeGRect(20, 55, bounds.size.w - 40, 20))
  xLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_18")
  when declared(GColorClear):
    xLayer.backgroundColor = GColorClear
  rootLayer.addChild(xLayer.getLayer())
  
  yLayer = newTextLayer(makeGRect(20, 75, bounds.size.w - 40, 20))
  yLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_18")
  when declared(GColorClear):
    yLayer.backgroundColor = GColorClear
  rootLayer.addChild(yLayer.getLayer())
  
  zLayer = newTextLayer(makeGRect(20, 95, bounds.size.w - 40, 20))
  zLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_18")
  when declared(GColorClear):
    zLayer.backgroundColor = GColorClear
  rootLayer.addChild(zLayer.getLayer())
  
  # Create tap counter layer
  tapLayer = newTextLayer(makeGRect(0, 125, bounds.size.w, 25))
  tapLayer.text = "Tap the watch!"
  tapLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  tapLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_18_BOLD")
  when declared(GColorClear):
    tapLayer.backgroundColor = GColorClear
  rootLayer.addChild(tapLayer.getLayer())
  
  # Initialize display with zeros
  updateAccelDisplay(0, 0, 0)

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  xLayer.destroy()
  yLayer.destroy()
  zLayer.destroy()
  tapLayer.destroy()

proc initApp() =
  ## Initialize the app
  # Subscribe to accelerometer data (10 samples per update, ~10Hz)
  accel.subscribe(10, accelDataHandler)
  
  # Subscribe to tap events (if available)
  when declared(AccelAxisType):
    accel.subscribe(accelTapHandler)

proc deinitApp() =
  ## Deinitialize the app
  accel.unsubscribeData()
  when declared(AccelAxisType):
    accel.unsubscribeTap()

pebbleApp(
  load = windowLoad,
  unload = windowUnload,
  init = initApp,
  deinit = deinitApp
)

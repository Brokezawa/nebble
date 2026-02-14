## accelerometer_demo - Pebble app demonstrating accelerometer in Nim
##
## Shows accelerometer data (X, Y, Z) and tap/shake detection using the declarative DSL.

import nebble
import nebble/foundation/events/accel

# Forward declarations
proc accelDataHandler(data: ptr AccelData; numSamples: uint32) {.cdecl.}
proc accelTapHandler(axis: AccelAxisType; direction: int32) {.cdecl.}

# Declarative App
nebbleApp:
  textLayer:
    id = titleLayer
    fullWidth = true
    y = 20
    h = 30
    text = "Accelerometer"
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_24_BOLD
    
  textLayer:
    id = xLayer
    x = center
    y = 55
    w = 104
    h = 20
    font = FONT_KEY_GOTHIC_18
    
  textLayer:
    id = yLayer
    x = center
    y = 75
    w = 104
    h = 20
    font = FONT_KEY_GOTHIC_18
    
  textLayer:
    id = zLayer
    x = center
    y = 95
    w = 104
    h = 20
    font = FONT_KEY_GOTHIC_18
    
  textLayer:
    id = tapLayer
    fullWidth = true
    y = 125
    h = 25
    text = "Tap the watch!"
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_18_BOLD

  init:
    accel.subscribe(10, accelDataHandler)
    accel.subscribe(accelTapHandler)

  deinit:
    accel.unsubscribeData()
    accel.unsubscribeTap()

var
  tapCount = 0
  xBuffer, yBuffer, zBuffer: array[16, char]
  tapBuffer: array[32, char]

proc updateAccelDisplay(x, y, z: int16) =
  xLayer.staticText(xBuffer, "X: " & $x)
  yLayer.staticText(yBuffer, "Y: " & $y)
  zLayer.staticText(zBuffer, "Z: " & $z)

proc accelDataHandler(data: ptr AccelData; numSamples: uint32) {.cdecl.} =
  if numSamples > 0:
    let sample = data[]
    updateAccelDisplay(sample.x, sample.y, sample.z)

proc accelTapHandler(axis: AccelAxisType; direction: int32) {.cdecl.} =
  inc tapCount
  let axisName = case axis
    of ACCEL_AXIS_X: "X"
    of ACCEL_AXIS_Y: "Y"
    of ACCEL_AXIS_Z: "Z"
  let dirName = if direction > 0: "+" else: "-"
  tapLayer.staticText(tapBuffer, "Tap #" & $tapCount & " " & dirName & axisName)

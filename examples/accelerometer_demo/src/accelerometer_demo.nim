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
  xStr, yStr, zStr: FixedString[16]
  tapStr: FixedString[32]

proc updateAccelDisplay(x, y, z: int16) =
  xStr.f("X: ", x)
  xLayer.text = xStr
  yStr.f("Y: ", y)
  yLayer.text = yStr
  zStr.f("Z: ", z)
  zLayer.text = zStr

proc accelDataHandler(data: ptr AccelData; numSamples: uint32) {.cdecl.} =
  if numSamples > 0:
    let sample = data[]
    updateAccelDisplay(sample.x, sample.y, sample.z)

proc accelTapHandler(axis: AccelAxisType; direction: int32) {.cdecl.} =
  inc tapCount
  let axisName: cstring = case axis
    of ACCEL_AXIS_X: "X"
    of ACCEL_AXIS_Y: "Y"
    of ACCEL_AXIS_Z: "Z"
  let dirName: cstring = if direction > 0: "+" else: "-"
  tapStr.f("Tap #", tapCount, " ", dirName, axisName)
  tapLayer.text = tapStr

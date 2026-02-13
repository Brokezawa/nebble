## simple_watchface - A basic digital watchface in Nim
##
## Demonstrates the minimal code needed for a functional watchface.

import nebble
import nebble/foundation/logging

# Forward declaration
proc updateTime(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.}

# Declarative Watchface
nebbleApp:
  window:
    backgroundColor = GColorBlack

  textLayer:
    id = timeLayer
    fullWidth = true
    frame = (0, 52, 0, 50)
    text = "00:00"
    font = FONT_KEY_BITHAM_42_BOLD
    color = GColorWhite
    bgColor = GColorClear # Explicitly clear
    alignment = GTextAlignmentCenter

  tickTimer:
    unit = MINUTE_UNIT
    handler = updateTime

  init:
    logInfo("Watchface Init")

var
  timeBuffer: array[16, char]

proc updateTime(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  logInfo("updateTime called")
  let timeFmt = if clockIs24hStyle(): "%H:%M" else: "%I:%M"
  discard strftime(addr timeBuffer[0], 16, timeFmt, tickTime)
  timeLayer.text = cast[cstring](addr timeBuffer[0])

## simple_watchface - A basic digital watchface in Nim
##
## Demonstrates the minimal code needed for a functional watchface.

import nebble
import nebble/foundation/logging
import nebble/util/fixed_strings

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
  timeBuffer: FixedString[16]

proc updateTime(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  logInfo("updateTime called")
  # Use high-level formatTime - no addr or cast needed
  discard timeBuffer.formatTime(tickTime)
  timeLayer.text = timeBuffer.cstr  # Use .cstr template for safety

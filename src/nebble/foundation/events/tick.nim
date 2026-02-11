## High-level Nim wrapper for Pebble Tick Timer Service API.
##
## Provides periodic time-based events (seconds, minutes, hours).

import nebble/ffi

export ffi.TimeUnits, ffi.TickHandler

# ============================================================================
# Tick Timer Service
# ============================================================================

proc subscribe*(units: TimeUnits, handler: TickHandler) {.inline.} =
  ## Subscribe to tick timer events for the specified time units.
  ## Handler will be called whenever any of the specified units change.
  ## Equivalent to C function `tick_timer_service_subscribe(units, handler)`.
  ##
  ## Usage:
  ##   proc tickHandler(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  ##     if (unitsChanged and TimeUnits.MINUTE_UNIT.ord) != 0:
  ##       # Minute changed
  ##   subscribe(TimeUnits.MINUTE_UNIT, tickHandler)
  ffi.tick_timer_service_subscribe(units, handler)

proc unsubscribe*() {.inline.} =
  ## Unsubscribe from tick timer events.
  ## Equivalent to C function `tick_timer_service_unsubscribe()`.
  ffi.tick_timer_service_unsubscribe()

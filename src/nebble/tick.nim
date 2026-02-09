## High-level idiomatic Nim API for Pebble tick timer service.
##
## The tick timer service provides periodic callbacks at second, minute,
## hour, day, month, or year boundaries.

import nebble/ffi

export ffi.TimeUnits, ffi.TickHandler, ffi.tm, ffi.time_t
export ffi.time, ffi.localtime, ffi.gmtime, ffi.strftime, ffi.clock_is_24h_style

# ============================================================================
# Tick Timer Service
# ============================================================================

proc subscribe*(units: TimeUnits, handler: TickHandler) {.inline.} =
  ## Subscribe to tick timer events.
  ## `units` specifies the granularity (SECOND_UNIT, MINUTE_UNIT, etc.).
  ## The handler is called when the specified time unit changes.
  ## Equivalent to C function `tick_timer_service_subscribe(units, handler)`.
  ##
  ## **Note:** This uses a distinctly different name (`subscribe`) from the FFI
  ## function (`tick_timer_service_subscribe`) to avoid UFCS collision.
  ## The `ffi.` qualification ensures we call the correct C function.
  ffi.tick_timer_service_subscribe(units, handler)

proc unsubscribe*() {.inline.} =
  ## Unsubscribe from tick timer events.
  ## Equivalent to C function `tick_timer_service_unsubscribe()`.
  ffi.tick_timer_service_unsubscribe()

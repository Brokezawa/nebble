## High-level Nim wrapper for Pebble Timer API.
##
## Provides app timer functionality for scheduling callbacks.

import nebble/ffi

export ffi.AppTimer

# ============================================================================
# Timer Operations
# ============================================================================

proc after*(timeoutMs: uint32, callback: ffi.AppTimerCallback, context: pointer = nil): ptr AppTimer {.inline.} =
  ## Schedule a timer to fire after `timeoutMs` milliseconds.
  ## Returns a pointer to the timer, or nil on failure.
  ## Equivalent to C function `app_timer_register(timeout_ms, callback, context)`.
  result = ffi.app_timer_register(timeoutMs, callback, context)

proc reschedule*(timer: ptr AppTimer, timeoutMs: uint32): bool {.inline.} =
  ## Reschedule an existing timer.
  ## Returns true on success, false on failure.
  ## Equivalent to C function `app_timer_reschedule(timer, timeout_ms)`.
  result = ffi.app_timer_reschedule(timer, timeoutMs)

proc cancel*(timer: ptr AppTimer) {.inline.} =
  ## Cancel a scheduled timer.
  ## Equivalent to C function `app_timer_cancel(timer)`.
  ffi.app_timer_cancel(timer)

## High-level idiomatic Nim API for Pebble app timers.
##
## AppTimer provides one-shot and repeating timers that fire callbacks
## after a specified delay.

import nebble/ffi

# ============================================================================
# AppTimer
# ============================================================================

proc after*(timeoutMs: uint32, callback: AppTimerCallback,
            callbackData: pointer = nil): ptr AppTimer {.inline.} =
  ## Schedule a timer to fire after `timeoutMs` milliseconds.
  ## The timer fires once and must be rescheduled or recreated for repeat.
  ## Returns an AppTimer handle that can be passed to `cancel()` or `reschedule()`.
  ## Equivalent to C function `app_timer_register(timeout_ms, callback, callback_data)`.
  ffi.app_timer_register(timeoutMs, callback, callbackData)

proc cancel*(timer: ptr AppTimer) {.inline.} =
  ## Cancel a pending timer.
  ## Equivalent to C function `app_timer_cancel(timer)`.
  ffi.app_timer_cancel(timer)

proc reschedule*(timer: ptr AppTimer, newTimeoutMs: uint32): bool {.inline.} =
  ## Reschedule an existing timer with a new timeout.
  ## Returns true if successful, false if the timer was invalid or already fired.
  ## Equivalent to C function `app_timer_reschedule(timer, new_timeout_ms)`.
  ffi.app_timer_reschedule(timer, newTimeoutMs)

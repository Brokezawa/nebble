## High-level Nim wrapper for Pebble Timer API.
##
## Provides app timer functionality for scheduling callbacks.

import nebble/ffi
import nebble/ffi/managed

export ffi.AppTimer, ffi.AppTimerCallback

# ============================================================================
# Timer Handle
# ============================================================================

type TimerHandle* = object
  ## Managed handle for AppTimer.
  ## Note: Timers are automatically destroyed by the system after they fire.
  ## This handle allows canceling a pending timer via RAII.
  pRaw: ptr AppTimer
  ownership: HandleOwnership

proc `=destroy`*(h: var TimerHandle) =
  if h.pRaw != nil and h.ownership == hoOwned:
    ffi.app_timer_cancel(h.pRaw)
  h.pRaw = nil
  h.ownership = hoNone

proc `=wasMoved`*(h: var TimerHandle) =
  h.pRaw = nil
  h.ownership = hoNone

proc `=copy`*(dest: var TimerHandle, src: TimerHandle) {.error.} = discard

proc `=sink`*(dest: var TimerHandle, src: TimerHandle) =
  `=destroy`(dest)
  dest.pRaw = src.pRaw
  dest.ownership = src.ownership
  var srcPtr = cast[ptr TimerHandle](unsafeAddr src)
  srcPtr.pRaw = nil
  srcPtr.ownership = hoNone

converter toPtr*(h: TimerHandle): ptr AppTimer = h.pRaw

proc isValid*(h: TimerHandle): bool {.inline.} = h.pRaw != nil

proc wrapOwned*(p: ptr AppTimer): TimerHandle {.inline.} =
  TimerHandle(pRaw: p, ownership: hoOwned)

proc toHandle*(p: ptr AppTimer): TimerHandle {.inline.} =
  TimerHandle(pRaw: p, ownership: hoUnowned)

# ============================================================================
# Timer Operations
# ============================================================================

proc after*(timeoutMs: uint32, callback: AppTimerCallback, context: pointer = nil): TimerHandle {.inline.} =
  ## Schedule a timer to fire after `timeoutMs` milliseconds.
  ## Returns a managed handle. If the handle goes out of scope, the timer is canceled.
  wrapOwned(ffi.app_timer_register(timeoutMs, callback, context))

proc once*(timeoutMs: uint32, callback: AppTimerCallback, context: pointer = nil) {.inline.} =
  ## Schedule a one-off timer. Since the result is ignored, it will NOT be canceled.
  discard ffi.app_timer_register(timeoutMs, callback, context)

proc reschedule*(h: var TimerHandle, timeoutMs: uint32): bool {.inline.} =
  ## Reschedule an existing timer.
  if h.pRaw == nil: return false
  result = ffi.app_timer_reschedule(h.pRaw, timeoutMs)

proc cancel*(h: var TimerHandle) {.inline.} =
  ## Cancel a scheduled timer.
  if h.pRaw == nil: return
  ffi.app_timer_cancel(h.pRaw)
  h.pRaw = nil
  h.ownership = hoNone

# ============================================================================
# Procedural API (Raw Pointers)
# ============================================================================

proc register*(timeoutMs: uint32, callback: AppTimerCallback, context: pointer = nil): ptr AppTimer {.inline.} =
  ## Raw version of `app_timer_register`.
  ffi.app_timer_register(timeoutMs, callback, context)

proc reschedule*(timer: ptr AppTimer, timeoutMs: uint32): bool {.inline.} =
  ## Raw version of `app_timer_reschedule`.
  ffi.app_timer_reschedule(timer, timeoutMs)

proc cancel*(timer: ptr AppTimer) {.inline.} =
  ## Raw version of `app_timer_cancel`.
  ffi.app_timer_cancel(timer)

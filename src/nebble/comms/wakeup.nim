## High-level Nim wrapper for Pebble Wakeup API.
##
## Provides scheduled wakeup functionality to launch the app at a specific time.

import nebble/ffi

# Re-export commonly used types
export ffi.WakeupId, ffi.WakeupHandler, ffi.time_t

# ============================================================================
# Wakeup Service
# ============================================================================

when declared(ffi.wakeup_service_subscribe):
  proc subscribe*(handler: WakeupHandler) {.inline.} =
    ## Subscribe to wakeup events.
    ## Equivalent to C function `wakeup_service_subscribe(handler)`.
    ffi.wakeup_service_subscribe(handler)

when declared(ffi.wakeup_schedule):
  proc schedule*(timestamp: time_t, cookie: int32, notifyIfMissed: bool): WakeupId {.inline.} =
    ## Schedule a wakeup at the given timestamp.
    ## Equivalent to C function `wakeup_schedule(timestamp, cookie, notify_if_missed)`.
    ## Returns a wakeup ID, or a negative error code on failure.
    ffi.wakeup_schedule(timestamp, cookie, notifyIfMissed)

when declared(ffi.wakeup_cancel):
  proc cancel*(wakeupId: WakeupId) {.inline.} =
    ## Cancel a scheduled wakeup.
    ## Equivalent to C function `wakeup_cancel(wakeup_id)`.
    ffi.wakeup_cancel(wakeupId)

when declared(ffi.wakeup_cancel_all):
  proc cancelAll*() {.inline.} =
    ## Cancel all scheduled wakeups.
    ## Equivalent to C function `wakeup_cancel_all()`.
    ffi.wakeup_cancel_all()

when declared(ffi.wakeup_get_launch_event):
  proc getLaunchEvent*(wakeupId: ptr WakeupId, cookie: ptr int32): bool {.inline.} =
    ## Get the wakeup event that launched the app.
    ## Equivalent to C function `wakeup_get_launch_event(wakeup_id, cookie)`.
    ## Returns true if the app was launched by a wakeup event.
    ffi.wakeup_get_launch_event(wakeupId, cookie)

when declared(ffi.wakeup_query):
  proc query*(wakeupId: WakeupId, timestamp: ptr time_t): bool {.inline.} =
    ## Query information about a scheduled wakeup.
    ## Equivalent to C function `wakeup_query(wakeup_id, timestamp)`.
    ## Returns true if the wakeup exists.
    ffi.wakeup_query(wakeupId, timestamp)

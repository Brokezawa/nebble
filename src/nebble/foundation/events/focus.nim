## High-level Nim wrapper for Pebble App Focus Service API.
##
## Provides app focus change notifications (foreground/background).

import nebble/ffi

export ffi.AppFocusHandler

# ============================================================================
# App Focus Events
# ============================================================================

proc subscribe*(handler: AppFocusHandler) {.inline.} =
  ## Subscribe to app focus change events (app in foreground / background).
  ## Equivalent to C function `app_focus_service_subscribe(handler)`.
  ffi.app_focus_service_subscribe(handler)

proc unsubscribe*() {.inline.} =
  ## Unsubscribe from app focus change events.
  ## Equivalent to C function `app_focus_service_unsubscribe()`.
  ffi.app_focus_service_unsubscribe()

when declared(ffi.app_focus_service_is_active):
  proc isActive*(): bool {.inline.} =
    ## Check if the app currently has focus (is in the foreground).
    ## Equivalent to C function `app_focus_service_is_active()`.
    ffi.app_focus_service_is_active()

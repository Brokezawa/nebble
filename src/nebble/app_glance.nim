## High-level Nim wrapper for Pebble App Glance API.
##
## Provides a way to display app information on the timeline without launching the app.

import nebble/ffi

# Re-export commonly used types
export ffi.AppGlanceReloadSession, ffi.AppGlanceSlice, ffi.AppGlanceReloadCallback, ffi.AppGlanceResult

# ============================================================================
# App Glance Functions
# ============================================================================

when declared(ffi.app_glance_add_slice):
  proc addSlice*(session: ptr AppGlanceReloadSession, slice: AppGlanceSlice): AppGlanceResult {.inline.} =
    ## Add a slice to the app glance reload session.
    ## Equivalent to C function `app_glance_add_slice(session, slice)`.
    ffi.app_glance_add_slice(session, slice)

when declared(ffi.app_glance_reload):
  proc reload*(callback: AppGlanceReloadCallback, context: pointer): AppGlanceResult {.inline.} =
    ## Reload the app glance with new data.
    ## Equivalent to C function `app_glance_reload(callback, context)`.
    ffi.app_glance_reload(callback, context)

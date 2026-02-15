## High-level Nim wrapper for Pebble AppGlance API.
##
## AppGlance allows apps to display a small amount of information (a slice)
## on the watchface or in the app menu without the app being open.

import nebble/ffi

export ffi.AppGlanceSlice, ffi.AppGlanceResult, ffi.AppGlanceReloadSession, ffi.AppGlanceReloadCallback

const
  APP_GLANCE_SLICE_NO_EXPIRATION* = 0'i32
  APP_GLANCE_SLICE_DEFAULT_ICON* = 0'u32

# ============================================================================
# App Glance Operations
# ============================================================================

when declared(ffi.app_glance_add_slice):
  proc addSlice*(session: ptr AppGlanceReloadSession, 
                 subtitle: cstring, 
                 icon: uint32 = APP_GLANCE_SLICE_DEFAULT_ICON,
                 expiration: int32 = APP_GLANCE_SLICE_NO_EXPIRATION): AppGlanceResult {.inline.} =
    ## Add a slice to the app glance.
    ##
    ## **Parameters:**
    ## - `session`: The reload session provided in the reload callback.
    ## - `subtitle`: The text to display (supports template strings like "{count} steps").
    ## - `icon`: Resource ID of the icon to display.
    ## - `expiration`: Time when the slice should expire.
    if session == nil: return AppGlanceResult(1) # Error
    
    var slice: AppGlanceSlice
    slice.layout.subtitle_template_string = subtitle
    slice.layout.icon = icon
    slice.expiration_time = expiration
    
    result = ffi.app_glance_add_slice(session, slice)

when declared(ffi.app_glance_reload):
  proc reload*(callback: AppGlanceReloadCallback, context: pointer = nil) {.inline.} =
    ## Trigger a reload of the app glance.
    ## The callback will be called by the system to add slices.
    ffi.app_glance_reload(callback, context)

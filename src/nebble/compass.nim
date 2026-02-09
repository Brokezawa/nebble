## High-level Nim wrapper for Pebble Compass Service API.
##
## Provides access to magnetometer/compass heading data.

import nebble/ffi

export ffi.CompassHeadingHandler, ffi.CompassHeadingData, ffi.CompassHeading
export ffi.CompassStatus

# ============================================================================
# Compass Service
# ============================================================================

when declared(ffi.compass_service_subscribe):
  proc subscribe*(handler: CompassHeadingHandler) {.inline.} =
    ## Subscribe to compass heading updates.
    ## Equivalent to C function `compass_service_subscribe(handler)`.
    ## NOTE: Not available on Aplite (no magnetometer).
    ffi.compass_service_subscribe(handler)

  proc unsubscribe*() {.inline.} =
    ## Unsubscribe from compass heading updates.
    ## Equivalent to C function `compass_service_unsubscribe()`.
    ffi.compass_service_unsubscribe()

  proc peek*(data: ptr CompassHeadingData): cint {.inline.} =
    ## Get the current compass heading without subscribing.
    ## Equivalent to C function `compass_service_peek(data)`.
    ## Returns 0 on success, negative on error.
    ffi.compass_service_peek(data)

  proc setHeadingFilter*(filter: CompassHeading): cint {.inline.} =
    ## Set the heading filter (minimum change to trigger update).
    ## Equivalent to C function `compass_service_set_heading_filter(filter)`.
    ## Returns 0 on success, negative on error.
    ffi.compass_service_set_heading_filter(filter)

## High-level Nim wrapper for Pebble Compass Service API.
##
## Provides compass heading information from magnetometer and accelerometer.

import nebble/ffi

export ffi.CompassHeadingData, ffi.CompassHeadingHandler, ffi.CompassHeading, ffi.CompassStatus

template CompassStatusUnavailable*(): CompassStatus = ffi.CompassStatusUnavailable
template CompassStatusDataInvalid*(): CompassStatus = ffi.CompassStatusDataInvalid
template CompassStatusCalibrating*(): CompassStatus = ffi.CompassStatusCalibrating
template CompassStatusCalibrated*(): CompassStatus = ffi.CompassStatusCalibrated

# ============================================================================
# Compass Service
# ============================================================================

when declared(ffi.compass_service_subscribe):
  proc subscribe*(handler: CompassHeadingHandler) {.inline.} =
    ## Subscribe to compass heading updates.
    ## Equivalent to C function `compass_service_subscribe(handler)`.
    ffi.compass_service_subscribe(handler)

when declared(ffi.compass_service_unsubscribe):
  proc unsubscribe*() {.inline.} =
    ## Unsubscribe from compass heading updates.
    ## Equivalent to C function `compass_service_unsubscribe()`.
    ffi.compass_service_unsubscribe()

when declared(ffi.compass_service_set_heading_filter):
  proc setHeadingFilter*(filter: CompassHeading) {.inline.} =
    ## Set the compass heading filter in degrees (0-360).
    ## Smaller values = more updates but less stable.
    ## Equivalent to C function `compass_service_set_heading_filter(filter)`.
    discard ffi.compass_service_set_heading_filter(filter)

when declared(ffi.compass_service_peek):
  proc peek*(data: ptr CompassHeadingData): bool {.inline.} =
    ## Get the current compass heading.
    ## Returns true on success, false on error.
    ## Equivalent to C function `compass_service_peek(data)`.
    result = ffi.compass_service_peek(data) == 0

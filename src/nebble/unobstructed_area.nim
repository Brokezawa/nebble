## High-level Nim wrapper for Pebble Unobstructed Area Service.
##
## Provides API for handling the unobstructed screen area (e.g. on round screens
## or when the Timeline Quick View is visible).

import nebble/ffi

export ffi.UnobstructedAreaHandlers

# ============================================================================
# Service Subscription
# ============================================================================

when declared(ffi.unobstructed_area_service_subscribe):
  proc subscribe*(handlers: UnobstructedAreaHandlers, context: pointer = nil) {.inline.} =
    ## Subscribe to unobstructed area events.
    ## Equivalent to C function `unobstructed_area_service_subscribe(handlers, context)`.
    ## NOTE: Not available on Aplite.
    ffi.unobstructed_area_service_subscribe(handlers, context)

when declared(ffi.unobstructed_area_service_unsubscribe):
  proc unsubscribe*() {.inline.} =
    ## Unsubscribe from unobstructed area events.
    ## Equivalent to C function `unobstructed_area_service_unsubscribe()`.
    ## NOTE: Not available on Aplite.
    ffi.unobstructed_area_service_unsubscribe()

# ============================================================================
# Layer Helpers
# ============================================================================

when declared(ffi.layer_get_unobstructed_bounds):
  proc getUnobstructedBounds*(layer: ptr Layer): GRect {.inline.} =
    ## Get the bounds of the layer that are not obstructed by system overlays.
    ## Equivalent to C function `layer_get_unobstructed_bounds(layer)`.
    ## NOTE: Not available on Aplite.
    ffi.layer_get_unobstructed_bounds(layer)

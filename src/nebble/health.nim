# ============================================================================
# Events
# ============================================================================

when declared(ffi.health_service_events_subscribe):
  proc eventsSubscribe*(handler: ffi.HealthEventHandler, context: pointer): bool {.inline.} =
    ## Subscribe to health service events.
    ## Equivalent to C function `health_service_events_subscribe(handler, context)`.
    ffi.health_service_events_subscribe(handler, context)

when declared(ffi.health_service_events_unsubscribe):
  proc eventsUnsubscribe*(): bool {.inline.} =
    ## Unsubscribe from health service events.
    ## Equivalent to C function `health_service_events_unsubscribe()`.
    ffi.health_service_events_unsubscribe()

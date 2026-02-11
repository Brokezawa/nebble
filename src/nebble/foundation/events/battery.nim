## High-level Nim wrapper for Pebble Battery State Service API.
##
## Provides battery charge state monitoring and event subscriptions.

import nebble/ffi

export ffi.BatteryChargeState, ffi.BatteryStateHandler

# ============================================================================
# Battery State
# ============================================================================

proc state*(): BatteryChargeState {.inline.} =
  ## Get the current battery charge state.
  ## Equivalent to C function `battery_state_service_peek()`.
  result = ffi.battery_state_service_peek()

proc chargePercent*(): uint8 {.inline.} =
  ## Get the battery charge percentage (0-100).
  ## Convenience helper extracting percentage from charge state.
  result = state().charge_percent

proc isCharging*(): bool {.inline.} =
  ## Check if the watch is currently charging.
  ## Convenience helper checking charge state.
  result = state().is_charging.bool

proc isPlugged*(): bool {.inline.} =
  ## Check if the watch is plugged in (on charger).
  ## Convenience helper checking charge state.
  result = state().is_plugged.bool

# ============================================================================
# Battery Events
# ============================================================================

when declared(ffi.battery_state_service_subscribe):
  proc subscribe*(handler: BatteryStateHandler) {.inline.} =
    ## Subscribe to battery state change events.
    ## Equivalent to C function `battery_state_service_subscribe(handler)`.
    ffi.battery_state_service_subscribe(handler)

when declared(ffi.battery_state_service_unsubscribe):
  proc unsubscribe*() {.inline.} =
    ## Unsubscribe from battery state change events.
    ## Equivalent to C function `battery_state_service_unsubscribe()`.
    ffi.battery_state_service_unsubscribe()

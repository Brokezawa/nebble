## High-level Nim wrapper for Pebble Battery State Service API.
##
## Provides access to battery level, charging state, and battery change events.

import nebble/ffi

# ============================================================================
# Battery State Service
# ============================================================================

proc subscribe*(handler: BatteryStateHandler) {.inline.} =
  ## Subscribe to battery state change events.
  ## Equivalent to C function `battery_state_service_subscribe(handler)`.
  ffi.battery_state_service_subscribe(handler)

proc unsubscribe*() {.inline.} =
  ## Unsubscribe from battery state change events.
  ## Equivalent to C function `battery_state_service_unsubscribe()`.
  ffi.battery_state_service_unsubscribe()

proc peek*(): BatteryChargeState {.inline.} =
  ## Get the current battery state without subscribing.
  ## Equivalent to C function `battery_state_service_peek()`.
  ## 
  ## Returns BatteryChargeState with:
  ## - charge_percent: Battery level 0-100
  ## - is_charging: true if currently charging
  ## - is_plugged: true if plugged into power
  ffi.battery_state_service_peek()

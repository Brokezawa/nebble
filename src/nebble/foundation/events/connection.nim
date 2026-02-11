## High-level Nim wrapper for Pebble Connection Service API.
##
## Provides Bluetooth connection state monitoring and event subscriptions.

import nebble/ffi

export ffi.BluetoothConnectionHandler

# ============================================================================
# Connection State
# ============================================================================

proc isConnected*(): bool {.inline.} =
  ## Check if Bluetooth is currently connected to phone.
  ## Equivalent to C function `bluetooth_connection_service_peek()`.
  result = ffi.bluetooth_connection_service_peek()

# ============================================================================
# Connection Events
# ============================================================================

when declared(ffi.bluetooth_connection_service_subscribe):
  proc subscribe*(handler: BluetoothConnectionHandler) {.inline.} =
    ## Subscribe to Bluetooth connection change events.
    ## Equivalent to C function `bluetooth_connection_service_subscribe(handler)`.
    ffi.bluetooth_connection_service_subscribe(handler)

when declared(ffi.bluetooth_connection_service_unsubscribe):
  proc unsubscribe*() {.inline.} =
    ## Unsubscribe from Bluetooth connection change events.
    ## Equivalent to C function `bluetooth_connection_service_unsubscribe()`.
    ffi.bluetooth_connection_service_unsubscribe()

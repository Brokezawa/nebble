## High-level Nim wrapper for Pebble Bluetooth Connection Service API.
##
## Provides access to Bluetooth connection state and connection change events.

import nebble/ffi

# ============================================================================
# Bluetooth Connection Service
# ============================================================================

proc peek*(): bool {.inline.} =
  ## Check if Bluetooth is currently connected.
  ## Equivalent to C function `bluetooth_connection_service_peek()`.
  ## Returns true if Bluetooth is connected.
  ffi.bluetooth_connection_service_peek()

# ============================================================================
# Connection Service (App & PebbleKit)
# ============================================================================

proc peekPebbleApp*(): bool {.inline.} =
  ## Check if the Pebble app (on phone) is connected.
  ## Equivalent to C function `connection_service_peek_pebble_app_connection()`.
  ## Returns true if the Pebble app is connected.
  ffi.connection_service_peek_pebble_app_connection()

proc peekPebbleKit*(): bool {.inline.} =
  ## Check if a PebbleKit connection is active.
  ## Equivalent to C function `connection_service_peek_pebblekit_connection()`.
  ## Returns true if PebbleKit is connected.
  ffi.connection_service_peek_pebblekit_connection()

proc subscribe*(connHandlers: ConnectionHandlers) {.inline.} =
  ## Subscribe to connection state change events.
  ## Equivalent to C function `connection_service_subscribe(conn_handlers)`.
  ffi.connection_service_subscribe(connHandlers)

proc unsubscribe*() {.inline.} =
  ## Unsubscribe from connection state change events.
  ## Equivalent to C function `connection_service_unsubscribe()`.
  ffi.connection_service_unsubscribe()

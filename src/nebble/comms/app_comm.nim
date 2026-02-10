## High-level Nim wrapper for Pebble App Communication API.
##
## Provides control over the Bluetooth communication sniff interval.

import nebble/ffi

export ffi.SniffInterval

# ============================================================================
# Sniff Interval
# ============================================================================

proc setSniffInterval*(interval: SniffInterval) {.inline.} =
  ## Set the Bluetooth sniff interval to save power or reduce latency.
  ## Equivalent to C function `app_comm_set_sniff_interval(interval)`.
  ffi.app_comm_set_sniff_interval(interval)

proc getSniffInterval*(): SniffInterval {.inline.} =
  ## Get the current Bluetooth sniff interval.
  ## Equivalent to C function `app_comm_get_sniff_interval()`.
  ffi.app_comm_get_sniff_interval()

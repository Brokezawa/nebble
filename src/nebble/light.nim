## High-level Nim wrapper for Pebble Light (Backlight) API.
##
## Provides control over the watch backlight.

import nebble/ffi

# ============================================================================
# Backlight Functions
# ============================================================================

proc enableInteraction*() {.inline.} =
  ## Enable the backlight as if the user interacted with the watch.
  ## Equivalent to C function `light_enable_interaction()`.
  ffi.light_enable_interaction()

proc enable*(enable: bool) {.inline.} =
  ## Enable or disable the backlight.
  ## Equivalent to C function `light_enable(enable)`.
  ffi.light_enable(enable)

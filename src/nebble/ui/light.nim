## High-level Nim wrapper for Pebble Light (Backlight) API.
##
## Provides control over the watch backlight.

import nebble/ffi

# ============================================================================
# Backlight Control
# ============================================================================

proc enable*(enabled: bool) {.inline.} =
  ## Enable or disable the backlight.
  ## Equivalent to C function `light_enable(enabled)`.
  ffi.light_enable(enabled)

proc enableInteraction*() {.inline.} =
  ## Enable backlight on button interaction.
  ## Equivalent to C function `light_enable_interaction()`.
  ffi.light_enable_interaction()

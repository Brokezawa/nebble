## High-level Nim wrapper for Pebble Vibes (Vibration) API.
##
## Provides vibration patterns for haptic feedback.

import nebble/ffi

# ============================================================================
# Vibration Functions
# ============================================================================

proc cancel*() {.inline.} =
  ## Cancel any ongoing vibration.
  ## Equivalent to C function `vibes_cancel()`.
  ffi.vibes_cancel()

proc shortPulse*() {.inline.} =
  ## Trigger a short vibration pulse.
  ## Equivalent to C function `vibes_short_pulse()`.
  ffi.vibes_short_pulse()

proc longPulse*() {.inline.} =
  ## Trigger a long vibration pulse.
  ## Equivalent to C function `vibes_long_pulse()`.
  ffi.vibes_long_pulse()

proc doublePulse*() {.inline.} =
  ## Trigger a double vibration pulse.
  ## Equivalent to C function `vibes_double_pulse()`.
  ffi.vibes_double_pulse()

proc enqueueCustomPattern*(pattern: VibePattern) {.inline.} =
  ## Enqueue a custom vibration pattern.
  ## Equivalent to C function `vibes_enqueue_custom_pattern(pattern)`.
  ffi.vibes_enqueue_custom_pattern(pattern)

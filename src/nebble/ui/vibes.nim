## High-level Nim wrapper for Pebble Vibes (Vibration) API.
##
## Provides haptic feedback through vibration patterns.

import nebble/ffi

export ffi.VibePattern

# ============================================================================
# Vibration Patterns
# ============================================================================

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

proc enqueueCustomPattern*(durations: ptr uint32; numSegments: uint32) {.inline.} =
  ## Enqueue a custom vibration pattern.
  ## `durations` is an array of segment durations in milliseconds.
  ## Odd indices are ON durations, even indices are OFF durations.
  ## Example: `[100, 50, 100]` means vibrate 100ms, pause 50ms, vibrate 100ms.
  ## Equivalent to C function `vibes_enqueue_custom_pattern()`.
  let pattern = VibePattern(
    durations: durations,
    num_segments: numSegments
  )
  ffi.vibes_enqueue_custom_pattern(pattern)

proc cancel*() {.inline.} =
  ## Cancel any ongoing vibration.
  ## Equivalent to C function `vibes_cancel()`.
  ffi.vibes_cancel()

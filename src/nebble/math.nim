## High-level Nim wrapper for Pebble Math API.
##
## Provides integer-based trigonometry lookup functions.

import nebble/ffi

# ============================================================================
# Trigonometry Lookup
# ============================================================================

proc sinLookup*(angle: int32): int32 {.inline.} =
  ## Look up the sine of the given angle (in TRIG_MAX_ANGLE units).
  ## Equivalent to C function `sin_lookup(angle)`.
  ffi.sin_lookup(angle)

proc cosLookup*(angle: int32): int32 {.inline.} =
  ## Look up the cosine of the given angle (in TRIG_MAX_ANGLE units).
  ## Equivalent to C function `cos_lookup(angle)`.
  ffi.cos_lookup(angle)

proc atan2Lookup*(y: int16, x: int16): int32 {.inline.} =
  ## Look up the arctangent of y/x.
  ## Equivalent to C function `atan2_lookup(y, x)`.
  ffi.atan2_lookup(y, x)

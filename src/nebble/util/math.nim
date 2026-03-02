## High-level Nim wrapper for Pebble Math utilities.
##
## Provides mathematical functions and constants for Pebble development.

import nebble/ffi

# ============================================================================
# Trigonometry
# ============================================================================

const
  TRIG_MAX_ANGLE* = 0x10000
  ## Maximum Pebble angle value (2 * pi radians = 65536 angle units).
  ## Use this to convert between degrees and Pebble angle units.

  TRIG_MAX_RATIO* = 65535
  ## Maximum value returned by sin_lookup and cos_lookup.
  ## Use this to normalize trig lookup results.

proc trigAngleToDeg*(angle: int32): float32 {.inline.} =
  ## Convert Pebble angle units to degrees.
  ## Equivalent to: `angle * 360.0 / TRIG_MAX_ANGLE`.
  result = float32(angle) * 360.0'f32 / float32(TRIG_MAX_ANGLE)

proc degToTrigAngle*(degrees: float32): int32 {.inline.} =
  ## Convert degrees to Pebble angle units.
  ## Equivalent to: `degrees * TRIG_MAX_ANGLE / 360.0`.
  result = int32(degrees * float32(TRIG_MAX_ANGLE) / 360.0'f32)

proc sinLookup*(angle: int32): int32 {.inline.} =
  ## Compute the sine of an angle in Pebble angle units.
  ## Returns a value in the range [-TRIG_MAX_RATIO, TRIG_MAX_RATIO].
  ## Equivalent to C function `sin_lookup(angle)`.
  result = ffi.sin_lookup(angle)

proc cosLookup*(angle: int32): int32 {.inline.} =
  ## Compute the cosine of an angle in Pebble angle units.
  ## Returns a value in the range [-TRIG_MAX_RATIO, TRIG_MAX_RATIO].
  ## Equivalent to C function `cos_lookup(angle)`.
  result = ffi.cos_lookup(angle)

# ============================================================================
# Integer Math
# ============================================================================

proc abs*(x: int32): int32 {.inline.} =
  ## Absolute value for int32.
  ## Equivalent to C function `abs(x)`.
  if x < 0: -x else: x

proc min*[T](a, b: T): T {.inline.} =
  ## Minimum of two values.
  if a < b: a else: b

proc max*[T](a, b: T): T {.inline.} =
  ## Maximum of two values.
  if a > b: a else: b

proc clamp*[T](value, minVal, maxVal: T): T {.inline.} =
  ## Clamp value between min and max.
  max(minVal, min(value, maxVal))

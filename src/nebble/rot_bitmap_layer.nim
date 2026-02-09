## High-level Nim wrapper for Pebble RotBitmapLayer API.
##
## A layer that displays a bitmap that can be rotated around a pivot point.
## Perfect for analog watch hands, compass needles, gauges, and indicators.

import nebble/ffi

export ffi.RotBitmapLayer

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newRotBitmapLayer*(bitmap: ptr GBitmap): ptr RotBitmapLayer {.inline.} =
  ## Create a new RotBitmapLayer with the specified bitmap.
  ## The bitmap is not copied; it must remain valid for the layer's lifetime.
  ## Equivalent to C function `rot_bitmap_layer_create(bitmap)`.
  ffi.rot_bitmap_layer_create(bitmap)

proc destroy*(layer: ptr RotBitmapLayer) {.inline.} =
  ## Destroy the rotating bitmap layer and free its memory.
  ## Equivalent to C function `rot_bitmap_layer_destroy(layer)`.
  ffi.rot_bitmap_layer_destroy(layer)

# ============================================================================
# Conversion
# ============================================================================

proc getLayer*(layer: ptr RotBitmapLayer): ptr Layer {.inline.} =
  ## Get the underlying Layer for hierarchy operations.
  ## Note: RotBitmapLayer extends Layer, so we can safely cast.
  result = cast[ptr Layer](layer)

# ============================================================================
# Rotation
# ============================================================================

proc setAngle*(layer: ptr RotBitmapLayer; angle: int32) {.inline.} =
  ## Set the rotation angle in Pebble angle units (0 to TRIG_MAX_ANGLE).
  ## 0 = upright, increases clockwise.
  ## Equivalent to C function `rot_bitmap_layer_set_angle(layer, angle)`.
  ffi.rot_bitmap_layer_set_angle(layer, angle)

proc incrementAngle*(layer: ptr RotBitmapLayer; angle: int32) {.inline.} =
  ## Increment (or decrement) the rotation angle by the specified amount.
  ## Positive values rotate clockwise, negative counter-clockwise.
  ## Equivalent to C function `rot_bitmap_layer_increment_angle(layer, angle)`.
  ffi.rot_bitmap_layer_increment_angle(layer, angle)

# ============================================================================
# Appearance
# ============================================================================

proc setCornerClipColor*(layer: ptr RotBitmapLayer; color: GColor) {.inline.} =
  ## Set the color used to fill corners when the rotated bitmap doesn't
  ## cover the entire layer frame.
  ## Equivalent to C function `rot_bitmap_layer_set_corner_clip_color(layer, color)`.
  ffi.rot_bitmap_layer_set_corner_clip_color(layer, color)

proc setCompositingMode*(layer: ptr RotBitmapLayer; mode: GCompOp) {.inline.} =
  ## Set the compositing mode for blending the rotated bitmap.
  ## Equivalent to C function `rot_bitmap_set_compositing_mode(layer, mode)`.
  ffi.rot_bitmap_set_compositing_mode(layer, mode)

proc setSrcIc*(layer: ptr RotBitmapLayer; ic: GPoint) {.inline.} =
  ## Set the pivot point (center of rotation) in source bitmap coordinates.
  ## Default is center of bitmap. The ic point will stay fixed during rotation.
  ## Equivalent to C function `rot_bitmap_set_src_ic(layer, ic)`.
  ffi.rot_bitmap_set_src_ic(layer, ic)

# ============================================================================
# Nim-idiomatic Helpers
# ============================================================================

type
  RotationAnchor* = enum
    ## Common rotation anchor points
    raCenter,      ## Rotate around bitmap center
    raTop,         ## Rotate around top center
    raBottom,      ## Rotate around bottom center
    raLeft,        ## Rotate around left center
    raRight,       ## Rotate around right center
    raTopLeft,     ## Rotate around top-left corner
    raTopRight,    ## Rotate around top-right corner
    raBottomLeft,  ## Rotate around bottom-left corner
    raBottomRight  ## Rotate around bottom-right corner

proc setAnchor*(layer: ptr RotBitmapLayer; bitmap: ptr GBitmap; anchor: RotationAnchor) {.inline.} =
  ## Set the rotation anchor point using common positions.
  ## Convenience helper that calculates the correct ic point.
  let bounds = ffi.gbitmap_get_bounds(bitmap)
  let w = bounds.size.w.int16
  let h = bounds.size.h.int16
  let halfW = int16(w shr 1)
  let halfH = int16(h shr 1)
  let ic = case anchor
    of raCenter:      makeGPoint(halfW, halfH)
    of raTop:         makeGPoint(halfW, 0)
    of raBottom:      makeGPoint(halfW, h)
    of raLeft:        makeGPoint(0, halfH)
    of raRight:       makeGPoint(w, halfH)
    of raTopLeft:     makeGPoint(0, 0)
    of raTopRight:    makeGPoint(w, 0)
    of raBottomLeft:  makeGPoint(0, h)
    of raBottomRight: makeGPoint(w, h)
  setSrcIc(layer, ic)

proc setAngleDeg*(layer: ptr RotBitmapLayer; degrees: float32) {.inline.} =
  ## Set rotation angle in degrees (0-360).
  ## Convenience wrapper that converts to Pebble angle units.
  let angle = int32(degrees * 65536.0'f32 / 360.0'f32)
  setAngle(layer, angle)

proc incrementAngleDeg*(layer: ptr RotBitmapLayer; degrees: float32) {.inline.} =
  ## Increment rotation angle by degrees.
  ## Convenience wrapper that converts to Pebble angle units.
  let angle = int32(degrees * 65536.0'f32 / 360.0'f32)
  incrementAngle(layer, angle)

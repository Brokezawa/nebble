## ARC-Managed RotBitmapLayer Handle
##
## Provides automatic memory management for rotating bitmap layers.
## Perfect for watch hands, compass needles, gauges, and animated indicators.
##
## **Key Features:**
## - Automatic destruction when handle goes out of scope
## - Move semantics (no copying)
## - Property accessors for angle, pivot point, colors
## - Degree-based rotation helpers
##
## **Usage Example:**
##   ```nim
##   import nebble/ui/rot_bitmap_layer
##   
##   var handLayer: RotBitmapLayerHandle
##   
##   proc windowLoad(win: ptr Window) {.cdecl.} =
##     let handBitmap = newBitmap(RESOURCE_ID_HAND)
##     handLayer = newRotBitmapLayer(handBitmap)
##     
##     # Set rotation anchor to bottom center (like a watch hand)
##     handLayer.setAnchor(handBitmap, raBottom)
##     
##     # Position at screen center
##     handLayer.getLayer().frame = makeGRect(72, 84, 20, 60)
##     
##     win.rootLayer.addChild(handLayer.getLayer())
##     
##     # Rotate to 90 degrees
##     handLayer.angleDeg = 90.0
##   ```

import nebble/ffi
import nebble/ffi/managed

export ffi.RotBitmapLayer

# ============================================================================
# Types
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

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(RotBitmapLayer, RotBitmapLayer, 
                   rot_bitmap_layer_create, rot_bitmap_layer_destroy)

# ============================================================================
# Constructors
# ============================================================================

proc newRotBitmapLayerHandle*(bitmap: ptr GBitmap): RotBitmapLayerHandle {.inline.} =
  wrapOwned(ffi.rot_bitmap_layer_create(bitmap))


proc newRotBitmapLayer*(bitmap: ptr GBitmap): RotBitmapLayerHandle {.inline.} =
  ## Alias for `newRotBitmapLayerHandle`.
  result = newRotBitmapLayerHandle(bitmap)

# ============================================================================
# Layer Access
# ============================================================================

proc getLayer*(h: RotBitmapLayerHandle): ptr Layer {.inline.} =
  ## Get the underlying Layer pointer for adding to parent.
  ## Note: RotBitmapLayer extends Layer, so we can safely cast.
  ##
  ## **Example:**
  ##   win.rootLayer.addChild(handLayer.getLayer())
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  cast[ptr Layer](h.toPtr)

# ============================================================================
# Rotation Properties
# ============================================================================

proc `angle=`*(h: var RotBitmapLayerHandle, angle: int32) {.inline.} =
  ## Set rotation angle in Pebble angle units (0 to TRIG_MAX_ANGLE).
  ## 0 = upright, increases clockwise.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  rot_bitmap_layer_set_angle(h.toPtr, angle)

proc incrementAngle*(h: var RotBitmapLayerHandle, delta: int32) {.inline.} =
  ## Increment (or decrement) rotation angle.
  ## Positive values rotate clockwise, negative counter-clockwise.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  rot_bitmap_layer_increment_angle(h.toPtr, delta)

proc `angleDeg=`*(h: var RotBitmapLayerHandle, degrees: float32) {.inline.} =
  ## Set rotation angle in degrees (0-360).
  ## Convenience wrapper that converts to Pebble angle units.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  let angle = int32(degrees * TRIG_MAX_ANGLE.float32 / 360.0'f32)
  rot_bitmap_layer_set_angle(h.toPtr, angle)

proc incrementAngleDeg*(h: var RotBitmapLayerHandle, degrees: float32) {.inline.} =
  ## Increment rotation angle by degrees.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  let angle = int32(degrees * TRIG_MAX_ANGLE.float32 / 360.0'f32)
  rot_bitmap_layer_increment_angle(h.toPtr, angle)

# ============================================================================
# Pivot Point (Rotation Center)
# ============================================================================

proc `pivot=`*(h: var RotBitmapLayerHandle, point: GPoint) {.inline.} =
  ## Set the pivot point (center of rotation) in source bitmap coordinates.
  ## Default is center of bitmap. This point stays fixed during rotation.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  rot_bitmap_set_src_ic(h.toPtr, point)

proc setAnchor*(h: var RotBitmapLayerHandle, bitmap: ptr GBitmap, anchor: RotationAnchor) {.inline.} =
  ## Set the rotation anchor point using common positions.
  ##
  ## **Parameters:**
  ## - `bitmap`: The bitmap to get dimensions from
  ## - `anchor`: One of the predefined anchor positions (center, corners, edges)
  ##
  ## **Example:**
  ##   # For a watch hand, anchor at bottom center
  ##   handLayer.setAnchor(bitmap, raBottom)
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  let bounds = gbitmap_get_bounds(bitmap)
  let w = bounds.size.w.int16
  let height = bounds.size.h.int16
  let halfW = int16(w shr 1)
  let halfH = int16(height shr 1)
  let ic = case anchor
    of raCenter:      makeGPoint(halfW, halfH)
    of raTop:         makeGPoint(halfW, 0)
    of raBottom:      makeGPoint(halfW, height)
    of raLeft:        makeGPoint(0, halfH)
    of raRight:       makeGPoint(w, halfH)
    of raTopLeft:     makeGPoint(0, 0)
    of raTopRight:    makeGPoint(w, 0)
    of raBottomLeft:  makeGPoint(0, height)
    of raBottomRight: makeGPoint(w, height)
  rot_bitmap_set_src_ic(h.toPtr, ic)

# ============================================================================
# Appearance
# ============================================================================

proc `cornerClipColor=`*(h: var RotBitmapLayerHandle, color: GColor) {.inline.} =
  ## Set the color used to fill corners when rotated bitmap doesn't fill layer.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  rot_bitmap_layer_set_corner_clip_color(h.toPtr, color)

proc `compositingMode=`*(h: var RotBitmapLayerHandle, mode: GCompOp) {.inline.} =
  ## Set the compositing mode for blending the rotated bitmap.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  rot_bitmap_set_compositing_mode(h.toPtr, mode)

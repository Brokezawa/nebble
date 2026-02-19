## ARC-Managed GPath Handle
##
## Provides automatic memory management for GPath objects using Nim's ARC
## (Automatic Reference Counting) system.
##
## **Key Features:**
## - Automatic destruction when handle goes out of scope
## - Move semantics (no copying)
## - Property-style accessors for stroke/fill colors and stroke width
## - Drawing methods that work with graphics context
##
## **Usage Example:**
##   ```nim
##   import nebble/graphics/gpath
##   
##   # Define triangle path
##   var trianglePoints = [
##     makeGPoint(72, 40),   # Top
##     makeGPoint(40, 100),  # Bottom left
##     makeGPoint(104, 100)  # Bottom right
##   ]
##   
##   var path = newGPath(
##     GPathInfo(numPoints: 3, points: addr trianglePoints[0])
##   )
##   
##   # In layer update proc:
##   path.drawFilled(ctx)
##   path.drawOutline(ctx)
##   ```

import nebble/ffi
import nebble/ffi/managed

export ffi.GPath, ffi.GPathInfo

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(GPath, GPath, gpath_create, gpath_destroy)

# ============================================================================
# Constructors
# ============================================================================

proc newGPathHandle*(pathInfo: ptr GPathInfo): GPathHandle {.inline.} =
  result = wrapOwned(ffi.gpath_create(pathInfo))

proc newGPath*(pathInfo: ptr GPathInfo): GPathHandle {.inline.} =
  result = newGPathHandle(pathInfo)

proc newGPathHandle*(points: openArray[GPoint]): GPathHandle {.inline.} =
  let info = GPathInfo(num_points: points.len.uint32, points: addr points[0])
  result = wrapOwned(ffi.gpath_create(addr info))

proc newGPath*(points: openArray[GPoint]): GPathHandle {.inline.} =
  ## Alias for `newGPathHandle`.
  result = newGPathHandle(points)

# ============================================================================
# Drawing Operations
# ============================================================================

proc drawFilled*(h: GPathHandle, ctx: ptr GContext) {.inline.} =
  ## Draw the filled interior of the path.
  if h.pRaw == nil: return
  gpath_draw_filled(ctx, h.toPtr)

proc drawOutline*(h: GPathHandle, ctx: ptr GContext) {.inline.} =
  ## Draw the outline of the path (closed).
  if h.pRaw == nil: return
  gpath_draw_outline(ctx, h.toPtr)

proc drawOutlineOpen*(h: GPathHandle, ctx: ptr GContext) {.inline.} =
  ## Draw the outline of the path (open, doesn't close the path).
  if h.pRaw == nil: return
  gpath_draw_outline_open(ctx, h.toPtr)

# ============================================================================
# Transformations
# ============================================================================

proc rotateTo*(h: GPathHandle, angle: int32) {.inline.} =
  ## Set the rotation of the path.
  ##
  ## **Parameters:**
  ## - `angle`: Rotation angle in normalized units (0 to TRIG_MAX_ANGLE)
  if h.pRaw == nil: return
  gpath_rotate_to(h.toPtr, angle)

proc moveTo*(h: GPathHandle, point: GPoint) {.inline.} =
  ## Move the origin of the path to a new position.
  if h.pRaw == nil: return
  gpath_move_to(h.toPtr, point)

# ============================================================================
# Utility Helpers
# ============================================================================

proc draw*(h: GPathHandle, ctx: ptr GContext, filled: bool = true) {.inline.} =
  ## Draw the path with optional fill.
  ##
  ## **Parameters:**
  ## - `filled`: If true, draws filled interior; if false, draws outline only
  if h.pRaw == nil: return
  if filled:
    gpath_draw_filled(ctx, h.toPtr)
  else:
    gpath_draw_outline(ctx, h.toPtr)

proc rotate*(h: GPathHandle, degrees: int32) {.inline.} =
  ## Rotate the path by degrees (convenience wrapper).
  ##
  ## Converts degrees to Pebble's normalized angle units automatically.
  ## 360 degrees = TRIG_MAX_ANGLE (65536)
  if h.pRaw == nil: return
  let angle = (degrees.int64 * TRIG_MAX_ANGLE.int64 div 360).int32
  gpath_rotate_to(h.toPtr, angle)

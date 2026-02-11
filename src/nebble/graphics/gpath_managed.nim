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
##   import nebble/graphics/gpath_managed
##   
##   # Define triangle path
##   var trianglePoints = [
##     makeGPoint(72, 40),   # Top
##     makeGPoint(40, 100),  # Bottom left
##     makeGPoint(104, 100)  # Bottom right
##   ]
##   
##   var path = newGPathHandle(
##     GPathInfo(numPoints: 3, points: addr trianglePoints[0])
##   )
##   
##   path.fillColor = GColorVividCerulean
##   path.strokeColor = GColorWhite
##   path.strokeWidth = 3
##   
##   # In layer update proc:
##   path.drawFilled(ctx)
##   path.drawOutline(ctx)
##   ```

import nebble/ffi
import nebble/ffi/managed
import nebble/graphics/gpath

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(GPath, GPath, gpath_create, gpath_destroy)

# ============================================================================
# Constructors
# ============================================================================

proc newGPathHandle*(pathInfo: ptr GPathInfo): GPathHandle {.inline.} =
  ## Create a new managed GPath.
  ##
  ## **Parameters:**
  ## - `pathInfo`: Pointer to GPathInfo struct defining the path
  ##
  ## **Example:**
  ##   var points = [makeGPoint(0, 0), makeGPoint(50, 50), makeGPoint(100, 0)]
  ##   var path = newGPathHandle(GPathInfo(numPoints: 3, points: addr points[0]))
  ##
  ## **Memory Safety:** The returned handle owns the GPath. It will be
  ## automatically destroyed when the handle goes out of scope or is reassigned.
  result = GPathHandle(gpath_create(pathInfo))

proc newGPathHandle*(points: openArray[GPoint]): GPathHandle {.inline.} =
  ## Create a new managed GPath from an array of points.
  ##
  ## **Note:** The points array must remain valid for the lifetime of the path.
  ## Use this for static/module-level point arrays only.
  ##
  ## **Example:**
  ##   var triangle = [makeGPoint(72, 40), makeGPoint(40, 100), makeGPoint(104, 100)]
  ##   var path = newGPathHandle(triangle)
  let info = GPathInfo(num_points: points.len.uint32, points: unsafeAddr points[0])
  result = GPathHandle(gpath_create(addr info))

# ============================================================================
# Drawing Operations
# ============================================================================

proc drawFilled*(h: GPathHandle, ctx: ptr GContext) {.inline.} =
  ## Draw the filled interior of the path.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  gpath_draw_filled(ctx, h.toPtr)

proc drawOutline*(h: GPathHandle, ctx: ptr GContext) {.inline.} =
  ## Draw the outline of the path (closed).
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  gpath_draw_outline(ctx, h.toPtr)

proc drawOutlineOpen*(h: GPathHandle, ctx: ptr GContext) {.inline.} =
  ## Draw the outline of the path (open, doesn't close the path).
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  gpath_draw_outline_open(ctx, h.toPtr)

# ============================================================================
# Transformations
# ============================================================================

proc rotateTo*(h: GPathHandle, angle: int32) {.inline.} =
  ## Set the rotation of the path.
  ##
  ## **Parameters:**
  ## - `angle`: Rotation angle in normalized units (0 to TRIG_MAX_ANGLE)
  ##
  ## **Example:**
  ##   path.rotateTo(TRIG_MAX_ANGLE div 4)  # Rotate 90 degrees
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  gpath_rotate_to(h.toPtr, angle)

proc moveTo*(h: GPathHandle, point: GPoint) {.inline.} =
  ## Move the origin of the path to a new position.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  gpath_move_to(h.toPtr, point)

# ============================================================================
# Utility Helpers
# ============================================================================

proc draw*(h: GPathHandle, ctx: ptr GContext, filled: bool = true) {.inline.} =
  ## Draw the path with optional fill.
  ##
  ## **Parameters:**
  ## - `filled`: If true, draws filled interior; if false, draws outline only
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  if filled:
    gpath_draw_filled(ctx, h.toPtr)
  else:
    gpath_draw_outline(ctx, h.toPtr)

proc rotate*(h: GPathHandle, degrees: int32) {.inline.} =
  ## Rotate the path by degrees (convenience wrapper).
  ##
  ## Converts degrees to Pebble's normalized angle units automatically.
  ## 360 degrees = TRIG_MAX_ANGLE (65535)
  ##
  ## **Example:**
  ##   path.rotate(90)  # Rotate 90 degrees clockwise
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  let angle = (degrees.int64 * TRIG_MAX_ANGLE.int64 div 360).int32
  gpath_rotate_to(h.toPtr, angle)

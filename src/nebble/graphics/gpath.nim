## High-level Nim wrapper for Pebble GPath API.
##
## Provides vector graphics path drawing and manipulation.

import nebble/ffi

export ffi.GPath, ffi.GPathInfo

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newGPath*(pathInfo: ptr GPathInfo): ptr GPath {.inline.} =
  ## Create a new GPath from path info.
  ## Equivalent to C function `gpath_create(init)`.
  ffi.gpath_create(pathInfo)

proc destroy*(path: ptr GPath) {.inline.} =
  ## Destroy a GPath and free its memory.
  ## Equivalent to C function `gpath_destroy(gpath)`.
  ffi.gpath_destroy(path)

# ============================================================================
# Drawing
# ============================================================================

proc drawFilled*(ctx: ptr GContext, path: ptr GPath) {.inline.} =
  ## Draw the filled interior of a GPath.
  ## Equivalent to C function `gpath_draw_filled(ctx, path)`.
  ffi.gpath_draw_filled(ctx, path)

proc drawOutline*(ctx: ptr GContext, path: ptr GPath) {.inline.} =
  ## Draw the outline of a GPath (closed).
  ## Equivalent to C function `gpath_draw_outline(ctx, path)`.
  ffi.gpath_draw_outline(ctx, path)

proc drawOutlineOpen*(ctx: ptr GContext, path: ptr GPath) {.inline.} =
  ## Draw the outline of a GPath (open).
  ## Equivalent to C function `gpath_draw_outline_open(ctx, path)`.
  ffi.gpath_draw_outline_open(ctx, path)

# ============================================================================
# Transformation
# ============================================================================

proc rotateTo*(path: ptr GPath, angle: int32) {.inline.} =
  ## Set the rotation of a GPath.
  ## Equivalent to C function `gpath_rotate_to(path, angle)`.
  ffi.gpath_rotate_to(path, angle)

proc moveTo*(path: ptr GPath, point: GPoint) {.inline.} =
  ## Move the origin of a GPath.
  ## Equivalent to C function `gpath_move_to(path, point)`.
  ffi.gpath_move_to(path, point)

## High-level idiomatic Nim API for Pebble graphics and drawing.
##
## This module provides wrappers for graphics context drawing operations,
## GBitmap management, and color handling.

import nebble/ffi
export GContext, GColor, GTextAlignment, GAlign, GCornerMask

# ============================================================================
# Drawing: Text
# ============================================================================

proc drawText*(ctx: ptr GContext, text: cstring, font: GFont, box: GRect,
               overflow: GTextOverflowMode, alignment: GTextAlignment,
               textAttributes: ptr GTextAttributes = nil) {.inline.} =
  ## Draw text in a box with specified font, alignment, and overflow mode.
  ## Equivalent to C function `graphics_draw_text(...)`.
  ffi.graphics_draw_text(ctx, text, font, box, overflow, alignment, textAttributes)

# ============================================================================
# Drawing: Lines and Shapes
# ============================================================================

proc drawLine*(ctx: ptr GContext, p0, p1: GPoint) {.inline.} =
  ## Draw a line from p0 to p1.
  ## Equivalent to C function `graphics_draw_line(ctx, p0, p1)`.
  ffi.graphics_draw_line(ctx, p0, p1)

proc drawRect*(ctx: ptr GContext, rect: GRect) {.inline.} =
  ## Draw a rectangle outline.
  ## Equivalent to C function `graphics_draw_rect(ctx, rect)`.
  ffi.graphics_draw_rect(ctx, rect)

proc fillRect*(ctx: ptr GContext, rect: GRect) {.inline.} =
  ## Fill a rectangle.
  ## Equivalent to C function `graphics_fill_rect(ctx, rect, 0, GCornerNone)`.
  ffi.graphics_fill_rect(ctx, rect, 0, GCornerNone)

proc fillRectRounded*(ctx: ptr GContext, rect: GRect, radius: uint16,
                      corners: GCornerMask) {.inline.} =
  ## Fill a rectangle with rounded corners.
  ## Equivalent to C function `graphics_fill_rect(ctx, rect, radius, corners)`.
  ffi.graphics_fill_rect(ctx, rect, radius, corners)

proc drawCircle*(ctx: ptr GContext, center: GPoint, radius: uint16) {.inline.} =
  ## Draw a circle outline.
  ## Equivalent to C function `graphics_draw_circle(ctx, center, radius)`.
  ffi.graphics_draw_circle(ctx, center, radius)

proc fillCircle*(ctx: ptr GContext, center: GPoint, radius: uint16) {.inline.} =
  ## Fill a circle.
  ## Equivalent to C function `graphics_fill_circle(ctx, center, radius)`.
  ffi.graphics_fill_circle(ctx, center, radius)

proc drawRoundRect*(ctx: ptr GContext, rect: GRect, radius: uint16) {.inline.} =
  ## Draw a rounded rectangle outline.
  ## Equivalent to C function `graphics_draw_round_rect(ctx, rect, radius)`.
  ffi.graphics_draw_round_rect(ctx, rect, radius)

# ============================================================================
# Drawing: Pixel
# ============================================================================

proc drawPixel*(ctx: ptr GContext, point: GPoint) {.inline.} =
  ## Draw a single pixel.
  ## Equivalent to C function `graphics_draw_pixel(ctx, point)`.
  ffi.graphics_draw_pixel(ctx, point)

# ============================================================================
# Drawing: Bitmap
# ============================================================================

proc drawBitmap*(ctx: ptr GContext, bitmap: ptr GBitmap, box: GRect) {.inline.} =
  ## Draw a bitmap in a box.
  ## Equivalent to C function `graphics_draw_bitmap_in_rect(ctx, bitmap, box)`.
  ffi.graphics_draw_bitmap_in_rect(ctx, bitmap, box)

proc drawRotatedBitmap*(ctx: ptr GContext, bitmap: ptr GBitmap,
                        srcImageCenter: GPoint,
                        rotation: int32,
                        destImageCenter: GPoint) {.inline.} =
  ## Draw a rotated bitmap.
  ## `srcImageCenter` is the center point in the source bitmap coordinates.
  ## `destImageCenter` is where to draw the center on the screen.
  ## Equivalent to C function `graphics_draw_rotated_bitmap(...)`.
  ffi.graphics_draw_rotated_bitmap(ctx, bitmap, srcImageCenter, rotation.cint, destImageCenter)

# ============================================================================
# Graphics Context Properties
# ============================================================================

proc `strokeColor=`*(ctx: ptr GContext, color: GColor8) {.inline.} =
  ## Set the stroke color for drawing operations.
  ## Equivalent to C function `graphics_context_set_stroke_color(ctx, color)`.
  ffi.graphics_context_set_stroke_color(ctx, color)

proc `fillColor=`*(ctx: ptr GContext, color: GColor8) {.inline.} =
  ## Set the fill color for drawing operations.
  ## Equivalent to C function `graphics_context_set_fill_color(ctx, color)`.
  ffi.graphics_context_set_fill_color(ctx, color)

proc `textColor=`*(ctx: ptr GContext, color: GColor8) {.inline.} =
  ## Set the text color for drawing operations.
  ## Equivalent to C function `graphics_context_set_text_color(ctx, color)`.
  ffi.graphics_context_set_text_color(ctx, color)

proc `strokeWidth=`*(ctx: ptr GContext, width: uint8) {.inline.} =
  ## Set the stroke width for line drawing.
  ## Equivalent to C function `graphics_context_set_stroke_width(ctx, width)`.
  ffi.graphics_context_set_stroke_width(ctx, width)

proc `antialiased=`*(ctx: ptr GContext, enable: bool) {.inline.} =
  ## Enable or disable antialiasing (color platforms only).
  ## Equivalent to C function `graphics_context_set_antialiased(ctx, enable)`.
  ffi.graphics_context_set_antialiased(ctx, enable)

# ============================================================================
# GBitmap
# ============================================================================

proc newBitmap*(resourceId: uint32): ptr GBitmap {.inline.} =
  ## Create a GBitmap from a resource ID.
  ## The caller is responsible for calling `destroy()` when done.
  ## Equivalent to C function `gbitmap_create_with_resource(resource_id)`.
  ffi.gbitmap_create_with_resource(resourceId)

proc newBitmapFromData*(data: ptr uint8): ptr GBitmap {.inline.} =
  ## Create a GBitmap from raw bitmap data.
  ## Equivalent to C function `gbitmap_create_from_png_data(data, size)`.
  ffi.gbitmap_create_from_png_data(data, 0) # Size is embedded in PNG data

proc destroy*(bitmap: ptr GBitmap) {.inline.} =
  ## Destroy a GBitmap and free its memory.
  ## Equivalent to C function `gbitmap_destroy(bitmap)`.
  ffi.gbitmap_destroy(bitmap)

proc bounds*(bitmap: ptr GBitmap): GRect {.inline.} =
  ## Get the bounds of a GBitmap.
  ## Equivalent to C function `gbitmap_get_bounds(bitmap)`.
  ffi.gbitmap_get_bounds(bitmap)

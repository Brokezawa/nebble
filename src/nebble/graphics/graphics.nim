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

proc textContentSize*(text: cstring, font: GFont, box: GRect,
                      overflow: GTextOverflowMode, alignment: GTextAlignment): GSize {.inline.} =
  ## Calculate the content size of text layout.
  ## Useful for dynamically sizing text layers.
  ## Equivalent to C function `graphics_text_layout_get_content_size(...)`.
  result = ffi.graphics_text_layout_get_content_size(text, font, box, overflow, alignment)

proc textContentSize*(text: cstring, font: GFont, box: GRect,
                      overflow: GTextOverflowMode, alignment: GTextAlignment,
                      textAttributes: ptr GTextAttributes): GSize {.inline.} =
  ## Calculate the content size of text layout with attributes.
  ## Useful for dynamically sizing text layers.
  ## Equivalent to C function `graphics_text_layout_get_content_size_with_attributes(...)`.
  result = ffi.graphics_text_layout_get_content_size_with_attributes(text, font, box, overflow, alignment, textAttributes)

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
  result = ffi.gbitmap_get_bounds(bitmap)

proc `bounds=`*(bitmap: ptr GBitmap; newBounds: GRect) {.inline.} =
  ## Set the bounds of a GBitmap.
  ## Equivalent to C function `gbitmap_set_bounds(bitmap, new_bounds)`.
  ffi.gbitmap_set_bounds(bitmap, newBounds)

proc bytesPerRow*(bitmap: ptr GBitmap): uint16 {.inline.} =
  ## Get the number of bytes per row in the bitmap data.
  ## Equivalent to C function `gbitmap_get_bytes_per_row(bitmap)`.
  result = ffi.gbitmap_get_bytes_per_row(bitmap)

proc format*(bitmap: ptr GBitmap): GBitmapFormat {.inline.} =
  ## Get the pixel format of the bitmap.
  ## Equivalent to C function `gbitmap_get_format(bitmap)`.
  result = ffi.gbitmap_get_format(bitmap)

proc data*(bitmap: ptr GBitmap): pointer {.inline.} =
  ## Get a pointer to the raw bitmap data.
  ## Equivalent to C function `gbitmap_get_data(bitmap)`.
  result = ffi.gbitmap_get_data(bitmap)

proc palette*(bitmap: ptr GBitmap): ptr GColor {.inline.} =
  ## Get the color palette for palette-based bitmaps.
  ## Equivalent to C function `gbitmap_get_palette(bitmap)`.
  result = ffi.gbitmap_get_palette(bitmap)

# ============================================================================
# Advanced GBitmap Constructors
# ============================================================================

proc createBlank*(size: GSize; format: GBitmapFormat): ptr GBitmap {.inline.} =
  ## Create a blank bitmap with the specified size and format.
  ## Used for offscreen rendering or as a frame buffer for animations.
  ## Returns nil if allocation fails.
  ## Equivalent to C function `gbitmap_create_blank(size, format)`.
  result = ffi.gbitmap_create_blank(size, format)

proc createBlankWithPalette*(size: GSize; format: GBitmapFormat;
                             palette: ptr GColor; freeOnDestroy: bool): ptr GBitmap {.inline.} =
  ## Create a blank bitmap with a custom color palette.
  ## `palette` must remain valid for the bitmap's lifetime unless freeOnDestroy is true.
  ## Equivalent to C function `gbitmap_create_blank_with_palette(size, format, palette, free_on_destroy)`.
  result = ffi.gbitmap_create_blank_with_palette(size, format, palette, freeOnDestroy)

proc createAsSubBitmap*(baseBitmap: ptr GBitmap; subRect: GRect): ptr GBitmap {.inline.} =
  ## Create a sub-bitmap that references a portion of another bitmap.
  ## The sub-bitmap does not own the data; baseBitmap must remain valid.
  ## Equivalent to C function `gbitmap_create_as_sub_bitmap(base_bitmap, sub_rect)`.
  result = ffi.gbitmap_create_as_sub_bitmap(baseBitmap, subRect)

proc createWithData*(data: ptr uint8): ptr GBitmap {.inline.} =
  ## Create a bitmap from existing raw pixel data.
  ## `data` must remain valid for the bitmap's lifetime.
  ## Equivalent to C function `gbitmap_create_with_data(data)`.
  result = ffi.gbitmap_create_with_data(data)

# ============================================================================
# Geometry Utilities
# ============================================================================

proc inset*(rect: GRect; insets: GEdgeInsets): GRect {.inline.} =
  ## Returns a GRect inset by the given edge insets.
  ## Equivalent to C function `grect_inset(rect, insets)`.
  result = ffi.grect_inset(rect, insets)

proc containsPoint*(rect: GRect; point: GPoint): bool {.inline.} =
  ## Check if a point is inside a rectangle.
  ## Equivalent to C function `grect_contains_point(&rect, &point)`.
  result = ffi.grect_contains_point(addr rect, addr point)

proc alignRect*(rect: var GRect; insideRect: GRect; alignment: GAlign;
                  clip: bool = true) {.inline.} =
  ## Align a rectangle inside another rectangle (modifies rect in place).
  ## Equivalent to C function `grect_align(&rect, &inside_rect, alignment, clip)`.
  ffi.grect_align(addr rect, addr insideRect, alignment, clip)

proc centerPoint*(rect: GRect): GPoint {.inline.} =
  ## Get the center point of a rectangle.
  ## Equivalent to C function `grect_center_point(&rect)`.
  result = ffi.grect_center_point(addr rect)

proc clip*(rect: var GRect; clipRect: GRect) {.inline.} =
  ## Clip a rectangle to another rectangle (modifies rect in place).
  ## The resulting rectangle is the intersection of the two rectangles.
  ## Equivalent to C function `grect_clip(&rect, &clip_rect)`.
  ffi.grect_clip(addr rect, addr clipRect)

proc crop*(rect: GRect; cropSizePx: int32): GRect {.inline.} =
  ## Return a new rectangle cropped by the specified number of pixels on each side.
  ## Equivalent to C function `grect_crop(rect, crop_size_px)`.
  result = ffi.grect_crop(rect, cropSizePx)

proc standardize*(rect: var GRect) {.inline.} =
  ## Standardize a rectangle in place (ensures size.w and size.h are non-negative).
  ## Equivalent to C function `grect_standardize(&rect)`.
  ffi.grect_standardize(addr rect)

proc fromPolar*(rect: GRect; scaleMode: GOvalScaleMode; angle: int32): GPoint {.inline.} =
  ## Calculate a point from polar coordinates within a rectangle.
  ## The point is on an ellipse fitted to the rectangle.
  ## Angle is in Pebble angle units (0 to TRIG_MAX_ANGLE).
  ## `scaleMode` determines how the ellipse is fitted to the rectangle.
  ## Equivalent to C function `gpoint_from_polar(&rect, scale_mode, angle)`.
  result = ffi.gpoint_from_polar(rect, scaleMode, angle)

proc centeredFromPolar*(rect: GRect; scaleMode: GOvalScaleMode; angle: int32; size: GSize): GRect {.inline.} =
  ## Create a rectangle centered at a polar coordinate within another rectangle.
  ## Useful for placing items in a circle or ellipse.
  ## Equivalent to C function `grect_centered_from_polar(&rect, scale_mode, angle, size)`.
  result = ffi.grect_centered_from_polar(rect, scaleMode, angle, size)

# ============================================================================
# Framebuffer Access (Advanced - Use with caution)
# ============================================================================

proc captureFrameBuffer*(ctx: ptr GContext): ptr GBitmap {.inline.} =
  ## Capture the framebuffer for direct pixel access.
  ## Returns a GBitmap pointing to the framebuffer memory.
  ## Must call releaseFrameBuffer() when done.
  ## ⚠️ Advanced use only - improper use can crash the app.
  ## Equivalent to C function `graphics_capture_frame_buffer(ctx)`.
  result = ffi.graphics_capture_frame_buffer(ctx)

proc captureFrameBufferFormat*(ctx: ptr GContext; format: GBitmapFormat): ptr GBitmap {.inline.} =
  ## Capture the framebuffer with a specific format.
  ## Returns a GBitmap pointing to the framebuffer memory.
  ## Must call releaseFrameBuffer() when done.
  ## ⚠️ Advanced use only - improper use can crash the app.
  ## Equivalent to C function `graphics_capture_frame_buffer_format(ctx, format)`.
  result = ffi.graphics_capture_frame_buffer_format(ctx, format)

proc releaseFrameBuffer*(ctx: ptr GContext; bitmap: ptr GBitmap): bool {.inline.} =
  ## Release the captured framebuffer.
  ## Must be called after captureFrameBuffer() to prevent display corruption.
  ## Returns true on success.
  ## ⚠️ Advanced use only.
  ## Equivalent to C function `graphics_release_frame_buffer(ctx, bitmap)`.
  result = ffi.graphics_release_frame_buffer(ctx, bitmap)

proc isFrameBufferCaptured*(ctx: ptr GContext): bool {.inline.} =
  ## Check if the framebuffer is currently captured.
  ## Useful for verifying state before drawing operations.
  ## Equivalent to C function `graphics_frame_buffer_is_captured(ctx)`.
  result = ffi.graphics_frame_buffer_is_captured(ctx)

# ============================================================================
# Advanced Drawing: Arcs and Radial Fills
# ============================================================================

proc drawArc*(ctx: ptr GContext; rect: GRect; scaleMode: GOvalScaleMode; angleStart: int32; angleEnd: int32) {.inline.} =
  ## Draw an arc (outline) within a rectangle.
  ## `angleStart` and `angleEnd` are in Pebble angle units (0 to TRIG_MAX_ANGLE).
  ## `scaleMode` determines how the arc is fitted to the rectangle.
  ## Useful for circular progress indicators or gauges.
  ## Equivalent to C function `graphics_draw_arc(ctx, rect, scale_mode, angle_start, angle_end)`.
  ffi.graphics_draw_arc(ctx, rect, scaleMode, angleStart, angleEnd)

proc fillRadial*(ctx: ptr GContext; rect: GRect; scaleMode: GOvalScaleMode; insetThick: uint16; angleStart: int32; angleEnd: int32) {.inline.} =
  ## Fill a radial section (pie slice) within a rectangle.
  ## `angleStart` and `angleEnd` are in Pebble angle units (0 to TRIG_MAX_ANGLE).
  ## `scaleMode` determines how the arc is fitted to the rectangle.
  ## `insetThick` creates a hollow effect (0 for filled, >0 for ring thickness).
  ## Useful for pie charts, circular progress, or gauge fills.
  ## Equivalent to C function `graphics_fill_radial(ctx, rect, scale_mode, inset_thickness, angle_start, angle_end)`.
  ffi.graphics_fill_radial(ctx, rect, scaleMode, insetThick, angleStart, angleEnd)

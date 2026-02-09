## High-level Nim wrapper for Pebble BitmapLayer API.
##
## A BitmapLayer displays a bitmap image. It provides alignment, background
## color, and compositing mode control.

import nebble/ffi

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newBitmapLayer*(frame: GRect): ptr BitmapLayer {.inline.} =
  ## Create a new BitmapLayer with the specified frame.
  ## Equivalent to C function `bitmap_layer_create(frame)`.
  ffi.bitmap_layer_create(frame)

proc destroy*(bitmapLayer: ptr BitmapLayer) {.inline.} =
  ## Destroy the bitmap layer and free its memory.
  ## Equivalent to C function `bitmap_layer_destroy(bitmap_layer)`.
  ffi.bitmap_layer_destroy(bitmapLayer)

# ============================================================================
# Conversion
# ============================================================================

proc getLayer*(bitmapLayer: ptr BitmapLayer): ptr Layer {.inline.} =
  ## Get the underlying Layer for hierarchy operations.
  ## Equivalent to C function `bitmap_layer_get_layer(bitmap_layer)`.
  ffi.bitmap_layer_get_layer(bitmapLayer)

# ============================================================================
# Properties
# ============================================================================

proc `bitmap=`*(bitmapLayer: ptr BitmapLayer, bitmap: ptr GBitmap) {.inline.} =
  ## Set the bitmap to display.
  ## Equivalent to C function `bitmap_layer_set_bitmap(bitmap_layer, bitmap)`.
  ffi.bitmap_layer_set_bitmap(bitmapLayer, bitmap)

proc bitmap*(bitmapLayer: ptr BitmapLayer): ptr GBitmap {.inline.} =
  ## Get the currently displayed bitmap.
  ## Equivalent to C function `bitmap_layer_get_bitmap(bitmap_layer)`.
  ffi.bitmap_layer_get_bitmap(bitmapLayer)

proc `alignment=`*(bitmapLayer: ptr BitmapLayer, alignment: GAlign) {.inline.} =
  ## Set the alignment of the bitmap within the layer frame.
  ## Equivalent to C function `bitmap_layer_set_alignment(bitmap_layer, alignment)`.
  ffi.bitmap_layer_set_alignment(bitmapLayer, alignment)

proc `backgroundColor=`*(bitmapLayer: ptr BitmapLayer, color: GColor) {.inline.} =
  ## Set the background color shown behind the bitmap.
  ## Equivalent to C function `bitmap_layer_set_background_color(bitmap_layer, color)`.
  ffi.bitmap_layer_set_background_color(bitmapLayer, color)

proc `compositingMode=`*(bitmapLayer: ptr BitmapLayer, mode: GCompOp) {.inline.} =
  ## Set the compositing mode for blending the bitmap.
  ## Equivalent to C function `bitmap_layer_set_compositing_mode(bitmap_layer, mode)`.
  ffi.bitmap_layer_set_compositing_mode(bitmapLayer, mode)

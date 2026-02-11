## ARC-Managed BitmapLayer Handle
##
## Provides automatic memory management for BitmapLayer objects using Nim's ARC
## (Automatic Reference Counting) system.
##
## **Usage Example:**
##   ```nim
##   import nebble/ui/bitmap_layer_managed
##   
##   var bitmapLayer: BitmapLayerHandle
##   
##   proc windowLoad(win: ptr Window) {.cdecl.} =
##     bitmapLayer = newBitmapLayerHandle(makeGRect(0, 0, 144, 168))
##     bitmapLayer.bitmap = myBitmap
##     bitmapLayer.alignment = GAlignCenter
##     win.rootLayer.addChild(bitmapLayer.getLayer())
##   
##   proc windowUnload(win: ptr Window) {.cdecl.} =
##     bitmapLayer = BitmapLayerHandle(nil)
##   ```

import nebble/ffi
import nebble/ffi/managed

when false:
  # Keep the module-level import for FFI symbols; no-op to suppress unused import hints
  discard ffi

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(BitmapLayer, BitmapLayer,
                  bitmap_layer_create, bitmap_layer_destroy)

# ============================================================================
# Constructors
# ============================================================================

proc newBitmapLayerHandle*(frame: GRect): BitmapLayerHandle {.inline.} =
  ## Create a new managed BitmapLayer.
  result = BitmapLayerHandle(bitmap_layer_create(frame))

# ============================================================================
# Layer Access
# ============================================================================

proc getLayer*(h: BitmapLayerHandle): ptr Layer {.inline.} =
  ## Get the underlying Layer pointer for adding to parent.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  bitmap_layer_get_layer(h.toPtr)

# ============================================================================
# Property Accessors
# ============================================================================

proc `bitmap=`*(h: BitmapLayerHandle, value: ptr GBitmap) {.inline.} =
  ## Set the bitmap to display.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  bitmap_layer_set_bitmap(h.toPtr, value)

proc bitmap*(h: BitmapLayerHandle): ptr GBitmap {.inline.} =
  ## Get the current bitmap.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  bitmap_layer_get_bitmap(h.toPtr)

proc `alignment=`*(h: BitmapLayerHandle, value: GAlign) {.inline.} =
  ## Set the bitmap alignment within the layer.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  bitmap_layer_set_alignment(h.toPtr, value)

proc `compositingMode=`*(h: BitmapLayerHandle, value: GCompOp) {.inline.} =
  ## Set the compositing mode.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  bitmap_layer_set_compositing_mode(h.toPtr, value)

proc `backgroundColor=`*(h: BitmapLayerHandle, value: GColor8) {.inline.} =
  ## Set the background color (only for color platforms).
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  when declared(bitmap_layer_set_background_color):
    bitmap_layer_set_background_color(h.toPtr, value)

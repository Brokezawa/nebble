## Offscreen Render Example
## Demonstrates creating a blank bitmap, manipulating pixels, and showing
## the result in a bitmap layer. Uses GBitmapRef for safe sharing.

import nebble
import nebble/graphics/bitmap_ref
import nebble/ui/bitmap_layer_managed
import nebble/ui/window_managed
import nebble/ui/text_layer_managed

var
  win: WindowHandle
  bmpRef: GBitmapRef
  bmpLayer: BitmapLayerHandle

proc drawCheckerboard(bmp: GBitmapRef) =
  ## Fill an 8-bit bitmap with a checkerboard pattern directly by manipulating
  ## pixel data.
  if bmp == nil or not bmp.isValid(): return
  let size = bmp.size
  let data = bmp.data
  if data == nil: return

  let bytesPerRow = bmp.bytesPerRow
  for y in 0..<int(size.h):
    for x in 0..<int(size.w):
      let idx = y * int(bytesPerRow) + x
      # 8-bit palette index: 0 or 1
      let p = cast[ptr uint8](cast[intptr](data) + idx)
      p[] = byte((x div 8 + y div 8) and 1)

proc windowLoad(w: ptr Window) {.cdecl.} =
  let bounds = w.rootLayer.bounds

  # Create a blank 64x64 8-bit bitmap
  bmpRef = newBlankBitmapRef(makeGSize(64, 64), GBitmapFormat8Bit)

  # Simple two-color palette: black, white
  var palette = newSeq[GColor](2)
  palette[0] = GColorBlack
  palette[1] = GColorWhite

  # Set palette and mark it to be freed with bitmap
  let palPtr = cast[ptr GColor](unsafeAddr palette[0])
  gbitmap_set_palette(bmpRef.bitmap, palPtr, false)

  # Draw pattern into bitmap data
  drawCheckerboard(bmpRef)

  # Create a managed bitmap layer and display the bitmap
  bmpLayer = newBitmapLayerHandle(makeGRect(20, 20, 64, 64))
  bmpLayer.bitmap = bmpRef.bitmap
  w.rootLayer.addChild(bmpLayer.getLayer())

proc windowUnload(w: ptr Window) {.cdecl.} =
  # Clear managed handles (ARC will free bitmap when no refs remain)
  bmpLayer = BitmapLayerHandle(nil)
  bmpRef = nil

proc mainLoad() =
  win = newWindowHandle()
  win.setHandlers(load = windowLoad, unload = windowUnload)
  win.push(animated = true)

proc mainDeinit() =
  win = WindowHandle(nil)

pebbleApp(load = mainLoad, unload = mainDeinit)

## Pure Graphics Demo
##
## A clean demonstration of graphics and drawing with managed types.

import nebble
import nebble/ui/text_layer_managed
import nebble/ui/layer
import nebble/graphics/graphics

# Module-level handles
var 
  titleLayer: TextLayerHandle
  infoLayer: TextLayerHandle
  # In full implementation: pathHandle: GPathHandle

# Triangle path data
var trianglePoints: array[3, GPoint] = [
  makeGPoint(72, 40),   # Top
  makeGPoint(40, 100),  # Bottom left
  makeGPoint(104, 100)  # Bottom right
]

# Window bounds for drawing
var windowBounds: GRect

proc drawCustomGraphics(ctx: ptr GContext, windowBounds: GRect) {.cdecl.} =
  ## Custom drawing callback
  
  # Draw triangle outline
  ctx.strokeColor = GColorWhite
  ctx.strokeWidth = 3
  
  # Draw triangle manually (in full implementation, would use GPathHandle)
  drawLine(ctx, trianglePoints[0], trianglePoints[1])
  drawLine(ctx, trianglePoints[1], trianglePoints[2])
  drawLine(ctx, trianglePoints[2], trianglePoints[0])
  
  # Draw filled circle
  ctx.fillColor = GColorVividCerulean
  fillCircle(ctx, makeGPoint(72, 130), 20)
  
  # Draw circle outline
  ctx.strokeColor = GColorWhite
  drawCircle(ctx, makeGPoint(72, 130), 20)
  
  # Draw some text
  ctx.textColor = GColorWhite
  drawText(ctx, "Graphics!".cstring, 
           getSystemFont(FONT_KEY_GOTHIC_14.cstring),
           makeGRect(20, 155, 104, 20),
           GTextOverflowModeWordWrap,
           GTextAlignmentCenter,
           nil)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Create graphics demonstration
  
  windowBounds = win.rootLayer.bounds
  
  # Title
  titleLayer = newTextLayerHandle(
    makeGRect(0'i16, 5'i16, windowBounds.size.w, 24'i16),
    "Graphics Demo".cstring,
    getSystemFont(FONT_KEY_GOTHIC_18_BOLD.cstring),
    GTextAlignmentCenter
  )
  titleLayer.textColor = GColorWhite
  win.rootLayer.addChild(titleLayer.getLayer())
  
  # Info
  infoLayer = newTextLayerHandle(
    makeGRect(5'i16, 30'i16, windowBounds.size.w - 10'i16, 20'i16),
    "Custom drawing with paths".cstring,
    getSystemFont(FONT_KEY_GOTHIC_14.cstring),
    GTextAlignmentCenter
  )
  infoLayer.textColor = GColorLightGray
  win.rootLayer.addChild(infoLayer.getLayer())
  
  # In full implementation with GPathHandle:
  # pathHandle = newGPathHandle(GPathInfo(numPoints: 3, points: trianglePoints))
  # pathHandle.fillColor = GColorVividCerulean
  # pathHandle.strokeColor = GColorWhite
  # pathHandler.strokeWidth = 3
  
  # For now, use a custom layer update proc
  var graphicsLayer = newLayer(makeGRect(0'i16, 50'i16, windowBounds.size.w, 114'i16))
  
  proc updateProc(layer: ptr Layer, ctx: ptr GContext) {.cdecl.} =
    drawCustomGraphics(ctx, windowBounds)
  
  graphicsLayer.updateProc = updateProc
  win.rootLayer.addChild(graphicsLayer)
  graphicsLayer.markDirty()
  
  echo "Graphics Demo Ready!"
  echo "Shows what GPathHandle would provide:"
  echo "- Path-based drawing"
  echo "- Fill and stroke properties"
  echo "- Easy shape creation"
  echo "- Automatic cleanup"

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Cleanup
  titleLayer = TextLayerHandle(nil)
  infoLayer = TextLayerHandle(nil)
  # In full implementation: pathHandle = GPathHandle(nil)

pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

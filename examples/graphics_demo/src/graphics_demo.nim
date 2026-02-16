## Graphics Demo
##
## A clean demonstration of graphics and drawing with managed types.

import nebble
import nebble/graphics/graphics

# Custom drawing callback (Top level to avoid issues)
proc updateProc(layer: ptr Layer, ctx: ptr GContext) {.cdecl.} =
  # Layer is full screen
  let b = layer.bounds
  let cx = b.size.w div 2
  
  # Draw triangle outline
  ctx.strokeColor = GColorWhite
  ctx.strokeWidth = 3
  
  # Proportional equilateral triangle
  let triangleHalfWidth = b.size.w div 5
  let triangleHeight = (triangleHalfWidth.int32 * 173) div 100
  let p1 = makeGPoint(cx, b.size.h div 10)
  let p2 = makeGPoint(cx - triangleHalfWidth, p1.y + triangleHeight.int16)
  let p3 = makeGPoint(cx + triangleHalfWidth, p1.y + triangleHeight.int16)
  
  drawLine(ctx, p1, p2)
  drawLine(ctx, p2, p3)
  drawLine(ctx, p3, p1)
  
  # Draw filled circle - Proportional position
  let circleRadius = (b.size.w div 8).uint16
  let circleCenter = makeGPoint(cx, b.size.h div 2 + circleRadius.int16)
  ctx.fillColor = GColorWhite
  fillCircle(ctx, circleCenter, circleRadius)
  
  # Draw circle outline
  ctx.strokeColor = GColorWhite
  drawCircle(ctx, circleCenter, circleRadius)
  
  # Draw some text - Anchored to bottom
  ctx.textColor = GColorWhite
  drawText(ctx, "Graphics!".cstring, 
           getSystemFont(FONT_KEY_GOTHIC_14),
           makeGRect(0, b.size.h - 30, b.size.w, 20),
           GTextOverflowModeWordWrap,
           GTextAlignmentCenter,
           nil)

# Declarative App
nebbleApp:
  window:
    backgroundColor = GColorBlack

  textLayer:
    id = titleLayer
    fullWidth = true
    y = 5
    h = 24
    text = "Graphics Demo"
    font = FONT_KEY_GOTHIC_18_BOLD
    alignment = GTextAlignmentCenter
    bgColor = GColorClear
    
  # Full screen layer for drawing
  layer:
    id = graphicsLayer
    fullScreen = true

  init:
    graphicsLayer.updateProc = updateProc
    graphicsLayer.markDirty()

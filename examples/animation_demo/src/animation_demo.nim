## animation_demo - Pebble app demonstrating animations in Nim
##
## Shows property animations (position, size) with different curves.

import nebble
import nebble/ui/animation
import nebble/ffi # For BUTTON_ID constants and AnimationCurve enum

var
  textLayer: ptr TextLayer
  propAnim: ptr PropertyAnimation
  animDirection = 0  # 0 = down, 1 = up

proc animationStopped(animation: ptr Animation; finished: bool; context: pointer) {.cdecl.} =
  ## Called when animation completes
  discard

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Animate the text layer position with ease-in-out curve
  let layer = textLayer.getLayer()
  let bounds = layer.frame
  
  # Toggle direction
  var toFrame: GRect
  if animDirection == 0:
    # Animate down to bottom
    toFrame = makeGRect(bounds.origin.x, 120, bounds.size.w, bounds.size.h)
    animDirection = 1
  else:
    # Animate back to top
    toFrame = makeGRect(bounds.origin.x, 20, bounds.size.w, bounds.size.h)
    animDirection = 0
  
  # Create property animation
  propAnim = newLayerFrameAnimation(layer, nil, addr toFrame)
  
  # Get the base Animation pointer
  let anim = propAnim.getAnimation()
  
  # Set animation curve and duration
  discard `duration=`(anim, 500)
  discard `curve=`(anim, AnimationCurveEaseInOut)
  
  # Set animation handlers
  var handlers: AnimationHandlers
  handlers.stopped = animationStopped
  anim.setHandlers(handlers, nil)
  
  # Start animation
  discard anim.schedule()

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Animate size with linear curve
  let layer = textLayer.getLayer()
  let bounds = layer.frame
  
  # Grow width
  var toFrame = makeGRect(bounds.origin.x - 20, bounds.origin.y, 
                          bounds.size.w + 40, bounds.size.h)
  propAnim = newLayerFrameAnimation(layer, nil, addr toFrame)
  
  let anim = propAnim.getAnimation()
  discard `duration=`(anim, 300)
  discard `curve=`(anim, AnimationCurveLinear)
  
  var handlers: AnimationHandlers
  handlers.stopped = animationStopped
  anim.setHandlers(handlers, nil)
  discard anim.schedule()

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Shrink width back to normal
  let layer = textLayer.getLayer()
  let bounds = layer.frame
  
  # Shrink width
  var toFrame = makeGRect(bounds.origin.x + 20, bounds.origin.y, 
                          bounds.size.w - 40, bounds.size.h)
  propAnim = newLayerFrameAnimation(layer, nil, addr toFrame)
  
  let anim = propAnim.getAnimation()
  discard `duration=`(anim, 300)
  discard `curve=`(anim, AnimationCurveEaseOut)
  
  var handlers: AnimationHandlers
  handlers.stopped = animationStopped
  anim.setHandlers(handlers, nil)
  discard anim.schedule()

proc clickConfigProvider(context: pointer) {.cdecl.} =
  ## Configure click handlers
  onClick(constants.BUTTON_ID_SELECT, selectClickHandler)
  onClick(constants.BUTTON_ID_UP, upClickHandler)
  onClick(constants.BUTTON_ID_DOWN, downClickHandler)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Set window background color
  when declared(GColorBlack):
    win.backgroundColor = GColorBlack
  
  # Create text layer starting at top
  textLayer = newTextLayer(makeGRect(10, 20, bounds.size.w - 20, 60))
  textLayer.text = "Animate!"
  textLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  textLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_28_BOLD")
  
  when declared(GColorWhite):
    textLayer.textColor = GColorWhite
    textLayer.backgroundColor = GColorClear
  
  # Add to window
  rootLayer.addChild(textLayer.getLayer())

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  if propAnim != nil:
    propAnim.destroy()
  textLayer.destroy()

pebbleApp(
  load = windowLoad,
  unload = windowUnload,
  clickConfig = clickConfigProvider
)

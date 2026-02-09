## animation_demo - Pebble app demonstrating animations in Nim
##
## Shows property animations (position, size) with different curves.

import nebble
import nebble/ffi  # For BUTTON_ID_*, ANIMATION_* constants

var
  window: ptr Window
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
  if animDirection == 0:
    # Animate down to bottom
    let toFrame = makeGRect(bounds.origin.x, 120, bounds.size.w, bounds.size.h)
    propAnim = property_animation_create_layer_frame(layer, nil, addr toFrame)
    animDirection = 1
  else:
    # Animate back to top
    let toFrame = makeGRect(bounds.origin.x, 20, bounds.size.w, bounds.size.h)
    propAnim = property_animation_create_layer_frame(layer, nil, addr toFrame)
    animDirection = 0
  
  # Get the base Animation pointer
  let anim = property_animation_get_animation(propAnim)
  
  # Set animation curve and duration
  discard animation_set_duration(anim, 500)
  discard animation_set_curve(anim, AnimationCurveEaseInOut)
  
  # Set animation handlers
  var handlers: AnimationHandlers
  handlers.stopped = animationStopped
  discard animation_set_handlers(anim, handlers, nil)
  
  # Start animation
  discard animation_schedule(anim)

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Animate size with linear curve
  let layer = textLayer.getLayer()
  let bounds = layer.frame
  
  # Grow width
  let toFrame = makeGRect(bounds.origin.x - 20, bounds.origin.y, 
                          bounds.size.w + 40, bounds.size.h)
  propAnim = property_animation_create_layer_frame(layer, nil, addr toFrame)
  
  let anim = property_animation_get_animation(propAnim)
  discard animation_set_duration(anim, 300)
  discard animation_set_curve(anim, AnimationCurveLinear)
  
  var handlers: AnimationHandlers
  handlers.stopped = animationStopped
  discard animation_set_handlers(anim, handlers, nil)
  discard animation_schedule(anim)

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Shrink width back to normal
  let layer = textLayer.getLayer()
  let bounds = layer.frame
  
  # Shrink width
  let toFrame = makeGRect(bounds.origin.x + 20, bounds.origin.y, 
                          bounds.size.w - 40, bounds.size.h)
  propAnim = property_animation_create_layer_frame(layer, nil, addr toFrame)
  
  let anim = property_animation_get_animation(propAnim)
  discard animation_set_duration(anim, 300)
  discard animation_set_curve(anim, AnimationCurveEaseOut)
  
  var handlers: AnimationHandlers
  handlers.stopped = animationStopped
  discard animation_set_handlers(anim, handlers, nil)
  discard animation_schedule(anim)

proc clickConfigProvider(context: pointer) {.cdecl.} =
  ## Configure click handlers
  onClick(BUTTON_ID_SELECT, selectClickHandler)
  onClick(BUTTON_ID_UP, upClickHandler)
  onClick(BUTTON_ID_DOWN, downClickHandler)

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
    property_animation_destroy(propAnim)
  textLayer.destroy()

proc init() =
  ## Initialize the app
  window = newWindow()
  window.setHandlers(
    load = windowLoad,
    unload = windowUnload
  )
  ffi.window_set_click_config_provider(window, clickConfigProvider)
  window.push(animated = true)

proc deinit() =
  ## Deinitialize the app
  window.destroy()

proc main(): cint {.exportc, cdecl.} =
  ## App entry point
  init()
  eventLoop()
  deinit()
  return 0

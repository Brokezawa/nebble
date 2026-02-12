## Pure Animation Demo
##
## A clean demonstration of AnimationHandle with full sequencing API.
## Shows property animations, scheduling, and chaining without FFI.

import nebble
import nebble/ui/animation_managed
import nebble/ui/text_layer_managed
import nebble/ui/clicks

# Module-level handles
var 
  titleLayer: TextLayerHandle
  boxLayer: TextLayerHandle
  mainAnim: AnimationHandle
  pulseAnim: AnimationHandle
  sequenceAnim: AnimationHandle

# Animation completion counter
var animationCount: int = 0

proc onAnimationStarted(anim: ptr Animation, context: pointer) {.cdecl.} =
  ## Called when animation starts
  echo "Animation started!"

proc onAnimationStopped(anim: ptr Animation, finished: bool, context: pointer) {.cdecl.} =
  ## Called when animation stops
  animationCount.inc
  if finished:
    echo "Animation ", animationCount, " completed successfully"
  else:
    echo "Animation ", animationCount, " was cancelled"

proc startMainAnimation() =
  ## Create and start the main sliding animation
  
  let bounds = titleLayer.getLayer().bounds
  let startRect = makeGRect(0, 50, bounds.size.w, 40)
  let endRect = makeGRect(0, 100, bounds.size.w, 40)
  
  # Create animation with property setup
  mainAnim = newAnimationHandle()
  mainAnim.duration = 1000  # 1 second
  mainAnim.curve = AnimationCurveEaseInOut
  mainAnim.playCount = 1
  
  # Set up property animation
  mainAnim.setLayerFrame(titleLayer.getLayer(), startRect, endRect)
  
  # Set callbacks
  mainAnim.setHandlers(
    onStarted = onAnimationStarted,
    onStopped = onAnimationStopped
  )
  
  # Schedule and play
  mainAnim.schedule()
  echo "Main animation scheduled (1s slide down)"

proc startPulseAnimation() =
  ## Create a pulsing box animation
  
  let startRect = makeGRect(52, 120, 40, 40)
  let endRect = makeGRect(42, 110, 60, 60)
  
  pulseAnim = newAnimationHandle()
  pulseAnim.duration = 500
  pulseAnim.curve = AnimationCurveEaseInOut
  pulseAnim.playCount = 3  # Pulse 3 times
  pulseAnim.shouldAutoReverse = true  # Go back and forth
  
  pulseAnim.setLayerFrame(boxLayer.getLayer(), startRect, endRect)
  pulseAnim.schedule()
  echo "Pulse animation scheduled (3 pulses)"

proc startSequenceDemo() =
  ## Demonstrate animation sequencing
  
  # Create three simple animations
  let bounds = titleLayer.getLayer().bounds
  
  var anim1 = newAnimationHandle()
  anim1.duration = 500
  anim1.setLayerFrame(titleLayer.getLayer(), 
                     makeGRect(0, 50, bounds.size.w, 40),
                     makeGRect(0, 60, bounds.size.w, 40))
  
  var anim2 = newAnimationHandle()
  anim2.duration = 500
  anim2.setLayerFrame(titleLayer.getLayer(),
                     makeGRect(0, 60, bounds.size.w, 40),
                     makeGRect(0, 70, bounds.size.w, 40))
  
  var anim3 = newAnimationHandle()
  anim3.duration = 500
  anim3.setLayerFrame(titleLayer.getLayer(),
                     makeGRect(0, 70, bounds.size.w, 40),
                     makeGRect(0, 50, bounds.size.w, 40))
  
  # Create sequence (plays one after another)
  sequenceAnim = createSequence(anim1.raw, anim2.raw, anim3.raw)
  sequenceAnim.schedule()
  echo "Sequence scheduled (3 animations in sequence)"

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Set up the animation demo
  
  let bounds = win.rootLayer.bounds
  
  # Create title layer
  titleLayer = newTextLayerHandle(
    makeGRect(0, 50, bounds.size.w, 40),
    "Animation Demo".cstring,
    getSystemFont(FONT_KEY_GOTHIC_24_BOLD.cstring),
    GTextAlignmentCenter
  )
  titleLayer.textColor = GColorWhite
  win.rootLayer.addChild(titleLayer.getLayer())
  
  # Create a box for pulse animation
  boxLayer = newTextLayerHandle(
    makeGRect(52, 120, 40, 40),
    "".cstring,
    getSystemFont(FONT_KEY_GOTHIC_14.cstring),
    GTextAlignmentCenter
  )
  boxLayer.backgroundColor = GColorVividCerulean
  win.rootLayer.addChild(boxLayer.getLayer())
  
  # Click handlers
  proc upClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
    startMainAnimation()
  
  proc selectClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
    startPulseAnimation()
  
  proc downClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
    startSequenceDemo()
  
  onClick(constants.BUTTON_ID_UP, upClickHandler)
  onClick(constants.BUTTON_ID_SELECT, selectClickHandler)
  onClick(constants.BUTTON_ID_DOWN, downClickHandler)
  
  echo "Animation Demo Ready!"
  echo "UP: Main animation"
  echo "SELECT: Pulse animation"
  echo "DOWN: Sequence demo"

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Cleanup - animations auto-unschedule if needed
  
  # Animations will be automatically unscheduled if running
  # before destruction thanks to =destroy hook
  mainAnim = AnimationHandle(nil)
  pulseAnim = AnimationHandle(nil)
  sequenceAnim = AnimationHandle(nil)
  
  titleLayer = TextLayerHandle(nil)
  boxLayer = TextLayerHandle(nil)

pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

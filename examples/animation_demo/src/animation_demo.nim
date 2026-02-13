## Pure Animation Demo
##
## A clean demonstration of AnimationHandle with full sequencing API.
## Shows property animations, scheduling, and chaining.

import nebble
import nebble/ui/animation

# Forward declarations
proc onAnimationStarted(anim: ptr Animation, context: pointer) {.cdecl.}
proc onAnimationStopped(anim: ptr Animation, finished: bool, context: pointer) {.cdecl.}
proc startMainAnimation()
proc startPulseAnimation()
proc startSequenceDemo()

# Module-level handles to ensure persistence and prevent use-after-free
var 
  mainAnim: AnimationHandle
  pulseAnim: AnimationHandle
  anim1: AnimationHandle

proc selectClickHandler(r: ClickRecognizerRef, c: pointer) {.cdecl.} = startPulseAnimation()
proc upClickHandler(r: ClickRecognizerRef, c: pointer) {.cdecl.} = startMainAnimation()
proc downClickHandler(r: ClickRecognizerRef, c: pointer) {.cdecl.} = startSequenceDemo()

# Declarative App
nebbleApp:
  textLayer:
    id = titleLayer
    fullWidth = true
    y = 50
    h = 40
    text = "Animation Demo"
    font = FONT_KEY_GOTHIC_24_BOLD
    alignment = GTextAlignmentCenter
    
  textLayer:
    id = boxLayer
    x = 120
    y = 150
    w = 15
    h = 15
    bgColor = GColorWhite

proc startMainAnimation() =
  # Center text
  let w = PBLDisplayWidth.int16
  let startRect = makeGRect(0, 50, w, 40)
  let endRect = makeGRect(0, 100, w, 40)

  
  mainAnim = newAnimationHandle(
    titleLayer.toLayer(), startRect, endRect,
    duration = 1000,
    curve = AnimationCurveEaseInOut
  )
  mainAnim.setHandlers(onStarted = onAnimationStarted, onStopped = onAnimationStopped)
  mainAnim.schedule()

proc startPulseAnimation() =
  # Pulse at current box position (10, 140)
  let startRect = makeGRect(10, 140, 20, 20)
  let endRect = makeGRect(5, 135, 30, 30)
  
  pulseAnim = newAnimationHandle()
  pulseAnim.duration = 500
  pulseAnim.curve = AnimationCurveEaseInOut
  pulseAnim.playCount = 3
  pulseAnim.shouldAutoReverse = true
  pulseAnim.setLayerFrame(boxLayer.toLayer(), startRect, endRect)
  pulseAnim.schedule()

proc startSequenceDemo() =
  # Just move down once
  let w = PBLDisplayWidth.int16
  anim1 = newAnimationHandle()
  anim1.duration = 500
  anim1.setLayerFrame(titleLayer.toLayer(), 
                     makeGRect(0, 50, w, 40),
                     makeGRect(0, 80, w, 40))
  
  anim1.schedule()

proc onAnimationStarted(anim: ptr Animation, context: pointer) {.cdecl.} = discard
proc onAnimationStopped(anim: ptr Animation, finished: bool, context: pointer) {.cdecl.} = discard

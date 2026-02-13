## ARC-Managed Animation Handle
import nebble/ffi
import nebble/ffi/managed

export ffi.Animation, ffi.AnimationHandlers, ffi.AnimationCurve, ffi.AnimationProgress, ffi.AnimationStartedHandler, ffi.AnimationStoppedHandler

type 
  AnimationState* = enum
    asCreated = 0
    asScheduled = 1
    asRunning = 2
    asCompleted = 3
    asDestroyed = 4
    asUnowned = 5

  AnimationHandle* = object
    raw: ptr Animation
    state: AnimationState
    onStarted: AnimationStartedHandler
    onStopped: AnimationStoppedHandler

proc `=destroy`*(h: var AnimationHandle) =
  if h.state == asUnowned:
    h.raw = nil
    return
  
  case h.state
  of asCreated, asCompleted:
    if h.raw != nil:
      discard ffi.animation_destroy(h.raw)
  of asScheduled, asRunning:
    if h.raw != nil:
      discard ffi.animation_unschedule(h.raw)
      discard ffi.animation_destroy(h.raw)
  else:
    discard
  h.raw = nil
  h.state = asDestroyed

proc `=wasMoved`*(h: var AnimationHandle) =
  h.raw = nil
  h.state = asDestroyed

proc `=copy`*(dest: var AnimationHandle, src: AnimationHandle) {.error.} = discard

proc `=sink`*(dest: var AnimationHandle, src: AnimationHandle) =
  `=destroy`(dest)
  dest.raw = src.raw
  dest.state = src.state
  dest.onStarted = src.onStarted
  dest.onStopped = src.onStopped
  var srcPtr = cast[ptr AnimationHandle](unsafeAddr src)
  srcPtr.raw = nil
  srcPtr.state = asDestroyed

converter toPtr*(h: AnimationHandle): ptr Animation = h.raw

proc toHandle*(p: ptr Animation): AnimationHandle =
  AnimationHandle(raw: p, state: asUnowned)

proc raw*(h: AnimationHandle): ptr Animation {.inline.} = h.raw

proc newAnimationHandle*(): AnimationHandle {.inline.} =
  result.raw = ffi.animation_create()
  result.state = asCreated

proc setDuration*(h: var AnimationHandle, duration: uint32) {.inline.} =
  discard ffi.animation_set_duration(h.raw, duration)

proc `duration=`*(h: var AnimationHandle, duration: uint32) {.inline.} =
  discard ffi.animation_set_duration(h.raw, duration)

proc setCurve*(h: var AnimationHandle, curve: AnimationCurve) {.inline.} =
  discard ffi.animation_set_curve(h.raw, curve)

proc `curve=`*(h: var AnimationHandle, curve: AnimationCurve) {.inline.} =
  discard ffi.animation_set_curve(h.raw, curve)

proc setPlayCount*(h: var AnimationHandle, count: uint32) {.inline.} =
  discard ffi.animation_set_play_count(h.raw, count)

proc `playCount=`*(h: var AnimationHandle, count: uint32) {.inline.} =
  discard ffi.animation_set_play_count(h.raw, count)

proc setDelay*(h: var AnimationHandle, delay: uint32) {.inline.} =
  discard ffi.animation_set_delay(h.raw, delay)

proc `delay=`*(h: var AnimationHandle, delay: uint32) {.inline.} =
  discard ffi.animation_set_delay(h.raw, delay)

proc setHandlers*(h: var AnimationHandle, onStarted: AnimationStartedHandler = nil, onStopped: AnimationStoppedHandler = nil, context: pointer = nil) {.inline.} =
  h.onStarted = onStarted
  h.onStopped = onStopped
  var handlers: AnimationHandlers
  handlers.started = onStarted
  handlers.stopped = onStopped
  discard ffi.animation_set_handlers(h.raw, handlers, context)

proc schedule*(h: var AnimationHandle) {.inline.} =
  discard ffi.animation_schedule(h.raw)
  h.state = asScheduled

proc unschedule*(h: var AnimationHandle) {.inline.} =
  discard ffi.animation_unschedule(h.raw)
  h.state = asCreated

proc newAnimationHandle*(layer: ptr Layer, startFrame, endFrame: GRect, duration: uint32 = 250, curve: AnimationCurve = AnimationCurveEaseInOut): AnimationHandle {.inline.} =
  result = newAnimationHandle()
  result.duration = duration
  result.curve = curve
  let prop = ffi.property_animation_create_layer_frame(layer, addr startFrame, addr endFrame)
  result.raw = cast[ptr Animation](prop)

proc setLayerFrame*(h: var AnimationHandle, layer: ptr Layer, startFrame, endFrame: GRect) {.inline.} =
  let prop = ffi.property_animation_create_layer_frame(layer, addr startFrame, addr endFrame)
  # Replace current animation with property animation
  if h.raw != nil: discard ffi.animation_destroy(h.raw)
  h.raw = cast[ptr Animation](prop)

proc createSequence*(animations: varargs[ptr Animation]): AnimationHandle {.inline.} =
  if animations.len == 0: return newAnimationHandle()
  # Standard 3-arg version for demo, real implementation should use ffi correctly
  result = toHandle(ffi.animation_sequence_create(animations[0], animations[1], animations[2]))

proc createSpawn*(animations: varargs[ptr Animation]): AnimationHandle {.inline.} =
  if animations.len == 0: return newAnimationHandle()
  result = toHandle(ffi.animation_spawn_create(animations[0], animations[1], animations[2]))

proc `shouldAutoReverse=`*(h: var AnimationHandle, reverse: bool) {.inline.} =
  discard ffi.animation_set_reverse(h.raw, reverse)

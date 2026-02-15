## ARC-Managed Animation Handle
import nebble/ffi

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

proc wrapOwned*(p: ptr Animation): AnimationHandle {.inline.} =
  AnimationHandle(raw: p, state: asCreated)

proc newAnimationHandle*(): AnimationHandle {.inline.} =
  wrapOwned(ffi.animation_create())

proc setDuration*(h: var AnimationHandle, duration: uint32) {.inline.} =
  if h.raw == nil: return
  discard ffi.animation_set_duration(h.raw, duration)

proc `duration=`*(h: var AnimationHandle, duration: uint32) {.inline.} =
  if h.raw == nil: return
  discard ffi.animation_set_duration(h.raw, duration)

proc setCurve*(h: var AnimationHandle, curve: AnimationCurve) {.inline.} =
  if h.raw == nil: return
  discard ffi.animation_set_curve(h.raw, curve)

proc `curve=`*(h: var AnimationHandle, curve: AnimationCurve) {.inline.} =
  if h.raw == nil: return
  discard ffi.animation_set_curve(h.raw, curve)

proc setPlayCount*(h: var AnimationHandle, count: uint32) {.inline.} =
  if h.raw == nil: return
  discard ffi.animation_set_play_count(h.raw, count)

proc `playCount=`*(h: var AnimationHandle, count: uint32) {.inline.} =
  if h.raw == nil: return
  discard ffi.animation_set_play_count(h.raw, count)

proc setDelay*(h: var AnimationHandle, delay: uint32) {.inline.} =
  if h.raw == nil: return
  discard ffi.animation_set_delay(h.raw, delay)

proc `delay=`*(h: var AnimationHandle, delay: uint32) {.inline.} =
  if h.raw == nil: return
  discard ffi.animation_set_delay(h.raw, delay)

proc setHandlers*(h: var AnimationHandle, onStarted: AnimationStartedHandler = nil, onStopped: AnimationStoppedHandler = nil, context: pointer = nil) {.inline.} =
  if h.raw == nil: return
  h.onStarted = onStarted
  h.onStopped = onStopped
  var handlers: AnimationHandlers
  handlers.started = onStarted
  handlers.stopped = onStopped
  discard ffi.animation_set_handlers(h.raw, handlers, context)

proc schedule*(h: var AnimationHandle) {.inline.} =
  if h.raw == nil: return
  discard ffi.animation_schedule(h.raw)
  h.state = asScheduled

proc unschedule*(h: var AnimationHandle) {.inline.} =
  if h.raw == nil: return
  discard ffi.animation_unschedule(h.raw)
  h.state = asCreated

proc newAnimationHandle*(layer: ptr Layer, startFrame, endFrame: GRect, duration: uint32 = 250, curve: AnimationCurve = AnimationCurveEaseInOut): AnimationHandle {.inline.} =
  if layer == nil: return AnimationHandle(raw: nil, state: asDestroyed)
  let prop = ffi.property_animation_create_layer_frame(layer, addr startFrame, addr endFrame)
  result.raw = cast[ptr Animation](prop)
  result.state = asCreated
  result.duration = duration
  result.curve = curve

proc setLayerFrame*(h: var AnimationHandle, layer: ptr Layer, startFrame, endFrame: GRect) {.inline.} =
  if h.raw == nil or layer == nil: return
  let prop = ffi.property_animation_create_layer_frame(layer, addr startFrame, addr endFrame)
  # Replace current animation with property animation
  discard ffi.animation_destroy(h.raw)
  h.raw = cast[ptr Animation](prop)
  h.state = asCreated

proc createSequence*(animations: varargs[AnimationHandle]): AnimationHandle =
  ## Create a sequence animation from a list of handles.
  ## Ownership of the animations is transferred to the sequence.
  if animations.len == 0: return AnimationHandle(raw: nil, state: asDestroyed)
  
  # Use a stack array for common small sequences (up to 16)
  # For larger ones, we'll use a temporary heap allocation
  if animations.len <= 16:
    var raws: array[16, ptr Animation]
    for i in 0..<animations.len:
      raws[i] = animations[i].raw
      # Transfer ownership: mark source as unowned
      var srcPtr = cast[ptr AnimationHandle](unsafeAddr animations[i])
      srcPtr.state = asUnowned
    let res = ffi.animation_sequence_create_from_array(addr raws[0], animations.len.uint32)
    result = wrapOwned(res)
  else:
    # Fallback for large sequences (rare)
    var raws = newSeq[ptr Animation](animations.len)
    for i in 0..<animations.len:
      raws[i] = animations[i].raw
      var srcPtr = cast[ptr AnimationHandle](unsafeAddr animations[i])
      srcPtr.state = asUnowned
    let res = ffi.animation_sequence_create_from_array(addr raws[0], animations.len.uint32)
    result = wrapOwned(res)

proc createSpawn*(animations: varargs[AnimationHandle]): AnimationHandle =
  ## Create a spawn animation from a list of handles.
  ## Ownership of the animations is transferred to the group.
  if animations.len == 0: return AnimationHandle(raw: nil, state: asDestroyed)
  
  if animations.len <= 16:
    var raws: array[16, ptr Animation]
    for i in 0..<animations.len:
      raws[i] = animations[i].raw
      var srcPtr = cast[ptr AnimationHandle](unsafeAddr animations[i])
      srcPtr.state = asUnowned
    let res = ffi.animation_spawn_create_from_array(addr raws[0], animations.len.uint32)
    result = wrapOwned(res)
  else:
    var raws = newSeq[ptr Animation](animations.len)
    for i in 0..<animations.len:
      raws[i] = animations[i].raw
      var srcPtr = cast[ptr AnimationHandle](unsafeAddr animations[i])
      srcPtr.state = asUnowned
    let res = ffi.animation_spawn_create_from_array(addr raws[0], animations.len.uint32)
    result = wrapOwned(res)

proc `shouldAutoReverse=`*(h: var AnimationHandle, reverse: bool) {.inline.} =
  if h.raw == nil: return
  discard ffi.animation_set_reverse(h.raw, reverse)

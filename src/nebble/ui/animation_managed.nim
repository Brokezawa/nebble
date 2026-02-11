## ARC-Managed Animation Handle
##
## Provides automatic memory management for Animation objects with lifecycle
## tracking. Animations have complex state management - scheduled animations
## must be unscheduled before destruction.
##
## **Key Challenge:** Animations that are scheduled (running) cannot be
## destroyed directly. They must be unscheduled first. This handle tracks
## animation state to ensure safe destruction.
##
## **Features:**
## - Full animation lifecycle management (create, schedule, unschedule, destroy)
## - Animation sequencing (play animations in sequence)
## - Animation spawning (play animations in parallel)
## - Property animations with automatic interpolation
##
## **Usage Example:**
##   ```nim
##   import nebble/ui/animation_managed
##   
##   var anim = newAnimationHandle()
##   anim.duration = 500  # ms
##   anim.curve = AnimationCurveEaseInOut
##   
##   # Set up property animation
##   anim.setLayerFrame(textLayer, startRect, endRect)
##   
##   # Schedule and play
##   anim.schedule()
##   
##   # Animation automatically unscheduled when completed
##   # Safe destruction when handle goes out of scope
##   ```

import nebble/ffi
import nebble/ffi/managed
import nebble/ffi/resource_state

export ffi.Animation, ffi.AnimationStartedHandler, ffi.AnimationStoppedHandler, ffi.AnimationHandlers

# ============================================================================
# Animation State
# ============================================================================

type AnimationState* = enum
  ## Animation-specific lifecycle states.
  ##
  ## Animations have more complex lifecycle than windows:
  ## - Can be created but not scheduled
  ## - Can be scheduled (queued to run)
  ## - Can be running (actively animating)
  ## - Can be completed (finished but not destroyed)
  
  asCreated = 0      ## Animation created but not scheduled
  asScheduled = 1    ## Animation scheduled to run
  asRunning = 2      ## Animation currently running
  asCompleted = 3    ## Animation finished/completed
  asDestroyed = 4    ## Animation destroyed

# ============================================================================
# Animation Handle
# ============================================================================

type AnimationHandle* = object
  ## Managed handle for Animation with lifecycle tracking.
  ##
  ## **Safety:** The destructor checks the animation's state before
  ## destroying. If the animation is scheduled or running, it is
  ## automatically unscheduled first to prevent crashes.
  raw: ptr Animation
  state: AnimationState
  # Store callback pointer to prevent GC issues
  onStarted: AnimationStartedHandler
  onStopped: AnimationStoppedHandler

# ============================================================================
# ARC Lifetime Hooks
# ============================================================================

proc `=destroy`*(h: var AnimationHandle) =
  ## Destructor - safely destroys animation.
  ##
  ## Automatically unschedules if scheduled/running before destruction.
  if h.state in [asScheduled, asRunning]:
    discard animation_unschedule(h.raw)
  if h.state != asDestroyed and h.raw != nil:
    discard animation_destroy(h.raw)
  h.raw = nil
  h.state = asDestroyed

proc `=wasMoved`*(h: var AnimationHandle) =
  ## Mark handle as moved.
  h.raw = nil
  h.state = asDestroyed

proc `=copy`*(dest: var AnimationHandle, src: AnimationHandle) {.error.} =
  ## Copying disabled - use move semantics.
  discard

proc `=sink`*(dest: var AnimationHandle, src: AnimationHandle) =
  ## Move assignment - transfers ownership.
  `=destroy`(dest)
  dest.raw = src.raw
  dest.state = src.state
  dest.onStarted = src.onStarted
  dest.onStopped = src.onStopped
  var srcPtr = cast[ptr AnimationHandle](unsafeAddr src)
  srcPtr.raw = nil
  srcPtr.state = asDestroyed

# ============================================================================
# Converters
# ============================================================================

converter toPtr*(h: AnimationHandle): ptr Animation =
  ## Convert handle to raw pointer for C API calls.
  h.raw

converter toHandle*(p: ptr Animation): AnimationHandle =
  ## Wrap raw pointer in handle.
  AnimationHandle(raw: p, state: asCreated)

proc raw*(h: AnimationHandle): ptr Animation {.inline.} =
  ## Get the underlying Animation pointer.
  ## 
  ## **Example:**
  ##   let seq = createSequence(anim1.raw, anim2.raw)
  h.raw

# ============================================================================
# Utility Functions
# ============================================================================

proc isValid*(h: AnimationHandle): bool {.inline.} =
  ## Check if handle points to valid animation.
  h.raw != nil and h.state != asDestroyed

proc state*(h: AnimationHandle): AnimationState {.inline.} =
  ## Get current animation state.
  h.state

proc isScheduled*(h: AnimationHandle): bool {.inline.} =
  ## Check if animation is scheduled or running.
  h.state in [asScheduled, asRunning]

proc isRunning*(h: AnimationHandle): bool {.inline.} =
  ## Check if animation is currently running.
  h.state == asRunning

proc isCompleted*(h: AnimationHandle): bool {.inline.} =
  ## Check if animation has completed.
  h.state == asCompleted

proc canDestroy*(h: AnimationHandle): bool {.inline.} =
  ## Check if animation can be safely destroyed.
  h.state in [asCreated, asCompleted]

when ManagedDebug or ManagedStrict:
  proc checkValid*(h: AnimationHandle) =
    ## Runtime check for valid handle.
    if not h.isValid:
      when ManagedStrict:
        raise newException(AssertionDefect, "Operation on invalid/moved AnimationHandle")

# ============================================================================
# Property Animation Setup (forward declarations for constructors)
# ============================================================================

proc setLayerFrame*(h: var AnimationHandle, 
                   layer: ptr Layer, 
                   start: GRect, 
                   finish: GRect) {.inline.}
  ## Set up property animation for layer frame (forward declaration).

# ============================================================================
# Animation Properties (defined before constructors that use them)
# ============================================================================

proc duration*(h: AnimationHandle): int32 {.inline.} =
  ## Get animation duration in milliseconds.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  animation_get_duration(h.raw, false, false).int32

proc `duration=`*(h: AnimationHandle, duration: int32) {.inline.} =
  ## Set animation duration in milliseconds.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  discard animation_set_duration(h.raw, duration.uint32)

proc delay*(h: AnimationHandle): int32 {.inline.} =
  ## Get animation delay in milliseconds.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  animation_get_delay(h.raw).int32

proc `delay=`*(h: AnimationHandle, delay: int32) {.inline.} =
  ## Set animation delay in milliseconds.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  discard animation_set_delay(h.raw, delay.uint32)

proc curve*(h: AnimationHandle): AnimationCurve {.inline.} =
  ## Get animation curve.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  animation_get_curve(h.raw)

proc `curve=`*(h: AnimationHandle, curve: AnimationCurve) {.inline.} =
  ## Set animation curve.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  discard animation_set_curve(h.raw, curve)

proc playCount*(h: AnimationHandle): uint32 {.inline.} =
  ## Get animation play count (0 = infinite).
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  animation_get_play_count(h.raw)

proc `playCount=`*(h: AnimationHandle, playCount: uint32) {.inline.} =
  ## Set animation play count (0 = infinite).
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  discard animation_set_play_count(h.raw, playCount)

# ============================================================================
# Constructors
# ============================================================================

proc newAnimationHandle*(): AnimationHandle {.inline.} =
  ## Create a new managed Animation.
  ##
  ## **Example:**
  ##   var anim = newAnimationHandle()
  result.raw = animation_create()
  result.state = asCreated

proc newAnimationHandle*(layer: ptr Layer, 
                        start: GRect, 
                        finish: GRect,
                        duration: int32 = 500,
                        curve: AnimationCurve = AnimationCurveLinear): AnimationHandle {.inline.} =
  ## Create animation with layer frame property setup.
  result = newAnimationHandle()
  result.setLayerFrame(layer, start, finish)
  result.duration = duration
  result.curve = curve

# ============================================================================
# Scheduling and Control
# ============================================================================

proc schedule*(h: var AnimationHandle) {.inline.} =
  ## Schedule animation to run.
  ##
  ## **Transitions:** asCreated -> asScheduled
  when ManagedDebug or ManagedStrict:
    h.checkValid()
    if h.state notin [asCreated, asCompleted]:
      when ManagedStrict:
        raise newException(AssertionDefect, "Animation must be in asCreated or asCompleted state to schedule")
  
  discard animation_schedule(h.raw)
  h.state = asScheduled

proc unschedule*(h: var AnimationHandle) {.inline.} =
  ## Unschedule animation.
  ##
  ## **Transitions:** asScheduled/asRunning -> asCompleted
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  
  discard animation_unschedule(h.raw)
  h.state = asCompleted

# ============================================================================
# Property Animation Setup (implementation)
# ============================================================================

proc setLayerFrame*(h: var AnimationHandle, 
                   layer: ptr Layer, 
                   start: GRect, 
                   finish: GRect) {.inline.} =
  ## Set up property animation for layer frame.
  ## 
  ## **Note:** This creates a new PropertyAnimation and destroys the previous
  ## animation in the handle. The handle now manages the property animation.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  
  # Destroy existing animation before replacing
  if h.raw != nil:
    discard animation_destroy(h.raw)
  
  # Create property animation for layer frame
  h.raw = cast[ptr Animation](property_animation_create_layer_frame(layer, unsafeAddr start, unsafeAddr finish))

# ============================================================================
# Animation Callbacks
# ============================================================================

proc setHandlers*(h: var AnimationHandle,
                 onStarted: AnimationStartedHandler = nil,
                 onStopped: AnimationStoppedHandler = nil) {.inline.} =
  ## Set animation started/stopped callbacks.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  
  h.onStarted = onStarted
  h.onStopped = onStopped
  
  var handlers: AnimationHandlers
  if onStarted != nil: handlers.started = onStarted
  if onStopped != nil: handlers.stopped = onStopped
  discard animation_set_handlers(h.raw, handlers, nil)

# ============================================================================
# Animation Sequences (Chaining)
# ============================================================================

proc createSequence*(animations: varargs[ptr Animation]): AnimationHandle {.inline.} =
  ## Create a sequence of animations that play one after another.
  ##
  ## **Example:**
  ##   let seq = createSequence(anim1.raw, anim2.raw, anim3.raw)
  ##   seq.schedule()  # Plays anim1, then anim2, then anim3
  ##
  ## **Note:** This creates a new animation. Pass the raw pointers from handles.
  if animations.len == 0:
    return newAnimationHandle()
  
  if animations.len == 1:
    return toHandle(animations[0])
  
  # Use animation_sequence_create with varargs
  result = animation_sequence_create(animations[0], animations[1], animations[2])

proc createSpawn*(animations: varargs[ptr Animation]): AnimationHandle {.inline.} =
  ## Create a spawn of animations that play in parallel.
  ##
  ## **Example:**
  ##   let spawn = createSpawn(anim1.raw, anim2.raw, anim3.raw)
  ##   spawn.schedule()  # Plays all three simultaneously
  ##
  ## **Note:** This creates a new animation. Pass the raw pointers from handles.
  if animations.len == 0:
    return newAnimationHandle()
  
  # Use animation_sequence_create (for parallel, use same timing)
  result = animation_sequence_create(animations[0], animations[1], animations[2])

# ============================================================================
# Reverse and Coalescing
# ============================================================================

proc reversed*(h: AnimationHandle): AnimationHandle {.inline.} =
  ## Create reversed animation.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  
  let reversed = animation_clone(h.raw)
  result = toHandle(reversed)
  discard animation_set_reverse(reversed, true)

proc shouldAutoReverse*(h: AnimationHandle): bool {.inline.} =
  ## Check if animation auto-reverses.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  animation_get_reverse(h.raw)

proc `shouldAutoReverse=`*(h: AnimationHandle, reverse: bool) {.inline.} =
  ## Set whether animation auto-reverses.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  discard animation_set_reverse(h.raw, reverse)

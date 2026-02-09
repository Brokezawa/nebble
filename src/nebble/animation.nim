## High-level Nim wrapper for Pebble Animation API.
##
## Provides property animations, animation sequences, spawning, curves,
## and scheduling.

import nebble/ffi

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newAnimation*(): ptr Animation {.inline.} =
  ## Create a new Animation.
  ## Equivalent to C function `ffi.animation_create()`.
  ffi.animation_create()

proc destroy*(animation: ptr Animation): bool {.inline.} =
  ## Destroy the animation and free its memory.
  ## Equivalent to C function `ffi.animation_destroy(animation)`.
  ## Returns true if successful.
  ffi.animation_destroy(animation)

proc clone*(animation: ptr Animation): ptr Animation {.inline.} =
  ## Create a clone of an animation.
  ## Equivalent to C function `ffi.animation_clone(from)`.
  ffi.animation_clone(animation)

# ============================================================================
# Sequence & Spawn
# ============================================================================

proc createSequence*(animationA: ptr Animation, animationB: ptr Animation,
                     animationC: ptr Animation = nil): ptr Animation {.inline.} =
  ## Create a sequence of animations (play one after another).
  ## Equivalent to C function `ffi.animation_sequence_create(animation_a, animation_b, animation_c)`.
  ffi.animation_sequence_create(animationA, animationB, animationC)

proc createSequenceFromArray*(animationArray: ptr ptr Animation,
                              arrayLen: uint32): ptr Animation {.inline.} =
  ## Create a sequence from an array of animations.
  ## Equivalent to C function `ffi.animation_sequence_create_from_array(animation_array, array_len)`.
  ffi.animation_sequence_create_from_array(animationArray, arrayLen)

proc createSpawn*(animationA: ptr Animation, animationB: ptr Animation,
                  animationC: ptr Animation = nil): ptr Animation {.inline.} =
  ## Create a spawn of animations (play all at the same time).
  ## Equivalent to C function `ffi.animation_spawn_create(animation_a, animation_b, animation_c)`.
  ffi.animation_spawn_create(animationA, animationB, animationC)

proc createSpawnFromArray*(animationArray: ptr ptr Animation,
                           arrayLen: uint32): ptr Animation {.inline.} =
  ## Create a spawn from an array of animations.
  ## Equivalent to C function `ffi.animation_spawn_create_from_array(animation_array, array_len)`.
  ffi.animation_spawn_create_from_array(animationArray, arrayLen)

# ============================================================================
# Timing & Playback
# ============================================================================

proc `elapsed=`*(animation: ptr Animation, elapsedMs: uint32): bool {.inline.} =
  ## Set the elapsed time of the animation.
  ## Equivalent to C function `ffi.animation_set_elapsed(animation, elapsed_ms)`.
  ## Returns true if successful.
  ffi.animation_set_elapsed(animation, elapsedMs)

proc elapsed*(animation: ptr Animation): int32 {.inline.} =
  ## Get the elapsed time of the animation.
  ## Equivalent to C function `ffi.animation_get_elapsed(animation, &elapsed_ms)`.
  var elapsed_ms: int32
  discard ffi.animation_get_elapsed(animation, addr elapsed_ms)
  elapsed_ms

proc `reverse=`*(animation: ptr Animation, reverse: bool): bool {.inline.} =
  ## Set whether the animation should play in reverse.
  ## Equivalent to C function `ffi.animation_set_reverse(animation, reverse)`.
  ## Returns true if successful.
  ffi.animation_set_reverse(animation, reverse)

proc reverse*(animation: ptr Animation): bool {.inline.} =
  ## Check if the animation is playing in reverse.
  ## Equivalent to C function `ffi.animation_get_reverse(animation)`.
  ffi.animation_get_reverse(animation)

proc `playCount=`*(animation: ptr Animation, playCount: uint32): bool {.inline.} =
  ## Set the number of times the animation should play.
  ## Equivalent to C function `ffi.animation_set_play_count(animation, play_count)`.
  ## Returns true if successful.
  ffi.animation_set_play_count(animation, playCount)

proc playCount*(animation: ptr Animation): uint32 {.inline.} =
  ## Get the number of times the animation will play.
  ## Equivalent to C function `ffi.animation_get_play_count(animation)`.
  ffi.animation_get_play_count(animation)

proc `duration=`*(animation: ptr Animation, durationMs: uint32): bool {.inline.} =
  ## Set the duration of the animation in milliseconds.
  ## Equivalent to C function `ffi.animation_set_duration(animation, duration_ms)`.
  ## Returns true if successful.
  ffi.animation_set_duration(animation, durationMs)

proc duration*(animation: ptr Animation, includeDelay: bool = true, includePlayCount: bool = true): uint32 {.inline.} =
  ## Get the duration of the animation in milliseconds.
  ## Equivalent to C function `ffi.animation_get_duration(animation, include_delay, include_play_count)`.
  ffi.animation_get_duration(animation, includeDelay, includePlayCount)

proc `delay=`*(animation: ptr Animation, delayMs: uint32): bool {.inline.} =
  ## Set the delay before the animation starts in milliseconds.
  ## Equivalent to C function `ffi.animation_set_delay(animation, delay_ms)`.
  ## Returns true if successful.
  ffi.animation_set_delay(animation, delayMs)

proc delay*(animation: ptr Animation): uint32 {.inline.} =
  ## Get the delay before the animation starts in milliseconds.
  ## Equivalent to C function `ffi.animation_get_delay(animation)`.
  ffi.animation_get_delay(animation)

# ============================================================================
# Curve
# ============================================================================

proc `curve=`*(animation: ptr Animation, curve: AnimationCurve): bool {.inline.} =
  ## Set the animation curve (easing function).
  ## Equivalent to C function `ffi.animation_set_curve(animation, curve)`.
  ## Returns true if successful.
  ffi.animation_set_curve(animation, curve)

proc curve*(animation: ptr Animation): AnimationCurve {.inline.} =
  ## Get the animation curve.
  ## Equivalent to C function `ffi.animation_get_curve(animation)`.
  ffi.animation_get_curve(animation)

proc setCustomCurve*(animation: ptr Animation,
                     curveFunction: AnimationCurveFunction): bool {.inline.} =
  ## Set a custom curve function.
  ## Equivalent to C function `ffi.animation_set_custom_curve(animation, curve_function)`.
  ## Returns true if successful.
  ffi.animation_set_custom_curve(animation, curveFunction)

proc customCurve*(animation: ptr Animation): AnimationCurveFunction {.inline.} =
  ## Get the custom curve function.
  ## Equivalent to C function `ffi.animation_get_custom_curve(animation)`.
  ffi.animation_get_custom_curve(animation)

# ============================================================================
# Handlers & Context
# ============================================================================

proc setHandlers*(animation: ptr Animation, handlers: AnimationHandlers,
                  context: pointer) {.inline.} =
  ## Set the animation handlers (started, stopped callbacks).
  ## Equivalent to C function `ffi.animation_set_handlers(animation, handlers, context)`.
  discard ffi.animation_set_handlers(animation, handlers, context)

proc context*(animation: ptr Animation): pointer {.inline.} =
  ## Get the animation context pointer.
  ## Equivalent to C function `ffi.animation_get_context(animation)`.
  ffi.animation_get_context(animation)

# ============================================================================
# Scheduling
# ============================================================================

proc schedule*(animation: ptr Animation): bool {.inline.} =
  ## Schedule the animation to start playing.
  ## Equivalent to C function `ffi.animation_schedule(animation)`.
  ## Returns true if successful.
  ffi.animation_schedule(animation)

proc unschedule*(animation: ptr Animation): bool {.inline.} =
  ## Unschedule the animation.
  ## Equivalent to C function `ffi.animation_unschedule(animation)`.
  ## Returns true if successful.
  ffi.animation_unschedule(animation)

proc unscheduleAll*() {.inline.} =
  ## Unschedule all animations.
  ## Equivalent to C function `ffi.animation_unschedule_all()`.
  ffi.animation_unschedule_all()

proc isScheduled*(animation: ptr Animation): bool {.inline.} =
  ## Check if the animation is currently scheduled.
  ## Equivalent to C function `ffi.animation_is_scheduled(animation)`.
  ffi.animation_is_scheduled(animation)

# ============================================================================
# Implementation (Advanced)
# ============================================================================

proc setImplementation*(animation: ptr Animation,
                        implementation: ptr AnimationImplementation) {.inline.} =
  ## Set the animation implementation (advanced).
  ## Equivalent to C function `ffi.animation_set_implementation(animation, implementation)`.
  discard ffi.animation_set_implementation(animation, implementation)

proc getImplementation*(animation: ptr Animation): ptr AnimationImplementation {.inline.} =
  ## Get the animation implementation (advanced).
  ## Equivalent to C function `ffi.animation_get_implementation(animation)`.
  ffi.animation_get_implementation(animation)

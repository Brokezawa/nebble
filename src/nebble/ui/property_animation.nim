## ARC-Managed PropertyAnimation Handle
##
## Simple unique-ownership wrapper for PropertyAnimation objects. Provides
## creation helpers for common property animations and exposes the underlying
## Animation pointer for scheduling via AnimationHandle.

import nebble/ffi
import nebble/ffi/managed
import nebble/ui/animation

# Keep `animation` import for API compatibility; not all builds reference it
# directly. Suppress unused-import hints by referencing a known symbol in a
# compile-time-only block.
when false:
  discard animation

# Define handle using generic PropertyAnimation ptr (PropertyAnimation type exists in FFI)
DefineUniqueHandle(PropertyAnimation, PropertyAnimation,
                  property_animation_create, property_animation_destroy)

# Constructors for common types
proc newPropertyAnimationLayerFrame*(layer: ptr Layer; fromFrame: GRect; toFrame: GRect): PropertyAnimationHandle {.inline.} =
  result = wrapOwned(ffi.property_animation_create_layer_frame(layer, unsafeAddr fromFrame, unsafeAddr toFrame))

proc newPropertyAnimationBoundsOrigin*(layer: ptr Layer; fromPoint: GPoint; toPoint: GPoint): PropertyAnimationHandle {.inline.} =
  result = wrapOwned(ffi.property_animation_create_bounds_origin(layer, unsafeAddr fromPoint, unsafeAddr toPoint))

# Access to underlying Animation
proc animation*(h: PropertyAnimationHandle): ptr Animation {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  property_animation_get_animation(h.toPtr)

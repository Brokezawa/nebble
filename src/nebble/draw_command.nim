## High-level Nim wrapper for Pebble Draw Command API.
##
## Provides functionality for using PDC (Pebble Draw Command) vector images.

import nebble/ffi

export ffi.GDrawCommandImage, ffi.GDrawCommandSequence, ffi.GDrawCommandFrame
export ffi.GDrawCommandType

# ============================================================================
# GDrawCommandImage
# ============================================================================

proc newDrawCommandImage*(resourceId: uint32): ptr GDrawCommandImage {.inline.} =
  ## Create a GDrawCommandImage from a resource.
  ## Equivalent to C function `gdraw_command_image_create_with_resource(resource_id)`.
  ffi.gdraw_command_image_create_with_resource(resourceId)

proc clone*(image: ptr GDrawCommandImage): ptr GDrawCommandImage {.inline.} =
  ## Create a clone of a GDrawCommandImage.
  ## Equivalent to C function `gdraw_command_image_clone(image)`.
  ffi.gdraw_command_image_clone(image)

proc destroy*(image: ptr GDrawCommandImage) {.inline.} =
  ## Destroy a GDrawCommandImage and free its memory.
  ## Equivalent to C function `gdraw_command_image_destroy(image)`.
  ffi.gdraw_command_image_destroy(image)

proc draw*(ctx: ptr GContext, image: ptr GDrawCommandImage, offset: GPoint) {.inline.} =
  ## Draw a GDrawCommandImage.
  ## Equivalent to C function `gdraw_command_image_draw(ctx, image, offset)`.
  ffi.gdraw_command_image_draw(ctx, image, offset)

proc getCommandList*(image: ptr GDrawCommandImage): ptr GDrawCommandList {.inline.} =
  ## Get the list of commands in the image.
  ## Equivalent to C function `gdraw_command_image_get_command_list(image)`.
  ffi.gdraw_command_image_get_command_list(image)

proc setBoundsSize*(image: ptr GDrawCommandImage, size: GSize) {.inline.} =
  ## Set the bounds size of the image.
  ## Equivalent to C function `gdraw_command_image_set_bounds_size(image, size)`.
  ffi.gdraw_command_image_set_bounds_size(image, size)

proc getBoundsSize*(image: ptr GDrawCommandImage): GSize {.inline.} =
  ## Get the bounds size of the image.
  ## Equivalent to C function `gdraw_command_image_get_bounds_size(image)`.
  ffi.gdraw_command_image_get_bounds_size(image)

# ============================================================================
# GDrawCommandSequence
# ============================================================================

proc newDrawCommandSequence*(resourceId: uint32): ptr GDrawCommandSequence {.inline.} =
  ## Create a GDrawCommandSequence from a resource.
  ## Equivalent to C function `gdraw_command_sequence_create_with_resource(resource_id)`.
  ffi.gdraw_command_sequence_create_with_resource(resourceId)

proc destroy*(sequence: ptr GDrawCommandSequence) {.inline.} =
  ## Destroy a GDrawCommandSequence and free its memory.
  ## Equivalent to C function `gdraw_command_sequence_destroy(sequence)`.
  ffi.gdraw_command_sequence_destroy(sequence)

proc getFrame*(sequence: ptr GDrawCommandSequence, index: uint32): ptr GDrawCommandFrame {.inline.} =
  ## Get a frame from the sequence by index.
  ## Equivalent to C function `gdraw_command_sequence_get_frame_by_index(sequence, index)`.
  ffi.gdraw_command_sequence_get_frame_by_index(sequence, index)

proc getNumFrames*(sequence: ptr GDrawCommandSequence): uint32 {.inline.} =
  ## Get the total number of frames in the sequence.
  ## Equivalent to C function `gdraw_command_sequence_get_total_duration(sequence)`.
  # Wait, num frames or duration? C API has get_num_frames usually.
  # Let's check generated bindings for sequence functions.
  ffi.gdraw_command_sequence_get_num_frames(sequence)

proc getTotalDuration*(sequence: ptr GDrawCommandSequence): uint32 {.inline.} =
  ## Get the total duration of the sequence in milliseconds.
  ## Equivalent to C function `gdraw_command_sequence_get_total_duration(sequence)`.
  ffi.gdraw_command_sequence_get_total_duration(sequence)

proc getBoundsSize*(sequence: ptr GDrawCommandSequence): GSize {.inline.} =
  ## Get the bounds size of the sequence.
  ## Equivalent to C function `gdraw_command_sequence_get_bounds_size(sequence)`.
  ffi.gdraw_command_sequence_get_bounds_size(sequence)

proc setBoundsSize*(sequence: ptr GDrawCommandSequence, size: GSize) {.inline.} =
  ## Set the bounds size of the sequence.
  ## Equivalent to C function `gdraw_command_sequence_set_bounds_size(sequence, size)`.
  ffi.gdraw_command_sequence_set_bounds_size(sequence, size)

# ============================================================================
# GDrawCommandFrame
# ============================================================================

proc draw*(ctx: ptr GContext, sequence: ptr GDrawCommandSequence,
           frame: ptr GDrawCommandFrame, offset: GPoint) {.inline.} =
  ## Draw a single frame from a sequence.
  ## Equivalent to C function `gdraw_command_frame_draw(ctx, sequence, frame, offset)`.
  ffi.gdraw_command_frame_draw(ctx, sequence, frame, offset)

proc getDuration*(frame: ptr GDrawCommandFrame): uint32 {.inline.} =
  ## Get the duration of a frame.
  ## Equivalent to C function `gdraw_command_frame_get_duration(frame)`.
  ffi.gdraw_command_frame_get_duration(frame)

proc setDuration*(frame: ptr GDrawCommandFrame, duration: uint32) {.inline.} =
  ## Set the duration of a frame.
  ## Equivalent to C function `gdraw_command_frame_set_duration(frame, duration)`.
  ffi.gdraw_command_frame_set_duration(frame, duration)

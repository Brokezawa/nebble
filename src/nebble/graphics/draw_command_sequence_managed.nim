## ARC-managed wrapper for GDrawCommandSequence
import nebble/ffi
import nebble/ffi/managed
import nebble/graphics/draw_command

DefineUniqueHandle(DrawCommandSequence, GDrawCommandSequence,
                   gdraw_command_sequence_create_with_resource,
                   gdraw_command_sequence_destroy)

proc newDrawCommandSequenceHandle*(resourceId: uint32): DrawCommandSequenceHandle {.inline.} =
  result = DrawCommandSequenceHandle(ffi.gdraw_command_sequence_create_with_resource(resourceId))

proc getFrame*(h: DrawCommandSequenceHandle, index: uint32): ptr GDrawCommandFrame {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  result = ffi.gdraw_command_sequence_get_frame_by_index(h.toPtr, index)

proc getNumFrames*(h: DrawCommandSequenceHandle): uint32 {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  result = ffi.gdraw_command_sequence_get_num_frames(h.toPtr)

proc getTotalDuration*(h: DrawCommandSequenceHandle): uint32 {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  result = ffi.gdraw_command_sequence_get_total_duration(h.toPtr)

proc getBoundsSize*(h: DrawCommandSequenceHandle): GSize {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  result = ffi.gdraw_command_sequence_get_bounds_size(h.toPtr)

proc setBoundsSize*(h: DrawCommandSequenceHandle, size: GSize) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  ffi.gdraw_command_sequence_set_bounds_size(h.toPtr, size)

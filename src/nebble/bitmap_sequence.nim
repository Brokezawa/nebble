## High-level Nim wrapper for Pebble GBitmapSequence API.
##
## Provides animated bitmap (APNG) sequence playback. Useful for weather
## animations, activity indicators, and other animated graphics.

import nebble/ffi

export ffi.GBitmapSequence

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newBitmapSequence*(resourceId: uint32): ptr GBitmapSequence {.inline.} =
  ## Create a new GBitmapSequence from an APNG resource.
  ## Returns nil if the resource is not a valid APNG.
  ## Equivalent to C function `gbitmap_sequence_create_with_resource(resource_id)`.
  ffi.gbitmap_sequence_create_with_resource(resourceId)

proc destroy*(sequence: ptr GBitmapSequence) {.inline.} =
  ## Destroy a GBitmapSequence and free its memory.
  ## Equivalent to C function `gbitmap_sequence_destroy(sequence)`.
  ffi.gbitmap_sequence_destroy(sequence)

# ============================================================================
# Frame Management
# ============================================================================

proc updateNextFrame*(sequence: ptr GBitmapSequence; bitmap: ptr GBitmap;
                      delayMs: var uint32): bool {.inline.} =
  ## Advance to the next frame in the sequence and update the bitmap.
  ## Returns true if a frame was available, false if sequence ended.
  ## `delayMs` is set to the delay before the next frame should be shown.
  ## Equivalent to C function `gbitmap_sequence_update_bitmap_next_frame(...)`.
  result = ffi.gbitmap_sequence_update_bitmap_next_frame(sequence, bitmap, addr delayMs)

proc updateByElapsed*(sequence: ptr GBitmapSequence; bitmap: ptr GBitmap;
                      elapsedMs: uint32): bool {.inline.} =
  ## Update the bitmap based on elapsed time (for variable frame rates).
  ## Returns true if the frame was updated.
  ## Equivalent to C function `gbitmap_sequence_update_bitmap_by_elapsed(...)`.
  result = ffi.gbitmap_sequence_update_bitmap_by_elapsed(sequence, bitmap, elapsedMs)

proc restart*(sequence: ptr GBitmapSequence): bool {.inline.} =
  ## Restart the sequence from the first frame.
  ## Returns true on success.
  ## Equivalent to C function `gbitmap_sequence_restart(sequence)`.
  result = ffi.gbitmap_sequence_restart(sequence)

# ============================================================================
# Properties
# ============================================================================

proc bitmapSize*(sequence: ptr GBitmapSequence): GSize {.inline.} =
  ## Get the size of frames in this sequence.
  ## Useful for creating a blank bitmap to hold frames.
  ## Equivalent to C function `gbitmap_sequence_get_bitmap_size(sequence)`.
  result = ffi.gbitmap_sequence_get_bitmap_size(sequence)

proc currentFrameIndex*(sequence: ptr GBitmapSequence): int32 {.inline.} =
  ## Get the index of the current frame (0-based).
  ## Returns -1 if no frame is currently selected.
  ## Equivalent to C function `gbitmap_sequence_get_current_frame_idx(sequence)`.
  result = ffi.gbitmap_sequence_get_current_frame_idx(sequence)

proc totalFrames*(sequence: ptr GBitmapSequence): uint32 {.inline.} =
  ## Get the total number of frames in the sequence.
  ## Equivalent to C function `gbitmap_sequence_get_total_num_frames(sequence)`.
  result = ffi.gbitmap_sequence_get_total_num_frames(sequence)

proc playCount*(sequence: ptr GBitmapSequence): uint32 {.inline.} =
  ## Get the number of times the sequence will loop (0 = infinite).
  ## Equivalent to C function `gbitmap_sequence_get_play_count(sequence)`.
  result = ffi.gbitmap_sequence_get_play_count(sequence)

proc `playCount=`*(sequence: ptr GBitmapSequence; count: uint32) {.inline.} =
  ## Set the number of times the sequence will loop (0 = infinite).
  ## Equivalent to C function `gbitmap_sequence_set_play_count(sequence, count)`.
  ffi.gbitmap_sequence_set_play_count(sequence, count)

# ============================================================================
# Animation Helper
# ============================================================================

type
  AnimationHandler* = proc(sequence: ptr GBitmapSequence; bitmap: ptr GBitmap;
                           delayMs: uint32; context: pointer) {.cdecl.}
  ## Callback type for animation frame updates.

proc scheduleNextFrame*(sequence: ptr GBitmapSequence; bitmap: ptr GBitmap;
                        handler: AnimationHandler; context: pointer = nil): bool {.inline.} =
  ## Advance to next frame and schedule a timer for the next update.
  ## This is a convenience helper that combines updateNextFrame with timer scheduling.
  ## Returns false if animation has completed.
  ##
  ## Usage:
  ##   proc onFrame(seq, bmp: pointer; delay: uint32; ctx: pointer) {.cdecl.} =
  ##     layer_mark_dirty(bitmap_layer_get_layer(s_layer))
  ##     discard scheduleNextFrame(seq, bmp, onFrame)
  ##   discard scheduleNextFrame(s_seq, s_bmp, onFrame)
  var delayMs: uint32
  result = updateNextFrame(sequence, bitmap, delayMs)
  if result and delayMs > 0:
    discard ffi.app_timer_register(delayMs, cast[AppTimerCallback](handler), context)

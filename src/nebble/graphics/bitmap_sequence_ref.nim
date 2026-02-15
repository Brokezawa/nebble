## Reference-counted helper for GBitmapSequence with automatic timer scheduling
##
## Provides a small ref-wrapper around `GBitmapSequence` that owns or wraps
## the C sequence and offers a convenient `scheduleNextFrame` helper which
## advances frames and registers an app timer to continue playback.

import nebble/ffi
import nebble/graphics/bitmap_sequence
import nebble/foundation/timer

type BitmapSequenceRefObj = object
  seq: ptr GBitmapSequence
  owned: bool
  timer: ptr AppTimer
  bmp: ptr GBitmap
  handler: AnimationHandler
  userContext: pointer

proc `=destroy`(obj: var BitmapSequenceRefObj) =
  ## Cancel any scheduled timer and destroy owned sequence.
  if obj.timer != nil:
    cancel(obj.timer)
    obj.timer = nil
  if obj.seq != nil and obj.owned:
    destroy(obj.seq)
  obj.seq = nil
  obj.bmp = nil
  obj.handler = nil
  obj.userContext = nil

type BitmapSequenceRef* = ref BitmapSequenceRefObj

## Constructors
proc newBitmapSequenceRef*(resourceId: uint32): BitmapSequenceRef =
  new(result)
  result.seq = newBitmapSequence(resourceId)
  result.owned = true
  result.timer = nil
  result.bmp = nil
  result.handler = nil
  result.userContext = nil

proc wrapBitmapSequence*(seq: ptr GBitmapSequence; owned: bool = true): BitmapSequenceRef =
  new(result)
  result.seq = seq
  result.owned = owned
  result.timer = nil
  result.bmp = nil
  result.handler = nil
  result.userContext = nil

## Basic operations
proc isValid*(h: BitmapSequenceRef): bool {.inline.} =
  h != nil and h.seq != nil

proc updateNextFrame*(h: BitmapSequenceRef; bitmap: ptr GBitmap; delayMs: var uint32): bool {.inline.} =
  if not isValid(h):
    return false
  updateNextFrame(h.seq, bitmap, delayMs)

proc updateByElapsed*(h: BitmapSequenceRef; bitmap: ptr GBitmap; elapsedMs: uint32): bool {.inline.} =
  if not isValid(h):
    return false
  updateByElapsed(h.seq, bitmap, elapsedMs)

proc restart*(h: BitmapSequenceRef): bool {.inline.} =
  if not isValid(h):
    return false
  restart(h.seq)

proc bitmapSize*(h: BitmapSequenceRef): GSize {.inline.} =
  if not isValid(h):
    return makeGSize(0, 0)
  bitmapSize(h.seq)

proc currentFrameIndex*(h: BitmapSequenceRef): int32 {.inline.} =
  if not isValid(h):
    return -1
  currentFrameIndex(h.seq)

proc totalFrames*(h: BitmapSequenceRef): uint32 {.inline.} =
  if not isValid(h):
    return 0
  totalFrames(h.seq)

proc playCount*(h: BitmapSequenceRef): uint32 {.inline.} =
  if not isValid(h):
    return 0
  playCount(h.seq)

proc `playCount=`*(h: BitmapSequenceRef, count: uint32) {.inline.} =
  if not isValid(h):
    return
  h.seq.playCount = count

## Internal timer callback trampoline
proc internalBitmapSeqTimer(ctx: pointer) {.cdecl.} =
  ## Called by app timer; advance the sequence, call user handler, and
  ## reschedule if there are more frames.
  if ctx == nil:
    return
  let h = cast[BitmapSequenceRef](ctx)
  if h == nil: return
  if h.seq == nil:
    return

  var delay: uint32
  # Advance frame; if bmp is not set we cannot update
  if h.bmp == nil:
    return
  if not updateNextFrame(h, h.bmp, delay):
    # sequence finished
    h.timer = nil
    return

  # Call user handler if provided
  if h.handler != nil:
    h.handler(h.seq, h.bmp, delay, h.userContext)

  # Schedule next frame if needed
  if delay > 0:
    h.timer = after(delay, internalBitmapSeqTimer, cast[pointer](h))
  else:
    h.timer = nil

## Automatic scheduling helper
proc scheduleNextFrame*(h: BitmapSequenceRef; bitmap: ptr GBitmap; handler: AnimationHandler; context: pointer = nil): bool =
  ## Advance to the next frame and schedule continued playback using
  ## `app_timer_register` internally. Returns false if the sequence has
  ## completed or if the handle is invalid.
  if not isValid(h) or bitmap == nil:
    return false

  # Cancel any existing timer
  if h.timer != nil:
    cancel(h.timer)
    h.timer = nil

  h.bmp = bitmap
  h.handler = handler
  h.userContext = context

  var delay: uint32
  if not updateNextFrame(h, bitmap, delay):
    return false

  if delay > 0:
    h.timer = after(delay, internalBitmapSeqTimer, cast[pointer](h))
  else:
    h.timer = nil

  return true

## Usage example in documentation
# Example:
#   var seq = newBitmapSequenceRef(RESOURCE_ID_ANIM)
#   var bmp = gbitmap_create_blank(seq.bitmapSize, GBitmapFormat8Bit)
#   proc onFrame(s: ptr GBitmapSequence; b: ptr GBitmap; delay: uint32; ctx: pointer) {.cdecl.} =
#     # mark layer dirty / draw
#     discard
#   discard scheduleNextFrame(seq, bmp, onFrame)

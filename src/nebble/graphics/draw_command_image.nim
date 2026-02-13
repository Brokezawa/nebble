## ARC-managed wrapper for GDrawCommandImage
##
## Provides a safe, RAII-style handle for draw-command images (PDC resources).

import nebble/ffi
import nebble/ffi/managed
import nebble/graphics/draw_command

# Define unique ownership handle
DefineUniqueHandle(DrawCommandImage, GDrawCommandImage,
                   gdraw_command_image_create_with_resource,
                   gdraw_command_image_destroy)

proc newDrawCommandImageHandle*(resourceId: uint32): DrawCommandImageHandle {.inline.} =
  ## Create a managed DrawCommandImage from a resource id.
  result = wrapOwned(ffi.gdraw_command_image_create_with_resource(resourceId))

proc clone*(h: DrawCommandImageHandle): DrawCommandImageHandle {.inline.} =
  ## Clone the underlying image into a new managed handle.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  result = wrapOwned(ffi.gdraw_command_image_clone(h.toPtr))

proc draw*(h: DrawCommandImageHandle, ctx: ptr GContext, offset: GPoint) {.inline.} =
  ## Draw the image into the provided graphics context at `offset`.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  ffi.gdraw_command_image_draw(ctx, h.toPtr, offset)

proc getCommandList*(h: DrawCommandImageHandle): ptr GDrawCommandList {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  result = ffi.gdraw_command_image_get_command_list(h.toPtr)

proc setBoundsSize*(h: DrawCommandImageHandle, size: GSize) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  ffi.gdraw_command_image_set_bounds_size(h.toPtr, size)

proc getBoundsSize*(h: DrawCommandImageHandle): GSize {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  result = ffi.gdraw_command_image_get_bounds_size(h.toPtr)

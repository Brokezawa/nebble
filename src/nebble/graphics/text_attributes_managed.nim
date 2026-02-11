## ARC-managed wrapper for GTextAttributes
import nebble/ffi
import nebble/ffi/managed
import nebble/graphics/text_attributes

DefineUniqueHandle(TextAttributes, GTextAttributes,
                   graphics_text_attributes_create,
                   graphics_text_attributes_destroy)

proc newTextAttributesHandle*(): TextAttributesHandle {.inline.} =
  result = TextAttributesHandle(ffi.graphics_text_attributes_create())

proc enableScreenTextFlow*(h: TextAttributesHandle, inset: uint8) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  ffi.graphics_text_attributes_enable_screen_text_flow(h.toPtr, inset)

proc restoreDefaultTextFlow*(h: TextAttributesHandle) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  ffi.graphics_text_attributes_restore_default_text_flow(h.toPtr)

proc enablePaging*(h: TextAttributesHandle; origin: GPoint; pageRect: GRect) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  ffi.graphics_text_attributes_enable_paging(h.toPtr, origin, pageRect)

proc restoreDefaultPaging*(h: TextAttributesHandle) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  ffi.graphics_text_attributes_restore_default_paging(h.toPtr)

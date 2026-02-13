## ARC-managed wrapper for GTextAttributes
import nebble/ffi
import nebble/ffi/managed

export ffi.GTextAttributes

DefineUniqueHandle(TextAttributes, GTextAttributes,
                   graphics_text_attributes_create,
                   graphics_text_attributes_destroy)

proc newTextAttributesHandle*(): TextAttributesHandle {.inline.} =
  wrapOwned(ffi.graphics_text_attributes_create())

proc newTextAttributes*(): TextAttributesHandle {.inline.} =
  ## Alias for `newTextAttributesHandle`.
  result = newTextAttributesHandle()

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

# ============================================================================
# Nim-idiomatic Helpers (ported from unmanaged)
# ============================================================================

type
  TextFlowConfig* = object
    ## Configuration for text flow behavior
    inset*: uint8      ## Pixels to inset from screen edge (0 = disabled)

  PagingConfig* = object
    ## Configuration for pagination behavior
    enabled*: bool     ## Whether pagination is enabled
    origin*: GPoint    ## Pagination reference point
    pageSize*: GSize   ## Size of each page

proc apply*(h: TextAttributesHandle; config: TextFlowConfig) {.inline.} =
  ## Apply text flow configuration to attributes.
  ## Convenience helper for programmatic configuration.
  if config.inset > 0:
    enableScreenTextFlow(h, config.inset)
  else:
    restoreDefaultTextFlow(h)

proc apply*(h: TextAttributesHandle; config: PagingConfig) {.inline.} =
  ## Apply paging configuration to attributes.
  ## Convenience helper for programmatic configuration.
  if config.enabled:
    enablePaging(h, config.origin, makeGRect(config.origin.x, config.origin.y, config.pageSize.w, config.pageSize.h))
  else:
    restoreDefaultPaging(h)

proc withTextFlow*(h: TextAttributesHandle; inset: uint8): TextAttributesHandle {.inline.} =
  ## Fluent API: Enable text flow and return attrs for chaining.
  ## Usage: newTextAttributes().withTextFlow(5).withPaging(...)
  enableScreenTextFlow(h, inset)
  result = h

proc withPaging*(h: TextAttributesHandle; origin: GPoint; pageRect: GRect): TextAttributesHandle {.inline.} =
  ## Fluent API: Enable paging and return attrs for chaining.
  ## Usage: newTextAttributes().withTextFlow(5).withPaging(bounds.origin, bounds)
  enablePaging(h, origin, pageRect)
  result = h

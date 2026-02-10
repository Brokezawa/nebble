## High-level Nim wrapper for Pebble Graphics Text Attributes API.
##
## Provides advanced text rendering control including text flow around screen
## edges and pagination for animating/scrolling text on round displays.

import nebble/ffi

export ffi.GTextAttributes

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newTextAttributes*(): ptr GTextAttributes {.inline.} =
  ## Create a new GTextAttributes object for advanced text rendering.
  ## Returns nil on failure (out of memory).
  ## Equivalent to C function `graphics_text_attributes_create()`.
  ffi.graphics_text_attributes_create()

proc destroy*(attrs: ptr GTextAttributes) {.inline.} =
  ## Destroy a GTextAttributes object and free its memory.
  ## Equivalent to C function `graphics_text_attributes_destroy(attrs)`.
  ffi.graphics_text_attributes_destroy(attrs)

# ============================================================================
# Text Flow (Round Screen Support)
# ============================================================================

proc enableScreenTextFlow*(attrs: ptr GTextAttributes; inset: uint8) {.inline.} =
  ## Enable text flow with the specified inset from screen edges.
  ## Text will wrap within an inset rectangle, useful on round screens
  ## where text shouldn't touch the screen edge.
  ##
  ## The inset value defines how many pixels from the edge the text should stay.
  ## Typical values: 5-10 pixels for round displays.
  ##
  ## Equivalent to C function `graphics_text_attributes_enable_screen_text_flow(attrs, inset)`.
  ffi.graphics_text_attributes_enable_screen_text_flow(attrs, inset)

proc restoreDefaultTextFlow*(attrs: ptr GTextAttributes) {.inline.} =
  ## Restore default text flow behavior (no screen edge inset).
  ## Equivalent to C function `graphics_text_attributes_restore_default_text_flow(attrs)`.
  ffi.graphics_text_attributes_restore_default_text_flow(attrs)

# ============================================================================
# Pagination
# ============================================================================

proc enablePaging*(attrs: ptr GTextAttributes; origin: GPoint; pageRect: GRect) {.inline.} =
  ## Enable pagination with a fixed reference point and page rectangle.
  ## Used for animating text or showing one "page" of text at a time.
  ##
  ## `origin` - The reference point for pagination (usually bounds.origin)
  ## `pageRect` - The rectangle defining each page (usually bounds)
  ##
  ## Equivalent to C function `graphics_text_attributes_enable_paging(attrs, origin, page_rect)`.
  ffi.graphics_text_attributes_enable_paging(attrs, origin, pageRect)

proc restoreDefaultPaging*(attrs: ptr GTextAttributes) {.inline.} =
  ## Restore default paging behavior (no pagination).
  ## Equivalent to C function `graphics_text_attributes_restore_default_paging(attrs)`.
  ffi.graphics_text_attributes_restore_default_paging(attrs)

# ============================================================================
# Nim-idiomatic Helpers
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

proc apply*(attrs: ptr GTextAttributes; config: TextFlowConfig) {.inline.} =
  ## Apply text flow configuration to attributes.
  ## Convenience helper for programmatic configuration.
  if config.inset > 0:
    enableScreenTextFlow(attrs, config.inset)
  else:
    restoreDefaultTextFlow(attrs)

proc apply*(attrs: ptr GTextAttributes; config: PagingConfig) {.inline.} =
  ## Apply paging configuration to attributes.
  ## Convenience helper for programmatic configuration.
  if config.enabled:
    enablePaging(attrs, config.origin, makeGRect(config.origin.x, config.origin.y, config.pageSize.w, config.pageSize.h))
  else:
    restoreDefaultPaging(attrs)

proc withTextFlow*(attrs: ptr GTextAttributes; inset: uint8): ptr GTextAttributes {.inline.} =
  ## Fluent API: Enable text flow and return attrs for chaining.
  ## Usage: newTextAttributes().withTextFlow(5).withPaging(...)
  enableScreenTextFlow(attrs, inset)
  result = attrs

proc withPaging*(attrs: ptr GTextAttributes; origin: GPoint; pageRect: GRect): ptr GTextAttributes {.inline.} =
  ## Fluent API: Enable paging and return attrs for chaining.
  ## Usage: newTextAttributes().withTextFlow(5).withPaging(bounds.origin, bounds)
  enablePaging(attrs, origin, pageRect)
  result = attrs

# ============================================================================
# Integration with TextLayer
# ============================================================================

proc enableScreenTextFlowAndPaging*(textLayer: ptr TextLayer; inset: uint8) {.inline.} =
  ## Enable both text flow and paging on a TextLayer (one-shot convenience).
  ## This is the simplest way to enable round-screen text handling.
  ##
  ## Must be called AFTER the TextLayer is added to the layer hierarchy.
  ##
  ## Equivalent to C function `text_layer_enable_screen_text_flow_and_paging(...)`.
  ffi.text_layer_enable_screen_text_flow_and_paging(textLayer, inset)

proc restoreDefaultTextFlowAndPaging*(textLayer: ptr TextLayer) {.inline.} =
  ## Restore default text flow and paging on a TextLayer.
  ## Equivalent to C function `text_layer_restore_default_text_flow_and_paging(...)`.
  ffi.text_layer_restore_default_text_flow_and_paging(textLayer)

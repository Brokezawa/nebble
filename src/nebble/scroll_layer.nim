## High-level Nim wrapper for Pebble ScrollLayer API.
##
## A ScrollLayer provides a scrollable container for content larger than the
## display. It handles scroll offset, paging, and scroll indicators.

import nebble/ffi

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newScrollLayer*(frame: GRect): ptr ScrollLayer {.inline.} =
  ## Create a new ScrollLayer with the specified frame.
  ## Equivalent to C function `ffi.scroll_layer_create(frame)`.
  ffi.scroll_layer_create(frame)

proc destroy*(scrollLayer: ptr ScrollLayer) {.inline.} =
  ## Destroy the scroll layer and free its memory.
  ## Equivalent to C function `ffi.scroll_layer_destroy(scroll_layer)`.
  ffi.scroll_layer_destroy(scrollLayer)

# ============================================================================
# Conversion
# ============================================================================

proc getLayer*(scrollLayer: ptr ScrollLayer): ptr Layer {.inline.} =
  ## Get the underlying Layer for hierarchy operations.
  ## Equivalent to C function `ffi.scroll_layer_get_layer(scroll_layer)`.
  ffi.scroll_layer_get_layer(scrollLayer)

# ============================================================================
# Content Management
# ============================================================================

proc addChild*(scrollLayer: ptr ScrollLayer, child: ptr Layer) {.inline.} =
  ## Add a child layer to the scroll layer's content.
  ## Equivalent to C function `ffi.scroll_layer_add_child(scroll_layer, child)`.
  ffi.scroll_layer_add_child(scrollLayer, child)

proc `contentSize=`*(scrollLayer: ptr ScrollLayer, size: GSize) {.inline.} =
  ## Set the total size of scrollable content.
  ## Equivalent to C function `ffi.scroll_layer_set_content_size(scroll_layer, size)`.
  ffi.scroll_layer_set_content_size(scrollLayer, size)

proc contentSize*(scrollLayer: ptr ScrollLayer): GSize {.inline.} =
  ## Get the total size of scrollable content.
  ## Equivalent to C function `ffi.scroll_layer_get_content_size(scroll_layer)`.
  ffi.scroll_layer_get_content_size(scrollLayer)

# ============================================================================
# Scroll Offset
# ============================================================================

proc `contentOffset=`*(scrollLayer: ptr ScrollLayer, offset: GPoint, 
                       animated: bool) {.inline.} =
  ## Set the scroll offset (top-left corner position).
  ## Equivalent to C function `ffi.scroll_layer_set_content_offset(scroll_layer, offset, animated)`.
  ffi.scroll_layer_set_content_offset(scrollLayer, offset, animated)

proc contentOffset*(scrollLayer: ptr ScrollLayer): GPoint {.inline.} =
  ## Get the current scroll offset.
  ## Equivalent to C function `ffi.scroll_layer_get_content_offset(scroll_layer)`.
  ffi.scroll_layer_get_content_offset(scrollLayer)

# ============================================================================
# Frame
# ============================================================================

proc `frame=`*(scrollLayer: ptr ScrollLayer, frame: GRect) {.inline.} =
  ## Set the frame of the scroll layer.
  ## Equivalent to C function `ffi.scroll_layer_set_frame(scroll_layer, frame)`.
  ffi.scroll_layer_set_frame(scrollLayer, frame)

# ============================================================================
# Callbacks & Click Config
# ============================================================================

proc setCallbacks*(scrollLayer: ptr ScrollLayer, callbacks: ScrollLayerCallbacks) {.inline.} =
  ## Set the scroll layer callbacks.
  ## Equivalent to C function `ffi.scroll_layer_set_callbacks(scroll_layer, callbacks)`.
  ffi.scroll_layer_set_callbacks(scrollLayer, callbacks)

proc `context=`*(scrollLayer: ptr ScrollLayer, context: pointer) {.inline.} =
  ## Set the user context pointer.
  ## Equivalent to C function `ffi.scroll_layer_set_context(scroll_layer, context)`.
  ffi.scroll_layer_set_context(scrollLayer, context)

proc setClickConfigOntoWindow*(scrollLayer: ptr ScrollLayer, window: ptr Window) {.inline.} =
  ## Configure click handlers for scrolling on a window.
  ## Equivalent to C function `ffi.scroll_layer_set_click_config_onto_window(scroll_layer, window)`.
  ffi.scroll_layer_set_click_config_onto_window(scrollLayer, window)

# ============================================================================
# Click Handlers (for manual use)
# ============================================================================

proc scrollUpClickHandler*(recognizer: ClickRecognizerRef, context: pointer) {.inline.} =
  ## Built-in click handler for scrolling up.
  ## Equivalent to C function `ffi.scroll_layer_scroll_up_click_handler(recognizer, context)`.
  ffi.scroll_layer_scroll_up_click_handler(recognizer, context)

proc scrollDownClickHandler*(recognizer: ClickRecognizerRef, context: pointer) {.inline.} =
  ## Built-in click handler for scrolling down.
  ## Equivalent to C function `ffi.scroll_layer_scroll_down_click_handler(recognizer, context)`.
  ffi.scroll_layer_scroll_down_click_handler(recognizer, context)

# ============================================================================
# Appearance
# ============================================================================

proc `shadowHidden=`*(scrollLayer: ptr ScrollLayer, hidden: bool) {.inline.} =
  ## Hide or show the scroll shadow.
  ## Equivalent to C function `ffi.scroll_layer_set_shadow_hidden(scroll_layer, hidden)`.
  ffi.scroll_layer_set_shadow_hidden(scrollLayer, hidden)

proc shadowHidden*(scrollLayer: ptr ScrollLayer): bool {.inline.} =
  ## Check if the scroll shadow is hidden.
  ## Equivalent to C function `ffi.scroll_layer_get_shadow_hidden(scroll_layer)`.
  ffi.scroll_layer_get_shadow_hidden(scrollLayer)

# ============================================================================
# Paging
# ============================================================================

proc `paging=`*(scrollLayer: ptr ScrollLayer, pagingEnabled: bool) {.inline.} =
  ## Enable or disable paging mode.
  ## Equivalent to C function `ffi.scroll_layer_set_paging(scroll_layer, paging_enabled)`.
  ffi.scroll_layer_set_paging(scrollLayer, pagingEnabled)

proc paging*(scrollLayer: ptr ScrollLayer): bool {.inline.} =
  ## Check if paging is enabled.
  ## Equivalent to C function `ffi.scroll_layer_get_paging(scroll_layer)`.
  ffi.scroll_layer_get_paging(scrollLayer)

# ============================================================================
# Content Indicator
# ============================================================================

when declared(ffi.scroll_layer_get_content_indicator):
  proc contentIndicator*(scrollLayer: ptr ScrollLayer): ptr ContentIndicator {.inline.} =
    ## Get the content indicator for this scroll layer.
    ## Equivalent to C function `ffi.scroll_layer_get_content_indicator(scroll_layer)`.
    ## NOTE: May not be available on older platforms.
    ffi.scroll_layer_get_content_indicator(scrollLayer)

## ARC-Managed ScrollLayer Handle
import nebble/ffi
import nebble/ffi/managed

export ffi.ScrollLayer, ffi.ScrollLayerCallbacks

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(ScrollLayer, ScrollLayer,
                  scroll_layer_create, scroll_layer_destroy)

# ============================================================================
# Constructors
# ============================================================================

proc newScrollLayerHandle*(frame: GRect): ScrollLayerHandle {.inline.} =
  wrapOwned(ffi.scroll_layer_create(frame))

proc newScrollLayer*(frame: GRect): ScrollLayerHandle {.inline.} =
  result = newScrollLayerHandle(frame)

# ============================================================================
# Layer Access
# ============================================================================

proc getLayer*(h: ScrollLayerHandle): ptr Layer {.inline.} =
  ffi.scroll_layer_get_layer(h.toPtr)

proc setContentSize*(h: var ScrollLayerHandle, size: GSize) {.inline.} =
  ffi.scroll_layer_set_content_size(h.pRaw, size)

proc `contentSize=`*(h: var ScrollLayerHandle, size: GSize) {.inline.} =
  ffi.scroll_layer_set_content_size(h.pRaw, size)

proc setClickConfigOntoWindow*(h: var ScrollLayerHandle, window: ptr Window) {.inline.} =
  ffi.scroll_layer_set_click_config_onto_window(h.pRaw, window)

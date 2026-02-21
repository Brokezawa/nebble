## ARC-Managed ScrollLayer Handle
import nebble/ffi
import nebble/ffi/managed
import nebble/ui/layer
import nebble/ui/content_indicator

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
  if h.pRaw == nil: return nil
  ffi.scroll_layer_get_layer(h.toPtr)

proc setContentSize*(h: var ScrollLayerHandle, size: GSize) {.inline.} =
  if h.pRaw == nil: return
  ffi.scroll_layer_set_content_size(h.pRaw, size)

proc `contentSize=`*(h: var ScrollLayerHandle, size: GSize) {.inline.} =
  if h.pRaw == nil: return
  ffi.scroll_layer_set_content_size(h.pRaw, size)

proc setClickConfigOntoWindow*(h: var ScrollLayerHandle, window: ptr Window) {.inline.} =
  if h.pRaw == nil or window == nil: return
  ffi.scroll_layer_set_click_config_onto_window(h.pRaw, window)

proc addChild*(h: ScrollLayerHandle, child: var LayerHandle) {.inline.} =
  ## Add a child layer to the scroll layer's content area.
  ## The scroll layer takes ownership of the child.
  if h.pRaw != nil and child.pRaw != nil:
    ffi.scroll_layer_add_child(h.pRaw, child.pRaw)
    child.setParent(ffi.scroll_layer_get_layer(h.pRaw))

proc getContentIndicator*(h: ScrollLayerHandle): ContentIndicatorHandle {.inline.} =
  ## Get the content indicator for this scroll layer.
  if h.pRaw == nil: return default(ContentIndicatorHandle)
  result = toHandle(ffi.scroll_layer_get_content_indicator(h.pRaw))

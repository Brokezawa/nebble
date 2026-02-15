## ARC-Managed MenuLayer Handle
import nebble/ffi
import nebble/ffi/managed

export ffi.MenuLayer, ffi.MenuLayerCallbacks, ffi.MenuIndex, ffi.MenuRowAlign
export ffi.MenuLayerSelectionChangedCallback, ffi.MenuLayerGetCellHeightCallback
export ffi.MenuLayerSelectionWillChangeCallback, ffi.MenuLayerDrawRowCallback
export ffi.MenuLayerGetNumberOfSectionsCallback, ffi.MenuLayerGetNumberOfRowsInSectionsCallback
export ffi.MenuLayerDrawHeaderCallback, ffi.MenuLayerDrawBackgroundCallback
export ffi.MenuLayerSelectCallback, ffi.MenuLayerGetHeaderHeightCallback
export ffi.MenuLayerGetSeparatorHeightCallback, ffi.MenuLayerDrawSeparatorCallback

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(MenuLayer, MenuLayer,
                  menu_layer_create, menu_layer_destroy)

# ============================================================================
# Constructors
# ============================================================================

proc newMenuLayerHandle*(frame: GRect): MenuLayerHandle {.inline.} =
  wrapOwned(ffi.menu_layer_create(frame))

proc newMenuLayer*(frame: GRect): MenuLayerHandle {.inline.} =
  result = newMenuLayerHandle(frame)

# ============================================================================
# Layer Access
# ============================================================================

proc getLayer*(h: MenuLayerHandle): ptr Layer {.inline.} =
  if h.pRaw == nil: return nil
  ffi.menu_layer_get_layer(h.toPtr)

proc setClickConfigOntoWindow*(h: var MenuLayerHandle, window: ptr Window) {.inline.} =
  if h.pRaw == nil or window == nil: return
  ffi.menu_layer_set_click_config_onto_window(h.pRaw, window)

proc setCallbacks*(h: var MenuLayerHandle, callbackContext: pointer, 
                   callbacks: MenuLayerCallbacks) {.inline.} =
  ## Set the callbacks for the menu layer.
  ## 
  ## **Parameters:**
  ## - `callbackContext`: Pointer to data that will be passed to each callback.
  ## - `callbacks`: Struct containing the function pointers for menu events.
  if h.pRaw == nil: return
  ffi.menu_layer_set_callbacks(h.pRaw, callbackContext, callbacks)

proc reloadData*(h: var MenuLayerHandle) {.inline.} =
  ## Reload the menu data. Call this if the underlying data has changed.
  if h.pRaw == nil: return
  ffi.menu_layer_reload_data(h.pRaw)

proc getSelectedIndex*(h: MenuLayerHandle): MenuIndex {.inline.} =
  ## Get the currently selected menu index.
  if h.pRaw == nil: return MenuIndex(section: 0, row: 0)
  ffi.menu_layer_get_selected_index(h.pRaw)

proc setSelectedIndex*(h: var MenuLayerHandle, index: MenuIndex, 
                       align: MenuRowAlign, animated: bool) {.inline.} =
  ## Set the currently selected menu index.
  if h.pRaw == nil: return
  ffi.menu_layer_set_selected_index(h.pRaw, index, align, animated)

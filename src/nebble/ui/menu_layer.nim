## High-level Nim wrapper for Pebble MenuLayer API.
##
## A MenuLayer displays a scrollable list of menu items organized into
## sections. It provides callbacks for rendering cells, headers, and handling
## selection.

import nebble/ffi

export ffi.MenuLayer, ffi.MenuLayerCallbacks, ffi.MenuIndex, ffi.MenuRowAlign
export ffi.MenuCellSpan, ffi.MenuRowAlign

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newMenuLayer*(frame: GRect): ptr MenuLayer {.inline.} =
  ## Create a new MenuLayer with the specified frame.
  ## Equivalent to C function `menu_layer_create(frame)`.
  ffi.menu_layer_create(frame)

proc destroy*(menuLayer: ptr MenuLayer) {.inline.} =
  ## Destroy the menu layer and free its memory.
  ## Equivalent to C function `menu_layer_destroy(menu_layer)`.
  ffi.menu_layer_destroy(menuLayer)

# ============================================================================
# Conversion
# ============================================================================

proc getLayer*(menuLayer: ptr MenuLayer): ptr Layer {.inline.} =
  ## Get the underlying Layer for hierarchy operations.
  ## Equivalent to C function `menu_layer_get_layer(menu_layer)`.
  ffi.menu_layer_get_layer(menuLayer)

proc getScrollLayer*(menuLayer: ptr MenuLayer): ptr ScrollLayer {.inline.} =
  ## Get the underlying ScrollLayer.
  ## Equivalent to C function `menu_layer_get_scroll_layer(menu_layer)`.
  ffi.menu_layer_get_scroll_layer(menuLayer)

# ============================================================================
# Callbacks
# ============================================================================

proc setCallbacks*(menuLayer: ptr MenuLayer, 
                   callbackContext: pointer,
                   callbacks: MenuLayerCallbacks) {.inline.} =
  ## Set the callbacks for menu layer behavior.
  ## Equivalent to C function `menu_layer_set_callbacks(menu_layer, callback_context, callbacks)`.
  ffi.menu_layer_set_callbacks(menuLayer, callbackContext, callbacks)

proc setClickConfigOntoWindow*(menuLayer: ptr MenuLayer, window: ptr Window) {.inline.} =
  ## Configure click handlers for the menu layer on a window.
  ## Equivalent to C function `menu_layer_set_click_config_onto_window(menu_layer, window)`.
  ffi.menu_layer_set_click_config_onto_window(menuLayer, window)

# ============================================================================
# Selection
# ============================================================================

proc setSelectedNext*(menuLayer: ptr MenuLayer, up: bool, reason: MenuRowAlign,
                      animated: bool) {.inline.} =
  ## Move selection to the next or previous item.
  ## Equivalent to C function `menu_layer_set_selected_next(menu_layer, up, reason, animated)`.
  ffi.menu_layer_set_selected_next(menuLayer, up, reason, animated)

proc `selectedIndex=`*(menuLayer: ptr MenuLayer, index: MenuIndex,
                       reason: MenuRowAlign, animated: bool) {.inline.} =
  ## Set the selected menu item by index.
  ## Equivalent to C function `menu_layer_set_selected_index(menu_layer, index, reason, animated)`.
  ffi.menu_layer_set_selected_index(menuLayer, index, reason, animated)

proc selectedIndex*(menuLayer: ptr MenuLayer): MenuIndex {.inline.} =
  ## Get the currently selected menu item index.
  ## Equivalent to C function `menu_layer_get_selected_index(menu_layer)`.
  ffi.menu_layer_get_selected_index(menuLayer)

proc isIndexSelected*(menuLayer: ptr MenuLayer, index: ptr MenuIndex): bool {.inline.} =
  ## Check if the given index is currently selected.
  ## Equivalent to C function `menu_layer_is_index_selected(menu_layer, index)`.
  ffi.menu_layer_is_index_selected(menuLayer, index)

# ============================================================================
# Data
# ============================================================================

proc reloadData*(menuLayer: ptr MenuLayer) {.inline.} =
  ## Reload all menu data from callbacks.
  ## Equivalent to C function `menu_layer_reload_data(menu_layer)`.
  ffi.menu_layer_reload_data(menuLayer)

# ============================================================================
# Appearance
# ============================================================================

when declared(ffi.menu_layer_set_normal_colors):
  proc setNormalColors*(menuLayer: ptr MenuLayer, background: GColor, 
                        foreground: GColor) {.inline.} =
    ## Set the colors for normal (non-highlighted) cells.
    ## Equivalent to C function `menu_layer_set_normal_colors(menu_layer, background, foreground)`.
    ## NOTE: Not available on black-and-white platforms (Aplite, Diorite).
    ffi.menu_layer_set_normal_colors(menuLayer, background, foreground)

when declared(ffi.menu_layer_set_highlight_colors):
  proc setHighlightColors*(menuLayer: ptr MenuLayer, background: GColor,
                           foreground: GColor) {.inline.} =
    ## Set the colors for highlighted (selected) cells.
    ## Equivalent to C function `menu_layer_set_highlight_colors(menu_layer, background, foreground)`.
    ## NOTE: Not available on black-and-white platforms (Aplite, Diorite).
    ffi.menu_layer_set_highlight_colors(menuLayer, background, foreground)

proc padBottomEnable*(menuLayer: ptr MenuLayer, enable: bool) {.inline.} =
  ## Enable or disable bottom padding.
  ## Equivalent to C function `menu_layer_pad_bottom_enable(menu_layer, enable)`.
  ffi.menu_layer_pad_bottom_enable(menuLayer, enable)

# ============================================================================
# Center Focus
# ============================================================================

proc `centerFocused=`*(menuLayer: ptr MenuLayer, centerFocused: bool) {.inline.} =
  ## Set whether the selected item should be centered.
  ## Equivalent to C function `menu_layer_set_center_focused(menu_layer, center_focused)`.
  ffi.menu_layer_set_center_focused(menuLayer, centerFocused)

proc centerFocused*(menuLayer: ptr MenuLayer): bool {.inline.} =
  ## Check if the selected item is centered.
  ## Equivalent to C function `menu_layer_get_center_focused(menu_layer)`.
  ffi.menu_layer_get_center_focused(menuLayer)

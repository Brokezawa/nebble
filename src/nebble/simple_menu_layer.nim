## High-level Nim wrapper for Pebble SimpleMenuLayer API.
##
## A wrapper around MenuLayer for simpler static menus.

import nebble/ffi

export ffi.SimpleMenuLayer, ffi.SimpleMenuSection, ffi.SimpleMenuItem

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newSimpleMenuLayer*(frame: GRect, window: ptr Window,
                         sections: ptr SimpleMenuSection,
                         numSections: int32, context: pointer): ptr SimpleMenuLayer {.inline.} =
  ## Create a new SimpleMenuLayer.
  ## Equivalent to C function `simple_menu_layer_create(...)`.
  ffi.simple_menu_layer_create(frame, window, sections, numSections, context)

proc destroy*(menuLayer: ptr SimpleMenuLayer) {.inline.} =
  ## Destroy the simple menu layer.
  ## Equivalent to C function `simple_menu_layer_destroy(menu_layer)`.
  ffi.simple_menu_layer_destroy(menuLayer)

# ============================================================================
# Conversion
# ============================================================================

proc getLayer*(menuLayer: ptr SimpleMenuLayer): ptr Layer {.inline.} =
  ## Get the underlying Layer.
  ## Equivalent to C function `simple_menu_layer_get_layer(menu_layer)`.
  ffi.simple_menu_layer_get_layer(menuLayer)

# ============================================================================
# Selection
# ============================================================================

proc selectedIndex*(menuLayer: ptr SimpleMenuLayer): int32 {.inline.} =
  ## Get the currently selected item index.
  ## Equivalent to C function `simple_menu_layer_get_selected_index(menu_layer)`.
  ffi.simple_menu_layer_get_selected_index(menuLayer)

proc `selectedIndex=`*(menuLayer: ptr SimpleMenuLayer, index: int32, animated: bool) {.inline.} =
  ## Set the selected item index.
  ## Equivalent to C function `simple_menu_layer_set_selected_index(menu_layer, index, animated)`.
  ffi.simple_menu_layer_set_selected_index(menuLayer, index, animated)

## High-level Nim wrapper for Pebble ActionBarLayer API.
##
## An ActionBarLayer displays up to 3 icon buttons on the right side of a
## window (UP, SELECT, DOWN). It automatically adjusts for round displays.

import nebble/ffi

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newActionBarLayer*(): ptr ActionBarLayer {.inline.} =
  ## Create a new ActionBarLayer.
  ## Equivalent to C function `ffi.action_bar_layer_create()`.
  ffi.action_bar_layer_create()

proc destroy*(actionBar: ptr ActionBarLayer) {.inline.} =
  ## Destroy the action bar layer and free its memory.
  ## Equivalent to C function `ffi.action_bar_layer_destroy(action_bar_layer)`.
  ffi.action_bar_layer_destroy(actionBar)

# ============================================================================
# Conversion
# ============================================================================

proc getLayer*(actionBar: ptr ActionBarLayer): ptr Layer {.inline.} =
  ## Get the underlying Layer for hierarchy operations.
  ## Equivalent to C function `ffi.action_bar_layer_get_layer(action_bar_layer)`.
  ffi.action_bar_layer_get_layer(actionBar)

# ============================================================================
# Window Integration
# ============================================================================

proc addToWindow*(actionBar: ptr ActionBarLayer, window: ptr Window) {.inline.} =
  ## Add the action bar to a window (right side).
  ## Equivalent to C function `ffi.action_bar_layer_add_to_window(action_bar, window)`.
  ffi.action_bar_layer_add_to_window(actionBar, window)

proc removeFromWindow*(actionBar: ptr ActionBarLayer) {.inline.} =
  ## Remove the action bar from its window.
  ## Equivalent to C function `ffi.action_bar_layer_remove_from_window(action_bar)`.
  ffi.action_bar_layer_remove_from_window(actionBar)

# ============================================================================
# Click Configuration
# ============================================================================

proc `context=`*(actionBar: ptr ActionBarLayer, context: pointer) {.inline.} =
  ## Set the user context pointer for click callbacks.
  ## Equivalent to C function `ffi.action_bar_layer_set_context(action_bar, context)`.
  ffi.action_bar_layer_set_context(actionBar, context)

proc `clickConfigProvider=`*(actionBar: ptr ActionBarLayer,
                              provider: ClickConfigProvider) {.inline.} =
  ## Set the click configuration provider.
  ## Equivalent to C function `ffi.action_bar_layer_set_click_config_provider(action_bar, provider)`.
  ffi.action_bar_layer_set_click_config_provider(actionBar, provider)

# ============================================================================
# Icons
# ============================================================================

proc setIcon*(actionBar: ptr ActionBarLayer, buttonId: ButtonId,
              icon: ptr GBitmap) {.inline.} =
  ## Set the icon for a button (BUTTON_ID_UP, BUTTON_ID_SELECT, BUTTON_ID_DOWN).
  ## Equivalent to C function `ffi.action_bar_layer_set_icon(action_bar, button_id, icon)`.
  ffi.action_bar_layer_set_icon(actionBar, buttonId, icon)

proc setIconAnimated*(actionBar: ptr ActionBarLayer, buttonId: ButtonId,
                      icon: ptr GBitmap, animated: bool) {.inline.} =
  ## Set the icon for a button with optional animation.
  ## Equivalent to C function `ffi.action_bar_layer_set_icon_animated(action_bar, button_id, icon, animated)`.
  ffi.action_bar_layer_set_icon_animated(actionBar, buttonId, icon, animated)

proc clearIcon*(actionBar: ptr ActionBarLayer, buttonId: ButtonId) {.inline.} =
  ## Clear the icon for a button.
  ## Equivalent to C function `ffi.action_bar_layer_clear_icon(action_bar, button_id)`.
  ffi.action_bar_layer_clear_icon(actionBar, buttonId)

# ============================================================================
# Appearance
# ============================================================================

when declared(ffi.action_bar_layer_set_background_color):
  proc `backgroundColor=`*(actionBar: ptr ActionBarLayer, color: GColor) {.inline.} =
    ## Set the background color of the action bar.
    ## Equivalent to C function `ffi.action_bar_layer_set_background_color(action_bar, color)`.
    ## NOTE: Not available on black-and-white platforms (Aplite, Diorite).
    ffi.action_bar_layer_set_background_color(actionBar, color)

# ============================================================================
# Press Animation
# ============================================================================

when declared(ffi.action_bar_layer_set_icon_press_animation):
  proc setIconPressAnimation*(actionBar: ptr ActionBarLayer, buttonId: ButtonId,
                              animation: ActionBarLayerIconPressAnimation) {.inline.} =
    ## Set the press animation for a button icon.
    ## Equivalent to C function `ffi.action_bar_layer_set_icon_press_animation(action_bar, button_id, animation)`.
    ffi.action_bar_layer_set_icon_press_animation(actionBar, buttonId, animation)

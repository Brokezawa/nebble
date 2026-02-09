## High-level Nim wrapper for Pebble StatusBarLayer API.
##
## A StatusBarLayer displays a status bar at the top of the window showing
## time, battery, and connection status. It automatically adjusts layer
## content to avoid being covered by the status bar.

import nebble/ffi

# ============================================================================
# Constructor & Destructor
# ============================================================================

when declared(ffi.status_bar_layer_create):
  proc newStatusBarLayer*(): ptr StatusBarLayer {.inline.} =
    ## Create a new StatusBarLayer.
    ## Equivalent to C function `ffi.status_bar_layer_create()`.
    ## NOTE: Not available on Aplite.
    ffi.status_bar_layer_create()

  proc destroy*(statusBar: ptr StatusBarLayer) {.inline.} =
    ## Destroy the status bar layer and free its memory.
    ## Equivalent to C function `ffi.status_bar_layer_destroy(status_bar_layer)`.
    ffi.status_bar_layer_destroy(statusBar)

# ============================================================================
# Conversion
# ============================================================================

when declared(ffi.status_bar_layer_get_layer):
  proc getLayer*(statusBar: ptr StatusBarLayer): ptr Layer {.inline.} =
    ## Get the underlying Layer for hierarchy operations.
    ## Equivalent to C function `ffi.status_bar_layer_get_layer(status_bar_layer)`.
    ffi.status_bar_layer_get_layer(statusBar)

# ============================================================================
# Colors
# ============================================================================

when declared(ffi.status_bar_layer_set_colors):
  proc setColors*(statusBar: ptr StatusBarLayer, background: GColor,
                  foreground: GColor) {.inline.} =
    ## Set the background and foreground colors.
    ## Equivalent to C function `ffi.status_bar_layer_set_colors(status_bar_layer, background, foreground)`.
    ffi.status_bar_layer_set_colors(statusBar, background, foreground)

when declared(ffi.status_bar_layer_get_background_color):
  proc backgroundColor*(statusBar: ptr StatusBarLayer): GColor {.inline.} =
    ## Get the current background color.
    ## Equivalent to C function `ffi.status_bar_layer_get_background_color(status_bar_layer)`.
    ffi.status_bar_layer_get_background_color(statusBar)

when declared(ffi.status_bar_layer_get_foreground_color):
  proc foregroundColor*(statusBar: ptr StatusBarLayer): GColor {.inline.} =
    ## Get the current foreground color.
    ## Equivalent to C function `ffi.status_bar_layer_get_foreground_color(status_bar_layer)`.
    ffi.status_bar_layer_get_foreground_color(statusBar)

# ============================================================================
# Separator
# ============================================================================

when declared(ffi.status_bar_layer_set_separator_mode):
  proc `separatorMode=`*(statusBar: ptr StatusBarLayer,
                         mode: StatusBarLayerSeparatorMode) {.inline.} =
    ## Set the separator line mode.
    ## Equivalent to C function `ffi.status_bar_layer_set_separator_mode(status_bar_layer, mode)`.
    ffi.status_bar_layer_set_separator_mode(statusBar, mode)

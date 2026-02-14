## ARC-Managed StatusBarLayer Handle
##
## Managed wrapper for StatusBarLayer that tracks association with windows
## to avoid destroying while attached.

import nebble/ffi
import nebble/ffi/managed

export ffi.StatusBarLayer, ffi.StatusBarLayerSeparatorMode

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(StatusBarLayer, StatusBarLayer,
                  status_bar_layer_create, status_bar_layer_destroy)

# ============================================================================
# Constructors
# ============================================================================

proc newStatusBarLayerHandle*(): StatusBarLayerHandle {.inline.} =
  wrapOwned(ffi.status_bar_layer_create())

proc newStatusBarLayer*(): StatusBarLayerHandle {.inline.} =
  ## Alias for `newStatusBarLayerHandle`.
  result = newStatusBarLayerHandle()

# ============================================================================
# Layer Access
# ============================================================================

proc getLayer*(h: StatusBarLayerHandle): ptr Layer {.inline.} =
  if h.pRaw == nil: return nil
  ffi.status_bar_layer_get_layer(h.toPtr)

proc setColors*(h: StatusBarLayerHandle, background: GColor, foreground: GColor) {.inline.} =
  if h.pRaw == nil: return
  ffi.status_bar_layer_set_colors(h.pRaw, background, foreground)

proc backgroundColor*(h: StatusBarLayerHandle): GColor {.inline.} =
  if h.pRaw == nil: return GColorClear
  ffi.status_bar_layer_get_background_color(h.pRaw)

proc foregroundColor*(h: StatusBarLayerHandle): GColor {.inline.} =
  if h.pRaw == nil: return GColorClear
  ffi.status_bar_layer_get_foreground_color(h.pRaw)

proc `separatorMode=`*(h: StatusBarLayerHandle, mode: StatusBarLayerSeparatorMode) {.inline.} =
  if h.pRaw == nil: return
  ffi.status_bar_layer_set_separator_mode(h.pRaw, mode)

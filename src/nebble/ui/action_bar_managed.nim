## ARC-Managed ActionBarLayer Handle (Window-Aware)
##
## Managed wrapper for ActionBarLayer. Tracks whether the action bar is
## attached to a Window to avoid destroying it while the window owns it.

import nebble/ffi
import nebble/ffi/managed
import nebble/ui/action_bar

# Remove unused import warning for `action_bar` when not used directly in this file.
# The module import is intentionally kept so the generated FFI types and constants
# are available during compilation even if this file only references FFI symbols
# indirectly.

type ActionBarLayerHandle* = object
  raw: ptr ActionBarLayer
  attachedWindow: ptr Window

proc `=destroy`*(h: var ActionBarLayerHandle) =
  ## Destroy only if not attached to a window.
  if h.raw != nil and h.attachedWindow == nil:
    action_bar_layer_destroy(h.raw)
  h.raw = nil
  h.attachedWindow = nil

proc `=wasMoved`*(h: var ActionBarLayerHandle) =
  h.raw = nil
  h.attachedWindow = nil

proc `=copy`*(dest: var ActionBarLayerHandle, src: ActionBarLayerHandle) {.error.} = discard

proc `=sink`*(dest: var ActionBarLayerHandle, src: ActionBarLayerHandle) =
  `=destroy`(dest)
  dest.raw = src.raw
  dest.attachedWindow = src.attachedWindow
  var srcPtr = cast[ptr ActionBarLayerHandle](unsafeAddr src)
  srcPtr.raw = nil
  srcPtr.attachedWindow = nil

converter toPtr*(h: ActionBarLayerHandle): ptr ActionBarLayer = h.raw

proc isValid*(h: ActionBarLayerHandle): bool {.inline.} = h.raw != nil

when ManagedDebug or ManagedStrict:
  proc checkValid*(h: ActionBarLayerHandle) =
    if not h.isValid:
      when ManagedStrict:
        raise newException(AssertionDefect, "Operation on invalid/moved ActionBarLayerHandle")

proc newActionBarLayerHandle*(): ActionBarLayerHandle {.inline.} =
  result.raw = action_bar_layer_create()
  result.attachedWindow = nil

proc getLayer*(h: ActionBarLayerHandle): ptr Layer {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  action_bar_layer_get_layer(h.raw)

proc addToWindow*(h: var ActionBarLayerHandle, win: ptr Window) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  action_bar_layer_add_to_window(h.raw, win)
  h.attachedWindow = win

proc removeFromWindow*(h: var ActionBarLayerHandle) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  action_bar_layer_remove_from_window(h.raw)
  h.attachedWindow = nil

proc setIcon*(h: ActionBarLayerHandle, buttonId: ButtonId, icon: ptr GBitmap) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  action_bar_layer_set_icon(h.raw, buttonId, icon)

proc setIconAnimated*(h: ActionBarLayerHandle, buttonId: ButtonId, icon: ptr GBitmap, animated: bool) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  action_bar_layer_set_icon_animated(h.raw, buttonId, icon, animated)

proc clearIcon*(h: ActionBarLayerHandle, buttonId: ButtonId) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  action_bar_layer_clear_icon(h.raw, buttonId)

when declared(action_bar_layer_set_background_color):
  proc `backgroundColor=`*(h: ActionBarLayerHandle, color: GColor) {.inline.} =
    when ManagedDebug or ManagedStrict: h.checkValid()
    action_bar_layer_set_background_color(h.raw, color)

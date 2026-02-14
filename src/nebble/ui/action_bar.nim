## ARC-Managed ActionBarLayer Handle (Window-Aware)
##
## Managed wrapper for ActionBarLayer. Tracks whether the action bar is
## attached to a Window to avoid destroying it while the window owns it.

import nebble/ffi
import nebble/ffi/managed

export ffi.ActionBarLayer

# Remove unused import warning for `action_bar` when not used directly in this file.
# The module import is intentionally kept so the generated FFI types and constants
# are available during compilation even if this file only references FFI symbols
# indirectly.

type ActionBarLayerHandle* = object
  pRaw*: ptr ActionBarLayer
  ownership*: HandleOwnership
  pParent*: ptr Layer # Use pParent for consistency with LayerHandle logic
  attachedWindow*: ptr Window

proc `=destroy`*(h: var ActionBarLayerHandle) =
  ## Destroy only if not attached to a window.
  if h.pRaw != nil and h.ownership == hoOwned and h.attachedWindow == nil:
    ffi.action_bar_layer_destroy(h.pRaw)
  h.pRaw = nil
  h.ownership = hoNone
  h.attachedWindow = nil
  h.pParent = nil

proc `=wasMoved`*(h: var ActionBarLayerHandle) =
  h.pRaw = nil
  h.ownership = hoNone
  h.attachedWindow = nil
  h.pParent = nil

proc `=copy`*(dest: var ActionBarLayerHandle, src: ActionBarLayerHandle) {.error.} = discard

proc `=sink`*(dest: var ActionBarLayerHandle, src: ActionBarLayerHandle) =
  `=destroy`(dest)
  dest.pRaw = src.pRaw
  dest.ownership = src.ownership
  dest.attachedWindow = src.attachedWindow
  dest.pParent = src.pParent
  var srcPtr = cast[ptr ActionBarLayerHandle](unsafeAddr src)
  srcPtr.pRaw = nil
  srcPtr.ownership = hoNone
  srcPtr.attachedWindow = nil
  srcPtr.pParent = nil

converter toPtr*(h: ActionBarLayerHandle): ptr ActionBarLayer = h.pRaw

proc isValid*(h: ActionBarLayerHandle): bool {.inline.} = h.pRaw != nil

proc setParent*(h: var ActionBarLayerHandle, p: ptr Layer) {.inline.} =
  if p != nil:
    h.pParent = p
    if h.ownership == hoOwned:
      h.ownership = hoParented
  else:
    h.pParent = nil
    if h.ownership == hoParented:
      h.ownership = hoOwned

when ManagedDebug or ManagedStrict:
  proc checkValid*(h: ActionBarLayerHandle) =
    if not h.isValid:
      when ManagedStrict:
        raise newException(AssertionDefect, "Operation on invalid/moved ActionBarLayerHandle")

proc toHandle*(p: ptr ActionBarLayer): ActionBarLayerHandle {.inline.} =
  ## Wrap raw pointer in handle (unowned).
  ActionBarLayerHandle(pRaw: p, ownership: hoUnowned, pParent: nil, attachedWindow: nil)

proc wrapOwned*(p: ptr ActionBarLayer): ActionBarLayerHandle {.inline.} =
  ## Wrap raw pointer in handle (owned).
  ActionBarLayerHandle(pRaw: p, ownership: hoOwned, pParent: nil, attachedWindow: nil)

proc newActionBarLayerHandle*(): ActionBarLayerHandle {.inline.} =
  wrapOwned(ffi.action_bar_layer_create())

proc newActionBarLayer*(): ActionBarLayerHandle {.inline.} =
  ## Alias for `newActionBarLayerHandle`.
  result = newActionBarLayerHandle()

proc getLayer*(h: ActionBarLayerHandle): ptr Layer {.inline.} =
  if h.pRaw == nil: return nil
  ffi.action_bar_layer_get_layer(h.pRaw)

proc addToWindow*(h: var ActionBarLayerHandle, win: ptr Window) {.inline.} =
  if h.pRaw == nil or win == nil: return
  ffi.action_bar_layer_add_to_window(h.pRaw, win)
  h.attachedWindow = win
  if h.ownership == hoOwned:
    h.ownership = hoParented # Owned by window stack logic

proc removeFromWindow*(h: var ActionBarLayerHandle) {.inline.} =
  if h.pRaw == nil: return
  ffi.action_bar_layer_remove_from_window(h.pRaw)
  h.attachedWindow = nil
  if h.ownership == hoParented:
    h.ownership = hoOwned # Back to owned

proc setIcon*(h: ActionBarLayerHandle, buttonId: ButtonId, icon: ptr GBitmap) {.inline.} =
  if h.pRaw == nil: return
  ffi.action_bar_layer_set_icon(h.pRaw, buttonId, icon)

proc setIcon*(p: ptr ActionBarLayer, buttonId: ButtonId, icon: ptr GBitmap) {.inline.} =
  if p == nil: return
  ffi.action_bar_layer_set_icon(p, buttonId, icon)

proc setIconAnimated*(h: ActionBarLayerHandle, buttonId: ButtonId, icon: ptr GBitmap, animated: bool) {.inline.} =
  if h.pRaw == nil: return
  ffi.action_bar_layer_set_icon_animated(h.pRaw, buttonId, icon, animated)

proc clearIcon*(h: ActionBarLayerHandle, buttonId: ButtonId) {.inline.} =
  if h.pRaw == nil: return
  ffi.action_bar_layer_clear_icon(h.pRaw, buttonId)

proc `backgroundColor=`*(h: ActionBarLayerHandle, color: GColor) {.inline.} =
  if h.pRaw == nil: return
  ffi.action_bar_layer_set_background_color(h.pRaw, color)

proc `backgroundColor=`*(p: ptr ActionBarLayer, color: GColor) {.inline.} =
  if p == nil: return
  ffi.action_bar_layer_set_background_color(p, color)

when declared(ffi.action_bar_layer_set_context):
  proc `context=`*(h: ActionBarLayerHandle, context: pointer) {.inline.} =
    if h.pRaw == nil: return
    ffi.action_bar_layer_set_context(h.pRaw, context)

proc `clickConfigProvider=`*(h: ActionBarLayerHandle, provider: ClickConfigProvider) {.inline.} =
  if h.pRaw == nil: return
  ffi.action_bar_layer_set_click_config_provider(h.pRaw, provider)

proc `clickConfigProvider=`*(p: ptr ActionBarLayer, provider: ClickConfigProvider) {.inline.} =
  if p == nil: return
  ffi.action_bar_layer_set_click_config_provider(p, provider)

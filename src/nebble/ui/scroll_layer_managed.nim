## ARC-Managed ScrollLayer Handle (Hierarchy-Aware)
##
## Managed wrapper for ScrollLayer that tracks child layers added to it and
## prevents double-destroy when parent scroll layer is destroyed.

import nebble/ffi
import nebble/ffi/managed
import nebble/ui/scroll_layer
import nebble/ui/layer_managed

# Keep `scroll_layer` import to ensure the underlying API is available.
when false:
  discard scroll_layer

type ScrollLayerHandle* = object
  raw: ptr ScrollLayer
  # We don't track all children; we mark that children are now parented.
  childrenParented: bool

proc `=destroy`*(h: var ScrollLayerHandle) =
  if h.raw != nil:
    scroll_layer_destroy(h.raw)
  h.raw = nil
  h.childrenParented = false

proc `=wasMoved`*(h: var ScrollLayerHandle) =
  h.raw = nil
  h.childrenParented = false

proc `=copy`*(dest: var ScrollLayerHandle, src: ScrollLayerHandle) {.error.} = discard

proc `=sink`*(dest: var ScrollLayerHandle, src: ScrollLayerHandle) =
  `=destroy`(dest)
  dest.raw = src.raw
  dest.childrenParented = src.childrenParented
  var srcPtr = cast[ptr ScrollLayerHandle](unsafeAddr src)
  srcPtr.raw = nil
  srcPtr.childrenParented = false

converter toPtr*(h: ScrollLayerHandle): ptr ScrollLayer = h.raw

proc isValid*(h: ScrollLayerHandle): bool {.inline.} = h.raw != nil

when ManagedDebug or ManagedStrict:
  proc checkValid*(h: ScrollLayerHandle) =
    if not h.isValid:
      when ManagedStrict:
        raise newException(AssertionDefect, "Operation on invalid/moved ScrollLayerHandle")

proc newScrollLayerHandle*(frame: GRect): ScrollLayerHandle {.inline.} =
  result.raw = scroll_layer_create(frame)
  result.childrenParented = false

proc getLayer*(h: ScrollLayerHandle): ptr Layer {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  scroll_layer_get_layer(h.raw)

proc addChild*(parent: var ScrollLayerHandle, child: var LayerHandle) {.inline.} =
  when ManagedDebug or ManagedStrict:
    parent.checkValid()
    child.checkValid()
  scroll_layer_add_child(parent.raw, toPtr(child))
  # Mark that child now has a parent (we don't keep a list)
  child.setParent(cast[ptr Layer](parent.raw))
  parent.childrenParented = true

proc removeChild*(parent: var ScrollLayerHandle, child: var LayerHandle) {.inline.} =
  when ManagedDebug or ManagedStrict:
    parent.checkValid()
    child.checkValid()
  layer_remove_from_parent(toPtr(child))
  child.setParent(nil)

proc `contentSize=`*(h: ScrollLayerHandle, size: GSize) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  scroll_layer_set_content_size(h.raw, size)

proc contentSize*(h: ScrollLayerHandle): GSize {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  scroll_layer_get_content_size(h.raw)

proc `contentOffset=`*(h: ScrollLayerHandle, offset: GPoint, animated: bool) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  scroll_layer_set_content_offset(h.raw, offset, animated)

proc contentOffset*(h: ScrollLayerHandle): GPoint {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  scroll_layer_get_content_offset(h.raw)

proc setCallbacks*(h: ScrollLayerHandle, callbacks: ScrollLayerCallbacks) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  scroll_layer_set_callbacks(h.raw, callbacks)

proc setClickConfigOntoWindow*(h: ScrollLayerHandle, win: ptr Window) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  scroll_layer_set_click_config_onto_window(h.raw, win)

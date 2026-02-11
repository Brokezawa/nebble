## ARC-Managed StatusBarLayer Handle
##
## Managed wrapper for StatusBarLayer that tracks association with windows
## to avoid destroying while attached.

import nebble/ffi
import nebble/ffi/managed
import nebble/ui/status_bar

when false:
  discard status_bar

type StatusBarLayerHandle* = object
  raw: ptr StatusBarLayer
  attachedWindow: ptr Window

proc `=destroy`*(h: var StatusBarLayerHandle) =
  if h.raw != nil and h.attachedWindow == nil:
    status_bar_layer_destroy(h.raw)
  h.raw = nil
  h.attachedWindow = nil

proc `=wasMoved`*(h: var StatusBarLayerHandle) =
  h.raw = nil
  h.attachedWindow = nil

proc `=copy`*(dest: var StatusBarLayerHandle, src: StatusBarLayerHandle) {.error.} = discard

proc `=sink`*(dest: var StatusBarLayerHandle, src: StatusBarLayerHandle) =
  `=destroy`(dest)
  dest.raw = src.raw
  dest.attachedWindow = src.attachedWindow
  var srcPtr = cast[ptr StatusBarLayerHandle](unsafeAddr src)
  srcPtr.raw = nil
  srcPtr.attachedWindow = nil

converter toPtr*(h: StatusBarLayerHandle): ptr StatusBarLayer = h.raw

proc isValid*(h: StatusBarLayerHandle): bool {.inline.} = h.raw != nil

when ManagedDebug or ManagedStrict:
  proc checkValid*(h: StatusBarLayerHandle) =
    if not h.isValid:
      when ManagedStrict:
        raise newException(AssertionDefect, "Operation on invalid/moved StatusBarLayerHandle")

proc newStatusBarLayerHandle*(): StatusBarLayerHandle {.inline.} =
  result.raw = status_bar_layer_create()
  result.attachedWindow = nil

proc getLayer*(h: StatusBarLayerHandle): ptr Layer {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  status_bar_layer_get_layer(h.raw)

proc setColors*(h: StatusBarLayerHandle, background: GColor, foreground: GColor) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  status_bar_layer_set_colors(h.raw, background, foreground)

proc backgroundColor*(h: StatusBarLayerHandle): GColor {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  status_bar_layer_get_background_color(h.raw)

proc foregroundColor*(h: StatusBarLayerHandle): GColor {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  status_bar_layer_get_foreground_color(h.raw)

proc `separatorMode=`*(h: StatusBarLayerHandle, mode: StatusBarLayerSeparatorMode) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  status_bar_layer_set_separator_mode(h.raw, mode)

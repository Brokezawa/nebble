## Managed MenuLayer with full callback management
##
## Provides a safe, ARC-managed wrapper around MenuLayer which stores
## user callbacks as Nim procs/closures and dispatches them via C-cdecl
## trampolines using the callback context pointer. This keeps callbacks
## alive while the MenuLayer is in use and avoids GC issues.

import nebble/ffi
import nebble/ui/menu_layer
import nebble/ui/layer_managed
import nebble/ffi/managed

type
  MenuLayerCallbacksWrapper* = ref object
    ## User-friendly callback storage. Fields are optional; set to nil to skip.
    userContext: pointer
    getNumSections: proc(ctx: pointer): uint16 = nil
    getNumRows: proc(ctx: pointer; section: uint16): uint16 = nil
    drawRow: proc(ctx: pointer; gctx: ptr GContext; cellLayer: ptr Layer; section: uint16; row: uint16) = nil
    getCellHeight: proc(ctx: pointer; section: uint16; row: uint16): int16 = nil
    selectClick: proc(ctx: pointer; index: MenuIndex) = nil
    ## Additional callbacks (Tier-3 coverage)
    getHeaderHeight: proc(ctx: pointer; section: uint16): int16 = nil
    drawHeader: proc(ctx: pointer; gctx: ptr GContext; cellLayer: ptr Layer; section: uint16) = nil
    selectLongClick: proc(ctx: pointer; index: MenuIndex) = nil
    selectionChanged: proc(ctx: pointer; oldIndex, newIndex: MenuIndex) = nil
    getSeparatorHeight: proc(ctx: pointer; index: MenuIndex): int16 = nil
    drawSeparator: proc(ctx: pointer; gctx: ptr GContext; cellLayer: ptr Layer; index: MenuIndex) = nil
    selectionWillChange: proc(ctx: pointer; oldIndex: MenuIndex; newIndex: MenuIndex) = nil
    drawBackground: proc(ctx: pointer; gctx: ptr GContext; cellLayer: ptr Layer; cellIsHighlighted: bool) = nil

  MenuLayerHandle* = object
    raw: ptr MenuLayer
    # Store the wrapper so Nim keeps closures alive
    callbacks: MenuLayerCallbacksWrapper
    userContext: pointer

proc `=destroy`*(h: var MenuLayerHandle) =
  if h.raw != nil:
    menu_layer_destroy(h.raw)
  h.raw = nil
  h.callbacks = nil
  h.userContext = nil

proc `=wasMoved`*(h: var MenuLayerHandle) =
  h.raw = nil
  h.callbacks = nil
  h.userContext = nil

proc `=copy`*(dest: var MenuLayerHandle, src: MenuLayerHandle) {.error.} =
  discard

proc `=sink`*(dest: var MenuLayerHandle, src: MenuLayerHandle) =
  `=destroy`(dest)
  dest.raw = src.raw
  dest.callbacks = src.callbacks
  dest.userContext = src.userContext
  var srcPtr = cast[ptr MenuLayerHandle](unsafeAddr src)
  srcPtr.raw = nil
  srcPtr.callbacks = nil
  srcPtr.userContext = nil

converter toPtr*(h: MenuLayerHandle): ptr MenuLayer = h.raw

converter toHandle*(p: ptr MenuLayer): MenuLayerHandle =
  MenuLayerHandle(raw: p, callbacks: nil, userContext: nil)

proc isValid*(h: MenuLayerHandle): bool {.inline.} = h.raw != nil

# ---------------------------------------------------------------------------
# Trampolines - C-cdecl callbacks that dispatch into Nim closures stored in
# the wrapper. Each trampoline uses the callback_context to find the wrapper
# pointer (we set it to the wrapper pointer when registering callbacks).
# ---------------------------------------------------------------------------

proc tramp_get_num_sections(menuLayerPtr: ptr MenuLayer; ctx: pointer): uint16 {.cdecl.} =
  if ctx == nil: return 0
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.getNumSections == nil: return 0
  return w.getNumSections(w.userContext)

proc tramp_get_num_rows(menuLayerPtr: ptr MenuLayer; section: uint16; ctx: pointer): uint16 {.cdecl.} =
  if ctx == nil: return 0
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.getNumRows == nil: return 0
  return w.getNumRows(w.userContext, section)

proc tramp_get_header_height(menuLayerPtr: ptr MenuLayer; section: uint16; ctx: pointer): int16 {.cdecl.} =
  if ctx == nil: return 0
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.getHeaderHeight == nil: return 0
  return w.getHeaderHeight(w.userContext, section)

proc tramp_draw_row(gctx: ptr GContext; cellLayer: ptr Layer; index: ptr MenuIndex; ctx: pointer) {.cdecl.} =
  if ctx == nil: return
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.drawRow == nil: return
  w.drawRow(w.userContext, gctx, cellLayer, index.section, index.row)

proc tramp_get_cell_height(menuLayerPtr: ptr MenuLayer; index: ptr MenuIndex; ctx: pointer): int16 {.cdecl.} =
  if ctx == nil: return 0
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.getCellHeight == nil: return 0
  return w.getCellHeight(w.userContext, index.section, index.row)

proc tramp_draw_header(gctx: ptr GContext; cellLayer: ptr Layer; section: uint16; ctx: pointer) {.cdecl.} =
  if ctx == nil: return
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.drawHeader == nil: return
  w.drawHeader(w.userContext, gctx, cellLayer, section)

proc tramp_select_long_click(menuLayerPtr: ptr MenuLayer; index: ptr MenuIndex; ctx: pointer) {.cdecl.} =
  if ctx == nil: return
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.selectLongClick == nil: return
  w.selectLongClick(w.userContext, index[])

proc tramp_selection_changed(menuLayerPtr: ptr MenuLayer; oldIndex: MenuIndex; newIndex: MenuIndex; ctx: pointer) {.cdecl.} =
  if ctx == nil: return
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.selectionChanged == nil: return
  w.selectionChanged(w.userContext, oldIndex, newIndex)

proc tramp_get_separator_height(menuLayerPtr: ptr MenuLayer; index: ptr MenuIndex; ctx: pointer): int16 {.cdecl.} =
  if ctx == nil: return 0
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.getSeparatorHeight == nil: return 0
  w.getSeparatorHeight(w.userContext, index[])

proc tramp_draw_separator(gctx: ptr GContext; cellLayer: ptr Layer; index: ptr MenuIndex; ctx: pointer) {.cdecl.} =
  if ctx == nil: return
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.drawSeparator == nil: return
  w.drawSeparator(w.userContext, gctx, cellLayer, index[])

proc tramp_selection_will_change(menuLayerPtr: ptr MenuLayer; oldIndex: ptr MenuIndex; newIndex: MenuIndex; ctx: pointer) {.cdecl.} =
  if ctx == nil: return
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.selectionWillChange == nil: return
  w.selectionWillChange(w.userContext, oldIndex[], newIndex)

proc tramp_draw_background(gctx: ptr GContext; cellLayer: ptr Layer; cellIsHighlighted: bool; ctx: pointer) {.cdecl.} =
  if ctx == nil: return
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.drawBackground == nil: return
  w.drawBackground(w.userContext, gctx, cellLayer, cellIsHighlighted)

proc tramp_select_click(menuLayerPtr: ptr MenuLayer; index: ptr MenuIndex; ctx: pointer) {.cdecl.} =
  if ctx == nil: return
  let w = cast[MenuLayerCallbacksWrapper](ctx)
  if w.selectClick == nil: return
  w.selectClick(w.userContext, index[])

# ---------------------------------------------------------------------------
# Public API
# ---------------------------------------------------------------------------

proc newMenuLayerHandle*(frame: GRect): MenuLayerHandle =
  result.raw = newMenuLayer(frame)
  result.callbacks = nil
  result.userContext = nil

proc newMenuLayerCallbacks*(getNumSections: proc(ctx: pointer): uint16 = nil,
                           getNumRows: proc(ctx: pointer; section: uint16): uint16 = nil,
                           drawRow: proc(ctx: pointer; gctx: ptr GContext; cellLayer: ptr Layer; section: uint16; row: uint16) = nil,
                           getCellHeight: proc(ctx: pointer; section: uint16; row: uint16): int16 = nil,
                           selectClick: proc(ctx: pointer; index: MenuIndex) = nil,
                           getHeaderHeight: proc(ctx: pointer; section: uint16): int16 = nil,
                           drawHeader: proc(ctx: pointer; gctx: ptr GContext; cellLayer: ptr Layer; section: uint16) = nil,
                           selectLongClick: proc(ctx: pointer; index: MenuIndex) = nil,
                           selectionChanged: proc(ctx: pointer; oldIndex, newIndex: MenuIndex) = nil,
                           getSeparatorHeight: proc(ctx: pointer; index: MenuIndex): int16 = nil,
                           drawSeparator: proc(ctx: pointer; gctx: ptr GContext; cellLayer: ptr Layer; index: MenuIndex) = nil,
                           selectionWillChange: proc(ctx: pointer; oldIndex: MenuIndex; newIndex: MenuIndex) = nil,
                           drawBackground: proc(ctx: pointer; gctx: ptr GContext; cellLayer: ptr Layer; cellIsHighlighted: bool) = nil): MenuLayerCallbacksWrapper =
  ## Helper constructor to create a callback wrapper with the provided handlers.
  new(result)
  result.userContext = nil
  result.getNumSections = getNumSections
  result.getNumRows = getNumRows
  result.drawRow = drawRow
  result.getCellHeight = getCellHeight
  result.selectClick = selectClick
  result.getHeaderHeight = getHeaderHeight
  result.drawHeader = drawHeader
  result.selectLongClick = selectLongClick
  result.selectionChanged = selectionChanged
  result.getSeparatorHeight = getSeparatorHeight
  result.drawSeparator = drawSeparator
  result.selectionWillChange = selectionWillChange
  result.drawBackground = drawBackground

proc setCallbacks*(h: var MenuLayerHandle, wrapper: MenuLayerCallbacksWrapper, ctx: pointer = nil) =
  ## Register callbacks. The wrapper is copied to heap and kept alive until
  ## the handle is destroyed or setCallbacks is called again.
  when ManagedDebug or ManagedStrict:
    if not h.isValid: raise newException(AssertionDefect, "setCallbacks on invalid MenuLayerHandle")

  # Free previous wrapper if present
  h.callbacks = nil

  # Allocate wrapper on heap and store (ref object)
  var p: MenuLayerCallbacksWrapper
  new(p)
  p.userContext = wrapper.userContext
  p.getNumSections = wrapper.getNumSections
  p.getNumRows = wrapper.getNumRows
  p.drawRow = wrapper.drawRow
  p.getCellHeight = wrapper.getCellHeight
  p.selectClick = wrapper.selectClick
  p.getHeaderHeight = wrapper.getHeaderHeight
  p.drawHeader = wrapper.drawHeader
  p.selectLongClick = wrapper.selectLongClick
  p.selectionChanged = wrapper.selectionChanged
  p.getSeparatorHeight = wrapper.getSeparatorHeight
  p.drawSeparator = wrapper.drawSeparator
  p.selectionWillChange = wrapper.selectionWillChange
  p.drawBackground = wrapper.drawBackground
  h.callbacks = p
  h.userContext = ctx

  var cbs: MenuLayerCallbacks
  cbs.get_num_sections = tramp_get_num_sections
  cbs.get_num_rows = tramp_get_num_rows
  cbs.draw_row = tramp_draw_row
  cbs.get_cell_height = tramp_get_cell_height
  cbs.select_click = tramp_select_click
  cbs.get_header_height = tramp_get_header_height
  cbs.draw_header = tramp_draw_header
  cbs.select_long_click = tramp_select_long_click
  cbs.selection_changed = tramp_selection_changed
  cbs.get_separator_height = tramp_get_separator_height
  cbs.draw_separator = tramp_draw_separator
  cbs.selection_will_change = tramp_selection_will_change
  cbs.draw_background = tramp_draw_background

  # Register with the underlying C API; use the wrapper pointer as context
  menu_layer.setCallbacks(h.raw, cast[pointer](h.callbacks), cbs)

proc removeCallbacks*(h: var MenuLayerHandle) =
  if h.callbacks == nil: return
  # Reset callbacks to empty struct
  var empty: MenuLayerCallbacks
  menu_layer.setCallbacks(h.raw, nil, empty)
  h.callbacks = nil
  h.userContext = nil

proc getLayer*(h: MenuLayerHandle): LayerHandle {.inline.} =
  ## Return a LayerHandle wrapper for the menu's layer. The returned handle
  ## does not own the layer (it will avoid destroying it if the menu owns it).
  result = toHandle(menu_layer_get_layer(h.raw))

proc reloadData*(h: MenuLayerHandle) {.inline.} =
  when ManagedDebug or ManagedStrict:
    if not h.isValid: raise newException(AssertionDefect, "reloadData on invalid MenuLayerHandle")
  menu_layer_reload_data(h.raw)

proc setClickConfigOntoWindow*(h: MenuLayerHandle, window: ptr Window) {.inline.} =
  if not h.isValid: return
  menu_layer_set_click_config_onto_window(h.raw, window)

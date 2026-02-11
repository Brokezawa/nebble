import nebble
import nebble/ffi
import nebble/ui/menu_layer_managed

var gMenu: MenuLayerHandle

proc getSections(ctx: pointer): uint16 {.nimcall.} =
  return 1

proc getRows(ctx: pointer; section: uint16): uint16 {.nimcall.} =
  return 3

proc drawRow(ctx: pointer; gctx: ptr GContext; cellLayer: ptr Layer; section: uint16; row: uint16) {.nimcall.} =
  # Use helper to draw a simple two-line cell
  let title = "Item #" & $row
  ffi.menu_cell_basic_draw(gctx, cellLayer, title.cstring, nil, nil)

proc onSelect(ctx: pointer; index: MenuIndex) {.nimcall.} =
  # Selection handler - no-op for example
  discard

proc getHeaderHeight(ctx: pointer; section: uint16): int16 {.nimcall.} =
  return 24

proc drawHeader(ctx: pointer; gctx: ptr GContext; cellLayer: ptr Layer; section: uint16) {.nimcall.} =
  let title = "Main Section"
  ffi.menu_cell_basic_header_draw(gctx, cellLayer, title.cstring)

proc getSeparatorHeight(ctx: pointer; index: MenuIndex): int16 {.nimcall.} =
  # Small separator height between rows
  return 2

proc drawSeparator(ctx: pointer; gctx: ptr GContext; cellLayer: ptr Layer; index: MenuIndex) {.nimcall.} =
  # No-op separator (could draw custom separator graphics here)
  discard

proc onSelectionChanged(ctx: pointer; oldIndex, newIndex: MenuIndex) {.nimcall.} =
  # Example selection-changed handler (no-op)
  discard

proc onLongClick(ctx: pointer; index: MenuIndex) {.nimcall.} =
  # Example long-click handler (no-op)
  discard

proc windowLoad(win: ptr Window) {.cdecl.} =
  gMenu = newMenuLayerHandle(makeGRect(0, 0, 144, 168))
  let wrapper = newMenuLayerCallbacks(getNumSections = getSections,
                                      getNumRows = getRows,
                                      drawRow = drawRow,
                                      selectClick = onSelect,
                                      getHeaderHeight = getHeaderHeight,
                                      drawHeader = drawHeader,
                                      getSeparatorHeight = getSeparatorHeight,
                                      drawSeparator = drawSeparator,
                                      selectionChanged = onSelectionChanged,
                                      selectLongClick = onLongClick)
  gMenu.setCallbacks(wrapper)
  # Add menu's layer to the window root
  let root = rootLayer(win)
  layer_add_child(root, getLayer(gMenu))

proc windowUnload(win: ptr Window) {.cdecl.} =
  gMenu = MenuLayerHandle(nil)

pebbleApp(load = windowLoad, unload = windowUnload)

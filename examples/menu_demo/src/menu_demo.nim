## menu_demo - MenuLayer demonstration
##
## Demonstrates the Nebble MenuLayer API with a scrollable menu.

import nebble
import nebble/ffi  # For MenuLayerCallbacks and other FFI types

const
  NUM_MENU_SECTIONS = 1
  NUM_FIRST_MENU_ITEMS = 5

var
  window: ptr Window
  menuLayer: ptr MenuLayer

# Menu item titles
const menuTitles = [
  "First Item",
  "Second Item", 
  "Third Item",
  "Fourth Item",
  "Fifth Item"
]

proc menuGetNumSections(menuLayer: ptr MenuLayer; context: pointer): uint16 {.cdecl.} =
  ## Return the number of sections in the menu
  return NUM_MENU_SECTIONS

proc menuGetNumRows(menuLayer: ptr MenuLayer; sectionIndex: uint16; context: pointer): uint16 {.cdecl.} =
  ## Return the number of rows in a section
  case sectionIndex
  of 0:
    return NUM_FIRST_MENU_ITEMS
  else:
    return 0

proc menuGetCellHeight(menuLayer: ptr MenuLayer; cellIndex: ptr MenuIndex; context: pointer): int16 {.cdecl.} =
  ## Return the height of a menu cell
  # Standard cell height for Pebble menus
  return 44

proc menuDrawRow(ctx: ptr GContext; cellLayer: ptr Layer; cellIndex: ptr MenuIndex; context: pointer) {.cdecl.} =
  ## Draw a menu row
  let row = cellIndex.row
  if row < NUM_FIRST_MENU_ITEMS:
    let title = menuTitles[row]
    
    # Draw the menu item text
    let bounds = cellLayer.bounds
    let textBox = makeGRect(4, 10, bounds.size.w - 8, 24)
    let font = getSystemFont("RESOURCE_ID_GOTHIC_24_BOLD")
    
    ctx.drawText(
      title,
      font,
      textBox,
      GTextOverflowMode.GTextOverflowModeTrailingEllipsis,
      GTextAlignment.GTextAlignmentLeft,
      nil
    )

proc menuSelectClick(menuLayer: ptr MenuLayer; cellIndex: ptr MenuIndex; context: pointer) {.cdecl.} =
  ## Handle menu item selection
  let row = cellIndex.row
  if row < NUM_FIRST_MENU_ITEMS:
    # Show which item was selected (in a real app, you'd open a detail window)
    # For now, we'll just demonstrate that the callback works
    discard

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create menu layer
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create menu layer with full screen bounds
  menuLayer = newMenuLayer(bounds)
  
  # Set up menu callbacks
  var callbacks: MenuLayerCallbacks
  callbacks.get_num_sections = menuGetNumSections
  callbacks.get_num_rows = menuGetNumRows
  callbacks.get_cell_height = menuGetCellHeight
  callbacks.draw_row = menuDrawRow
  callbacks.select_click = menuSelectClick
  
  menuLayer.setCallbacks(nil, callbacks)
  
  # Configure click handlers for the menu
  menuLayer.setClickConfigOntoWindow(win)
  
  # Add menu layer to window
  rootLayer.addChild(menuLayer.getLayer())

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy menu layer
  menuLayer.destroy()

proc init() =
  ## Initialize the app
  window = newWindow()
  window.setHandlers(
    load = windowLoad,
    unload = windowUnload
  )
  window.push(animated = true)

proc deinit() =
  ## Deinitialize the app
  window.destroy()

proc main(): cint {.exportc, cdecl.} =
  ## App entry point
  init()
  eventLoop()
  deinit()
  return 0

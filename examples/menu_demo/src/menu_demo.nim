## menu_demo - MenuLayer demonstration
##
## Demonstrates the Nebble MenuLayer API with a scrollable menu.

import nebble
import nebble/ui/menu_layer
import nebble/graphics/graphics # For GContext and drawing

const
  NUM_MENU_SECTIONS = 1
  NUM_FIRST_MENU_ITEMS = 5

var
  sMenuLayer: ptr MenuLayer

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
      constants.GTextAlignmentLeft,
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
  sMenuLayer = newMenuLayer(bounds)
  
  # Set up menu callbacks
  var callbacks: MenuLayerCallbacks
  callbacks.get_num_sections = menuGetNumSections
  callbacks.get_num_rows = menuGetNumRows
  callbacks.get_cell_height = menuGetCellHeight
  callbacks.draw_row = menuDrawRow
  callbacks.select_click = menuSelectClick
  
  sMenuLayer.setCallbacks(nil, callbacks)
  
  # Configure click handlers for the menu
  sMenuLayer.setClickConfigOntoWindow(win)
  
  # Add menu layer to window
  rootLayer.addChild(sMenuLayer.getLayer())

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy menu layer
  sMenuLayer.destroy()

pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

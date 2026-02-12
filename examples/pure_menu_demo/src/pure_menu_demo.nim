## Pure Menu Demo
##
## A clean demonstration of simplified MenuLayer API.
## Shows high-level menu creation without complex callbacks.

import nebble
import nebble/ui/text_layer_managed

# For this demo, we'll use SimpleMenuLayer which has a simpler API
# In a full implementation, we'd have MenuLayerHandle with dual API

# Module-level handles
var 
  infoLayer: TextLayerHandle

# Menu items for demonstration
const menuItems = [
  "Start Workout",
  "View History", 
  "Settings",
  "About"
]

var selectedIndex: int = 0

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Create a simple menu demonstration
  
  let bounds = win.rootLayer.bounds
  
  # Title
  infoLayer = newTextLayerHandle(
    makeGRect(0, 10, bounds.size.w, 30),
    "Menu Demo\nUse UP/DOWN/SELECT".cstring,
    getSystemFont(FONT_KEY_GOTHIC_18.cstring),
    constants.GTextAlignmentCenter
  )
  infoLayer.textColor = GColorWhite
  win.rootLayer.addChild(infoLayer.getLayer())
  
  # Display menu items as text layers
  # In a real implementation, this would be a MenuLayerHandle
  for i, item in menuItems:
    var itemLayer = newTextLayerHandle(
      makeGRect(10'i16, (50 + i * 25).int16, bounds.size.w - 20'i16, 24'i16),
      item.cstring,
      getSystemFont(FONT_KEY_GOTHIC_18.cstring),
      constants.GTextAlignmentLeft
    )
    
    # Highlight selected item
    if i == selectedIndex:
      itemLayer.backgroundColor = GColorVividCerulean
      itemLayer.textColor = GColorWhite
    else:
      itemLayer.textColor = GColorWhite
    
    win.rootLayer.addChild(itemLayer.getLayer())
  
  # Click handlers for menu navigation
  proc upClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
    if selectedIndex > 0:
      selectedIndex.dec
      # In real implementation: menuLayer.reloadData()
      echo "Selected: ", menuItems[selectedIndex]
  
  proc downClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
    if selectedIndex < menuItems.len - 1:
      selectedIndex.inc
      # In real implementation: menuLayer.reloadData()
      echo "Selected: ", menuItems[selectedIndex]
  
  proc selectClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
    echo "Selected item: ", menuItems[selectedIndex]
    # In real implementation: onSelect callback
  
  onClick(constants.BUTTON_ID_UP, upClickHandler)
  onClick(constants.BUTTON_ID_DOWN, downClickHandler)
  onClick(constants.BUTTON_ID_SELECT, selectClickHandler)
  
  echo "Menu Demo Ready!"
  echo "This demonstrates what the simplified MenuLayer API would look like"

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Cleanup
  infoLayer = TextLayerHandle(nil)
  
  echo "Selected: ", menuItems[selectedIndex]

pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

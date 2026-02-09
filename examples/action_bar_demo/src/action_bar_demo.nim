## action_bar_demo - Pebble app demonstrating action bar in Nim
##
## Shows how to use ActionBarLayer with click handlers.
## Note: Icons would require resources - this demo shows the bar with default icons.

import nebble
import nebble/action_bar
import nebble/ffi # For BUTTON_ID constants

var
  sActionBar: ptr ActionBarLayer
  textLayer: ptr TextLayer
  textBuffer: array[32, char]
  counter = 0

proc updateDisplay() =
  ## Update the display with current counter value
  textLayer.staticText(textBuffer, "Count: " & $counter)

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle SELECT button (middle)
  inc counter
  updateDisplay()

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle UP button (top)
  counter += 10
  updateDisplay()

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle DOWN button (bottom)
  counter = 0
  textLayer.text = "Reset!"

proc clickConfigProvider(context: pointer) {.cdecl.} =
  ## Configure click handlers for action bar
  onClick(BUTTON_ID_SELECT, selectClickHandler)
  onClick(BUTTON_ID_UP, upClickHandler)
  onClick(BUTTON_ID_DOWN, downClickHandler)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create action bar layer first
  sActionBar = newActionBarLayer()
  
  # Add action bar to window (this reserves space on the right side)
  sActionBar.addToWindow(win)
  
  # Set click config provider
  sActionBar.clickConfigProvider = clickConfigProvider
  
  # Note: Setting background color (if available on color platforms)
  when declared(GColorBlue):
    sActionBar.backgroundColor = GColorBlue
  
  # Create text layer (narrower to account for action bar on the right)
  # ActionBarLayer is 30px wide, so subtract that from the width
  let textWidth = bounds.size.w - 30
  textLayer = newTextLayer(makeGRect(0, 60, textWidth, 50))
  textLayer.text = "Use buttons!"
  textLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  textLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_24_BOLD")
  
  when declared(GColorClear):
    textLayer.backgroundColor = GColorClear
  rootLayer.addChild(textLayer.getLayer())
  
  # Note: To use custom icons, you would need to:
  # 1. Add icon PNG files to resources/
  # 2. Define them in appinfo.json
  # 3. Load them with gbitmap_create_with_resource()
  # 4. Set them with action_bar.setIcon(BUTTON_ID_UP, upIcon)

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  sActionBar.destroy()
  textLayer.destroy()

pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

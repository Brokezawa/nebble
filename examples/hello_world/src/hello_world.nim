## hello_world - Pebble app written in Nim using the new high-level API
##
## This demonstrates the simplified Nebble API with:
## - pebbleApp macro (auto-generates main, init, deinit, window lifecycle)
## - onClick helper (simpler click handling)
## - Improved text layer API

import nebble
import nebble/ffi # For ButtonId enum values

var
  textLayer: ptr TextLayer
  clickCount = 0
  textBuffer: array[32, char]  # Buffer for dynamic text

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle SELECT button clicks - count clicks
  inc clickCount
  textLayer.staticText(textBuffer, "Clicks: " & $clickCount)

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle UP button clicks
  textLayer.text = "UP pressed!"

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle DOWN button clicks
  textLayer.text = "DOWN pressed!"

proc clickConfigProvider(context: pointer) {.cdecl.} =
  ## Configure click handlers for all buttons
  onClick(constants.BUTTON_ID_SELECT, selectClickHandler)
  onClick(constants.BUTTON_ID_UP, upClickHandler)
  onClick(constants.BUTTON_ID_DOWN, downClickHandler)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create text layer with initial text
  textLayer = newTextLayer(
    frame = makeGRect(0, 60, bounds.size.w, 40),
    text = "Press SELECT",
    align = GTextAlignment.GTextAlignmentCenter
  )
  
  # Add to window
  rootLayer.addChild(textLayer.getLayer())

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  textLayer.destroy()

# Use the pebbleApp macro to generate all boilerplate
pebbleApp(
  load = windowLoad,
  unload = windowUnload,
  clickConfig = clickConfigProvider
)

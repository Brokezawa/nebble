## vibes_demo - Pebble app demonstrating vibration patterns in Nim
##
## Shows different vibration patterns available on Pebble.

import nebble
import nebble/ui/vibes
import nebble/ffi # For BUTTON_ID constants

var
  titleLayer: ptr TextLayer
  instructionsLayer: ptr TextLayer

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Short single pulse
  vibes.shortPulse()
  titleLayer.text = "Short Pulse"

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Long pulse
  vibes.longPulse()
  titleLayer.text = "Long Pulse"

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Double pulse
  vibes.doublePulse()
  titleLayer.text = "Double Pulse"

proc clickConfigProvider(context: pointer) {.cdecl.} =
  ## Configure click handlers
  onClick(BUTTON_ID_SELECT, selectClickHandler)
  onClick(BUTTON_ID_UP, upClickHandler)
  onClick(BUTTON_ID_DOWN, downClickHandler)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create title layer
  titleLayer = newTextLayer(makeGRect(0, 50, bounds.size.w, 40))
  titleLayer.text = "Vibes Demo"
  titleLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  titleLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_28_BOLD")
  when declared(GColorClear):
    titleLayer.backgroundColor = GColorClear
  rootLayer.addChild(titleLayer.getLayer())
  
  # Create instructions layer
  instructionsLayer = newTextLayer(makeGRect(0, 95, bounds.size.w, 60))
  instructionsLayer.text = "SELECT: Short\nUP: Long\nDOWN: Double"
  instructionsLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  instructionsLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_18")
  when declared(GColorClear):
    instructionsLayer.backgroundColor = GColorClear
  rootLayer.addChild(instructionsLayer.getLayer())

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  titleLayer.destroy()
  instructionsLayer.destroy()

pebbleApp(
  load = windowLoad,
  unload = windowUnload,
  clickConfig = clickConfigProvider
)

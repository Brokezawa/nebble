## persist_demo - Pebble app demonstrating persistent storage in Nim
##
## Shows how to save and restore data across app sessions.

import nebble
import nebble/foundation/storage
import nebble/ui/vibes
import nebble/ffi # For BUTTON_ID constants

const
  PERSIST_KEY_COUNTER = 1
  PERSIST_KEY_NAME = 2

var
  counterLayer: ptr TextLayer
  nameLayer: ptr TextLayer
  counterBuffer: array[32, char]
  nameBuffer: array[64, char]
  counter: int32 = 0

proc updateDisplay() =
  ## Update the display with current counter value
  counterLayer.staticText(counterBuffer, "Counter: " & $counter)

proc saveData() =
  ## Save data to persistent storage
  discard storage.writeInt(PERSIST_KEY_COUNTER, counter)

proc loadData() =
  ## Load data from persistent storage
  if storage.exists(PERSIST_KEY_COUNTER):
    counter = storage.readInt(PERSIST_KEY_COUNTER)
  else:
    counter = 0
  
  if storage.exists(PERSIST_KEY_NAME):
    discard storage.readString(PERSIST_KEY_NAME, addr nameBuffer[0], 64)
  else:
    let defaultName = "Nebble User"
    for i in 0..<defaultName.len:
      nameBuffer[i] = defaultName[i]
    nameBuffer[defaultName.len] = '\0'

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Increment counter and save
  inc counter
  saveData()
  updateDisplay()
  
  # Vibrate on milestone
  if counter mod 10 == 0:
    vibes.shortPulse()

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Add 10 to counter
  counter += 10
  saveData()
  updateDisplay()

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Reset counter
  counter = 0
  saveData()
  updateDisplay()
  vibes.doublePulse()

proc clickConfigProvider(context: pointer) {.cdecl.} =
  ## Configure click handlers
  onClick(constants.BUTTON_ID_SELECT, selectClickHandler)
  onClick(constants.BUTTON_ID_UP, upClickHandler)
  onClick(constants.BUTTON_ID_DOWN, downClickHandler)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create title layer
  let titleLayer = newTextLayer(makeGRect(0, 20, bounds.size.w, 30))
  titleLayer.text = "Persist Demo"
  titleLayer.textAlignment = constants.GTextAlignmentCenter
  titleLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_24_BOLD")
  when declared(GColorClear):
    titleLayer.backgroundColor = GColorClear
  rootLayer.addChild(titleLayer.getLayer())
  
  # Create name layer
  nameLayer = newTextLayer(makeGRect(0, 55, bounds.size.w, 25))
  nameLayer.text = cast[cstring](addr nameBuffer[0])
  nameLayer.textAlignment = constants.GTextAlignmentCenter
  nameLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_18")
  when declared(GColorClear):
    nameLayer.backgroundColor = GColorClear
  rootLayer.addChild(nameLayer.getLayer())
  
  # Create counter layer
  counterLayer = newTextLayer(makeGRect(0, 85, bounds.size.w, 35))
  counterLayer.textAlignment = constants.GTextAlignmentCenter
  counterLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_28_BOLD")
  when declared(GColorClear):
    counterLayer.backgroundColor = GColorClear
  rootLayer.addChild(counterLayer.getLayer())
  
  # Create instructions layer
  let instrLayer = newTextLayer(makeGRect(0, 125, bounds.size.w, 40))
  instrLayer.text = "SELECT: +1\nUP: +10\nDOWN: Reset"
  instrLayer.textAlignment = constants.GTextAlignmentCenter
  instrLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_14")
  when declared(GColorClear):
    instrLayer.backgroundColor = GColorClear
  rootLayer.addChild(instrLayer.getLayer())
  
  # Load and display data
  loadData()
  updateDisplay()

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  counterLayer.destroy()
  nameLayer.destroy()

proc deinitApp() =
  ## Deinitialize the app
  saveData()  # Save one last time before exiting

pebbleApp(
  load = windowLoad,
  unload = windowUnload,
  deinit = deinitApp,
  clickConfig = clickConfigProvider
)

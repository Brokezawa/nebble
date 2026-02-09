## persist_demo - Pebble app demonstrating persistent storage in Nim
##
## Shows how to save and restore data across app sessions.

import nebble
import nebble/ffi as ffi  # For BUTTON_ID_* constants

const
  PERSIST_KEY_COUNTER = 1
  PERSIST_KEY_NAME = 2

var
  window: ptr Window
  counterLayer: ptr TextLayer
  nameLayer: ptr TextLayer
  counterBuffer: array[32, char]
  nameBuffer: array[64, char]
  counter: int32 = 0

proc updateDisplay() =
  ## Update the display with current counter value
  let counterText = "Counter: " & $counter
  for i in 0..<min(counterText.len, 31):
    counterBuffer[i] = counterText[i]
  counterBuffer[min(counterText.len, 31)] = '\0'
  counterLayer.text = cast[cstring](addr counterBuffer[0])

proc saveData() =
  ## Save data to persistent storage
  discard ffi.persist_write_int(PERSIST_KEY_COUNTER, counter)

proc loadData() =
  ## Load data from persistent storage
  if ffi.persist_exists(PERSIST_KEY_COUNTER):
    counter = ffi.persist_read_int(PERSIST_KEY_COUNTER)
  else:
    counter = 0
  
  if ffi.persist_exists(PERSIST_KEY_NAME):
    discard ffi.persist_read_string(PERSIST_KEY_NAME, addr nameBuffer[0], 64)
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
    ffi.vibes_short_pulse()

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
  ffi.vibes_double_pulse()

proc clickConfigProvider(context: pointer) {.cdecl.} =
  ## Configure click handlers
  singleClickSubscribe(BUTTON_ID_SELECT, selectClickHandler)
  singleClickSubscribe(BUTTON_ID_UP, upClickHandler)
  singleClickSubscribe(BUTTON_ID_DOWN, downClickHandler)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create title layer
  let titleLayer = newTextLayer(makeGRect(0, 20, bounds.size.w, 30))
  titleLayer.text = "Persist Demo"
  titleLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  titleLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_24_BOLD")
  when declared(GColorClear):
    titleLayer.backgroundColor = GColorClear
  rootLayer.addChild(titleLayer.getLayer())
  
  # Create name layer
  nameLayer = newTextLayer(makeGRect(0, 55, bounds.size.w, 25))
  nameLayer.text = cast[cstring](addr nameBuffer[0])
  nameLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  nameLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_18")
  when declared(GColorClear):
    nameLayer.backgroundColor = GColorClear
  rootLayer.addChild(nameLayer.getLayer())
  
  # Create counter layer
  counterLayer = newTextLayer(makeGRect(0, 85, bounds.size.w, 35))
  counterLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  counterLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_28_BOLD")
  when declared(GColorClear):
    counterLayer.backgroundColor = GColorClear
  rootLayer.addChild(counterLayer.getLayer())
  
  # Create instructions layer
  let instrLayer = newTextLayer(makeGRect(0, 125, bounds.size.w, 40))
  instrLayer.text = "SELECT: +1\nUP: +10\nDOWN: Reset"
  instrLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
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

proc init() =
  ## Initialize the app
  window = newWindow()
  window.clickConfigProvider = clickConfigProvider
  window.setHandlers(
    load = windowLoad,
    unload = windowUnload
  )
  window.push(animated = true)

proc deinit() =
  ## Deinitialize the app
  saveData()  # Save one last time before exiting
  window.destroy()

proc main(): cint {.exportc, cdecl.} =
  ## App entry point
  init()
  eventLoop()
  deinit()
  return 0

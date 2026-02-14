## persist_demo - Pebble app demonstrating persistent storage in Nim
##
## Shows how to save and restore data across app sessions using the declarative DSL.

import nebble
import nebble/foundation/storage
import nebble/ui/vibes

const
  PERSIST_KEY_COUNTER = 1
  PERSIST_KEY_NAME = 2

# Forward declarations
proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}
proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}
proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}
proc loadData()
proc updateDisplay()
proc saveData()

var
  counter: int32 = 0
  counterStr: FixedString[32]
  nameStr: FixedString[64]

# Declarative App
nebbleApp:
  init:

    loadData()
    updateDisplay()

  deinit:
    saveData()

  textLayer:
    id = titleLayer
    frame = (0, 20, 144, 30)
    text = "Persist Demo"
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_24_BOLD
    bgColor = GColorClear
    
  textLayer:
    id = nameLayer
    frame = (0, 55, 144, 25)
    text = nameStr
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_18
    bgColor = GColorClear
    
  textLayer:
    id = counterLayer
    frame = (0, 85, 144, 35)
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_28_BOLD
    bgColor = GColorClear
    
  textLayer:
    id = instrLayer
    frame = (0, 125, 144, 40)
    text = "SELECT: +1\nUP: +10\nDOWN: Reset"
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_14
    bgColor = GColorClear

  clicks:
    BUTTON_ID_SELECT = selectClickHandler
    BUTTON_ID_UP = upClickHandler
    BUTTON_ID_DOWN = downClickHandler

proc updateDisplay() =
  counterStr.f("Counter: ", counter)
  counterLayer.text = counterStr

proc saveData() =
  discard storage.writeInt(PERSIST_KEY_COUNTER, counter)
  discard storage.write(PERSIST_KEY_NAME, nameStr)

proc loadData() =
  if storage.exists(PERSIST_KEY_COUNTER):
    counter = storage.readInt(PERSIST_KEY_COUNTER)
  else:
    counter = 0
  
  if storage.exists(PERSIST_KEY_NAME):
    discard storage.read(PERSIST_KEY_NAME, nameStr)
  else:
    nameStr.f("Nebble User")

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  inc counter
  saveData()
  updateDisplay()
  if counter mod 10 == 0: vibes.shortPulse()

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  counter += 10
  saveData()
  updateDisplay()

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  counter = 0
  saveData()
  updateDisplay()
  vibes.doublePulse()

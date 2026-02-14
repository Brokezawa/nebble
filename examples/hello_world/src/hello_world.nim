## hello_world - Pebble app written in Nim using the modern API
##
## This demonstrates the simplified Nebble API with:
## - nebbleApp macro (declarative UI)
## - FixedString for heap-free formatting
## - Click handling via DSL

import nebble

# Forward Declarations
proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}
proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}
proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}

# App Logic State
var
  clickCount = 0
  statusText: FixedString[32]

# Declarative App
nebbleApp:
  textLayer:
    id = myTextLayer
    fullWidth = true
    y = center
    h = 40
    text = "Press SELECT"
    alignment = GTextAlignmentCenter
    
  clicks:
    BUTTON_ID_SELECT = selectClickHandler
    BUTTON_ID_UP = upClickHandler
    BUTTON_ID_DOWN = downClickHandler

# Event Handlers
proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  inc clickCount
  statusText.f("Clicks: ", clickCount)
  myTextLayer.text = statusText

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  myTextLayer.text = "UP pressed!"

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  myTextLayer.text = "DOWN pressed!"

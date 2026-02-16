## vibes_demo - Pebble app demonstrating vibration patterns in Nim
##
## Shows different vibration patterns available on Pebble using the declarative DSL.

import nebble
import nebble/ui/vibes

# Handlers
proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}
proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}
proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}

# Declarative App
nebbleApp:
  textLayer:
    id = titleLayer
    fullWidth = true
    y = 40
    h = 40
    text = "Vibes Demo"
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_28_BOLD
    
  textLayer:
    id = instructionsLayer
    fullWidth = true
    y = 90
    h = 60
    text = "SELECT: Short\nUP: Long\nDOWN: Double"
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_18

  clicks:
    BUTTON_ID_SELECT = selectClickHandler
    BUTTON_ID_UP = upClickHandler
    BUTTON_ID_DOWN = downClickHandler

# Implementations
proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  vibes.shortPulse()
  titleLayer.text = "Short Pulse"

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  vibes.longPulse()
  titleLayer.text = "Long Pulse"

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  vibes.doublePulse()
  titleLayer.text = "Double Pulse"

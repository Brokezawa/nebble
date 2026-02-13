import nebble

# Forward Handlers
proc upClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.}
proc selectClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.}
proc downClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.}

# Declarative App
nebbleApp:
  actionBarLayer:
    id = myActionBar
    bgColor = pblIfColorElse(GColorBlue, GColorBlack)

  textLayer:
    id = titleLayer
    x = center
    y = 5
    w = 100
    h = 24
    text = "Action Bar"
    font = FONT_KEY_GOTHIC_18_BOLD
    alignment = GTextAlignmentCenter
    
  textLayer:
    id = infoLayer
    x = center
    y = 40
    w = 100
    h = 80
    text = "UP: Prev\nSELECT: Play\nDOWN: Next"
    font = FONT_KEY_GOTHIC_14
    alignment = GTextAlignmentLeft
    
  textLayer:
    id = statusLayer
    x = center
    y = 130
    w = 100
    h = 24
    text = "Ready"
    font = FONT_KEY_GOTHIC_18
    alignment = GTextAlignmentCenter

  clicks:
    BUTTON_ID_UP = upClickHandler
    BUTTON_ID_SELECT = selectClickHandler
    BUTTON_ID_DOWN = downClickHandler

# Implementations
proc upClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
  statusLayer.text = "Previous"

proc selectClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
  statusLayer.text = "Play/Pause"

proc downClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
  statusLayer.text = "Next"


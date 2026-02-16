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

  # Container layer for text, sized to available width
  layer:
    id = mainLayer
    x = 0
    y = 0
    w = PBLDisplayWidth - ActionBarWidth
    fullHeight = true

  textLayer:
    id = titleLayer
    parent = mainLayer
    fullWidth = true
    y = 5
    h = 24
    text = "Action Bar"
    font = FONT_KEY_GOTHIC_18_BOLD
    alignment = GTextAlignmentCenter
    
  textLayer:
    id = infoLayer
    parent = mainLayer
    x = center
    y = center
    w = PBLDisplayWidth - ActionBarWidth - 10
    h = 60
    text = "UP: Prev\nSELECT: Play\nDOWN: Next"
    font = FONT_KEY_GOTHIC_14
    alignment = GTextAlignmentCenter
    
  textLayer:
    id = statusLayer
    parent = mainLayer
    fullWidth = true
    y = PBLDisplayHeight - 30
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


## Pure Action Bar Demo
##
## A clean demonstration of action bar with managed types.

import nebble
import nebble/ui/text_layer_managed
import nebble/ui/window_managed
import nebble/ui/clicks

# Module-level handles
var 
  titleLayer: TextLayerHandle
  infoLayer: TextLayerHandle
  statusLayer: TextLayerHandle
  # In full implementation: actionBar: ActionBarLayerHandle

# Action bar state
var upAction: string = "Previous"
var selectAction: string = "Play"
var downAction: string = "Next"

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Create action bar demonstration
  
  let bounds = win.rootLayer.bounds
  
  # Title
  titleLayer = newTextLayerHandle(
    makeGRect(0'i16, 5'i16, bounds.size.w - 20'i16, 24'i16),  # Leave room for action bar
    "Action Bar Demo".cstring,
    getSystemFont(FONT_KEY_GOTHIC_18_BOLD.cstring),
    GTextAlignmentCenter
  )
  titleLayer.textColor = GColorWhite
  win.rootLayer.addChild(titleLayer.getLayer())

  # Info text
  infoLayer = newTextLayerHandle(
    makeGRect(5'i16, 40'i16, bounds.size.w - 25'i16, 80'i16),
    "UP: Previous\nSELECT: Play/Pause\nDOWN: Next".cstring,
    getSystemFont(FONT_KEY_GOTHIC_14.cstring),
    GTextAlignmentLeft
  )
  infoLayer.textColor = GColorWhite
  win.rootLayer.addChild(infoLayer.getLayer())
  
  # Status display
  statusLayer = newTextLayerHandle(
    makeGRect(5'i16, 130'i16, bounds.size.w - 25'i16, 24'i16),
    "Ready".cstring,
    getSystemFont(FONT_KEY_GOTHIC_18.cstring),
    GTextAlignmentCenter
  )
  statusLayer.textColor = GColorVividCerulean
  win.rootLayer.addChild(statusLayer.getLayer())
  
  # Click handlers
  proc upClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
    echo "UP action: ", upAction
    statusLayer.text = upAction.cstring
    # In full implementation with ActionBarLayerHandle:
    # actionBar.icon(BUTTON_ID_UP) = RESOURCE_ID_ICON_PREVIOUS
  
  proc selectClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
    if selectAction == "Play":
      selectAction = "Pause"
      echo "SELECT: Play -> Pause"
      statusLayer.text = "Playing".cstring
    else:
      selectAction = "Play"
      echo "SELECT: Pause -> Play"
      statusLayer.text = "Paused".cstring
    # In full implementation:
    # actionBar.icon(BUTTON_ID_SELECT) = 
    #   if selectAction == "Play": RESOURCE_ID_ICON_PLAY else: RESOURCE_ID_ICON_PAUSE
  
  proc downClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
    echo "DOWN action: ", downAction
    statusLayer.text = downAction.cstring
    # In full implementation:
    # actionBar.icon(BUTTON_ID_DOWN) = RESOURCE_ID_ICON_NEXT
  
  onClick(BUTTON_ID_UP, upClickHandler)
  onClick(BUTTON_ID_SELECT, selectClickHandler)
  onClick(BUTTON_ID_DOWN, downClickHandler)
  
  echo "Action Bar Demo Ready!"
  echo "This shows what ActionBarLayerHandle would provide:"
  echo "- Consistent action buttons on the right"
  echo "- Icon management"
  echo "- Automatic layout"

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Cleanup
  titleLayer = TextLayerHandle(nil)
  infoLayer = TextLayerHandle(nil)
  statusLayer = TextLayerHandle(nil)

pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

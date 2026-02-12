## Pure Scroll Demo
##
## A clean demonstration of scrolling content with managed types.

import nebble
import nebble/ui/text_layer_managed

# Module-level handles
var 
  titleLayer: TextLayerHandle
  contentLayer: TextLayerHandle

# Scrolling state (module-level for cdecl access)
var scrollOffset: int = 0
const lineHeight: int = 16

# Window bounds for layout
var windowBounds: GRect

# Sample content to scroll
const scrollContent = """This is a scrolling
text demonstration.

You can scroll through
multiple lines of text
using the UP and DOWN
buttons.

This shows how a
ScrollLayer would work
with automatic content
management.

Pure managed types
make this easy!"""

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Create scrolling content demo
  
  windowBounds = win.rootLayer.bounds
  
  # Title
  titleLayer = newTextLayerHandle(
    makeGRect(0'i16, 5'i16, windowBounds.size.w, 24'i16),
    "Scroll Demo".cstring,
    getSystemFont(FONT_KEY_GOTHIC_18_BOLD.cstring),
    constants.GTextAlignmentCenter
  )
  titleLayer.textColor = GColorWhite
  win.rootLayer.addChild(titleLayer.getLayer())
  
  # Content area (scrolling)
  contentLayer = newTextLayerHandle(
    makeGRect(5'i16, 35'i16, windowBounds.size.w - 10'i16, windowBounds.size.h - 40'i16),
    scrollContent.cstring,
    getSystemFont(FONT_KEY_GOTHIC_14.cstring),
    constants.GTextAlignmentLeft
  )
  contentLayer.textColor = GColorWhite
  contentLayer.overflowMode = GTextOverflowModeWordWrap
  win.rootLayer.addChild(contentLayer.getLayer())
  
  # Click handlers for scrolling
  proc upClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
    if scrollOffset > 0:
      scrollOffset = scrollOffset - lineHeight
      # In real ScrollLayer: scrollLayer.contentOffset = ...
      contentLayer.frame = makeGRect(5'i16, (35 - scrollOffset).int16, windowBounds.size.w - 10'i16, windowBounds.size.h - 40'i16)
      echo "Scrolled up, offset: ", scrollOffset
  
  proc downClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
    scrollOffset = scrollOffset + lineHeight
    # In real ScrollLayer: scrollLayer.contentOffset = ...
    contentLayer.frame = makeGRect(5'i16, (35 - scrollOffset).int16, windowBounds.size.w - 10'i16, windowBounds.size.h - 40'i16)
    echo "Scrolled down, offset: ", scrollOffset
  
  onClick(constants.BUTTON_ID_UP, upClickHandler)
  onClick(constants.BUTTON_ID_DOWN, downClickHandler)
  
  echo "Scroll Demo Ready!"
  echo "Use UP/DOWN to scroll"
  echo "(In full implementation, would use ScrollLayerHandle)"

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Cleanup
  titleLayer = TextLayerHandle(nil)
  contentLayer = TextLayerHandle(nil)

pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

# test_highlevel.nim - Verify that the high-level Nim API compiles correctly.
# This is a rewrite of test_ffi.nim using the idiomatic Nim API from `import nebble`.

import nebble
import nebble/ffi # For constants

# --- App state ---
var sWindow: WindowHandle
var sTextLayer: TextLayerHandle
var sBitmapLayer: BitmapLayerHandle  # Batch 2: bitmap_layer
var sActionBar: ActionBarLayerHandle  # Batch 2: action_bar

# --- Click handlers ---
proc selectClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
  sTextLayer.text = "Select"

proc upClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
  sTextLayer.text = "Up"

proc downClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
  sTextLayer.text = "Down"

proc clickConfigProvider(context: pointer) {.cdecl.} =
  onClick(constants.BUTTON_ID_SELECT, selectClickHandler)
  onClick(constants.BUTTON_ID_UP, upClickHandler)
  onClick(constants.BUTTON_ID_DOWN, downClickHandler)

# --- Window handlers ---
proc windowLoad(window: ptr Window) {.cdecl.} =
  let windowLayer = window.rootLayer
  let bounds = windowLayer.bounds
  
  # Text layer
  sTextLayer = newTextLayer(makeGRect(0, 72, bounds.size.w, 20))
  sTextLayer.text = "Nim on Pebble!"
  # Use the high-level property setter on the managed handle and
  # qualify the constant to avoid enum/const ambiguity.
  sTextLayer.textAlignment = constants.GTextAlignmentCenter
  
  # Batch 2: Use a custom font
  let customFont = getSystemFont(FONT_KEY_GOTHIC_24_BOLD)
  sTextLayer.font = customFont
  
  windowLayer.addChild(sTextLayer.getLayer)
  
  # Batch 2: Create a bitmap layer (no bitmap loaded, just testing API)
  sBitmapLayer = newBitmapLayer(makeGRect(10, 10, 50, 50))
  sBitmapLayer.alignment = constants.GAlignCenter
  windowLayer.addChild(sBitmapLayer.getLayer)
  
  # Batch 2: Create an action bar (no icons loaded, just testing API)
  sActionBar = newActionBarLayer()
  sActionBar.addToWindow(window)

proc windowUnload(window: ptr Window) {.cdecl.} =
  # Reset managed handles (destroy underlying resources if safe)
  sTextLayer.reset()
  sBitmapLayer.reset()
  sActionBar.reset()

# --- Init / Deinit ---
proc init() =
  sWindow = newWindow()
  sWindow.clickConfig = clickConfigProvider
  sWindow.setHandlers(load = windowLoad, unload = windowUnload)
  sWindow.push(animated = true)

proc deinit() =
  sWindow.reset()

# --- Main entry point ---
proc main(): cint {.exportc, cdecl.} =
  init()
  eventLoop()
  deinit()
  return 0

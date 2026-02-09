## action_bar_demo - Pebble app demonstrating action bar in Nim
##
## Shows how to use ActionBarLayer with click handlers.
## Note: Icons would require resources - this demo shows the bar with default icons.

import nebble/ffi
import nebble/clicks
from nebble/app import eventLoop

var
  window: ptr Window
  actionBar: ptr ActionBarLayer
  textLayer: ptr TextLayer
  textBuffer: array[32, char]
  counter = 0

proc updateDisplay() =
  ## Update the display with current counter value
  let text = "Count: " & $counter
  for i in 0..<min(text.len, 31):
    textBuffer[i] = text[i]
  textBuffer[min(text.len, 31)] = '\0'
  ffi.text_layer_set_text(textLayer, cast[cstring](addr textBuffer[0]))

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle SELECT button (middle)
  inc counter
  updateDisplay()

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle UP button (top)
  counter += 10
  updateDisplay()

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle DOWN button (bottom)
  counter = 0
  ffi.text_layer_set_text(textLayer, "Reset!")

proc clickConfigProvider(context: pointer) {.cdecl.} =
  ## Configure click handlers for action bar
  onClick(BUTTON_ID_SELECT, selectClickHandler)
  onClick(BUTTON_ID_UP, upClickHandler)
  onClick(BUTTON_ID_DOWN, downClickHandler)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = ffi.window_get_root_layer(win)
  let bounds = ffi.layer_get_bounds(rootLayer)
  
  # Create action bar layer first
  actionBar = ffi.action_bar_layer_create()
  
  # Add action bar to window (this reserves space on the right side)
  ffi.action_bar_layer_add_to_window(actionBar, win)
  
  # Set click config provider
  ffi.action_bar_layer_set_click_config_provider(actionBar, clickConfigProvider)
  
  # Note: Setting background color (if available on color platforms)
  when declared(GColorBlue):
    ffi.action_bar_layer_set_background_color(actionBar, GColorBlue)
  
  # Create text layer (narrower to account for action bar on the right)
  # ActionBarLayer is 30px wide, so subtract that from the width
  let textWidth = bounds.size.w - 30
  textLayer = ffi.text_layer_create(makeGRect(0, 60, textWidth, 50))
  ffi.text_layer_set_text(textLayer, "Use buttons!")
  ffi.text_layer_set_text_alignment(textLayer, GTextAlignmentCenter)
  ffi.text_layer_set_font(textLayer, ffi.fonts_get_system_font(FONT_KEY_GOTHIC_24_BOLD))
  when declared(GColorClear):
    ffi.text_layer_set_background_color(textLayer, GColorClear)
  ffi.layer_add_child(rootLayer, ffi.text_layer_get_layer(textLayer))
  
  # Note: To use custom icons, you would need to:
  # 1. Add icon PNG files to resources/
  # 2. Define them in appinfo.json
  # 3. Load them with gbitmap_create_with_resource()
  # 4. Set them with action_bar_layer_set_icon()
  # Example:
  #   upIcon = gbitmap_create_with_resource(RESOURCE_ID_UP_ICON)
  #   action_bar_layer_set_icon(actionBar, BUTTON_ID_UP, upIcon)

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  ffi.action_bar_layer_destroy(actionBar)
  ffi.text_layer_destroy(textLayer)

proc init() {.cdecl.} =
  ## Initialize the app
  window = ffi.window_create()
  ffi.window_set_window_handlers(window, WindowHandlers(
    load: windowLoad,
    unload: windowUnload
  ))
  ffi.window_stack_push(window, true)

proc deinit() {.cdecl.} =
  ## Deinitialize the app
  ffi.window_destroy(window)

proc main() {.exportc, cdecl.} =
  ## App entry point
  init()
  eventLoop()
  deinit()

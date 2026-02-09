# test_ffi.nim - Verify that the Futhark-generated FFI bindings compile correctly.
# This is a rewrite of poc/hello.nim using `import nebble/ffi` instead of
# manual {.importc.} declarations.

import nebble/ffi

# --- App state ---
var sWindow: ptr Window
var sTextLayer: ptr TextLayer

# --- Click handlers ---
proc selectClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
  text_layer_set_text(sTextLayer, "Select")

proc upClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
  text_layer_set_text(sTextLayer, "Up")

proc downClickHandler(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.} =
  text_layer_set_text(sTextLayer, "Down")

proc clickConfigProvider(context: pointer) {.cdecl.} =
  window_single_click_subscribe(BUTTON_ID_SELECT, selectClickHandler)
  window_single_click_subscribe(BUTTON_ID_UP, upClickHandler)
  window_single_click_subscribe(BUTTON_ID_DOWN, downClickHandler)

# --- Window handlers ---
proc windowLoad(window: ptr Window) {.cdecl.} =
  let windowLayer = window_get_root_layer(window)
  let bounds = layer_get_bounds(windowLayer)
  sTextLayer = text_layer_create(makeGRect(0, 72, bounds.size.w, 20))
  text_layer_set_text(sTextLayer, "Nim on Pebble!")
  text_layer_set_text_alignment(sTextLayer, GTextAlignmentCenter)
  layer_add_child(windowLayer, text_layer_get_layer(sTextLayer))

proc windowUnload(window: ptr Window) {.cdecl.} =
  text_layer_destroy(sTextLayer)

# --- Init / Deinit ---
proc init() =
  sWindow = window_create()
  window_set_click_config_provider(sWindow, clickConfigProvider)
  var handlers: WindowHandlers
  handlers.load = windowLoad
  handlers.unload = windowUnload
  window_set_window_handlers(sWindow, handlers)
  window_stack_push(sWindow, true)

proc deinit() =
  window_destroy(sWindow)

# --- Main entry point ---
proc main(): cint {.exportc, cdecl.} =
  init()
  app_event_loop()
  deinit()
  return 0

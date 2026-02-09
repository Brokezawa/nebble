# hello.nim - Minimal Nim Pebble app PoC
# This is a direct translation of the default pebble new-project template.

{.push header: "<pebble.h>".}

# --- Opaque types (Pebble SDK uses forward declarations) ---
type
  Window {.importc: "Window", incompletestruct.} = object
  TextLayer {.importc: "TextLayer", incompletestruct.} = object
  Layer {.importc: "Layer", incompletestruct.} = object
  ClickRecognizerRef {.importc: "ClickRecognizerRef".} = pointer

# --- Structs ---
type
  GPoint {.importc: "GPoint", bycopy.} = object
    x: int16
    y: int16

  GSize {.importc: "GSize", bycopy.} = object
    w: int16
    h: int16

  GRect {.importc: "GRect", bycopy.} = object
    origin: GPoint
    size: GSize

  GTextAlignment {.importc: "GTextAlignment".} = enum
    GTextAlignmentLeft = 0
    GTextAlignmentCenter = 1
    GTextAlignmentRight = 2

  ButtonId {.importc: "ButtonId".} = enum
    BUTTON_ID_BACK = 0
    BUTTON_ID_UP = 1
    BUTTON_ID_SELECT = 2
    BUTTON_ID_DOWN = 3

# --- Callback types ---
type
  WindowHandler {.importc: "WindowHandler".} = proc(window: ptr Window) {.cdecl.}
  ClickHandler {.importc: "ClickHandler".} = proc(recognizer: ClickRecognizerRef, context: pointer) {.cdecl.}
  ClickConfigProvider {.importc: "ClickConfigProvider".} = proc(context: pointer) {.cdecl.}

  WindowHandlers {.importc: "WindowHandlers", bycopy.} = object
    load: WindowHandler
    appear: WindowHandler
    disappear: WindowHandler
    unload: WindowHandler

# --- Pebble API functions ---
proc app_event_loop() {.importc.}
proc window_create(): ptr Window {.importc.}
proc window_destroy(window: ptr Window) {.importc.}
proc window_set_click_config_provider(window: ptr Window, provider: ClickConfigProvider) {.importc.}
proc window_set_window_handlers(window: ptr Window, handlers: WindowHandlers) {.importc.}
proc window_get_root_layer(window: ptr Window): ptr Layer {.importc.}
proc window_stack_push(window: ptr Window, animated: bool) {.importc.}
proc window_single_click_subscribe(button_id: ButtonId, handler: ClickHandler) {.importc.}

proc layer_get_bounds(layer: ptr Layer): GRect {.importc.}
proc layer_add_child(parent: ptr Layer, child: ptr Layer) {.importc.}

proc text_layer_create(frame: GRect): ptr TextLayer {.importc.}
proc text_layer_destroy(text_layer: ptr TextLayer) {.importc.}
proc text_layer_set_text(text_layer: ptr TextLayer, text: cstring) {.importc.}
proc text_layer_set_text_alignment(text_layer: ptr TextLayer, alignment: GTextAlignment) {.importc.}
proc text_layer_get_layer(text_layer: ptr TextLayer): ptr Layer {.importc.}

{.pop.}

# --- Helper to construct GRect (the C version is a macro) ---
proc makeGRect(x, y, w, h: int16): GRect =
  result.origin.x = x
  result.origin.y = y
  result.size.w = w
  result.size.h = h

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

## battery_status - Pebble app demonstrating battery service in Nim
##
## Shows battery level, charging state, and updates on battery changes.

import nebble/ffi
from nebble/app import eventLoop

var
  window: ptr Window
  statusBar: ptr StatusBarLayer
  batteryLayer: ptr TextLayer
  chargingLayer: ptr TextLayer
  batteryBuffer: array[32, char]
  chargingBuffer: array[32, char]

proc updateBatteryDisplay(state: BatteryChargeState) =
  ## Update the battery display with current state
  
  # Format battery percentage
  let percentText = "Battery: " & $state.charge_percent & "%"
  for i in 0..<min(percentText.len, 31):
    batteryBuffer[i] = percentText[i]
  batteryBuffer[min(percentText.len, 31)] = '\0'
  text_layer_set_text(batteryLayer, cast[cstring](addr batteryBuffer[0]))
  
  # Format charging status
  let chargingText = 
    if state.is_charging:
      "Charging..."
    elif state.is_plugged:
      "Plugged In"
    else:
      "On Battery"
  
  for i in 0..<min(chargingText.len, 31):
    chargingBuffer[i] = chargingText[i]
  chargingBuffer[min(chargingText.len, 31)] = '\0'
  text_layer_set_text(chargingLayer, cast[cstring](addr chargingBuffer[0]))

proc batteryStateHandler(state: BatteryChargeState) {.cdecl.} =
  ## Called when battery state changes
  updateBatteryDisplay(state)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = window_get_root_layer(win)
  let bounds = layer_get_bounds(rootLayer)
  
  # Create status bar at top (if available - not on Aplite)
  when declared(status_bar_layer_create):
    statusBar = status_bar_layer_create()
    layer_add_child(rootLayer, status_bar_layer_get_layer(statusBar))
  
  # Create battery percentage layer
  batteryLayer = text_layer_create(makeGRect(0, 60, bounds.size.w, 30))
  text_layer_set_text_alignment(batteryLayer, GTextAlignmentCenter)
  text_layer_set_font(batteryLayer, fonts_get_system_font(FONT_KEY_GOTHIC_24_BOLD))
  
  when declared(GColorClear):
    text_layer_set_background_color(batteryLayer, GColorClear)
  
  # Create charging status layer
  chargingLayer = text_layer_create(makeGRect(0, 95, bounds.size.w, 30))
  text_layer_set_text_alignment(chargingLayer, GTextAlignmentCenter)
  text_layer_set_font(chargingLayer, fonts_get_system_font(FONT_KEY_GOTHIC_18))
  
  when declared(GColorClear):
    text_layer_set_background_color(chargingLayer, GColorClear)
  
  # Add layers to window
  layer_add_child(rootLayer, text_layer_get_layer(batteryLayer))
  layer_add_child(rootLayer, text_layer_get_layer(chargingLayer))
  
  # Get initial battery state
  let initialState = battery_state_service_peek()
  updateBatteryDisplay(initialState)

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  when declared(status_bar_layer_destroy):
    if statusBar != nil:
      status_bar_layer_destroy(statusBar)
  text_layer_destroy(batteryLayer)
  text_layer_destroy(chargingLayer)

proc init() {.cdecl.} =
  ## Initialize the app
  window = window_create()
  window_set_window_handlers(window, WindowHandlers(
    load: windowLoad,
    unload: windowUnload
  ))
  
  # Subscribe to battery state changes
  battery_state_service_subscribe(batteryStateHandler)
  
  window_stack_push(window, true)

proc deinit() {.cdecl.} =
  ## Deinitialize the app
  battery_state_service_unsubscribe()
  window_destroy(window)

proc main() {.exportc, cdecl.} =
  ## App entry point
  init()
  eventLoop()
  deinit()

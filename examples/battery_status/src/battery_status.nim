## battery_status - Pebble app demonstrating battery service in Nim
##
## Shows battery level, charging state, and updates on battery changes.

import nebble
import nebble/battery
import nebble/status_bar

var
  sStatusBar: ptr StatusBarLayer
  batteryLayer: ptr TextLayer
  chargingLayer: ptr TextLayer
  batteryBuffer: array[32, char]
  chargingBuffer: array[32, char]

proc updateBatteryDisplay(state: BatteryChargeState) =
  ## Update the battery display with current state
  
  # Format battery percentage
  let percentText = "Battery: " & $state.charge_percent & "%"
  batteryLayer.staticText(batteryBuffer, percentText)
  
  # Format charging status
  let chargingText = 
    if state.is_charging:
      "Charging..."
    elif state.is_plugged:
      "Plugged In"
    else:
      "On Battery"
  
  chargingLayer.staticText(chargingBuffer, chargingText)

proc batteryStateHandler(state: BatteryChargeState) {.cdecl.} =
  ## Called when battery state changes
  updateBatteryDisplay(state)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create status bar at top (if available - not on Aplite)
  when declared(newStatusBarLayer):
    sStatusBar = newStatusBarLayer()
    rootLayer.addChild(sStatusBar.getLayer())
  
  # Create battery percentage layer
  batteryLayer = newTextLayer(makeGRect(0, 60, bounds.size.w, 30))
  batteryLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  batteryLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_24_BOLD")
  
  when declared(GColorClear):
    batteryLayer.backgroundColor = GColorClear
  
  # Create charging status layer
  chargingLayer = newTextLayer(makeGRect(0, 95, bounds.size.w, 30))
  chargingLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  chargingLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_18")
  
  when declared(GColorClear):
    chargingLayer.backgroundColor = GColorClear
  
  # Add layers to window
  rootLayer.addChild(batteryLayer.getLayer())
  rootLayer.addChild(chargingLayer.getLayer())
  
  # Get initial battery state
  let initialState = battery.peek()
  updateBatteryDisplay(initialState)

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  when declared(newStatusBarLayer):
    if sStatusBar != nil:
      sStatusBar.destroy()
  batteryLayer.destroy()
  chargingLayer.destroy()

proc initApp() =
  ## Initialize the app
  # Subscribe to battery state changes
  battery.subscribe(batteryStateHandler)

proc deinitApp() =
  ## Deinitialize the app
  battery.unsubscribe()

# Use pebbleApp macro
pebbleApp(
  load = windowLoad,
  unload = windowUnload,
  init = initApp,
  deinit = deinitApp
)

## battery_status - Pebble app demonstrating battery service in Nim
##
## Shows battery level, charging state, and updates using the declarative DSL.

import nebble
import nebble/foundation/events/battery

var
  batteryText: FixedString[32]
  chargingText: FixedString[32]

# Forward declarations
proc batteryStateHandler(state: BatteryChargeState) {.cdecl.}
proc updateBatteryDisplay(state: BatteryChargeState)

# Declarative App
nebbleApp:
  window:
    backgroundColor = GColorBlack

  statusBarLayer:
    id = sStatusBar
    color = GColorWhite
    bgColor = GColorBlack

  textLayer:
    id = batteryLayer
    fullWidth = true
    y = (PBLDisplayHeight.int div 2) - 25
    h = 30
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_24_BOLD
    color = GColorWhite
    bgColor = GColorClear
    
  textLayer:
    id = chargingLayer
    fullWidth = true
    y = (PBLDisplayHeight.int div 2) + 10
    h = 30
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_18
    color = GColorWhite
    bgColor = GColorClear

  init:
    battery.subscribe(batteryStateHandler)
    updateBatteryDisplay(battery.state())

  deinit:
    battery.unsubscribe()

# Implementations
proc batteryStateHandler(state: BatteryChargeState) {.cdecl.} =
  updateBatteryDisplay(state)

proc updateBatteryDisplay(state: BatteryChargeState) =
  batteryText.f("Batt: ", state.charge_percent, "%")
  batteryLayer.text = batteryText
  
  if state.is_charging: 
    chargingText.f("Charging...")
  elif state.is_plugged: 
    chargingText.f("Plugged In")
  else: 
    chargingText.f("On Battery")
  
  chargingLayer.text = chargingText

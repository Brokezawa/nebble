## health_watchface - A digital watchface with health stats in Nim
##
## Demonstrates the Health Service and the Declarative DSL.

import nebble
import nebble/foundation/events/health

# Forward declarations
proc updateTime(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.}

# Module buffers
var
  timeStr: FixedString[16]
  stepsStr: FixedString[32]
  sleepStr: FixedString[32]

# Declarative Watchface
nebbleApp:
  window:
    backgroundColor = GColorBlack

  textLayer:
    id = timeLayer
    fullWidth = true
    frame = (0, 30, 0, 60)
    text = "00:00"
    font = FONT_KEY_BITHAM_42_BOLD
    color = GColorWhite
    bgColor = GColorClear
    alignment = GTextAlignmentCenter
    
  textLayer:
    id = stepsLayer
    fullWidth = true
    frame = (0, 90, 0, 30)
    text = "Steps: ---"
    font = FONT_KEY_GOTHIC_24
    color = GColorWhite
    alignment = GTextAlignmentCenter

  textLayer:
    id = sleepLayer
    fullWidth = true
    frame = (0, 120, 0, 30)
    text = "Sleep: ---"
    font = FONT_KEY_GOTHIC_18
    color = GColorWhite
    alignment = GTextAlignmentCenter

  tickTimer:
    unit = MINUTE_UNIT
    handler = updateTime

proc updateTime(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  let timeFmt = if clockIs24hStyle(): "%H:%M" else: "%I:%M"
  
  # Heap-free formatting
  discard strftime(addr timeStr.data[0], 16, timeFmt, tickTime)
  timeLayer.text = timeStr
  
  # Update health stats
  when declared(health.sumToday):
    let steps = health.sumToday(HealthMetricStepCount)
    stepsStr.f("Steps: ", steps)
    stepsLayer.text = stepsStr
    
    let sleepSeconds = health.sumToday(HealthMetricSleepSeconds)
    let sleepHours = sleepSeconds div 3600
    let sleepMins = (sleepSeconds mod 3600) div 60
    sleepStr.f("Sleep: ", sleepHours, "h ", sleepMins, "m")
    sleepLayer.text = sleepStr

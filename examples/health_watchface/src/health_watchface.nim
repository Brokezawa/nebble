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
    backgroundColor = pblIfColorElse(GColorBlack, GColorWhite)

  textLayer:
    id = timeLayer
    fullWidth = true
    y = pblIfRoundElse(45, PBLDisplayHeight div 2 - 40)
    h = 45
    text = "00:00"
    font = pblIfRoundElse("RESOURCE_ID_BITHAM_34_MEDIUM_NUMBERS", "RESOURCE_ID_BITHAM_42_BOLD")
    color = pblIfColorElse(GColorWhite, GColorBlack)
    bgColor = GColorClear
    alignment = GTextAlignmentCenter
    
  textLayer:
    id = stepsLayer
    fullWidth = true
    y = pblIfRoundElse(95, PBLDisplayHeight div 2 + 5)
    h = 30
    text = "Steps: ---"
    font = FONT_KEY_GOTHIC_24
    color = pblIfColorElse(GColorWhite, GColorBlack)
    alignment = GTextAlignmentCenter

  textLayer:
    id = sleepLayer
    fullWidth = true
    y = pblIfRoundElse(125, PBLDisplayHeight div 2 + 35)
    h = 30
    text = "Sleep: ---"
    font = FONT_KEY_GOTHIC_18
    color = pblIfColorElse(GColorWhite, GColorBlack)
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

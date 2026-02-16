## health_watchface - A digital watchface with health stats in Nim
##
## Demonstrates the Health Service and the Declarative DSL.

import nebble
import nebble/foundation/events/health

# Module buffers
var
  timeStr: FixedString[16]
  stepsStr: FixedString[32]
  sleepStr: FixedString[32]

# Forward declarations
proc updateTime(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.}

# Declarative Watchface
nebbleApp:
  window:
    # Always force Black background for consistent high contrast
    backgroundColor = GColorBlack

  textLayer:
    id = lblTime
    fullWidth = true
    y = pblIfRoundElse(45, PBLDisplayHeight div 2 - 50)
    h = 50
    text = "00:00"
    font = FONT_KEY_LECO_32_BOLD_NUMBERS
    color = GColorWhite
    bgColor = GColorClear
    alignment = GTextAlignmentCenter
    
  textLayer:
    id = lblSteps
    fullWidth = true
    y = pblIfRoundElse(95, PBLDisplayHeight div 2 + 10)
    h = 30
    text = "Steps: ---"
    font = FONT_KEY_GOTHIC_24
    color = GColorWhite
    bgColor = GColorClear
    alignment = GTextAlignmentCenter

  textLayer:
    id = lblSleep
    fullWidth = true
    y = pblIfRoundElse(125, PBLDisplayHeight div 2 + 45)
    h = 30
    text = "Sleep: ---"
    font = FONT_KEY_GOTHIC_18
    color = GColorWhite
    bgColor = GColorClear
    alignment = GTextAlignmentCenter

  tickTimer:
    unit = MINUTE_UNIT
    handler = updateTime

  init:
    # Force an immediate update
    var t: time_t = time(nil)
    updateTime(localtime(addr t), MINUTE_UNIT)

# Implementations
proc updateTime(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  let timeFmt = if clockIs24hStyle(): "%H:%M" else: "%I:%M"
  
  # Heap-free formatting
  discard strftime(addr timeStr.data[0], 16, timeFmt, tickTime)
  lblTime.text = timeStr
  
  # Update health stats
  when declared(health.sumToday):
    let steps = health.sumToday(HealthMetricStepCount)
    stepsStr.f("Steps: ", steps)
    lblSteps.text = stepsStr
    
    let sleepSeconds = health.sumToday(HealthMetricSleepSeconds)
    let sleepHours = sleepSeconds div 3600
    let sleepMins = (sleepSeconds mod 3600) div 60
    sleepStr.f("Sleep: ", sleepHours, "h ", sleepMins, "m")
    lblSleep.text = sleepStr

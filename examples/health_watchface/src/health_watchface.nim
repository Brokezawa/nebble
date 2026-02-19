## health_watchface - A digital watchface with health stats in Nim
##
## Demonstrates the Health Service and the Declarative DSL.

import nebble
import nebble/foundation/events/health
import nebble/util/fixed_strings

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
    backgroundColor = GColorWhite

  textLayer:
    id = timeLayer
    fullWidth = true
    # Use center-relative positioning
    y = pblIfRoundElse(45, PBLDisplayHeight div 2 - 45)
    h = 45
    text = "00:00"
    # Use Leco numbers which are more narrow and fit better than Bitham
    font = FONT_KEY_LECO_32_BOLD_NUMBERS
    color = GColorBlack
    bgColor = GColorClear
    alignment = GTextAlignmentCenter
    
  textLayer:
    id = stepsLayer
    fullWidth = true
    y = pblIfRoundElse(95, PBLDisplayHeight div 2 + 5)
    h = 30
    text = "Steps: ---"
    font = FONT_KEY_GOTHIC_24
    color = GColorBlack
    bgColor = GColorClear
    alignment = GTextAlignmentCenter

  textLayer:
    id = sleepLayer
    fullWidth = true
    y = pblIfRoundElse(125, PBLDisplayHeight div 2 + 35)
    h = 30
    text = "Sleep: ---"
    font = FONT_KEY_GOTHIC_18
    color = GColorBlack
    bgColor = GColorClear
    alignment = GTextAlignmentCenter

  tickTimer:
    unit = MINUTE_UNIT
    handler = updateTime

  init:
    # Force an immediate update using getLocalTime()
    updateTime(getLocalTime(), MINUTE_UNIT)

# Implementations
proc updateTime(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  # Heap-free formatting using high-level API
  discard timeStr.formatTime(tickTime)
  timeLayer.text = timeStr.cstr
  
  # Update health stats
  when declared(health.sumToday):
    let steps = health.sumToday(HealthMetricStepCount)
    stepsStr.f("Steps: ", steps)
    stepsLayer.text = stepsStr.cstr
    
    let sleepSeconds = health.sumToday(HealthMetricSleepSeconds)
    let sleepHours = sleepSeconds div 3600
    let sleepMins = (sleepSeconds mod 3600) div 60
    sleepStr.f("Sleep: ", sleepHours, "h ", sleepMins, "m")
    sleepLayer.text = sleepStr.cstr

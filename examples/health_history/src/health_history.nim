import nebble/ffi
import nebble
import nebble/foundation/events/health
import nebble/foundation/time

## Device example: display today's steps and a small minute-history summary.

var
  stepsLayer: ptr TextLayer
  minutesLayer: ptr TextLayer
  stepsBuffer: array[32, char]
  minutesBuffer: array[128, char]

proc updateDisplay() =
  # Steps (today)
  when declared(health.metricAccessible):
    let now = time.time(nil)
    let start = time.timeStartOfToday()
    let stepsAccess = health.metricAccessible(HealthMetricStepCount, start, now)
    when declared(HealthServiceAccessibilityMaskAvailable):
      if (stepsAccess.uint32 and HealthServiceAccessibilityMaskAvailable.uint32) != 0:
        let steps = health.sumToday(HealthMetricStepCount)
        stepsLayer.staticText(stepsBuffer, "Steps: " & $steps)
      else:
        stepsLayer.text = "Steps: No permission"
    else:
      let steps = health.sumToday(HealthMetricStepCount)
      stepsLayer.staticText(stepsBuffer, "Steps: " & $steps)
  else:
    stepsLayer.text = "Health API not"

  # Minute history (last hour) - caller-provided buffer, no heap allocation
  when declared(health.getMinuteHistory):
    var buf: array[60, HealthMinuteData]
    var t1: time_t = time.time(nil)
    var t0: time_t = t1 - cast[time_t](60*60)
    let got = health.getMinuteHistory(addr buf[0], uint32(buf.len), addr t0, addr t1)
    var s = "Minutes: " & $got & " | "
    let displayCount = if got > 10'u32: 10 else: int(got)
    for i in 0..<displayCount:
      s = s & $(int(buf[i].steps))
      if i < displayCount - 1: s = s & ","
    minutesLayer.staticText(minutesBuffer, s)
  else:
    minutesLayer.text = "Minute history unavailable"

when declared(HealthEventType):
  proc onHealthEvent(event: HealthEventType; context: pointer) {.cdecl.} =
    updateDisplay()

proc windowLoad(win: ptr Window) {.cdecl.} =
  let root = win.rootLayer
  let b = root.bounds

  let title = newTextLayer(makeGRect(0, 6, b.size.w, 30))
  title.text = "Health History"
  title.textAlignment = constants.GTextAlignmentCenter
  title.font = getSystemFont("RESOURCE_ID_GOTHIC_24")
  root.addChild(title.getLayer())

  stepsLayer = newTextLayer(makeGRect(0, 44, b.size.w, 28))
  stepsLayer.textAlignment = constants.GTextAlignmentCenter
  stepsLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_18")
  root.addChild(stepsLayer.getLayer())

  minutesLayer = newTextLayer(makeGRect(0, 76, b.size.w, 40))
  minutesLayer.textAlignment = constants.GTextAlignmentCenter
  minutesLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_14")
  root.addChild(minutesLayer.getLayer())

  updateDisplay()

proc windowUnload(win: ptr Window) {.cdecl.} =
  stepsLayer.destroy()
  minutesLayer.destroy()

proc initApp() =
  when declared(health.eventsSubscribe):
    discard health.eventsSubscribe(onHealthEvent, nil)

proc deinitApp() =
  when declared(health.eventsUnsubscribe):
    discard health.eventsUnsubscribe()

pebbleApp(load = windowLoad, unload = windowUnload, init = initApp, deinit = deinitApp)

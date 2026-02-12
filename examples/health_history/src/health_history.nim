import nebble/ffi
import nebble/foundation/events/health
import nebble/foundation/app
import times

## Minimal example demonstrating Health Service usage without heap allocation.
## Shows: sum(), getMinuteHistory() with caller-provided buffer, availability checks,
## and register/cancel metric alerts. This is intentionally small and runnable
## against the host stubs (tests/pebble_stubs.c).

proc onHealthEvent(event: HealthEventType; context: pointer) {.cdecl.} =
  # For simplicity print a message on host; on device you'd update UI.
  discard context
  when defined(pebbleBasalt) or defined(pebbleEmery) or defined(pebbleFlint):
    # device-specific behavior would go here
    discard
  else:
    echo "Health event: ", $int(event)

proc runDemo() =
  # 1) Availability check for step counts over last 7 days
  var now: time_t = cast[time_t](int(epochTime()))
  let oneDay = cast[time_t](24*60*60)
  let start: time_t = now - cast[time_t](7*oneDay)
  when declared(metricAveragedAccessible):
    let mask = metricAveragedAccessible(HealthMetricStepCount, start, now, HealthServiceTimeScopeDaily)
    if mask == HealthServiceAccessibilityMaskNotAvailable:
      echo "Step data not available for last 7 days"
    else:
      echo "Step data available"

  # 2) Sum the steps over the last 7 days using sum()
  when declared(sum):
    let total = sum(HealthMetricStepCount, start, now)
    echo "Total steps (7d): ", total

  # 3) Get minute history into a caller-provided fixed array (no heap)
  when declared(getMinuteHistory):
    var buffer: array[60, HealthMinuteData]
    var t0: time_t = now - cast[time_t](60*60) # last hour
    var t1: time_t = now
    let got = getMinuteHistory(addr buffer[0], uint32(buffer.len), addr t0, addr t1)
    echo "Minute records retrieved: ", got

  # 4) Register a simple metric alert and cancel it
  when declared(registerMetricAlert) and declared(cancelMetricAlert):
    let alert = registerMetricAlert(HealthMetricStepCount, 1000)
    if alert == nil:
      echo "Failed to register alert"
    else:
      echo "Registered metric alert"
      discard cancelMetricAlert(alert)
      echo "Cancelled metric alert"

  # 5) Subscribe to events (no-op on host stubs but demonstrates API)
  when declared(eventsSubscribe) and declared(eventsUnsubscribe):
    discard eventsSubscribe(onHealthEvent, nil)
    discard eventsUnsubscribe()

when isMainModule:
  runDemo()

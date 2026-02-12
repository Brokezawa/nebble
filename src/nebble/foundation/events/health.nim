## High-level Nim wrapper for Pebble Health Service API.
##
## Provides access to fitness and health metrics including steps, distance,
## active seconds, sleep, and heart rate. Supports both current values and
## historical data aggregation.

import nebble/ffi

# Re-export commonly used FFI types for high-level consumers and callbacks
export ffi.HealthMetric, ffi.HealthValue, ffi.HealthActivity, ffi.HealthEventType,
        ffi.HealthMinuteData, ffi.HealthServiceTimeScope,
        ffi.HealthServiceAccessibilityMask, ffi.HealthActivityMask,
        ffi.HealthIterationDirection, ffi.MeasurementSystem,
        ffi.HealthMetricAlert, ffi.HealthActivityIteratorCB, ffi.HealthEventHandler,
        ffi.HealthAggregation

## Example usage (device or host smoke tests):
##
## 1) Check availability and sum a metric over 7 days:
##    let now = epochTime()
##    let start = now - 7*24*60*60
##    if metricAveragedAccessible(HealthMetricStepCount, start, now, HealthServiceTimeScopeDaily) != 0:
##      let total = sum(HealthMetricStepCount, start, now)
##
## 2) Read minute history into a caller-provided array (no heap allocation):
##    var buf: array[60, HealthMinuteData]
##    let count = getMinuteHistory(addr buf[0], uint32(buf.len), addr start, addr now)
##
## 3) Register + cancel metric alert:
##    let alert = registerMetricAlert(HealthMetricStepCount, 1000)
##    if alert != nil: discard cancelMetricAlert(alert)

# ============================================================================
# Events
# ============================================================================

when declared(ffi.health_service_events_subscribe):
  proc eventsSubscribe*(handler: ffi.HealthEventHandler, context: pointer): bool {.inline.} =
    ## Subscribe to health service events.
    ## Equivalent to C function `health_service_events_subscribe(handler, context)`.
    ffi.health_service_events_subscribe(handler, context)

when declared(ffi.health_service_events_unsubscribe):
  proc eventsUnsubscribe*(): bool {.inline.} =
    ## Unsubscribe from health service events.
    ## Equivalent to C function `health_service_events_unsubscribe()`.
    ffi.health_service_events_unsubscribe()

# ============================================================================
# Current Values
# ============================================================================

when declared(ffi.health_service_peek_current_value):
  proc peekCurrentValue*(metric: HealthMetric): HealthValue {.inline.} =
    ## Get the current value of a health metric.
    ## Returns 0 if the metric is not available or not authorized.
    ## Equivalent to C function `health_service_peek_current_value(metric)`.
    result = ffi.health_service_peek_current_value(metric)

when declared(ffi.health_service_peek_current_activities):
  proc peekCurrentActivities*(): uint32 {.inline.} =
    ## Get the current health activities as a bitmask.
    ## Returns a bitmask of HealthActivity values.
    ## Equivalent to C function `health_service_peek_current_activities()`.
    result = ffi.health_service_peek_current_activities()

# ============================================================================
# Sum Aggregations
# ============================================================================

when declared(ffi.health_service_sum_today):
  proc sumToday*(metric: HealthMetric): HealthValue {.inline.} =
    ## Sum a health metric for today only.
    ## Equivalent to C function `health_service_sum_today(metric)`.
    result = ffi.health_service_sum_today(metric)

when declared(ffi.health_service_sum_averaged):
  proc sumAveraged*(metric: HealthMetric; timeStart: time_t; timeEnd: time_t;
                    scope: HealthServiceTimeScope): HealthValue {.inline.} =
    ## Get the averaged sum of a metric over a time range.
    ## Useful for averages like "average daily steps between two dates".
    ## Equivalent to C function `health_service_sum_averaged(metric, time_start, time_end, scope)`.
    result = ffi.health_service_sum_averaged(metric, timeStart, timeEnd, scope)

when declared(ffi.health_service_sum):
  proc sum*(metric: HealthMetric; timeStart: time_t; timeEnd: time_t): HealthValue {.inline.} =
    ## Sum a health metric over an arbitrary time range.
    ## Equivalent to C function `health_service_sum(metric, time_start, time_end)`.
    result = ffi.health_service_sum(metric, timeStart, timeEnd)

when declared(ffi.health_service_aggregate_averaged):
  proc aggregateAveraged*(metric: HealthMetric; timeStart: time_t; timeEnd: time_t;
                          aggregation: HealthAggregation; scope: HealthServiceTimeScope): HealthValue {.inline.} =
    ## Aggregate averaged values over a range (e.g., daily aggregates over a week).
    ## Equivalent to C function `health_service_aggregate_averaged(metric, time_start, time_end, aggregation, scope)`.
    result = ffi.health_service_aggregate_averaged(metric, timeStart, timeEnd, aggregation, scope)

# ============================================================================
# Historical Data Access
# ============================================================================

when declared(ffi.health_service_get_minute_history):
  proc getMinuteHistory*(minuteData: ptr HealthMinuteData; maxRecords: uint32;
                         timeStart: ptr time_t; timeEnd: ptr time_t): uint32 {.inline.} =
    ## Get per-minute health data history.
    ## Fills minuteData array with steps per minute for the requested time range.
    ## Returns the number of minutes actually retrieved.
    ##
    ## Usage:
    ##   var data: array[60, HealthMinuteData]
    ##   let count = getMinuteHistory(addr data[0], 60, addr startTime, addr endTime)
    ##
    ## Equivalent to C function `health_service_get_minute_history(minute_data, max_records, time_start, time_end)`.
    result = ffi.health_service_get_minute_history(minuteData, maxRecords, timeStart, timeEnd)

# ============================================================================
# Availability Checks
# ============================================================================

when declared(ffi.health_service_metric_accessible):
  proc metricAccessible*(metric: HealthMetric; timeStart: time_t; timeEnd: time_t): ffi.HealthServiceAccessibilityMask {.inline.} =
    ## Check if a health metric is accessible (available and authorized) for a time range.
    ## Returns an accessibility mask indicating availability.
    ## Equivalent to C function `health_service_metric_accessible(metric, time_start, time_end)`.
    result = ffi.health_service_metric_accessible(metric, timeStart, timeEnd)

when declared(ffi.health_service_any_activity_accessible):
  proc anyActivityAccessible*(mask: ffi.HealthActivityMask; timeStart: time_t; timeEnd: time_t): ffi.HealthServiceAccessibilityMask {.inline.} =
    ## Check if any activities in the mask are accessible for a time range.
    ## `mask` is a bitmask of HealthActivity values.
    ## Returns an accessibility mask indicating availability.
    ## Equivalent to C function `health_service_any_activity_accessible(mask, time_start, time_end)`.
    result = ffi.health_service_any_activity_accessible(mask, timeStart, timeEnd)

when declared(ffi.health_service_metric_averaged_accessible):
  proc metricAveragedAccessible*(metric: HealthMetric; timeStart: time_t; timeEnd: time_t;
                                 scope: HealthServiceTimeScope): ffi.HealthServiceAccessibilityMask {.inline.} =
    ## Check if averaged metric data is accessible for a given time range and scope.
    ## Equivalent to C function `health_service_metric_averaged_accessible(metric, time_start, time_end, scope)`.
    result = ffi.health_service_metric_averaged_accessible(metric, timeStart, timeEnd, scope)

when declared(ffi.health_service_metric_aggregate_averaged_accessible):
  proc metricAggregateAveragedAccessible*(metric: HealthMetric; timeStart: time_t; timeEnd: time_t;
                                         aggregation: HealthAggregation; scope: HealthServiceTimeScope): ffi.HealthServiceAccessibilityMask {.inline.} =
    ## Check if aggregated averaged metric data is accessible for a range.
    ## Equivalent to C function `health_service_metric_aggregate_averaged_accessible(...)`.
    result = ffi.health_service_metric_aggregate_averaged_accessible(metric, timeStart, timeEnd, aggregation, scope)

# ============================================================================
# Activity Iteration
# ============================================================================

when declared(ffi.health_service_activities_iterate):
  proc activitiesIterate*(mask: ffi.HealthActivityMask; timeStart: time_t; timeEnd: time_t;
                          direction: ffi.HealthIterationDirection;
                          callback: ffi.HealthActivityIteratorCB; context: pointer) {.inline.} =
    ## Iterate over health activities in a time range.
    ## The callback is called for each activity matching the mask.
    ##
    ## `direction` - Whether to iterate forward or backward in time
    ##
    ## Usage:
    ##   proc onActivity(activity: HealthActivity; start, end: time_t; ctx: pointer) {.cdecl.} =
    ##     # Process activity
    ##   activitiesIterate(HealthActivityWalk.uint32, start, end, HealthIterationDirectionForward, onActivity, nil)
    ##
    ## Equivalent to C function `health_service_activities_iterate(...)`.
    ffi.health_service_activities_iterate(mask, timeStart, timeEnd, direction, callback, context)

# ============================================================================
# Heart Rate Configuration (Basalt+ with HR sensor)
# ============================================================================

when declared(ffi.health_service_set_heart_rate_sample_period):
  proc setHeartRateSamplePeriod*(seconds: uint16): bool {.inline.} =
    ## Set how frequently to sample heart rate (in seconds).
    ## Shorter periods provide more data but use more battery.
    ## Returns true on success.
    ## Equivalent to C function `health_service_set_heart_rate_sample_period(seconds)`.
    result = ffi.health_service_set_heart_rate_sample_period(seconds)

when declared(ffi.health_service_get_heart_rate_sample_period_expiration_sec):
  proc getHeartRateSamplePeriodExpirationSec*(): uint32 {.inline.} =
    ## Get the number of seconds until the heart rate sample period expires.
    ## Equivalent to C function `health_service_get_heart_rate_sample_period_expiration_sec()`.
    result = ffi.health_service_get_heart_rate_sample_period_expiration_sec()

when declared(ffi.health_service_register_metric_alert):
  proc registerMetricAlert*(metric: HealthMetric; threshold: HealthValue): ptr HealthMetricAlert {.inline.} =
    ## Register a metric alert for the given metric and threshold.
    ## Returns a pointer to HealthMetricAlert which can be cancelled with cancelMetricAlert.
    ## Equivalent to C function `health_service_register_metric_alert(metric, threshold)`.
    result = ffi.health_service_register_metric_alert(metric, threshold)

when declared(ffi.health_service_cancel_metric_alert):
  proc cancelMetricAlert*(alert: ptr HealthMetricAlert): bool {.inline.} =
    ## Cancel and free a previously registered metric alert.
    ## Equivalent to C function `health_service_cancel_metric_alert(alert)`.
    if alert == nil:
      return false
    result = ffi.health_service_cancel_metric_alert(alert)

# ============================================================================
# Measurement System
# ============================================================================

when declared(ffi.health_service_get_measurement_system_for_display):
  proc getMeasurementSystemForDisplay*(metric: HealthMetric): MeasurementSystem {.inline.} =
    ## Get the measurement system for displaying a specific health metric (metric/imperial).
    ## Returns the measurement system (e.g., for steps, distance, weight).
    ## Equivalent to C function `health_service_get_measurement_system_for_display(metric)`.
    result = ffi.health_service_get_measurement_system_for_display(metric)

# ============================================================================
# Nim-idiomatic Helpers
# ============================================================================

proc currentSteps*(): HealthValue {.inline.} =
  ## Convenience: Get current step count.
  ## Returns 0 if not available.
  when declared(ffi.health_service_peek_current_value):
    result = peekCurrentValue(HealthMetricStepCount)
  else:
    result = 0

proc currentHeartRate*(): HealthValue {.inline.} =
  ## Convenience: Get current heart rate in BPM.
  ## Returns 0 if not available or heart rate sensor not present.
  when declared(ffi.health_service_peek_current_value):
    result = peekCurrentValue(HealthMetricHeartRateBPM)
  else:
    result = 0

proc todaysSteps*(): HealthValue {.inline.} =
  ## Convenience: Get today's total step count.
  ## Returns 0 if not available.
  when declared(ffi.health_service_sum_today):
    result = sumToday(HealthMetricStepCount)
  else:
    result = 0

proc isWalking*(): bool {.inline.} =
  ## Convenience: Check if the user is currently walking.
  ## Returns false if activity data not available.
  when declared(ffi.health_service_peek_current_activities):
    result = (peekCurrentActivities() and HealthActivityWalk.uint32) != 0
  else:
    result = false

proc isRunning*(): bool {.inline.} =
  ## Convenience: Check if the user is currently running.
  ## Returns false if activity data not available.
  when declared(ffi.health_service_peek_current_activities):
    result = (peekCurrentActivities() and HealthActivityRun.uint32) != 0
  else:
    result = false

proc isSleeping*(): bool {.inline.} =
  ## Convenience: Check if the user is currently sleeping.
  ## Returns false if activity data not available.
  when declared(ffi.health_service_peek_current_activities):
    result = (peekCurrentActivities() and HealthActivitySleep.uint32) != 0
  else:
    result = false

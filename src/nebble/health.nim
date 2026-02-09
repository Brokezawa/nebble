## High-level Nim wrapper for Pebble Health Service API.
##
## Provides access to health and activity data (steps, sleep, heart rate).

import nebble/ffi

export ffi.HealthMetric, ffi.HealthValue, ffi.HealthServiceTimeScope
export ffi.HealthAggregation, ffi.HealthActivityMask, ffi.HealthActivityIteratorCB
export ffi.HealthServiceAccessibilityMask, ffi.time_t

# ============================================================================
# Health Metrics
# ============================================================================

when declared(ffi.health_service_sum):
  proc sum*(metric: HealthMetric, timeStart: time_t,
            timeEnd: time_t): HealthValue {.inline.} =
    ## Get the sum of a health metric over a time range.
    ## Equivalent to C function `health_service_sum(metric, time_start, time_end)`.
    ## NOTE: Not available on Aplite.
    ffi.health_service_sum(metric, timeStart, timeEnd)

  proc sumToday*(metric: HealthMetric): HealthValue {.inline.} =
    ## Get the sum of a health metric for today.
    ## Equivalent to C function `health_service_sum_today(metric)`.
    ffi.health_service_sum_today(metric)

  proc peekCurrentValue*(metric: HealthMetric): HealthValue {.inline.} =
    ## Get the current value of a health metric.
    ## Equivalent to C function `health_service_peek_current_value(metric)`.
    ffi.health_service_peek_current_value(metric)

# ============================================================================
# Averaged Metrics
# ============================================================================

when declared(ffi.health_service_sum_averaged):
  proc sumAveraged*(metric: HealthMetric, timeStart: time_t,
                    timeEnd: time_t, scope: HealthServiceTimeScope): HealthValue {.inline.} =
    ## Get the averaged sum of a health metric.
    ## Equivalent to C function `health_service_sum_averaged(metric, time_start, time_end, scope)`.
    ffi.health_service_sum_averaged(metric, timeStart, timeEnd, scope)

when declared(ffi.health_service_aggregate_averaged):
  proc aggregateAveraged*(metric: HealthMetric, timeStart: time_t,
                          timeEnd: time_t, aggregate: HealthAggregation,
                          scope: HealthServiceTimeScope): HealthValue {.inline.} =
    ## Get the aggregated averaged value of a health metric.
    ## Equivalent to C function `health_service_aggregate_averaged(metric, time_start, time_end, aggregation, scope)`.
    ffi.health_service_aggregate_averaged(metric, timeStart, timeEnd, aggregate, scope)

# ============================================================================
# Activities
# ============================================================================

when declared(ffi.health_service_peek_current_activities):
  proc peekCurrentActivities*(): HealthActivityMask {.inline.} =
    ## Get the current activity mask (walking, running, etc.).
    ## Equivalent to C function `health_service_peek_current_activities()`.
    ffi.health_service_peek_current_activities()

when declared(ffi.health_service_activities_iterate):
  proc activitiesIterate*(activityMask: HealthActivityMask,
                          callback: HealthActivityIteratorCB,
                          context: pointer): bool {.inline.} =
    ## Iterate over activities in the activity mask.
    ## Equivalent to C function `health_service_activities_iterate(activity_mask, callback, context)`.
    ffi.health_service_activities_iterate(activityMask, callback, context)

# ============================================================================
# Metric Accessibility
# ============================================================================

when declared(ffi.health_service_metric_accessible):
  proc metricAccessible*(metric: HealthMetric,
                         timeStart: time_t, timeEnd: time_t): HealthServiceAccessibilityMask {.inline.} =
    ## Check if a health metric is accessible for a time range.
    ## Equivalent to C function `health_service_metric_accessible(metric, time_start, time_end)`.
    ffi.health_service_metric_accessible(metric, timeStart, timeEnd)

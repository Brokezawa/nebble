import nebble/foundation/events/health
import times

when isMainModule:
  # Run a small runtime smoke check exercising stubs
  when declared(ffi.health_service_sum):
    let s = sum(HealthMetricStepCount, epochTime()-86400, epochTime())
    echo "sum returned: ", s

  when declared(ffi.health_service_register_metric_alert) and declared(ffi.health_service_cancel_metric_alert):
    let a = registerMetricAlert(HealthMetricStepCount, 10)
    if a == nil:
      echo "registerMetricAlert returned nil"
    else:
      echo "registerMetricAlert succeeded"
      discard cancelMetricAlert(a)
      echo "cancelMetricAlert succeeded"

when declared(ffi.health_service_sum):
  echo "health_service_sum available"

when declared(ffi.health_service_aggregate_averaged):
  echo "health_service_aggregate_averaged available"

when declared(ffi.health_service_metric_averaged_accessible):
  echo "health_service_metric_averaged_accessible available"

when declared(ffi.health_service_metric_aggregate_averaged_accessible):
  echo "health_service_metric_aggregate_averaged_accessible available"

when declared(ffi.health_service_register_metric_alert):
  echo "health_service_register_metric_alert available"

when declared(ffi.health_service_cancel_metric_alert):
  echo "health_service_cancel_metric_alert available"

when declared(ffi.health_service_get_minute_history):
  echo "health_service_get_minute_history available"

when declared(ffi.health_service_get_measurement_system_for_display):
  echo "health_service_get_measurement_system_for_display available"

import nebble/ffi
import nebble/foundation/events/health

when isMainModule:
  when declared(registerMetricAlert) and declared(cancelMetricAlert):
    let alert = registerMetricAlert(HealthMetricStepCount, 10)
    # Stubs should return a non-nil fake alert pointer
    assert alert != nil, "registerMetricAlert returned nil"
    let ok = cancelMetricAlert(alert)
    assert ok, "cancelMetricAlert failed"
    # cancelling nil should return false
    assert not cancelMetricAlert(nil), "cancelMetricAlert(nil) should be false"
    echo "OK"
  else:
    echo "Health alert APIs not available; skipping"

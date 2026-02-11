## health_demo - Pebble app demonstrating health service in Nim
##
## Shows step count and other health metrics (not available on Aplite).
## Note: Health data requires user authorization and may not be available in emulator.

import nebble
import nebble/foundation/events/health
import nebble/foundation/time
import nebble/ffi # For HealthMetricStepCount and other enum values

var
  stepsLayer: ptr TextLayer
  distanceLayer: ptr TextLayer
  stepsBuffer: array[32, char]
  distanceBuffer: array[32, char]

proc updateHealthDisplay() =
  ## Update the health display with current metrics
  when declared(health.sumToday) and declared(HealthMetricStepCount):
    # Check if health is available (requires user permission)
    when declared(health.metricAccessible):
      let now = time.time(nil)
      let start = time.timeStartOfToday()
      let stepsAccess = health.metricAccessible(HealthMetricStepCount, start, now)
      let distAccess = health.metricAccessible(HealthMetricWalkedDistanceMeters, start, now)

      # Debug: log raw accessibility masks so we can inspect permission state
      when declared(APP_LOG) and declared(APP_LOG_LEVEL_INFO):
        APP_LOG(APP_LOG_LEVEL_INFO.uint8, cstring"health: stepsMask=%u distMask=%u",
                stepsAccess.uint32, distAccess.uint32)
      when declared(HealthServiceAccessibilityMaskAvailable) and declared(APP_LOG):
        APP_LOG(APP_LOG_LEVEL_INFO.uint8, cstring"health: AvailableMask=%u",
                HealthServiceAccessibilityMaskAvailable.uint32)
      
      # metricAccessible returns a mask, check if Available bit is set
      when declared(HealthServiceAccessibilityMaskAvailable):
        if (stepsAccess.uint32 and HealthServiceAccessibilityMaskAvailable.uint32) != 0:
          when declared(APP_LOG):
            APP_LOG(APP_LOG_LEVEL_INFO.uint8, cstring"health: steps access AVAILABLE")
          # Get today's step count
          let steps = health.sumToday(HealthMetricStepCount)
          let stepsText = "Steps: " & $steps
          stepsLayer.staticText(stepsBuffer, stepsText)
        else:
          when declared(APP_LOG):
            APP_LOG(APP_LOG_LEVEL_INFO.uint8, cstring"health: steps access NOT available")
          stepsLayer.text = "Steps: No permission"
        
        if (distAccess.uint32 and HealthServiceAccessibilityMaskAvailable.uint32) != 0:
          when declared(APP_LOG):
            APP_LOG(APP_LOG_LEVEL_INFO.uint8, cstring"health: distance access AVAILABLE")
          # Get today's distance (in meters)
          let distance = health.sumToday(HealthMetricWalkedDistanceMeters)
          let distanceKm = distance div 1000  # Integer division for km
          let distText = "Distance: " & $distanceKm & " km"
          distanceLayer.staticText(distanceBuffer, distText)
        else:
          when declared(APP_LOG):
            APP_LOG(APP_LOG_LEVEL_INFO.uint8, cstring"health: distance access NOT available")
          distanceLayer.text = "Distance: No permission"
      else:
        # Fallback if HealthServiceAccessibilityMaskAvailable not declared
        let steps = health.sumToday(HealthMetricStepCount)
        stepsLayer.staticText(stepsBuffer, "Steps: " & $steps)
        
        let distance = health.sumToday(HealthMetricWalkedDistanceMeters)
        let distanceKm = distance div 1000
        distanceLayer.staticText(distanceBuffer, "Distance: " & $distanceKm & " km")
    else:
      # Fallback for older SDK without metric_accessible
      let steps = health.sumToday(HealthMetricStepCount)
      stepsLayer.staticText(stepsBuffer, "Steps: " & $steps)
      
      let distance = health.sumToday(HealthMetricWalkedDistanceMeters)
      let distanceKm = distance div 1000
      distanceLayer.staticText(distanceBuffer, "Distance: " & $distanceKm & " km")
  else:
    stepsLayer.text = "Health API not"
    distanceLayer.text = "available (Aplite)"

when declared(HealthEventType):
  proc healthEventHandler(event: HealthEventType; context: pointer) {.cdecl.} =
    ## Called when health data changes
    updateHealthDisplay()

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create title layer
  let titleLayer = newTextLayer(makeGRect(0, 30, bounds.size.w, 30))
  titleLayer.text = "Health Demo"
  titleLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  titleLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_24_BOLD")
  when declared(GColorClear):
    titleLayer.backgroundColor = GColorClear
  rootLayer.addChild(titleLayer.getLayer())
  
  # Create steps layer
  stepsLayer = newTextLayer(makeGRect(0, 70, bounds.size.w, 30))
  stepsLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  stepsLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_24")
  when declared(GColorClear):
    stepsLayer.backgroundColor = GColorClear
  rootLayer.addChild(stepsLayer.getLayer())
  
  # Create distance layer
  distanceLayer = newTextLayer(makeGRect(0, 105, bounds.size.w, 30))
  distanceLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  distanceLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_18")
  when declared(GColorClear):
    distanceLayer.backgroundColor = GColorClear
  rootLayer.addChild(distanceLayer.getLayer())
  
  # Update display with initial values
  updateHealthDisplay()

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  stepsLayer.destroy()
  distanceLayer.destroy()

proc initApp() =
  ## Initialize the app
  # Subscribe to health events (if available)
  when declared(health.eventsSubscribe) and declared(HealthEventType):
    discard health.eventsSubscribe(healthEventHandler, nil)

proc deinitApp() =
  ## Deinitialize the app
  when declared(health.eventsUnsubscribe):
    discard health.eventsUnsubscribe()

pebbleApp(
  load = windowLoad,
  unload = windowUnload,
  init = initApp,
  deinit = deinitApp
)

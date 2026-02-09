## health_demo - Pebble app demonstrating health service in Nim
##
## Shows step count and other health metrics (not available on Aplite).
## Note: Health data requires user authorization and may not be available in emulator.

import nebble/ffi
from nebble/app import eventLoop

var
  window: ptr Window
  stepsLayer: ptr TextLayer
  distanceLayer: ptr TextLayer
  stepsBuffer: array[32, char]
  distanceBuffer: array[32, char]

proc updateHealthDisplay() =
  ## Update the health display with current metrics
  when declared(health_service_sum_today) and declared(HealthMetricStepCount):
    # Check if health is available (requires user permission)
    when declared(health_service_metric_accessible):
      let stepsAccess = health_service_metric_accessible(HealthMetricStepCount, 0, 0)
      let distAccess = health_service_metric_accessible(HealthMetricWalkedDistanceMeters, 0, 0)
      
      # health_service_metric_accessible returns a mask, check if Available bit is set
      when declared(HealthServiceAccessibilityMaskAvailable):
        if (stepsAccess.uint32 and HealthServiceAccessibilityMaskAvailable.uint32) != 0:
          # Get today's step count
          let steps = health_service_sum_today(HealthMetricStepCount)
          let stepsText = "Steps: " & $steps
          for i in 0..<min(stepsText.len, 31):
            stepsBuffer[i] = stepsText[i]
          stepsBuffer[min(stepsText.len, 31)] = '\0'
          text_layer_set_text(stepsLayer, cast[cstring](addr stepsBuffer[0]))
        else:
          text_layer_set_text(stepsLayer, "Steps: No permission")
        
        if (distAccess.uint32 and HealthServiceAccessibilityMaskAvailable.uint32) != 0:
          # Get today's distance (in meters)
          let distance = health_service_sum_today(HealthMetricWalkedDistanceMeters)
          let distanceKm = distance div 1000  # Integer division for km
          let distText = "Distance: " & $distanceKm & " km"
          for i in 0..<min(distText.len, 31):
            distanceBuffer[i] = distText[i]
          distanceBuffer[min(distText.len, 31)] = '\0'
          text_layer_set_text(distanceLayer, cast[cstring](addr distanceBuffer[0]))
        else:
          text_layer_set_text(distanceLayer, "Distance: No permission")
      else:
        # Fallback if HealthServiceAccessibilityMaskAvailable not declared
        let steps = health_service_sum_today(HealthMetricStepCount)
        let stepsText = "Steps: " & $steps
        for i in 0..<min(stepsText.len, 31):
          stepsBuffer[i] = stepsText[i]
        stepsBuffer[min(stepsText.len, 31)] = '\0'
        text_layer_set_text(stepsLayer, cast[cstring](addr stepsBuffer[0]))
        
        let distance = health_service_sum_today(HealthMetricWalkedDistanceMeters)
        let distanceKm = distance div 1000
        let distText = "Distance: " & $distanceKm & " km"
        for i in 0..<min(distText.len, 31):
          distanceBuffer[i] = distText[i]
        distanceBuffer[min(distText.len, 31)] = '\0'
        text_layer_set_text(distanceLayer, cast[cstring](addr distanceBuffer[0]))
    else:
      # Fallback for older SDK without metric_accessible
      let steps = health_service_sum_today(HealthMetricStepCount)
      let stepsText = "Steps: " & $steps
      for i in 0..<min(stepsText.len, 31):
        stepsBuffer[i] = stepsText[i]
      stepsBuffer[min(stepsText.len, 31)] = '\0'
      text_layer_set_text(stepsLayer, cast[cstring](addr stepsBuffer[0]))
      
      let distance = health_service_sum_today(HealthMetricWalkedDistanceMeters)
      let distanceKm = distance div 1000
      let distText = "Distance: " & $distanceKm & " km"
      for i in 0..<min(distText.len, 31):
        distanceBuffer[i] = distText[i]
      distanceBuffer[min(distText.len, 31)] = '\0'
      text_layer_set_text(distanceLayer, cast[cstring](addr distanceBuffer[0]))
  else:
    text_layer_set_text(stepsLayer, "Health API not")
    text_layer_set_text(distanceLayer, "available (Aplite)")

when declared(HealthEventType):
  proc healthEventHandler(event: HealthEventType; context: pointer) {.cdecl.} =
    ## Called when health data changes
    updateHealthDisplay()

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = window_get_root_layer(win)
  let bounds = layer_get_bounds(rootLayer)
  
  # Create title layer
  let titleLayer = text_layer_create(makeGRect(0, 30, bounds.size.w, 30))
  text_layer_set_text(titleLayer, "Health Demo")
  text_layer_set_text_alignment(titleLayer, GTextAlignmentCenter)
  text_layer_set_font(titleLayer, fonts_get_system_font(FONT_KEY_GOTHIC_24_BOLD))
  when declared(GColorClear):
    text_layer_set_background_color(titleLayer, GColorClear)
  layer_add_child(rootLayer, text_layer_get_layer(titleLayer))
  
  # Create steps layer
  stepsLayer = text_layer_create(makeGRect(0, 70, bounds.size.w, 30))
  text_layer_set_text_alignment(stepsLayer, GTextAlignmentCenter)
  text_layer_set_font(stepsLayer, fonts_get_system_font(FONT_KEY_GOTHIC_24))
  when declared(GColorClear):
    text_layer_set_background_color(stepsLayer, GColorClear)
  layer_add_child(rootLayer, text_layer_get_layer(stepsLayer))
  
  # Create distance layer
  distanceLayer = text_layer_create(makeGRect(0, 105, bounds.size.w, 30))
  text_layer_set_text_alignment(distanceLayer, GTextAlignmentCenter)
  text_layer_set_font(distanceLayer, fonts_get_system_font(FONT_KEY_GOTHIC_18))
  when declared(GColorClear):
    text_layer_set_background_color(distanceLayer, GColorClear)
  layer_add_child(rootLayer, text_layer_get_layer(distanceLayer))
  
  # Update display with initial values
  updateHealthDisplay()

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  text_layer_destroy(stepsLayer)
  text_layer_destroy(distanceLayer)

proc init() {.cdecl.} =
  ## Initialize the app
  window = window_create()
  window_set_window_handlers(window, WindowHandlers(
    load: windowLoad,
    unload: windowUnload
  ))
  
  # Subscribe to health events (if available)
  when declared(health_service_events_subscribe) and declared(HealthEventType):
    discard health_service_events_subscribe(healthEventHandler, nil)
  
  window_stack_push(window, true)

proc deinit() {.cdecl.} =
  ## Deinitialize the app
  when declared(health_service_events_unsubscribe):
    discard health_service_events_unsubscribe()
  window_destroy(window)

proc main() {.exportc, cdecl.} =
  ## App entry point
  init()
  eventLoop()
  deinit()

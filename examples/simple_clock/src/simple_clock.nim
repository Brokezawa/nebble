## simple_clock - Pebble watchface written in Nim
##
## This is a basic watchface that demonstrates the Nebble API.

import nebble

var
  window: ptr Window
  timeLayer: ptr TextLayer
  dateLayer: ptr TextLayer
  timeBuffer: array[16, char]  # Must be module-scope to persist
  dateBuffer: array[32, char]  # Must be module-scope to persist

proc updateTime() =
  ## Update the time display
  
  var tickTime: time_t
  discard time(addr tickTime)
  
  var localTime = localtime(addr tickTime)
  
  # Update time
  if clock_is_24h_style():
    discard strftime(addr timeBuffer[0], 16, "%H:%M", localTime)
  else:
    discard strftime(addr timeBuffer[0], 16, "%I:%M", localTime)
  
  # Using HIGH-LEVEL wrapper
  timeLayer.text = cast[cstring](addr timeBuffer[0])
  
  # Update date
  discard strftime(addr dateBuffer[0], 32, "%a, %b %e", localTime)
  # Using HIGH-LEVEL wrapper
  dateLayer.text = cast[cstring](addr dateBuffer[0])

proc tickHandler(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  ## Handle tick timer events
  updateTime()

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI elements only
  
  # Using HIGH-LEVEL wrappers
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create time layer (large) - HIGH-LEVEL wrapper
  timeLayer = newTextLayer(makeGRect(0, 50, bounds.size.w, 60))
  timeLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  timeLayer.font = getSystemFont("RESOURCE_ID_BITHAM_42_BOLD")
  
  # Create date layer (small) - HIGH-LEVEL wrapper
  dateLayer = newTextLayer(makeGRect(0, 115, bounds.size.w, 30))
  dateLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  dateLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_24")
  
  # Add to window - HIGH-LEVEL wrapper
  rootLayer.addChild(timeLayer.getLayer())
  rootLayer.addChild(dateLayer.getLayer())

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  # Using HIGH-LEVEL wrapper
  timeLayer.destroy()
  dateLayer.destroy()

proc init() =
  ## Initialize the watchface
  
  # Using HIGH-LEVEL wrappers
  window = newWindow()
  window.setHandlers(
    load = windowLoad,
    unload = windowUnload
  )
  
  window.push(animated = true)
  
  # Subscribe to tick timer (update every minute) - HIGH-LEVEL wrapper
  subscribe(TimeUnits.MINUTE_UNIT, tickHandler)
  
  # Initial time update (after window is loaded and timer is subscribed)
  updateTime()

proc deinit() =
  ## Deinitialize the watchface
  # Using HIGH-LEVEL wrapper
  window.destroy()

proc main(): cint {.exportc, cdecl.} =
  ## Watchface entry point
  init()
  eventLoop()
  deinit()
  return 0

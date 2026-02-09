## simple_clock - Pebble watchface written in Nim
##
## This is a basic watchface that demonstrates the Nebble API.

import nebble
import nebble/time
import nebble/ffi # For TimeUnits

var
  timeLayer: ptr TextLayer
  dateLayer: ptr TextLayer
  timeBuffer: array[16, char]  # Must be module-scope to persist
  dateBuffer: array[32, char]  # Must be module-scope to persist

proc updateTime() =
  ## Update the time display
  
  var tickTime: time_t
  discard time.time(addr tickTime)
  
  var localTime = time.localtime(addr tickTime)
  
  # Update time
  if time.clockIs24hStyle():
    discard time.strftime(addr timeBuffer[0], 16, "%H:%M", localTime)
  else:
    discard time.strftime(addr timeBuffer[0], 16, "%I:%M", localTime)
  
  timeLayer.text = cast[cstring](addr timeBuffer[0])
  
  # Update date
  discard time.strftime(addr dateBuffer[0], 32, "%a, %b %e", localTime)
  dateLayer.text = cast[cstring](addr dateBuffer[0])

proc tickHandler(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  ## Handle tick timer events
  updateTime()

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI elements only
  
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create time layer (large)
  timeLayer = newTextLayer(makeGRect(0, 50, bounds.size.w, 60))
  timeLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  timeLayer.font = getSystemFont("RESOURCE_ID_BITHAM_42_BOLD")
  
  # Create date layer (small)
  dateLayer = newTextLayer(makeGRect(0, 115, bounds.size.w, 30))
  dateLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  dateLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_24")
  
  # Add to window
  rootLayer.addChild(timeLayer.getLayer())
  rootLayer.addChild(dateLayer.getLayer())
  
  # Initial time update
  updateTime()

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  timeLayer.destroy()
  dateLayer.destroy()

proc initApp() =
  ## Initialize the watchface
  # Subscribe to tick timer (update every minute)
  subscribe(TimeUnits.MINUTE_UNIT, tickHandler)

pebbleApp(
  load = windowLoad,
  unload = windowUnload,
  init = initApp
)

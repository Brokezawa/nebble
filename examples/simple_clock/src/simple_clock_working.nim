## simple_clock - Pebble watchface written in Nim
##
## This is a basic watchface that demonstrates the Nebble API.
## DEBUG: Testing high-level wrappers with correct init order.

import nebble
import nebble/ffi

const LOG_DBG = uint8(APP_LOG_LEVEL_DEBUG)
const LOG_ERR = uint8(APP_LOG_LEVEL_ERROR)

var
  window: ptr Window
  timeLayer: ptr TextLayer
  dateLayer: ptr TextLayer
  timeBuffer: array[16, char]  # Must be module-scope to persist
  dateBuffer: array[32, char]  # Must be module-scope to persist

proc updateTime() =
  ## Update the time display
  app_log(LOG_DBG, cstring"clock", cint(1), cstring"updateTime: start")
  
  var tickTime: time_t
  discard time(addr tickTime)
  
  var localTime = localtime(addr tickTime)
  
  app_log(LOG_DBG, cstring"clock", cint(7), cstring"updateTime: localtime OK")
  
  # Update time
  if clock_is_24h_style():
    discard strftime(addr timeBuffer[0], 16, "%H:%M", localTime)
  else:
    discard strftime(addr timeBuffer[0], 16, "%I:%M", localTime)
  
  # Using HIGH-LEVEL wrapper
  timeLayer.text = cast[cstring](addr timeBuffer[0])
  
  app_log(LOG_DBG, cstring"clock", cint(9), cstring"updateTime: set time text done")
  
  # Update date
  discard strftime(addr dateBuffer[0], 32, "%a, %b %e", localTime)
  # Using HIGH-LEVEL wrapper
  dateLayer.text = cast[cstring](addr dateBuffer[0])
  
  app_log(LOG_DBG, cstring"clock", cint(10), cstring"updateTime: complete")

proc tickHandler(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  ## Handle tick timer events
  updateTime()

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI elements only
  app_log(LOG_DBG, cstring"clock", cint(12), cstring"windowLoad: start")
  
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
  
  app_log(LOG_DBG, cstring"clock", cint(22), cstring"windowLoad: complete")

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  # Using HIGH-LEVEL wrapper
  timeLayer.destroy()
  dateLayer.destroy()

proc init() =
  ## Initialize the watchface
  app_log(LOG_DBG, cstring"clock", cint(40), cstring"init: start")
  
  # Using HIGH-LEVEL wrappers
  window = newWindow()
  window.setHandlers(
    load = windowLoad,
    unload = windowUnload
  )
  app_log(LOG_DBG, cstring"clock", cint(43), cstring"init: handlers set")
  
  window.push(animated = true)
  app_log(LOG_DBG, cstring"clock", cint(44), cstring"init: window pushed")
  
  # Subscribe to tick timer (update every minute)
  ffi.tick_timer_service_subscribe(TimeUnits.MINUTE_UNIT, tickHandler)
  app_log(LOG_DBG, cstring"clock", cint(45), cstring"init: tick subscribed")
  
  # Initial time update (after window is loaded and timer is subscribed)
  updateTime()
  app_log(LOG_DBG, cstring"clock", cint(46), cstring"init: complete")

proc deinit() =
  ## Deinitialize the watchface
  # Using HIGH-LEVEL wrapper
  window.destroy()

proc main(): cint {.exportc, cdecl.} =
  ## Watchface entry point
  app_log(LOG_DBG, cstring"clock", cint(60), cstring"main: start")
  init()
  app_log(LOG_DBG, cstring"clock", cint(61), cstring"main: calling eventLoop")
  eventLoop()
  deinit()
  return 0

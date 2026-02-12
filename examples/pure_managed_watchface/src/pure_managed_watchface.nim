## Pure Managed Watchface Example
##
## A clean demonstration of managed types without any FFI imports.
## Shows TextLayerHandle with automatic memory management.

import nebble
import nebble/ui/text_layer_managed
import nebble/foundation/time
import nebble/foundation/events/tick

# Module-level handles
var 
  timeLayer: TextLayerHandle
  dateLayer: TextLayerHandle
  statusLayer: TextLayerHandle

# Buffers for dynamic text
var timeBuffer: array[16, char]
var dateBuffer: array[32, char]

proc updateTime(tm: ptr tm, units: TimeUnits) {.cdecl.} =
  ## Update the time display every minute
  
  # Format time as "HH:MM"
  # Use fully qualified call to avoid ambiguity between ffi.strftime and time.strftime
  discard time.strftime(cast[cstring](addr timeBuffer[0]), 16.csize_t, "%H:%M".cstring, tm)
  timeLayer.text = cast[cstring](addr timeBuffer[0])
  
  # Format date
  discard time.strftime(cast[cstring](addr dateBuffer[0]), 32.csize_t, "%a %d %b".cstring, tm)
  dateLayer.text = cast[cstring](addr dateBuffer[0])

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Create managed resources - NO manual destroy() calls needed!
  
  let bounds = win.rootLayer.bounds
  
  # Create time layer (large, centered)
  timeLayer = newTextLayerHandle(
    makeGRect(0, 52, bounds.size.w, 48),
    "--:--".cstring,
    getSystemFont(FONT_KEY_BITHAM_42_BOLD.cstring),
    constants.GTextAlignmentCenter
  )
  timeLayer.textColor = GColorWhite
  win.rootLayer.addChild(timeLayer.getLayer())
  
  # Create date layer
  dateLayer = newTextLayerHandle(
    makeGRect(0, 100, bounds.size.w, 24),
    "Loading...".cstring,
    getSystemFont(FONT_KEY_GOTHIC_24.cstring),
    constants.GTextAlignmentCenter
  )
  dateLayer.textColor = GColorWhite
  win.rootLayer.addChild(dateLayer.getLayer())
  
  # Create status layer
  statusLayer = newTextLayerHandle(
    makeGRect(0, bounds.size.h - 20, bounds.size.w, 20),
    "Pure Managed Demo".cstring,
    getSystemFont(FONT_KEY_GOTHIC_14.cstring),
    constants.GTextAlignmentCenter
  )
  statusLayer.textColor = GColorWhite
  win.rootLayer.addChild(statusLayer.getLayer())
  
  # Subscribe to tick timer
  tick.subscribe(constants.MINUTE_UNIT, updateTime)
  
  # Update immediately
  var now = time()
  let tmNow = time.localtime(addr now)
  updateTime(tmNow, constants.MINUTE_UNIT)

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Resources automatically destroyed when handles are reassigned.
  ## No manual cleanup needed - ARC handles it!
  
  tick.unsubscribe()
  
  # These trigger automatic destruction via =destroy hook
  timeLayer = TextLayerHandle(nil)
  dateLayer = TextLayerHandle(nil)
  statusLayer = TextLayerHandle(nil)

pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

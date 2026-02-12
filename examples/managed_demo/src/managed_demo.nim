## Managed Types Demo
##
## Demonstrates automatic memory management with ARC handles.
## Shows how managed types automatically clean up resources.
##
## This example creates multiple layers and shows that they are
## automatically destroyed when the handle goes out of scope.

import nebble
import nebble/ffi  # For ffi.strftime to avoid ambiguity
import nebble/ui/text_layer_managed
import nebble/foundation/events/tick
import nebble/foundation/time

# Module-level handles (persist across window lifecycle)
var 
  timeLayer: TextLayerHandle
  dateLayer: TextLayerHandle
  statusLayer: TextLayerHandle

# Buffer for dynamic time text
var timeBuffer: array[16, char]

proc updateTime(tm: ptr tm, units: TimeUnits) {.cdecl.} =
  ## Update the time display every minute
  
  # Format time as "HH:MM"
  discard ffi.strftime(cast[cstring](addr timeBuffer[0]), 16, "%H:%M", tm)
  timeLayer.text = cast[cstring](addr timeBuffer[0])
  
  # Format date using a different buffer
  var dateBuffer: array[32, char]
  discard ffi.strftime(cast[cstring](addr dateBuffer[0]), 32, "%a %d %b", tm)
  dateLayer.text = cast[cstring](addr dateBuffer[0])

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Create managed resources
  
  # Get window bounds
  let bounds = win.rootLayer.bounds
  
  # Create time layer (large, centered)
  timeLayer = newTextLayerHandle(
    makeGRect(0, 52, bounds.size.w, 48),
    "--:--".cstring,
    fonts_get_system_font(FONT_KEY_BITHAM_42_BOLD.cstring),
    constants.GTextAlignmentCenter
  )
  timeLayer.textColor = GColorWhite
  win.rootLayer.addChild(timeLayer.getLayer())
  
  # Create date layer (smaller, below time)
  dateLayer = newTextLayerHandle(
    makeGRect(0, 100, bounds.size.w, 24),
    "Loading...".cstring,
    fonts_get_system_font(FONT_KEY_GOTHIC_24.cstring),
    constants.GTextAlignmentCenter
  )
  dateLayer.textColor = GColorWhite
  win.rootLayer.addChild(dateLayer.getLayer())
  
  # Create status layer (bottom)
  statusLayer = newTextLayerHandle(
    makeGRect(0, bounds.size.h - 20, bounds.size.w, 20),
    "ARC Managed Demo".cstring,
    fonts_get_system_font(FONT_KEY_GOTHIC_14.cstring),
    constants.GTextAlignmentCenter
  )
  statusLayer.textColor = GColorLightGray
  win.rootLayer.addChild(statusLayer.getLayer())
  
  # Subscribe to tick timer for time updates
  subscribe(MINUTE_UNIT, updateTime)
  
  # Update immediately
  var now = time()
  let tmNow = ffi.localtime(addr now)
  updateTime(tmNow, MINUTE_UNIT)

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Resources are automatically destroyed when handles are reassigned.
  ## This demonstrates ARC memory management.
  
  # Unsubscribe from tick timer
  tick.unsubscribe()
  
  # Clear handles - triggers automatic destruction
  # The TextLayers will be destroyed here via =destroy hook
  timeLayer = TextLayerHandle(nil)
  dateLayer = TextLayerHandle(nil)
  statusLayer = TextLayerHandle(nil)
  
  # Alternatively, could just let them go out of scope if they were
  # local variables, but for module-level vars, explicit reset is clearer.

# Use the pebbleApp macro for simple apps
pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

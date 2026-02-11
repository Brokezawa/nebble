## Simple Managed Types Demo
##
## A simple watchface demonstrating basic managed types (TextLayerHandle).
## This is the simplest possible example of using ARC memory management.
##
## Key Features:
## - TextLayerHandle with automatic destruction
## - No manual destroy() calls needed
## - Clean resource management in windowUnload

import nebble
import nebble/ffi
import nebble/ui/text_layer_managed
import nebble/foundation/events/tick
import nebble/foundation/time

# Module-level handles (persist across window lifecycle)
var 
  timeLayer: TextLayerHandle
  dateLayer: TextLayerHandle

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
  # Note: Using managed TextLayerHandle - no need to manually destroy!
  timeLayer = newTextLayerHandle(
    makeGRect(0, 52, bounds.size.w, 48),
    "--:--".cstring,
    fonts_get_system_font(FONT_KEY_BITHAM_42_BOLD.cstring),
    GTextAlignmentCenter
  )
  timeLayer.textColor = GColorWhite
  win.rootLayer.addChild(timeLayer.getLayer())
  
  # Create date layer (smaller, below time)
  dateLayer = newTextLayerHandle(
    makeGRect(0, 100, bounds.size.w, 24),
    "Loading...".cstring,
    fonts_get_system_font(FONT_KEY_GOTHIC_24.cstring),
    GTextAlignmentCenter
  )
  dateLayer.textColor = GColorWhite
  win.rootLayer.addChild(dateLayer.getLayer())
  
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
  
  # Clear handles - triggers automatic destruction via =destroy hook
  # The TextLayers will be destroyed here
  timeLayer = TextLayerHandle(nil)
  dateLayer = TextLayerHandle(nil)
  
  # Note: No manual destroy() calls needed!
  # Compare with manual API where you'd need:
  #   timeLayer.destroy()
  #   dateLayer.destroy()

# Use the pebbleApp macro for simple apps
pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

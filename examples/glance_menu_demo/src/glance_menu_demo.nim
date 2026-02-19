## glance_menu_demo - Demonstrating AppGlance and Dynamic MenuLayer
##
## This example shows:
## 1. Dynamic MenuLayer callbacks (drawing rows on demand)
## 2. AppGlance API (setting a menu slice on app exit)
## 3. Heap-free string formatting with FixedString

import nebble
import nebble/comms/app_glance

# Static data to avoid heap allocations
const
  Titles = ["AppGlance", "Dynamic Menu", "ARC Managed"]
  Subtitles = ["Set slice on exit", "Custom callbacks", "Zero leaks"]

var lastSelected: cstring = "None"

# ============================================================================
# MenuLayer Callbacks
# ============================================================================

proc getNumRows(menuLayer: ptr MenuLayer, sectionIndex: uint16, context: pointer): uint16 {.cdecl.} =
  return 3

proc drawRow(ctx: ptr GContext, cellLayer: ptr Layer, index: ptr MenuIndex, context: pointer) {.cdecl.} =
  let idx = index.row.int
  if idx < 3:
    menu_layer.basicDraw(ctx, cellLayer, Titles[idx], Subtitles[idx], nil)

proc selectClick(menuLayer: ptr MenuLayer, index: ptr MenuIndex, context: pointer) {.cdecl.} =
  let idx = index.row.int
  if idx < 3:
    lastSelected = Titles[idx]
    # Simple haptic feedback
    vibes.shortPulse()
    # Log selection for verification
    logInfo("Selected item")

# ============================================================================
# AppGlance Callback
# ============================================================================

when declared(AppGlanceReloadSession):
  proc appGlanceReload(session: ptr AppGlanceReloadSession, limit: csize_t, context: pointer) {.cdecl.} =
    ## Called by the system to refresh the app menu slice.
    var msg: FixedString[32]
    msg.f("Last: ", lastSelected)
    
    # Add a slice that shows what we last selected in the app
    when declared(session.addSlice):
      discard session.addSlice(msg.cstr)

# ============================================================================
# Declarative App
# ============================================================================

nebbleApp:
  menuLayer:
    id = myMenu
    fullScreen = true
  
  init:
    logInfo("Demo Starting")
    
    # Initialize MenuLayer with dynamic callbacks
    var callbacks: MenuLayerCallbacks
    callbacks.get_num_rows = getNumRows
    callbacks.draw_row = drawRow
    callbacks.select_click = selectClick
    
    myMenu.setCallbacks(nil, callbacks)
    
    # MenuLayer handles its own clicks, but needs to be attached to the window
    myMenu.setClickConfigOntoWindow(pebbleWindow.toPtr)

  deinit:
    logInfo("Demo Closing")
    # Trigger an AppGlance reload so the change is visible in the Pebble app menu
    when declared(app_glance.reload):
      app_glance.reload(appGlanceReload)

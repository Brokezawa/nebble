## Hierarchy Demo
##
## Demonstrates hierarchy-aware managed layers (LayerHandle).
## Shows parent-child relationships and automatic cleanup.
##
## Key Features:
## - LayerHandle with parent tracking
## - Parent destroys children automatically
## - Prevents double-free errors
## - Shows window stack lifecycle with WindowHandle

import nebble
import nebble/ffi
import nebble/ui/layer_managed
import nebble/ui/text_layer_managed
import nebble/ui/window_managed
import nebble/foundation/events/tick
import nebble/foundation/time

# Module-level handles
var 
  mainWindow: WindowHandle
  parentLayer: LayerHandle
  childLayer1: LayerHandle
  childLayer2: LayerHandle
  infoText: TextLayerHandle

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Create a hierarchy of layers
  
  let bounds = win.rootLayer.bounds
  
  # Create a parent layer that will contain children
  parentLayer = newLayerHandle(makeGRect(10, 30, bounds.size.w - 20, 100))
  # Use manual API for window root layer (it's managed by the window)
  layer_add_child(win.rootLayer, cast[ptr Layer](parentLayer.toPtr))
  
  # Create child layers - these will be owned by parentLayer
  childLayer1 = newLayerHandle(makeGRect(5, 5, 40, 40))
  parentLayer.addChild(childLayer1)  # Parent takes ownership
  
  childLayer2 = newLayerHandle(makeGRect(50, 5, 40, 40))
  parentLayer.addChild(childLayer2)  # Parent takes ownership
  
  # Add info text
  infoText = newTextLayerHandle(
    makeGRect(0, bounds.size.h - 40, bounds.size.w, 30),
    "Parent owns children".cstring,
    fonts_get_system_font(FONT_KEY_GOTHIC_18.cstring),
    GTextAlignmentCenter
  )
  infoText.textColor = GColorWhite
  layer_add_child(win.rootLayer, text_layer_get_layer(infoText.toPtr))
  
  # Log hierarchy info
  echo "Parent has ", (if parentLayer.hasParent: "a parent" else: "no parent")
  echo "Child1 has parent: ", childLayer1.hasParent
  echo "Child2 has parent: ", childLayer2.hasParent

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Demonstrate automatic cleanup.
  ##
  ## When we destroy parentLayer, the Pebble SDK automatically destroys
  ## all its children (childLayer1 and childLayer2).
  ##
  ## Our LayerHandle destructors check if the layer has a parent before
  ## destroying, preventing double-free errors.
  
  # Destroy parent - children destroyed automatically by SDK
  parentLayer = LayerHandle(nil)
  
  # These are now safe to clear - destructors see they have parent
  # and skip destruction (already done by parent destruction)
  childLayer1 = LayerHandle(nil)
  childLayer2 = LayerHandle(nil)
  
  # Text layer has no parent, so it will be destroyed normally
  infoText = TextLayerHandle(nil)
  
  echo "Cleanup complete - no double-free!"

# Note: Window is managed by pebbleApp macro, so we don't need
# to manually handle WindowHandle in this simple case

pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

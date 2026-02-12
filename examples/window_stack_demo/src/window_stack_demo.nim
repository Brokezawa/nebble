## Window Stack Demo
##
## Demonstrates stack-aware window management (WindowHandle).
## Shows proper window lifecycle with push/pop operations.
##
## Key Features:
## - WindowHandle with stack state tracking
## - Safe push/pop operations
## - Deferred destruction when window is on stack
## - State machine (wsCreated -> wsOnStack -> wsPopped -> wsDestroyed)

import nebble
import nebble/ffi
import nebble/ui/text_layer_managed
import nebble/ui/window_managed

# Module-level handles
var 
  detailWindow: WindowHandle
  infoLayer: TextLayerHandle
  counter: int = 0

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Create main window demonstrating WindowHandle lifecycle.
  
  let bounds = win.rootLayer.bounds
  
  # Info text explaining the demo
  infoLayer = newTextLayerHandle(
    makeGRect(0, 30, bounds.size.w, 80),
    "WindowHandle Demo\nCheck console output\nfor state transitions".cstring,
    getSystemFont(ffi.FONT_KEY_GOTHIC_18.cstring),
    constants.GTextAlignmentCenter
  )
  infoLayer.textColor = GColorWhite
  win.rootLayer.addChild(infoLayer.getLayer())
  
  # Create a detail window (not shown in this simplified demo)
  # In a real app, this would be pushed/popped based on user interaction
  detailWindow = newWindowHandle()
  echo "Created detailWindow"
  echo "  State: ", detailWindow.state  # wsCreated
  echo "  isValid: ", detailWindow.isValid
  echo "  canDestroy: ", detailWindow.canDestroy
  
  # Demonstrate that we can safely configure the window before pushing
  detailWindow.backgroundColor = GColorWhite
  echo "Configured detailWindow (still wsCreated)"

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Cleanup resources demonstrating proper WindowHandle usage.
  
  echo "WindowUnload called"
  
  # Check if detail window is still valid
  if detailWindow.isValid:
    echo "detailWindow is valid"
    echo "  State: ", detailWindow.state
    
    # If window is on stack, we must pop it first before destroying
    if detailWindow.isOnStack:
      echo "Window is on stack - popping first"
      discard detailWindow.pop()
      echo "  New state: ", detailWindow.state  # wsPopped
    
    # Now safe to destroy
    if detailWindow.canDestroy:
      echo "Destroying detailWindow"
      detailWindow = WindowHandle(nil)
      echo "  Destroyed successfully"
  else:
    echo "detailWindow already destroyed or invalid"
  
  # Clear main window resources
  infoLayer = TextLayerHandle(nil)
  echo "Cleanup complete"

pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

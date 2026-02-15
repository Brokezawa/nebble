## ARC-Managed Window Handle (Stack-Aware)
##
## Provides automatic memory management for Window objects with window stack
## lifecycle tracking to prevent destroying windows while on the stack.
##
## **Key Challenge:** Windows pushed to the window stack are "owned" by the stack.
## Destroying them while on the stack causes undefined behavior. This handle
## tracks stack state to defer destruction until safe.
##
## **Usage Example:**
##   ```nim
##   import nebble/ui/window
##   
##   var mainWindow: WindowHandle
##   
##   proc myInit() =
##     mainWindow = newWindowHandle()
##     mainWindow.push()  # Window now on stack
##     # Do NOT destroy while on stack!
##   
##   proc myDeinit() =
##     # Pop window from stack first
##     if mainWindow.pop():
##       # Now safe to destroy
##       mainWindow = WindowHandle(nil)
##   ```

import nebble/ffi
import nebble/ffi/managed
import nebble/ffi/resource_state

export ffi.Window, ffi.WindowHandlers, ffi.ClickConfigProvider, ffi.WindowHandler

# ============================================================================
# Stack-Aware Window Handle
# ============================================================================

type WindowHandle* = object
  ## Managed handle for Window with stack lifecycle tracking.
  ##
  ## **Safety:** The destructor checks the window's stack state before
  ## destroying. If the window is still on the stack, destruction is
  ## deferred and a warning is logged (in debug mode).
  raw: ptr Window
  state: ResourceState

# ============================================================================
# ARC Lifetime Hooks
# ============================================================================

proc `=destroy`*(h: var WindowHandle) =
  ## Destructor - destroys window only if safe.
  ##
  ## - `rsCreated`: Safe to destroy
  ## - `rsInactive`: Safe to destroy  
  ## - `rsActive`: **Unsafe** - window still on stack, log warning
  ## - `rsDestroyed`: Already destroyed, do nothing
  case h.state
  of rsCreated, rsInactive:
    if h.raw != nil:
      window_destroy(h.raw)
  of rsActive:
    when ManagedDebug:
      # Log warning but don't crash - user error but we handle gracefully
      discard  # Could use app_log here in embedded context
  of rsDestroyed:
    discard
  h.raw = nil
  h.state = rsDestroyed

proc `=wasMoved`*(h: var WindowHandle) =
  ## Mark handle as moved.
  h.raw = nil
  h.state = rsDestroyed

proc `=copy`*(dest: var WindowHandle, src: WindowHandle) {.error.} =
  ## Copying disabled - use move semantics.
  discard

proc `=sink`*(dest: var WindowHandle, src: WindowHandle) =
  ## Move assignment - transfers ownership.
  # Note: src is a sink parameter (passed by value but consumed)
  # We move the data from src to dest, and leave src as nil
  `=destroy`(dest)
  dest.raw = src.raw
  dest.state = src.state
  # Zero out src via unsafeAddr since src is immutable
  var srcPtr = cast[ptr WindowHandle](unsafeAddr src)
  srcPtr.raw = nil
  srcPtr.state = rsDestroyed

# ============================================================================
# Converters
# ============================================================================

converter toPtr*(h: WindowHandle): ptr Window =
  ## Convert handle to raw pointer for C API calls.
  h.raw

proc toHandle*(p: ptr Window): WindowHandle =
  ## Wrap raw pointer in handle (unowned).
  WindowHandle(raw: p, state: rsActive) # Assume active/unowned

# ============================================================================
# Utility Functions
# ============================================================================

proc isValid*(h: WindowHandle): bool {.inline.} =
  ## Check if handle points to valid window.
  h.raw != nil and h.state != rsDestroyed

proc state*(h: WindowHandle): ResourceState {.inline.} =
  ## Get current window state.
  h.state

proc isOnStack*(h: WindowHandle): bool {.inline.} =
  ## Check if window is currently on the window stack.
  h.state == rsActive

proc canDestroy*(h: WindowHandle): bool {.inline.} =
  ## Check if window can be safely destroyed.
  h.state.canDestroy

proc reset*(h: var WindowHandle) =
  ## Explicitly destroy window if safe and reset handle.
  `=destroy`(h)
  `=wasMoved`(h)

when ManagedDebug or ManagedStrict:
  proc checkValid*(h: WindowHandle) =
    ## Runtime check for valid handle (debug builds only).
    if not h.isValid:
      when ManagedStrict:
        raise newException(AssertionDefect, "Operation on invalid/moved WindowHandle")

  proc checkNotOnStack*(h: WindowHandle) =
    ## Ensure window is not on stack (debug builds only).
    if h.isOnStack:
      when ManagedStrict:
        raise newException(AssertionDefect, "Window is still on stack! Pop first.")

# ============================================================================
# Constructors
# ============================================================================

proc newWindowHandle*(): WindowHandle {.inline.} =
  ## Create a new managed Window.
  ##
  ## **Example:**
  ##   var win = newWindowHandle()
  ##   # Window in rsCreated state - safe to configure but not yet on stack
  result.raw = window_create()
  result.state = rsCreated

proc newWindow*(): WindowHandle {.inline.} =
  ## Alias for `newWindowHandle`.
  result = newWindowHandle()

proc newWindowHandle*(handlers: WindowHandlers): WindowHandle {.inline.} =
  ## Create a new managed Window with handlers.
  result.raw = window_create()
  result.state = rsCreated
  window_set_window_handlers(result.raw, handlers)

proc newWindow*(handlers: WindowHandlers): WindowHandle {.inline.} =
  ## Alias for `newWindowHandle`.
  result = newWindowHandle(handlers)

# ============================================================================
# Window Stack Operations
# ============================================================================

proc push*(h: var WindowHandle, animated: bool = true) {.inline.} =
  ## Push window onto window stack.
  ##
  ## **Transitions:** rsCreated -> rsActive
  ##
  ## **Example:**
  ##   mainWindow.push()  # Window now displayed
  if h.raw == nil: return
  
  when ManagedDebug or ManagedStrict:
    if h.state != rsCreated:
      when ManagedStrict:
        raise newException(AssertionDefect, "Window must be in rsCreated state to push")
  
  window_stack_push(h.raw, animated)
  h.state = rsActive

proc pop*(h: var WindowHandle): bool {.inline.} =
  ## Pop window from stack. Returns true if this window was popped.
  ##
  ## **Transitions:** rsActive -> rsInactive (if this window was on top)
  ##
  ## **Example:**
  ##   if mainWindow.pop():
  ##     # Safe to destroy now
  ##     mainWindow = WindowHandle(nil)
  if h.raw == nil: return false
  
  if h.state == rsActive:
    # Only pop if this window is actually on top
    let topWindow = window_stack_get_top_window()
    if topWindow == h.raw:
      let popped = window_stack_pop(animated = true)
      if popped == h.raw:
        h.state = rsInactive
        return true
  return false

proc removeFromStack*(h: var WindowHandle, animated: bool = true): bool {.inline.} =
  ## Remove window from stack (even if not on top).
  ##
  ## **Transitions:** rsActive -> rsInactive (if removed)
  if h.raw == nil: return false
  
  if h.state == rsActive:
    let removed = window_stack_remove(h.raw, animated)
    if removed:
      h.state = rsInactive
      return true
  return false


proc popAll*(animated: bool = true) {.inline.} =
  ## Pop all windows from stack.
  ##
  ## **⚠️ Warning:** This affects ALL windows, not just managed ones.
  ## Managed windows still on the stack will have their state desynchronized.
  ## You MUST manually call `reset()` on all managed `WindowHandle` objects 
  ## after calling `popAll` to ensure they are properly destroyed.
  window_stack_pop_all(animated)

# ============================================================================
# Window Properties
# ============================================================================

proc rootLayer*(win: ptr Window): ptr Layer {.inline.} =
  if win == nil: return nil
  ffi.window_get_root_layer(win)

proc rootLayer*(h: WindowHandle): ptr Layer {.inline.} =
  ## Get the root layer of the window.
  if h.raw == nil: return nil
  ffi.window_get_root_layer(h.raw)

proc isLoaded*(h: WindowHandle): bool {.inline.} =
  ## Check if window has been loaded.
  if h.raw == nil: return false
  window_is_loaded(h.raw)

proc `backgroundColor=`*(h: var WindowHandle, color: GColor8) {.inline.} =
  ## Set window background color.
  if h.raw == nil: return
  window_set_background_color(h.raw, color)

proc `userData=`*(h: var WindowHandle, data: pointer) {.inline.} =
  ## Set user data pointer.
  if h.raw == nil: return
  window_set_user_data(h.raw, data)

proc userData*(h: WindowHandle): pointer {.inline.} =
  ## Get user data pointer.
  if h.raw == nil: return nil
  window_get_user_data(h.raw)

# ============================================================================
# Window Handlers
# ============================================================================

proc `handlers=`*(h: var WindowHandle, hnd: WindowHandlers) {.inline.} =
  ## Set window lifecycle handlers.
  if h.raw == nil: return
  window_set_window_handlers(h.raw, hnd)

proc setHandlers*(h: var WindowHandle,
                  load: WindowHandler = nil,
                  unload: WindowHandler = nil,
                  appear: WindowHandler = nil,
                  disappear: WindowHandler = nil) {.inline.} =
  ## Set window lifecycle handlers using named parameters.
  if h.raw == nil: return
  var handlers: WindowHandlers
  if load != nil: handlers.load = load
  if unload != nil: handlers.unload = unload
  if appear != nil: handlers.appear = appear
  if disappear != nil: handlers.disappear = disappear
  window_set_window_handlers(h.raw, handlers)

# ============================================================================
# Click Configuration
# ============================================================================

proc `clickConfig=`*(win: ptr Window, provider: ClickConfigProvider) {.inline.} =
  ## Set click configuration provider (raw pointer version).
  if win == nil: return
  ffi.window_set_click_config_provider(win, provider)

proc `clickConfig=`*(h: var WindowHandle, provider: ClickConfigProvider) {.inline.} =
  ## Set click configuration provider.
  if h.raw == nil: return
  window_set_click_config_provider(h.raw, provider)

proc setClickConfigWithContext*(h: var WindowHandle,
                                provider: ClickConfigProvider,
                                context: pointer) {.inline.} =
  ## Set the click configuration provider with a context pointer.
  if h.raw == nil: return
  window_set_click_config_provider_with_context(h.raw, provider, context)

proc clickContext*(h: WindowHandle): pointer {.inline.} =
  ## Get click configuration context.
  if h.raw == nil: return nil
  window_get_click_config_context(h.raw)

## High-level idiomatic Nim API for Pebble app lifecycle and logging.
##
## This module provides:
## - `pebbleApp` macro for generating app scaffold boilerplate
## - `eventLoop` wrapper for the main event loop
## - App focus service subscriptions

import nebble/ffi
import macros

export ffi.AppFocusHandler

# ============================================================================
# App Lifecycle
# ============================================================================

proc eventLoop*() {.inline.} =
  ## Run the app event loop. This is the main entry point for a Pebble app.
  ## Call this after initialization, and it will block until the app exits.
  ## Equivalent to C function `app_event_loop()`.
  ffi.app_event_loop()

# ============================================================================
# App Scaffold Macro
# ============================================================================

macro pebbleApp*(load: untyped = nil,
                unload: untyped = nil,
                appear: untyped = nil,
                disappear: untyped = nil,
                clickConfig: untyped = nil): untyped =
  ## Generate the complete app scaffold (window, init, deinit, main).
  ##
  ## This macro eliminates ~15 lines of boilerplate by generating:
  ## - Module-level `var pebbleWindow: ptr Window`
  ## - `init() {.cdecl.}` proc that creates window, sets handlers, pushes it
  ## - `deinit() {.cdecl.}` proc that destroys the window
  ## - `main() {.exportc, cdecl.}` entry point
  ##
  ## Usage:
  ## ```nim
  ## proc windowLoad(win: ptr Window) {.cdecl.} =
  ##   # ... create layers
  ##
  ## proc windowUnload(win: ptr Window) {.cdecl.} =
  ##   # ... destroy layers
  ##
  ## pebbleApp(load = windowLoad, unload = windowUnload)
  ## ```
  ##
  ## All parameters are optional. If no handlers are provided, generates
  ## a minimal app with an empty window.

  result = newStmtList()

  # Generate: var pebbleWindow: ptr Window
  let windowVar = ident("pebbleWindow")
  result.add quote do:
    var `windowVar`: ptr Window

  # Build WindowHandlers struct initialization
  var handlersFields = nnkObjConstr.newTree(ident"WindowHandlers")
  
  if not load.isNil and load.kind != nnkNilLit:
    handlersFields.add nnkExprColonExpr.newTree(ident"load", load)
  
  if not unload.isNil and unload.kind != nnkNilLit:
    handlersFields.add nnkExprColonExpr.newTree(ident"unload", unload)
  
  if not appear.isNil and appear.kind != nnkNilLit:
    handlersFields.add nnkExprColonExpr.newTree(ident"appear", appear)
  
  if not disappear.isNil and disappear.kind != nnkNilLit:
    handlersFields.add nnkExprColonExpr.newTree(ident"disappear", disappear)

  # Generate init() proc
  var initBody = newStmtList()
  initBody.add quote do:
    `windowVar` = ffi.window_create()
  
  if handlersFields.len > 1:  # More than just the type ident
    initBody.add quote do:
      ffi.window_set_window_handlers(`windowVar`, `handlersFields`)
  
  if not clickConfig.isNil and clickConfig.kind != nnkNilLit:
    initBody.add quote do:
      ffi.window_set_click_config_provider(`windowVar`, `clickConfig`)
  
  initBody.add quote do:
    ffi.window_stack_push(`windowVar`, true)

  result.add quote do:
    proc init() {.cdecl.} =
      `initBody`

  # Generate deinit() proc
  result.add quote do:
    proc deinit() {.cdecl.} =
      ffi.window_destroy(`windowVar`)

  # Generate main() entry point
  result.add quote do:
    proc main(): cint {.exportc, cdecl.} =
      init()
      eventLoop()
      deinit()
      return 0

# ============================================================================
# Logging
# ============================================================================

## APP_LOG macro is already re-exported from nebble/ffi/macros.
## Usage: APP_LOG(APP_LOG_LEVEL_INFO, cstring"Hello %d", 42)
##
## Log levels (from pebble.h):
## - APP_LOG_LEVEL_ERROR = 1
## - APP_LOG_LEVEL_WARNING = 50
## - APP_LOG_LEVEL_INFO = 100
## - APP_LOG_LEVEL_DEBUG = 200
## - APP_LOG_LEVEL_DEBUG_VERBOSE = 255

# ============================================================================
# App Focus Service
# ============================================================================

proc subscribe*(handler: AppFocusHandler) {.inline.} =
  ## Subscribe to app focus change events (app in foreground / background).
  ## Equivalent to C function `app_focus_service_subscribe(handler)`.
  ffi.app_focus_service_subscribe(handler)

proc unsubscribe*() {.inline.} =
  ## Unsubscribe from app focus change events.
  ## Equivalent to C function `app_focus_service_unsubscribe()`.
  ffi.app_focus_service_unsubscribe()

when declared(ffi.app_focus_service_is_active):
  proc isActive*(): bool {.inline.} =
    ## Check if the app currently has focus (is in the foreground).
    ## Equivalent to C function `app_focus_service_is_active()`.
    ffi.app_focus_service_is_active()

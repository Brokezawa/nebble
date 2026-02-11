## High-level Nim wrapper for Pebble Foundation App API.
##
## Provides app lifecycle management, launch/exit reasons, and the `pebbleApp`
## macro for generating app scaffold boilerplate.

import nebble/ffi
import std/macros

export ffi.AppLaunchReason, ffi.AppExitReason

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
                clickConfig: untyped = nil,
                init: untyped = nil,
                deinit: untyped = nil): untyped =
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
  ## proc windowLoad(win: ptr Window) {.cdecl.} = ...
  ## proc myInit() = ...
  ##
  ## pebbleApp(load = windowLoad, init = myInit)
  ## ```
  ##
  ## All parameters are optional. `init` and `deinit` accept a proc identifier
  ## to be called for custom initialization/cleanup (e.g. subscribing to services).

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
  
  # Call custom init if provided
  if not init.isNil and init.kind != nnkNilLit:
    initBody.add quote do:
      `init`()

  result.add quote do:
    proc init() {.cdecl.} =
      `initBody`

  # Generate deinit() proc
  var deinitBody = newStmtList()
  
  # Call custom deinit if provided
  if not deinit.isNil and deinit.kind != nnkNilLit:
    deinitBody.add quote do:
      `deinit`()
      
  deinitBody.add quote do:
    ffi.window_destroy(`windowVar`)

  result.add quote do:
    proc deinit() {.cdecl.} =
      `deinitBody`

  # Generate main() entry point
  result.add quote do:
    proc main(): cint {.exportc, cdecl.} =
      init()
      eventLoop()
      deinit()
      return 0

# ============================================================================
# Launch & Exit
# ============================================================================

proc launchReason*(): AppLaunchReason {.inline.} =
  ## Get the reason the app was launched.
  ## Equivalent to C function `launch_reason()`.
  ffi.launch_reason()

proc launchArgs*(): uint32 {.inline.} =
  ## Get the launch arguments (e.g. from timeline or worker).
  ## Equivalent to C function `launch_get_args()`.
  ffi.launch_get_args()

when declared(ffi.exit_reason_set):
  proc setExitReason*(reason: AppExitReason) {.inline.} =
    ## Set the exit reason for the app.
    ## Equivalent to C function `exit_reason_set(reason)`.
    ## NOTE: Not available on Aplite.
    ffi.exit_reason_set(reason)

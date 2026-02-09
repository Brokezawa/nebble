## High-level idiomatic Nim API for Pebble windows.
##
## This module provides constructors, property-style setters/getters, and
## convenience wrappers for Window operations.

import nebble/ffi

export ffi.Window, ffi.WindowHandlers, ffi.ClickConfigProvider

# ============================================================================
# Window Constructor / Destructor
# ============================================================================

proc newWindow*(): ptr Window {.inline.} =
  ## Create a new Window.
  ## The caller is responsible for calling `destroy()` when done.
  ## Equivalent to C function `window_create()`.
  ffi.window_create()

proc destroy*(window: ptr Window) {.inline.} =
  ## Destroy a Window and free its memory.
  ## Equivalent to C function `window_destroy(window)`.
  ffi.window_destroy(window)

# ============================================================================
# Window Stack
# ============================================================================

proc push*(window: ptr Window, animated: bool = true) {.inline.} =
  ## Push a window onto the window stack.
  ## The window stack retains ownership - do not destroy until after popping.
  ## Equivalent to C function `window_stack_push(window, animated)`.
  ffi.window_stack_push(window, animated)

proc pop*(animated: bool = true): ptr Window {.inline.} =
  ## Pop the top window from the window stack and return it.
  ## Equivalent to C function `window_stack_pop(animated)`.
  ffi.window_stack_pop(animated)

proc popAll*(animated: bool = true) {.inline.} =
  ## Pop all windows from the window stack.
  ## Equivalent to C function `window_stack_pop_all(animated)`.
  ffi.window_stack_pop_all(animated)

proc getTopWindow*(): ptr Window {.inline.} =
  ## Get the top window on the stack without popping it.
  ## Equivalent to C function `window_stack_get_top_window()`.
  ffi.window_stack_get_top_window()

proc contains*(window: ptr Window): bool {.inline.} =
  ## Check if a window is currently on the window stack.
  ## Equivalent to C function `window_stack_contains_window(window)`.
  ffi.window_stack_contains_window(window)

proc removeWindow*(window: ptr Window, animated: bool): bool {.inline.} =
  ## Remove a specific window from the stack (even if not on top).
  ## Returns true if the window was found and removed.
  ## Equivalent to C function `window_stack_remove(window, animated)`.
  ffi.window_stack_remove(window, animated)

# ============================================================================
# Window Properties
# ============================================================================

proc rootLayer*(window: ptr Window): ptr Layer {.inline.} =
  ## Get the root layer of the window.
  ## Equivalent to C function `window_get_root_layer(window)`.
  ffi.window_get_root_layer(window)

proc `backgroundColor=`*(window: ptr Window, color: GColor8) {.inline.} =
  ## Set the background color of the window.
  ## Equivalent to C function `window_set_background_color(window, color)`.
  ffi.window_set_background_color(window, color)

proc isLoaded*(window: ptr Window): bool {.inline.} =
  ## Check if the window has been loaded.
  ## Equivalent to C function `window_is_loaded(window)`.
  ffi.window_is_loaded(window)

proc `userData=`*(window: ptr Window, data: pointer) {.inline.} =
  ## Set user data pointer for the window.
  ## Equivalent to C function `window_set_user_data(window, data)`.
  ffi.window_set_user_data(window, data)

proc userData*(window: ptr Window): pointer {.inline.} =
  ## Get the user data pointer for the window.
  ## Equivalent to C function `window_get_user_data(window)`.
  ffi.window_get_user_data(window)

# ============================================================================
# Window Handlers
# ============================================================================

template `handlers=`*(window: ptr Window; h: WindowHandlers) =
  ## Set window lifecycle handlers.
  ## Equivalent to C function `window_set_window_handlers(window, handlers)`.
  ffi.window_set_window_handlers(window, h)

proc setHandlers*(window: ptr Window,
                  load: WindowHandler = nil,
                  unload: WindowHandler = nil,
                  appear: WindowHandler = nil,
                  disappear: WindowHandler = nil) {.inline.} =
  ## Set window lifecycle handlers using named parameters.
  ## Any nil handler is left unchanged.
  ## Equivalent to C function `window_set_window_handlers(window, handlers)`.
  var handlers: WindowHandlers
  if load != nil: handlers.load = load
  if unload != nil: handlers.unload = unload
  if appear != nil: handlers.appear = appear
  if disappear != nil: handlers.disappear = disappear
  ffi.window_set_window_handlers(window, handlers)

# ============================================================================
# Click Configuration
# ============================================================================

proc `clickConfig=`*(window: ptr Window, provider: ClickConfigProvider) {.inline.} =
  ## Set the click configuration provider for the window.
  ## The provider is called to set up click handlers when the window loads.
  ## Equivalent to C function `window_set_click_config_provider(window, provider)`.
  ffi.window_set_click_config_provider(window, provider)

proc setClickConfigWithContext*(window: ptr Window,
                                provider: ClickConfigProvider,
                                context: pointer) {.inline.} =
  ## Set the click configuration provider with a context pointer.
  ## Equivalent to C function `window_set_click_config_provider_with_context(...)`.
  ffi.window_set_click_config_provider_with_context(window, provider, context)

proc clickConfig*(window: ptr Window): ClickConfigProvider {.inline.} =
  ## Get the current click configuration provider.
  ## Equivalent to C function `window_get_click_config_provider(window)`.
  ffi.window_get_click_config_provider(window)

proc clickContext*(window: ptr Window): pointer {.inline.} =
  ## Get the click configuration context pointer.
  ## Equivalent to C function `window_get_click_config_context(window)`.
  ffi.window_get_click_config_context(window)

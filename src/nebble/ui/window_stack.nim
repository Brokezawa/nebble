## High-level Nim wrapper for Pebble Window Stack API.
##
## Provides window stack management functions.

import nebble/ffi

# ============================================================================
# Window Stack Operations
# ============================================================================

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

proc remove*(window: ptr Window, animated: bool): bool {.inline.} =
  ## Remove a specific window from the stack (even if not on top).
  ## Returns true if the window was found and removed.
  ## Equivalent to C function `window_stack_remove(window, animated)`.
  ffi.window_stack_remove(window, animated)

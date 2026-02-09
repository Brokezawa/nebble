## High-level Nim wrapper for Pebble NumberWindow API.
##
## A window that allows the user to select a number from a range.

import nebble/ffi

export ffi.NumberWindow, ffi.NumberWindowCallbacks

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newNumberWindow*(label: cstring, callbacks: NumberWindowCallbacks,
                      callbackContext: pointer): ptr NumberWindow {.inline.} =
  ## Create a new NumberWindow.
  ## Equivalent to C function `number_window_create(...)`.
  ffi.number_window_create(label, callbacks, callbackContext)

proc destroy*(numberWindow: ptr NumberWindow) {.inline.} =
  ## Destroy the number window.
  ## Equivalent to C function `number_window_destroy(number_window)`.
  ffi.number_window_destroy(numberWindow)

# ============================================================================
# Configuration
# ============================================================================

proc `label=`*(numberWindow: ptr NumberWindow, label: cstring) {.inline.} =
  ## Set the label text.
  ## Equivalent to C function `number_window_set_label(number_window, label)`.
  ffi.number_window_set_label(numberWindow, label)

proc `max=`*(numberWindow: ptr NumberWindow, max: int32) {.inline.} =
  ## Set the maximum value.
  ## Equivalent to C function `number_window_set_max(number_window, max)`.
  ffi.number_window_set_max(numberWindow, max)

proc `min=`*(numberWindow: ptr NumberWindow, min: int32) {.inline.} =
  ## Set the minimum value.
  ## Equivalent to C function `number_window_set_min(number_window, min)`.
  ffi.number_window_set_min(numberWindow, min)

proc `value=`*(numberWindow: ptr NumberWindow, value: int32) {.inline.} =
  ## Set the current value.
  ## Equivalent to C function `number_window_set_value(number_window, value)`.
  ffi.number_window_set_value(numberWindow, value)

proc value*(numberWindow: ptr NumberWindow): int32 {.inline.} =
  ## Get the current value.
  ## Equivalent to C function `number_window_get_value(number_window)`.
  ffi.number_window_get_value(numberWindow)

proc `stepSize=`*(numberWindow: ptr NumberWindow, step: int32) {.inline.} =
  ## Set the step increment size.
  ## Equivalent to C function `number_window_set_step_size(number_window, step)`.
  ffi.number_window_set_step_size(numberWindow, step)

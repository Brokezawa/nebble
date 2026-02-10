## High-level idiomatic Nim API for Pebble click handling.
##
## This module provides wrappers for button click subscriptions
## (single, multi, long, repeating).

import nebble/ffi

export ffi.ButtonId, ffi.ClickHandler, ffi.ClickRecognizerRef

# ============================================================================
# Single Click
# ============================================================================

proc onClick*(buttonId: ButtonId, handler: ClickHandler) {.inline.} =
  ## Subscribe to single click events for a button.
  ## Equivalent to C function `window_single_click_subscribe(button_id, handler)`.
  ffi.window_single_click_subscribe(buttonId, handler)

proc onRepeatingClick*(buttonId: ButtonId,
                       repeatIntervalMs: uint16,
                       handler: ClickHandler) {.inline.} =
  ## Subscribe to repeating single clicks (fires repeatedly while button held).
  ## Equivalent to C function `window_single_repeating_click_subscribe(...)`.
  ffi.window_single_repeating_click_subscribe(buttonId, repeatIntervalMs, handler)

# ============================================================================
# Multi Click
# ============================================================================

proc onMultiClick*(buttonId: ButtonId,
                   minClicks, maxClicks: uint8,
                   timeout: uint16,
                   lastClickOnly: bool,
                   handler: ClickHandler) {.inline.} =
  ## Subscribe to multi-click events (double-click, triple-click, etc.).
  ## Equivalent to C function `window_multi_click_subscribe(...)`.
  ffi.window_multi_click_subscribe(buttonId, minClicks, maxClicks, timeout,
                                    lastClickOnly, handler)

# ============================================================================
# Long Click
# ============================================================================

proc onLongClick*(buttonId: ButtonId,
                  delayMs: uint16,
                  downHandler, upHandler: ClickHandler) {.inline.} =
  ## Subscribe to long click events.
  ## `downHandler` is called when the button is held down for `delayMs`.
  ## `upHandler` is called when the button is released after a long click.
  ## Equivalent to C function `window_long_click_subscribe(...)`.
  ffi.window_long_click_subscribe(buttonId, delayMs, downHandler, upHandler)

# ============================================================================
# Raw Click
# ============================================================================

proc onRawClick*(buttonId: ButtonId, downHandler, upHandler: ClickHandler,
                 context: pointer) {.inline.} =
  ## Subscribe to raw click events (down and up separately).
  ## Equivalent to C function `window_raw_click_subscribe(...)`.
  ffi.window_raw_click_subscribe(buttonId, downHandler, upHandler, context)

# ============================================================================
# Click Context
# ============================================================================

proc `clickContext=`*(buttonId: ButtonId, context: pointer) {.inline.} =
  ## Set the context pointer for a button's click handlers.
  ## Equivalent to C function `window_set_click_context(button_id, context)`.
  ffi.window_set_click_context(buttonId, context)

# ============================================================================
# Click Recognizer Helpers
# ============================================================================

proc getButtonId*(recognizer: ClickRecognizerRef): ButtonId {.inline.} =
  ## Get the button ID from a click recognizer.
  ## Equivalent to C function `click_recognizer_get_button_id(recognizer)`.
  ffi.click_recognizer_get_button_id(recognizer)

proc numberOfClicksIncludingThisOne*(recognizer: ClickRecognizerRef): uint8 {.inline.} =
  ## Get the number of clicks so far in a multi-click sequence.
  ## Equivalent to C function `click_number_of_clicks_counted(recognizer)`.
  ffi.click_number_of_clicks_counted(recognizer)

proc isRepeating*(recognizer: ClickRecognizerRef): bool {.inline.} =
  ## Check if this click is a repeating click.
  ## Equivalent to C function `click_recognizer_is_repeating(recognizer)`.
  ffi.click_recognizer_is_repeating(recognizer)

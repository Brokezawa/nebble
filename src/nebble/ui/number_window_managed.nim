## ARC-Managed NumberWindow Handle
##
## Simple unique-ownership wrapper around NumberWindow objects.

import nebble/ffi
import nebble/ffi/managed
import nebble/ui/number_window

# Define the managed handle
DefineUniqueHandle(NumberWindow, NumberWindow,
                  number_window_create, number_window_destroy)

# Constructors
proc newNumberWindowHandle*(label: cstring; callbacks: NumberWindowCallbacks; context: pointer): NumberWindowHandle {.inline.} =
  ## Create a managed NumberWindow.
  result = NumberWindowHandle(number_window_create(label, callbacks, context))

# Property accessors
proc `label=`*(h: NumberWindowHandle, lbl: cstring) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  number_window_set_label(h.toPtr, lbl)

proc `max=`*(h: NumberWindowHandle, mx: int32) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  number_window_set_max(h.toPtr, mx)

proc `min=`*(h: NumberWindowHandle, mn: int32) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  number_window_set_min(h.toPtr, mn)

proc `value=`*(h: NumberWindowHandle, v: int32) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  number_window_set_value(h.toPtr, v)

proc value*(h: NumberWindowHandle): int32 {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  number_window_get_value(h.toPtr)

proc `stepSize=`*(h: NumberWindowHandle, step: int32) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  number_window_set_step_size(h.toPtr, step)

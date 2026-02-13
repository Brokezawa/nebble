## ARC-Managed Smartstrap Attribute Handle & Service API
##
## Unique-ownership wrapper for SmartstrapAttribute objects used for reading/writing
## accessory attributes, plus general service management.

import nebble/ffi
import nebble/ffi/managed

# Re-export commonly used types
export ffi.SmartstrapHandlers, ffi.SmartstrapResult, ffi.SmartstrapServiceId, ffi.SmartstrapAttributeId, ffi.SmartstrapAttribute

# ============================================================================
# Smartstrap Service (Global)
# ============================================================================

when declared(ffi.smartstrap_subscribe):
  proc subscribe*(handlers: SmartstrapHandlers): SmartstrapResult {.inline.} =
    ## Subscribe to smartstrap events.
    ## Equivalent to C function `smartstrap_subscribe(handlers)`.
    ffi.smartstrap_subscribe(handlers)

when declared(ffi.smartstrap_unsubscribe):
  proc unsubscribe*() {.inline.} =
    ## Unsubscribe from smartstrap events.
    ## Equivalent to C function `smartstrap_unsubscribe()`.
    ffi.smartstrap_unsubscribe()

when declared(ffi.smartstrap_set_timeout):
  proc setTimeout*(timeoutMs: uint16) {.inline.} =
    ## Set the smartstrap communication timeout in milliseconds.
    ## Equivalent to C function `smartstrap_set_timeout(timeout_ms)`.
    ffi.smartstrap_set_timeout(timeoutMs)

when declared(ffi.smartstrap_service_is_available):
  proc serviceIsAvailable*(serviceId: SmartstrapServiceId): bool {.inline.} =
    ## Check if a smartstrap service is available.
    ## Equivalent to C function `smartstrap_service_is_available(service_id)`.
    ffi.smartstrap_service_is_available(serviceId)

# ============================================================================
# Managed Attribute Handle
# ============================================================================

# Define handle
DefineUniqueHandle(SmartstrapAttribute, SmartstrapAttribute,
                  smartstrap_attribute_create, smartstrap_attribute_destroy)

# Constructors
proc newSmartstrapAttributeHandle*(serviceId: SmartstrapServiceId; attributeId: SmartstrapAttributeId; size: uint16): SmartstrapAttributeHandle {.inline.} =
  ## Create a new managed SmartstrapAttribute.
  result = wrapOwned(ffi.smartstrap_attribute_create(serviceId, attributeId, size))

proc newAttribute*(serviceId: SmartstrapServiceId; attributeId: SmartstrapAttributeId; size: uint16): SmartstrapAttributeHandle {.inline.} =
  ## Alias for `newSmartstrapAttributeHandle`.
  result = newSmartstrapAttributeHandle(serviceId, attributeId, size)

# Accessors
proc serviceId*(h: SmartstrapAttributeHandle): SmartstrapServiceId {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  smartstrap_attribute_get_service_id(h.toPtr)

proc attributeId*(h: SmartstrapAttributeHandle): SmartstrapAttributeId {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  smartstrap_attribute_get_attribute_id(h.toPtr)

proc read*(h: SmartstrapAttributeHandle): SmartstrapResult {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  smartstrap_attribute_read(h.toPtr)

# Writing helpers (begin/end) - expose low-level API as-is
proc beginWrite*(h: SmartstrapAttributeHandle, bufferPtr: ptr ptr uint8, bufferLenPtr: ptr csize_t): SmartstrapResult {.inline.} =
  ## Begin a write operation. The FFI expects a pointer to a buffer pointer
  ## and a pointer to a size value which it will fill in with the available
  ## space. This wrapper forwards the low-level call.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  smartstrap_attribute_begin_write(h.toPtr, bufferPtr, bufferLenPtr)

proc endWrite*(h: SmartstrapAttributeHandle, bytesWritten: uint16, commit: bool) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  discard smartstrap_attribute_end_write(h.toPtr, bytesWritten, commit)

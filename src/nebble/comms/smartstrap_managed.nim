## ARC-Managed Smartstrap Attribute Handle
##
## Unique-ownership wrapper for SmartstrapAttribute objects used for reading/writing
## accessory attributes.

import nebble/ffi
import nebble/ffi/managed
import nebble/comms/smartstrap

# Define handle
DefineUniqueHandle(SmartstrapAttribute, SmartstrapAttribute,
                  smartstrap_attribute_create, smartstrap_attribute_destroy)

# Constructors
proc newSmartstrapAttributeHandle*(serviceId: SmartstrapServiceId; attributeId: SmartstrapAttributeId; size: uint16): SmartstrapAttributeHandle {.inline.} =
  result = SmartstrapAttributeHandle(smartstrap_attribute_create(serviceId, attributeId, size))

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

## High-level Nim wrapper for Pebble Smartstrap API.
##
## Provides communication with external hardware accessories via the smartstrap port.

import nebble/ffi

# Re-export commonly used types
export ffi.SmartstrapHandlers, ffi.SmartstrapResult, ffi.SmartstrapServiceId, ffi.SmartstrapAttributeId, ffi.SmartstrapAttribute

# ============================================================================
# Smartstrap Subscription
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

# ============================================================================
# Smartstrap Attribute Management
# ============================================================================

when declared(ffi.smartstrap_attribute_create):
  proc newAttribute*(serviceId: SmartstrapServiceId, attributeId: SmartstrapAttributeId,
                     size: uint16): ptr SmartstrapAttribute {.inline.} =
    ## Create a smartstrap attribute.
    ## Equivalent to C function `smartstrap_attribute_create(service_id, attribute_id, size)`.
    ## Returns an attribute pointer, or NULL on failure.
    ffi.smartstrap_attribute_create(serviceId, attributeId, size)

when declared(ffi.smartstrap_attribute_destroy):
  proc destroy*(attribute: ptr SmartstrapAttribute) {.inline.} =
    ## Destroy a smartstrap attribute and free resources.
    ## Equivalent to C function `smartstrap_attribute_destroy(attribute)`.
    ffi.smartstrap_attribute_destroy(attribute)

when declared(ffi.smartstrap_service_is_available):
  proc serviceIsAvailable*(serviceId: SmartstrapServiceId): bool {.inline.} =
    ## Check if a smartstrap service is available.
    ## Equivalent to C function `smartstrap_service_is_available(service_id)`.
    ffi.smartstrap_service_is_available(serviceId)

when declared(ffi.smartstrap_attribute_get_service_id):
  proc getServiceId*(attribute: ptr SmartstrapAttribute): SmartstrapServiceId {.inline.} =
    ## Get the service ID of a smartstrap attribute.
    ## Equivalent to C function `smartstrap_attribute_get_service_id(attribute)`.
    ffi.smartstrap_attribute_get_service_id(attribute)

when declared(ffi.smartstrap_attribute_get_attribute_id):
  proc getAttributeId*(attribute: ptr SmartstrapAttribute): SmartstrapAttributeId {.inline.} =
    ## Get the attribute ID of a smartstrap attribute.
    ## Equivalent to C function `smartstrap_attribute_get_attribute_id(attribute)`.
    ffi.smartstrap_attribute_get_attribute_id(attribute)

# ============================================================================
# Smartstrap Read/Write Operations
# ============================================================================

when declared(ffi.smartstrap_attribute_read):
  proc read*(attribute: ptr SmartstrapAttribute): SmartstrapResult {.inline.} =
    ## Read from a smartstrap attribute.
    ## Equivalent to C function `smartstrap_attribute_read(attribute)`.
    ffi.smartstrap_attribute_read(attribute)

when declared(ffi.smartstrap_attribute_begin_write):
  # FIXME: Signature mismatch - FFI expects (ptr ptr uint8, ptr csize_t) not (ptr uint8, uint16)
  # proc beginWrite*(attribute: ptr SmartstrapAttribute, buffer: ptr uint8, size: uint16): SmartstrapResult {.inline.} =
  #   ## Begin writing to a smartstrap attribute.
  #   ## Equivalent to C function `smartstrap_attribute_begin_write(attribute, buffer, size)`.
  #   ffi.smartstrap_attribute_begin_write(attribute, buffer, size)
  discard

when declared(ffi.smartstrap_attribute_end_write):
  proc endWrite*(attribute: ptr SmartstrapAttribute, bytesWritten: uint16,
                 commit: bool): SmartstrapResult {.inline.} =
    ## End writing to a smartstrap attribute.
    ## Equivalent to C function `smartstrap_attribute_end_write(attribute, bytes_written, commit)`.
    ffi.smartstrap_attribute_end_write(attribute, bytesWritten, commit)

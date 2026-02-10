## High-level Nim wrapper for Pebble Resources API.
##
## Provides access to app resources (bitmaps, fonts, raw data) stored in the
## app bundle.

import nebble/ffi

# ============================================================================
# Resource Handles
# ============================================================================

proc getResourceHandle*(resourceId: uint32): ResHandle {.inline.} =
  ## Get a handle to a resource by its ID.
  ## Equivalent to C function `resource_get_handle(resource_id)`.
  ## 
  ## Resource IDs are generated at build time from package.json and defined
  ## as RESOURCE_ID_* constants.
  resource_get_handle(resourceId)

proc size*(handle: ResHandle): csize_t {.inline.} =
  ## Get the size of a resource in bytes.
  ## Equivalent to C function `resource_size(h)`.
  resource_size(handle)

# ============================================================================
# Resource Loading
# ============================================================================

proc load*(handle: ResHandle, buffer: ptr uint8, maxLength: csize_t): csize_t {.inline.} =
  ## Load resource data into a buffer.
  ## Equivalent to C function `resource_load(h, buffer, max_length)`.
  ## Returns the number of bytes loaded.
  resource_load(handle, buffer, maxLength)

proc loadByteRange*(handle: ResHandle, startOffset: uint32, buffer: ptr uint8,
                    numBytes: csize_t): csize_t {.inline.} =
  ## Load a byte range from a resource.
  ## Equivalent to C function `resource_load_byte_range(h, start_offset, buffer, num_bytes)`.
  ## Returns the number of bytes loaded.
  resource_load_byte_range(handle, startOffset, buffer, numBytes)

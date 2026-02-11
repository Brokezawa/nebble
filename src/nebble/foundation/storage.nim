## High-level Nim wrapper for Pebble Storage API.
##
## Provides persistent key-value storage for app data.

import nebble/ffi

# ============================================================================
# Existence Check
# ============================================================================

proc exists*(key: uint32): bool {.inline.} =
  ## Check if a persistent key exists.
  ## Equivalent to C function `persist_exists(key)`.
  result = ffi.persist_exists(key)

# ============================================================================
# Integer Operations
# ============================================================================

proc readInt*(key: uint32): int32 {.inline.} =
  ## Read a 32-bit integer from persistent storage.
  ## Returns 0 if the key doesn't exist.
  ## Equivalent to C function `persist_read_int(key)`.
  result = ffi.persist_read_int(key)

proc writeInt*(key: uint32, value: int32): cint {.inline.} =
  ## Write a 32-bit integer to persistent storage.
  ## Returns 0 on success, negative on error.
  ## Equivalent to C function `persist_write_int(key, value)`.
  result = ffi.persist_write_int(key, value)

# ============================================================================
# String Operations
# ============================================================================

proc readString*(key: uint32, buffer: cstring, bufferSize: csize_t): cint {.inline.} =
  ## Read a string from persistent storage.
  ## Returns the length of the string, or negative on error.
  ## Equivalent to C function `persist_read_string(key, buffer, buffer_size)`.
  result = ffi.persist_read_string(key, buffer, bufferSize)

proc writeString*(key: uint32, value: cstring): cint {.inline.} =
  ## Write a string to persistent storage.
  ## Returns the length written, or negative on error.
  ## Equivalent to C function `persist_write_string(key, value)`.
  result = ffi.persist_write_string(key, value)

# ============================================================================
# Data Operations
# ============================================================================

proc readData*(key: uint32, buffer: pointer, bufferSize: csize_t): cint {.inline.} =
  ## Read raw data from persistent storage.
  ## Returns the size of the data, or negative on error.
  ## Equivalent to C function `persist_read_data(key, buffer, buffer_size)`.
  result = ffi.persist_read_data(key, buffer, bufferSize)

proc writeData*(key: uint32, data: pointer, size: csize_t): cint {.inline.} =
  ## Write raw data to persistent storage.
  ## Returns the size written, or negative on error.
  ## Equivalent to C function `persist_write_data(key, data, size)`.
  result = ffi.persist_write_data(key, data, size)

# ============================================================================
# Deletion
# ============================================================================

proc delete*(key: uint32): cint {.inline.} =
  ## Delete a key from persistent storage.
  ## Returns 0 on success, negative on error.
  ## Equivalent to C function `persist_delete(key)`.
  result = ffi.persist_delete(key)

# ============================================================================
# Size Information
# ============================================================================

proc getDataSize*(key: uint32): cint {.inline.} =
  ## Get the size of data stored at a key.
  ## Returns the size in bytes, or negative if key doesn't exist.
  ## Equivalent to C function `persist_get_size(key)`.
  result = ffi.persist_get_size(key)

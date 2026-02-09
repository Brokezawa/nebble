## High-level Nim wrapper for Pebble Persistent Storage API.
##
## Provides simple key-value persistent storage across app launches.

import nebble/ffi

# Re-export commonly used types
export ffi.status_t

# ============================================================================
# Storage Query Functions
# ============================================================================

proc exists*(key: uint32): bool {.inline.} =
  ## Check if a key exists in persistent storage.
  ## Equivalent to C function `persist_exists(key)`.
  ffi.persist_exists(key)

proc getSize*(key: uint32): cint {.inline.} =
  ## Get the size of the value stored at the given key.
  ## Equivalent to C function `persist_get_size(key)`.
  ## Returns -1 if the key does not exist.
  ffi.persist_get_size(key)

# ============================================================================
# Read Functions
# ============================================================================

proc readBool*(key: uint32): bool {.inline.} =
  ## Read a boolean value from persistent storage.
  ## Equivalent to C function `persist_read_bool(key)`.
  ffi.persist_read_bool(key)

proc readInt*(key: uint32): int32 {.inline.} =
  ## Read a signed 32-bit integer from persistent storage.
  ## Equivalent to C function `persist_read_int(key)`.
  ffi.persist_read_int(key)

proc readData*(key: uint32, buffer: pointer, bufferSize: csize_t): cint {.inline.} =
  ## Read binary data from persistent storage.
  ## Equivalent to C function `persist_read_data(key, buffer, buffer_size)`.
  ## Returns the number of bytes read, or -1 on error.
  ffi.persist_read_data(key, buffer, bufferSize)

proc readString*(key: uint32, buffer: cstring, bufferSize: csize_t): cint {.inline.} =
  ## Read a C string from persistent storage.
  ## Equivalent to C function `persist_read_string(key, buffer, buffer_size)`.
  ## Returns the number of bytes read, or -1 on error.
  ffi.persist_read_string(key, buffer, bufferSize)

# ============================================================================
# Write Functions
# ============================================================================

proc writeBool*(key: uint32, value: bool): status_t {.inline.} =
  ## Write a boolean value to persistent storage.
  ## Equivalent to C function `persist_write_bool(key, value)`.
  ffi.persist_write_bool(key, value)

proc writeInt*(key: uint32, value: int32): status_t {.inline.} =
  ## Write a signed 32-bit integer to persistent storage.
  ## Equivalent to C function `persist_write_int(key, value)`.
  ffi.persist_write_int(key, value)

proc writeData*(key: uint32, data: pointer, size: csize_t): cint {.inline.} =
  ## Write binary data to persistent storage.
  ## Equivalent to C function `persist_write_data(key, data, size)`.
  ## Returns the number of bytes written, or -1 on error.
  ffi.persist_write_data(key, data, size)

proc writeString*(key: uint32, cstring: cstring): cint {.inline.} =
  ## Write a C string to persistent storage.
  ## Equivalent to C function `persist_write_string(key, cstring)`.
  ## Returns the number of bytes written, or -1 on error.
  ffi.persist_write_string(key, cstring)

# ============================================================================
# Delete Function
# ============================================================================

proc delete*(key: uint32): status_t {.inline.} =
  ## Delete a value from persistent storage.
  ## Equivalent to C function `persist_delete(key)`.
  ffi.persist_delete(key)

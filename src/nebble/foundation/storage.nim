## High-level Nim wrapper for Pebble Storage API.
##
## Provides persistent key-value storage for app data.

import nebble/ffi
import nebble/util/fixed_strings

type PersistStatus* = int32
  ## Status code returned by storage operations.
  ## 0 indicates success, negative values indicate errors.

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

proc writeInt*(key: uint32, value: int32): PersistStatus {.inline.} =
  ## Write a 32-bit integer to persistent storage.
  ## Returns 0 on success, negative on error.
  ## Equivalent to C function `persist_write_int(key, value)`.
  result = ffi.persist_write_int(key, value)

# ============================================================================
# String Operations
# ============================================================================

proc readString*(key: uint32, buffer: pointer, bufferSize: csize_t): PersistStatus {.inline.} =
  ## Read a string from persistent storage.
  ## Returns the length of the string, or negative on error.
  ## Equivalent to C function `persist_read_string(key, buffer, buffer_size)`.
  if buffer == nil: return -1
  result = ffi.persist_read_string(key, cast[cstring](buffer), bufferSize)

proc writeString*(key: uint32, value: cstring): PersistStatus {.inline.} =
  ## Write a string to persistent storage.
  ## Returns the length written, or negative on error.
  ## Equivalent to C function `persist_write_string(key, value)`.
  if value == nil: return -1
  result = ffi.persist_write_string(key, value)

proc read*[N](key: uint32, s: var FixedString[N]): PersistStatus {.inline.} =
  ## Read a string from persistent storage into a FixedString.
  ## Returns the length of the string, or negative on error.
  let res = ffi.persist_read_string(key, s.cstr, N.csize_t)
  if res > 0:
    # persist_read_string returns length including NULL terminator
    s.len = min(res.int - 1, N - 1)
    s.data[s.len] = '\0' # Ensure null termination
  elif res == 0:
    s.clear()
  result = res

proc write*[N](key: uint32, s: FixedString[N]): PersistStatus {.inline.} =
  ## Write a FixedString to persistent storage.
  ## Returns the length written, or negative on error.
  result = ffi.persist_write_string(key, s.cstr)

# ============================================================================
# Data Operations
# ============================================================================

proc readData*(key: uint32, buffer: pointer, bufferSize: csize_t): PersistStatus {.inline.} =
  ## Read raw data from persistent storage.
  ## Returns the size of the data, or negative on error.
  ## Equivalent to C function `persist_read_data(key, buffer, buffer_size)`.
  result = ffi.persist_read_data(key, buffer, bufferSize)

proc writeData*(key: uint32, data: pointer, size: csize_t): PersistStatus {.inline.} =
  ## Write raw data to persistent storage.
  ## Returns the size written, or negative on error.
  ## Equivalent to C function `persist_write_data(key, data, size)`.
  result = ffi.persist_write_data(key, data, size)

# ============================================================================
# Deletion
# ============================================================================

proc delete*(key: uint32): PersistStatus {.inline.} =
  ## Delete a key from persistent storage.
  ## Returns 0 on success, negative on error.
  ## Equivalent to C function `persist_delete(key)`.
  result = ffi.persist_delete(key)

# ============================================================================
# Size Information
# ============================================================================

proc getDataSize*(key: uint32): PersistStatus {.inline.} =
  ## Get the size of data stored at a key.
  ## Returns the size in bytes, or negative if key doesn't exist.
  ## Equivalent to C function `persist_get_size(key)`.
  result = ffi.persist_get_size(key)

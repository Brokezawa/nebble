## High-level Nim wrapper for Pebble UUID API.
##
## Provides UUID comparison and string conversion.

import nebble/ffi

# ============================================================================
# UUID Operations
# ============================================================================

proc `==`*(uuid1: Uuid, uuid2: Uuid): bool {.inline.} =
  ## Check if two UUIDs are equal.
  ## Equivalent to C function `uuid_equal(&uuid1, &uuid2)`.
  ffi.uuid_equal(unsafeAddr uuid1, unsafeAddr uuid2)

proc `$`*(uuid: Uuid): string =
  ## Convert a UUID to its string representation (36 chars + null).
  ## Equivalent to C function `uuid_to_string(&uuid, buffer)`.
  var buffer: array[37, char] # 36 chars + null terminator
  ffi.uuid_to_string(unsafeAddr uuid, cast[cstring](addr buffer[0]))
  result = $cast[cstring](addr buffer[0])

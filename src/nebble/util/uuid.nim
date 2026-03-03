## High-level Nim wrapper for Pebble UUID utilities.
##
## Provides UUID creation and manipulation functions.

import nebble/ffi
import fixed_strings

export ffi.Uuid

# ============================================================================
# UUID Constructors
# ============================================================================

proc makeUuid*(bytes: array[16, uint8]): Uuid {.inline.} =
  ## Create a UUID from a 16-byte array.
  ## Copies the byte array into the UUID struct.
  for i in 0..15:
    result.byte0 = bytes[0]
    result.byte1 = bytes[1]
    result.byte2 = bytes[2]
    result.byte3 = bytes[3]
    result.byte4 = bytes[4]
    result.byte5 = bytes[5]
    result.byte6 = bytes[6]
    result.byte7 = bytes[7]
    result.byte8 = bytes[8]
    result.byte9 = bytes[9]
    result.byte10 = bytes[10]
    result.byte11 = bytes[11]
    result.byte12 = bytes[12]
    result.byte13 = bytes[13]
    result.byte14 = bytes[14]
    result.byte15 = bytes[15]

proc makeUuidFromBEBytes*(bytes: array[16, uint8]): Uuid {.inline.} =
  ## Create a UUID from big-endian byte array.
  ## Same as makeUuid - UUIDs are stored in network byte order.
  makeUuid(bytes)

proc makeUuidFromLEBytes*(bytes: array[16, uint8]): Uuid {.inline.} =
  ## Create a UUID from little-endian byte array.
  ## Reverses the byte order to convert to network byte order.
  var beBytes: array[16, uint8]
  for i in 0..15:
    beBytes[i] = bytes[15 - i]
  makeUuid(beBytes)

# ============================================================================
# UUID String Conversion
# ============================================================================

proc toString*[N](uuid: Uuid, s: var FixedString[N]) {.inline.} =
  ## Convert UUID to string representation.
  ##
  ## Format: {12345678-1234-5678-1234-567812345678}
  ##
  ## Automatically updates len field. Output is constant 38 characters
  ## (plus null terminator = 39 total), so len is set to 38 directly (O(1)).
  ##
  ## Requires buffer of at least 39 bytes (UUID_STRING_BUFFER_LENGTH).
  ##
  ## Example:
  ##   var uuidBuf: FixedString[39]
  ##   myUuid.toString(uuidBuf)
  ##   textLayer.text = uuidBuf.cstr
  doAssert N >= 39, "Buffer must be at least 39 bytes for UUID string"
  ffi.uuid_to_string(addr uuid, cast[cstring](addr s.data[0]))
  # Constant length: 38 chars (UUID_STRING_BUFFER_LENGTH - 1)
  s.len = min(38, N - 1)

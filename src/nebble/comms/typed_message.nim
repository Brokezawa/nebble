## Type-safe PebbleKit JS message keys
##
## This module provides type-safe wrappers for AppMessage when using
## auto-generated message keys from nebble.json.
##
## Example:
##   import nebble/comms/typed_message
##   
##   # With generated keys:
##   # type AppMessageKey = enum amkCommand = 0, amkData = 1
##   
##   # Send data with type safety
##   send(amkCommand, 42'i32)
##   send(amkData, "Hello from Pebble")
##   
##   # Read with type safety  
##   let cmd = readInt32(iter, amkCommand)

import ./message
import ../util/fixed_strings

# Re-export types from message module
type
  AppMessageResult* = message.AppMessageResult
  DictionaryIterator* = message.DictionaryIterator
  Tuplet* = message.Tuple_f
  DictionaryResult* = message.DictionaryResult
  InboxReceivedCallback* = message.AppMessageInboxReceived
  InboxDroppedCallback* = message.AppMessageInboxDropped
  OutboxSentCallback* = message.AppMessageOutboxSent
  OutboxFailedCallback* = message.AppMessageOutboxFailed
  OutboxResult* = message.OutboxResult

# Re-export high-level API
export beginOutbox

# Type-safe send operations
# Note: These require calling outboxBegin first to get the iterator
# Usage:
#   var iter: ptr DictionaryIterator
#   discard outboxBegin(addr iter)
#   send(iter, amkCommand, 42'i32)
#   discard outboxSend()

template send*(iter: ptr DictionaryIterator, key: typed, value: int8) =
  ## Send an int8 value with the specified key
  discard message.dictWriteInt8(iter, key.uint32, value)

template send*(iter: ptr DictionaryIterator, key: typed, value: int16) =
  ## Send an int16 value with the specified key
  discard message.dictWriteInt16(iter, key.uint32, value)

template send*(iter: ptr DictionaryIterator, key: typed, value: int32) =
  ## Send an int32 value with the specified key
  discard message.dictWriteInt32(iter, key.uint32, value)

template send*(iter: ptr DictionaryIterator, key: typed, value: uint8) =
  ## Send a uint8 value with the specified key
  discard message.dictWriteUint8(iter, key.uint32, value)

template send*(iter: ptr DictionaryIterator, key: typed, value: uint16) =
  ## Send a uint16 value with the specified key
  discard message.dictWriteUint16(iter, key.uint32, value)

template send*(iter: ptr DictionaryIterator, key: typed, value: uint32) =
  ## Send a uint32 value with the specified key
  discard message.dictWriteUint32(iter, key.uint32, value)

template send*(iter: ptr DictionaryIterator, key: typed, value: cstring) =
  ## Send a string value with the specified key
  discard message.dictWriteCstring(iter, key.uint32, value)

template send*[N](iter: ptr DictionaryIterator, key: typed, value: FixedString[N]) =
  ## Send a FixedString value with the specified key
  discard message.dictWriteCstring(iter, key.uint32, value.cstr)

# Type-safe send operations with error checking
# These return the DictionaryResult code for error handling
template sendChecked*(iter: ptr DictionaryIterator, key: typed, value: int8): DictionaryResult =
  ## Send an int8 value with the specified key, returning the result code
  message.dictWriteInt8(iter, key.uint32, value)

template sendChecked*(iter: ptr DictionaryIterator, key: typed, value: int16): DictionaryResult =
  ## Send an int16 value with the specified key, returning the result code
  message.dictWriteInt16(iter, key.uint32, value)

template sendChecked*(iter: ptr DictionaryIterator, key: typed, value: int32): DictionaryResult =
  ## Send an int32 value with the specified key, returning the result code
  message.dictWriteInt32(iter, key.uint32, value)

template sendChecked*(iter: ptr DictionaryIterator, key: typed, value: uint8): DictionaryResult =
  ## Send a uint8 value with the specified key, returning the result code
  message.dictWriteUint8(iter, key.uint32, value)

template sendChecked*(iter: ptr DictionaryIterator, key: typed, value: uint16): DictionaryResult =
  ## Send a uint16 value with the specified key, returning the result code
  message.dictWriteUint16(iter, key.uint32, value)

template sendChecked*(iter: ptr DictionaryIterator, key: typed, value: uint32): DictionaryResult =
  ## Send a uint32 value with the specified key, returning the result code
  message.dictWriteUint32(iter, key.uint32, value)

template sendChecked*(iter: ptr DictionaryIterator, key: typed, value: cstring): DictionaryResult =
  ## Send a string value with the specified key, returning the result code
  message.dictWriteCstring(iter, key.uint32, value)

template sendChecked*[N](iter: ptr DictionaryIterator, key: typed, value: FixedString[N]): DictionaryResult =
  ## Send a FixedString value with the specified key, returning the result code
  message.dictWriteCstring(iter, key.uint32, value.cstr)

# Type-safe read operations
template readInt8*(iter: ptr DictionaryIterator, key: typed): int8 =
  ## Read an int8 value for the specified key
  message.dictReadInt8(iter, key.uint32)

template readInt16*(iter: ptr DictionaryIterator, key: typed): int16 =
  ## Read an int16 value for the specified key
  message.dictReadInt16(iter, key.uint32)

template readInt32*(iter: ptr DictionaryIterator, key: typed): int32 =
  ## Read an int32 value for the specified key
  message.dictReadInt32(iter, key.uint32)

template readUint8*(iter: ptr DictionaryIterator, key: typed): uint8 =
  ## Read a uint8 value for the specified key
  message.dictReadUint8(iter, key.uint32)

template readUint16*(iter: ptr DictionaryIterator, key: typed): uint16 =
  ## Read a uint16 value for the specified key
  message.dictReadUint16(iter, key.uint32)

template readUint32*(iter: ptr DictionaryIterator, key: typed): uint32 =
  ## Read a uint32 value for the specified key
  message.dictReadUint32(iter, key.uint32)

template readCstring*(iter: ptr DictionaryIterator, key: typed): cstring =
  ## Read a cstring value for the specified key
  message.dictReadCstring(iter, key.uint32)

# Utility operations
template key*(k: typed): int =
  ## Get the integer value of a message key
  k.int

template size*(iter: ptr DictionaryIterator): uint32 =
  ## Get the serialized size of the dictionary
  message.size(iter)

template rewind*(iter: ptr DictionaryIterator) =
  ## Rewind the dictionary iterator
  message.dictRewind(iter)

# Lifecycle operations
proc open*(inboxSize: uint32, outboxSize: uint32): AppMessageResult {.inline.} =
  ## Open the AppMessage service with specified buffer sizes
  message.open(inboxSize, outboxSize)

proc close*() {.inline.} =
  ## Close the AppMessage service
  message.deregisterCallbacks()

# Callback registration
template onInboxReceived*(handler: InboxReceivedCallback) =
  ## Register callback for incoming messages
  discard message.registerInboxReceived(handler)

template onInboxDropped*(handler: InboxDroppedCallback) =
  ## Register callback for dropped messages
  discard message.registerInboxDropped(handler)

template onOutboxSent*(handler: OutboxSentCallback) =
  ## Register callback for sent messages
  discard message.registerOutboxSent(handler)

template onOutboxFailed*(handler: OutboxFailedCallback) =
  ## Register callback for failed sends
  discard message.registerOutboxFailed(handler)

# Constants (proxied as templates to avoid compile-time evaluation of importc)
template inboxSizeMaximum*(): uint32 = message.inboxSizeMaximum()
template outboxSizeMaximum*(): uint32 = message.outboxSizeMaximum()

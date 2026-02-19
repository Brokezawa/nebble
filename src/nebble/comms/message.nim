## High-level Nim wrapper for Pebble AppMessage API.
##
## Provides communication between the watch app and phone app via dictionary-based messages.

import nebble/ffi

# Re-export commonly used types
export ffi.AppMessageResult, ffi.DictionaryIterator, ffi.Tuple_f, ffi.DictionaryResult
export ffi.AppMessageInboxReceived, ffi.AppMessageInboxDropped
export ffi.AppMessageOutboxSent, ffi.AppMessageOutboxFailed

template APP_MSG_OK*(): AppMessageResult = ffi.APP_MSG_OK
template DICT_OK*(): DictionaryResult = ffi.DICT_OK

# ============================================================================
# AppMessage Lifecycle
# ============================================================================

proc open*(sizeInbound: uint32, sizeOutbound: uint32): AppMessageResult {.inline.} =
  ## Open AppMessage communication with specified buffer sizes.
  ## Equivalent to C function `app_message_open(size_inbound, size_outbound)`.
  ffi.app_message_open(sizeInbound, sizeOutbound)

proc deregisterCallbacks*() {.inline.} =
  ## Deregister all AppMessage callbacks.
  ## Equivalent to C function `app_message_deregister_callbacks()`.
  ffi.app_message_deregister_callbacks()

# ============================================================================
# Context Management
# ============================================================================

proc context*(): pointer {.inline.} =
  ## Get the AppMessage context pointer.
  ## Equivalent to C function `app_message_get_context()`.
  ffi.app_message_get_context()

proc `context=`*(context: pointer): pointer {.inline.} =
  ## Set the AppMessage context pointer.
  ## Equivalent to C function `app_message_set_context(context)`.
  ## Returns the previous context.
  ffi.app_message_set_context(context)

# ============================================================================
# Callback Registration
# ============================================================================

proc registerInboxReceived*(callback: AppMessageInboxReceived): AppMessageInboxReceived {.inline.} =
  ## Register callback for received messages.
  ## Equivalent to C function `app_message_register_inbox_received(received_callback)`.
  ## Returns the previous callback.
  ffi.app_message_register_inbox_received(callback)

proc registerInboxDropped*(callback: AppMessageInboxDropped): AppMessageInboxDropped {.inline.} =
  ## Register callback for dropped inbox messages.
  ## Equivalent to C function `app_message_register_inbox_dropped(dropped_callback)`.
  ## Returns the previous callback.
  ffi.app_message_register_inbox_dropped(callback)

proc registerOutboxSent*(callback: AppMessageOutboxSent): AppMessageOutboxSent {.inline.} =
  ## Register callback for successfully sent messages.
  ## Equivalent to C function `app_message_register_outbox_sent(sent_callback)`.
  ## Returns the previous callback.
  ffi.app_message_register_outbox_sent(callback)

proc registerOutboxFailed*(callback: AppMessageOutboxFailed): AppMessageOutboxFailed {.inline.} =
  ## Register callback for failed outbox messages.
  ## Equivalent to C function `app_message_register_outbox_failed(failed_callback)`.
  ## Returns the previous callback.
  ffi.app_message_register_outbox_failed(callback)

# ============================================================================
# Buffer Size Queries
# ============================================================================

proc inboxSizeMaximum*(): uint32 {.inline.} =
  ## Get the maximum inbox buffer size.
  ## Equivalent to C function `app_message_inbox_size_maximum()`.
  ffi.app_message_inbox_size_maximum()

proc outboxSizeMaximum*(): uint32 {.inline.} =
  ## Get the maximum outbox buffer size.
  ## Equivalent to C function `app_message_outbox_size_maximum()`.
  ffi.app_message_outbox_size_maximum()

# ============================================================================
# Outbox Operations
# ============================================================================

proc outboxBegin*(iter: ptr ptr DictionaryIterator): AppMessageResult
  {.inline, deprecated: "Use beginOutbox() for a safer Result-based API".} =
  ## Begin building an outbox message.
  ## Deprecated: Use `beginOutbox()` which provides a Result-based API
  ## that doesn't require manual pointer management.
  ffi.app_message_outbox_begin(iter)

proc outboxSend*(): AppMessageResult {.inline.} =
  ## Send the current outbox message.
  ## Equivalent to C function `app_message_outbox_send()`.
  ffi.app_message_outbox_send()

# ============================================================================
# Dictionary Operations
# ============================================================================

proc size*(iter: ptr DictionaryIterator): uint32 {.inline.} =
  ## Get the size of the dictionary.
  ## Equivalent to C function `dict_size(iter)`.
  ffi.dict_size(iter)

proc dictWriteBegin*(iter: ptr DictionaryIterator, buffer: ptr uint8, size: uint16): DictionaryResult {.inline.} =
  ## Begin writing to a dictionary.
  ## Equivalent to C function `dict_write_begin(iter, buffer, size)`.
  ffi.dict_write_begin(iter, buffer, size)

proc dictWriteData*(iter: ptr DictionaryIterator, key: uint32, data: ptr uint8, size: uint16): DictionaryResult {.inline.} =
  ## Write binary data to the dictionary.
  ## Equivalent to C function `dict_write_data(iter, key, data, size)`.
  ffi.dict_write_data(iter, key, data, size)

proc dictWriteCstring*(iter: ptr DictionaryIterator, key: uint32, cstring: cstring): DictionaryResult {.inline.} =
  ## Write a C string to the dictionary.
  ## Equivalent to C function `dict_write_cstring(iter, key, cstring)`.
  ffi.dict_write_cstring(iter, key, cstring)

proc dictWriteInt*(iter: ptr DictionaryIterator, key: uint32, value: int32): DictionaryResult {.inline.} =
  ## Write a signed 32-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_int(iter, key, &value, 4, true)`.
  var val = value
  ffi.dict_write_int(iter, key, addr val, 4, true)

proc dictWriteUint8*(iter: ptr DictionaryIterator, key: uint32, value: uint8): DictionaryResult {.inline.} =
  ## Write an unsigned 8-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_uint8(iter, key, value)`.
  ffi.dict_write_uint8(iter, key, value)

proc dictWriteUint16*(iter: ptr DictionaryIterator, key: uint32, value: uint16): DictionaryResult {.inline.} =
  ## Write an unsigned 16-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_uint16(iter, key, value)`.
  ffi.dict_write_uint16(iter, key, value)

proc dictWriteUint32*(iter: ptr DictionaryIterator, key: uint32, value: uint32): DictionaryResult {.inline.} =
  ## Write an unsigned 32-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_uint32(iter, key, value)`.
  ffi.dict_write_uint32(iter, key, value)

proc dictWriteInt8*(iter: ptr DictionaryIterator, key: uint32, value: int8): DictionaryResult {.inline.} =
  ## Write a signed 8-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_int8(iter, key, value)`.
  ffi.dict_write_int8(iter, key, value)

proc dictWriteInt16*(iter: ptr DictionaryIterator, key: uint32, value: int16): DictionaryResult {.inline.} =
  ## Write a signed 16-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_int16(iter, key, value)`.
  ffi.dict_write_int16(iter, key, value)

proc dictWriteInt32*(iter: ptr DictionaryIterator, key: uint32, value: int32): DictionaryResult {.inline.} =
  ## Write a signed 32-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_int32(iter, key, value)`.
  ffi.dict_write_int32(iter, key, value)

proc dictWriteEnd*(iter: ptr DictionaryIterator): uint32 {.inline.} =
  ## Finish writing to the dictionary.
  ## Equivalent to C function `dict_write_end(iter)`.
  ffi.dict_write_end(iter)

proc readBeginFromBuffer*(iter: ptr DictionaryIterator, buffer: ptr uint8, size: uint16): auto {.inline.} =
  ## Begin reading from a dictionary buffer.
  ## Equivalent to C function `dict_read_begin_from_buffer(iter, buffer, size)`.
  ffi.dict_read_begin_from_buffer(iter, buffer, size)

proc dictRewind*(iter: ptr DictionaryIterator): ptr Tuple_f {.inline.} =
  ## Rewind the dictionary iterator to the beginning.
  ## Returns the first tuple.
  ffi.dict_read_first(iter)

proc readNext*(iter: ptr DictionaryIterator): ptr Tuple_f {.inline.} =
  ## Read the next tuple from the dictionary.
  ## Equivalent to C function `dict_read_next(iter)`.
  ffi.dict_read_next(iter)

proc readFirst*(iter: ptr DictionaryIterator): ptr Tuple_f {.inline.} =
  ## Read the first tuple from the dictionary.
  ## Equivalent to C function `dict_read_first(iter)`.
  ffi.dict_read_first(iter)

# ============================================================================
# Dictionary Read Helpers
# ============================================================================

proc dictReadInt8*(iter: ptr DictionaryIterator, key: uint32): int8 {.inline.} =
  let t = ffi.dict_find(iter, key)
  if t != nil: return t.anon0.int8
  return 0

proc dictReadInt16*(iter: ptr DictionaryIterator, key: uint32): int16 {.inline.} =
  let t = ffi.dict_find(iter, key)
  if t != nil: return t.anon0.int16
  return 0

proc dictReadInt32*(iter: ptr DictionaryIterator, key: uint32): int32 {.inline.} =
  let t = ffi.dict_find(iter, key)
  if t != nil: return t.anon0.int32
  return 0

proc dictReadUint8*(iter: ptr DictionaryIterator, key: uint32): uint8 {.inline.} =
  let t = ffi.dict_find(iter, key)
  if t != nil: return t.anon0.uint8
  return 0

proc dictReadUint16*(iter: ptr DictionaryIterator, key: uint32): uint16 {.inline.} =
  let t = ffi.dict_find(iter, key)
  if t != nil: return t.anon0.uint16
  return 0

proc dictReadUint32*(iter: ptr DictionaryIterator, key: uint32): uint32 {.inline.} =
  let t = ffi.dict_find(iter, key)
  if t != nil: return t.anon0.uint32
  return 0

proc dictReadCstring*(iter: ptr DictionaryIterator, key: uint32): cstring {.inline.} =
  let t = ffi.dict_find(iter, key)
  if t != nil: return cast[cstring](addr t.anon0.cstring)
  return nil

# ============================================================================
# Dictionary Buffer Helpers
# ============================================================================

proc calcBufferSize*(tupleCount: uint8): uint32 {.inline.} =
  ## Calculate the required buffer size for a dictionary with the given tuple count.
  ## Equivalent to C function `dict_calc_buffer_size(tuple_count)`.
  ffi.dict_calc_buffer_size(tupleCount)

proc find*(iter: ptr DictionaryIterator; key: uint32): ptr Tuple_f {.inline.} =
  ## Find a tuple by key in the dictionary.
  ## Returns nil if not found.
  ## Equivalent to C function `dict_find(iter, key)`.
  ffi.dict_find(iter, key)

# ============================================================================
# High-Level Result-Based API
# ============================================================================

type
  OutboxResult* = object
    ## Result type for outbox operations.
    ## Contains the iterator and operation status.
    success*: bool
    iter*: ptr DictionaryIterator
    error*: AppMessageResult

proc beginOutbox*(): OutboxResult {.inline.} =
  ## Begin building an outbox message using Result-based API.
  ##
  ## Example:
  ##   let outbox = beginOutbox()
  ##   if outbox.success:
  ##     discard dictWriteInt(outbox.iter, key, value)
  ##     discard outboxSend()
  ##
  ## This is the recommended high-level API. The old `outboxBegin` is
  ## deprecated in favor of this Result-based approach.
  var iter: ptr DictionaryIterator
  let res = outboxBegin(addr iter)
  result = OutboxResult(
    success: res == APP_MSG_OK,
    iter: iter,
    error: res
  )

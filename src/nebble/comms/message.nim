## High-level Nim wrapper for Pebble AppMessage API.
##
## Provides communication between the watch app and phone app via dictionary-based messages.

import nebble/ffi

# Re-export commonly used types
export ffi.AppMessageResult, ffi.DictionaryIterator, ffi.Tuple_f, ffi.DictionaryResult
export ffi.AppMessageInboxReceived, ffi.AppMessageInboxDropped
export ffi.AppMessageOutboxSent, ffi.AppMessageOutboxFailed

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

proc outboxBegin*(iter: ptr ptr DictionaryIterator): AppMessageResult {.inline.} =
  ## Begin building an outbox message.
  ## Equivalent to C function `app_message_outbox_begin(iterator)`.
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

proc writeBegin*(iter: ptr DictionaryIterator, buffer: ptr uint8, size: uint16): DictionaryResult {.inline.} =
  ## Begin writing to a dictionary.
  ## Equivalent to C function `dict_write_begin(iter, buffer, size)`.
  ffi.dict_write_begin(iter, buffer, size)

proc writeData*(iter: ptr DictionaryIterator, key: uint32, data: ptr uint8, size: uint16): DictionaryResult {.inline.} =
  ## Write binary data to the dictionary.
  ## Equivalent to C function `dict_write_data(iter, key, data, size)`.
  ffi.dict_write_data(iter, key, data, size)

proc writeCstring*(iter: ptr DictionaryIterator, key: uint32, cstring: cstring): DictionaryResult {.inline.} =
  ## Write a C string to the dictionary.
  ## Equivalent to C function `dict_write_cstring(iter, key, cstring)`.
  ffi.dict_write_cstring(iter, key, cstring)

proc writeInt*(iter: ptr DictionaryIterator, key: uint32, value: int32): DictionaryResult {.inline.} =
  ## Write a signed 32-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_int(iter, key, &value, 4, true)`.
  var val = value
  ffi.dict_write_int(iter, key, addr val, 4, true)

proc writeUint8*(iter: ptr DictionaryIterator, key: uint32, value: uint8): DictionaryResult {.inline.} =
  ## Write an unsigned 8-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_uint8(iter, key, value)`.
  ffi.dict_write_uint8(iter, key, value)

proc writeUint16*(iter: ptr DictionaryIterator, key: uint32, value: uint16): DictionaryResult {.inline.} =
  ## Write an unsigned 16-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_uint16(iter, key, value)`.
  ffi.dict_write_uint16(iter, key, value)

proc writeUint32*(iter: ptr DictionaryIterator, key: uint32, value: uint32): DictionaryResult {.inline.} =
  ## Write an unsigned 32-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_uint32(iter, key, value)`.
  ffi.dict_write_uint32(iter, key, value)

proc writeInt8*(iter: ptr DictionaryIterator, key: uint32, value: int8): DictionaryResult {.inline.} =
  ## Write a signed 8-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_int8(iter, key, value)`.
  ffi.dict_write_int8(iter, key, value)

proc writeInt16*(iter: ptr DictionaryIterator, key: uint32, value: int16): DictionaryResult {.inline.} =
  ## Write a signed 16-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_int16(iter, key, value)`.
  ffi.dict_write_int16(iter, key, value)

proc writeInt32*(iter: ptr DictionaryIterator, key: uint32, value: int32): DictionaryResult {.inline.} =
  ## Write a signed 32-bit integer to the dictionary.
  ## Equivalent to C function `dict_write_int32(iter, key, value)`.
  ffi.dict_write_int32(iter, key, value)

proc writeEnd*(iter: ptr DictionaryIterator): uint32 {.inline.} =
  ## Finish writing to the dictionary.
  ## Equivalent to C function `dict_write_end(iter)`.
  ffi.dict_write_end(iter)

proc readBeginFromBuffer*(iter: ptr DictionaryIterator, buffer: ptr uint8, size: uint16): auto {.inline.} =
  ## Begin reading from a dictionary buffer.
  ## Equivalent to C function `dict_read_begin_from_buffer(iter, buffer, size)`.
  ffi.dict_read_begin_from_buffer(iter, buffer, size)

proc readNext*(iter: ptr DictionaryIterator): ptr Tuple_f {.inline.} =
  ## Read the next tuple from the dictionary.
  ## Equivalent to C function `dict_read_next(iter)`.
  ffi.dict_read_next(iter)

proc readFirst*(iter: ptr DictionaryIterator): ptr Tuple_f {.inline.} =
  ## Read the first tuple from the dictionary.
  ## Equivalent to C function `dict_read_first(iter)`.
  ffi.dict_read_first(iter)

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


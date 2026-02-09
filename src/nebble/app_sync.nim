## High-level Nim wrapper for Pebble AppSync API.
##
## Provides synchronization of dictionary data between phone and watch.

import nebble/ffi

export ffi.AppSync, ffi.AppSyncTupleChangedCallback, ffi.AppSyncErrorCallback
export ffi.Tuplet, ffi.Tuple_f

# ============================================================================
# AppSync
# ============================================================================

proc init*(s: ptr AppSync, buffer: ptr uint8, bufferSize: uint16,
           keysAndInitialValues: ptr Tuplet, count: uint8,
           tupleChangedCallback: AppSyncTupleChangedCallback,
           errorCallback: AppSyncErrorCallback,
           context: pointer) {.inline.} =
  ## Initialize an AppSync synchronization context.
  ## Equivalent to C function `app_sync_init(...)`.
  ffi.app_sync_init(s, buffer, bufferSize, keysAndInitialValues, count,
                    tupleChangedCallback, errorCallback, context)

proc deinit*(s: ptr AppSync) {.inline.} =
  ## Deinitialize an AppSync context.
  ## Equivalent to C function `app_sync_deinit(s)`.
  ffi.app_sync_deinit(s)

proc set*(s: ptr AppSync, keysAndValuesToUpdate: ptr Tuplet,
          count: uint8): AppMessageResult {.inline.} =
  ## Update values in the synchronization context.
  ## Equivalent to C function `app_sync_set(s, keys_and_values, count)`.
  ffi.app_sync_set(s, keysAndValuesToUpdate, count)

proc get*(s: ptr AppSync, key: uint32): ptr Tuple_f {.inline.} =
  ## Get a value from the synchronization context.
  ## Equivalent to C function `app_sync_get(s, key)`.
  ffi.app_sync_get(s, key)

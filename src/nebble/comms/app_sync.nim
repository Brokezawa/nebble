## High-level Nim wrapper for Pebble AppSync API.
##
## Provides synchronization of dictionary data between phone and watch.

import nebble/ffi

export ffi.AppSync, ffi.AppSyncTupleChangedCallback, ffi.AppSyncErrorCallback
export ffi.Tuplet, ffi.Tuple_f

# ============================================================================
# Managed AppSync Handle
# ============================================================================

type
  AppSyncHandle* = object
    ## Managed handle for AppSync.
    ## Automatically handles allocation of the AppSync struct and its internal buffer.
    pRaw: ptr AppSync
    pBuffer: ptr uint8

proc `=destroy`*(h: var AppSyncHandle) =
  if h.pRaw != nil:
    ffi.app_sync_deinit(h.pRaw)
    dealloc(h.pRaw)
  if h.pBuffer != nil:
    dealloc(h.pBuffer)
  h.pRaw = nil
  h.pBuffer = nil

proc `=wasMoved`*(h: var AppSyncHandle) =
  h.pRaw = nil
  h.pBuffer = nil

proc `=copy`*(dest: var AppSyncHandle, src: AppSyncHandle) {.error.} = discard

proc `=sink`*(dest: var AppSyncHandle, src: AppSyncHandle) =
  `=destroy`(dest)
  dest.pRaw = src.pRaw
  dest.pBuffer = src.pBuffer
  var srcPtr = cast[ptr AppSyncHandle](addr src)
  srcPtr.pRaw = nil
  srcPtr.pBuffer = nil

converter toPtr*(h: AppSyncHandle): ptr AppSync = h.pRaw

proc isValid*(h: AppSyncHandle): bool {.inline.} = h.pRaw != nil

# ============================================================================
# AppSync Constructors
# ============================================================================

proc newAppSyncHandle*(bufferSize: uint16,
                      keysAndInitialValues: ptr Tuplet, count: uint8,
                      tupleChangedCallback: AppSyncTupleChangedCallback,
                      errorCallback: AppSyncErrorCallback,
                      context: pointer): AppSyncHandle =
  ## Create a managed AppSync handle.
  ## Allocates both the AppSync struct and the message buffer.
  ## Returns an invalid handle if allocation fails (Out of Memory).
  let pRaw = cast[ptr AppSync](alloc0(sizeof(AppSync)))
  let pBuffer = cast[ptr uint8](alloc0(bufferSize.int))
  
  if pRaw == nil or pBuffer == nil:
    # Cleanup partial allocation if one failed
    if pRaw != nil: dealloc(pRaw)
    if pBuffer != nil: dealloc(pBuffer)
    return AppSyncHandle(pRaw: nil, pBuffer: nil)

  result.pRaw = pRaw
  result.pBuffer = pBuffer
  
  ffi.app_sync_init(result.pRaw, result.pBuffer, bufferSize,
                    keysAndInitialValues, count,
                    tupleChangedCallback, errorCallback, context)

proc newAppSync*(bufferSize: uint16,
                 keysAndInitialValues: ptr Tuplet, count: uint8,
                 tupleChangedCallback: AppSyncTupleChangedCallback,
                 errorCallback: AppSyncErrorCallback,
                 context: pointer): AppSyncHandle =
  ## Alias for `newAppSyncHandle`.
  result = newAppSyncHandle(bufferSize, keysAndInitialValues, count,
                            tupleChangedCallback, errorCallback, context)

# ============================================================================
# AppSync Operations
# ============================================================================

proc set*(h: AppSyncHandle, keysAndValuesToUpdate: ptr Tuplet,
          count: uint8): AppMessageResult {.inline.} =
  ## Update values in the synchronization context.
  if h.pRaw == nil: return APP_MSG_INVALID_ARGS
  return ffi.app_sync_set(h.pRaw, keysAndValuesToUpdate, count)

proc get*(h: AppSyncHandle, key: uint32): ptr Tuple_f {.inline.} =
  ## Get a value from the synchronization context.
  if h.pRaw == nil: return nil
  return ffi.app_sync_get(h.pRaw, key)

# ============================================================================
# Procedural API (Raw Pointers)
# ============================================================================

proc init*(s: ptr AppSync, buffer: ptr uint8, bufferSize: uint16,
           keysAndInitialValues: ptr Tuplet, count: uint8,
           tupleChangedCallback: AppSyncTupleChangedCallback,
           errorCallback: AppSyncErrorCallback,
           context: pointer) {.inline.} =
  ## Initialize an AppSync synchronization context (raw pointer version).
  ffi.app_sync_init(s, buffer, bufferSize, keysAndInitialValues, count,
                    tupleChangedCallback, errorCallback, context)

proc deinit*(s: ptr AppSync) {.inline.} =
  ## Deinitialize an AppSync context (raw pointer version).
  ffi.app_sync_deinit(s)

## High-level Nim wrapper for Pebble Data Logging API.
##
## Provides efficient logging of structured data for later retrieval by companion apps.

import nebble/ffi
import nebble/ffi/managed

# Re-export commonly used types
export ffi.DataLoggingSessionRef, ffi.DataLoggingItemType, ffi.DataLoggingResult

type
  DataLoggingSessionHandle* = object
    ## Managed handle for a data logging session.
    ## Automatically calls `data_logging_finish` on destruction.
    pRaw: DataLoggingSessionRef

proc `=destroy`*(h: var DataLoggingSessionHandle) =
  if h.pRaw != nil:
    ffi.data_logging_finish(h.pRaw)
  h.pRaw = nil

proc `=wasMoved`*(h: var DataLoggingSessionHandle) =
  h.pRaw = nil

proc `=copy`*(dest: var DataLoggingSessionHandle, src: DataLoggingSessionHandle) {.error.} = discard

proc `=sink`*(dest: var DataLoggingSessionHandle, src: DataLoggingSessionHandle) =
  `=destroy`(dest)
  dest.pRaw = src.pRaw
  var srcPtr = cast[ptr DataLoggingSessionHandle](addr src)
  srcPtr.pRaw = nil

converter toPtr*(h: DataLoggingSessionHandle): DataLoggingSessionRef = h.pRaw

proc isValid*(h: DataLoggingSessionHandle): bool {.inline.} = h.pRaw != nil

proc wrapOwned*(p: DataLoggingSessionRef): DataLoggingSessionHandle {.inline.} =
  DataLoggingSessionHandle(pRaw: p)

# ============================================================================
# Data Logging Session Management
# ============================================================================

when declared(ffi.data_logging_create):
  proc newDataLoggingSessionHandle*(tag: uint32, itemType: DataLoggingItemType,
                                   itemLength: uint16, resume: bool): DataLoggingSessionHandle {.inline.} =
    ## Create a new managed data logging session.
    wrapOwned(ffi.data_logging_create(tag, itemType, itemLength, resume))

  proc newDataLoggingSession*(tag: uint32, itemType: DataLoggingItemType,
                              itemLength: uint16, resume: bool): DataLoggingSessionHandle {.inline.} =
    ## Alias for `newDataLoggingSessionHandle`.
    result = newDataLoggingSessionHandle(tag, itemType, itemLength, resume)

when declared(ffi.data_logging_log):
  proc log*(h: DataLoggingSessionHandle,
            data: pointer, numItems: cuint): DataLoggingResult {.inline.} =
    ## Log data items to the logging session.
    if h.pRaw == nil: return DATA_LOGGING_INTERNAL_ERR
    return ffi.data_logging_log(h.pRaw, data, numItems)

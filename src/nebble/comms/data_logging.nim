## High-level Nim wrapper for Pebble Data Logging API.
##
## Provides efficient logging of structured data for later retrieval by companion apps.

import nebble/ffi

# Re-export commonly used types
export ffi.DataLoggingSessionRef, ffi.DataLoggingItemType, ffi.DataLoggingResult

# ============================================================================
# Data Logging Session Management
# ============================================================================

when declared(ffi.data_logging_create):
  proc newDataLoggingSession*(tag: uint32, itemType: DataLoggingItemType,
                              itemLength: uint16, resume: bool): DataLoggingSessionRef {.inline.} =
    ## Create a new data logging session.
    ## Equivalent to C function `data_logging_create(tag, item_type, item_length, resume)`.
    ## Returns a session reference, or NULL on failure.
    ffi.data_logging_create(tag, itemType, itemLength, resume)

when declared(ffi.data_logging_finish):
  proc finish*(loggingSession: DataLoggingSessionRef) {.inline.} =
    ## Finish a data logging session and free resources.
    ## Equivalent to C function `data_logging_finish(logging_session)`.
    ffi.data_logging_finish(loggingSession)

when declared(ffi.data_logging_log):
  proc log*(loggingSession: DataLoggingSessionRef,
            data: pointer, numItems: cuint): DataLoggingResult {.inline.} =
    ## Log data items to the logging session.
    ## Equivalent to C function `data_logging_log(logging_session, data, num_items)`.
    ffi.data_logging_log(loggingSession, data, numItems)

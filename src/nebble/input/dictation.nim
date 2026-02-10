## High-level Nim wrapper for Pebble Dictation API.
##
## Provides voice dictation functionality for text input.

import nebble/ffi

# Re-export commonly used types
export ffi.DictationSession, ffi.DictationSessionStatus, ffi.DictationSessionStatusCallback

# ============================================================================
# Dictation Session Management
# ============================================================================

when declared(ffi.dictation_session_create):
  proc newDictationSession*(bufferSize: uint32, callback: DictationSessionStatusCallback,
                            context: pointer): ptr DictationSession {.inline.} =
    ## Create a new dictation session.
    ## Equivalent to C function `dictation_session_create(buffer_size, callback, context)`.
    ## Returns a session pointer, or NULL on failure.
    ffi.dictation_session_create(bufferSize, callback, context)

when declared(ffi.dictation_session_destroy):
  proc destroy*(session: ptr DictationSession) {.inline.} =
    ## Destroy a dictation session and free resources.
    ## Equivalent to C function `dictation_session_destroy(session)`.
    ffi.dictation_session_destroy(session)

when declared(ffi.dictation_session_start):
  proc start*(session: ptr DictationSession): DictationSessionStatus {.inline.} =
    ## Start the dictation session.
    ## Equivalent to C function `dictation_session_start(session)`.
    ffi.dictation_session_start(session)

when declared(ffi.dictation_session_stop):
  proc stop*(session: ptr DictationSession): DictationSessionStatus {.inline.} =
    ## Stop the dictation session.
    ## Equivalent to C function `dictation_session_stop(session)`.
    ffi.dictation_session_stop(session)

when declared(ffi.dictation_session_enable_confirmation):
  proc enableConfirmation*(session: ptr DictationSession, enabled: bool) {.inline.} =
    ## Enable or disable confirmation dialog after dictation.
    ## Equivalent to C function `dictation_session_enable_confirmation(session, enabled)`.
    ffi.dictation_session_enable_confirmation(session, enabled)

when declared(ffi.dictation_session_enable_error_dialogs):
  proc enableErrorDialogs*(session: ptr DictationSession, enabled: bool) {.inline.} =
    ## Enable or disable error dialogs during dictation.
    ## Equivalent to C function `dictation_session_enable_error_dialogs(session, enabled)`.
    ffi.dictation_session_enable_error_dialogs(session, enabled)

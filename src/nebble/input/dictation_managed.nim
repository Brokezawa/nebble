## ARC-Managed Dictation Session Handle
##
## Lightweight unique-ownership wrapper around DictationSession pointers.

import nebble/ffi
import nebble/ffi/managed
import nebble/input/dictation

# Use the DefineUniqueHandle template to create the handle
DefineUniqueHandle(DictationSession, DictationSession,
                  dictation_session_create, dictation_session_destroy)

# Constructors
proc newDictationSessionHandle*(bufferSize: uint32; callback: DictationSessionStatusCallback; context: pointer): DictationSessionHandle {.inline.} =
  ## Create a new managed DictationSession.
  result = DictationSessionHandle(dictation_session_create(bufferSize, callback, context))

# Control helpers
proc start*(h: DictationSessionHandle): DictationSessionStatus {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  dictation_session_start(h.toPtr)

proc stop*(h: DictationSessionHandle): DictationSessionStatus {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  dictation_session_stop(h.toPtr)

proc enableConfirmation*(h: DictationSessionHandle, enabled: bool) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  dictation_session_enable_confirmation(h.toPtr, enabled)

proc enableErrorDialogs*(h: DictationSessionHandle, enabled: bool) {.inline.} =
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  dictation_session_enable_error_dialogs(h.toPtr, enabled)

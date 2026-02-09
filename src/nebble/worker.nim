## High-level Nim wrapper for Pebble Worker API.
##
## Provides background worker management for running tasks when the app is not active.

import nebble/ffi

# Re-export commonly used types
export ffi.AppWorkerResult, ffi.AppWorkerMessage, ffi.AppWorkerMessageHandler

# ============================================================================
# Worker Lifecycle
# ============================================================================

when declared(ffi.app_worker_is_running):
  proc isRunning*(): bool {.inline.} =
    ## Check if the background worker is currently running.
    ## Equivalent to C function `app_worker_is_running()`.
    ffi.app_worker_is_running()

when declared(ffi.app_worker_launch):
  proc launch*(): AppWorkerResult {.inline.} =
    ## Launch the background worker.
    ## Equivalent to C function `app_worker_launch()`.
    ffi.app_worker_launch()

when declared(ffi.app_worker_kill):
  proc kill*(): AppWorkerResult {.inline.} =
    ## Kill the background worker.
    ## Equivalent to C function `app_worker_kill()`.
    ffi.app_worker_kill()

# ============================================================================
# Worker Messaging
# ============================================================================

when declared(ffi.app_worker_message_subscribe):
  proc subscribe*(handler: AppWorkerMessageHandler): bool {.inline.} =
    ## Subscribe to messages from the background worker.
    ## Equivalent to C function `app_worker_message_subscribe(handler)`.
    ffi.app_worker_message_subscribe(handler)

when declared(ffi.app_worker_message_unsubscribe):
  proc unsubscribe*(): bool {.inline.} =
    ## Unsubscribe from worker messages.
    ## Equivalent to C function `app_worker_message_unsubscribe()`.
    ffi.app_worker_message_unsubscribe()

when declared(ffi.app_worker_send_message):
  proc sendMessage*(type_f: uint8, data: ptr AppWorkerMessage) {.inline.} =
    ## Send a message to the background worker.
    ## Equivalent to C function `app_worker_send_message(type, data)`.
    ffi.app_worker_send_message(type_f, data)

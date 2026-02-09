## High-level Nim wrapper for Pebble System API.
##
## Provides system utilities like sleep, heap info, and launch reasons.

import nebble/ffi

export ffi.AppLaunchReason, ffi.AppExitReason

# ============================================================================
# Sleep
# ============================================================================

proc sleep*(millis: int32) {.inline.} =
  ## Sleep for a specified number of milliseconds.
  ## Equivalent to C function `psleep(millis)`.
  ffi.psleep(millis.cint)

# ============================================================================
# Heap Memory
# ============================================================================

proc heapBytesFree*(): int {.inline.} =
  ## Get the amount of free heap memory in bytes.
  ## Equivalent to C function `heap_bytes_free()`.
  cast[int](ffi.heap_bytes_free())

proc heapBytesUsed*(): int {.inline.} =
  ## Get the amount of used heap memory in bytes.
  ## Equivalent to C function `heap_bytes_used()`.
  cast[int](ffi.heap_bytes_used())

when declared(ffi.memory_cache_flush):
  proc memoryCacheFlush*(start: pointer, size: int) {.inline.} =
    ## Flush the data cache for a specific memory range.
    ## Equivalent to C function `memory_cache_flush(start, size)`.
    ## NOTE: Not available on Aplite.
    ffi.memory_cache_flush(start, cast[csize_t](size))

# ============================================================================
# Launch & Exit
# ============================================================================

proc launchReason*(): AppLaunchReason {.inline.} =
  ## Get the reason the app was launched.
  ## Equivalent to C function `launch_reason()`.
  ffi.launch_reason()

proc launchArgs*(): uint32 {.inline.} =
  ## Get the launch arguments (e.g. from timeline or worker).
  ## Equivalent to C function `launch_get_args()`.
  ffi.launch_get_args()

when declared(ffi.exit_reason_set):
  proc setExitReason*(reason: AppExitReason) {.inline.} =
    ## Set the exit reason for the app.
    ## Equivalent to C function `exit_reason_set(reason)`.
    ## NOTE: Not available on Aplite.
    ffi.exit_reason_set(reason)

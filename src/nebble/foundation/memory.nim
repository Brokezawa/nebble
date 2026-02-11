## High-level Nim wrapper for Pebble Memory Management API.
##
## Provides heap memory statistics and cache control functions.

import nebble/ffi

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

# ============================================================================
# Cache Control
# ============================================================================

when declared(ffi.memory_cache_flush):
  proc memoryCacheFlush*(start: pointer, size: int) {.inline.} =
    ## Flush the data cache for a specific memory range.
    ## Equivalent to C function `memory_cache_flush(start, size)`.
    ## NOTE: Not available on Aplite.
    ffi.memory_cache_flush(start, cast[csize_t](size))

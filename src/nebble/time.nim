## High-level Nim wrapper for Pebble Time API.
##
## Provides functions for getting current time, formatting time, and
## checking clock settings.

import nebble/ffi

export ffi.time_t, ffi.tm

# ============================================================================
# Time Retrieval
# ============================================================================

proc time*(tloc: ptr time_t = nil): time_t {.inline.} =
  ## Get the current time in seconds since epoch.
  ## Equivalent to C function `time(tloc)`.
  ffi.time(tloc)

# proc timeMs*(t: ptr time_t, outMs: ptr uint16): time_t {.inline.} =
#   ## Get the current time in seconds and milliseconds.
#   ## Equivalent to C function `time_ms(t, out_ms)`.
#   ffi.time_ms(t, outMs)

proc timeStartOfToday*(): time_t {.inline.} =
  ## Get the time at midnight of the current day.
  ## Equivalent to C function `time_start_of_today()`.
  ffi.time_start_of_today()

# ============================================================================
# Time Formatting
# ============================================================================

proc clockIs24hStyle*(): bool {.inline.} =
  ## Check if the user has selected 24-hour clock style.
  ## Equivalent to C function `clock_is_24h_style()`.
  ffi.clock_is_24h_style()

# Note: strftime is a standard C library function, but often used in Pebble apps.
# We expose it here for convenience if it's in the FFI, otherwise users import it from C.
# Usually it's available via POSIX headers, but Futhark might have wrapped it.
# If not, we can assume it's available or rely on Nim's times module if cross-compilation supports it.
# However, `times` module often pulls in OS deps.
# Let's see if we can wrap the C strftime if accessible via FFI, or leave it to raw C calls
# since it takes pointers.
# For now, we'll assume users use `ffi.strftime` or similar if they need it,
# or we add a wrapper that takes a buffer.

proc strftime*(s: cstring, max: csize_t, format: cstring, tm: ptr tm): csize_t {.inline.} =
  ## Format date and time.
  ## Equivalent to C function `strftime(s, max, format, tm)`.
  cast[csize_t](ffi.strftime(s, max, format, tm))

proc localtime*(timer: ptr time_t): ptr tm {.inline.} =
  ## Convert time_t to struct tm (local time).
  ## Equivalent to C function `localtime(timer)`.
  ffi.localtime(timer)

proc gmtime*(timer: ptr time_t): ptr tm {.inline.} =
  ## Convert time_t to struct tm (UTC).
  ## Equivalent to C function `gmtime(timer)`.
  ffi.gmtime(timer)

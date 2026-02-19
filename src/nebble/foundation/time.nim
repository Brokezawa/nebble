## High-level Nim wrapper for Pebble Time API.
##
## Provides functions for getting current time, formatting time, and
## checking clock settings.

import nebble/ffi

export ffi.time_t, ffi.tm, ffi.TimeUnits, ffi.TickHandler

# ============================================================================
# Time Retrieval
# ============================================================================

proc time*(tloc: ptr time_t = nil): time_t {.inline.} =
  ## Get the current time in seconds since epoch.
  ## Equivalent to C function `time(tloc)`.
  ffi.time(tloc)

proc timeStartOfToday*(): time_t {.inline.} =
  ## Get the time at midnight of the current day.
  ## Equivalent to C function `time_start_of_today()`.
  ffi.time_start_of_today()

proc getLocalTime*(): ptr tm {.inline.} =
  ## Get the current local time.
  ## Returns a pointer to a static buffer (C-style).
  ##
  ## Example:
  ##   let currentTime = getLocalTime()
  ##   var timeStr: FixedString[16]
  ##   timeStr.formatTime("%H:%M", currentTime)
  var t = time(nil)
  result = localtime(addr t)

# ============================================================================
# Time Formatting
# ============================================================================

proc clockIs24hStyle*(): bool {.inline.} =
  ## Check if the user has selected 24-hour clock style.
  ## Equivalent to C function `clock_is_24h_style()`.
  ffi.clock_is_24h_style()

proc clockIsTimezoneSet*(): bool {.inline.} =
  ## Check if the user has set a timezone.
  ## Equivalent to C function `clock_is_timezone_set()`.
  ffi.clock_is_timezone_set()

proc clockToTimestamp*(day: ffi.WeekDay, hour: int32, minute: int32): time_t {.inline.} =
  ## Calculate a timestamp for the given day/time in the current week.
  ## Equivalent to C function `clock_to_timestamp(day, hour, minute)`.
  ffi.clock_to_timestamp(day, hour.cint, minute.cint)

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

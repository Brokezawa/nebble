## High-level Nim wrapper for Pebble Time API.
##
## Provides functions for getting current time, formatting time, and
## checking clock settings.

import nebble/ffi
import ../util/fixed_strings

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

# ============================================================================
# FixedString Time Formatting
# ============================================================================

proc formatTime*[N](s: var FixedString[N], fmt: cstring, time: ptr tm): int {.inline.} =
  ## Format time using strftime into the FixedString.
  ## Returns the number of characters written (excluding null terminator).
  ##
  ## Complexity: O(1) - uses return value directly, no scanning needed.
  ##
  ## Example:
  ##   var timeStr: FixedString[16]
  ##   timeStr.formatTime("%H:%M", tickTime)
  ##   timeLayer.text = timeStr.cstr
  result = cast[csize_t](ffi.strftime(cast[cstring](addr s.data[0]), N.csize_t, fmt, time)).int
  if result > 0:
    s.len = result
  else:
    s.len = 0
    s.data[0] = '\0'

proc formatTime*[N](s: var FixedString[N], time: ptr tm): int {.inline.} =
  ## Format time using default format ("%H:%M" for 24h or "%I:%M" for 12h).
  ##
  ## Complexity: O(1) - uses return value directly, no scanning needed.
  let fmt = if ffi.clock_is_24h_style(): "%H:%M" else: "%I:%M"
  result = s.formatTime(fmt.cstring, time)

# ============================================================================
# High-Level FixedString Wrappers (Bounded Scan)
# ============================================================================

proc copyTimeString*[N](s: var FixedString[N]) {.inline.} =
  ## Copy current time string into FixedString, formatted according to
  ## user preferences (e.g., "7:30" or "3:30 PM").
  ##
  ## Automatically updates len field with bounded O(n) scan.
  ## Max scan: 12 characters (fits "12:30 PM" + null).
  ##
  ## Example:
  ##   var timeBuf: FixedString[16]
  ##   timeBuf.copyTimeString()
  ##   timeLayer.text = timeBuf.cstr
  ffi.clock_copy_time_string(cast[cstring](addr s.data[0]), N.uint8)
  # Bounded scan: max 12 chars for time string (e.g., "12:30 PM")
  s.len = 0
  let limit = min(N, 12)
  while s.len < limit and s.data[s.len] != '\0':
    inc s.len

proc getTimezone*[N](s: var FixedString[N]) {.inline.} =
  ## Copy timezone name into FixedString (e.g., "America/Chicago").
  ##
  ## Automatically updates len field with bounded O(n) scan.
  ## Max scan: 32 characters (TIMEZONE_NAME_LENGTH constant).
  ##
  ## Example:
  ##   var tzBuf: FixedString[32]
  ##   tzBuf.getTimezone()
  ##   if tzBuf.len > 0:
  ##     textLayer.text = tzBuf.cstr
  ffi.clock_get_timezone(cast[cstring](addr s.data[0]), N.csize_t)
  # Bounded scan: max 32 chars (TIMEZONE_NAME_LENGTH)
  s.len = 0
  let limit = min(N, 32)
  while s.len < limit and s.data[s.len] != '\0':
    inc s.len

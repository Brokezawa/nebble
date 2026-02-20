## Statically allocated, heap-free strings for Pebble.
##
## This module provides a `FixedString[N]` type that stores text in a
## fixed-size array, and a `fmt` macro that performs zero-allocation
## string formatting at runtime.

import std/macros

type
  FixedString*[N: static int] = object
    ## A stack-allocated string with maximum capacity N.
    ## Includes a null-terminator, so actual capacity is N-1.
    len*: int
    data*: array[N, char]

# ============================================================================
# Core Operations
# ============================================================================

proc clear*[N](s: var FixedString[N]) {.inline.} =
  ## Reset the string length to 0.
  s.len = 0
  s.data[0] = '\0'

proc add*[N](s: var FixedString[N], c: char) {.inline.} =
  ## Add a single character to the string.
  if s.len < N - 1:
    s.data[s.len] = c
    s.len.inc
    s.data[s.len] = '\0'

proc add*[N](s: var FixedString[N], str: cstring) {.inline.} =
  ## Add a C-string to the fixed string.
  if str == nil: return
  var i = 0
  while str[i] != '\0' and s.len < N - 1:
    s.data[s.len] = str[i]
    s.len.inc
    i.inc
  s.data[s.len] = '\0'

# ============================================================================
# Number Formatting (Heap-Free)
# ============================================================================

proc addInt*[N](s: var FixedString[N], val: int32) {.inline.} =
  ## Add an integer to the string without heap allocation.
  if s.len >= N - 1: return

  if val == 0:
    s.add '0'
    return

  if val == low(int32):
    s.add "-2147483648"
    return

  var v = val
  if v < 0:
    s.add '-'
    v = -v

  # Temporary buffer for digits (max 10 for int32)
  var digits: array[10, char]
  var count = 0
  while v > 0 and count < 10:
    digits[count] = char(ord('0') + (v mod 10))
    v = v div 10
    count.inc

  # Add digits in reverse order
  for i in countdown(count - 1, 0):
    s.add digits[i]

# ============================================================================
# C-string Access (Template for Safety)
# ============================================================================

template cstr*[N](s: FixedString[N]): cstring =
  ## Get cstring pointer to FixedString data.
  ##
  ## IMPORTANT: Pebble stores this pointer (doesn't copy), so the FixedString
  ## must remain alive as long as the text is displayed. Use global/static
  ## FixedString variables for text that persists.
  ##
  ## Template ensures this operates at the call site without creating a copy.
  ##
  ## Example:
  ##   var timeStr: FixedString[16]  # Global variable
  ##   timeStr.f("12:00")
  ##   timeLayer.text = timeStr.cstr  # Safe - points to global data
  ##
  ## ## Manual FFI Usage
  ## When calling raw FFI functions that write to the buffer, use high-level
  ## wrappers or manually update len afterwards:
  ##
  ##   # Using high-level wrapper (recommended):
  ##   timeStr.formatTime(tickTime)  # len updated automatically (O(1))
  ##
  ##   # Using raw FFI (must update len manually):
  ##   discard ffi.strftime(timeStr.cstr, ...)
  ##   timeStr.recalcLen()  # Recalculate len (O(n) bounded scan)
  ##
  ## See also: `recalcLen` for manual length recalculation.
  cast[cstring](addr s.data[0])

# ============================================================================
# Format Macro (The "fmt" experience)
# ============================================================================

macro formatInto*(s: var FixedString, body: varargs[untyped]): untyped =
  ## Macro to format multiple values into a FixedString.
  ## Expands to a series of s.add and s.addInt calls.
  ##
  ## Example:
  ##   var str: `FixedString[32]`
  ##   str.formatInto("Score: ", score, "/", total)
  result = newStmtList()
  for arg in body:
    if arg.kind == nnkStrLit:
      result.add quote do: `s`.add(`arg`.cstring)
    else:
      # Try to detect if it's an integer or string-like
      # In Pebble context, we mostly care about ints and cstrings
      result.add quote do:
        when `arg` is int|int32|int16|uint8|uint32|uint16:
          `s`.addInt(`arg`.int32)
        else:
          `s`.add(`arg`)

template f*[N](s: var FixedString[N], body: varargs[untyped]) =
  ## Alias for formatInto with auto-clear.
  s.clear()
  s.formatInto(body)

# ============================================================================
# Length Management
# ============================================================================

proc recalcLen*[N](s: var FixedString[N], maxScan: int = N) {.inline.} =
  ## Recalculate len by scanning for null terminator (bounded).
  ##
  ## Use this after calling raw FFI functions directly that write to the buffer.
  ## For high-level wrappers (formatTime, storage.read, etc.), len is updated
  ## automatically.
  ##
  ## Complexity: O(min(maxScan, N)) - bounded scan
  ##
  ## Example:
  ##   # Raw FFI call (not recommended):
  ##   discard ffi.strftime(myStr.cstr, maxSize, "%H:%M", time)
  ##   myStr.recalcLen()  # Update len after raw call
  ##
  ##   # Bounded scan (faster for known-max-length strings):
  ##   myStr.recalcLen(maxScan = 32)  # Scan at most 32 chars
  s.len = 0
  let limit = min(N, maxScan)
  while s.len < limit and s.data[s.len] != '\0':
    inc s.len

proc fromCstring*[N](s: cstring): FixedString[N] =
  ## Creates FixedString from cstring, calculating len once at construction.
  ##
  ## This constructor scans the input once to determine length, then copies
  ## the data. Use when you have a cstring and want O(1) len access afterwards.
  ##
  ## Example:
  ##   var myStr = fromCstring[32](someCstring)
  ##   # myStr.len is now correctly set (O(1) access)
  ##
  ## Complexity: O(min(strlen(s), N)) - one-time scan at construction
  result.clear()
  if s != nil:
    var i = 0
    while i < N - 1 and s[i] != '\0':
      result.data[i] = s[i]
      inc i
    result.len = i
    result.data[i] = '\0'

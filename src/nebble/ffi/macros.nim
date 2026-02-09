## Manual Nim implementations for Pebble SDK C macros that Futhark
## cannot auto-wrap. These are function-like macros defined in pebble.h.
##
## This file is included by the platform selector (src/nebble/ffi.nim)
## after the generated bindings, so all Futhark-generated types are
## available.

# =============================================================================
# Geometry constructors
# =============================================================================

proc makeGPoint*(x, y: int16): GPoint {.inline.} =
  ## Construct a GPoint. Equivalent to C macro `GPoint(x, y)`.
  result.x = x
  result.y = y

proc makeGSize*(w, h: int16): GSize {.inline.} =
  ## Construct a GSize. Equivalent to C macro `GSize(w, h)`.
  result.w = w
  result.h = h

proc makeGRect*(x, y, w, h: int16): GRect {.inline.} =
  ## Construct a GRect. Equivalent to C macro `GRect(x, y, w, h)`.
  result.origin.x = x
  result.origin.y = y
  result.size.w = w
  result.size.h = h

proc makeGEdgeInsets*(top, right, bottom, left: int16): GEdgeInsets {.inline.} =
  ## Construct GEdgeInsets with 4 values.
  result.top = top
  result.right = right
  result.bottom = bottom
  result.left = left

proc makeGEdgeInsets*(top, rightLeft, bottom: int16): GEdgeInsets {.inline.} =
  ## Construct GEdgeInsets with 3 values (right == left).
  result.top = top
  result.right = rightLeft
  result.bottom = bottom
  result.left = rightLeft

proc makeGEdgeInsets*(topBottom, rightLeft: int16): GEdgeInsets {.inline.} =
  ## Construct GEdgeInsets with 2 values (top == bottom, right == left).
  result.top = topBottom
  result.right = rightLeft
  result.bottom = topBottom
  result.left = rightLeft

proc makeGEdgeInsets*(all: int16): GEdgeInsets {.inline.} =
  ## Construct GEdgeInsets with 1 value (all sides equal).
  result.top = all
  result.right = all
  result.bottom = all
  result.left = all

proc makeMenuIndex*(section, row: uint16): MenuIndex {.inline.} =
  ## Construct a MenuIndex. Equivalent to C macro `MenuIndex(section, row)`.
  result.section = section
  result.row = row

# =============================================================================
# Color constructors and constants
# =============================================================================

proc makeGColor8*(argb: uint8): GColor8 {.inline.} =
  ## Construct a GColor8 from an ARGB byte value.
  ## Equivalent to C compound literal `(GColor8){.argb=value}`.
  result.argb = argb

template GColorClear*: GColor8 =
  ## Transparent color. Equivalent to C macro `GColorClear`.
  makeGColor8(0b00000000'u8)

template GColorBlack*: GColor8 =
  ## Black color. Equivalent to C macro `GColorBlack`.
  makeGColor8(0b11000000'u8)

template GColorWhite*: GColor8 =
  ## White color. Equivalent to C macro `GColorWhite`.
  makeGColor8(0b11111111'u8)

# =============================================================================
# UUID
# =============================================================================

proc makeUuid*(p0, p1, p2, p3, p4, p5, p6, p7,
               p8, p9, p10, p11, p12, p13, p14, p15: uint8): Uuid {.inline.} =
  ## Construct a Uuid from 16 bytes.
  ## Equivalent to C macro `UuidMake(...)`.
  result.byte0 = p0
  result.byte1 = p1
  result.byte2 = p2
  result.byte3 = p3
  result.byte4 = p4
  result.byte5 = p5
  result.byte6 = p6
  result.byte7 = p7
  result.byte8 = p8
  result.byte9 = p9
  result.byte10 = p10
  result.byte11 = p11
  result.byte12 = p12
  result.byte13 = p13
  result.byte14 = p14
  result.byte15 = p15

proc makeUuidFromBEBytes*(b: array[16, uint8]): Uuid {.inline.} =
  ## Construct a Uuid from big-endian byte array.
  makeUuid(b[0], b[1], b[2], b[3], b[4], b[5], b[6], b[7],
           b[8], b[9], b[10], b[11], b[12], b[13], b[14], b[15])

proc makeUuidFromLEBytes*(b: array[16, uint8]): Uuid {.inline.} =
  ## Construct a Uuid from little-endian byte array.
  makeUuid(b[15], b[14], b[13], b[12], b[11], b[10], b[9], b[8],
           b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0])

# =============================================================================
# Angle conversion
# =============================================================================

when not declared(TRIG_MAX_ANGLE):
  const TRIG_MAX_ANGLE* = 0x10000
    ## Full rotation in Pebble's trig system (65536).

template trigAngleToDeg*(trigAngle: untyped): untyped =
  ## Convert Pebble trig angle to degrees.
  ## Equivalent to C macro `TRIGANGLE_TO_DEG(trig_angle)`.
  ((trigAngle) * 360 div TRIG_MAX_ANGLE)

template degToTrigAngle*(angle: untyped): untyped =
  ## Convert degrees to Pebble trig angle.
  ## Equivalent to C macro `DEG_TO_TRIGANGLE(angle)`.
  ((angle) * TRIG_MAX_ANGLE div 360)

# =============================================================================
# Logging
# =============================================================================

import std/macros

macro APP_LOG*(level: uint8, fmt: cstring, args: varargs[untyped]): untyped =
  ## Log a message. Equivalent to C macro `APP_LOG(level, fmt, ...)`.
  ## Uses the caller's source file and line number for the log entry.
  let info = args.lineInfoObj
  let filename = newLit(info.filename)
  let lineNum = newLit(info.line)
  result = newCall(bindSym"app_log", level,
                   newCall(ident"cstring", filename),
                   newCall(ident"cint", lineNum),
                   fmt)
  for i in 0 ..< args.len:
    result.add(args[i])

# =============================================================================
# Platform conditional macros
#
# These are resolved at compile time based on which platform is selected.
# The Futhark-generated bindings already include the correct platform-
# specific code, so these templates select at compile time.
# =============================================================================

when defined(pebbleAplite) or defined(pebbleDiorite) or defined(pebbleFlint):
  template colorFallback*(color, bw: untyped): untyped =
    ## On BW platforms, returns `bw`. On color platforms, returns `color`.
    bw
  template pblIfBwElse*(ifTrue, ifFalse: untyped): untyped = ifTrue
  template pblIfColorElse*(ifTrue, ifFalse: untyped): untyped = ifFalse
else:
  template colorFallback*(color, bw: untyped): untyped =
    color
  template pblIfBwElse*(ifTrue, ifFalse: untyped): untyped = ifFalse
  template pblIfColorElse*(ifTrue, ifFalse: untyped): untyped = ifTrue

when defined(pebbleChalk):
  template pblIfRectElse*(ifTrue, ifFalse: untyped): untyped = ifFalse
  template pblIfRoundElse*(ifTrue, ifFalse: untyped): untyped = ifTrue
else:
  template pblIfRectElse*(ifTrue, ifFalse: untyped): untyped = ifTrue
  template pblIfRoundElse*(ifTrue, ifFalse: untyped): untyped = ifFalse

when defined(pebbleAplite):
  template pblIfHealthElse*(ifTrue, ifFalse: untyped): untyped = ifFalse
  template pblIfMicrophoneElse*(ifTrue, ifFalse: untyped): untyped = ifFalse
  template pblIfSmartstrapElse*(ifTrue, ifFalse: untyped): untyped = ifFalse
elif defined(pebbleFlint):
  template pblIfHealthElse*(ifTrue, ifFalse: untyped): untyped = ifTrue
  template pblIfMicrophoneElse*(ifTrue, ifFalse: untyped): untyped = ifTrue
  template pblIfSmartstrapElse*(ifTrue, ifFalse: untyped): untyped = ifFalse
else:
  template pblIfHealthElse*(ifTrue, ifFalse: untyped): untyped = ifTrue
  template pblIfMicrophoneElse*(ifTrue, ifFalse: untyped): untyped = ifTrue
  template pblIfSmartstrapElse*(ifTrue, ifFalse: untyped): untyped = ifTrue

# =============================================================================
# Utility
# =============================================================================

template arrayLength*[I, T](arr: array[I, T]): int =
  ## Calculate the length of a fixed-size array.
  ## Equivalent to C macro `ARRAY_LENGTH(array)`.
  len(arr)

# =============================================================================
# Property animation convenience macros
#
# These wrap the generic property_animation_from/to/subject functions
# with type-safe variants for GRect, GPoint, int16, and subject.
# =============================================================================

proc propertyAnimationClone*(anim: ptr PropertyAnimation): ptr PropertyAnimation {.inline.} =
  ## Clone a property animation.
  cast[ptr PropertyAnimation](animation_clone(cast[ptr Animation](anim)))

proc propertyAnimationGetFromGRect*(anim: ptr PropertyAnimation, value: ptr GRect): bool {.inline.} =
  property_animation_from(anim, value, csize_t(sizeof(GRect)), false)

proc propertyAnimationSetFromGRect*(anim: ptr PropertyAnimation, value: ptr GRect): bool {.inline.} =
  property_animation_from(anim, value, csize_t(sizeof(GRect)), true)

proc propertyAnimationGetFromGPoint*(anim: ptr PropertyAnimation, value: ptr GPoint): bool {.inline.} =
  property_animation_from(anim, value, csize_t(sizeof(GPoint)), false)

proc propertyAnimationSetFromGPoint*(anim: ptr PropertyAnimation, value: ptr GPoint): bool {.inline.} =
  property_animation_from(anim, value, csize_t(sizeof(GPoint)), true)

proc propertyAnimationGetFromInt16*(anim: ptr PropertyAnimation, value: ptr int16): bool {.inline.} =
  property_animation_from(anim, value, csize_t(sizeof(int16)), false)

proc propertyAnimationSetFromInt16*(anim: ptr PropertyAnimation, value: ptr int16): bool {.inline.} =
  property_animation_from(anim, value, csize_t(sizeof(int16)), true)

proc propertyAnimationGetToGRect*(anim: ptr PropertyAnimation, value: ptr GRect): bool {.inline.} =
  property_animation_to(anim, value, csize_t(sizeof(GRect)), false)

proc propertyAnimationSetToGRect*(anim: ptr PropertyAnimation, value: ptr GRect): bool {.inline.} =
  property_animation_to(anim, value, csize_t(sizeof(GRect)), true)

proc propertyAnimationGetToGPoint*(anim: ptr PropertyAnimation, value: ptr GPoint): bool {.inline.} =
  property_animation_to(anim, value, csize_t(sizeof(GPoint)), false)

proc propertyAnimationSetToGPoint*(anim: ptr PropertyAnimation, value: ptr GPoint): bool {.inline.} =
  property_animation_to(anim, value, csize_t(sizeof(GPoint)), true)

proc propertyAnimationGetToInt16*(anim: ptr PropertyAnimation, value: ptr int16): bool {.inline.} =
  property_animation_to(anim, value, csize_t(sizeof(int16)), false)

proc propertyAnimationSetToInt16*(anim: ptr PropertyAnimation, value: ptr int16): bool {.inline.} =
  property_animation_to(anim, value, csize_t(sizeof(int16)), true)

proc propertyAnimationGetSubject*(anim: ptr PropertyAnimation, subject: ptr pointer): bool {.inline.} =
  property_animation_subject(anim, subject, false)

proc propertyAnimationSetSubject*(anim: ptr PropertyAnimation, subject: ptr pointer): bool {.inline.} =
  property_animation_subject(anim, subject, true)

# =============================================================================
# Tuplet convenience constructors
# =============================================================================

proc makeTupletBytes*(key: uint32, data: pointer, length: uint16): Tuplet {.inline.} =
  ## Create a byte array Tuplet. Equivalent to C macro `TupletBytes(...)`.
  result.type_f = TUPLE_BYTE_ARRAY
  result.key = key
  result.anon0.bytes.data = cast[ptr uint8](data)
  result.anon0.bytes.length = length

proc makeTupletCString*(key: uint32, str: cstring): Tuplet {.inline.} =
  ## Create a C string Tuplet. Equivalent to C macro `TupletCString(...)`.
  result.type_f = TUPLE_CSTRING
  result.key = key
  result.anon0.`cstring`.data = str
  result.anon0.`cstring`.length = if str != nil: uint16(len(str) + 1) else: 0

proc makeTupletInteger*(key: uint32, value: uint32): Tuplet {.inline.} =
  ## Create a signed integer Tuplet. Equivalent to C macro `TupletInteger(...)`.
  result.type_f = TUPLE_INT
  result.key = key
  result.anon0.integer.storage = value
  result.anon0.integer.width = uint16(sizeof(uint32))

proc makeTupletUInteger*(key: uint32, value: uint32): Tuplet {.inline.} =
  ## Create an unsigned integer Tuplet.
  result.type_f = TUPLE_UINT
  result.key = key
  result.anon0.integer.storage = value
  result.anon0.integer.width = uint16(sizeof(uint32))

# =============================================================================
# Font key constants
#
# NOTE: These are already provided by the Futhark-generated bindings.
# Futhark wraps #define string constants from pebble_fonts.h.
# No manual definitions needed.
# =============================================================================

# =============================================================================
# Platform display constants
# =============================================================================

when defined(pebbleAplite):
  const
    PBL_DISPLAY_WIDTH* = 144'i16
    PBL_DISPLAY_HEIGHT* = 168'i16
elif defined(pebbleBasalt):
  const
    PBL_DISPLAY_WIDTH* = 144'i16
    PBL_DISPLAY_HEIGHT* = 168'i16
elif defined(pebbleChalk):
  const
    PBL_DISPLAY_WIDTH* = 180'i16
    PBL_DISPLAY_HEIGHT* = 180'i16
elif defined(pebbleDiorite):
  const
    PBL_DISPLAY_WIDTH* = 144'i16
    PBL_DISPLAY_HEIGHT* = 168'i16
elif defined(pebbleEmery):
  const
    PBL_DISPLAY_WIDTH* = 200'i16
    PBL_DISPLAY_HEIGHT* = 228'i16
elif defined(pebbleFlint):
  const
    PBL_DISPLAY_WIDTH* = 144'i16
    PBL_DISPLAY_HEIGHT* = 168'i16

# =============================================================================
# Action bar / status bar sizes (platform-specific)
# =============================================================================

when defined(pebbleChalk):
  const
    ACTION_BAR_WIDTH* = 40'i16
    STATUS_BAR_LAYER_HEIGHT* = 24'i16
elif defined(pebbleEmery):
  const
    ACTION_BAR_WIDTH* = 34'i16
    STATUS_BAR_LAYER_HEIGHT* = 20'i16
else:
  const
    ACTION_BAR_WIDTH* = 30'i16
    STATUS_BAR_LAYER_HEIGHT* = 16'i16

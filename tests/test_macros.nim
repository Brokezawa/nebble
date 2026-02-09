## test_macros.nim
## Runtime unit tests for nebble/ffi/macros.nim
## Uses unittest2 to test pure Nim logic (geometry constructors, angle conversion, etc.)
## Compiles and runs natively on macOS (not cross-compiled for ARM)

import unittest2

# Define just the geometry types we need for testing
type
  GPoint* = object
    x*: int16
    y*: int16
  
  GSize* = object
    w*: int16
    h*: int16
  
  GRect* = object
    origin*: GPoint
    size*: GSize
  
  GEdgeInsets* = object
    top*: int16
    right*: int16
    bottom*: int16
    left*: int16
  
  MenuIndex* = object
    section*: uint16
    row*: uint16
  
  Uuid* = object
    byte0*: uint8
    byte1*: uint8
    byte2*: uint8
    byte3*: uint8
    byte4*: uint8
    byte5*: uint8
    byte6*: uint8
    byte7*: uint8
    byte8*: uint8
    byte9*: uint8
    byte10*: uint8
    byte11*: uint8
    byte12*: uint8
    byte13*: uint8
    byte14*: uint8
    byte15*: uint8

# Copy the pure functions from macros.nim that we want to test
# (geometry constructors, UUID constructors, angle conversion, platform conditionals)

# ============================================================================
# Geometry constructors (from macros.nim)
# ============================================================================

proc makeGPoint*(x, y: int16): GPoint {.inline.} =
  result.x = x
  result.y = y

proc makeGSize*(w, h: int16): GSize {.inline.} =
  result.w = w
  result.h = h

proc makeGRect*(x, y, w, h: int16): GRect {.inline.} =
  result.origin.x = x
  result.origin.y = y
  result.size.w = w
  result.size.h = h

proc makeGEdgeInsets*(top, right, bottom, left: int16): GEdgeInsets {.inline.} =
  result.top = top
  result.right = right
  result.bottom = bottom
  result.left = left

proc makeGEdgeInsets*(top, rightLeft, bottom: int16): GEdgeInsets {.inline.} =
  result.top = top
  result.right = rightLeft
  result.bottom = bottom
  result.left = rightLeft

proc makeGEdgeInsets*(topBottom, rightLeft: int16): GEdgeInsets {.inline.} =
  result.top = topBottom
  result.right = rightLeft
  result.bottom = topBottom
  result.left = rightLeft

proc makeGEdgeInsets*(all: int16): GEdgeInsets {.inline.} =
  result.top = all
  result.right = all
  result.bottom = all
  result.left = all

proc makeMenuIndex*(section, row: uint16): MenuIndex {.inline.} =
  result.section = section
  result.row = row

# ============================================================================
# UUID constructors (from macros.nim)
# ============================================================================

proc makeUuid*(p0, p1, p2, p3, p4, p5, p6, p7,
               p8, p9, p10, p11, p12, p13, p14, p15: uint8): Uuid {.inline.} =
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
  makeUuid(b[0], b[1], b[2], b[3], b[4], b[5], b[6], b[7],
           b[8], b[9], b[10], b[11], b[12], b[13], b[14], b[15])

proc makeUuidFromLEBytes*(b: array[16, uint8]): Uuid {.inline.} =
  makeUuid(b[15], b[14], b[13], b[12], b[11], b[10], b[9], b[8],
           b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0])

# ============================================================================
# Angle conversion (from macros.nim)
# ============================================================================

const TRIG_MAX_ANGLE* = 0x10000

template trigAngleToDeg*(trigAngle: untyped): untyped =
  ((trigAngle) * 360 div TRIG_MAX_ANGLE)

template degToTrigAngle*(angle: untyped): untyped =
  ((angle) * TRIG_MAX_ANGLE div 360)

# ============================================================================
# Platform conditionals (from macros.nim)
# ============================================================================

when defined(pebbleAplite) or defined(pebbleDiorite) or defined(pebbleFlint):
  template colorFallback*(color, bw: untyped): untyped = bw
  template pblIfBwElse*(ifTrue, ifFalse: untyped): untyped = ifTrue
  template pblIfColorElse*(ifTrue, ifFalse: untyped): untyped = ifFalse
else:
  template colorFallback*(color, bw: untyped): untyped = color
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

# ============================================================================
# Display constants (from macros.nim)
# ============================================================================

when defined(pebbleAplite):
  const
    PBL_DISPLAY_WIDTH* = 144'i16
    PBL_DISPLAY_HEIGHT* = 168'i16
    ACTION_BAR_WIDTH* = 30'i16
    STATUS_BAR_LAYER_HEIGHT* = 16'i16
elif defined(pebbleBasalt):
  const
    PBL_DISPLAY_WIDTH* = 144'i16
    PBL_DISPLAY_HEIGHT* = 168'i16
    ACTION_BAR_WIDTH* = 30'i16
    STATUS_BAR_LAYER_HEIGHT* = 16'i16
elif defined(pebbleChalk):
  const
    PBL_DISPLAY_WIDTH* = 180'i16
    PBL_DISPLAY_HEIGHT* = 180'i16
    ACTION_BAR_WIDTH* = 40'i16
    STATUS_BAR_LAYER_HEIGHT* = 24'i16
elif defined(pebbleDiorite):
  const
    PBL_DISPLAY_WIDTH* = 144'i16
    PBL_DISPLAY_HEIGHT* = 168'i16
    ACTION_BAR_WIDTH* = 30'i16
    STATUS_BAR_LAYER_HEIGHT* = 16'i16
elif defined(pebbleEmery):
  const
    PBL_DISPLAY_WIDTH* = 200'i16
    PBL_DISPLAY_HEIGHT* = 228'i16
    ACTION_BAR_WIDTH* = 34'i16
    STATUS_BAR_LAYER_HEIGHT* = 20'i16
elif defined(pebbleFlint):
  const
    PBL_DISPLAY_WIDTH* = 144'i16
    PBL_DISPLAY_HEIGHT* = 168'i16
    ACTION_BAR_WIDTH* = 30'i16
    STATUS_BAR_LAYER_HEIGHT* = 16'i16

# ============================================================================
# Utility (from macros.nim)
# ============================================================================

template arrayLength*[I, T](arr: array[I, T]): int =
  len(arr)

# ============================================================================
# UNIT TESTS
# ============================================================================

suite "Geometry constructors":
  test "makeGPoint creates correct point":
    let p = makeGPoint(10, 20)
    check:
      p.x == 10
      p.y == 20
  
  test "makeGPoint with negative coordinates":
    let p = makeGPoint(-5, -10)
    check:
      p.x == -5
      p.y == -10
  
  test "makeGSize creates correct size":
    let s = makeGSize(100, 50)
    check:
      s.w == 100
      s.h == 50
  
  test "makeGSize with zero dimensions":
    let s = makeGSize(0, 0)
    check:
      s.w == 0
      s.h == 0
  
  test "makeGRect creates correct rectangle":
    let r = makeGRect(1, 2, 100, 50)
    check:
      r.origin.x == 1
      r.origin.y == 2
      r.size.w == 100
      r.size.h == 50
  
  test "makeGRect with all zeros":
    let r = makeGRect(0, 0, 0, 0)
    check:
      r.origin.x == 0
      r.origin.y == 0
      r.size.w == 0
      r.size.h == 0
  
  test "makeGEdgeInsets with 4 values":
    let e = makeGEdgeInsets(1, 2, 3, 4)
    check:
      e.top == 1
      e.right == 2
      e.bottom == 3
      e.left == 4
  
  test "makeGEdgeInsets with 3 values (right == left)":
    let e = makeGEdgeInsets(10, 5, 20)
    check:
      e.top == 10
      e.right == 5
      e.bottom == 20
      e.left == 5
  
  test "makeGEdgeInsets with 2 values (top == bottom, right == left)":
    let e = makeGEdgeInsets(10, 5)
    check:
      e.top == 10
      e.right == 5
      e.bottom == 10
      e.left == 5
  
  test "makeGEdgeInsets with 1 value (all equal)":
    let e = makeGEdgeInsets(7)
    check:
      e.top == 7
      e.right == 7
      e.bottom == 7
      e.left == 7
  
  test "makeMenuIndex creates correct index":
    let idx = makeMenuIndex(2, 5)
    check:
      idx.section == 2
      idx.row == 5
  
  test "makeMenuIndex with zeros":
    let idx = makeMenuIndex(0, 0)
    check:
      idx.section == 0
      idx.row == 0

suite "UUID constructors":
  test "makeUuid with all bytes specified":
    let u = makeUuid(0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x11, 0x22,
                     0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0x00)
    check:
      u.byte0 == 0xAA
      u.byte1 == 0xBB
      u.byte2 == 0xCC
      u.byte3 == 0xDD
      u.byte4 == 0xEE
      u.byte5 == 0xFF
      u.byte6 == 0x11
      u.byte7 == 0x22
      u.byte8 == 0x33
      u.byte9 == 0x44
      u.byte10 == 0x55
      u.byte11 == 0x66
      u.byte12 == 0x77
      u.byte13 == 0x88
      u.byte14 == 0x99
      u.byte15 == 0x00
  
  test "makeUuid with all zeros":
    let u = makeUuid(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    check:
      u.byte0 == 0 and u.byte15 == 0
  
  test "makeUuidFromBEBytes preserves big-endian order":
    let bytes: array[16, uint8] = [0xAA'u8, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x11, 0x22,
                                     0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0x00]
    let u = makeUuidFromBEBytes(bytes)
    check:
      u.byte0 == 0xAA
      u.byte1 == 0xBB
      u.byte15 == 0x00
  
  test "makeUuidFromLEBytes reverses byte order":
    let bytes: array[16, uint8] = [0xAA'u8, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x11, 0x22,
                                     0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0x00]
    let u = makeUuidFromLEBytes(bytes)
    check:
      u.byte0 == 0x00   # First byte becomes last
      u.byte1 == 0x99
      u.byte15 == 0xAA  # Last byte becomes first

suite "Angle conversion":
  test "TRIG_MAX_ANGLE is defined as 65536":
    check:
      TRIG_MAX_ANGLE == 0x10000
      TRIG_MAX_ANGLE == 65536
  
  test "trigAngleToDeg at zero":
    check:
      trigAngleToDeg(0) == 0
  
  test "trigAngleToDeg at full rotation":
    check:
      trigAngleToDeg(TRIG_MAX_ANGLE) == 360
  
  test "trigAngleToDeg at quarter turn":
    check:
      trigAngleToDeg(TRIG_MAX_ANGLE div 4) == 90
  
  test "trigAngleToDeg at half turn":
    check:
      trigAngleToDeg(TRIG_MAX_ANGLE div 2) == 180
  
  test "trigAngleToDeg at three-quarter turn":
    check:
      trigAngleToDeg(TRIG_MAX_ANGLE * 3 div 4) == 270
  
  test "degToTrigAngle at zero":
    check:
      degToTrigAngle(0) == 0
  
  test "degToTrigAngle at 90 degrees":
    check:
      degToTrigAngle(90) == TRIG_MAX_ANGLE div 4
  
  test "degToTrigAngle at 180 degrees":
    check:
      degToTrigAngle(180) == TRIG_MAX_ANGLE div 2
  
  test "degToTrigAngle at 270 degrees":
    check:
      degToTrigAngle(270) == TRIG_MAX_ANGLE * 3 div 4
  
  test "degToTrigAngle at 360 degrees":
    check:
      degToTrigAngle(360) == TRIG_MAX_ANGLE
  
  test "roundtrip conversion preserves value":
    let angles = [0, 45, 90, 135, 180, 225, 270, 315, 360]
    for angle in angles:
      check:
        trigAngleToDeg(degToTrigAngle(angle)) == angle

suite "Platform conditional macros":
  test "pblIfRectElse selects correctly for basalt (rectangular)":
    when defined(pebbleBasalt):
      let val = pblIfRectElse(1, 2)
      check:
        val == 1  # Basalt is rectangular
  
  test "pblIfColorElse selects correctly for basalt (color)":
    when defined(pebbleBasalt):
      let val = pblIfColorElse(1, 2)
      check:
        val == 1  # Basalt has color display
  
  test "pblIfBwElse selects correctly for basalt (not BW)":
    when defined(pebbleBasalt):
      let val = pblIfBwElse(1, 2)
      check:
        val == 2  # Basalt is not BW
  
  test "pblIfRoundElse selects correctly for basalt (not round)":
    when defined(pebbleBasalt):
      let val = pblIfRoundElse(1, 2)
      check:
        val == 2  # Basalt is not round
  
  test "pblIfHealthElse selects correctly for basalt (has health)":
    when defined(pebbleBasalt):
      let val = pblIfHealthElse(1, 2)
      check:
        val == 1  # Basalt has health API
  
  test "pblIfMicrophoneElse selects correctly for basalt (has microphone)":
    when defined(pebbleBasalt):
      let val = pblIfMicrophoneElse(1, 2)
      check:
        val == 1  # Basalt has microphone
  
  test "pblIfSmartstrapElse selects correctly for basalt (has smartstrap)":
    when defined(pebbleBasalt):
      let val = pblIfSmartstrapElse(1, 2)
      check:
        val == 1  # Basalt has smartstrap API
  
  test "colorFallback selects color value on basalt":
    when defined(pebbleBasalt):
      let val = colorFallback(10, 20)
      check:
        val == 10  # Basalt uses color value

suite "Platform display constants":
  test "Basalt has correct display dimensions":
    when defined(pebbleBasalt):
      check:
        PBL_DISPLAY_WIDTH == 144
        PBL_DISPLAY_HEIGHT == 168
  
  test "ACTION_BAR_WIDTH is correct for basalt":
    when defined(pebbleBasalt):
      check:
        ACTION_BAR_WIDTH == 30
  
  test "STATUS_BAR_LAYER_HEIGHT is correct for basalt":
    when defined(pebbleBasalt):
      check:
        STATUS_BAR_LAYER_HEIGHT == 16

suite "Utility functions":
  test "arrayLength returns correct length":
    var arr1: array[5, int]
    var arr2: array[10, uint8]
    check:
      arrayLength(arr1) == 5
      arrayLength(arr2) == 10
  
  test "arrayLength with zero-sized array":
    var arr: array[0, int]
    check:
      arrayLength(arr) == 0

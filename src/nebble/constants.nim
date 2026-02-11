## Constants Module
## Re-exports common enum values from FFI layer for user convenience.
## The FFI uses complex enum aliases that don't auto-export with their types.

import ./ffi

# ============================================================================
# Text Alignment
# ============================================================================

const
  GTextAlignmentLeft*   = GTextAlignment(0)
  GTextAlignmentCenter* = GTextAlignment(1)
  GTextAlignmentRight*  = GTextAlignment(2)

# ============================================================================
# Text Overflow Mode
# ============================================================================

const
  GTextOverflowModeWordWrap* = GTextOverflowMode(0)
  GTextOverflowModeTrailingEllipsis* = GTextOverflowMode(1)
  GTextOverflowModeFill*     = GTextOverflowMode(2)

# ============================================================================
# Graphics Alignment (for Draw Commands)
# ============================================================================

const
  GAlignCenter*              = GAlign(0)
  GAlignTopLeft*             = GAlign(1)
  GAlignTopRight*            = GAlign(2)
  GAlignTop*                 = GAlign(3)
  GAlignLeft*                = GAlign(4)
  GAlignBottom*              = GAlign(5)
  GAlignRight*               = GAlign(6)
  GAlignBottomRight*         = GAlign(7)
  GAlignBottomLeft*          = GAlign(8)

# ============================================================================
# Time Units
# ============================================================================

const
  SECOND_UNIT*  = TimeUnits(1)
  MINUTE_UNIT*  = TimeUnits(2)
  HOUR_UNIT*    = TimeUnits(4)
  DAY_UNIT*     = TimeUnits(8)
  MONTH_UNIT*   = TimeUnits(16)
  YEAR_UNIT*    = TimeUnits(32)

# ============================================================================
# Button IDs
# ============================================================================

const
  BUTTON_ID_BACK*   = ButtonId(0)
  BUTTON_ID_UP*     = ButtonId(1)
  BUTTON_ID_SELECT* = ButtonId(2)
  BUTTON_ID_DOWN*   = ButtonId(3)
  BUTTON_ID_MAX*    = ButtonId(4)

# ============================================================================
# Animation Curves
# ============================================================================

const
  AnimationCurveLinear*       = AnimationCurve(0)
  AnimationCurveEaseIn*       = AnimationCurve(1)
  AnimationCurveEaseOut*      = AnimationCurve(2)
  AnimationCurveEaseInOut*    = AnimationCurve(3)
  AnimationCurveCustomFunction* = AnimationCurve(4)
  AnimationCurveCustomInterpolation* = AnimationCurve(5)

# ============================================================================
# Animation Normalized Angles (TRIG_MAX_ANGLE = 65535)
# ============================================================================

const
  TRIG_MAX_ANGLE* = 65535'u16

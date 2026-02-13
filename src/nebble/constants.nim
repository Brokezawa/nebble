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

# ============================================================================
# Bitmap Formats
# ============================================================================

const
  GBitmapFormat1Bit* = GBitmapFormat(0)
  GBitmapFormat8Bit* = GBitmapFormat(1)
  GBitmapFormat1BitPalette* = GBitmapFormat(2)
  GBitmapFormat2BitPalette* = GBitmapFormat(3)
  GBitmapFormat4BitPalette* = GBitmapFormat(4)
  GBitmapFormat8BitCircular* = GBitmapFormat(5)

# ============================================================================
# Graphics Compositing Operators
# ============================================================================

const
  GCompOpAssign* = GCompOp(0)
  GCompOpAssignInverted* = GCompOp(1)
  GCompOpOr* = GCompOp(2)
  GCompOpAnd* = GCompOp(3)
  GCompOpClear* = GCompOp(4)
  GCompOpSet* = GCompOp(5)

# ============================================================================
# Accelerometer Axis
# ============================================================================

const
  ACCEL_AXIS_X* = AccelAxisType(0)
  ACCEL_AXIS_Y* = AccelAxisType(1)
  ACCEL_AXIS_Z* = AccelAxisType(2)

# ============================================================================
# Menu Alignment
# ============================================================================

const
  MenuRowAlignNone*   = MenuRowAlign(0)
  MenuRowAlignCenter* = MenuRowAlign(1)
  MenuRowAlignTop*    = MenuRowAlign(2)
  MenuRowAlignBottom* = MenuRowAlign(3)

# ============================================================================
# Status Bar Separator Mode
# ============================================================================

const
  StatusBarLayerSeparatorModeNone*   = StatusBarLayerSeparatorMode(0)
  StatusBarLayerSeparatorModeDotted* = StatusBarLayerSeparatorMode(1)

# ============================================================================
# App Launch Reason
# ============================================================================

const
  AppLaunchSystem* = AppLaunchReason(0)
  AppLaunchUser* = AppLaunchReason(1)
  AppLaunchPhone* = AppLaunchReason(2)
  AppLaunchWakeup* = AppLaunchReason(3)
  AppLaunchWorker* = AppLaunchReason(4)
  AppLaunchQuickLaunch* = AppLaunchReason(5)
  AppLaunchTimelineAction* = AppLaunchReason(6)

when not defined(pebbleAplite):
  const AppLaunchSmartstrap* = AppLaunchReason(7)

# ============================================================================
# App Exit Reason
# ============================================================================

const
  AppExitNotSpecified* = AppExitReason(0)
  AppExitActionPerformedSuccessfully* = AppExitReason(1)

# ============================================================================
# Corner Mask
# ============================================================================

const
  GCornerNone* = GCornerMask(0)
  GCornerTopLeft* = GCornerMask(1)
  GCornerTopRight* = GCornerMask(2)
  GCornersTop* = GCornerMask(3)
  GCornerBottomLeft* = GCornerMask(4)
  GCornersLeft* = GCornerMask(5)
  GCornerBottomRight* = GCornerMask(8)
  GCornersRight* = GCornerMask(10)
  GCornersBottom* = GCornerMask(12)
  GCornersAll* = GCornerMask(15)


{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint, warning, newLit, getSize

from os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

type
  enum_ButtonId_603980292* {.size: sizeof(cuint).} = enum
    BUTTON_ID_BACK = 0, BUTTON_ID_UP = 1, BUTTON_ID_SELECT = 2,
    BUTTON_ID_DOWN = 3, NUM_BUTTONS = 4
type
  enum_WatchInfoModel_603980296* {.size: sizeof(cuint).} = enum
    WATCH_INFO_MODEL_UNKNOWN = 0, WATCH_INFO_MODEL_PEBBLE_ORIGINAL = 1,
    WATCH_INFO_MODEL_PEBBLE_STEEL = 2, WATCH_INFO_MODEL_PEBBLE_TIME = 3,
    WATCH_INFO_MODEL_PEBBLE_TIME_STEEL = 4,
    WATCH_INFO_MODEL_PEBBLE_TIME_ROUND_14 = 5,
    WATCH_INFO_MODEL_PEBBLE_TIME_ROUND_20 = 6, WATCH_INFO_MODEL_PEBBLE_2_HR = 7,
    WATCH_INFO_MODEL_PEBBLE_2_SE = 8, WATCH_INFO_MODEL_PEBBLE_TIME_2 = 9,
    WATCH_INFO_MODEL_COREDEVICES_P2D = 10,
    WATCH_INFO_MODEL_COREDEVICES_PT2 = 11,
    WATCH_INFO_MODEL_COREDEVICES_PR2 = 12, WATCH_INFO_MODEL_MAX = 13
type
  enum_WatchInfoColor_603980300* {.size: sizeof(cuint).} = enum
    WATCH_INFO_COLOR_UNKNOWN = 0, WATCH_INFO_COLOR_BLACK = 1,
    WATCH_INFO_COLOR_WHITE = 2, WATCH_INFO_COLOR_RED = 3,
    WATCH_INFO_COLOR_ORANGE = 4, WATCH_INFO_COLOR_GRAY = 5,
    WATCH_INFO_COLOR_STAINLESS_STEEL = 6, WATCH_INFO_COLOR_MATTE_BLACK = 7,
    WATCH_INFO_COLOR_BLUE = 8, WATCH_INFO_COLOR_GREEN = 9,
    WATCH_INFO_COLOR_PINK = 10, WATCH_INFO_COLOR_TIME_WHITE = 11,
    WATCH_INFO_COLOR_TIME_BLACK = 12, WATCH_INFO_COLOR_TIME_RED = 13,
    WATCH_INFO_COLOR_TIME_STEEL_SILVER = 14,
    WATCH_INFO_COLOR_TIME_STEEL_BLACK = 15,
    WATCH_INFO_COLOR_TIME_STEEL_GOLD = 16,
    WATCH_INFO_COLOR_TIME_ROUND_SILVER_14 = 17,
    WATCH_INFO_COLOR_TIME_ROUND_BLACK_14 = 18,
    WATCH_INFO_COLOR_TIME_ROUND_SILVER_20 = 19,
    WATCH_INFO_COLOR_TIME_ROUND_BLACK_20 = 20,
    WATCH_INFO_COLOR_TIME_ROUND_ROSE_GOLD_14 = 21,
    WATCH_INFO_COLOR_PEBBLE_2_SE_BLACK = 24,
    WATCH_INFO_COLOR_PEBBLE_2_HR_BLACK = 25,
    WATCH_INFO_COLOR_PEBBLE_2_SE_WHITE = 26,
    WATCH_INFO_COLOR_PEBBLE_2_HR_LIME = 27,
    WATCH_INFO_COLOR_PEBBLE_2_HR_FLAME = 28,
    WATCH_INFO_COLOR_PEBBLE_2_HR_WHITE = 29,
    WATCH_INFO_COLOR_PEBBLE_2_HR_AQUA = 30,
    WATCH_INFO_COLOR_PEBBLE_TIME_2_BLACK = 31,
    WATCH_INFO_COLOR_PEBBLE_TIME_2_SILVER = 32,
    WATCH_INFO_COLOR_PEBBLE_TIME_2_GOLD = 33,
    WATCH_INFO_COLOR_COREDEVICES_P2D_BLACK = 34,
    WATCH_INFO_COLOR_COREDEVICES_P2D_WHITE = 35,
    WATCH_INFO_COLOR_COREDEVICES_PT2_BLACK_GREY = 36,
    WATCH_INFO_COLOR_COREDEVICES_PT2_BLACK_RED = 37,
    WATCH_INFO_COLOR_COREDEVICES_PT2_SILVER_BLUE = 38,
    WATCH_INFO_COLOR_COREDEVICES_PT2_SILVER_GREY = 39,
    WATCH_INFO_COLOR_COREDEVICES_PR2_BLACK_20 = 40,
    WATCH_INFO_COLOR_COREDEVICES_PR2_SILVER_20 = 41,
    WATCH_INFO_COLOR_COREDEVICES_PR2_GOLD_14 = 42,
    WATCH_INFO_COLOR_COREDEVICES_PR2_SILVER_14 = 43, WATCH_INFO_COLOR_MAX = 44
type
  enum_WeekDay_603980308* {.size: sizeof(cuint).} = enum
    TODAY = 0, SUNDAY = 1, MONDAY = 2, TUESDAY = 3, WEDNESDAY = 4, THURSDAY = 5,
    FRIDAY = 6, SATURDAY = 7
type
  enum_PlatformType_603980314* {.size: sizeof(cuint).} = enum
    PlatformTypeAplite = 0, PlatformTypeBasalt = 1, PlatformTypeChalk = 2,
    PlatformTypeDiorite = 3, PlatformTypeEmery = 4, PlatformTypeFlint = 5,
    PlatformTypeGabbro = 6
type
  enum_AccelAxisType_603980346* {.size: sizeof(cuint).} = enum
    ACCEL_AXIS_X = 0, ACCEL_AXIS_Y = 1, ACCEL_AXIS_Z = 2
type
  enum_AccelSamplingRate_603980356* {.size: sizeof(cuint).} = enum
    ACCEL_SAMPLING_10HZ = 10, ACCEL_SAMPLING_25HZ = 25,
    ACCEL_SAMPLING_50HZ = 50, ACCEL_SAMPLING_100HZ = 100
type
  enum_CompassStatus_603980360* {.size: sizeof(cint).} = enum
    CompassStatusUnavailable = -1, CompassStatusDataInvalid = 0,
    CompassStatusCalibrating = 1, CompassStatusCalibrated = 2
type
  enum_TimeUnits_603980379* {.size: sizeof(cuint).} = enum
    SECOND_UNIT = 1, MINUTE_UNIT = 2, HOUR_UNIT = 4, DAY_UNIT = 8,
    MONTH_UNIT = 16, YEAR_UNIT = 32
type
  enum_HealthMetric_603980385* {.size: sizeof(cuint).} = enum
    HealthMetricStepCount = 0, HealthMetricActiveSeconds = 1,
    HealthMetricWalkedDistanceMeters = 2, HealthMetricSleepSeconds = 3,
    HealthMetricSleepRestfulSeconds = 4, HealthMetricRestingKCalories = 5,
    HealthMetricActiveKCalories = 6, HealthMetricHeartRateBPM = 7,
    HealthMetricHeartRateRawBPM = 8
type
  enum_HealthServiceTimeScope_603980393* {.size: sizeof(cuint).} = enum
    HealthServiceTimeScopeOnce = 0, HealthServiceTimeScopeWeekly = 1,
    HealthServiceTimeScopeDailyWeekdayOrWeekend = 2,
    HealthServiceTimeScopeDaily = 3
type
  enum_HealthAggregation_603980397* {.size: sizeof(cuint).} = enum
    HealthAggregationSum = 0, HealthAggregationAvg = 1,
    HealthAggregationMin = 2, HealthAggregationMax = 3
type
  enum_HealthActivity_603980403* {.size: sizeof(cuint).} = enum
    HealthActivityNone = 0, HealthActivitySleep = 1,
    HealthActivityRestfulSleep = 2, HealthActivityWalk = 4,
    HealthActivityRun = 8, HealthActivityOpenWorkout = 16
type
  enum_HealthIterationDirection_603980409* {.size: sizeof(cuint).} = enum
    HealthIterationDirectionPast = 0, HealthIterationDirectionFuture = 1
type
  enum_HealthServiceAccessibilityMask_603980413* {.size: sizeof(cuint).} = enum
    HealthServiceAccessibilityMaskAvailable = 1,
    HealthServiceAccessibilityMaskNoPermission = 2,
    HealthServiceAccessibilityMaskNotSupported = 4,
    HealthServiceAccessibilityMaskNotAvailable = 8
type
  enum_HealthEventType_603980417* {.size: sizeof(cuint).} = enum
    HealthEventSignificantUpdate = 0, HealthEventMovementUpdate = 1,
    HealthEventSleepUpdate = 2, HealthEventMetricAlert = 3,
    HealthEventHeartRateUpdate = 4
type
  enum_AmbientLightLevel_603980423* {.size: sizeof(cuint).} = enum
    AmbientLightLevelUnknown = 0, AmbientLightLevelVeryDark = 1,
    AmbientLightLevelDark = 2, AmbientLightLevelLight = 3,
    AmbientLightLevelVeryLight = 4
type
  enum_MeasurementSystem_603980431* {.size: sizeof(cuint).} = enum
    MeasurementSystemUnknown = 0, MeasurementSystemMetric = 1,
    MeasurementSystemImperial = 2
type
  enum_DataLoggingItemType_603980437* {.size: sizeof(cuint).} = enum
    DATA_LOGGING_BYTE_ARRAY = 0, DATA_LOGGING_UINT = 2, DATA_LOGGING_INT = 3
type
  enum_DataLoggingResult_603980441* {.size: sizeof(cuint).} = enum
    DATA_LOGGING_SUCCESS = 0, DATA_LOGGING_BUSY = 1, DATA_LOGGING_FULL = 2,
    DATA_LOGGING_NOT_FOUND = 3, DATA_LOGGING_CLOSED = 4,
    DATA_LOGGING_INVALID_PARAMS = 5, DATA_LOGGING_INTERNAL_ERR = 6
type
  enum_AppLogLevel_603980449* {.size: sizeof(cuint).} = enum
    APP_LOG_LEVEL_ERROR = 1, APP_LOG_LEVEL_WARNING = 50,
    APP_LOG_LEVEL_INFO = 100, APP_LOG_LEVEL_DEBUG = 200,
    APP_LOG_LEVEL_DEBUG_VERBOSE = 255
type
  enum_DictionaryResult_603980453* {.size: sizeof(cuint).} = enum
    DICT_OK = 0, DICT_NOT_ENOUGH_STORAGE = 2, DICT_INVALID_ARGS = 4,
    DICT_INTERNAL_INCONSISTENCY = 8, DICT_MALLOC_FAILED = 16
type
  enum_TupleType_603980457* {.size: sizeof(cuint).} = enum
    TUPLE_BYTE_ARRAY = 0, TUPLE_CSTRING = 1, TUPLE_UINT = 2, TUPLE_INT = 3
type
  enum_DictationSessionStatus_603980481* {.size: sizeof(cuint).} = enum
    DictationSessionStatusSuccess = 0,
    DictationSessionStatusFailureTranscriptionRejected = 1,
    DictationSessionStatusFailureTranscriptionRejectedWithError = 2,
    DictationSessionStatusFailureSystemAborted = 3,
    DictationSessionStatusFailureNoSpeechDetected = 4,
    DictationSessionStatusFailureConnectivityError = 5,
    DictationSessionStatusFailureDisabled = 6,
    DictationSessionStatusFailureInternalError = 7,
    DictationSessionStatusFailureRecognizerError = 8
type
  enum_AppMessageResult_603980487* {.size: sizeof(cuint).} = enum
    APP_MSG_OK = 0, APP_MSG_SEND_TIMEOUT = 2, APP_MSG_SEND_REJECTED = 4,
    APP_MSG_NOT_CONNECTED = 8, APP_MSG_APP_NOT_RUNNING = 16,
    APP_MSG_INVALID_ARGS = 32, APP_MSG_BUSY = 64, APP_MSG_BUFFER_OVERFLOW = 128,
    APP_MSG_ALREADY_RELEASED = 512, APP_MSG_CALLBACK_ALREADY_REGISTERED = 1024,
    APP_MSG_CALLBACK_NOT_REGISTERED = 2048, APP_MSG_OUT_OF_MEMORY = 4096,
    APP_MSG_CLOSED = 8192, APP_MSG_INTERNAL_ERROR = 16384,
    APP_MSG_INVALID_STATE = 32768
type
  enum_AppWorkerResult_603980509* {.size: sizeof(cuint).} = enum
    APP_WORKER_RESULT_SUCCESS = 0, APP_WORKER_RESULT_NO_WORKER = 1,
    APP_WORKER_RESULT_DIFFERENT_APP = 2, APP_WORKER_RESULT_NOT_RUNNING = 3,
    APP_WORKER_RESULT_ALREADY_RUNNING = 4,
    APP_WORKER_RESULT_ASKING_CONFIRMATION = 5
type
  enum_SniffInterval_603980519* {.size: sizeof(cuint).} = enum
    SNIFF_INTERVAL_NORMAL = 0, SNIFF_INTERVAL_REDUCED = 1
type
  enum_StatusCode_603980527* {.size: sizeof(cint).} = enum
    E_AGAIN = -12, E_BUSY = -11, E_INVALID_OPERATION = -10,
    E_DOES_NOT_EXIST = -9, E_RANGE = -8, E_OUT_OF_RESOURCES = -7,
    E_OUT_OF_STORAGE = -6, E_OUT_OF_MEMORY = -5, E_INVALID_ARGUMENT = -4,
    E_INTERNAL = -3, E_UNKNOWN = -2, E_ERROR = -1, S_SUCCESS = 0, S_TRUE = 1,
    S_NO_MORE_ITEMS = 2, S_NO_ACTION_REQUIRED = 3
when not declared(S_FALSE):
  const
    S_FALSE* = enum_StatusCode_603980527.S_SUCCESS
else:
  static :
    hint("Declaration of " & "S_FALSE" & " already exists, not redeclaring")
type
  enum_AppLaunchReason_603980537* {.size: sizeof(cuint).} = enum
    APP_LAUNCH_SYSTEM = 0, APP_LAUNCH_USER = 1, APP_LAUNCH_PHONE = 2,
    APP_LAUNCH_WAKEUP = 3, APP_LAUNCH_WORKER = 4, APP_LAUNCH_QUICK_LAUNCH = 5,
    APP_LAUNCH_TIMELINE_ACTION = 6, APP_LAUNCH_SMARTSTRAP = 7
type
  enum_AppExitReason_603980541* {.size: sizeof(cuint).} = enum
    APP_EXIT_NOT_SPECIFIED = 0, APP_EXIT_ACTION_PERFORMED_SUCCESSFULLY = 1,
    NUM_EXIT_REASONS = 2
type
  enum_AppGlanceResult_603980551* {.size: sizeof(cuint).} = enum
    APP_GLANCE_RESULT_SUCCESS = 0,
    APP_GLANCE_RESULT_INVALID_TEMPLATE_STRING = 1,
    APP_GLANCE_RESULT_TEMPLATE_STRING_TOO_LONG = 2,
    APP_GLANCE_RESULT_INVALID_ICON = 4,
    APP_GLANCE_RESULT_SLICE_CAPACITY_EXCEEDED = 8,
    APP_GLANCE_RESULT_EXPIRES_IN_THE_PAST = 16,
    APP_GLANCE_RESULT_INVALID_SESSION = 32
type
  enum_GBitmapFormat_603980577* {.size: sizeof(cuint).} = enum
    GBitmapFormat1Bit = 0, GBitmapFormat8Bit = 1, GBitmapFormat1BitPalette = 2,
    GBitmapFormat2BitPalette = 3, GBitmapFormat4BitPalette = 4,
    GBitmapFormat8BitCircular = 5
type
  enum_GAlign_603980589* {.size: sizeof(cuint).} = enum
    GAlignCenter = 0, GAlignTopLeft = 1, GAlignTopRight = 2, GAlignTop = 3,
    GAlignLeft = 4, GAlignBottom = 5, GAlignRight = 6, GAlignBottomRight = 7,
    GAlignBottomLeft = 8
type
  enum_GCompOp_603980593* {.size: sizeof(cuint).} = enum
    GCompOpAssign = 0, GCompOpAssignInverted = 1, GCompOpOr = 2, GCompOpAnd = 3,
    GCompOpClear = 4, GCompOpSet = 5
type
  enum_GCornerMask_603980603* {.size: sizeof(cuint).} = enum
    GCornerNone = 0, GCornerTopLeft = 1, GCornerTopRight = 2, GCornersTop = 3,
    GCornerBottomLeft = 4, GCornersLeft = 5, GCornerBottomRight = 8,
    GCornersRight = 10, GCornersBottom = 12, GCornersAll = 15
type
  enum_GOvalScaleMode_603980607* {.size: sizeof(cuint).} = enum
    GOvalScaleModeFitCircle = 0, GOvalScaleModeFillCircle = 1
type
  enum_GDrawCommandType_603980623* {.size: sizeof(cuint).} = enum
    GDrawCommandTypeInvalid = 0, GDrawCommandTypePath = 1,
    GDrawCommandTypeCircle = 2, GDrawCommandTypePrecisePath = 3
type
  enum_GTextOverflowMode_603980639* {.size: sizeof(cuint).} = enum
    GTextOverflowModeWordWrap = 0, GTextOverflowModeTrailingEllipsis = 1,
    GTextOverflowModeFill = 2
type
  enum_GTextAlignment_603980643* {.size: sizeof(cuint).} = enum
    GTextAlignmentLeft = 0, GTextAlignmentCenter = 1, GTextAlignmentRight = 2
type
  enum_SmartstrapResult_603980649* {.size: sizeof(cuint).} = enum
    SmartstrapResultOk = 0, SmartstrapResultInvalidArgs = 1,
    SmartstrapResultNotPresent = 2, SmartstrapResultBusy = 3,
    SmartstrapResultServiceUnavailable = 4,
    SmartstrapResultAttributeUnsupported = 5, SmartstrapResultTimeOut = 6
type
  enum_AnimationCurve_603980693* {.size: sizeof(cuint).} = enum
    AnimationCurveLinear = 0, AnimationCurveEaseIn = 1,
    AnimationCurveEaseOut = 2, AnimationCurveEaseInOut = 3,
    AnimationCurveCustomFunction = 4,
    AnimationCurveCustomInterpolationFunction = 5, AnimationCurve_Reserved1 = 6,
    AnimationCurve_Reserved2 = 7
when not declared(AnimationCurveDefault):
  const
    AnimationCurveDefault* = enum_AnimationCurve_603980693.AnimationCurveEaseInOut
else:
  static :
    hint("Declaration of " & "AnimationCurveDefault" &
        " already exists, not redeclaring")
type
  enum_ContentIndicatorDirection_603980773* {.size: sizeof(cuint).} = enum
    ContentIndicatorDirectionUp = 0, ContentIndicatorDirectionDown = 1,
    NumContentIndicatorDirections = 2
type
  enum_MenuRowAlign_603980819* {.size: sizeof(cuint).} = enum
    MenuRowAlignNone = 0, MenuRowAlignCenter = 1, MenuRowAlignTop = 2,
    MenuRowAlignBottom = 3
type
  enum_ActionBarLayerIconPressAnimation_603980835* {.size: sizeof(cuint).} = enum
    ActionBarLayerIconPressAnimationNone = 0,
    ActionBarLayerIconPressAnimationMoveLeft = 1,
    ActionBarLayerIconPressAnimationMoveUp = 2,
    ActionBarLayerIconPressAnimationMoveRight = 3,
    ActionBarLayerIconPressAnimationMoveDown = 4
type
  enum_StatusBarLayerSeparatorMode_603980843* {.size: sizeof(cuint).} = enum
    StatusBarLayerSeparatorModeNone = 0, StatusBarLayerSeparatorModeDotted = 1
type
  enum_ActionMenuAlign_603980863* {.size: sizeof(cuint).} = enum
    ActionMenuAlignTop = 0, ActionMenuAlignCenter = 1
type
  enum_ActionMenuLevelDisplayMode_603980871* {.size: sizeof(cuint).} = enum
    ActionMenuLevelDisplayModeWide = 0, ActionMenuLevelDisplayModeThin = 1
type
  enum_PreferredContentSize_603980887* {.size: sizeof(cuint).} = enum
    PreferredContentSizeSmall = 0, PreferredContentSizeMedium = 1,
    PreferredContentSizeLarge = 2, PreferredContentSizeExtraLarge = 3,
    NumPreferredContentSizes = 4
when not declared(struct_GDrawCommandFrame):
  type
    struct_GDrawCommandFrame* = object
else:
  static :
    hint("Declaration of " & "struct_GDrawCommandFrame" &
        " already exists, not redeclaring")
when not declared(struct_Animation):
  type
    struct_Animation* = object
else:
  static :
    hint("Declaration of " & "struct_Animation" &
        " already exists, not redeclaring")
when not declared(struct_DictationSession):
  type
    struct_DictationSession* = object
else:
  static :
    hint("Declaration of " & "struct_DictationSession" &
        " already exists, not redeclaring")
when not declared(struct_ActionMenuLevel):
  type
    struct_ActionMenuLevel* = object
else:
  static :
    hint("Declaration of " & "struct_ActionMenuLevel" &
        " already exists, not redeclaring")
when not declared(RESOURCE_ID_GOTHIC_14):
  type
    RESOURCE_ID_GOTHIC_14* = object
else:
  static :
    hint("Declaration of " & "RESOURCE_ID_GOTHIC_14" &
        " already exists, not redeclaring")
when not declared(struct_SimpleMenuLayer):
  type
    struct_SimpleMenuLayer* = object
else:
  static :
    hint("Declaration of " & "struct_SimpleMenuLayer" &
        " already exists, not redeclaring")
when not declared(struct_GBitmapSequence):
  type
    struct_GBitmapSequence* = object
else:
  static :
    hint("Declaration of " & "struct_GBitmapSequence" &
        " already exists, not redeclaring")
when not declared(struct_Dictionary):
  type
    struct_Dictionary* = object
else:
  static :
    hint("Declaration of " & "struct_Dictionary" &
        " already exists, not redeclaring")
when not declared(PBL_APP_INFO):
  type
    PBL_APP_INFO* = object
else:
  static :
    hint("Declaration of " & "PBL_APP_INFO" & " already exists, not redeclaring")
when not declared(struct_PropertyAnimation):
  type
    struct_PropertyAnimation* = object
else:
  static :
    hint("Declaration of " & "struct_PropertyAnimation" &
        " already exists, not redeclaring")
when not declared(struct_FontInfo):
  type
    struct_FontInfo* = object
else:
  static :
    hint("Declaration of " & "struct_FontInfo" &
        " already exists, not redeclaring")
when not declared(struct_SmartstrapAttribute):
  type
    struct_SmartstrapAttribute* = object
else:
  static :
    hint("Declaration of " & "struct_SmartstrapAttribute" &
        " already exists, not redeclaring")
when not declared(struct_GDrawCommand):
  type
    struct_GDrawCommand* = object
else:
  static :
    hint("Declaration of " & "struct_GDrawCommand" &
        " already exists, not redeclaring")
when not declared(struct_AppGlanceReloadSession):
  type
    struct_AppGlanceReloadSession* = object
else:
  static :
    hint("Declaration of " & "struct_AppGlanceReloadSession" &
        " already exists, not redeclaring")
when not declared(struct_RotBitmapLayer):
  type
    struct_RotBitmapLayer* = object
else:
  static :
    hint("Declaration of " & "struct_RotBitmapLayer" &
        " already exists, not redeclaring")
when not declared(struct_GTextAttributes):
  type
    struct_GTextAttributes* = object
else:
  static :
    hint("Declaration of " & "struct_GTextAttributes" &
        " already exists, not redeclaring")
when not declared(struct_GBitmap):
  type
    struct_GBitmap* = object
else:
  static :
    hint("Declaration of " & "struct_GBitmap" &
        " already exists, not redeclaring")
when not declared(struct_Window):
  type
    struct_Window* = object
else:
  static :
    hint("Declaration of " & "struct_Window" &
        " already exists, not redeclaring")
when not declared(struct_BitmapLayer):
  type
    struct_BitmapLayer* = object
else:
  static :
    hint("Declaration of " & "struct_BitmapLayer" &
        " already exists, not redeclaring")
when not declared(struct_GDrawCommandImage):
  type
    struct_GDrawCommandImage* = object
else:
  static :
    hint("Declaration of " & "struct_GDrawCommandImage" &
        " already exists, not redeclaring")
when not declared(struct_ActionMenuItem):
  type
    struct_ActionMenuItem* = object
else:
  static :
    hint("Declaration of " & "struct_ActionMenuItem" &
        " already exists, not redeclaring")
when not declared(struct_GDrawCommandList):
  type
    struct_GDrawCommandList* = object
else:
  static :
    hint("Declaration of " & "struct_GDrawCommandList" &
        " already exists, not redeclaring")
when not declared(struct_MenuLayer):
  type
    struct_MenuLayer* = object
else:
  static :
    hint("Declaration of " & "struct_MenuLayer" &
        " already exists, not redeclaring")
when not declared(struct_NumberWindow):
  type
    struct_NumberWindow* = object
else:
  static :
    hint("Declaration of " & "struct_NumberWindow" &
        " already exists, not redeclaring")
when not declared(struct_Layer):
  type
    struct_Layer* = object
else:
  static :
    hint("Declaration of " & "struct_Layer" & " already exists, not redeclaring")
when not declared(union_80831):
  type
    union_80831* = object
else:
  static :
    hint("Declaration of " & "union_80831" & " already exists, not redeclaring")
when not declared(struct_TextLayer):
  type
    struct_TextLayer* = object
else:
  static :
    hint("Declaration of " & "struct_TextLayer" &
        " already exists, not redeclaring")
when not declared(struct_ActionBarLayer):
  type
    struct_ActionBarLayer* = object
else:
  static :
    hint("Declaration of " & "struct_ActionBarLayer" &
        " already exists, not redeclaring")
when not declared(struct_HealthMetricAlert):
  type
    struct_HealthMetricAlert* = object
else:
  static :
    hint("Declaration of " & "struct_HealthMetricAlert" &
        " already exists, not redeclaring")
when not declared(struct_GContext):
  type
    struct_GContext* = object
else:
  static :
    hint("Declaration of " & "struct_GContext" &
        " already exists, not redeclaring")
when not declared(struct_ScrollLayer):
  type
    struct_ScrollLayer* = object
else:
  static :
    hint("Declaration of " & "struct_ScrollLayer" &
        " already exists, not redeclaring")
when not declared(struct_AppTimer):
  type
    struct_AppTimer* = object
else:
  static :
    hint("Declaration of " & "struct_AppTimer" &
        " already exists, not redeclaring")
when not declared(struct_ContentIndicator):
  type
    struct_ContentIndicator* = object
else:
  static :
    hint("Declaration of " & "struct_ContentIndicator" &
        " already exists, not redeclaring")
when not declared(struct_StatusBarLayer):
  type
    struct_StatusBarLayer* = object
else:
  static :
    hint("Declaration of " & "struct_StatusBarLayer" &
        " already exists, not redeclaring")
when not declared(struct_GDrawCommandSequence):
  type
    struct_GDrawCommandSequence* = object
else:
  static :
    hint("Declaration of " & "struct_GDrawCommandSequence" &
        " already exists, not redeclaring")
when not declared(struct_ActionMenu):
  type
    struct_ActionMenu* = object
else:
  static :
    hint("Declaration of " & "struct_ActionMenu" &
        " already exists, not redeclaring")
type
  tm_603980288 = struct_tm_603980291 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:37:19
  struct_tm_603980290 {.pure, inheritable, bycopy.} = object
    tm_sec*: cint            ## Generated based on /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/_time.h:78:8
    tm_min*: cint
    tm_hour*: cint
    tm_mday*: cint
    tm_mon*: cint
    tm_year*: cint
    tm_wday*: cint
    tm_yday*: cint
    tm_isdst*: cint
    tm_gmtoff*: clong
    tm_zone*: cstring
  ButtonId_603980294 = enum_ButtonId_603980293 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:169:3
  WatchInfoModel_603980298 = enum_WatchInfoModel_603980297 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:220:3
  WatchInfoColor_603980302 = enum_WatchInfoColor_603980301 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:279:3
  struct_WatchInfoVersion_603980304 {.pure, inheritable, bycopy.} = object
    major*: uint8            ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:284:9
    minor*: uint8
    patch*: uint8
  WatchInfoVersion_603980306 = struct_WatchInfoVersion_603980305 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:288:3
  WeekDay_603980310 = enum_WeekDay_603980309 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:358:3
  time_t_603980312 = compiler_darwin_time_t_603980895 ## Generated based on /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_time_t.h:31:33
  PlatformType_603980316 = enum_PlatformType_603980315 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:411:3
  ConnectionHandler_603980318 = proc (a0: bool): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:461:16
  struct_ConnectionHandlers_603980320 {.pure, inheritable, bycopy.} = object
    pebble_app_connection_handler*: ConnectionHandler_603980319 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:463:9
    pebblekit_connection_handler*: ConnectionHandler_603980319
  ConnectionHandlers_603980322 = struct_ConnectionHandlers_603980321 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:470:3
  BluetoothConnectionHandler_603980324 = ConnectionHandler_603980319 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:495:27
  AppFocusHandler_603980326 = proc (a0: bool): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:533:16
  struct_AppFocusHandlers_603980328 {.pure, inheritable, bycopy.} = object
    will_focus*: AppFocusHandler_603980327 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:547:9
    did_focus*: AppFocusHandler_603980327
  AppFocusHandlers_603980330 = struct_AppFocusHandlers_603980329 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:561:3
  struct_BatteryChargeState_603980332 {.pure, inheritable, bycopy.} = object
    charge_percent*: uint8   ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:603:9
    is_charging*: bool
    is_plugged*: bool
  BatteryChargeState_603980334 = struct_BatteryChargeState_603980333 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:610:3
  BatteryStateHandler_603980336 = proc (a0: BatteryChargeState_603980335): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:614:16
  struct_AccelData_603980338 {.pure, inheritable, bycopy, packed.} = object
    x*: int16                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:646:44
    y*: int16
    z*: int16
    did_vibrate*: bool
    timestamp*: uint64
  AccelData_603980340 = struct_AccelData_603980339 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:659:3
  struct_AccelRawData_603980342 {.pure, inheritable, bycopy, packed.} = object
    x*: int16                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:662:9
    y*: int16
    z*: int16
  AccelRawData_603980344 = struct_AccelRawData_603980343 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:669:3
  AccelAxisType_603980348 = enum_AccelAxisType_603980347 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:682:3
  AccelDataHandler_603980350 = proc (a0: ptr AccelData_603980341; a1: uint32): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:687:16
  AccelRawDataHandler_603980352 = proc (a0: ptr AccelRawData_603980345;
                                        a1: uint32; a2: uint64): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:693:16
  AccelTapHandler_603980354 = proc (a0: AccelAxisType_603980349; a1: int32): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:698:16
  AccelSamplingRate_603980358 = enum_AccelSamplingRate_603980357 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:710:3
  CompassStatus_603980362 = enum_CompassStatus_603980361 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:789:3
  CompassHeading_603980364 = int32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:796:17
  struct_CompassHeadingData_603980366 {.pure, inheritable, bycopy.} = object
    magnetic_heading*: CompassHeading_603980365 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:799:9
    true_heading*: CompassHeading_603980365
    compass_status*: CompassStatus_603980363
    is_declination_valid*: bool
  CompassHeadingData_603980368 = struct_CompassHeadingData_603980367 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:810:3
  CompassHeadingHandler_603980370 = proc (a0: CompassHeadingData_603980369): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:814:16
  TimeUnits_603980381 = enum_TimeUnits_603980380 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:869:3
  TickHandler_603980383 = proc (a0: ptr struct_tm_603980291; a1: TimeUnits_603980382): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:874:16
  HealthMetric_603980387 = enum_HealthMetric_603980386 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:919:3
  HealthValue_603980389 = int32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:922:17
  HealthMetricAlert_603980391 = struct_HealthMetricAlert ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:926:34
  HealthServiceTimeScope_603980395 = enum_HealthServiceTimeScope_603980394 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:965:3
  HealthAggregation_603980399 = enum_HealthAggregation_603980398 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1014:3
  HealthActivityMask_603980401 = uint32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1064:18
  HealthActivity_603980405 = enum_HealthActivity_603980404 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1083:3
  HealthActivityIteratorCB_603980407 = proc (a0: HealthActivity_603980406;
      a1: time_t_603980313; a2: time_t_603980313; a3: pointer): bool {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1097:16
  HealthIterationDirection_603980411 = enum_HealthIterationDirection_603980410 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1110:3
  HealthServiceAccessibilityMask_603980415 = enum_HealthServiceAccessibilityMask_603980414 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1140:3
  HealthEventType_603980419 = enum_HealthEventType_603980418 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1218:3
  HealthEventHandler_603980421 = proc (a0: HealthEventType_603980420;
                                       a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1224:16
  AmbientLightLevel_603980425 = enum_AmbientLightLevel_603980424 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1307:3
  struct_HealthMinuteData_603980427 {.pure, inheritable, bycopy.} = object
    steps*: uint8            ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1316:9
    orientation*: uint8
    vmc*: uint16
    is_invalid* {.bitsize: 1'i64.}: bool
    light* {.bitsize: 3'i64.}: AmbientLightLevel_603980426
    padding* {.bitsize: 4'i64.}: uint8
    heart_rate_bpm*: uint8
    reserved*: array[6'i64, uint8]
  HealthMinuteData_603980429 = struct_HealthMinuteData_603980428 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1326:3
  MeasurementSystem_603980433 = enum_MeasurementSystem_603980432 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1362:3
  DataLoggingSessionRef_603980435 = pointer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1417:15
  DataLoggingItemType_603980439 = enum_DataLoggingItemType_603980438 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1430:3
  DataLoggingResult_603980443 = enum_DataLoggingResult_603980442 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1441:3
  struct_Uuid_603980445 {.pure, inheritable, bycopy, packed.} = object
    byte0*: uint8            ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1496:9
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
  Uuid_603980447 = struct_Uuid_603980446 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1513:3
  AppLogLevel_603980451 = enum_AppLogLevel_603980450 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1586:3
  DictionaryResult_603980455 = enum_DictionaryResult_603980454 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1695:3
  TupleType_603980459 = enum_TupleType_603980458 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1709:3
  struct_Tuple_anon0_t {.union, bycopy.} = object
    data*: array[0'i64, uint8]
    cstring*: array[0'i64, cschar]
    uint8*: uint8
    uint16*: uint16
    uint32*: uint32
    int8*: int8
    int16*: int16
    int32*: int32
  struct_Tuple_603980461 {.pure, inheritable, bycopy, packed.} = object
    key*: uint32             ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1714:9
    type_f* {.bitsize: 8'i64.}: TupleType_603980460
    length*: uint16
    anon0*: struct_Tuple_anon0_t
    value*: ptr UncheckedArray[union_80831]
  Tuple_f_603980463 = struct_Tuple_603980462 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1751:3
  Dictionary_603980465 = struct_Dictionary ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1754:27
  struct_DictionaryIterator_603980467 {.pure, inheritable, bycopy.} = object
    dictionary*: ptr Dictionary_603980466 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1761:9
    end_f*: pointer
    cursor*: ptr Tuple_f_603980464
  DictionaryIterator_603980469 = struct_DictionaryIterator_603980468 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1769:3
  struct_Tuplet_anon0_t_bytes_t {.pure, inheritable, bycopy.} = object
    data*: ptr uint8
    length*: uint16
  struct_Tuplet_anon0_t_cstring_t {.pure, inheritable, bycopy.} = object
    data*: cstring
    length*: uint16
  struct_Tuplet_anon0_t_integer_t {.pure, inheritable, bycopy.} = object
    storage*: uint32
    width*: uint16
  struct_Tuplet_anon0_t {.union, bycopy.} = object
    bytes*: struct_Tuplet_anon0_t_bytes_t
    cstring*: struct_Tuplet_anon0_t_cstring_t
    integer*: struct_Tuplet_anon0_t_integer_t
  struct_Tuplet_603980471 {.pure, inheritable, bycopy.} = object
    type_f*: TupleType_603980460 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1883:16
    key*: uint32
    anon0*: struct_Tuplet_anon0_t
  Tuplet_603980473 = struct_Tuplet_603980472 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1916:3
  DictionarySerializeCallback_603980475 = proc (a0: ptr uint8; a1: uint16;
      a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1942:16
  DictionaryKeyUpdatedCallback_603980477 = proc (a0: uint32; a1: ptr Tuple_f_603980464;
      a2: ptr Tuple_f_603980464; a3: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2003:16
  DictationSession_603980479 = struct_DictationSession ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2031:33
  DictationSessionStatus_603980483 = enum_DictationSessionStatus_603980482 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2060:3
  DictationSessionStatusCallback_603980485 = proc (a0: ptr DictationSession_603980480;
      a1: DictationSessionStatus_603980484; a2: cstring; a3: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2070:16
  AppMessageResult_603980489 = enum_AppMessageResult_603980488 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2265:3
  AppMessageInboxReceived_603980491 = proc (a0: ptr DictionaryIterator_603980470;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2297:16
  AppMessageInboxDropped_603980493 = proc (a0: AppMessageResult_603980490;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2311:16
  AppMessageOutboxSent_603980495 = proc (a0: ptr DictionaryIterator_603980470;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2323:16
  AppMessageOutboxFailed_603980497 = proc (a0: ptr DictionaryIterator_603980470;
      a1: AppMessageResult_603980490; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2343:16
  AppSyncTupleChangedCallback_603980499 = proc (a0: uint32; a1: ptr Tuple_f_603980464;
      a2: ptr Tuple_f_603980464; a3: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2520:16
  AppSyncErrorCallback_603980501 = proc (a0: DictionaryResult_603980456;
      a1: AppMessageResult_603980490; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2531:16
  struct_AppSync_anon0_t {.union, bycopy.} = object
    current*: ptr Dictionary_603980466
    buffer*: ptr uint8
  struct_AppSync_callback_t {.pure, inheritable, bycopy.} = object
    value_changed*: AppSyncTupleChangedCallback_603980500
    error*: AppSyncErrorCallback_603980502
    context*: pointer
  struct_AppSync_603980503 {.pure, inheritable, bycopy.} = object
    current_iter*: DictionaryIterator_603980470 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2536:16
    anon0*: struct_AppSync_anon0_t
    buffer_size*: uint16
    callback*: struct_AppSync_callback_t
  AppSync_603980505 = struct_AppSync_603980504 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2548:3
  ResHandle_603980507 = pointer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2730:16
  AppWorkerResult_603980511 = enum_AppWorkerResult_603980510 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2811:3
  struct_AppWorkerMessage_603980513 {.pure, inheritable, bycopy.} = object
    data0*: uint16           ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2814:9
    data1*: uint16
    data2*: uint16
  AppWorkerMessage_603980515 = struct_AppWorkerMessage_603980514 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2818:3
  AppWorkerMessageHandler_603980517 = proc (a0: uint16; a1: ptr AppWorkerMessage_603980516): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2837:16
  SniffInterval_603980521 = enum_SniffInterval_603980520 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2882:3
  AppTimer_603980523 = struct_AppTimer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2905:25
  AppTimerCallback_603980525 = proc (a0: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2909:16
  StatusCode_603980529 = enum_StatusCode_603980528 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3036:3
  status_t_603980531 = int32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3039:17
  WakeupId_603980533 = int32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3123:17
  WakeupHandler_603980535 = proc (a0: WakeupId_603980534; a1: int32): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3128:16
  AppLaunchReason_603980539 = enum_AppLaunchReason_603980538 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3200:3
  AppExitReason_603980543 = enum_AppExitReason_603980542 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3231:3
  PublishedId_603980545 = uint32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3245:18
  struct_AppGlanceSlice_layout_t {.pure, inheritable, bycopy.} = object
    icon*: PublishedId_603980546
    subtitle_template_string*: cstring
  struct_AppGlanceSlice_603980547 {.pure, inheritable, bycopy.} = object
    layout*: struct_AppGlanceSlice_layout_t ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3257:16
    expiration_time*: time_t_603980313
  AppGlanceSlice_603980549 = struct_AppGlanceSlice_603980548 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3270:3
  AppGlanceResult_603980553 = enum_AppGlanceResult_603980552 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3288:3
  AppGlanceReloadSession_603980555 = struct_AppGlanceReloadSession ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3291:39
  AppGlanceReloadCallback_603980557 = proc (a0: ptr AppGlanceReloadSession_603980556;
      a1: csize_t; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3305:16
  union_GColor8_anon0_t {.pure, inheritable, bycopy.} = object
    b* {.bitsize: 2'i64.}: uint8
    g* {.bitsize: 2'i64.}: uint8
    r* {.bitsize: 2'i64.}: uint8
    a* {.bitsize: 2'i64.}: uint8
  union_GColor8_603980559 {.union, bycopy.} = object
    argb*: uint8             ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3326:15
    anon0*: union_GColor8_anon0_t
  GColor8_603980561 = union_GColor8_603980560 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3334:3
  GColor_603980563 = GColor8_603980562 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3336:17
  struct_GPoint_603980565 {.pure, inheritable, bycopy.} = object
    x*: int16                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3374:16
    y*: int16
  GPoint_603980567 = struct_GPoint_603980566 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3379:3
  struct_GSize_603980569 {.pure, inheritable, bycopy.} = object
    w*: int16                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3394:16
    h*: int16
  GSize_603980571 = struct_GSize_603980570 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3399:3
  struct_GRect_603980573 {.pure, inheritable, bycopy.} = object
    origin*: GPoint_603980568 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3415:16
    size*: GSize_603980572
  GRect_603980575 = struct_GRect_603980574 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3420:3
  GBitmapFormat_603980579 = enum_GBitmapFormat_603980578 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3493:3
  GBitmap_603980581 = struct_GBitmap ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3496:24
  GBitmapSequence_603980583 = struct_GBitmapSequence ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3499:32
  struct_GBitmapDataRowInfo_603980585 {.pure, inheritable, bycopy.} = object
    data*: ptr uint8         ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3741:9
    min_x*: int16
    max_x*: int16
  GBitmapDataRowInfo_603980587 = struct_GBitmapDataRowInfo_603980586 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3756:3
  GAlign_603980591 = enum_GAlign_603980590 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3790:3
  GCompOp_603980595 = enum_GCompOp_603980594 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3855:3
  GContext_603980597 = struct_GContext ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3858:25
  struct_GEdgeInsets_603980599 {.pure, inheritable, bycopy.} = object
    top*: int16              ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3862:9
    right*: int16
    bottom*: int16
    left*: int16
  GEdgeInsets_603980601 = struct_GEdgeInsets_603980600 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3871:3
  GCornerMask_603980605 = enum_GCornerMask_603980604 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4034:3
  GOvalScaleMode_603980609 = enum_GOvalScaleMode_603980608 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4165:3
  GDrawCommand_603980611 = struct_GDrawCommand ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4265:29
  GDrawCommandFrame_603980613 = struct_GDrawCommandFrame ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4271:34
  GDrawCommandImage_603980615 = struct_GDrawCommandImage ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4275:34
  GDrawCommandList_603980617 = struct_GDrawCommandList ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4278:33
  GDrawCommandListIteratorCb_603980619 = proc (a0: ptr GDrawCommand_603980612;
      a1: uint32; a2: pointer): bool {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4285:16
  GDrawCommandSequence_603980621 = struct_GDrawCommandSequence ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4290:37
  GDrawCommandType_603980625 = enum_GDrawCommandType_603980624 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4297:3
  struct_GPathInfo_603980627 {.pure, inheritable, bycopy.} = object
    num_points*: uint32      ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4580:16
    points*: ptr GPoint_603980568
  GPathInfo_603980629 = struct_GPathInfo_603980628 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4585:3
  struct_GPath_603980631 {.pure, inheritable, bycopy.} = object
    num_points*: uint32      ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4589:16
    points*: ptr GPoint_603980568
    rotation*: int32
    offset*: GPoint_603980568
  GPath_603980633 = struct_GPath_603980632 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4600:3
  FontInfo_603980635 = struct_FontInfo ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4669:25
  GFont_603980637 = ptr FontInfo_603980636 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4675:19
  GTextOverflowMode_603980641 = enum_GTextOverflowMode_603980640 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4731:3
  GTextAlignment_603980645 = enum_GTextAlignment_603980644 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4743:3
  GTextAttributes_603980647 = struct_GTextAttributes ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4746:32
  SmartstrapResult_603980651 = enum_SmartstrapResult_603980650 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4874:3
  SmartstrapServiceId_603980653 = uint16 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4877:18
  SmartstrapAttributeId_603980655 = uint16 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4880:18
  SmartstrapAttribute_603980657 = struct_SmartstrapAttribute ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4884:36
  SmartstrapServiceAvailabilityHandler_603980659 = proc (
      a0: SmartstrapServiceId_603980654; a1: bool): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4889:16
  SmartstrapReadHandler_603980661 = proc (a0: ptr SmartstrapAttribute_603980658;
      a1: SmartstrapResult_603980652; a2: ptr uint8; a3: csize_t): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4899:16
  SmartstrapWriteHandler_603980663 = proc (a0: ptr SmartstrapAttribute_603980658;
      a1: SmartstrapResult_603980652): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4905:16
  SmartstrapNotifyHandler_603980665 = proc (a0: ptr SmartstrapAttribute_603980658): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4909:16
  struct_SmartstrapHandlers_603980667 {.pure, inheritable, bycopy.} = object
    availability_did_change*: SmartstrapServiceAvailabilityHandler_603980660 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4912:9
    did_read*: SmartstrapReadHandler_603980662
    did_write*: SmartstrapWriteHandler_603980664
    notified*: SmartstrapNotifyHandler_603980666
  SmartstrapHandlers_603980669 = struct_SmartstrapHandlers_603980668 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4921:3
  ClickRecognizerRef_603980671 = pointer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5030:15
  ClickHandler_603980673 = proc (a0: ClickRecognizerRef_603980672; a1: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5037:16
  ClickConfigProvider_603980675 = proc (a0: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5050:16
  Layer_603980677 = struct_Layer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5112:22
  LayerUpdateProc_603980679 = proc (a0: ptr struct_Layer; a1: ptr GContext_603980598): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5122:16
  Window_603980681 = struct_Window ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5339:23
  WindowHandler_603980683 = proc (a0: ptr struct_Window): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5344:16
  struct_WindowHandlers_603980685 {.pure, inheritable, bycopy.} = object
    load*: WindowHandler_603980684 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5351:16
    appear*: WindowHandler_603980684
    disappear*: WindowHandler_603980684
    unload*: WindowHandler_603980684
  WindowHandlers_603980687 = struct_WindowHandlers_603980686 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5370:3
  Animation_603980689 = struct_Animation ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5593:26
  AnimationProgress_603980691 = int32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5597:17
  AnimationCurve_603980695 = enum_AnimationCurve_603980694 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5618:3
  AnimationCurveFunction_603980697 = proc (a0: AnimationProgress_603980692): AnimationProgress_603980692 {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5793:29
  AnimationStartedHandler_603980699 = proc (a0: ptr Animation_603980690;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5817:16
  AnimationStoppedHandler_603980701 = proc (a0: ptr Animation_603980690;
      a1: bool; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5830:16
  struct_AnimationHandlers_603980703 {.pure, inheritable, bycopy.} = object
    started*: AnimationStartedHandler_603980700 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5835:16
    stopped*: AnimationStoppedHandler_603980702
  AnimationHandlers_603980705 = struct_AnimationHandlers_603980704 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5840:3
  AnimationSetupImplementation_603980707 = proc (a0: ptr Animation_603980690): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5907:16
  AnimationUpdateImplementation_603980709 = proc (a0: ptr Animation_603980690;
      a1: AnimationProgress_603980692): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5929:16
  AnimationTeardownImplementation_603980711 = proc (a0: ptr Animation_603980690): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5939:16
  struct_AnimationImplementation_603980713 {.pure, inheritable, bycopy.} = object
    setup*: AnimationSetupImplementation_603980708 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5956:16
    update*: AnimationUpdateImplementation_603980710
    teardown*: AnimationTeardownImplementation_603980712
  AnimationImplementation_603980715 = struct_AnimationImplementation_603980714 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5966:3
  PropertyAnimationAccessors_603980717 = struct_PropertyAnimationAccessors_603980720 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6271:3
  struct_PropertyAnimationAccessors_setter_t {.union, bycopy.} = object
    int16*: Int16Setter_603980732
    gpoint*: GPointSetter_603980740
    grect*: GRectSetter_603980744
    gcolor8*: GColor8Setter_603980748
    uint32*: UInt32Setter_603980736
  struct_PropertyAnimationAccessors_getter_t {.union, bycopy.} = object
    int16*: Int16Getter_603980734
    gpoint*: GPointGetter_603980742
    grect*: GRectGetter_603980746
    gcolor8*: GColor8Getter_603980750
    uint32*: UInt32Getter_603980738
  struct_PropertyAnimationAccessors_603980719 {.pure, inheritable, bycopy.} = object
    setter*: struct_PropertyAnimationAccessors_setter_t ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6239:16
    getter*: struct_PropertyAnimationAccessors_getter_t
  PropertyAnimationImplementation_603980721 = struct_PropertyAnimationImplementation_603980724 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6281:3
  struct_PropertyAnimationImplementation_603980723 {.pure, inheritable, bycopy.} = object
    base*: AnimationImplementation_603980716 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6276:16
    accessors*: PropertyAnimationAccessors_603980718
  PropertyAnimation_603980725 = struct_PropertyAnimation ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6048:34
  GPointReturn_603980727 = GPoint_603980568 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6172:16
  GRectReturn_603980729 = GRect_603980576 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6176:15
  Int16Setter_603980731 = proc (a0: pointer; a1: int16): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6181:16
  Int16Getter_603980733 = proc (a0: pointer): int16 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6187:19
  UInt32Setter_603980735 = proc (a0: pointer; a1: uint32): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6192:16
  UInt32Getter_603980737 = proc (a0: pointer): uint32 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6198:20
  GPointSetter_603980739 = proc (a0: pointer; a1: GPoint_603980568): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6203:16
  GPointGetter_603980741 = proc (a0: pointer): GPointReturn_603980728 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6208:24
  GRectSetter_603980743 = proc (a0: pointer; a1: GRect_603980576): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6213:16
  GRectGetter_603980745 = proc (a0: pointer): GRectReturn_603980730 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6218:23
  GColor8Setter_603980747 = proc (a0: pointer; a1: GColor8_603980562): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6223:16
  GColor8Getter_603980749 = proc (a0: pointer): GColor8_603980562 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6229:19
  UnobstructedAreaWillChangeHandler_603980751 = proc (a0: GRect_603980576;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6427:16
  UnobstructedAreaChangeHandler_603980753 = proc (a0: AnimationProgress_603980692;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6433:16
  UnobstructedAreaDidChangeHandler_603980755 = proc (a0: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6437:16
  struct_UnobstructedAreaHandlers_603980757 {.pure, inheritable, bycopy.} = object
    will_change*: UnobstructedAreaWillChangeHandler_603980752 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6439:16
    change*: UnobstructedAreaChangeHandler_603980754
    did_change*: UnobstructedAreaDidChangeHandler_603980756
  UnobstructedAreaHandlers_603980759 = struct_UnobstructedAreaHandlers_603980758 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6446:3
  TextLayer_603980761 = struct_TextLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6482:26
  ScrollLayer_603980763 = struct_ScrollLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6621:28
  ScrollLayerCallback_603980765 = proc (a0: ptr struct_ScrollLayer; a1: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6624:16
  struct_ScrollLayerCallbacks_603980767 {.pure, inheritable, bycopy.} = object
    click_config_provider*: ClickConfigProvider_603980676 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6629:16
    content_offset_changed_handler*: ScrollLayerCallback_603980766
  ScrollLayerCallbacks_603980769 = struct_ScrollLayerCallbacks_603980768 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6641:3
  ContentIndicator_603980771 = struct_ContentIndicator ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6794:33
  ContentIndicatorDirection_603980775 = enum_ContentIndicatorDirection_603980774 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6808:3
  struct_ContentIndicatorConfig_colors_t {.pure, inheritable, bycopy.} = object
    foreground*: GColor_603980564
    background*: GColor_603980564
  struct_ContentIndicatorConfig_603980777 {.pure, inheritable, bycopy.} = object
    layer*: ptr Layer_603980678 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6812:9
    times_out*: bool
    alignment*: GAlign_603980592
    colors*: struct_ContentIndicatorConfig_colors_t
  ContentIndicatorConfig_603980779 = struct_ContentIndicatorConfig_603980778 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6820:3
  struct_MenuIndex_603980781 {.pure, inheritable, bycopy.} = object
    section*: uint16         ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6935:16
    row*: uint16
  MenuIndex_603980783 = struct_MenuIndex_603980782 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6940:3
  struct_MenuCellSpan_603980785 {.pure, inheritable, bycopy.} = object
    y*: int16                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6952:16
    h*: int16
    sep*: int16
    index*: MenuIndex_603980784
  MenuCellSpan_603980787 = struct_MenuCellSpan_603980786 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6957:3
  MenuLayer_603980789 = struct_MenuLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6960:26
  MenuLayerGetNumberOfSectionsCallback_603980791 = proc (
      a0: ptr struct_MenuLayer; a1: pointer): uint16 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6968:20
  MenuLayerGetNumberOfRowsInSectionsCallback_603980793 = proc (
      a0: ptr struct_MenuLayer; a1: uint16; a2: pointer): uint16 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6980:20
  MenuLayerGetCellHeightCallback_603980795 = proc (a0: ptr struct_MenuLayer;
      a1: ptr MenuIndex_603980784; a2: pointer): int16 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:6992:19
  MenuLayerGetHeaderHeightCallback_603980797 = proc (a0: ptr struct_MenuLayer;
      a1: uint16; a2: pointer): int16 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7005:19
  MenuLayerGetSeparatorHeightCallback_603980799 = proc (
      a0: ptr struct_MenuLayer; a1: ptr MenuIndex_603980784; a2: pointer): int16 {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7017:19
  MenuLayerDrawRowCallback_603980801 = proc (a0: ptr GContext_603980598;
      a1: ptr Layer_603980678; a2: ptr MenuIndex_603980784; a3: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7033:16
  MenuLayerDrawHeaderCallback_603980803 = proc (a0: ptr GContext_603980598;
      a1: ptr Layer_603980678; a2: uint16; a3: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7052:16
  MenuLayerDrawSeparatorCallback_603980805 = proc (a0: ptr GContext_603980598;
      a1: ptr Layer_603980678; a2: ptr MenuIndex_603980784; a3: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7069:16
  MenuLayerSelectCallback_603980807 = proc (a0: ptr struct_MenuLayer;
      a1: ptr MenuIndex_603980784; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7081:16
  MenuLayerSelectionChangedCallback_603980809 = proc (a0: ptr struct_MenuLayer;
      a1: MenuIndex_603980784; a2: MenuIndex_603980784; a3: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7093:16
  MenuLayerSelectionWillChangeCallback_603980811 = proc (
      a0: ptr struct_MenuLayer; a1: ptr MenuIndex_603980784; a2: MenuIndex_603980784;
      a3: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7107:16
  MenuLayerDrawBackgroundCallback_603980813 = proc (a0: ptr GContext_603980598;
      a1: ptr Layer_603980678; a2: bool; a3: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7119:16
  struct_MenuLayerCallbacks_603980815 {.pure, inheritable, bycopy.} = object
    get_num_sections*: MenuLayerGetNumberOfSectionsCallback_603980792 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7125:16
    get_num_rows*: MenuLayerGetNumberOfRowsInSectionsCallback_603980794
    get_cell_height*: MenuLayerGetCellHeightCallback_603980796
    get_header_height*: MenuLayerGetHeaderHeightCallback_603980798
    draw_row*: MenuLayerDrawRowCallback_603980802
    draw_header*: MenuLayerDrawHeaderCallback_603980804
    select_click*: MenuLayerSelectCallback_603980808
    select_long_click*: MenuLayerSelectCallback_603980808
    selection_changed*: MenuLayerSelectionChangedCallback_603980810
    get_separator_height*: MenuLayerGetSeparatorHeightCallback_603980800
    draw_separator*: MenuLayerDrawSeparatorCallback_603980806
    selection_will_change*: MenuLayerSelectionWillChangeCallback_603980812
    draw_background*: MenuLayerDrawBackgroundCallback_603980814
  MenuLayerCallbacks_603980817 = struct_MenuLayerCallbacks_603980816 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7202:3
  MenuRowAlign_603980821 = enum_MenuRowAlign_603980820 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7279:3
  SimpleMenuLayer_603980823 = struct_SimpleMenuLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7410:32
  SimpleMenuLayerSelectCallback_603980825 = proc (a0: cint; a1: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7416:16
  struct_SimpleMenuItem_603980827 {.pure, inheritable, bycopy.} = object
    title*: cstring          ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7419:9
    subtitle*: cstring
    icon*: ptr GBitmap_603980582
    callback*: SimpleMenuLayerSelectCallback_603980826
  SimpleMenuItem_603980829 = struct_SimpleMenuItem_603980828 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7429:3
  struct_SimpleMenuSection_603980831 {.pure, inheritable, bycopy.} = object
    title*: cstring          ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7432:9
    items*: ptr SimpleMenuItem_603980830
    num_items*: uint32
  SimpleMenuSection_603980833 = struct_SimpleMenuSection_603980832 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7439:3
  ActionBarLayerIconPressAnimation_603980837 = enum_ActionBarLayerIconPressAnimation_603980836 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7580:3
  ActionBarLayer_603980839 = struct_ActionBarLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7583:31
  StatusBarLayer_603980841 = struct_StatusBarLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7717:31
  StatusBarLayerSeparatorMode_603980845 = enum_StatusBarLayerSeparatorMode_603980844 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7725:3
  BitmapLayer_603980847 = struct_BitmapLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7816:28
  RotBitmapLayer_603980849 = struct_RotBitmapLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7913:31
  NumberWindow_603980851 = struct_NumberWindow ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7981:29
  NumberWindowCallback_603980853 = proc (a0: ptr struct_NumberWindow;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7984:16
  struct_NumberWindowCallbacks_603980855 {.pure, inheritable, bycopy.} = object
    incremented*: NumberWindowCallback_603980854 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7987:9
    decremented*: NumberWindowCallback_603980854
    selected*: NumberWindowCallback_603980854
  NumberWindowCallbacks_603980857 = struct_NumberWindowCallbacks_603980856 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7998:3
  ActionMenuItem_603980859 = struct_ActionMenuItem ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8061:31
  ActionMenuLevel_603980861 = struct_ActionMenuLevel ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8064:32
  ActionMenuAlign_603980865 = enum_ActionMenuAlign_603980864 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8069:3
  ActionMenu_603980867 = struct_ActionMenu ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8071:27
  ActionMenuDidCloseCb_603980869 = proc (a0: ptr ActionMenu_603980868;
      a1: ptr ActionMenuItem_603980860; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8078:16
  ActionMenuLevelDisplayMode_603980873 = enum_ActionMenuLevelDisplayMode_603980872 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8087:3
  ActionMenuPerformActionCb_603980875 = proc (a0: ptr ActionMenu_603980868;
      a1: ptr ActionMenuItem_603980860; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8095:16
  ActionMenuEachItemCb_603980877 = proc (a0: ptr ActionMenuItem_603980860;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8102:16
  struct_ActionMenuConfig_colors_t {.pure, inheritable, bycopy.} = object
    background*: GColor_603980564
    foreground*: GColor_603980564
  struct_ActionMenuConfig_603980879 {.pure, inheritable, bycopy.} = object
    root_level*: ptr ActionMenuLevel_603980862 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8105:9
    context*: pointer
    colors*: struct_ActionMenuConfig_colors_t
    will_close*: ActionMenuDidCloseCb_603980870
    did_close*: ActionMenuDidCloseCb_603980870
    align*: ActionMenuAlign_603980866
  ActionMenuConfig_603980881 = struct_ActionMenuConfig_603980880 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8115:3
  struct_VibePattern_603980883 {.pure, inheritable, bycopy.} = object
    durations*: ptr uint32   ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8248:9
    num_segments*: uint32
  VibePattern_603980885 = struct_VibePattern_603980884 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8258:3
  PreferredContentSize_603980889 = enum_PreferredContentSize_603980888 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8325:3
  compiler_darwin_time_t_603980894 = clong ## Generated based on /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:119:33
  SmartstrapNotifyHandler_603980666 = (when declared(SmartstrapNotifyHandler):
    when ownSizeof(SmartstrapNotifyHandler) !=
        ownSizeof(SmartstrapNotifyHandler_603980665):
      static :
        warning("Declaration of " & "SmartstrapNotifyHandler" &
            " exists but with different size")
    SmartstrapNotifyHandler
  else:
    SmartstrapNotifyHandler_603980665)
  enum_WeekDay_603980309 = (when declared(enum_WeekDay):
    when ownSizeof(enum_WeekDay) != ownSizeof(enum_WeekDay_603980308):
      static :
        warning("Declaration of " & "enum_WeekDay" &
            " exists but with different size")
    enum_WeekDay
  else:
    enum_WeekDay_603980308)
  Dictionary_603980466 = (when declared(Dictionary):
    when ownSizeof(Dictionary) != ownSizeof(Dictionary_603980465):
      static :
        warning("Declaration of " & "Dictionary" &
            " exists but with different size")
    Dictionary
  else:
    Dictionary_603980465)
  AnimationCurveFunction_603980698 = (when declared(AnimationCurveFunction):
    when ownSizeof(AnimationCurveFunction) != ownSizeof(AnimationCurveFunction_603980697):
      static :
        warning("Declaration of " & "AnimationCurveFunction" &
            " exists but with different size")
    AnimationCurveFunction
  else:
    AnimationCurveFunction_603980697)
  SimpleMenuItem_603980830 = (when declared(SimpleMenuItem):
    when ownSizeof(SimpleMenuItem) != ownSizeof(SimpleMenuItem_603980829):
      static :
        warning("Declaration of " & "SimpleMenuItem" &
            " exists but with different size")
    SimpleMenuItem
  else:
    SimpleMenuItem_603980829)
  SimpleMenuSection_603980834 = (when declared(SimpleMenuSection):
    when ownSizeof(SimpleMenuSection) != ownSizeof(SimpleMenuSection_603980833):
      static :
        warning("Declaration of " & "SimpleMenuSection" &
            " exists but with different size")
    SimpleMenuSection
  else:
    SimpleMenuSection_603980833)
  enum_TimeUnits_603980380 = (when declared(enum_TimeUnits):
    when ownSizeof(enum_TimeUnits) != ownSizeof(enum_TimeUnits_603980379):
      static :
        warning("Declaration of " & "enum_TimeUnits" &
            " exists but with different size")
    enum_TimeUnits
  else:
    enum_TimeUnits_603980379)
  HealthActivityMask_603980402 = (when declared(HealthActivityMask):
    when ownSizeof(HealthActivityMask) != ownSizeof(HealthActivityMask_603980401):
      static :
        warning("Declaration of " & "HealthActivityMask" &
            " exists but with different size")
    HealthActivityMask
  else:
    HealthActivityMask_603980401)
  GOvalScaleMode_603980610 = (when declared(GOvalScaleMode):
    when ownSizeof(GOvalScaleMode) != ownSizeof(GOvalScaleMode_603980609):
      static :
        warning("Declaration of " & "GOvalScaleMode" &
            " exists but with different size")
    GOvalScaleMode
  else:
    GOvalScaleMode_603980609)
  struct_AnimationHandlers_603980704 = (when declared(struct_AnimationHandlers):
    when ownSizeof(struct_AnimationHandlers) !=
        ownSizeof(struct_AnimationHandlers_603980703):
      static :
        warning("Declaration of " & "struct_AnimationHandlers" &
            " exists but with different size")
    struct_AnimationHandlers
  else:
    struct_AnimationHandlers_603980703)
  struct_SimpleMenuSection_603980832 = (when declared(struct_SimpleMenuSection):
    when ownSizeof(struct_SimpleMenuSection) !=
        ownSizeof(struct_SimpleMenuSection_603980831):
      static :
        warning("Declaration of " & "struct_SimpleMenuSection" &
            " exists but with different size")
    struct_SimpleMenuSection
  else:
    struct_SimpleMenuSection_603980831)
  struct_GPath_603980632 = (when declared(struct_GPath):
    when ownSizeof(struct_GPath) != ownSizeof(struct_GPath_603980631):
      static :
        warning("Declaration of " & "struct_GPath" &
            " exists but with different size")
    struct_GPath
  else:
    struct_GPath_603980631)
  enum_ButtonId_603980293 = (when declared(enum_ButtonId):
    when ownSizeof(enum_ButtonId) != ownSizeof(enum_ButtonId_603980292):
      static :
        warning("Declaration of " & "enum_ButtonId" &
            " exists but with different size")
    enum_ButtonId
  else:
    enum_ButtonId_603980292)
  FontInfo_603980636 = (when declared(FontInfo):
    when ownSizeof(FontInfo) != ownSizeof(FontInfo_603980635):
      static :
        warning("Declaration of " & "FontInfo" &
            " exists but with different size")
    FontInfo
  else:
    FontInfo_603980635)
  UInt32Getter_603980738 = (when declared(UInt32Getter):
    when ownSizeof(UInt32Getter) != ownSizeof(UInt32Getter_603980737):
      static :
        warning("Declaration of " & "UInt32Getter" &
            " exists but with different size")
    UInt32Getter
  else:
    UInt32Getter_603980737)
  BatteryChargeState_603980335 = (when declared(BatteryChargeState):
    when ownSizeof(BatteryChargeState) != ownSizeof(BatteryChargeState_603980334):
      static :
        warning("Declaration of " & "BatteryChargeState" &
            " exists but with different size")
    BatteryChargeState
  else:
    BatteryChargeState_603980334)
  AppSyncTupleChangedCallback_603980500 = (when declared(
      AppSyncTupleChangedCallback):
    when ownSizeof(AppSyncTupleChangedCallback) !=
        ownSizeof(AppSyncTupleChangedCallback_603980499):
      static :
        warning("Declaration of " & "AppSyncTupleChangedCallback" &
            " exists but with different size")
    AppSyncTupleChangedCallback
  else:
    AppSyncTupleChangedCallback_603980499)
  enum_SniffInterval_603980520 = (when declared(enum_SniffInterval):
    when ownSizeof(enum_SniffInterval) != ownSizeof(enum_SniffInterval_603980519):
      static :
        warning("Declaration of " & "enum_SniffInterval" &
            " exists but with different size")
    enum_SniffInterval
  else:
    enum_SniffInterval_603980519)
  GDrawCommandListIteratorCb_603980620 = (when declared(
      GDrawCommandListIteratorCb):
    when ownSizeof(GDrawCommandListIteratorCb) !=
        ownSizeof(GDrawCommandListIteratorCb_603980619):
      static :
        warning("Declaration of " & "GDrawCommandListIteratorCb" &
            " exists but with different size")
    GDrawCommandListIteratorCb
  else:
    GDrawCommandListIteratorCb_603980619)
  AnimationUpdateImplementation_603980710 = (when declared(
      AnimationUpdateImplementation):
    when ownSizeof(AnimationUpdateImplementation) !=
        ownSizeof(AnimationUpdateImplementation_603980709):
      static :
        warning("Declaration of " & "AnimationUpdateImplementation" &
            " exists but with different size")
    AnimationUpdateImplementation
  else:
    AnimationUpdateImplementation_603980709)
  ActionMenu_603980868 = (when declared(ActionMenu):
    when ownSizeof(ActionMenu) != ownSizeof(ActionMenu_603980867):
      static :
        warning("Declaration of " & "ActionMenu" &
            " exists but with different size")
    ActionMenu
  else:
    ActionMenu_603980867)
  MenuLayerSelectionChangedCallback_603980810 = (when declared(
      MenuLayerSelectionChangedCallback):
    when ownSizeof(MenuLayerSelectionChangedCallback) !=
        ownSizeof(MenuLayerSelectionChangedCallback_603980809):
      static :
        warning("Declaration of " & "MenuLayerSelectionChangedCallback" &
            " exists but with different size")
    MenuLayerSelectionChangedCallback
  else:
    MenuLayerSelectionChangedCallback_603980809)
  MenuLayerGetCellHeightCallback_603980796 = (when declared(
      MenuLayerGetCellHeightCallback):
    when ownSizeof(MenuLayerGetCellHeightCallback) !=
        ownSizeof(MenuLayerGetCellHeightCallback_603980795):
      static :
        warning("Declaration of " & "MenuLayerGetCellHeightCallback" &
            " exists but with different size")
    MenuLayerGetCellHeightCallback
  else:
    MenuLayerGetCellHeightCallback_603980795)
  enum_GCompOp_603980594 = (when declared(enum_GCompOp):
    when ownSizeof(enum_GCompOp) != ownSizeof(enum_GCompOp_603980593):
      static :
        warning("Declaration of " & "enum_GCompOp" &
            " exists but with different size")
    enum_GCompOp
  else:
    enum_GCompOp_603980593)
  MenuLayerSelectionWillChangeCallback_603980812 = (when declared(
      MenuLayerSelectionWillChangeCallback):
    when ownSizeof(MenuLayerSelectionWillChangeCallback) !=
        ownSizeof(MenuLayerSelectionWillChangeCallback_603980811):
      static :
        warning("Declaration of " & "MenuLayerSelectionWillChangeCallback" &
            " exists but with different size")
    MenuLayerSelectionWillChangeCallback
  else:
    MenuLayerSelectionWillChangeCallback_603980811)
  struct_PropertyAnimationAccessors_603980720 = (when declared(
      struct_PropertyAnimationAccessors):
    when ownSizeof(struct_PropertyAnimationAccessors) !=
        ownSizeof(struct_PropertyAnimationAccessors_603980719):
      static :
        warning("Declaration of " & "struct_PropertyAnimationAccessors" &
            " exists but with different size")
    struct_PropertyAnimationAccessors
  else:
    struct_PropertyAnimationAccessors_603980719)
  MenuLayerCallbacks_603980818 = (when declared(MenuLayerCallbacks):
    when ownSizeof(MenuLayerCallbacks) != ownSizeof(MenuLayerCallbacks_603980817):
      static :
        warning("Declaration of " & "MenuLayerCallbacks" &
            " exists but with different size")
    MenuLayerCallbacks
  else:
    MenuLayerCallbacks_603980817)
  HealthValue_603980390 = (when declared(HealthValue):
    when ownSizeof(HealthValue) != ownSizeof(HealthValue_603980389):
      static :
        warning("Declaration of " & "HealthValue" &
            " exists but with different size")
    HealthValue
  else:
    HealthValue_603980389)
  enum_WatchInfoColor_603980301 = (when declared(enum_WatchInfoColor):
    when ownSizeof(enum_WatchInfoColor) != ownSizeof(enum_WatchInfoColor_603980300):
      static :
        warning("Declaration of " & "enum_WatchInfoColor" &
            " exists but with different size")
    enum_WatchInfoColor
  else:
    enum_WatchInfoColor_603980300)
  AccelAxisType_603980349 = (when declared(AccelAxisType):
    when ownSizeof(AccelAxisType) != ownSizeof(AccelAxisType_603980348):
      static :
        warning("Declaration of " & "AccelAxisType" &
            " exists but with different size")
    AccelAxisType
  else:
    AccelAxisType_603980348)
  enum_DataLoggingResult_603980442 = (when declared(enum_DataLoggingResult):
    when ownSizeof(enum_DataLoggingResult) != ownSizeof(enum_DataLoggingResult_603980441):
      static :
        warning("Declaration of " & "enum_DataLoggingResult" &
            " exists but with different size")
    enum_DataLoggingResult
  else:
    enum_DataLoggingResult_603980441)
  AppExitReason_603980544 = (when declared(AppExitReason):
    when ownSizeof(AppExitReason) != ownSizeof(AppExitReason_603980543):
      static :
        warning("Declaration of " & "AppExitReason" &
            " exists but with different size")
    AppExitReason
  else:
    AppExitReason_603980543)
  PropertyAnimationImplementation_603980722 = (when declared(
      PropertyAnimationImplementation):
    when ownSizeof(PropertyAnimationImplementation) !=
        ownSizeof(PropertyAnimationImplementation_603980721):
      static :
        warning("Declaration of " & "PropertyAnimationImplementation" &
            " exists but with different size")
    PropertyAnimationImplementation
  else:
    PropertyAnimationImplementation_603980721)
  PropertyAnimation_603980726 = (when declared(PropertyAnimation):
    when ownSizeof(PropertyAnimation) != ownSizeof(PropertyAnimation_603980725):
      static :
        warning("Declaration of " & "PropertyAnimation" &
            " exists but with different size")
    PropertyAnimation
  else:
    PropertyAnimation_603980725)
  struct_WatchInfoVersion_603980305 = (when declared(struct_WatchInfoVersion):
    when ownSizeof(struct_WatchInfoVersion) !=
        ownSizeof(struct_WatchInfoVersion_603980304):
      static :
        warning("Declaration of " & "struct_WatchInfoVersion" &
            " exists but with different size")
    struct_WatchInfoVersion
  else:
    struct_WatchInfoVersion_603980304)
  NumberWindowCallbacks_603980858 = (when declared(NumberWindowCallbacks):
    when ownSizeof(NumberWindowCallbacks) != ownSizeof(NumberWindowCallbacks_603980857):
      static :
        warning("Declaration of " & "NumberWindowCallbacks" &
            " exists but with different size")
    NumberWindowCallbacks
  else:
    NumberWindowCallbacks_603980857)
  GDrawCommandFrame_603980614 = (when declared(GDrawCommandFrame):
    when ownSizeof(GDrawCommandFrame) != ownSizeof(GDrawCommandFrame_603980613):
      static :
        warning("Declaration of " & "GDrawCommandFrame" &
            " exists but with different size")
    GDrawCommandFrame
  else:
    GDrawCommandFrame_603980613)
  GBitmapDataRowInfo_603980588 = (when declared(GBitmapDataRowInfo):
    when ownSizeof(GBitmapDataRowInfo) != ownSizeof(GBitmapDataRowInfo_603980587):
      static :
        warning("Declaration of " & "GBitmapDataRowInfo" &
            " exists but with different size")
    GBitmapDataRowInfo
  else:
    GBitmapDataRowInfo_603980587)
  MenuLayerDrawRowCallback_603980802 = (when declared(MenuLayerDrawRowCallback):
    when ownSizeof(MenuLayerDrawRowCallback) !=
        ownSizeof(MenuLayerDrawRowCallback_603980801):
      static :
        warning("Declaration of " & "MenuLayerDrawRowCallback" &
            " exists but with different size")
    MenuLayerDrawRowCallback
  else:
    MenuLayerDrawRowCallback_603980801)
  struct_SimpleMenuItem_603980828 = (when declared(struct_SimpleMenuItem):
    when ownSizeof(struct_SimpleMenuItem) != ownSizeof(struct_SimpleMenuItem_603980827):
      static :
        warning("Declaration of " & "struct_SimpleMenuItem" &
            " exists but with different size")
    struct_SimpleMenuItem
  else:
    struct_SimpleMenuItem_603980827)
  Layer_603980678 = (when declared(Layer):
    when ownSizeof(Layer) != ownSizeof(Layer_603980677):
      static :
        warning("Declaration of " & "Layer" & " exists but with different size")
    Layer
  else:
    Layer_603980677)
  struct_AppFocusHandlers_603980329 = (when declared(struct_AppFocusHandlers):
    when ownSizeof(struct_AppFocusHandlers) !=
        ownSizeof(struct_AppFocusHandlers_603980328):
      static :
        warning("Declaration of " & "struct_AppFocusHandlers" &
            " exists but with different size")
    struct_AppFocusHandlers
  else:
    struct_AppFocusHandlers_603980328)
  AnimationImplementation_603980716 = (when declared(AnimationImplementation):
    when ownSizeof(AnimationImplementation) !=
        ownSizeof(AnimationImplementation_603980715):
      static :
        warning("Declaration of " & "AnimationImplementation" &
            " exists but with different size")
    AnimationImplementation
  else:
    AnimationImplementation_603980715)
  enum_ActionBarLayerIconPressAnimation_603980836 = (when declared(
      enum_ActionBarLayerIconPressAnimation):
    when ownSizeof(enum_ActionBarLayerIconPressAnimation) !=
        ownSizeof(enum_ActionBarLayerIconPressAnimation_603980835):
      static :
        warning("Declaration of " & "enum_ActionBarLayerIconPressAnimation" &
            " exists but with different size")
    enum_ActionBarLayerIconPressAnimation
  else:
    enum_ActionBarLayerIconPressAnimation_603980835)
  HealthActivity_603980406 = (when declared(HealthActivity):
    when ownSizeof(HealthActivity) != ownSizeof(HealthActivity_603980405):
      static :
        warning("Declaration of " & "HealthActivity" &
            " exists but with different size")
    HealthActivity
  else:
    HealthActivity_603980405)
  GColor8_603980562 = (when declared(GColor8):
    when ownSizeof(GColor8) != ownSizeof(GColor8_603980561):
      static :
        warning("Declaration of " & "GColor8" &
            " exists but with different size")
    GColor8
  else:
    GColor8_603980561)
  struct_Tuplet_603980472 = (when declared(struct_Tuplet):
    when ownSizeof(struct_Tuplet) != ownSizeof(struct_Tuplet_603980471):
      static :
        warning("Declaration of " & "struct_Tuplet" &
            " exists but with different size")
    struct_Tuplet
  else:
    struct_Tuplet_603980471)
  DictationSessionStatusCallback_603980486 = (when declared(
      DictationSessionStatusCallback):
    when ownSizeof(DictationSessionStatusCallback) !=
        ownSizeof(DictationSessionStatusCallback_603980485):
      static :
        warning("Declaration of " & "DictationSessionStatusCallback" &
            " exists but with different size")
    DictationSessionStatusCallback
  else:
    DictationSessionStatusCallback_603980485)
  DictionarySerializeCallback_603980476 = (when declared(
      DictionarySerializeCallback):
    when ownSizeof(DictionarySerializeCallback) !=
        ownSizeof(DictionarySerializeCallback_603980475):
      static :
        warning("Declaration of " & "DictionarySerializeCallback" &
            " exists but with different size")
    DictionarySerializeCallback
  else:
    DictionarySerializeCallback_603980475)
  GColor8Getter_603980750 = (when declared(GColor8Getter):
    when ownSizeof(GColor8Getter) != ownSizeof(GColor8Getter_603980749):
      static :
        warning("Declaration of " & "GColor8Getter" &
            " exists but with different size")
    GColor8Getter
  else:
    GColor8Getter_603980749)
  ResHandle_603980508 = (when declared(ResHandle):
    when ownSizeof(ResHandle) != ownSizeof(ResHandle_603980507):
      static :
        warning("Declaration of " & "ResHandle" &
            " exists but with different size")
    ResHandle
  else:
    ResHandle_603980507)
  enum_HealthServiceAccessibilityMask_603980414 = (when declared(
      enum_HealthServiceAccessibilityMask):
    when ownSizeof(enum_HealthServiceAccessibilityMask) !=
        ownSizeof(enum_HealthServiceAccessibilityMask_603980413):
      static :
        warning("Declaration of " & "enum_HealthServiceAccessibilityMask" &
            " exists but with different size")
    enum_HealthServiceAccessibilityMask
  else:
    enum_HealthServiceAccessibilityMask_603980413)
  Int16Setter_603980732 = (when declared(Int16Setter):
    when ownSizeof(Int16Setter) != ownSizeof(Int16Setter_603980731):
      static :
        warning("Declaration of " & "Int16Setter" &
            " exists but with different size")
    Int16Setter
  else:
    Int16Setter_603980731)
  MeasurementSystem_603980434 = (when declared(MeasurementSystem):
    when ownSizeof(MeasurementSystem) != ownSizeof(MeasurementSystem_603980433):
      static :
        warning("Declaration of " & "MeasurementSystem" &
            " exists but with different size")
    MeasurementSystem
  else:
    MeasurementSystem_603980433)
  ScrollLayerCallbacks_603980770 = (when declared(ScrollLayerCallbacks):
    when ownSizeof(ScrollLayerCallbacks) != ownSizeof(ScrollLayerCallbacks_603980769):
      static :
        warning("Declaration of " & "ScrollLayerCallbacks" &
            " exists but with different size")
    ScrollLayerCallbacks
  else:
    ScrollLayerCallbacks_603980769)
  ContentIndicatorConfig_603980780 = (when declared(ContentIndicatorConfig):
    when ownSizeof(ContentIndicatorConfig) != ownSizeof(ContentIndicatorConfig_603980779):
      static :
        warning("Declaration of " & "ContentIndicatorConfig" &
            " exists but with different size")
    ContentIndicatorConfig
  else:
    ContentIndicatorConfig_603980779)
  ActionMenuConfig_603980882 = (when declared(ActionMenuConfig):
    when ownSizeof(ActionMenuConfig) != ownSizeof(ActionMenuConfig_603980881):
      static :
        warning("Declaration of " & "ActionMenuConfig" &
            " exists but with different size")
    ActionMenuConfig
  else:
    ActionMenuConfig_603980881)
  struct_AppSync_603980504 = (when declared(struct_AppSync):
    when ownSizeof(struct_AppSync) != ownSizeof(struct_AppSync_603980503):
      static :
        warning("Declaration of " & "struct_AppSync" &
            " exists but with different size")
    struct_AppSync
  else:
    struct_AppSync_603980503)
  AppGlanceResult_603980554 = (when declared(AppGlanceResult):
    when ownSizeof(AppGlanceResult) != ownSizeof(AppGlanceResult_603980553):
      static :
        warning("Declaration of " & "AppGlanceResult" &
            " exists but with different size")
    AppGlanceResult
  else:
    AppGlanceResult_603980553)
  AppSync_603980506 = (when declared(AppSync):
    when ownSizeof(AppSync) != ownSizeof(AppSync_603980505):
      static :
        warning("Declaration of " & "AppSync" &
            " exists but with different size")
    AppSync
  else:
    AppSync_603980505)
  WatchInfoModel_603980299 = (when declared(WatchInfoModel):
    when ownSizeof(WatchInfoModel) != ownSizeof(WatchInfoModel_603980298):
      static :
        warning("Declaration of " & "WatchInfoModel" &
            " exists but with different size")
    WatchInfoModel
  else:
    WatchInfoModel_603980298)
  ConnectionHandler_603980319 = (when declared(ConnectionHandler):
    when ownSizeof(ConnectionHandler) != ownSizeof(ConnectionHandler_603980318):
      static :
        warning("Declaration of " & "ConnectionHandler" &
            " exists but with different size")
    ConnectionHandler
  else:
    ConnectionHandler_603980318)
  GTextOverflowMode_603980642 = (when declared(GTextOverflowMode):
    when ownSizeof(GTextOverflowMode) != ownSizeof(GTextOverflowMode_603980641):
      static :
        warning("Declaration of " & "GTextOverflowMode" &
            " exists but with different size")
    GTextOverflowMode
  else:
    GTextOverflowMode_603980641)
  MenuLayerGetNumberOfSectionsCallback_603980792 = (when declared(
      MenuLayerGetNumberOfSectionsCallback):
    when ownSizeof(MenuLayerGetNumberOfSectionsCallback) !=
        ownSizeof(MenuLayerGetNumberOfSectionsCallback_603980791):
      static :
        warning("Declaration of " & "MenuLayerGetNumberOfSectionsCallback" &
            " exists but with different size")
    MenuLayerGetNumberOfSectionsCallback
  else:
    MenuLayerGetNumberOfSectionsCallback_603980791)
  AppLogLevel_603980452 = (when declared(AppLogLevel):
    when ownSizeof(AppLogLevel) != ownSizeof(AppLogLevel_603980451):
      static :
        warning("Declaration of " & "AppLogLevel" &
            " exists but with different size")
    AppLogLevel
  else:
    AppLogLevel_603980451)
  enum_AccelSamplingRate_603980357 = (when declared(enum_AccelSamplingRate):
    when ownSizeof(enum_AccelSamplingRate) != ownSizeof(enum_AccelSamplingRate_603980356):
      static :
        warning("Declaration of " & "enum_AccelSamplingRate" &
            " exists but with different size")
    enum_AccelSamplingRate
  else:
    enum_AccelSamplingRate_603980356)
  HealthServiceTimeScope_603980396 = (when declared(HealthServiceTimeScope):
    when ownSizeof(HealthServiceTimeScope) != ownSizeof(HealthServiceTimeScope_603980395):
      static :
        warning("Declaration of " & "HealthServiceTimeScope" &
            " exists but with different size")
    HealthServiceTimeScope
  else:
    HealthServiceTimeScope_603980395)
  AnimationHandlers_603980706 = (when declared(AnimationHandlers):
    when ownSizeof(AnimationHandlers) != ownSizeof(AnimationHandlers_603980705):
      static :
        warning("Declaration of " & "AnimationHandlers" &
            " exists but with different size")
    AnimationHandlers
  else:
    AnimationHandlers_603980705)
  struct_AnimationImplementation_603980714 = (when declared(
      struct_AnimationImplementation):
    when ownSizeof(struct_AnimationImplementation) !=
        ownSizeof(struct_AnimationImplementation_603980713):
      static :
        warning("Declaration of " & "struct_AnimationImplementation" &
            " exists but with different size")
    struct_AnimationImplementation
  else:
    struct_AnimationImplementation_603980713)
  GPointSetter_603980740 = (when declared(GPointSetter):
    when ownSizeof(GPointSetter) != ownSizeof(GPointSetter_603980739):
      static :
        warning("Declaration of " & "GPointSetter" &
            " exists but with different size")
    GPointSetter
  else:
    GPointSetter_603980739)
  HealthMinuteData_603980430 = (when declared(HealthMinuteData):
    when ownSizeof(HealthMinuteData) != ownSizeof(HealthMinuteData_603980429):
      static :
        warning("Declaration of " & "HealthMinuteData" &
            " exists but with different size")
    HealthMinuteData
  else:
    HealthMinuteData_603980429)
  AccelDataHandler_603980351 = (when declared(AccelDataHandler):
    when ownSizeof(AccelDataHandler) != ownSizeof(AccelDataHandler_603980350):
      static :
        warning("Declaration of " & "AccelDataHandler" &
            " exists but with different size")
    AccelDataHandler
  else:
    AccelDataHandler_603980350)
  MenuLayerGetNumberOfRowsInSectionsCallback_603980794 = (when declared(
      MenuLayerGetNumberOfRowsInSectionsCallback):
    when ownSizeof(MenuLayerGetNumberOfRowsInSectionsCallback) !=
        ownSizeof(MenuLayerGetNumberOfRowsInSectionsCallback_603980793):
      static :
        warning("Declaration of " & "MenuLayerGetNumberOfRowsInSectionsCallback" &
            " exists but with different size")
    MenuLayerGetNumberOfRowsInSectionsCallback
  else:
    MenuLayerGetNumberOfRowsInSectionsCallback_603980793)
  enum_StatusBarLayerSeparatorMode_603980844 = (when declared(
      enum_StatusBarLayerSeparatorMode):
    when ownSizeof(enum_StatusBarLayerSeparatorMode) !=
        ownSizeof(enum_StatusBarLayerSeparatorMode_603980843):
      static :
        warning("Declaration of " & "enum_StatusBarLayerSeparatorMode" &
            " exists but with different size")
    enum_StatusBarLayerSeparatorMode
  else:
    enum_StatusBarLayerSeparatorMode_603980843)
  enum_GTextOverflowMode_603980640 = (when declared(enum_GTextOverflowMode):
    when ownSizeof(enum_GTextOverflowMode) != ownSizeof(enum_GTextOverflowMode_603980639):
      static :
        warning("Declaration of " & "enum_GTextOverflowMode" &
            " exists but with different size")
    enum_GTextOverflowMode
  else:
    enum_GTextOverflowMode_603980639)
  enum_HealthMetric_603980386 = (when declared(enum_HealthMetric):
    when ownSizeof(enum_HealthMetric) != ownSizeof(enum_HealthMetric_603980385):
      static :
        warning("Declaration of " & "enum_HealthMetric" &
            " exists but with different size")
    enum_HealthMetric
  else:
    enum_HealthMetric_603980385)
  HealthAggregation_603980400 = (when declared(HealthAggregation):
    when ownSizeof(HealthAggregation) != ownSizeof(HealthAggregation_603980399):
      static :
        warning("Declaration of " & "HealthAggregation" &
            " exists but with different size")
    HealthAggregation
  else:
    HealthAggregation_603980399)
  enum_MenuRowAlign_603980820 = (when declared(enum_MenuRowAlign):
    when ownSizeof(enum_MenuRowAlign) != ownSizeof(enum_MenuRowAlign_603980819):
      static :
        warning("Declaration of " & "enum_MenuRowAlign" &
            " exists but with different size")
    enum_MenuRowAlign
  else:
    enum_MenuRowAlign_603980819)
  Int16Getter_603980734 = (when declared(Int16Getter):
    when ownSizeof(Int16Getter) != ownSizeof(Int16Getter_603980733):
      static :
        warning("Declaration of " & "Int16Getter" &
            " exists but with different size")
    Int16Getter
  else:
    Int16Getter_603980733)
  enum_StatusCode_603980528 = (when declared(enum_StatusCode):
    when ownSizeof(enum_StatusCode) != ownSizeof(enum_StatusCode_603980527):
      static :
        warning("Declaration of " & "enum_StatusCode" &
            " exists but with different size")
    enum_StatusCode
  else:
    enum_StatusCode_603980527)
  WindowHandler_603980684 = (when declared(WindowHandler):
    when ownSizeof(WindowHandler) != ownSizeof(WindowHandler_603980683):
      static :
        warning("Declaration of " & "WindowHandler" &
            " exists but with different size")
    WindowHandler
  else:
    WindowHandler_603980683)
  enum_PreferredContentSize_603980888 = (when declared(enum_PreferredContentSize):
    when ownSizeof(enum_PreferredContentSize) !=
        ownSizeof(enum_PreferredContentSize_603980887):
      static :
        warning("Declaration of " & "enum_PreferredContentSize" &
            " exists but with different size")
    enum_PreferredContentSize
  else:
    enum_PreferredContentSize_603980887)
  WatchInfoColor_603980303 = (when declared(WatchInfoColor):
    when ownSizeof(WatchInfoColor) != ownSizeof(WatchInfoColor_603980302):
      static :
        warning("Declaration of " & "WatchInfoColor" &
            " exists but with different size")
    WatchInfoColor
  else:
    WatchInfoColor_603980302)
  ButtonId_603980295 = (when declared(ButtonId):
    when ownSizeof(ButtonId) != ownSizeof(ButtonId_603980294):
      static :
        warning("Declaration of " & "ButtonId" &
            " exists but with different size")
    ButtonId
  else:
    ButtonId_603980294)
  enum_CompassStatus_603980361 = (when declared(enum_CompassStatus):
    when ownSizeof(enum_CompassStatus) != ownSizeof(enum_CompassStatus_603980360):
      static :
        warning("Declaration of " & "enum_CompassStatus" &
            " exists but with different size")
    enum_CompassStatus
  else:
    enum_CompassStatus_603980360)
  enum_TupleType_603980458 = (when declared(enum_TupleType):
    when ownSizeof(enum_TupleType) != ownSizeof(enum_TupleType_603980457):
      static :
        warning("Declaration of " & "enum_TupleType" &
            " exists but with different size")
    enum_TupleType
  else:
    enum_TupleType_603980457)
  ScrollLayer_603980764 = (when declared(ScrollLayer):
    when ownSizeof(ScrollLayer) != ownSizeof(ScrollLayer_603980763):
      static :
        warning("Declaration of " & "ScrollLayer" &
            " exists but with different size")
    ScrollLayer
  else:
    ScrollLayer_603980763)
  GPoint_603980568 = (when declared(GPoint):
    when ownSizeof(GPoint) != ownSizeof(GPoint_603980567):
      static :
        warning("Declaration of " & "GPoint" & " exists but with different size")
    GPoint
  else:
    GPoint_603980567)
  struct_GRect_603980574 = (when declared(struct_GRect):
    when ownSizeof(struct_GRect) != ownSizeof(struct_GRect_603980573):
      static :
        warning("Declaration of " & "struct_GRect" &
            " exists but with different size")
    struct_GRect
  else:
    struct_GRect_603980573)
  AppFocusHandler_603980327 = (when declared(AppFocusHandler):
    when ownSizeof(AppFocusHandler) != ownSizeof(AppFocusHandler_603980326):
      static :
        warning("Declaration of " & "AppFocusHandler" &
            " exists but with different size")
    AppFocusHandler
  else:
    AppFocusHandler_603980326)
  SmartstrapServiceAvailabilityHandler_603980660 = (when declared(
      SmartstrapServiceAvailabilityHandler):
    when ownSizeof(SmartstrapServiceAvailabilityHandler) !=
        ownSizeof(SmartstrapServiceAvailabilityHandler_603980659):
      static :
        warning("Declaration of " & "SmartstrapServiceAvailabilityHandler" &
            " exists but with different size")
    SmartstrapServiceAvailabilityHandler
  else:
    SmartstrapServiceAvailabilityHandler_603980659)
  GRectGetter_603980746 = (when declared(GRectGetter):
    when ownSizeof(GRectGetter) != ownSizeof(GRectGetter_603980745):
      static :
        warning("Declaration of " & "GRectGetter" &
            " exists but with different size")
    GRectGetter
  else:
    GRectGetter_603980745)
  struct_UnobstructedAreaHandlers_603980758 = (when declared(
      struct_UnobstructedAreaHandlers):
    when ownSizeof(struct_UnobstructedAreaHandlers) !=
        ownSizeof(struct_UnobstructedAreaHandlers_603980757):
      static :
        warning("Declaration of " & "struct_UnobstructedAreaHandlers" &
            " exists but with different size")
    struct_UnobstructedAreaHandlers
  else:
    struct_UnobstructedAreaHandlers_603980757)
  GSize_603980572 = (when declared(GSize):
    when ownSizeof(GSize) != ownSizeof(GSize_603980571):
      static :
        warning("Declaration of " & "GSize" & " exists but with different size")
    GSize
  else:
    GSize_603980571)
  MenuLayerDrawHeaderCallback_603980804 = (when declared(
      MenuLayerDrawHeaderCallback):
    when ownSizeof(MenuLayerDrawHeaderCallback) !=
        ownSizeof(MenuLayerDrawHeaderCallback_603980803):
      static :
        warning("Declaration of " & "MenuLayerDrawHeaderCallback" &
            " exists but with different size")
    MenuLayerDrawHeaderCallback
  else:
    MenuLayerDrawHeaderCallback_603980803)
  GColor_603980564 = (when declared(GColor):
    when ownSizeof(GColor) != ownSizeof(GColor_603980563):
      static :
        warning("Declaration of " & "GColor" & " exists but with different size")
    GColor
  else:
    GColor_603980563)
  struct_WindowHandlers_603980686 = (when declared(struct_WindowHandlers):
    when ownSizeof(struct_WindowHandlers) != ownSizeof(struct_WindowHandlers_603980685):
      static :
        warning("Declaration of " & "struct_WindowHandlers" &
            " exists but with different size")
    struct_WindowHandlers
  else:
    struct_WindowHandlers_603980685)
  GCornerMask_603980606 = (when declared(GCornerMask):
    when ownSizeof(GCornerMask) != ownSizeof(GCornerMask_603980605):
      static :
        warning("Declaration of " & "GCornerMask" &
            " exists but with different size")
    GCornerMask
  else:
    GCornerMask_603980605)
  enum_AppGlanceResult_603980552 = (when declared(enum_AppGlanceResult):
    when ownSizeof(enum_AppGlanceResult) != ownSizeof(enum_AppGlanceResult_603980551):
      static :
        warning("Declaration of " & "enum_AppGlanceResult" &
            " exists but with different size")
    enum_AppGlanceResult
  else:
    enum_AppGlanceResult_603980551)
  BluetoothConnectionHandler_603980325 = (when declared(
      BluetoothConnectionHandler):
    when ownSizeof(BluetoothConnectionHandler) !=
        ownSizeof(BluetoothConnectionHandler_603980324):
      static :
        warning("Declaration of " & "BluetoothConnectionHandler" &
            " exists but with different size")
    BluetoothConnectionHandler
  else:
    BluetoothConnectionHandler_603980324)
  enum_HealthServiceTimeScope_603980394 = (when declared(
      enum_HealthServiceTimeScope):
    when ownSizeof(enum_HealthServiceTimeScope) !=
        ownSizeof(enum_HealthServiceTimeScope_603980393):
      static :
        warning("Declaration of " & "enum_HealthServiceTimeScope" &
            " exists but with different size")
    enum_HealthServiceTimeScope
  else:
    enum_HealthServiceTimeScope_603980393)
  HealthActivityIteratorCB_603980408 = (when declared(HealthActivityIteratorCB):
    when ownSizeof(HealthActivityIteratorCB) !=
        ownSizeof(HealthActivityIteratorCB_603980407):
      static :
        warning("Declaration of " & "HealthActivityIteratorCB" &
            " exists but with different size")
    HealthActivityIteratorCB
  else:
    HealthActivityIteratorCB_603980407)
  AppTimerCallback_603980526 = (when declared(AppTimerCallback):
    when ownSizeof(AppTimerCallback) != ownSizeof(AppTimerCallback_603980525):
      static :
        warning("Declaration of " & "AppTimerCallback" &
            " exists but with different size")
    AppTimerCallback
  else:
    AppTimerCallback_603980525)
  enum_AppExitReason_603980542 = (when declared(enum_AppExitReason):
    when ownSizeof(enum_AppExitReason) != ownSizeof(enum_AppExitReason_603980541):
      static :
        warning("Declaration of " & "enum_AppExitReason" &
            " exists but with different size")
    enum_AppExitReason
  else:
    enum_AppExitReason_603980541)
  AccelData_603980341 = (when declared(AccelData):
    when ownSizeof(AccelData) != ownSizeof(AccelData_603980340):
      static :
        warning("Declaration of " & "AccelData" &
            " exists but with different size")
    AccelData
  else:
    AccelData_603980340)
  struct_GPoint_603980566 = (when declared(struct_GPoint):
    when ownSizeof(struct_GPoint) != ownSizeof(struct_GPoint_603980565):
      static :
        warning("Declaration of " & "struct_GPoint" &
            " exists but with different size")
    struct_GPoint
  else:
    struct_GPoint_603980565)
  enum_AnimationCurve_603980694 = (when declared(enum_AnimationCurve):
    when ownSizeof(enum_AnimationCurve) != ownSizeof(enum_AnimationCurve_603980693):
      static :
        warning("Declaration of " & "enum_AnimationCurve" &
            " exists but with different size")
    enum_AnimationCurve
  else:
    enum_AnimationCurve_603980693)
  ContentIndicatorDirection_603980776 = (when declared(ContentIndicatorDirection):
    when ownSizeof(ContentIndicatorDirection) !=
        ownSizeof(ContentIndicatorDirection_603980775):
      static :
        warning("Declaration of " & "ContentIndicatorDirection" &
            " exists but with different size")
    ContentIndicatorDirection
  else:
    ContentIndicatorDirection_603980775)
  struct_ScrollLayerCallbacks_603980768 = (when declared(
      struct_ScrollLayerCallbacks):
    when ownSizeof(struct_ScrollLayerCallbacks) !=
        ownSizeof(struct_ScrollLayerCallbacks_603980767):
      static :
        warning("Declaration of " & "struct_ScrollLayerCallbacks" &
            " exists but with different size")
    struct_ScrollLayerCallbacks
  else:
    struct_ScrollLayerCallbacks_603980767)
  GRectReturn_603980730 = (when declared(GRectReturn):
    when ownSizeof(GRectReturn) != ownSizeof(GRectReturn_603980729):
      static :
        warning("Declaration of " & "GRectReturn" &
            " exists but with different size")
    GRectReturn
  else:
    GRectReturn_603980729)
  GAlign_603980592 = (when declared(GAlign):
    when ownSizeof(GAlign) != ownSizeof(GAlign_603980591):
      static :
        warning("Declaration of " & "GAlign" & " exists but with different size")
    GAlign
  else:
    GAlign_603980591)
  ClickRecognizerRef_603980672 = (when declared(ClickRecognizerRef):
    when ownSizeof(ClickRecognizerRef) != ownSizeof(ClickRecognizerRef_603980671):
      static :
        warning("Declaration of " & "ClickRecognizerRef" &
            " exists but with different size")
    ClickRecognizerRef
  else:
    ClickRecognizerRef_603980671)
  struct_Uuid_603980446 = (when declared(struct_Uuid):
    when ownSizeof(struct_Uuid) != ownSizeof(struct_Uuid_603980445):
      static :
        warning("Declaration of " & "struct_Uuid" &
            " exists but with different size")
    struct_Uuid
  else:
    struct_Uuid_603980445)
  struct_AccelData_603980339 = (when declared(struct_AccelData):
    when ownSizeof(struct_AccelData) != ownSizeof(struct_AccelData_603980338):
      static :
        warning("Declaration of " & "struct_AccelData" &
            " exists but with different size")
    struct_AccelData
  else:
    struct_AccelData_603980338)
  AmbientLightLevel_603980426 = (when declared(AmbientLightLevel):
    when ownSizeof(AmbientLightLevel) != ownSizeof(AmbientLightLevel_603980425):
      static :
        warning("Declaration of " & "AmbientLightLevel" &
            " exists but with different size")
    AmbientLightLevel
  else:
    AmbientLightLevel_603980425)
  tm_603980289 = (when declared(tm):
    when ownSizeof(tm) != ownSizeof(tm_603980288):
      static :
        warning("Declaration of " & "tm" & " exists but with different size")
    tm
  else:
    tm_603980288)
  SmartstrapAttribute_603980658 = (when declared(SmartstrapAttribute):
    when ownSizeof(SmartstrapAttribute) != ownSizeof(SmartstrapAttribute_603980657):
      static :
        warning("Declaration of " & "SmartstrapAttribute" &
            " exists but with different size")
    SmartstrapAttribute
  else:
    SmartstrapAttribute_603980657)
  DictionaryKeyUpdatedCallback_603980478 = (when declared(
      DictionaryKeyUpdatedCallback):
    when ownSizeof(DictionaryKeyUpdatedCallback) !=
        ownSizeof(DictionaryKeyUpdatedCallback_603980477):
      static :
        warning("Declaration of " & "DictionaryKeyUpdatedCallback" &
            " exists but with different size")
    DictionaryKeyUpdatedCallback
  else:
    DictionaryKeyUpdatedCallback_603980477)
  struct_GEdgeInsets_603980600 = (when declared(struct_GEdgeInsets):
    when ownSizeof(struct_GEdgeInsets) != ownSizeof(struct_GEdgeInsets_603980599):
      static :
        warning("Declaration of " & "struct_GEdgeInsets" &
            " exists but with different size")
    struct_GEdgeInsets
  else:
    struct_GEdgeInsets_603980599)
  TextLayer_603980762 = (when declared(TextLayer):
    when ownSizeof(TextLayer) != ownSizeof(TextLayer_603980761):
      static :
        warning("Declaration of " & "TextLayer" &
            " exists but with different size")
    TextLayer
  else:
    TextLayer_603980761)
  enum_HealthEventType_603980418 = (when declared(enum_HealthEventType):
    when ownSizeof(enum_HealthEventType) != ownSizeof(enum_HealthEventType_603980417):
      static :
        warning("Declaration of " & "enum_HealthEventType" &
            " exists but with different size")
    enum_HealthEventType
  else:
    enum_HealthEventType_603980417)
  struct_AppWorkerMessage_603980514 = (when declared(struct_AppWorkerMessage):
    when ownSizeof(struct_AppWorkerMessage) !=
        ownSizeof(struct_AppWorkerMessage_603980513):
      static :
        warning("Declaration of " & "struct_AppWorkerMessage" &
            " exists but with different size")
    struct_AppWorkerMessage
  else:
    struct_AppWorkerMessage_603980513)
  AppMessageResult_603980490 = (when declared(AppMessageResult):
    when ownSizeof(AppMessageResult) != ownSizeof(AppMessageResult_603980489):
      static :
        warning("Declaration of " & "AppMessageResult" &
            " exists but with different size")
    AppMessageResult
  else:
    AppMessageResult_603980489)
  MenuLayerDrawBackgroundCallback_603980814 = (when declared(
      MenuLayerDrawBackgroundCallback):
    when ownSizeof(MenuLayerDrawBackgroundCallback) !=
        ownSizeof(MenuLayerDrawBackgroundCallback_603980813):
      static :
        warning("Declaration of " & "MenuLayerDrawBackgroundCallback" &
            " exists but with different size")
    MenuLayerDrawBackgroundCallback
  else:
    MenuLayerDrawBackgroundCallback_603980813)
  AccelTapHandler_603980355 = (when declared(AccelTapHandler):
    when ownSizeof(AccelTapHandler) != ownSizeof(AccelTapHandler_603980354):
      static :
        warning("Declaration of " & "AccelTapHandler" &
            " exists but with different size")
    AccelTapHandler
  else:
    AccelTapHandler_603980354)
  enum_GCornerMask_603980604 = (when declared(enum_GCornerMask):
    when ownSizeof(enum_GCornerMask) != ownSizeof(enum_GCornerMask_603980603):
      static :
        warning("Declaration of " & "enum_GCornerMask" &
            " exists but with different size")
    enum_GCornerMask
  else:
    enum_GCornerMask_603980603)
  PublishedId_603980546 = (when declared(PublishedId):
    when ownSizeof(PublishedId) != ownSizeof(PublishedId_603980545):
      static :
        warning("Declaration of " & "PublishedId" &
            " exists but with different size")
    PublishedId
  else:
    PublishedId_603980545)
  Tuple_f_603980464 = (when declared(Tuple_f):
    when ownSizeof(Tuple_f) != ownSizeof(Tuple_f_603980463):
      static :
        warning("Declaration of " & "Tuple_f" &
            " exists but with different size")
    Tuple_f
  else:
    Tuple_f_603980463)
  UnobstructedAreaWillChangeHandler_603980752 = (when declared(
      UnobstructedAreaWillChangeHandler):
    when ownSizeof(UnobstructedAreaWillChangeHandler) !=
        ownSizeof(UnobstructedAreaWillChangeHandler_603980751):
      static :
        warning("Declaration of " & "UnobstructedAreaWillChangeHandler" &
            " exists but with different size")
    UnobstructedAreaWillChangeHandler
  else:
    UnobstructedAreaWillChangeHandler_603980751)
  AppGlanceReloadSession_603980556 = (when declared(AppGlanceReloadSession):
    when ownSizeof(AppGlanceReloadSession) != ownSizeof(AppGlanceReloadSession_603980555):
      static :
        warning("Declaration of " & "AppGlanceReloadSession" &
            " exists but with different size")
    AppGlanceReloadSession
  else:
    AppGlanceReloadSession_603980555)
  ActionMenuLevel_603980862 = (when declared(ActionMenuLevel):
    when ownSizeof(ActionMenuLevel) != ownSizeof(ActionMenuLevel_603980861):
      static :
        warning("Declaration of " & "ActionMenuLevel" &
            " exists but with different size")
    ActionMenuLevel
  else:
    ActionMenuLevel_603980861)
  GContext_603980598 = (when declared(GContext):
    when ownSizeof(GContext) != ownSizeof(GContext_603980597):
      static :
        warning("Declaration of " & "GContext" &
            " exists but with different size")
    GContext
  else:
    GContext_603980597)
  SmartstrapServiceId_603980654 = (when declared(SmartstrapServiceId):
    when ownSizeof(SmartstrapServiceId) != ownSizeof(SmartstrapServiceId_603980653):
      static :
        warning("Declaration of " & "SmartstrapServiceId" &
            " exists but with different size")
    SmartstrapServiceId
  else:
    SmartstrapServiceId_603980653)
  AnimationTeardownImplementation_603980712 = (when declared(
      AnimationTeardownImplementation):
    when ownSizeof(AnimationTeardownImplementation) !=
        ownSizeof(AnimationTeardownImplementation_603980711):
      static :
        warning("Declaration of " & "AnimationTeardownImplementation" &
            " exists but with different size")
    AnimationTeardownImplementation
  else:
    AnimationTeardownImplementation_603980711)
  Tuplet_603980474 = (when declared(Tuplet):
    when ownSizeof(Tuplet) != ownSizeof(Tuplet_603980473):
      static :
        warning("Declaration of " & "Tuplet" & " exists but with different size")
    Tuplet
  else:
    Tuplet_603980473)
  struct_CompassHeadingData_603980367 = (when declared(struct_CompassHeadingData):
    when ownSizeof(struct_CompassHeadingData) !=
        ownSizeof(struct_CompassHeadingData_603980366):
      static :
        warning("Declaration of " & "struct_CompassHeadingData" &
            " exists but with different size")
    struct_CompassHeadingData
  else:
    struct_CompassHeadingData_603980366)
  StatusBarLayerSeparatorMode_603980846 = (when declared(
      StatusBarLayerSeparatorMode):
    when ownSizeof(StatusBarLayerSeparatorMode) !=
        ownSizeof(StatusBarLayerSeparatorMode_603980845):
      static :
        warning("Declaration of " & "StatusBarLayerSeparatorMode" &
            " exists but with different size")
    StatusBarLayerSeparatorMode
  else:
    StatusBarLayerSeparatorMode_603980845)
  struct_Tuple_603980462 = (when declared(struct_Tuple):
    when ownSizeof(struct_Tuple) != ownSizeof(struct_Tuple_603980461):
      static :
        warning("Declaration of " & "struct_Tuple" &
            " exists but with different size")
    struct_Tuple
  else:
    struct_Tuple_603980461)
  AppFocusHandlers_603980331 = (when declared(AppFocusHandlers):
    when ownSizeof(AppFocusHandlers) != ownSizeof(AppFocusHandlers_603980330):
      static :
        warning("Declaration of " & "AppFocusHandlers" &
            " exists but with different size")
    AppFocusHandlers
  else:
    AppFocusHandlers_603980330)
  enum_DictionaryResult_603980454 = (when declared(enum_DictionaryResult):
    when ownSizeof(enum_DictionaryResult) != ownSizeof(enum_DictionaryResult_603980453):
      static :
        warning("Declaration of " & "enum_DictionaryResult" &
            " exists but with different size")
    enum_DictionaryResult
  else:
    enum_DictionaryResult_603980453)
  TickHandler_603980384 = (when declared(TickHandler):
    when ownSizeof(TickHandler) != ownSizeof(TickHandler_603980383):
      static :
        warning("Declaration of " & "TickHandler" &
            " exists but with different size")
    TickHandler
  else:
    TickHandler_603980383)
  HealthIterationDirection_603980412 = (when declared(HealthIterationDirection):
    when ownSizeof(HealthIterationDirection) !=
        ownSizeof(HealthIterationDirection_603980411):
      static :
        warning("Declaration of " & "HealthIterationDirection" &
            " exists but with different size")
    HealthIterationDirection
  else:
    HealthIterationDirection_603980411)
  struct_DictionaryIterator_603980468 = (when declared(struct_DictionaryIterator):
    when ownSizeof(struct_DictionaryIterator) !=
        ownSizeof(struct_DictionaryIterator_603980467):
      static :
        warning("Declaration of " & "struct_DictionaryIterator" &
            " exists but with different size")
    struct_DictionaryIterator
  else:
    struct_DictionaryIterator_603980467)
  TimeUnits_603980382 = (when declared(TimeUnits):
    when ownSizeof(TimeUnits) != ownSizeof(TimeUnits_603980381):
      static :
        warning("Declaration of " & "TimeUnits" &
            " exists but with different size")
    TimeUnits
  else:
    TimeUnits_603980381)
  enum_AppLaunchReason_603980538 = (when declared(enum_AppLaunchReason):
    when ownSizeof(enum_AppLaunchReason) != ownSizeof(enum_AppLaunchReason_603980537):
      static :
        warning("Declaration of " & "enum_AppLaunchReason" &
            " exists but with different size")
    enum_AppLaunchReason
  else:
    enum_AppLaunchReason_603980537)
  ClickHandler_603980674 = (when declared(ClickHandler):
    when ownSizeof(ClickHandler) != ownSizeof(ClickHandler_603980673):
      static :
        warning("Declaration of " & "ClickHandler" &
            " exists but with different size")
    ClickHandler
  else:
    ClickHandler_603980673)
  MenuLayerSelectCallback_603980808 = (when declared(MenuLayerSelectCallback):
    when ownSizeof(MenuLayerSelectCallback) !=
        ownSizeof(MenuLayerSelectCallback_603980807):
      static :
        warning("Declaration of " & "MenuLayerSelectCallback" &
            " exists but with different size")
    MenuLayerSelectCallback
  else:
    MenuLayerSelectCallback_603980807)
  NumberWindowCallback_603980854 = (when declared(NumberWindowCallback):
    when ownSizeof(NumberWindowCallback) != ownSizeof(NumberWindowCallback_603980853):
      static :
        warning("Declaration of " & "NumberWindowCallback" &
            " exists but with different size")
    NumberWindowCallback
  else:
    NumberWindowCallback_603980853)
  AppMessageInboxDropped_603980494 = (when declared(AppMessageInboxDropped):
    when ownSizeof(AppMessageInboxDropped) != ownSizeof(AppMessageInboxDropped_603980493):
      static :
        warning("Declaration of " & "AppMessageInboxDropped" &
            " exists but with different size")
    AppMessageInboxDropped
  else:
    AppMessageInboxDropped_603980493)
  struct_SmartstrapHandlers_603980668 = (when declared(struct_SmartstrapHandlers):
    when ownSizeof(struct_SmartstrapHandlers) !=
        ownSizeof(struct_SmartstrapHandlers_603980667):
      static :
        warning("Declaration of " & "struct_SmartstrapHandlers" &
            " exists but with different size")
    struct_SmartstrapHandlers
  else:
    struct_SmartstrapHandlers_603980667)
  struct_MenuCellSpan_603980786 = (when declared(struct_MenuCellSpan):
    when ownSizeof(struct_MenuCellSpan) != ownSizeof(struct_MenuCellSpan_603980785):
      static :
        warning("Declaration of " & "struct_MenuCellSpan" &
            " exists but with different size")
    struct_MenuCellSpan
  else:
    struct_MenuCellSpan_603980785)
  AppLaunchReason_603980540 = (when declared(AppLaunchReason):
    when ownSizeof(AppLaunchReason) != ownSizeof(AppLaunchReason_603980539):
      static :
        warning("Declaration of " & "AppLaunchReason" &
            " exists but with different size")
    AppLaunchReason
  else:
    AppLaunchReason_603980539)
  WindowHandlers_603980688 = (when declared(WindowHandlers):
    when ownSizeof(WindowHandlers) != ownSizeof(WindowHandlers_603980687):
      static :
        warning("Declaration of " & "WindowHandlers" &
            " exists but with different size")
    WindowHandlers
  else:
    WindowHandlers_603980687)
  AppMessageInboxReceived_603980492 = (when declared(AppMessageInboxReceived):
    when ownSizeof(AppMessageInboxReceived) !=
        ownSizeof(AppMessageInboxReceived_603980491):
      static :
        warning("Declaration of " & "AppMessageInboxReceived" &
            " exists but with different size")
    AppMessageInboxReceived
  else:
    AppMessageInboxReceived_603980491)
  struct_BatteryChargeState_603980333 = (when declared(struct_BatteryChargeState):
    when ownSizeof(struct_BatteryChargeState) !=
        ownSizeof(struct_BatteryChargeState_603980332):
      static :
        warning("Declaration of " & "struct_BatteryChargeState" &
            " exists but with different size")
    struct_BatteryChargeState
  else:
    struct_BatteryChargeState_603980332)
  enum_GTextAlignment_603980644 = (when declared(enum_GTextAlignment):
    when ownSizeof(enum_GTextAlignment) != ownSizeof(enum_GTextAlignment_603980643):
      static :
        warning("Declaration of " & "enum_GTextAlignment" &
            " exists but with different size")
    enum_GTextAlignment
  else:
    enum_GTextAlignment_603980643)
  UnobstructedAreaDidChangeHandler_603980756 = (when declared(
      UnobstructedAreaDidChangeHandler):
    when ownSizeof(UnobstructedAreaDidChangeHandler) !=
        ownSizeof(UnobstructedAreaDidChangeHandler_603980755):
      static :
        warning("Declaration of " & "UnobstructedAreaDidChangeHandler" &
            " exists but with different size")
    UnobstructedAreaDidChangeHandler
  else:
    UnobstructedAreaDidChangeHandler_603980755)
  LayerUpdateProc_603980680 = (when declared(LayerUpdateProc):
    when ownSizeof(LayerUpdateProc) != ownSizeof(LayerUpdateProc_603980679):
      static :
        warning("Declaration of " & "LayerUpdateProc" &
            " exists but with different size")
    LayerUpdateProc
  else:
    LayerUpdateProc_603980679)
  HealthEventHandler_603980422 = (when declared(HealthEventHandler):
    when ownSizeof(HealthEventHandler) != ownSizeof(HealthEventHandler_603980421):
      static :
        warning("Declaration of " & "HealthEventHandler" &
            " exists but with different size")
    HealthEventHandler
  else:
    HealthEventHandler_603980421)
  enum_ActionMenuLevelDisplayMode_603980872 = (when declared(
      enum_ActionMenuLevelDisplayMode):
    when ownSizeof(enum_ActionMenuLevelDisplayMode) !=
        ownSizeof(enum_ActionMenuLevelDisplayMode_603980871):
      static :
        warning("Declaration of " & "enum_ActionMenuLevelDisplayMode" &
            " exists but with different size")
    enum_ActionMenuLevelDisplayMode
  else:
    enum_ActionMenuLevelDisplayMode_603980871)
  WakeupId_603980534 = (when declared(WakeupId):
    when ownSizeof(WakeupId) != ownSizeof(WakeupId_603980533):
      static :
        warning("Declaration of " & "WakeupId" &
            " exists but with different size")
    WakeupId
  else:
    WakeupId_603980533)
  SmartstrapResult_603980652 = (when declared(SmartstrapResult):
    when ownSizeof(SmartstrapResult) != ownSizeof(SmartstrapResult_603980651):
      static :
        warning("Declaration of " & "SmartstrapResult" &
            " exists but with different size")
    SmartstrapResult
  else:
    SmartstrapResult_603980651)
  MenuCellSpan_603980788 = (when declared(MenuCellSpan):
    when ownSizeof(MenuCellSpan) != ownSizeof(MenuCellSpan_603980787):
      static :
        warning("Declaration of " & "MenuCellSpan" &
            " exists but with different size")
    MenuCellSpan
  else:
    MenuCellSpan_603980787)
  DataLoggingSessionRef_603980436 = (when declared(DataLoggingSessionRef):
    when ownSizeof(DataLoggingSessionRef) != ownSizeof(DataLoggingSessionRef_603980435):
      static :
        warning("Declaration of " & "DataLoggingSessionRef" &
            " exists but with different size")
    DataLoggingSessionRef
  else:
    DataLoggingSessionRef_603980435)
  StatusBarLayer_603980842 = (when declared(StatusBarLayer):
    when ownSizeof(StatusBarLayer) != ownSizeof(StatusBarLayer_603980841):
      static :
        warning("Declaration of " & "StatusBarLayer" &
            " exists but with different size")
    StatusBarLayer
  else:
    StatusBarLayer_603980841)
  AccelRawData_603980345 = (when declared(AccelRawData):
    when ownSizeof(AccelRawData) != ownSizeof(AccelRawData_603980344):
      static :
        warning("Declaration of " & "AccelRawData" &
            " exists but with different size")
    AccelRawData
  else:
    AccelRawData_603980344)
  struct_ActionMenuConfig_603980880 = (when declared(struct_ActionMenuConfig):
    when ownSizeof(struct_ActionMenuConfig) !=
        ownSizeof(struct_ActionMenuConfig_603980879):
      static :
        warning("Declaration of " & "struct_ActionMenuConfig" &
            " exists but with different size")
    struct_ActionMenuConfig
  else:
    struct_ActionMenuConfig_603980879)
  struct_tm_603980291 = (when declared(struct_tm):
    when ownSizeof(struct_tm) != ownSizeof(struct_tm_603980290):
      static :
        warning("Declaration of " & "struct_tm" &
            " exists but with different size")
    struct_tm
  else:
    struct_tm_603980290)
  enum_GOvalScaleMode_603980608 = (when declared(enum_GOvalScaleMode):
    when ownSizeof(enum_GOvalScaleMode) != ownSizeof(enum_GOvalScaleMode_603980607):
      static :
        warning("Declaration of " & "enum_GOvalScaleMode" &
            " exists but with different size")
    enum_GOvalScaleMode
  else:
    enum_GOvalScaleMode_603980607)
  ActionMenuLevelDisplayMode_603980874 = (when declared(
      ActionMenuLevelDisplayMode):
    when ownSizeof(ActionMenuLevelDisplayMode) !=
        ownSizeof(ActionMenuLevelDisplayMode_603980873):
      static :
        warning("Declaration of " & "ActionMenuLevelDisplayMode" &
            " exists but with different size")
    ActionMenuLevelDisplayMode
  else:
    ActionMenuLevelDisplayMode_603980873)
  status_t_603980532 = (when declared(status_t):
    when ownSizeof(status_t) != ownSizeof(status_t_603980531):
      static :
        warning("Declaration of " & "status_t" &
            " exists but with different size")
    status_t
  else:
    status_t_603980531)
  VibePattern_603980886 = (when declared(VibePattern):
    when ownSizeof(VibePattern) != ownSizeof(VibePattern_603980885):
      static :
        warning("Declaration of " & "VibePattern" &
            " exists but with different size")
    VibePattern
  else:
    VibePattern_603980885)
  GDrawCommand_603980612 = (when declared(GDrawCommand):
    when ownSizeof(GDrawCommand) != ownSizeof(GDrawCommand_603980611):
      static :
        warning("Declaration of " & "GDrawCommand" &
            " exists but with different size")
    GDrawCommand
  else:
    GDrawCommand_603980611)
  SimpleMenuLayer_603980824 = (when declared(SimpleMenuLayer):
    when ownSizeof(SimpleMenuLayer) != ownSizeof(SimpleMenuLayer_603980823):
      static :
        warning("Declaration of " & "SimpleMenuLayer" &
            " exists but with different size")
    SimpleMenuLayer
  else:
    SimpleMenuLayer_603980823)
  GDrawCommandType_603980626 = (when declared(GDrawCommandType):
    when ownSizeof(GDrawCommandType) != ownSizeof(GDrawCommandType_603980625):
      static :
        warning("Declaration of " & "GDrawCommandType" &
            " exists but with different size")
    GDrawCommandType
  else:
    GDrawCommandType_603980625)
  enum_DataLoggingItemType_603980438 = (when declared(enum_DataLoggingItemType):
    when ownSizeof(enum_DataLoggingItemType) !=
        ownSizeof(enum_DataLoggingItemType_603980437):
      static :
        warning("Declaration of " & "enum_DataLoggingItemType" &
            " exists but with different size")
    enum_DataLoggingItemType
  else:
    enum_DataLoggingItemType_603980437)
  GPointGetter_603980742 = (when declared(GPointGetter):
    when ownSizeof(GPointGetter) != ownSizeof(GPointGetter_603980741):
      static :
        warning("Declaration of " & "GPointGetter" &
            " exists but with different size")
    GPointGetter
  else:
    GPointGetter_603980741)
  HealthServiceAccessibilityMask_603980416 = (when declared(
      HealthServiceAccessibilityMask):
    when ownSizeof(HealthServiceAccessibilityMask) !=
        ownSizeof(HealthServiceAccessibilityMask_603980415):
      static :
        warning("Declaration of " & "HealthServiceAccessibilityMask" &
            " exists but with different size")
    HealthServiceAccessibilityMask
  else:
    HealthServiceAccessibilityMask_603980415)
  enum_ActionMenuAlign_603980864 = (when declared(enum_ActionMenuAlign):
    when ownSizeof(enum_ActionMenuAlign) != ownSizeof(enum_ActionMenuAlign_603980863):
      static :
        warning("Declaration of " & "enum_ActionMenuAlign" &
            " exists but with different size")
    enum_ActionMenuAlign
  else:
    enum_ActionMenuAlign_603980863)
  enum_AppLogLevel_603980450 = (when declared(enum_AppLogLevel):
    when ownSizeof(enum_AppLogLevel) != ownSizeof(enum_AppLogLevel_603980449):
      static :
        warning("Declaration of " & "enum_AppLogLevel" &
            " exists but with different size")
    enum_AppLogLevel
  else:
    enum_AppLogLevel_603980449)
  DataLoggingItemType_603980440 = (when declared(DataLoggingItemType):
    when ownSizeof(DataLoggingItemType) != ownSizeof(DataLoggingItemType_603980439):
      static :
        warning("Declaration of " & "DataLoggingItemType" &
            " exists but with different size")
    DataLoggingItemType
  else:
    DataLoggingItemType_603980439)
  AppGlanceSlice_603980550 = (when declared(AppGlanceSlice):
    when ownSizeof(AppGlanceSlice) != ownSizeof(AppGlanceSlice_603980549):
      static :
        warning("Declaration of " & "AppGlanceSlice" &
            " exists but with different size")
    AppGlanceSlice
  else:
    AppGlanceSlice_603980549)
  AnimationStartedHandler_603980700 = (when declared(AnimationStartedHandler):
    when ownSizeof(AnimationStartedHandler) !=
        ownSizeof(AnimationStartedHandler_603980699):
      static :
        warning("Declaration of " & "AnimationStartedHandler" &
            " exists but with different size")
    AnimationStartedHandler
  else:
    AnimationStartedHandler_603980699)
  HealthMetric_603980388 = (when declared(HealthMetric):
    when ownSizeof(HealthMetric) != ownSizeof(HealthMetric_603980387):
      static :
        warning("Declaration of " & "HealthMetric" &
            " exists but with different size")
    HealthMetric
  else:
    HealthMetric_603980387)
  DictationSession_603980480 = (when declared(DictationSession):
    when ownSizeof(DictationSession) != ownSizeof(DictationSession_603980479):
      static :
        warning("Declaration of " & "DictationSession" &
            " exists but with different size")
    DictationSession
  else:
    DictationSession_603980479)
  GPointReturn_603980728 = (when declared(GPointReturn):
    when ownSizeof(GPointReturn) != ownSizeof(GPointReturn_603980727):
      static :
        warning("Declaration of " & "GPointReturn" &
            " exists but with different size")
    GPointReturn
  else:
    GPointReturn_603980727)
  enum_ContentIndicatorDirection_603980774 = (when declared(
      enum_ContentIndicatorDirection):
    when ownSizeof(enum_ContentIndicatorDirection) !=
        ownSizeof(enum_ContentIndicatorDirection_603980773):
      static :
        warning("Declaration of " & "enum_ContentIndicatorDirection" &
            " exists but with different size")
    enum_ContentIndicatorDirection
  else:
    enum_ContentIndicatorDirection_603980773)
  SniffInterval_603980522 = (when declared(SniffInterval):
    when ownSizeof(SniffInterval) != ownSizeof(SniffInterval_603980521):
      static :
        warning("Declaration of " & "SniffInterval" &
            " exists but with different size")
    SniffInterval
  else:
    SniffInterval_603980521)
  CompassHeadingData_603980369 = (when declared(CompassHeadingData):
    when ownSizeof(CompassHeadingData) != ownSizeof(CompassHeadingData_603980368):
      static :
        warning("Declaration of " & "CompassHeadingData" &
            " exists but with different size")
    CompassHeadingData
  else:
    CompassHeadingData_603980368)
  AnimationProgress_603980692 = (when declared(AnimationProgress):
    when ownSizeof(AnimationProgress) != ownSizeof(AnimationProgress_603980691):
      static :
        warning("Declaration of " & "AnimationProgress" &
            " exists but with different size")
    AnimationProgress
  else:
    AnimationProgress_603980691)
  BitmapLayer_603980848 = (when declared(BitmapLayer):
    when ownSizeof(BitmapLayer) != ownSizeof(BitmapLayer_603980847):
      static :
        warning("Declaration of " & "BitmapLayer" &
            " exists but with different size")
    BitmapLayer
  else:
    BitmapLayer_603980847)
  PlatformType_603980317 = (when declared(PlatformType):
    when ownSizeof(PlatformType) != ownSizeof(PlatformType_603980316):
      static :
        warning("Declaration of " & "PlatformType" &
            " exists but with different size")
    PlatformType
  else:
    PlatformType_603980316)
  struct_GBitmapDataRowInfo_603980586 = (when declared(struct_GBitmapDataRowInfo):
    when ownSizeof(struct_GBitmapDataRowInfo) !=
        ownSizeof(struct_GBitmapDataRowInfo_603980585):
      static :
        warning("Declaration of " & "struct_GBitmapDataRowInfo" &
            " exists but with different size")
    struct_GBitmapDataRowInfo
  else:
    struct_GBitmapDataRowInfo_603980585)
  enum_GDrawCommandType_603980624 = (when declared(enum_GDrawCommandType):
    when ownSizeof(enum_GDrawCommandType) != ownSizeof(enum_GDrawCommandType_603980623):
      static :
        warning("Declaration of " & "enum_GDrawCommandType" &
            " exists but with different size")
    enum_GDrawCommandType
  else:
    enum_GDrawCommandType_603980623)
  AppGlanceReloadCallback_603980558 = (when declared(AppGlanceReloadCallback):
    when ownSizeof(AppGlanceReloadCallback) !=
        ownSizeof(AppGlanceReloadCallback_603980557):
      static :
        warning("Declaration of " & "AppGlanceReloadCallback" &
            " exists but with different size")
    AppGlanceReloadCallback
  else:
    AppGlanceReloadCallback_603980557)
  AccelSamplingRate_603980359 = (when declared(AccelSamplingRate):
    when ownSizeof(AccelSamplingRate) != ownSizeof(AccelSamplingRate_603980358):
      static :
        warning("Declaration of " & "AccelSamplingRate" &
            " exists but with different size")
    AccelSamplingRate
  else:
    AccelSamplingRate_603980358)
  GTextAlignment_603980646 = (when declared(GTextAlignment):
    when ownSizeof(GTextAlignment) != ownSizeof(GTextAlignment_603980645):
      static :
        warning("Declaration of " & "GTextAlignment" &
            " exists but with different size")
    GTextAlignment
  else:
    GTextAlignment_603980645)
  struct_HealthMinuteData_603980428 = (when declared(struct_HealthMinuteData):
    when ownSizeof(struct_HealthMinuteData) !=
        ownSizeof(struct_HealthMinuteData_603980427):
      static :
        warning("Declaration of " & "struct_HealthMinuteData" &
            " exists but with different size")
    struct_HealthMinuteData
  else:
    struct_HealthMinuteData_603980427)
  DictionaryIterator_603980470 = (when declared(DictionaryIterator):
    when ownSizeof(DictionaryIterator) != ownSizeof(DictionaryIterator_603980469):
      static :
        warning("Declaration of " & "DictionaryIterator" &
            " exists but with different size")
    DictionaryIterator
  else:
    DictionaryIterator_603980469)
  AppTimer_603980524 = (when declared(AppTimer):
    when ownSizeof(AppTimer) != ownSizeof(AppTimer_603980523):
      static :
        warning("Declaration of " & "AppTimer" &
            " exists but with different size")
    AppTimer
  else:
    AppTimer_603980523)
  NumberWindow_603980852 = (when declared(NumberWindow):
    when ownSizeof(NumberWindow) != ownSizeof(NumberWindow_603980851):
      static :
        warning("Declaration of " & "NumberWindow" &
            " exists but with different size")
    NumberWindow
  else:
    NumberWindow_603980851)
  HealthMetricAlert_603980392 = (when declared(HealthMetricAlert):
    when ownSizeof(HealthMetricAlert) != ownSizeof(HealthMetricAlert_603980391):
      static :
        warning("Declaration of " & "HealthMetricAlert" &
            " exists but with different size")
    HealthMetricAlert
  else:
    HealthMetricAlert_603980391)
  MenuLayer_603980790 = (when declared(MenuLayer):
    when ownSizeof(MenuLayer) != ownSizeof(MenuLayer_603980789):
      static :
        warning("Declaration of " & "MenuLayer" &
            " exists but with different size")
    MenuLayer
  else:
    MenuLayer_603980789)
  enum_MeasurementSystem_603980432 = (when declared(enum_MeasurementSystem):
    when ownSizeof(enum_MeasurementSystem) != ownSizeof(enum_MeasurementSystem_603980431):
      static :
        warning("Declaration of " & "enum_MeasurementSystem" &
            " exists but with different size")
    enum_MeasurementSystem
  else:
    enum_MeasurementSystem_603980431)
  WatchInfoVersion_603980307 = (when declared(WatchInfoVersion):
    when ownSizeof(WatchInfoVersion) != ownSizeof(WatchInfoVersion_603980306):
      static :
        warning("Declaration of " & "WatchInfoVersion" &
            " exists but with different size")
    WatchInfoVersion
  else:
    WatchInfoVersion_603980306)
  UnobstructedAreaChangeHandler_603980754 = (when declared(
      UnobstructedAreaChangeHandler):
    when ownSizeof(UnobstructedAreaChangeHandler) !=
        ownSizeof(UnobstructedAreaChangeHandler_603980753):
      static :
        warning("Declaration of " & "UnobstructedAreaChangeHandler" &
            " exists but with different size")
    UnobstructedAreaChangeHandler
  else:
    UnobstructedAreaChangeHandler_603980753)
  enum_AccelAxisType_603980347 = (when declared(enum_AccelAxisType):
    when ownSizeof(enum_AccelAxisType) != ownSizeof(enum_AccelAxisType_603980346):
      static :
        warning("Declaration of " & "enum_AccelAxisType" &
            " exists but with different size")
    enum_AccelAxisType
  else:
    enum_AccelAxisType_603980346)
  enum_HealthIterationDirection_603980410 = (when declared(
      enum_HealthIterationDirection):
    when ownSizeof(enum_HealthIterationDirection) !=
        ownSizeof(enum_HealthIterationDirection_603980409):
      static :
        warning("Declaration of " & "enum_HealthIterationDirection" &
            " exists but with different size")
    enum_HealthIterationDirection
  else:
    enum_HealthIterationDirection_603980409)
  enum_AmbientLightLevel_603980424 = (when declared(enum_AmbientLightLevel):
    when ownSizeof(enum_AmbientLightLevel) != ownSizeof(enum_AmbientLightLevel_603980423):
      static :
        warning("Declaration of " & "enum_AmbientLightLevel" &
            " exists but with different size")
    enum_AmbientLightLevel
  else:
    enum_AmbientLightLevel_603980423)
  AppWorkerMessage_603980516 = (when declared(AppWorkerMessage):
    when ownSizeof(AppWorkerMessage) != ownSizeof(AppWorkerMessage_603980515):
      static :
        warning("Declaration of " & "AppWorkerMessage" &
            " exists but with different size")
    AppWorkerMessage
  else:
    AppWorkerMessage_603980515)
  AnimationStoppedHandler_603980702 = (when declared(AnimationStoppedHandler):
    when ownSizeof(AnimationStoppedHandler) !=
        ownSizeof(AnimationStoppedHandler_603980701):
      static :
        warning("Declaration of " & "AnimationStoppedHandler" &
            " exists but with different size")
    AnimationStoppedHandler
  else:
    AnimationStoppedHandler_603980701)
  BatteryStateHandler_603980337 = (when declared(BatteryStateHandler):
    when ownSizeof(BatteryStateHandler) != ownSizeof(BatteryStateHandler_603980336):
      static :
        warning("Declaration of " & "BatteryStateHandler" &
            " exists but with different size")
    BatteryStateHandler
  else:
    BatteryStateHandler_603980336)
  GCompOp_603980596 = (when declared(GCompOp):
    when ownSizeof(GCompOp) != ownSizeof(GCompOp_603980595):
      static :
        warning("Declaration of " & "GCompOp" &
            " exists but with different size")
    GCompOp
  else:
    GCompOp_603980595)
  GDrawCommandSequence_603980622 = (when declared(GDrawCommandSequence):
    when ownSizeof(GDrawCommandSequence) != ownSizeof(GDrawCommandSequence_603980621):
      static :
        warning("Declaration of " & "GDrawCommandSequence" &
            " exists but with different size")
    GDrawCommandSequence
  else:
    GDrawCommandSequence_603980621)
  GRectSetter_603980744 = (when declared(GRectSetter):
    when ownSizeof(GRectSetter) != ownSizeof(GRectSetter_603980743):
      static :
        warning("Declaration of " & "GRectSetter" &
            " exists but with different size")
    GRectSetter
  else:
    GRectSetter_603980743)
  struct_ConnectionHandlers_603980321 = (when declared(struct_ConnectionHandlers):
    when ownSizeof(struct_ConnectionHandlers) !=
        ownSizeof(struct_ConnectionHandlers_603980320):
      static :
        warning("Declaration of " & "struct_ConnectionHandlers" &
            " exists but with different size")
    struct_ConnectionHandlers
  else:
    struct_ConnectionHandlers_603980320)
  MenuLayerGetHeaderHeightCallback_603980798 = (when declared(
      MenuLayerGetHeaderHeightCallback):
    when ownSizeof(MenuLayerGetHeaderHeightCallback) !=
        ownSizeof(MenuLayerGetHeaderHeightCallback_603980797):
      static :
        warning("Declaration of " & "MenuLayerGetHeaderHeightCallback" &
            " exists but with different size")
    MenuLayerGetHeaderHeightCallback
  else:
    MenuLayerGetHeaderHeightCallback_603980797)
  GBitmap_603980582 = (when declared(GBitmap):
    when ownSizeof(GBitmap) != ownSizeof(GBitmap_603980581):
      static :
        warning("Declaration of " & "GBitmap" &
            " exists but with different size")
    GBitmap
  else:
    GBitmap_603980581)
  enum_AppMessageResult_603980488 = (when declared(enum_AppMessageResult):
    when ownSizeof(enum_AppMessageResult) != ownSizeof(enum_AppMessageResult_603980487):
      static :
        warning("Declaration of " & "enum_AppMessageResult" &
            " exists but with different size")
    enum_AppMessageResult
  else:
    enum_AppMessageResult_603980487)
  MenuLayerGetSeparatorHeightCallback_603980800 = (when declared(
      MenuLayerGetSeparatorHeightCallback):
    when ownSizeof(MenuLayerGetSeparatorHeightCallback) !=
        ownSizeof(MenuLayerGetSeparatorHeightCallback_603980799):
      static :
        warning("Declaration of " & "MenuLayerGetSeparatorHeightCallback" &
            " exists but with different size")
    MenuLayerGetSeparatorHeightCallback
  else:
    MenuLayerGetSeparatorHeightCallback_603980799)
  enum_HealthActivity_603980404 = (when declared(enum_HealthActivity):
    when ownSizeof(enum_HealthActivity) != ownSizeof(enum_HealthActivity_603980403):
      static :
        warning("Declaration of " & "enum_HealthActivity" &
            " exists but with different size")
    enum_HealthActivity
  else:
    enum_HealthActivity_603980403)
  MenuRowAlign_603980822 = (when declared(MenuRowAlign):
    when ownSizeof(MenuRowAlign) != ownSizeof(MenuRowAlign_603980821):
      static :
        warning("Declaration of " & "MenuRowAlign" &
            " exists but with different size")
    MenuRowAlign
  else:
    MenuRowAlign_603980821)
  time_t_603980313 = (when declared(time_t):
    when ownSizeof(time_t) != ownSizeof(time_t_603980312):
      static :
        warning("Declaration of " & "time_t" & " exists but with different size")
    time_t
  else:
    time_t_603980312)
  AppMessageOutboxSent_603980496 = (when declared(AppMessageOutboxSent):
    when ownSizeof(AppMessageOutboxSent) != ownSizeof(AppMessageOutboxSent_603980495):
      static :
        warning("Declaration of " & "AppMessageOutboxSent" &
            " exists but with different size")
    AppMessageOutboxSent
  else:
    AppMessageOutboxSent_603980495)
  DictationSessionStatus_603980484 = (when declared(DictationSessionStatus):
    when ownSizeof(DictationSessionStatus) != ownSizeof(DictationSessionStatus_603980483):
      static :
        warning("Declaration of " & "DictationSessionStatus" &
            " exists but with different size")
    DictationSessionStatus
  else:
    DictationSessionStatus_603980483)
  GBitmapSequence_603980584 = (when declared(GBitmapSequence):
    when ownSizeof(GBitmapSequence) != ownSizeof(GBitmapSequence_603980583):
      static :
        warning("Declaration of " & "GBitmapSequence" &
            " exists but with different size")
    GBitmapSequence
  else:
    GBitmapSequence_603980583)
  AppMessageOutboxFailed_603980498 = (when declared(AppMessageOutboxFailed):
    when ownSizeof(AppMessageOutboxFailed) != ownSizeof(AppMessageOutboxFailed_603980497):
      static :
        warning("Declaration of " & "AppMessageOutboxFailed" &
            " exists but with different size")
    AppMessageOutboxFailed
  else:
    AppMessageOutboxFailed_603980497)
  TupleType_603980460 = (when declared(TupleType):
    when ownSizeof(TupleType) != ownSizeof(TupleType_603980459):
      static :
        warning("Declaration of " & "TupleType" &
            " exists but with different size")
    TupleType
  else:
    TupleType_603980459)
  struct_GPathInfo_603980628 = (when declared(struct_GPathInfo):
    when ownSizeof(struct_GPathInfo) != ownSizeof(struct_GPathInfo_603980627):
      static :
        warning("Declaration of " & "struct_GPathInfo" &
            " exists but with different size")
    struct_GPathInfo
  else:
    struct_GPathInfo_603980627)
  GPathInfo_603980630 = (when declared(GPathInfo):
    when ownSizeof(GPathInfo) != ownSizeof(GPathInfo_603980629):
      static :
        warning("Declaration of " & "GPathInfo" &
            " exists but with different size")
    GPathInfo
  else:
    GPathInfo_603980629)
  enum_AppWorkerResult_603980510 = (when declared(enum_AppWorkerResult):
    when ownSizeof(enum_AppWorkerResult) != ownSizeof(enum_AppWorkerResult_603980509):
      static :
        warning("Declaration of " & "enum_AppWorkerResult" &
            " exists but with different size")
    enum_AppWorkerResult
  else:
    enum_AppWorkerResult_603980509)
  enum_GBitmapFormat_603980578 = (when declared(enum_GBitmapFormat):
    when ownSizeof(enum_GBitmapFormat) != ownSizeof(enum_GBitmapFormat_603980577):
      static :
        warning("Declaration of " & "enum_GBitmapFormat" &
            " exists but with different size")
    enum_GBitmapFormat
  else:
    enum_GBitmapFormat_603980577)
  CompassHeading_603980365 = (when declared(CompassHeading):
    when ownSizeof(CompassHeading) != ownSizeof(CompassHeading_603980364):
      static :
        warning("Declaration of " & "CompassHeading" &
            " exists but with different size")
    CompassHeading
  else:
    CompassHeading_603980364)
  GColor8Setter_603980748 = (when declared(GColor8Setter):
    when ownSizeof(GColor8Setter) != ownSizeof(GColor8Setter_603980747):
      static :
        warning("Declaration of " & "GColor8Setter" &
            " exists but with different size")
    GColor8Setter
  else:
    GColor8Setter_603980747)
  struct_MenuLayerCallbacks_603980816 = (when declared(struct_MenuLayerCallbacks):
    when ownSizeof(struct_MenuLayerCallbacks) !=
        ownSizeof(struct_MenuLayerCallbacks_603980815):
      static :
        warning("Declaration of " & "struct_MenuLayerCallbacks" &
            " exists but with different size")
    struct_MenuLayerCallbacks
  else:
    struct_MenuLayerCallbacks_603980815)
  GDrawCommandList_603980618 = (when declared(GDrawCommandList):
    when ownSizeof(GDrawCommandList) != ownSizeof(GDrawCommandList_603980617):
      static :
        warning("Declaration of " & "GDrawCommandList" &
            " exists but with different size")
    GDrawCommandList
  else:
    GDrawCommandList_603980617)
  struct_NumberWindowCallbacks_603980856 = (when declared(
      struct_NumberWindowCallbacks):
    when ownSizeof(struct_NumberWindowCallbacks) !=
        ownSizeof(struct_NumberWindowCallbacks_603980855):
      static :
        warning("Declaration of " & "struct_NumberWindowCallbacks" &
            " exists but with different size")
    struct_NumberWindowCallbacks
  else:
    struct_NumberWindowCallbacks_603980855)
  enum_HealthAggregation_603980398 = (when declared(enum_HealthAggregation):
    when ownSizeof(enum_HealthAggregation) != ownSizeof(enum_HealthAggregation_603980397):
      static :
        warning("Declaration of " & "enum_HealthAggregation" &
            " exists but with different size")
    enum_HealthAggregation
  else:
    enum_HealthAggregation_603980397)
  ScrollLayerCallback_603980766 = (when declared(ScrollLayerCallback):
    when ownSizeof(ScrollLayerCallback) != ownSizeof(ScrollLayerCallback_603980765):
      static :
        warning("Declaration of " & "ScrollLayerCallback" &
            " exists but with different size")
    ScrollLayerCallback
  else:
    ScrollLayerCallback_603980765)
  ActionMenuItem_603980860 = (when declared(ActionMenuItem):
    when ownSizeof(ActionMenuItem) != ownSizeof(ActionMenuItem_603980859):
      static :
        warning("Declaration of " & "ActionMenuItem" &
            " exists but with different size")
    ActionMenuItem
  else:
    ActionMenuItem_603980859)
  ActionMenuPerformActionCb_603980876 = (when declared(ActionMenuPerformActionCb):
    when ownSizeof(ActionMenuPerformActionCb) !=
        ownSizeof(ActionMenuPerformActionCb_603980875):
      static :
        warning("Declaration of " & "ActionMenuPerformActionCb" &
            " exists but with different size")
    ActionMenuPerformActionCb
  else:
    ActionMenuPerformActionCb_603980875)
  struct_MenuIndex_603980782 = (when declared(struct_MenuIndex):
    when ownSizeof(struct_MenuIndex) != ownSizeof(struct_MenuIndex_603980781):
      static :
        warning("Declaration of " & "struct_MenuIndex" &
            " exists but with different size")
    struct_MenuIndex
  else:
    struct_MenuIndex_603980781)
  RotBitmapLayer_603980850 = (when declared(RotBitmapLayer):
    when ownSizeof(RotBitmapLayer) != ownSizeof(RotBitmapLayer_603980849):
      static :
        warning("Declaration of " & "RotBitmapLayer" &
            " exists but with different size")
    RotBitmapLayer
  else:
    RotBitmapLayer_603980849)
  GBitmapFormat_603980580 = (when declared(GBitmapFormat):
    when ownSizeof(GBitmapFormat) != ownSizeof(GBitmapFormat_603980579):
      static :
        warning("Declaration of " & "GBitmapFormat" &
            " exists but with different size")
    GBitmapFormat
  else:
    GBitmapFormat_603980579)
  GEdgeInsets_603980602 = (when declared(GEdgeInsets):
    when ownSizeof(GEdgeInsets) != ownSizeof(GEdgeInsets_603980601):
      static :
        warning("Declaration of " & "GEdgeInsets" &
            " exists but with different size")
    GEdgeInsets
  else:
    GEdgeInsets_603980601)
  AppSyncErrorCallback_603980502 = (when declared(AppSyncErrorCallback):
    when ownSizeof(AppSyncErrorCallback) != ownSizeof(AppSyncErrorCallback_603980501):
      static :
        warning("Declaration of " & "AppSyncErrorCallback" &
            " exists but with different size")
    AppSyncErrorCallback
  else:
    AppSyncErrorCallback_603980501)
  GRect_603980576 = (when declared(GRect):
    when ownSizeof(GRect) != ownSizeof(GRect_603980575):
      static :
        warning("Declaration of " & "GRect" & " exists but with different size")
    GRect
  else:
    GRect_603980575)
  ConnectionHandlers_603980323 = (when declared(ConnectionHandlers):
    when ownSizeof(ConnectionHandlers) != ownSizeof(ConnectionHandlers_603980322):
      static :
        warning("Declaration of " & "ConnectionHandlers" &
            " exists but with different size")
    ConnectionHandlers
  else:
    ConnectionHandlers_603980322)
  GTextAttributes_603980648 = (when declared(GTextAttributes):
    when ownSizeof(GTextAttributes) != ownSizeof(GTextAttributes_603980647):
      static :
        warning("Declaration of " & "GTextAttributes" &
            " exists but with different size")
    GTextAttributes
  else:
    GTextAttributes_603980647)
  WakeupHandler_603980536 = (when declared(WakeupHandler):
    when ownSizeof(WakeupHandler) != ownSizeof(WakeupHandler_603980535):
      static :
        warning("Declaration of " & "WakeupHandler" &
            " exists but with different size")
    WakeupHandler
  else:
    WakeupHandler_603980535)
  HealthEventType_603980420 = (when declared(HealthEventType):
    when ownSizeof(HealthEventType) != ownSizeof(HealthEventType_603980419):
      static :
        warning("Declaration of " & "HealthEventType" &
            " exists but with different size")
    HealthEventType
  else:
    HealthEventType_603980419)
  struct_PropertyAnimationImplementation_603980724 = (when declared(
      struct_PropertyAnimationImplementation):
    when ownSizeof(struct_PropertyAnimationImplementation) !=
        ownSizeof(struct_PropertyAnimationImplementation_603980723):
      static :
        warning("Declaration of " & "struct_PropertyAnimationImplementation" &
            " exists but with different size")
    struct_PropertyAnimationImplementation
  else:
    struct_PropertyAnimationImplementation_603980723)
  Uuid_603980448 = (when declared(Uuid):
    when ownSizeof(Uuid) != ownSizeof(Uuid_603980447):
      static :
        warning("Declaration of " & "Uuid" & " exists but with different size")
    Uuid
  else:
    Uuid_603980447)
  ActionBarLayerIconPressAnimation_603980838 = (when declared(
      ActionBarLayerIconPressAnimation):
    when ownSizeof(ActionBarLayerIconPressAnimation) !=
        ownSizeof(ActionBarLayerIconPressAnimation_603980837):
      static :
        warning("Declaration of " & "ActionBarLayerIconPressAnimation" &
            " exists but with different size")
    ActionBarLayerIconPressAnimation
  else:
    ActionBarLayerIconPressAnimation_603980837)
  UnobstructedAreaHandlers_603980760 = (when declared(UnobstructedAreaHandlers):
    when ownSizeof(UnobstructedAreaHandlers) !=
        ownSizeof(UnobstructedAreaHandlers_603980759):
      static :
        warning("Declaration of " & "UnobstructedAreaHandlers" &
            " exists but with different size")
    UnobstructedAreaHandlers
  else:
    UnobstructedAreaHandlers_603980759)
  CompassHeadingHandler_603980371 = (when declared(CompassHeadingHandler):
    when ownSizeof(CompassHeadingHandler) != ownSizeof(CompassHeadingHandler_603980370):
      static :
        warning("Declaration of " & "CompassHeadingHandler" &
            " exists but with different size")
    CompassHeadingHandler
  else:
    CompassHeadingHandler_603980370)
  UInt32Setter_603980736 = (when declared(UInt32Setter):
    when ownSizeof(UInt32Setter) != ownSizeof(UInt32Setter_603980735):
      static :
        warning("Declaration of " & "UInt32Setter" &
            " exists but with different size")
    UInt32Setter
  else:
    UInt32Setter_603980735)
  ActionMenuEachItemCb_603980878 = (when declared(ActionMenuEachItemCb):
    when ownSizeof(ActionMenuEachItemCb) != ownSizeof(ActionMenuEachItemCb_603980877):
      static :
        warning("Declaration of " & "ActionMenuEachItemCb" &
            " exists but with different size")
    ActionMenuEachItemCb
  else:
    ActionMenuEachItemCb_603980877)
  enum_GAlign_603980590 = (when declared(enum_GAlign):
    when ownSizeof(enum_GAlign) != ownSizeof(enum_GAlign_603980589):
      static :
        warning("Declaration of " & "enum_GAlign" &
            " exists but with different size")
    enum_GAlign
  else:
    enum_GAlign_603980589)
  AnimationSetupImplementation_603980708 = (when declared(
      AnimationSetupImplementation):
    when ownSizeof(AnimationSetupImplementation) !=
        ownSizeof(AnimationSetupImplementation_603980707):
      static :
        warning("Declaration of " & "AnimationSetupImplementation" &
            " exists but with different size")
    AnimationSetupImplementation
  else:
    AnimationSetupImplementation_603980707)
  PropertyAnimationAccessors_603980718 = (when declared(
      PropertyAnimationAccessors):
    when ownSizeof(PropertyAnimationAccessors) !=
        ownSizeof(PropertyAnimationAccessors_603980717):
      static :
        warning("Declaration of " & "PropertyAnimationAccessors" &
            " exists but with different size")
    PropertyAnimationAccessors
  else:
    PropertyAnimationAccessors_603980717)
  CompassStatus_603980363 = (when declared(CompassStatus):
    when ownSizeof(CompassStatus) != ownSizeof(CompassStatus_603980362):
      static :
        warning("Declaration of " & "CompassStatus" &
            " exists but with different size")
    CompassStatus
  else:
    CompassStatus_603980362)
  AppWorkerResult_603980512 = (when declared(AppWorkerResult):
    when ownSizeof(AppWorkerResult) != ownSizeof(AppWorkerResult_603980511):
      static :
        warning("Declaration of " & "AppWorkerResult" &
            " exists but with different size")
    AppWorkerResult
  else:
    AppWorkerResult_603980511)
  SmartstrapReadHandler_603980662 = (when declared(SmartstrapReadHandler):
    when ownSizeof(SmartstrapReadHandler) != ownSizeof(SmartstrapReadHandler_603980661):
      static :
        warning("Declaration of " & "SmartstrapReadHandler" &
            " exists but with different size")
    SmartstrapReadHandler
  else:
    SmartstrapReadHandler_603980661)
  GDrawCommandImage_603980616 = (when declared(GDrawCommandImage):
    when ownSizeof(GDrawCommandImage) != ownSizeof(GDrawCommandImage_603980615):
      static :
        warning("Declaration of " & "GDrawCommandImage" &
            " exists but with different size")
    GDrawCommandImage
  else:
    GDrawCommandImage_603980615)
  union_GColor8_603980560 = (when declared(union_GColor8):
    when ownSizeof(union_GColor8) != ownSizeof(union_GColor8_603980559):
      static :
        warning("Declaration of " & "union_GColor8" &
            " exists but with different size")
    union_GColor8
  else:
    union_GColor8_603980559)
  ContentIndicator_603980772 = (when declared(ContentIndicator):
    when ownSizeof(ContentIndicator) != ownSizeof(ContentIndicator_603980771):
      static :
        warning("Declaration of " & "ContentIndicator" &
            " exists but with different size")
    ContentIndicator
  else:
    ContentIndicator_603980771)
  SimpleMenuLayerSelectCallback_603980826 = (when declared(
      SimpleMenuLayerSelectCallback):
    when ownSizeof(SimpleMenuLayerSelectCallback) !=
        ownSizeof(SimpleMenuLayerSelectCallback_603980825):
      static :
        warning("Declaration of " & "SimpleMenuLayerSelectCallback" &
            " exists but with different size")
    SimpleMenuLayerSelectCallback
  else:
    SimpleMenuLayerSelectCallback_603980825)
  enum_PlatformType_603980315 = (when declared(enum_PlatformType):
    when ownSizeof(enum_PlatformType) != ownSizeof(enum_PlatformType_603980314):
      static :
        warning("Declaration of " & "enum_PlatformType" &
            " exists but with different size")
    enum_PlatformType
  else:
    enum_PlatformType_603980314)
  struct_ContentIndicatorConfig_603980778 = (when declared(
      struct_ContentIndicatorConfig):
    when ownSizeof(struct_ContentIndicatorConfig) !=
        ownSizeof(struct_ContentIndicatorConfig_603980777):
      static :
        warning("Declaration of " & "struct_ContentIndicatorConfig" &
            " exists but with different size")
    struct_ContentIndicatorConfig
  else:
    struct_ContentIndicatorConfig_603980777)
  struct_VibePattern_603980884 = (when declared(struct_VibePattern):
    when ownSizeof(struct_VibePattern) != ownSizeof(struct_VibePattern_603980883):
      static :
        warning("Declaration of " & "struct_VibePattern" &
            " exists but with different size")
    struct_VibePattern
  else:
    struct_VibePattern_603980883)
  SmartstrapAttributeId_603980656 = (when declared(SmartstrapAttributeId):
    when ownSizeof(SmartstrapAttributeId) != ownSizeof(SmartstrapAttributeId_603980655):
      static :
        warning("Declaration of " & "SmartstrapAttributeId" &
            " exists but with different size")
    SmartstrapAttributeId
  else:
    SmartstrapAttributeId_603980655)
  PreferredContentSize_603980890 = (when declared(PreferredContentSize):
    when ownSizeof(PreferredContentSize) != ownSizeof(PreferredContentSize_603980889):
      static :
        warning("Declaration of " & "PreferredContentSize" &
            " exists but with different size")
    PreferredContentSize
  else:
    PreferredContentSize_603980889)
  ClickConfigProvider_603980676 = (when declared(ClickConfigProvider):
    when ownSizeof(ClickConfigProvider) != ownSizeof(ClickConfigProvider_603980675):
      static :
        warning("Declaration of " & "ClickConfigProvider" &
            " exists but with different size")
    ClickConfigProvider
  else:
    ClickConfigProvider_603980675)
  MenuIndex_603980784 = (when declared(MenuIndex):
    when ownSizeof(MenuIndex) != ownSizeof(MenuIndex_603980783):
      static :
        warning("Declaration of " & "MenuIndex" &
            " exists but with different size")
    MenuIndex
  else:
    MenuIndex_603980783)
  ActionMenuAlign_603980866 = (when declared(ActionMenuAlign):
    when ownSizeof(ActionMenuAlign) != ownSizeof(ActionMenuAlign_603980865):
      static :
        warning("Declaration of " & "ActionMenuAlign" &
            " exists but with different size")
    ActionMenuAlign
  else:
    ActionMenuAlign_603980865)
  Animation_603980690 = (when declared(Animation):
    when ownSizeof(Animation) != ownSizeof(Animation_603980689):
      static :
        warning("Declaration of " & "Animation" &
            " exists but with different size")
    Animation
  else:
    Animation_603980689)
  ActionMenuDidCloseCb_603980870 = (when declared(ActionMenuDidCloseCb):
    when ownSizeof(ActionMenuDidCloseCb) != ownSizeof(ActionMenuDidCloseCb_603980869):
      static :
        warning("Declaration of " & "ActionMenuDidCloseCb" &
            " exists but with different size")
    ActionMenuDidCloseCb
  else:
    ActionMenuDidCloseCb_603980869)
  struct_AppGlanceSlice_603980548 = (when declared(struct_AppGlanceSlice):
    when ownSizeof(struct_AppGlanceSlice) != ownSizeof(struct_AppGlanceSlice_603980547):
      static :
        warning("Declaration of " & "struct_AppGlanceSlice" &
            " exists but with different size")
    struct_AppGlanceSlice
  else:
    struct_AppGlanceSlice_603980547)
  Window_603980682 = (when declared(Window):
    when ownSizeof(Window) != ownSizeof(Window_603980681):
      static :
        warning("Declaration of " & "Window" & " exists but with different size")
    Window
  else:
    Window_603980681)
  DataLoggingResult_603980444 = (when declared(DataLoggingResult):
    when ownSizeof(DataLoggingResult) != ownSizeof(DataLoggingResult_603980443):
      static :
        warning("Declaration of " & "DataLoggingResult" &
            " exists but with different size")
    DataLoggingResult
  else:
    DataLoggingResult_603980443)
  StatusCode_603980530 = (when declared(StatusCode):
    when ownSizeof(StatusCode) != ownSizeof(StatusCode_603980529):
      static :
        warning("Declaration of " & "StatusCode" &
            " exists but with different size")
    StatusCode
  else:
    StatusCode_603980529)
  enum_DictationSessionStatus_603980482 = (when declared(
      enum_DictationSessionStatus):
    when ownSizeof(enum_DictationSessionStatus) !=
        ownSizeof(enum_DictationSessionStatus_603980481):
      static :
        warning("Declaration of " & "enum_DictationSessionStatus" &
            " exists but with different size")
    enum_DictationSessionStatus
  else:
    enum_DictationSessionStatus_603980481)
  SmartstrapWriteHandler_603980664 = (when declared(SmartstrapWriteHandler):
    when ownSizeof(SmartstrapWriteHandler) != ownSizeof(SmartstrapWriteHandler_603980663):
      static :
        warning("Declaration of " & "SmartstrapWriteHandler" &
            " exists but with different size")
    SmartstrapWriteHandler
  else:
    SmartstrapWriteHandler_603980663)
  SmartstrapHandlers_603980670 = (when declared(SmartstrapHandlers):
    when ownSizeof(SmartstrapHandlers) != ownSizeof(SmartstrapHandlers_603980669):
      static :
        warning("Declaration of " & "SmartstrapHandlers" &
            " exists but with different size")
    SmartstrapHandlers
  else:
    SmartstrapHandlers_603980669)
  AccelRawDataHandler_603980353 = (when declared(AccelRawDataHandler):
    when ownSizeof(AccelRawDataHandler) != ownSizeof(AccelRawDataHandler_603980352):
      static :
        warning("Declaration of " & "AccelRawDataHandler" &
            " exists but with different size")
    AccelRawDataHandler
  else:
    AccelRawDataHandler_603980352)
  WeekDay_603980311 = (when declared(WeekDay):
    when ownSizeof(WeekDay) != ownSizeof(WeekDay_603980310):
      static :
        warning("Declaration of " & "WeekDay" &
            " exists but with different size")
    WeekDay
  else:
    WeekDay_603980310)
  enum_WatchInfoModel_603980297 = (when declared(enum_WatchInfoModel):
    when ownSizeof(enum_WatchInfoModel) != ownSizeof(enum_WatchInfoModel_603980296):
      static :
        warning("Declaration of " & "enum_WatchInfoModel" &
            " exists but with different size")
    enum_WatchInfoModel
  else:
    enum_WatchInfoModel_603980296)
  AppWorkerMessageHandler_603980518 = (when declared(AppWorkerMessageHandler):
    when ownSizeof(AppWorkerMessageHandler) !=
        ownSizeof(AppWorkerMessageHandler_603980517):
      static :
        warning("Declaration of " & "AppWorkerMessageHandler" &
            " exists but with different size")
    AppWorkerMessageHandler
  else:
    AppWorkerMessageHandler_603980517)
  GFont_603980638 = (when declared(GFont):
    when ownSizeof(GFont) != ownSizeof(GFont_603980637):
      static :
        warning("Declaration of " & "GFont" & " exists but with different size")
    GFont
  else:
    GFont_603980637)
  ActionBarLayer_603980840 = (when declared(ActionBarLayer):
    when ownSizeof(ActionBarLayer) != ownSizeof(ActionBarLayer_603980839):
      static :
        warning("Declaration of " & "ActionBarLayer" &
            " exists but with different size")
    ActionBarLayer
  else:
    ActionBarLayer_603980839)
  struct_AccelRawData_603980343 = (when declared(struct_AccelRawData):
    when ownSizeof(struct_AccelRawData) != ownSizeof(struct_AccelRawData_603980342):
      static :
        warning("Declaration of " & "struct_AccelRawData" &
            " exists but with different size")
    struct_AccelRawData
  else:
    struct_AccelRawData_603980342)
  DictionaryResult_603980456 = (when declared(DictionaryResult):
    when ownSizeof(DictionaryResult) != ownSizeof(DictionaryResult_603980455):
      static :
        warning("Declaration of " & "DictionaryResult" &
            " exists but with different size")
    DictionaryResult
  else:
    DictionaryResult_603980455)
  struct_GSize_603980570 = (when declared(struct_GSize):
    when ownSizeof(struct_GSize) != ownSizeof(struct_GSize_603980569):
      static :
        warning("Declaration of " & "struct_GSize" &
            " exists but with different size")
    struct_GSize
  else:
    struct_GSize_603980569)
  GPath_603980634 = (when declared(GPath):
    when ownSizeof(GPath) != ownSizeof(GPath_603980633):
      static :
        warning("Declaration of " & "GPath" & " exists but with different size")
    GPath
  else:
    GPath_603980633)
  AnimationCurve_603980696 = (when declared(AnimationCurve):
    when ownSizeof(AnimationCurve) != ownSizeof(AnimationCurve_603980695):
      static :
        warning("Declaration of " & "AnimationCurve" &
            " exists but with different size")
    AnimationCurve
  else:
    AnimationCurve_603980695)
  compiler_darwin_time_t_603980895 = (when declared(compiler_darwin_time_t):
    when ownSizeof(compiler_darwin_time_t) != ownSizeof(compiler_darwin_time_t_603980894):
      static :
        warning("Declaration of " & "compiler_darwin_time_t" &
            " exists but with different size")
    compiler_darwin_time_t
  else:
    compiler_darwin_time_t_603980894)
  enum_SmartstrapResult_603980650 = (when declared(enum_SmartstrapResult):
    when ownSizeof(enum_SmartstrapResult) != ownSizeof(enum_SmartstrapResult_603980649):
      static :
        warning("Declaration of " & "enum_SmartstrapResult" &
            " exists but with different size")
    enum_SmartstrapResult
  else:
    enum_SmartstrapResult_603980649)
  MenuLayerDrawSeparatorCallback_603980806 = (when declared(
      MenuLayerDrawSeparatorCallback):
    when ownSizeof(MenuLayerDrawSeparatorCallback) !=
        ownSizeof(MenuLayerDrawSeparatorCallback_603980805):
      static :
        warning("Declaration of " & "MenuLayerDrawSeparatorCallback" &
            " exists but with different size")
    MenuLayerDrawSeparatorCallback
  else:
    MenuLayerDrawSeparatorCallback_603980805)
when not declared(SmartstrapNotifyHandler):
  type
    SmartstrapNotifyHandler* = SmartstrapNotifyHandler_603980665
else:
  static :
    hint("Declaration of " & "SmartstrapNotifyHandler" &
        " already exists, not redeclaring")
when not declared(enum_WeekDay):
  type
    enum_WeekDay* = enum_WeekDay_603980308
else:
  static :
    hint("Declaration of " & "enum_WeekDay" & " already exists, not redeclaring")
when not declared(Dictionary):
  type
    Dictionary* = Dictionary_603980465
else:
  static :
    hint("Declaration of " & "Dictionary" & " already exists, not redeclaring")
when not declared(AnimationCurveFunction):
  type
    AnimationCurveFunction* = AnimationCurveFunction_603980697
else:
  static :
    hint("Declaration of " & "AnimationCurveFunction" &
        " already exists, not redeclaring")
when not declared(SimpleMenuItem):
  type
    SimpleMenuItem* = SimpleMenuItem_603980829
else:
  static :
    hint("Declaration of " & "SimpleMenuItem" &
        " already exists, not redeclaring")
when not declared(SimpleMenuSection):
  type
    SimpleMenuSection* = SimpleMenuSection_603980833
else:
  static :
    hint("Declaration of " & "SimpleMenuSection" &
        " already exists, not redeclaring")
when not declared(enum_TimeUnits):
  type
    enum_TimeUnits* = enum_TimeUnits_603980379
else:
  static :
    hint("Declaration of " & "enum_TimeUnits" &
        " already exists, not redeclaring")
when not declared(HealthActivityMask):
  type
    HealthActivityMask* = HealthActivityMask_603980401
else:
  static :
    hint("Declaration of " & "HealthActivityMask" &
        " already exists, not redeclaring")
when not declared(GOvalScaleMode):
  type
    GOvalScaleMode* = GOvalScaleMode_603980609
else:
  static :
    hint("Declaration of " & "GOvalScaleMode" &
        " already exists, not redeclaring")
when not declared(struct_AnimationHandlers):
  type
    struct_AnimationHandlers* = struct_AnimationHandlers_603980703
else:
  static :
    hint("Declaration of " & "struct_AnimationHandlers" &
        " already exists, not redeclaring")
when not declared(struct_SimpleMenuSection):
  type
    struct_SimpleMenuSection* = struct_SimpleMenuSection_603980831
else:
  static :
    hint("Declaration of " & "struct_SimpleMenuSection" &
        " already exists, not redeclaring")
when not declared(struct_GPath):
  type
    struct_GPath* = struct_GPath_603980631
else:
  static :
    hint("Declaration of " & "struct_GPath" & " already exists, not redeclaring")
when not declared(enum_ButtonId):
  type
    enum_ButtonId* = enum_ButtonId_603980292
else:
  static :
    hint("Declaration of " & "enum_ButtonId" &
        " already exists, not redeclaring")
when not declared(FontInfo):
  type
    FontInfo* = FontInfo_603980635
else:
  static :
    hint("Declaration of " & "FontInfo" & " already exists, not redeclaring")
when not declared(UInt32Getter):
  type
    UInt32Getter* = UInt32Getter_603980737
else:
  static :
    hint("Declaration of " & "UInt32Getter" & " already exists, not redeclaring")
when not declared(BatteryChargeState):
  type
    BatteryChargeState* = BatteryChargeState_603980334
else:
  static :
    hint("Declaration of " & "BatteryChargeState" &
        " already exists, not redeclaring")
when not declared(AppSyncTupleChangedCallback):
  type
    AppSyncTupleChangedCallback* = AppSyncTupleChangedCallback_603980499
else:
  static :
    hint("Declaration of " & "AppSyncTupleChangedCallback" &
        " already exists, not redeclaring")
when not declared(enum_SniffInterval):
  type
    enum_SniffInterval* = enum_SniffInterval_603980519
else:
  static :
    hint("Declaration of " & "enum_SniffInterval" &
        " already exists, not redeclaring")
when not declared(GDrawCommandListIteratorCb):
  type
    GDrawCommandListIteratorCb* = GDrawCommandListIteratorCb_603980619
else:
  static :
    hint("Declaration of " & "GDrawCommandListIteratorCb" &
        " already exists, not redeclaring")
when not declared(AnimationUpdateImplementation):
  type
    AnimationUpdateImplementation* = AnimationUpdateImplementation_603980709
else:
  static :
    hint("Declaration of " & "AnimationUpdateImplementation" &
        " already exists, not redeclaring")
when not declared(ActionMenu):
  type
    ActionMenu* = ActionMenu_603980867
else:
  static :
    hint("Declaration of " & "ActionMenu" & " already exists, not redeclaring")
when not declared(MenuLayerSelectionChangedCallback):
  type
    MenuLayerSelectionChangedCallback* = MenuLayerSelectionChangedCallback_603980809
else:
  static :
    hint("Declaration of " & "MenuLayerSelectionChangedCallback" &
        " already exists, not redeclaring")
when not declared(MenuLayerGetCellHeightCallback):
  type
    MenuLayerGetCellHeightCallback* = MenuLayerGetCellHeightCallback_603980795
else:
  static :
    hint("Declaration of " & "MenuLayerGetCellHeightCallback" &
        " already exists, not redeclaring")
when not declared(enum_GCompOp):
  type
    enum_GCompOp* = enum_GCompOp_603980593
else:
  static :
    hint("Declaration of " & "enum_GCompOp" & " already exists, not redeclaring")
when not declared(MenuLayerSelectionWillChangeCallback):
  type
    MenuLayerSelectionWillChangeCallback* = MenuLayerSelectionWillChangeCallback_603980811
else:
  static :
    hint("Declaration of " & "MenuLayerSelectionWillChangeCallback" &
        " already exists, not redeclaring")
when not declared(struct_PropertyAnimationAccessors):
  type
    struct_PropertyAnimationAccessors* = struct_PropertyAnimationAccessors_603980719
else:
  static :
    hint("Declaration of " & "struct_PropertyAnimationAccessors" &
        " already exists, not redeclaring")
when not declared(MenuLayerCallbacks):
  type
    MenuLayerCallbacks* = MenuLayerCallbacks_603980817
else:
  static :
    hint("Declaration of " & "MenuLayerCallbacks" &
        " already exists, not redeclaring")
when not declared(HealthValue):
  type
    HealthValue* = HealthValue_603980389
else:
  static :
    hint("Declaration of " & "HealthValue" & " already exists, not redeclaring")
when not declared(enum_WatchInfoColor):
  type
    enum_WatchInfoColor* = enum_WatchInfoColor_603980300
else:
  static :
    hint("Declaration of " & "enum_WatchInfoColor" &
        " already exists, not redeclaring")
when not declared(AccelAxisType):
  type
    AccelAxisType* = AccelAxisType_603980348
else:
  static :
    hint("Declaration of " & "AccelAxisType" &
        " already exists, not redeclaring")
when not declared(enum_DataLoggingResult):
  type
    enum_DataLoggingResult* = enum_DataLoggingResult_603980441
else:
  static :
    hint("Declaration of " & "enum_DataLoggingResult" &
        " already exists, not redeclaring")
when not declared(AppExitReason):
  type
    AppExitReason* = AppExitReason_603980543
else:
  static :
    hint("Declaration of " & "AppExitReason" &
        " already exists, not redeclaring")
when not declared(PropertyAnimationImplementation):
  type
    PropertyAnimationImplementation* = PropertyAnimationImplementation_603980721
else:
  static :
    hint("Declaration of " & "PropertyAnimationImplementation" &
        " already exists, not redeclaring")
when not declared(PropertyAnimation):
  type
    PropertyAnimation* = PropertyAnimation_603980725
else:
  static :
    hint("Declaration of " & "PropertyAnimation" &
        " already exists, not redeclaring")
when not declared(struct_WatchInfoVersion):
  type
    struct_WatchInfoVersion* = struct_WatchInfoVersion_603980304
else:
  static :
    hint("Declaration of " & "struct_WatchInfoVersion" &
        " already exists, not redeclaring")
when not declared(NumberWindowCallbacks):
  type
    NumberWindowCallbacks* = NumberWindowCallbacks_603980857
else:
  static :
    hint("Declaration of " & "NumberWindowCallbacks" &
        " already exists, not redeclaring")
when not declared(GDrawCommandFrame):
  type
    GDrawCommandFrame* = GDrawCommandFrame_603980613
else:
  static :
    hint("Declaration of " & "GDrawCommandFrame" &
        " already exists, not redeclaring")
when not declared(GBitmapDataRowInfo):
  type
    GBitmapDataRowInfo* = GBitmapDataRowInfo_603980587
else:
  static :
    hint("Declaration of " & "GBitmapDataRowInfo" &
        " already exists, not redeclaring")
when not declared(MenuLayerDrawRowCallback):
  type
    MenuLayerDrawRowCallback* = MenuLayerDrawRowCallback_603980801
else:
  static :
    hint("Declaration of " & "MenuLayerDrawRowCallback" &
        " already exists, not redeclaring")
when not declared(struct_SimpleMenuItem):
  type
    struct_SimpleMenuItem* = struct_SimpleMenuItem_603980827
else:
  static :
    hint("Declaration of " & "struct_SimpleMenuItem" &
        " already exists, not redeclaring")
when not declared(Layer):
  type
    Layer* = Layer_603980677
else:
  static :
    hint("Declaration of " & "Layer" & " already exists, not redeclaring")
when not declared(struct_AppFocusHandlers):
  type
    struct_AppFocusHandlers* = struct_AppFocusHandlers_603980328
else:
  static :
    hint("Declaration of " & "struct_AppFocusHandlers" &
        " already exists, not redeclaring")
when not declared(AnimationImplementation):
  type
    AnimationImplementation* = AnimationImplementation_603980715
else:
  static :
    hint("Declaration of " & "AnimationImplementation" &
        " already exists, not redeclaring")
when not declared(enum_ActionBarLayerIconPressAnimation):
  type
    enum_ActionBarLayerIconPressAnimation* = enum_ActionBarLayerIconPressAnimation_603980835
else:
  static :
    hint("Declaration of " & "enum_ActionBarLayerIconPressAnimation" &
        " already exists, not redeclaring")
when not declared(HealthActivity):
  type
    HealthActivity* = HealthActivity_603980405
else:
  static :
    hint("Declaration of " & "HealthActivity" &
        " already exists, not redeclaring")
when not declared(GColor8):
  type
    GColor8* = GColor8_603980561
else:
  static :
    hint("Declaration of " & "GColor8" & " already exists, not redeclaring")
when not declared(struct_Tuplet):
  type
    struct_Tuplet* = struct_Tuplet_603980471
else:
  static :
    hint("Declaration of " & "struct_Tuplet" &
        " already exists, not redeclaring")
when not declared(DictationSessionStatusCallback):
  type
    DictationSessionStatusCallback* = DictationSessionStatusCallback_603980485
else:
  static :
    hint("Declaration of " & "DictationSessionStatusCallback" &
        " already exists, not redeclaring")
when not declared(DictionarySerializeCallback):
  type
    DictionarySerializeCallback* = DictionarySerializeCallback_603980475
else:
  static :
    hint("Declaration of " & "DictionarySerializeCallback" &
        " already exists, not redeclaring")
when not declared(GColor8Getter):
  type
    GColor8Getter* = GColor8Getter_603980749
else:
  static :
    hint("Declaration of " & "GColor8Getter" &
        " already exists, not redeclaring")
when not declared(ResHandle):
  type
    ResHandle* = ResHandle_603980507
else:
  static :
    hint("Declaration of " & "ResHandle" & " already exists, not redeclaring")
when not declared(enum_HealthServiceAccessibilityMask):
  type
    enum_HealthServiceAccessibilityMask* = enum_HealthServiceAccessibilityMask_603980413
else:
  static :
    hint("Declaration of " & "enum_HealthServiceAccessibilityMask" &
        " already exists, not redeclaring")
when not declared(Int16Setter):
  type
    Int16Setter* = Int16Setter_603980731
else:
  static :
    hint("Declaration of " & "Int16Setter" & " already exists, not redeclaring")
when not declared(MeasurementSystem):
  type
    MeasurementSystem* = MeasurementSystem_603980433
else:
  static :
    hint("Declaration of " & "MeasurementSystem" &
        " already exists, not redeclaring")
when not declared(ScrollLayerCallbacks):
  type
    ScrollLayerCallbacks* = ScrollLayerCallbacks_603980769
else:
  static :
    hint("Declaration of " & "ScrollLayerCallbacks" &
        " already exists, not redeclaring")
when not declared(ContentIndicatorConfig):
  type
    ContentIndicatorConfig* = ContentIndicatorConfig_603980779
else:
  static :
    hint("Declaration of " & "ContentIndicatorConfig" &
        " already exists, not redeclaring")
when not declared(ActionMenuConfig):
  type
    ActionMenuConfig* = ActionMenuConfig_603980881
else:
  static :
    hint("Declaration of " & "ActionMenuConfig" &
        " already exists, not redeclaring")
when not declared(struct_AppSync):
  type
    struct_AppSync* = struct_AppSync_603980503
else:
  static :
    hint("Declaration of " & "struct_AppSync" &
        " already exists, not redeclaring")
when not declared(AppGlanceResult):
  type
    AppGlanceResult* = AppGlanceResult_603980553
else:
  static :
    hint("Declaration of " & "AppGlanceResult" &
        " already exists, not redeclaring")
when not declared(AppSync):
  type
    AppSync* = AppSync_603980505
else:
  static :
    hint("Declaration of " & "AppSync" & " already exists, not redeclaring")
when not declared(WatchInfoModel):
  type
    WatchInfoModel* = WatchInfoModel_603980298
else:
  static :
    hint("Declaration of " & "WatchInfoModel" &
        " already exists, not redeclaring")
when not declared(ConnectionHandler):
  type
    ConnectionHandler* = ConnectionHandler_603980318
else:
  static :
    hint("Declaration of " & "ConnectionHandler" &
        " already exists, not redeclaring")
when not declared(GTextOverflowMode):
  type
    GTextOverflowMode* = GTextOverflowMode_603980641
else:
  static :
    hint("Declaration of " & "GTextOverflowMode" &
        " already exists, not redeclaring")
when not declared(MenuLayerGetNumberOfSectionsCallback):
  type
    MenuLayerGetNumberOfSectionsCallback* = MenuLayerGetNumberOfSectionsCallback_603980791
else:
  static :
    hint("Declaration of " & "MenuLayerGetNumberOfSectionsCallback" &
        " already exists, not redeclaring")
when not declared(AppLogLevel):
  type
    AppLogLevel* = AppLogLevel_603980451
else:
  static :
    hint("Declaration of " & "AppLogLevel" & " already exists, not redeclaring")
when not declared(enum_AccelSamplingRate):
  type
    enum_AccelSamplingRate* = enum_AccelSamplingRate_603980356
else:
  static :
    hint("Declaration of " & "enum_AccelSamplingRate" &
        " already exists, not redeclaring")
when not declared(HealthServiceTimeScope):
  type
    HealthServiceTimeScope* = HealthServiceTimeScope_603980395
else:
  static :
    hint("Declaration of " & "HealthServiceTimeScope" &
        " already exists, not redeclaring")
when not declared(AnimationHandlers):
  type
    AnimationHandlers* = AnimationHandlers_603980705
else:
  static :
    hint("Declaration of " & "AnimationHandlers" &
        " already exists, not redeclaring")
when not declared(struct_AnimationImplementation):
  type
    struct_AnimationImplementation* = struct_AnimationImplementation_603980713
else:
  static :
    hint("Declaration of " & "struct_AnimationImplementation" &
        " already exists, not redeclaring")
when not declared(GPointSetter):
  type
    GPointSetter* = GPointSetter_603980739
else:
  static :
    hint("Declaration of " & "GPointSetter" & " already exists, not redeclaring")
when not declared(HealthMinuteData):
  type
    HealthMinuteData* = HealthMinuteData_603980429
else:
  static :
    hint("Declaration of " & "HealthMinuteData" &
        " already exists, not redeclaring")
when not declared(AccelDataHandler):
  type
    AccelDataHandler* = AccelDataHandler_603980350
else:
  static :
    hint("Declaration of " & "AccelDataHandler" &
        " already exists, not redeclaring")
when not declared(MenuLayerGetNumberOfRowsInSectionsCallback):
  type
    MenuLayerGetNumberOfRowsInSectionsCallback* = MenuLayerGetNumberOfRowsInSectionsCallback_603980793
else:
  static :
    hint("Declaration of " & "MenuLayerGetNumberOfRowsInSectionsCallback" &
        " already exists, not redeclaring")
when not declared(enum_StatusBarLayerSeparatorMode):
  type
    enum_StatusBarLayerSeparatorMode* = enum_StatusBarLayerSeparatorMode_603980843
else:
  static :
    hint("Declaration of " & "enum_StatusBarLayerSeparatorMode" &
        " already exists, not redeclaring")
when not declared(enum_GTextOverflowMode):
  type
    enum_GTextOverflowMode* = enum_GTextOverflowMode_603980639
else:
  static :
    hint("Declaration of " & "enum_GTextOverflowMode" &
        " already exists, not redeclaring")
when not declared(enum_HealthMetric):
  type
    enum_HealthMetric* = enum_HealthMetric_603980385
else:
  static :
    hint("Declaration of " & "enum_HealthMetric" &
        " already exists, not redeclaring")
when not declared(HealthAggregation):
  type
    HealthAggregation* = HealthAggregation_603980399
else:
  static :
    hint("Declaration of " & "HealthAggregation" &
        " already exists, not redeclaring")
when not declared(enum_MenuRowAlign):
  type
    enum_MenuRowAlign* = enum_MenuRowAlign_603980819
else:
  static :
    hint("Declaration of " & "enum_MenuRowAlign" &
        " already exists, not redeclaring")
when not declared(Int16Getter):
  type
    Int16Getter* = Int16Getter_603980733
else:
  static :
    hint("Declaration of " & "Int16Getter" & " already exists, not redeclaring")
when not declared(enum_StatusCode):
  type
    enum_StatusCode* = enum_StatusCode_603980527
else:
  static :
    hint("Declaration of " & "enum_StatusCode" &
        " already exists, not redeclaring")
when not declared(WindowHandler):
  type
    WindowHandler* = WindowHandler_603980683
else:
  static :
    hint("Declaration of " & "WindowHandler" &
        " already exists, not redeclaring")
when not declared(enum_PreferredContentSize):
  type
    enum_PreferredContentSize* = enum_PreferredContentSize_603980887
else:
  static :
    hint("Declaration of " & "enum_PreferredContentSize" &
        " already exists, not redeclaring")
when not declared(WatchInfoColor):
  type
    WatchInfoColor* = WatchInfoColor_603980302
else:
  static :
    hint("Declaration of " & "WatchInfoColor" &
        " already exists, not redeclaring")
when not declared(ButtonId):
  type
    ButtonId* = ButtonId_603980294
else:
  static :
    hint("Declaration of " & "ButtonId" & " already exists, not redeclaring")
when not declared(enum_CompassStatus):
  type
    enum_CompassStatus* = enum_CompassStatus_603980360
else:
  static :
    hint("Declaration of " & "enum_CompassStatus" &
        " already exists, not redeclaring")
when not declared(enum_TupleType):
  type
    enum_TupleType* = enum_TupleType_603980457
else:
  static :
    hint("Declaration of " & "enum_TupleType" &
        " already exists, not redeclaring")
when not declared(ScrollLayer):
  type
    ScrollLayer* = ScrollLayer_603980763
else:
  static :
    hint("Declaration of " & "ScrollLayer" & " already exists, not redeclaring")
when not declared(GPoint):
  type
    GPoint* = GPoint_603980567
else:
  static :
    hint("Declaration of " & "GPoint" & " already exists, not redeclaring")
when not declared(struct_GRect):
  type
    struct_GRect* = struct_GRect_603980573
else:
  static :
    hint("Declaration of " & "struct_GRect" & " already exists, not redeclaring")
when not declared(AppFocusHandler):
  type
    AppFocusHandler* = AppFocusHandler_603980326
else:
  static :
    hint("Declaration of " & "AppFocusHandler" &
        " already exists, not redeclaring")
when not declared(SmartstrapServiceAvailabilityHandler):
  type
    SmartstrapServiceAvailabilityHandler* = SmartstrapServiceAvailabilityHandler_603980659
else:
  static :
    hint("Declaration of " & "SmartstrapServiceAvailabilityHandler" &
        " already exists, not redeclaring")
when not declared(GRectGetter):
  type
    GRectGetter* = GRectGetter_603980745
else:
  static :
    hint("Declaration of " & "GRectGetter" & " already exists, not redeclaring")
when not declared(struct_UnobstructedAreaHandlers):
  type
    struct_UnobstructedAreaHandlers* = struct_UnobstructedAreaHandlers_603980757
else:
  static :
    hint("Declaration of " & "struct_UnobstructedAreaHandlers" &
        " already exists, not redeclaring")
when not declared(GSize):
  type
    GSize* = GSize_603980571
else:
  static :
    hint("Declaration of " & "GSize" & " already exists, not redeclaring")
when not declared(MenuLayerDrawHeaderCallback):
  type
    MenuLayerDrawHeaderCallback* = MenuLayerDrawHeaderCallback_603980803
else:
  static :
    hint("Declaration of " & "MenuLayerDrawHeaderCallback" &
        " already exists, not redeclaring")
when not declared(GColor):
  type
    GColor* = GColor_603980563
else:
  static :
    hint("Declaration of " & "GColor" & " already exists, not redeclaring")
when not declared(struct_WindowHandlers):
  type
    struct_WindowHandlers* = struct_WindowHandlers_603980685
else:
  static :
    hint("Declaration of " & "struct_WindowHandlers" &
        " already exists, not redeclaring")
when not declared(GCornerMask):
  type
    GCornerMask* = GCornerMask_603980605
else:
  static :
    hint("Declaration of " & "GCornerMask" & " already exists, not redeclaring")
when not declared(enum_AppGlanceResult):
  type
    enum_AppGlanceResult* = enum_AppGlanceResult_603980551
else:
  static :
    hint("Declaration of " & "enum_AppGlanceResult" &
        " already exists, not redeclaring")
when not declared(BluetoothConnectionHandler):
  type
    BluetoothConnectionHandler* = BluetoothConnectionHandler_603980324
else:
  static :
    hint("Declaration of " & "BluetoothConnectionHandler" &
        " already exists, not redeclaring")
when not declared(enum_HealthServiceTimeScope):
  type
    enum_HealthServiceTimeScope* = enum_HealthServiceTimeScope_603980393
else:
  static :
    hint("Declaration of " & "enum_HealthServiceTimeScope" &
        " already exists, not redeclaring")
when not declared(HealthActivityIteratorCB):
  type
    HealthActivityIteratorCB* = HealthActivityIteratorCB_603980407
else:
  static :
    hint("Declaration of " & "HealthActivityIteratorCB" &
        " already exists, not redeclaring")
when not declared(AppTimerCallback):
  type
    AppTimerCallback* = AppTimerCallback_603980525
else:
  static :
    hint("Declaration of " & "AppTimerCallback" &
        " already exists, not redeclaring")
when not declared(enum_AppExitReason):
  type
    enum_AppExitReason* = enum_AppExitReason_603980541
else:
  static :
    hint("Declaration of " & "enum_AppExitReason" &
        " already exists, not redeclaring")
when not declared(AccelData):
  type
    AccelData* = AccelData_603980340
else:
  static :
    hint("Declaration of " & "AccelData" & " already exists, not redeclaring")
when not declared(struct_GPoint):
  type
    struct_GPoint* = struct_GPoint_603980565
else:
  static :
    hint("Declaration of " & "struct_GPoint" &
        " already exists, not redeclaring")
when not declared(enum_AnimationCurve):
  type
    enum_AnimationCurve* = enum_AnimationCurve_603980693
else:
  static :
    hint("Declaration of " & "enum_AnimationCurve" &
        " already exists, not redeclaring")
when not declared(ContentIndicatorDirection):
  type
    ContentIndicatorDirection* = ContentIndicatorDirection_603980775
else:
  static :
    hint("Declaration of " & "ContentIndicatorDirection" &
        " already exists, not redeclaring")
when not declared(struct_ScrollLayerCallbacks):
  type
    struct_ScrollLayerCallbacks* = struct_ScrollLayerCallbacks_603980767
else:
  static :
    hint("Declaration of " & "struct_ScrollLayerCallbacks" &
        " already exists, not redeclaring")
when not declared(GRectReturn):
  type
    GRectReturn* = GRectReturn_603980729
else:
  static :
    hint("Declaration of " & "GRectReturn" & " already exists, not redeclaring")
when not declared(GAlign):
  type
    GAlign* = GAlign_603980591
else:
  static :
    hint("Declaration of " & "GAlign" & " already exists, not redeclaring")
when not declared(ClickRecognizerRef):
  type
    ClickRecognizerRef* = ClickRecognizerRef_603980671
else:
  static :
    hint("Declaration of " & "ClickRecognizerRef" &
        " already exists, not redeclaring")
when not declared(struct_Uuid):
  type
    struct_Uuid* = struct_Uuid_603980445
else:
  static :
    hint("Declaration of " & "struct_Uuid" & " already exists, not redeclaring")
when not declared(struct_AccelData):
  type
    struct_AccelData* = struct_AccelData_603980338
else:
  static :
    hint("Declaration of " & "struct_AccelData" &
        " already exists, not redeclaring")
when not declared(AmbientLightLevel):
  type
    AmbientLightLevel* = AmbientLightLevel_603980425
else:
  static :
    hint("Declaration of " & "AmbientLightLevel" &
        " already exists, not redeclaring")
when not declared(tm):
  type
    tm* = tm_603980288
else:
  static :
    hint("Declaration of " & "tm" & " already exists, not redeclaring")
when not declared(SmartstrapAttribute):
  type
    SmartstrapAttribute* = SmartstrapAttribute_603980657
else:
  static :
    hint("Declaration of " & "SmartstrapAttribute" &
        " already exists, not redeclaring")
when not declared(DictionaryKeyUpdatedCallback):
  type
    DictionaryKeyUpdatedCallback* = DictionaryKeyUpdatedCallback_603980477
else:
  static :
    hint("Declaration of " & "DictionaryKeyUpdatedCallback" &
        " already exists, not redeclaring")
when not declared(struct_GEdgeInsets):
  type
    struct_GEdgeInsets* = struct_GEdgeInsets_603980599
else:
  static :
    hint("Declaration of " & "struct_GEdgeInsets" &
        " already exists, not redeclaring")
when not declared(TextLayer):
  type
    TextLayer* = TextLayer_603980761
else:
  static :
    hint("Declaration of " & "TextLayer" & " already exists, not redeclaring")
when not declared(enum_HealthEventType):
  type
    enum_HealthEventType* = enum_HealthEventType_603980417
else:
  static :
    hint("Declaration of " & "enum_HealthEventType" &
        " already exists, not redeclaring")
when not declared(struct_AppWorkerMessage):
  type
    struct_AppWorkerMessage* = struct_AppWorkerMessage_603980513
else:
  static :
    hint("Declaration of " & "struct_AppWorkerMessage" &
        " already exists, not redeclaring")
when not declared(AppMessageResult):
  type
    AppMessageResult* = AppMessageResult_603980489
else:
  static :
    hint("Declaration of " & "AppMessageResult" &
        " already exists, not redeclaring")
when not declared(MenuLayerDrawBackgroundCallback):
  type
    MenuLayerDrawBackgroundCallback* = MenuLayerDrawBackgroundCallback_603980813
else:
  static :
    hint("Declaration of " & "MenuLayerDrawBackgroundCallback" &
        " already exists, not redeclaring")
when not declared(AccelTapHandler):
  type
    AccelTapHandler* = AccelTapHandler_603980354
else:
  static :
    hint("Declaration of " & "AccelTapHandler" &
        " already exists, not redeclaring")
when not declared(enum_GCornerMask):
  type
    enum_GCornerMask* = enum_GCornerMask_603980603
else:
  static :
    hint("Declaration of " & "enum_GCornerMask" &
        " already exists, not redeclaring")
when not declared(PublishedId):
  type
    PublishedId* = PublishedId_603980545
else:
  static :
    hint("Declaration of " & "PublishedId" & " already exists, not redeclaring")
when not declared(Tuple_f):
  type
    Tuple_f* = Tuple_f_603980463
else:
  static :
    hint("Declaration of " & "Tuple_f" & " already exists, not redeclaring")
when not declared(UnobstructedAreaWillChangeHandler):
  type
    UnobstructedAreaWillChangeHandler* = UnobstructedAreaWillChangeHandler_603980751
else:
  static :
    hint("Declaration of " & "UnobstructedAreaWillChangeHandler" &
        " already exists, not redeclaring")
when not declared(AppGlanceReloadSession):
  type
    AppGlanceReloadSession* = AppGlanceReloadSession_603980555
else:
  static :
    hint("Declaration of " & "AppGlanceReloadSession" &
        " already exists, not redeclaring")
when not declared(ActionMenuLevel):
  type
    ActionMenuLevel* = ActionMenuLevel_603980861
else:
  static :
    hint("Declaration of " & "ActionMenuLevel" &
        " already exists, not redeclaring")
when not declared(GContext):
  type
    GContext* = GContext_603980597
else:
  static :
    hint("Declaration of " & "GContext" & " already exists, not redeclaring")
when not declared(SmartstrapServiceId):
  type
    SmartstrapServiceId* = SmartstrapServiceId_603980653
else:
  static :
    hint("Declaration of " & "SmartstrapServiceId" &
        " already exists, not redeclaring")
when not declared(AnimationTeardownImplementation):
  type
    AnimationTeardownImplementation* = AnimationTeardownImplementation_603980711
else:
  static :
    hint("Declaration of " & "AnimationTeardownImplementation" &
        " already exists, not redeclaring")
when not declared(Tuplet):
  type
    Tuplet* = Tuplet_603980473
else:
  static :
    hint("Declaration of " & "Tuplet" & " already exists, not redeclaring")
when not declared(struct_CompassHeadingData):
  type
    struct_CompassHeadingData* = struct_CompassHeadingData_603980366
else:
  static :
    hint("Declaration of " & "struct_CompassHeadingData" &
        " already exists, not redeclaring")
when not declared(StatusBarLayerSeparatorMode):
  type
    StatusBarLayerSeparatorMode* = StatusBarLayerSeparatorMode_603980845
else:
  static :
    hint("Declaration of " & "StatusBarLayerSeparatorMode" &
        " already exists, not redeclaring")
when not declared(struct_Tuple):
  type
    struct_Tuple* = struct_Tuple_603980461
else:
  static :
    hint("Declaration of " & "struct_Tuple" & " already exists, not redeclaring")
when not declared(AppFocusHandlers):
  type
    AppFocusHandlers* = AppFocusHandlers_603980330
else:
  static :
    hint("Declaration of " & "AppFocusHandlers" &
        " already exists, not redeclaring")
when not declared(enum_DictionaryResult):
  type
    enum_DictionaryResult* = enum_DictionaryResult_603980453
else:
  static :
    hint("Declaration of " & "enum_DictionaryResult" &
        " already exists, not redeclaring")
when not declared(TickHandler):
  type
    TickHandler* = TickHandler_603980383
else:
  static :
    hint("Declaration of " & "TickHandler" & " already exists, not redeclaring")
when not declared(HealthIterationDirection):
  type
    HealthIterationDirection* = HealthIterationDirection_603980411
else:
  static :
    hint("Declaration of " & "HealthIterationDirection" &
        " already exists, not redeclaring")
when not declared(struct_DictionaryIterator):
  type
    struct_DictionaryIterator* = struct_DictionaryIterator_603980467
else:
  static :
    hint("Declaration of " & "struct_DictionaryIterator" &
        " already exists, not redeclaring")
when not declared(TimeUnits):
  type
    TimeUnits* = TimeUnits_603980381
else:
  static :
    hint("Declaration of " & "TimeUnits" & " already exists, not redeclaring")
when not declared(enum_AppLaunchReason):
  type
    enum_AppLaunchReason* = enum_AppLaunchReason_603980537
else:
  static :
    hint("Declaration of " & "enum_AppLaunchReason" &
        " already exists, not redeclaring")
when not declared(ClickHandler):
  type
    ClickHandler* = ClickHandler_603980673
else:
  static :
    hint("Declaration of " & "ClickHandler" & " already exists, not redeclaring")
when not declared(MenuLayerSelectCallback):
  type
    MenuLayerSelectCallback* = MenuLayerSelectCallback_603980807
else:
  static :
    hint("Declaration of " & "MenuLayerSelectCallback" &
        " already exists, not redeclaring")
when not declared(NumberWindowCallback):
  type
    NumberWindowCallback* = NumberWindowCallback_603980853
else:
  static :
    hint("Declaration of " & "NumberWindowCallback" &
        " already exists, not redeclaring")
when not declared(AppMessageInboxDropped):
  type
    AppMessageInboxDropped* = AppMessageInboxDropped_603980493
else:
  static :
    hint("Declaration of " & "AppMessageInboxDropped" &
        " already exists, not redeclaring")
when not declared(struct_SmartstrapHandlers):
  type
    struct_SmartstrapHandlers* = struct_SmartstrapHandlers_603980667
else:
  static :
    hint("Declaration of " & "struct_SmartstrapHandlers" &
        " already exists, not redeclaring")
when not declared(struct_MenuCellSpan):
  type
    struct_MenuCellSpan* = struct_MenuCellSpan_603980785
else:
  static :
    hint("Declaration of " & "struct_MenuCellSpan" &
        " already exists, not redeclaring")
when not declared(AppLaunchReason):
  type
    AppLaunchReason* = AppLaunchReason_603980539
else:
  static :
    hint("Declaration of " & "AppLaunchReason" &
        " already exists, not redeclaring")
when not declared(WindowHandlers):
  type
    WindowHandlers* = WindowHandlers_603980687
else:
  static :
    hint("Declaration of " & "WindowHandlers" &
        " already exists, not redeclaring")
when not declared(AppMessageInboxReceived):
  type
    AppMessageInboxReceived* = AppMessageInboxReceived_603980491
else:
  static :
    hint("Declaration of " & "AppMessageInboxReceived" &
        " already exists, not redeclaring")
when not declared(struct_BatteryChargeState):
  type
    struct_BatteryChargeState* = struct_BatteryChargeState_603980332
else:
  static :
    hint("Declaration of " & "struct_BatteryChargeState" &
        " already exists, not redeclaring")
when not declared(enum_GTextAlignment):
  type
    enum_GTextAlignment* = enum_GTextAlignment_603980643
else:
  static :
    hint("Declaration of " & "enum_GTextAlignment" &
        " already exists, not redeclaring")
when not declared(UnobstructedAreaDidChangeHandler):
  type
    UnobstructedAreaDidChangeHandler* = UnobstructedAreaDidChangeHandler_603980755
else:
  static :
    hint("Declaration of " & "UnobstructedAreaDidChangeHandler" &
        " already exists, not redeclaring")
when not declared(LayerUpdateProc):
  type
    LayerUpdateProc* = LayerUpdateProc_603980679
else:
  static :
    hint("Declaration of " & "LayerUpdateProc" &
        " already exists, not redeclaring")
when not declared(HealthEventHandler):
  type
    HealthEventHandler* = HealthEventHandler_603980421
else:
  static :
    hint("Declaration of " & "HealthEventHandler" &
        " already exists, not redeclaring")
when not declared(enum_ActionMenuLevelDisplayMode):
  type
    enum_ActionMenuLevelDisplayMode* = enum_ActionMenuLevelDisplayMode_603980871
else:
  static :
    hint("Declaration of " & "enum_ActionMenuLevelDisplayMode" &
        " already exists, not redeclaring")
when not declared(WakeupId):
  type
    WakeupId* = WakeupId_603980533
else:
  static :
    hint("Declaration of " & "WakeupId" & " already exists, not redeclaring")
when not declared(SmartstrapResult):
  type
    SmartstrapResult* = SmartstrapResult_603980651
else:
  static :
    hint("Declaration of " & "SmartstrapResult" &
        " already exists, not redeclaring")
when not declared(MenuCellSpan):
  type
    MenuCellSpan* = MenuCellSpan_603980787
else:
  static :
    hint("Declaration of " & "MenuCellSpan" & " already exists, not redeclaring")
when not declared(DataLoggingSessionRef):
  type
    DataLoggingSessionRef* = DataLoggingSessionRef_603980435
else:
  static :
    hint("Declaration of " & "DataLoggingSessionRef" &
        " already exists, not redeclaring")
when not declared(StatusBarLayer):
  type
    StatusBarLayer* = StatusBarLayer_603980841
else:
  static :
    hint("Declaration of " & "StatusBarLayer" &
        " already exists, not redeclaring")
when not declared(AccelRawData):
  type
    AccelRawData* = AccelRawData_603980344
else:
  static :
    hint("Declaration of " & "AccelRawData" & " already exists, not redeclaring")
when not declared(struct_ActionMenuConfig):
  type
    struct_ActionMenuConfig* = struct_ActionMenuConfig_603980879
else:
  static :
    hint("Declaration of " & "struct_ActionMenuConfig" &
        " already exists, not redeclaring")
when not declared(struct_tm):
  type
    struct_tm* = struct_tm_603980290
else:
  static :
    hint("Declaration of " & "struct_tm" & " already exists, not redeclaring")
when not declared(enum_GOvalScaleMode):
  type
    enum_GOvalScaleMode* = enum_GOvalScaleMode_603980607
else:
  static :
    hint("Declaration of " & "enum_GOvalScaleMode" &
        " already exists, not redeclaring")
when not declared(ActionMenuLevelDisplayMode):
  type
    ActionMenuLevelDisplayMode* = ActionMenuLevelDisplayMode_603980873
else:
  static :
    hint("Declaration of " & "ActionMenuLevelDisplayMode" &
        " already exists, not redeclaring")
when not declared(status_t):
  type
    status_t* = status_t_603980531
else:
  static :
    hint("Declaration of " & "status_t" & " already exists, not redeclaring")
when not declared(VibePattern):
  type
    VibePattern* = VibePattern_603980885
else:
  static :
    hint("Declaration of " & "VibePattern" & " already exists, not redeclaring")
when not declared(GDrawCommand):
  type
    GDrawCommand* = GDrawCommand_603980611
else:
  static :
    hint("Declaration of " & "GDrawCommand" & " already exists, not redeclaring")
when not declared(SimpleMenuLayer):
  type
    SimpleMenuLayer* = SimpleMenuLayer_603980823
else:
  static :
    hint("Declaration of " & "SimpleMenuLayer" &
        " already exists, not redeclaring")
when not declared(GDrawCommandType):
  type
    GDrawCommandType* = GDrawCommandType_603980625
else:
  static :
    hint("Declaration of " & "GDrawCommandType" &
        " already exists, not redeclaring")
when not declared(enum_DataLoggingItemType):
  type
    enum_DataLoggingItemType* = enum_DataLoggingItemType_603980437
else:
  static :
    hint("Declaration of " & "enum_DataLoggingItemType" &
        " already exists, not redeclaring")
when not declared(GPointGetter):
  type
    GPointGetter* = GPointGetter_603980741
else:
  static :
    hint("Declaration of " & "GPointGetter" & " already exists, not redeclaring")
when not declared(HealthServiceAccessibilityMask):
  type
    HealthServiceAccessibilityMask* = HealthServiceAccessibilityMask_603980415
else:
  static :
    hint("Declaration of " & "HealthServiceAccessibilityMask" &
        " already exists, not redeclaring")
when not declared(enum_ActionMenuAlign):
  type
    enum_ActionMenuAlign* = enum_ActionMenuAlign_603980863
else:
  static :
    hint("Declaration of " & "enum_ActionMenuAlign" &
        " already exists, not redeclaring")
when not declared(enum_AppLogLevel):
  type
    enum_AppLogLevel* = enum_AppLogLevel_603980449
else:
  static :
    hint("Declaration of " & "enum_AppLogLevel" &
        " already exists, not redeclaring")
when not declared(DataLoggingItemType):
  type
    DataLoggingItemType* = DataLoggingItemType_603980439
else:
  static :
    hint("Declaration of " & "DataLoggingItemType" &
        " already exists, not redeclaring")
when not declared(AppGlanceSlice):
  type
    AppGlanceSlice* = AppGlanceSlice_603980549
else:
  static :
    hint("Declaration of " & "AppGlanceSlice" &
        " already exists, not redeclaring")
when not declared(AnimationStartedHandler):
  type
    AnimationStartedHandler* = AnimationStartedHandler_603980699
else:
  static :
    hint("Declaration of " & "AnimationStartedHandler" &
        " already exists, not redeclaring")
when not declared(HealthMetric):
  type
    HealthMetric* = HealthMetric_603980387
else:
  static :
    hint("Declaration of " & "HealthMetric" & " already exists, not redeclaring")
when not declared(DictationSession):
  type
    DictationSession* = DictationSession_603980479
else:
  static :
    hint("Declaration of " & "DictationSession" &
        " already exists, not redeclaring")
when not declared(GPointReturn):
  type
    GPointReturn* = GPointReturn_603980727
else:
  static :
    hint("Declaration of " & "GPointReturn" & " already exists, not redeclaring")
when not declared(enum_ContentIndicatorDirection):
  type
    enum_ContentIndicatorDirection* = enum_ContentIndicatorDirection_603980773
else:
  static :
    hint("Declaration of " & "enum_ContentIndicatorDirection" &
        " already exists, not redeclaring")
when not declared(SniffInterval):
  type
    SniffInterval* = SniffInterval_603980521
else:
  static :
    hint("Declaration of " & "SniffInterval" &
        " already exists, not redeclaring")
when not declared(CompassHeadingData):
  type
    CompassHeadingData* = CompassHeadingData_603980368
else:
  static :
    hint("Declaration of " & "CompassHeadingData" &
        " already exists, not redeclaring")
when not declared(AnimationProgress):
  type
    AnimationProgress* = AnimationProgress_603980691
else:
  static :
    hint("Declaration of " & "AnimationProgress" &
        " already exists, not redeclaring")
when not declared(BitmapLayer):
  type
    BitmapLayer* = BitmapLayer_603980847
else:
  static :
    hint("Declaration of " & "BitmapLayer" & " already exists, not redeclaring")
when not declared(PlatformType):
  type
    PlatformType* = PlatformType_603980316
else:
  static :
    hint("Declaration of " & "PlatformType" & " already exists, not redeclaring")
when not declared(struct_GBitmapDataRowInfo):
  type
    struct_GBitmapDataRowInfo* = struct_GBitmapDataRowInfo_603980585
else:
  static :
    hint("Declaration of " & "struct_GBitmapDataRowInfo" &
        " already exists, not redeclaring")
when not declared(enum_GDrawCommandType):
  type
    enum_GDrawCommandType* = enum_GDrawCommandType_603980623
else:
  static :
    hint("Declaration of " & "enum_GDrawCommandType" &
        " already exists, not redeclaring")
when not declared(AppGlanceReloadCallback):
  type
    AppGlanceReloadCallback* = AppGlanceReloadCallback_603980557
else:
  static :
    hint("Declaration of " & "AppGlanceReloadCallback" &
        " already exists, not redeclaring")
when not declared(AccelSamplingRate):
  type
    AccelSamplingRate* = AccelSamplingRate_603980358
else:
  static :
    hint("Declaration of " & "AccelSamplingRate" &
        " already exists, not redeclaring")
when not declared(GTextAlignment):
  type
    GTextAlignment* = GTextAlignment_603980645
else:
  static :
    hint("Declaration of " & "GTextAlignment" &
        " already exists, not redeclaring")
when not declared(struct_HealthMinuteData):
  type
    struct_HealthMinuteData* = struct_HealthMinuteData_603980427
else:
  static :
    hint("Declaration of " & "struct_HealthMinuteData" &
        " already exists, not redeclaring")
when not declared(DictionaryIterator):
  type
    DictionaryIterator* = DictionaryIterator_603980469
else:
  static :
    hint("Declaration of " & "DictionaryIterator" &
        " already exists, not redeclaring")
when not declared(AppTimer):
  type
    AppTimer* = AppTimer_603980523
else:
  static :
    hint("Declaration of " & "AppTimer" & " already exists, not redeclaring")
when not declared(NumberWindow):
  type
    NumberWindow* = NumberWindow_603980851
else:
  static :
    hint("Declaration of " & "NumberWindow" & " already exists, not redeclaring")
when not declared(HealthMetricAlert):
  type
    HealthMetricAlert* = HealthMetricAlert_603980391
else:
  static :
    hint("Declaration of " & "HealthMetricAlert" &
        " already exists, not redeclaring")
when not declared(MenuLayer):
  type
    MenuLayer* = MenuLayer_603980789
else:
  static :
    hint("Declaration of " & "MenuLayer" & " already exists, not redeclaring")
when not declared(enum_MeasurementSystem):
  type
    enum_MeasurementSystem* = enum_MeasurementSystem_603980431
else:
  static :
    hint("Declaration of " & "enum_MeasurementSystem" &
        " already exists, not redeclaring")
when not declared(WatchInfoVersion):
  type
    WatchInfoVersion* = WatchInfoVersion_603980306
else:
  static :
    hint("Declaration of " & "WatchInfoVersion" &
        " already exists, not redeclaring")
when not declared(UnobstructedAreaChangeHandler):
  type
    UnobstructedAreaChangeHandler* = UnobstructedAreaChangeHandler_603980753
else:
  static :
    hint("Declaration of " & "UnobstructedAreaChangeHandler" &
        " already exists, not redeclaring")
when not declared(enum_AccelAxisType):
  type
    enum_AccelAxisType* = enum_AccelAxisType_603980346
else:
  static :
    hint("Declaration of " & "enum_AccelAxisType" &
        " already exists, not redeclaring")
when not declared(enum_HealthIterationDirection):
  type
    enum_HealthIterationDirection* = enum_HealthIterationDirection_603980409
else:
  static :
    hint("Declaration of " & "enum_HealthIterationDirection" &
        " already exists, not redeclaring")
when not declared(enum_AmbientLightLevel):
  type
    enum_AmbientLightLevel* = enum_AmbientLightLevel_603980423
else:
  static :
    hint("Declaration of " & "enum_AmbientLightLevel" &
        " already exists, not redeclaring")
when not declared(AppWorkerMessage):
  type
    AppWorkerMessage* = AppWorkerMessage_603980515
else:
  static :
    hint("Declaration of " & "AppWorkerMessage" &
        " already exists, not redeclaring")
when not declared(AnimationStoppedHandler):
  type
    AnimationStoppedHandler* = AnimationStoppedHandler_603980701
else:
  static :
    hint("Declaration of " & "AnimationStoppedHandler" &
        " already exists, not redeclaring")
when not declared(BatteryStateHandler):
  type
    BatteryStateHandler* = BatteryStateHandler_603980336
else:
  static :
    hint("Declaration of " & "BatteryStateHandler" &
        " already exists, not redeclaring")
when not declared(GCompOp):
  type
    GCompOp* = GCompOp_603980595
else:
  static :
    hint("Declaration of " & "GCompOp" & " already exists, not redeclaring")
when not declared(GDrawCommandSequence):
  type
    GDrawCommandSequence* = GDrawCommandSequence_603980621
else:
  static :
    hint("Declaration of " & "GDrawCommandSequence" &
        " already exists, not redeclaring")
when not declared(GRectSetter):
  type
    GRectSetter* = GRectSetter_603980743
else:
  static :
    hint("Declaration of " & "GRectSetter" & " already exists, not redeclaring")
when not declared(struct_ConnectionHandlers):
  type
    struct_ConnectionHandlers* = struct_ConnectionHandlers_603980320
else:
  static :
    hint("Declaration of " & "struct_ConnectionHandlers" &
        " already exists, not redeclaring")
when not declared(MenuLayerGetHeaderHeightCallback):
  type
    MenuLayerGetHeaderHeightCallback* = MenuLayerGetHeaderHeightCallback_603980797
else:
  static :
    hint("Declaration of " & "MenuLayerGetHeaderHeightCallback" &
        " already exists, not redeclaring")
when not declared(GBitmap):
  type
    GBitmap* = GBitmap_603980581
else:
  static :
    hint("Declaration of " & "GBitmap" & " already exists, not redeclaring")
when not declared(enum_AppMessageResult):
  type
    enum_AppMessageResult* = enum_AppMessageResult_603980487
else:
  static :
    hint("Declaration of " & "enum_AppMessageResult" &
        " already exists, not redeclaring")
when not declared(MenuLayerGetSeparatorHeightCallback):
  type
    MenuLayerGetSeparatorHeightCallback* = MenuLayerGetSeparatorHeightCallback_603980799
else:
  static :
    hint("Declaration of " & "MenuLayerGetSeparatorHeightCallback" &
        " already exists, not redeclaring")
when not declared(enum_HealthActivity):
  type
    enum_HealthActivity* = enum_HealthActivity_603980403
else:
  static :
    hint("Declaration of " & "enum_HealthActivity" &
        " already exists, not redeclaring")
when not declared(MenuRowAlign):
  type
    MenuRowAlign* = MenuRowAlign_603980821
else:
  static :
    hint("Declaration of " & "MenuRowAlign" & " already exists, not redeclaring")
when not declared(time_t):
  type
    time_t* = time_t_603980312
else:
  static :
    hint("Declaration of " & "time_t" & " already exists, not redeclaring")
when not declared(AppMessageOutboxSent):
  type
    AppMessageOutboxSent* = AppMessageOutboxSent_603980495
else:
  static :
    hint("Declaration of " & "AppMessageOutboxSent" &
        " already exists, not redeclaring")
when not declared(DictationSessionStatus):
  type
    DictationSessionStatus* = DictationSessionStatus_603980483
else:
  static :
    hint("Declaration of " & "DictationSessionStatus" &
        " already exists, not redeclaring")
when not declared(GBitmapSequence):
  type
    GBitmapSequence* = GBitmapSequence_603980583
else:
  static :
    hint("Declaration of " & "GBitmapSequence" &
        " already exists, not redeclaring")
when not declared(AppMessageOutboxFailed):
  type
    AppMessageOutboxFailed* = AppMessageOutboxFailed_603980497
else:
  static :
    hint("Declaration of " & "AppMessageOutboxFailed" &
        " already exists, not redeclaring")
when not declared(TupleType):
  type
    TupleType* = TupleType_603980459
else:
  static :
    hint("Declaration of " & "TupleType" & " already exists, not redeclaring")
when not declared(struct_GPathInfo):
  type
    struct_GPathInfo* = struct_GPathInfo_603980627
else:
  static :
    hint("Declaration of " & "struct_GPathInfo" &
        " already exists, not redeclaring")
when not declared(GPathInfo):
  type
    GPathInfo* = GPathInfo_603980629
else:
  static :
    hint("Declaration of " & "GPathInfo" & " already exists, not redeclaring")
when not declared(enum_AppWorkerResult):
  type
    enum_AppWorkerResult* = enum_AppWorkerResult_603980509
else:
  static :
    hint("Declaration of " & "enum_AppWorkerResult" &
        " already exists, not redeclaring")
when not declared(enum_GBitmapFormat):
  type
    enum_GBitmapFormat* = enum_GBitmapFormat_603980577
else:
  static :
    hint("Declaration of " & "enum_GBitmapFormat" &
        " already exists, not redeclaring")
when not declared(CompassHeading):
  type
    CompassHeading* = CompassHeading_603980364
else:
  static :
    hint("Declaration of " & "CompassHeading" &
        " already exists, not redeclaring")
when not declared(GColor8Setter):
  type
    GColor8Setter* = GColor8Setter_603980747
else:
  static :
    hint("Declaration of " & "GColor8Setter" &
        " already exists, not redeclaring")
when not declared(struct_MenuLayerCallbacks):
  type
    struct_MenuLayerCallbacks* = struct_MenuLayerCallbacks_603980815
else:
  static :
    hint("Declaration of " & "struct_MenuLayerCallbacks" &
        " already exists, not redeclaring")
when not declared(GDrawCommandList):
  type
    GDrawCommandList* = GDrawCommandList_603980617
else:
  static :
    hint("Declaration of " & "GDrawCommandList" &
        " already exists, not redeclaring")
when not declared(struct_NumberWindowCallbacks):
  type
    struct_NumberWindowCallbacks* = struct_NumberWindowCallbacks_603980855
else:
  static :
    hint("Declaration of " & "struct_NumberWindowCallbacks" &
        " already exists, not redeclaring")
when not declared(enum_HealthAggregation):
  type
    enum_HealthAggregation* = enum_HealthAggregation_603980397
else:
  static :
    hint("Declaration of " & "enum_HealthAggregation" &
        " already exists, not redeclaring")
when not declared(ScrollLayerCallback):
  type
    ScrollLayerCallback* = ScrollLayerCallback_603980765
else:
  static :
    hint("Declaration of " & "ScrollLayerCallback" &
        " already exists, not redeclaring")
when not declared(ActionMenuItem):
  type
    ActionMenuItem* = ActionMenuItem_603980859
else:
  static :
    hint("Declaration of " & "ActionMenuItem" &
        " already exists, not redeclaring")
when not declared(ActionMenuPerformActionCb):
  type
    ActionMenuPerformActionCb* = ActionMenuPerformActionCb_603980875
else:
  static :
    hint("Declaration of " & "ActionMenuPerformActionCb" &
        " already exists, not redeclaring")
when not declared(struct_MenuIndex):
  type
    struct_MenuIndex* = struct_MenuIndex_603980781
else:
  static :
    hint("Declaration of " & "struct_MenuIndex" &
        " already exists, not redeclaring")
when not declared(RotBitmapLayer):
  type
    RotBitmapLayer* = RotBitmapLayer_603980849
else:
  static :
    hint("Declaration of " & "RotBitmapLayer" &
        " already exists, not redeclaring")
when not declared(GBitmapFormat):
  type
    GBitmapFormat* = GBitmapFormat_603980579
else:
  static :
    hint("Declaration of " & "GBitmapFormat" &
        " already exists, not redeclaring")
when not declared(GEdgeInsets):
  type
    GEdgeInsets* = GEdgeInsets_603980601
else:
  static :
    hint("Declaration of " & "GEdgeInsets" & " already exists, not redeclaring")
when not declared(AppSyncErrorCallback):
  type
    AppSyncErrorCallback* = AppSyncErrorCallback_603980501
else:
  static :
    hint("Declaration of " & "AppSyncErrorCallback" &
        " already exists, not redeclaring")
when not declared(GRect):
  type
    GRect* = GRect_603980575
else:
  static :
    hint("Declaration of " & "GRect" & " already exists, not redeclaring")
when not declared(ConnectionHandlers):
  type
    ConnectionHandlers* = ConnectionHandlers_603980322
else:
  static :
    hint("Declaration of " & "ConnectionHandlers" &
        " already exists, not redeclaring")
when not declared(GTextAttributes):
  type
    GTextAttributes* = GTextAttributes_603980647
else:
  static :
    hint("Declaration of " & "GTextAttributes" &
        " already exists, not redeclaring")
when not declared(WakeupHandler):
  type
    WakeupHandler* = WakeupHandler_603980535
else:
  static :
    hint("Declaration of " & "WakeupHandler" &
        " already exists, not redeclaring")
when not declared(HealthEventType):
  type
    HealthEventType* = HealthEventType_603980419
else:
  static :
    hint("Declaration of " & "HealthEventType" &
        " already exists, not redeclaring")
when not declared(struct_PropertyAnimationImplementation):
  type
    struct_PropertyAnimationImplementation* = struct_PropertyAnimationImplementation_603980723
else:
  static :
    hint("Declaration of " & "struct_PropertyAnimationImplementation" &
        " already exists, not redeclaring")
when not declared(Uuid):
  type
    Uuid* = Uuid_603980447
else:
  static :
    hint("Declaration of " & "Uuid" & " already exists, not redeclaring")
when not declared(ActionBarLayerIconPressAnimation):
  type
    ActionBarLayerIconPressAnimation* = ActionBarLayerIconPressAnimation_603980837
else:
  static :
    hint("Declaration of " & "ActionBarLayerIconPressAnimation" &
        " already exists, not redeclaring")
when not declared(UnobstructedAreaHandlers):
  type
    UnobstructedAreaHandlers* = UnobstructedAreaHandlers_603980759
else:
  static :
    hint("Declaration of " & "UnobstructedAreaHandlers" &
        " already exists, not redeclaring")
when not declared(CompassHeadingHandler):
  type
    CompassHeadingHandler* = CompassHeadingHandler_603980370
else:
  static :
    hint("Declaration of " & "CompassHeadingHandler" &
        " already exists, not redeclaring")
when not declared(UInt32Setter):
  type
    UInt32Setter* = UInt32Setter_603980735
else:
  static :
    hint("Declaration of " & "UInt32Setter" & " already exists, not redeclaring")
when not declared(ActionMenuEachItemCb):
  type
    ActionMenuEachItemCb* = ActionMenuEachItemCb_603980877
else:
  static :
    hint("Declaration of " & "ActionMenuEachItemCb" &
        " already exists, not redeclaring")
when not declared(enum_GAlign):
  type
    enum_GAlign* = enum_GAlign_603980589
else:
  static :
    hint("Declaration of " & "enum_GAlign" & " already exists, not redeclaring")
when not declared(AnimationSetupImplementation):
  type
    AnimationSetupImplementation* = AnimationSetupImplementation_603980707
else:
  static :
    hint("Declaration of " & "AnimationSetupImplementation" &
        " already exists, not redeclaring")
when not declared(PropertyAnimationAccessors):
  type
    PropertyAnimationAccessors* = PropertyAnimationAccessors_603980717
else:
  static :
    hint("Declaration of " & "PropertyAnimationAccessors" &
        " already exists, not redeclaring")
when not declared(CompassStatus):
  type
    CompassStatus* = CompassStatus_603980362
else:
  static :
    hint("Declaration of " & "CompassStatus" &
        " already exists, not redeclaring")
when not declared(AppWorkerResult):
  type
    AppWorkerResult* = AppWorkerResult_603980511
else:
  static :
    hint("Declaration of " & "AppWorkerResult" &
        " already exists, not redeclaring")
when not declared(SmartstrapReadHandler):
  type
    SmartstrapReadHandler* = SmartstrapReadHandler_603980661
else:
  static :
    hint("Declaration of " & "SmartstrapReadHandler" &
        " already exists, not redeclaring")
when not declared(GDrawCommandImage):
  type
    GDrawCommandImage* = GDrawCommandImage_603980615
else:
  static :
    hint("Declaration of " & "GDrawCommandImage" &
        " already exists, not redeclaring")
when not declared(union_GColor8):
  type
    union_GColor8* = union_GColor8_603980559
else:
  static :
    hint("Declaration of " & "union_GColor8" &
        " already exists, not redeclaring")
when not declared(ContentIndicator):
  type
    ContentIndicator* = ContentIndicator_603980771
else:
  static :
    hint("Declaration of " & "ContentIndicator" &
        " already exists, not redeclaring")
when not declared(SimpleMenuLayerSelectCallback):
  type
    SimpleMenuLayerSelectCallback* = SimpleMenuLayerSelectCallback_603980825
else:
  static :
    hint("Declaration of " & "SimpleMenuLayerSelectCallback" &
        " already exists, not redeclaring")
when not declared(enum_PlatformType):
  type
    enum_PlatformType* = enum_PlatformType_603980314
else:
  static :
    hint("Declaration of " & "enum_PlatformType" &
        " already exists, not redeclaring")
when not declared(struct_ContentIndicatorConfig):
  type
    struct_ContentIndicatorConfig* = struct_ContentIndicatorConfig_603980777
else:
  static :
    hint("Declaration of " & "struct_ContentIndicatorConfig" &
        " already exists, not redeclaring")
when not declared(struct_VibePattern):
  type
    struct_VibePattern* = struct_VibePattern_603980883
else:
  static :
    hint("Declaration of " & "struct_VibePattern" &
        " already exists, not redeclaring")
when not declared(SmartstrapAttributeId):
  type
    SmartstrapAttributeId* = SmartstrapAttributeId_603980655
else:
  static :
    hint("Declaration of " & "SmartstrapAttributeId" &
        " already exists, not redeclaring")
when not declared(PreferredContentSize):
  type
    PreferredContentSize* = PreferredContentSize_603980889
else:
  static :
    hint("Declaration of " & "PreferredContentSize" &
        " already exists, not redeclaring")
when not declared(ClickConfigProvider):
  type
    ClickConfigProvider* = ClickConfigProvider_603980675
else:
  static :
    hint("Declaration of " & "ClickConfigProvider" &
        " already exists, not redeclaring")
when not declared(MenuIndex):
  type
    MenuIndex* = MenuIndex_603980783
else:
  static :
    hint("Declaration of " & "MenuIndex" & " already exists, not redeclaring")
when not declared(ActionMenuAlign):
  type
    ActionMenuAlign* = ActionMenuAlign_603980865
else:
  static :
    hint("Declaration of " & "ActionMenuAlign" &
        " already exists, not redeclaring")
when not declared(Animation):
  type
    Animation* = Animation_603980689
else:
  static :
    hint("Declaration of " & "Animation" & " already exists, not redeclaring")
when not declared(ActionMenuDidCloseCb):
  type
    ActionMenuDidCloseCb* = ActionMenuDidCloseCb_603980869
else:
  static :
    hint("Declaration of " & "ActionMenuDidCloseCb" &
        " already exists, not redeclaring")
when not declared(struct_AppGlanceSlice):
  type
    struct_AppGlanceSlice* = struct_AppGlanceSlice_603980547
else:
  static :
    hint("Declaration of " & "struct_AppGlanceSlice" &
        " already exists, not redeclaring")
when not declared(Window):
  type
    Window* = Window_603980681
else:
  static :
    hint("Declaration of " & "Window" & " already exists, not redeclaring")
when not declared(DataLoggingResult):
  type
    DataLoggingResult* = DataLoggingResult_603980443
else:
  static :
    hint("Declaration of " & "DataLoggingResult" &
        " already exists, not redeclaring")
when not declared(StatusCode):
  type
    StatusCode* = StatusCode_603980529
else:
  static :
    hint("Declaration of " & "StatusCode" & " already exists, not redeclaring")
when not declared(enum_DictationSessionStatus):
  type
    enum_DictationSessionStatus* = enum_DictationSessionStatus_603980481
else:
  static :
    hint("Declaration of " & "enum_DictationSessionStatus" &
        " already exists, not redeclaring")
when not declared(SmartstrapWriteHandler):
  type
    SmartstrapWriteHandler* = SmartstrapWriteHandler_603980663
else:
  static :
    hint("Declaration of " & "SmartstrapWriteHandler" &
        " already exists, not redeclaring")
when not declared(SmartstrapHandlers):
  type
    SmartstrapHandlers* = SmartstrapHandlers_603980669
else:
  static :
    hint("Declaration of " & "SmartstrapHandlers" &
        " already exists, not redeclaring")
when not declared(AccelRawDataHandler):
  type
    AccelRawDataHandler* = AccelRawDataHandler_603980352
else:
  static :
    hint("Declaration of " & "AccelRawDataHandler" &
        " already exists, not redeclaring")
when not declared(WeekDay):
  type
    WeekDay* = WeekDay_603980310
else:
  static :
    hint("Declaration of " & "WeekDay" & " already exists, not redeclaring")
when not declared(enum_WatchInfoModel):
  type
    enum_WatchInfoModel* = enum_WatchInfoModel_603980296
else:
  static :
    hint("Declaration of " & "enum_WatchInfoModel" &
        " already exists, not redeclaring")
when not declared(AppWorkerMessageHandler):
  type
    AppWorkerMessageHandler* = AppWorkerMessageHandler_603980517
else:
  static :
    hint("Declaration of " & "AppWorkerMessageHandler" &
        " already exists, not redeclaring")
when not declared(GFont):
  type
    GFont* = GFont_603980637
else:
  static :
    hint("Declaration of " & "GFont" & " already exists, not redeclaring")
when not declared(ActionBarLayer):
  type
    ActionBarLayer* = ActionBarLayer_603980839
else:
  static :
    hint("Declaration of " & "ActionBarLayer" &
        " already exists, not redeclaring")
when not declared(struct_AccelRawData):
  type
    struct_AccelRawData* = struct_AccelRawData_603980342
else:
  static :
    hint("Declaration of " & "struct_AccelRawData" &
        " already exists, not redeclaring")
when not declared(DictionaryResult):
  type
    DictionaryResult* = DictionaryResult_603980455
else:
  static :
    hint("Declaration of " & "DictionaryResult" &
        " already exists, not redeclaring")
when not declared(struct_GSize):
  type
    struct_GSize* = struct_GSize_603980569
else:
  static :
    hint("Declaration of " & "struct_GSize" & " already exists, not redeclaring")
when not declared(GPath):
  type
    GPath* = GPath_603980633
else:
  static :
    hint("Declaration of " & "GPath" & " already exists, not redeclaring")
when not declared(AnimationCurve):
  type
    AnimationCurve* = AnimationCurve_603980695
else:
  static :
    hint("Declaration of " & "AnimationCurve" &
        " already exists, not redeclaring")
when not declared(compiler_darwin_time_t):
  type
    compiler_darwin_time_t* = compiler_darwin_time_t_603980894
else:
  static :
    hint("Declaration of " & "compiler_darwin_time_t" &
        " already exists, not redeclaring")
when not declared(enum_SmartstrapResult):
  type
    enum_SmartstrapResult* = enum_SmartstrapResult_603980649
else:
  static :
    hint("Declaration of " & "enum_SmartstrapResult" &
        " already exists, not redeclaring")
when not declared(MenuLayerDrawSeparatorCallback):
  type
    MenuLayerDrawSeparatorCallback* = MenuLayerDrawSeparatorCallback_603980805
else:
  static :
    hint("Declaration of " & "MenuLayerDrawSeparatorCallback" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_FONT_FALLBACK_INTERNAL):
  when "RESOURCE_ID_FONT_FALLBACK_INTERNAL" is static:
    const
      FONT_KEY_FONT_FALLBACK_INTERNAL* = "RESOURCE_ID_FONT_FALLBACK_INTERNAL" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:3:9
  else:
    let FONT_KEY_FONT_FALLBACK_INTERNAL* = "RESOURCE_ID_FONT_FALLBACK_INTERNAL" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:3:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_FONT_FALLBACK_INTERNAL" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_18_BOLD):
  when "RESOURCE_ID_GOTHIC_18_BOLD" is static:
    const
      FONT_KEY_GOTHIC_18_BOLD* = "RESOURCE_ID_GOTHIC_18_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:4:9
  else:
    let FONT_KEY_GOTHIC_18_BOLD* = "RESOURCE_ID_GOTHIC_18_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:4:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_18_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_24):
  when "RESOURCE_ID_GOTHIC_24" is static:
    const
      FONT_KEY_GOTHIC_24* = "RESOURCE_ID_GOTHIC_24" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:5:9
  else:
    let FONT_KEY_GOTHIC_24* = "RESOURCE_ID_GOTHIC_24" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:5:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_24" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_09):
  when "RESOURCE_ID_GOTHIC_09" is static:
    const
      FONT_KEY_GOTHIC_09* = "RESOURCE_ID_GOTHIC_09" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:6:9
  else:
    let FONT_KEY_GOTHIC_09* = "RESOURCE_ID_GOTHIC_09" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:6:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_09" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_14):
  when "RESOURCE_ID_GOTHIC_14" is static:
    const
      FONT_KEY_GOTHIC_14* = "RESOURCE_ID_GOTHIC_14" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:7:9
  else:
    let FONT_KEY_GOTHIC_14* = "RESOURCE_ID_GOTHIC_14" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:7:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_14" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_14_BOLD):
  when "RESOURCE_ID_GOTHIC_14_BOLD" is static:
    const
      FONT_KEY_GOTHIC_14_BOLD* = "RESOURCE_ID_GOTHIC_14_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:8:9
  else:
    let FONT_KEY_GOTHIC_14_BOLD* = "RESOURCE_ID_GOTHIC_14_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:8:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_14_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_18):
  when "RESOURCE_ID_GOTHIC_18" is static:
    const
      FONT_KEY_GOTHIC_18* = "RESOURCE_ID_GOTHIC_18" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:9:9
  else:
    let FONT_KEY_GOTHIC_18* = "RESOURCE_ID_GOTHIC_18" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:9:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_18" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_24_BOLD):
  when "RESOURCE_ID_GOTHIC_24_BOLD" is static:
    const
      FONT_KEY_GOTHIC_24_BOLD* = "RESOURCE_ID_GOTHIC_24_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:10:9
  else:
    let FONT_KEY_GOTHIC_24_BOLD* = "RESOURCE_ID_GOTHIC_24_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:10:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_24_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_28):
  when "RESOURCE_ID_GOTHIC_28" is static:
    const
      FONT_KEY_GOTHIC_28* = "RESOURCE_ID_GOTHIC_28" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:11:9
  else:
    let FONT_KEY_GOTHIC_28* = "RESOURCE_ID_GOTHIC_28" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:11:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_28" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_28_BOLD):
  when "RESOURCE_ID_GOTHIC_28_BOLD" is static:
    const
      FONT_KEY_GOTHIC_28_BOLD* = "RESOURCE_ID_GOTHIC_28_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:12:9
  else:
    let FONT_KEY_GOTHIC_28_BOLD* = "RESOURCE_ID_GOTHIC_28_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:12:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_28_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_30_BLACK):
  when "RESOURCE_ID_BITHAM_30_BLACK" is static:
    const
      FONT_KEY_BITHAM_30_BLACK* = "RESOURCE_ID_BITHAM_30_BLACK" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:13:9
  else:
    let FONT_KEY_BITHAM_30_BLACK* = "RESOURCE_ID_BITHAM_30_BLACK" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:13:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_30_BLACK" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_42_BOLD):
  when "RESOURCE_ID_BITHAM_42_BOLD" is static:
    const
      FONT_KEY_BITHAM_42_BOLD* = "RESOURCE_ID_BITHAM_42_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:14:9
  else:
    let FONT_KEY_BITHAM_42_BOLD* = "RESOURCE_ID_BITHAM_42_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:14:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_42_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_42_LIGHT):
  when "RESOURCE_ID_BITHAM_42_LIGHT" is static:
    const
      FONT_KEY_BITHAM_42_LIGHT* = "RESOURCE_ID_BITHAM_42_LIGHT" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:15:9
  else:
    let FONT_KEY_BITHAM_42_LIGHT* = "RESOURCE_ID_BITHAM_42_LIGHT" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:15:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_42_LIGHT" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_42_MEDIUM_NUMBERS):
  when "RESOURCE_ID_BITHAM_42_MEDIUM_NUMBERS" is static:
    const
      FONT_KEY_BITHAM_42_MEDIUM_NUMBERS* = "RESOURCE_ID_BITHAM_42_MEDIUM_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:16:9
  else:
    let FONT_KEY_BITHAM_42_MEDIUM_NUMBERS* = "RESOURCE_ID_BITHAM_42_MEDIUM_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:16:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_42_MEDIUM_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_34_MEDIUM_NUMBERS):
  when "RESOURCE_ID_BITHAM_34_MEDIUM_NUMBERS" is static:
    const
      FONT_KEY_BITHAM_34_MEDIUM_NUMBERS* = "RESOURCE_ID_BITHAM_34_MEDIUM_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:17:9
  else:
    let FONT_KEY_BITHAM_34_MEDIUM_NUMBERS* = "RESOURCE_ID_BITHAM_34_MEDIUM_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:17:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_34_MEDIUM_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_34_LIGHT_SUBSET):
  when "RESOURCE_ID_BITHAM_34_LIGHT_SUBSET" is static:
    const
      FONT_KEY_BITHAM_34_LIGHT_SUBSET* = "RESOURCE_ID_BITHAM_34_LIGHT_SUBSET" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:18:9
  else:
    let FONT_KEY_BITHAM_34_LIGHT_SUBSET* = "RESOURCE_ID_BITHAM_34_LIGHT_SUBSET" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:18:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_34_LIGHT_SUBSET" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_18_LIGHT_SUBSET):
  when "RESOURCE_ID_BITHAM_18_LIGHT_SUBSET" is static:
    const
      FONT_KEY_BITHAM_18_LIGHT_SUBSET* = "RESOURCE_ID_BITHAM_18_LIGHT_SUBSET" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:19:9
  else:
    let FONT_KEY_BITHAM_18_LIGHT_SUBSET* = "RESOURCE_ID_BITHAM_18_LIGHT_SUBSET" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:19:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_18_LIGHT_SUBSET" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_ROBOTO_CONDENSED_21):
  when "RESOURCE_ID_ROBOTO_CONDENSED_21" is static:
    const
      FONT_KEY_ROBOTO_CONDENSED_21* = "RESOURCE_ID_ROBOTO_CONDENSED_21" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:20:9
  else:
    let FONT_KEY_ROBOTO_CONDENSED_21* = "RESOURCE_ID_ROBOTO_CONDENSED_21" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:20:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_ROBOTO_CONDENSED_21" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_ROBOTO_BOLD_SUBSET_49):
  when "RESOURCE_ID_ROBOTO_BOLD_SUBSET_49" is static:
    const
      FONT_KEY_ROBOTO_BOLD_SUBSET_49* = "RESOURCE_ID_ROBOTO_BOLD_SUBSET_49" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:21:9
  else:
    let FONT_KEY_ROBOTO_BOLD_SUBSET_49* = "RESOURCE_ID_ROBOTO_BOLD_SUBSET_49" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:21:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_ROBOTO_BOLD_SUBSET_49" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_DROID_SERIF_28_BOLD):
  when "RESOURCE_ID_DROID_SERIF_28_BOLD" is static:
    const
      FONT_KEY_DROID_SERIF_28_BOLD* = "RESOURCE_ID_DROID_SERIF_28_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:22:9
  else:
    let FONT_KEY_DROID_SERIF_28_BOLD* = "RESOURCE_ID_DROID_SERIF_28_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:22:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_DROID_SERIF_28_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_20_BOLD_NUMBERS):
  when "RESOURCE_ID_LECO_20_BOLD_NUMBERS" is static:
    const
      FONT_KEY_LECO_20_BOLD_NUMBERS* = "RESOURCE_ID_LECO_20_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:23:9
  else:
    let FONT_KEY_LECO_20_BOLD_NUMBERS* = "RESOURCE_ID_LECO_20_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:23:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_20_BOLD_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_26_BOLD_NUMBERS_AM_PM):
  when "RESOURCE_ID_LECO_26_BOLD_NUMBERS_AM_PM" is static:
    const
      FONT_KEY_LECO_26_BOLD_NUMBERS_AM_PM* = "RESOURCE_ID_LECO_26_BOLD_NUMBERS_AM_PM" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:24:9
  else:
    let FONT_KEY_LECO_26_BOLD_NUMBERS_AM_PM* = "RESOURCE_ID_LECO_26_BOLD_NUMBERS_AM_PM" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:24:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_26_BOLD_NUMBERS_AM_PM" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_32_BOLD_NUMBERS):
  when "RESOURCE_ID_LECO_32_BOLD_NUMBERS" is static:
    const
      FONT_KEY_LECO_32_BOLD_NUMBERS* = "RESOURCE_ID_LECO_32_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:25:9
  else:
    let FONT_KEY_LECO_32_BOLD_NUMBERS* = "RESOURCE_ID_LECO_32_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:25:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_32_BOLD_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_36_BOLD_NUMBERS):
  when "RESOURCE_ID_LECO_36_BOLD_NUMBERS" is static:
    const
      FONT_KEY_LECO_36_BOLD_NUMBERS* = "RESOURCE_ID_LECO_36_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:26:9
  else:
    let FONT_KEY_LECO_36_BOLD_NUMBERS* = "RESOURCE_ID_LECO_36_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:26:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_36_BOLD_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_38_BOLD_NUMBERS):
  when "RESOURCE_ID_LECO_38_BOLD_NUMBERS" is static:
    const
      FONT_KEY_LECO_38_BOLD_NUMBERS* = "RESOURCE_ID_LECO_38_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:27:9
  else:
    let FONT_KEY_LECO_38_BOLD_NUMBERS* = "RESOURCE_ID_LECO_38_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:27:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_38_BOLD_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_42_NUMBERS):
  when "RESOURCE_ID_LECO_42_NUMBERS" is static:
    const
      FONT_KEY_LECO_42_NUMBERS* = "RESOURCE_ID_LECO_42_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:28:9
  else:
    let FONT_KEY_LECO_42_NUMBERS* = "RESOURCE_ID_LECO_42_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:28:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_42_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_28_LIGHT_NUMBERS):
  when "RESOURCE_ID_LECO_28_LIGHT_NUMBERS" is static:
    const
      FONT_KEY_LECO_28_LIGHT_NUMBERS* = "RESOURCE_ID_LECO_28_LIGHT_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:29:9
  else:
    let FONT_KEY_LECO_28_LIGHT_NUMBERS* = "RESOURCE_ID_LECO_28_LIGHT_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:29:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_28_LIGHT_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_FONT_FALLBACK):
  when "RESOURCE_ID_FONT_FALLBACK" is static:
    const
      FONT_KEY_FONT_FALLBACK* = "RESOURCE_ID_FONT_FALLBACK" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:30:9
  else:
    let FONT_KEY_FONT_FALLBACK* = "RESOURCE_ID_FONT_FALLBACK" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble_fonts.h:30:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_FONT_FALLBACK" &
        " already exists, not redeclaring")
when not declared(DEFAULT_MENU_ICON):
  when 0 is static:
    const
      DEFAULT_MENU_ICON* = 0 ## Generated based on /Users/zawa/Projects/pebble/nebble_dev/nebble/src/nebble/ffi/stubs/src/resource_ids.auto.h:5:9
  else:
    let DEFAULT_MENU_ICON* = 0 ## Generated based on /Users/zawa/Projects/pebble/nebble_dev/nebble/src/nebble/ffi/stubs/src/resource_ids.auto.h:5:9
else:
  static :
    hint("Declaration of " & "DEFAULT_MENU_ICON" &
        " already exists, not redeclaring")
when not declared(PBL_APP_INFO_SIMPLE):
  when PBL_APP_INFO is typedesc:
    type
      PBL_APP_INFO_SIMPLE* = PBL_APP_INFO ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:14:9
  else:
    when PBL_APP_INFO is static:
      const
        PBL_APP_INFO_SIMPLE* = PBL_APP_INFO ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:14:9
    else:
      let PBL_APP_INFO_SIMPLE* = PBL_APP_INFO ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:14:9
else:
  static :
    hint("Declaration of " & "PBL_APP_INFO_SIMPLE" &
        " already exists, not redeclaring")
when not declared(TRIG_MAX_RATIO):
  when 65535 is static:
    const
      TRIG_MAX_RATIO* = 65535 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:307:9
  else:
    let TRIG_MAX_RATIO* = 65535 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:307:9
else:
  static :
    hint("Declaration of " & "TRIG_MAX_RATIO" &
        " already exists, not redeclaring")
when not declared(TRIG_MAX_ANGLE):
  when 65536 is static:
    const
      TRIG_MAX_ANGLE* = 65536 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:312:9
  else:
    let TRIG_MAX_ANGLE* = 65536 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:312:9
else:
  static :
    hint("Declaration of " & "TRIG_MAX_ANGLE" &
        " already exists, not redeclaring")
when not declared(TIMEZONE_NAME_LENGTH):
  when 32 is static:
    const
      TIMEZONE_NAME_LENGTH* = 32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:389:9
  else:
    let TIMEZONE_NAME_LENGTH* = 32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:389:9
else:
  static :
    hint("Declaration of " & "TIMEZONE_NAME_LENGTH" &
        " already exists, not redeclaring")
when not declared(PBL_PLATFORM_TYPE_CURRENT):
  when PlatformTypeDiorite is typedesc:
    type
      PBL_PLATFORM_TYPE_CURRENT* = PlatformTypeDiorite ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:413:9
  else:
    when PlatformTypeDiorite is static:
      const
        PBL_PLATFORM_TYPE_CURRENT* = PlatformTypeDiorite ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:413:9
    else:
      let PBL_PLATFORM_TYPE_CURRENT* = PlatformTypeDiorite ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:413:9
else:
  static :
    hint("Declaration of " & "PBL_PLATFORM_TYPE_CURRENT" &
        " already exists, not redeclaring")
when not declared(UUID_SIZE):
  when 16 is static:
    const
      UUID_SIZE* = 16        ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1515:9
  else:
    let UUID_SIZE* = 16      ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:1515:9
else:
  static :
    hint("Declaration of " & "UUID_SIZE" & " already exists, not redeclaring")
when not declared(APP_MESSAGE_INBOX_SIZE_MINIMUM):
  when 124 is static:
    const
      APP_MESSAGE_INBOX_SIZE_MINIMUM* = 124 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2457:9
  else:
    let APP_MESSAGE_INBOX_SIZE_MINIMUM* = 124 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2457:9
else:
  static :
    hint("Declaration of " & "APP_MESSAGE_INBOX_SIZE_MINIMUM" &
        " already exists, not redeclaring")
when not declared(APP_MESSAGE_OUTBOX_SIZE_MINIMUM):
  when 636 is static:
    const
      APP_MESSAGE_OUTBOX_SIZE_MINIMUM* = 636 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2464:9
  else:
    let APP_MESSAGE_OUTBOX_SIZE_MINIMUM* = 636 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2464:9
else:
  static :
    hint("Declaration of " & "APP_MESSAGE_OUTBOX_SIZE_MINIMUM" &
        " already exists, not redeclaring")
when not declared(RESOURCE_ID_FONT_FALLBACK):
  when RESOURCE_ID_GOTHIC_14 is typedesc:
    type
      RESOURCE_ID_FONT_FALLBACK* = RESOURCE_ID_GOTHIC_14 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2732:9
  else:
    when RESOURCE_ID_GOTHIC_14 is static:
      const
        RESOURCE_ID_FONT_FALLBACK* = RESOURCE_ID_GOTHIC_14 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2732:9
    else:
      let RESOURCE_ID_FONT_FALLBACK* = RESOURCE_ID_GOTHIC_14 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2732:9
else:
  static :
    hint("Declaration of " & "RESOURCE_ID_FONT_FALLBACK" &
        " already exists, not redeclaring")
when not declared(PERSIST_DATA_MAX_LENGTH):
  when 256 is static:
    const
      PERSIST_DATA_MAX_LENGTH* = 256 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2978:9
  else:
    let PERSIST_DATA_MAX_LENGTH* = 256 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2978:9
else:
  static :
    hint("Declaration of " & "PERSIST_DATA_MAX_LENGTH" &
        " already exists, not redeclaring")
when not declared(PERSIST_STRING_MAX_LENGTH):
  when PERSIST_DATA_MAX_LENGTH is typedesc:
    type
      PERSIST_STRING_MAX_LENGTH* = PERSIST_DATA_MAX_LENGTH ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2981:9
  else:
    when PERSIST_DATA_MAX_LENGTH is static:
      const
        PERSIST_STRING_MAX_LENGTH* = PERSIST_DATA_MAX_LENGTH ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2981:9
    else:
      let PERSIST_STRING_MAX_LENGTH* = PERSIST_DATA_MAX_LENGTH ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:2981:9
else:
  static :
    hint("Declaration of " & "PERSIST_STRING_MAX_LENGTH" &
        " already exists, not redeclaring")
when not declared(UINT32_MAX):
  when cast[cuint](4294967295'i64) is static:
    const
      UINT32_MAX* = cast[cuint](4294967295'i64) ## Generated based on /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:109:9
  else:
    let UINT32_MAX* = cast[cuint](4294967295'i64) ## Generated based on /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:109:9
else:
  static :
    hint("Declaration of " & "UINT32_MAX" & " already exists, not redeclaring")
when not declared(PLAY_DURATION_INFINITE):
  when UINT32_MAX is typedesc:
    type
      PLAY_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3483:9
  else:
    when UINT32_MAX is static:
      const
        PLAY_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3483:9
    else:
      let PLAY_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:3483:9
else:
  static :
    hint("Declaration of " & "PLAY_DURATION_INFINITE" &
        " already exists, not redeclaring")
when not declared(SMARTSTRAP_TIMEOUT_DEFAULT):
  when 250 is static:
    const
      SMARTSTRAP_TIMEOUT_DEFAULT* = 250 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4845:9
  else:
    let SMARTSTRAP_TIMEOUT_DEFAULT* = 250 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4845:9
else:
  static :
    hint("Declaration of " & "SMARTSTRAP_TIMEOUT_DEFAULT" &
        " already exists, not redeclaring")
when not declared(SMARTSTRAP_RAW_DATA_SERVICE_ID):
  when 0 is static:
    const
      SMARTSTRAP_RAW_DATA_SERVICE_ID* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4848:9
  else:
    let SMARTSTRAP_RAW_DATA_SERVICE_ID* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4848:9
else:
  static :
    hint("Declaration of " & "SMARTSTRAP_RAW_DATA_SERVICE_ID" &
        " already exists, not redeclaring")
when not declared(SMARTSTRAP_RAW_DATA_ATTRIBUTE_ID):
  when 0 is static:
    const
      SMARTSTRAP_RAW_DATA_ATTRIBUTE_ID* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4851:9
  else:
    let SMARTSTRAP_RAW_DATA_ATTRIBUTE_ID* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:4851:9
else:
  static :
    hint("Declaration of " & "SMARTSTRAP_RAW_DATA_ATTRIBUTE_ID" &
        " already exists, not redeclaring")
when not declared(ANIMATION_DURATION_INFINITE):
  when UINT32_MAX is typedesc:
    type
      ANIMATION_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5644:9
  else:
    when UINT32_MAX is static:
      const
        ANIMATION_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5644:9
    else:
      let ANIMATION_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5644:9
else:
  static :
    hint("Declaration of " & "ANIMATION_DURATION_INFINITE" &
        " already exists, not redeclaring")
when not declared(ANIMATION_PLAY_COUNT_INFINITE):
  when UINT32_MAX is typedesc:
    type
      ANIMATION_PLAY_COUNT_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5649:9
  else:
    when UINT32_MAX is static:
      const
        ANIMATION_PLAY_COUNT_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5649:9
    else:
      let ANIMATION_PLAY_COUNT_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5649:9
else:
  static :
    hint("Declaration of " & "ANIMATION_PLAY_COUNT_INFINITE" &
        " already exists, not redeclaring")
when not declared(ANIMATION_NORMALIZED_MIN):
  when 0 is static:
    const
      ANIMATION_NORMALIZED_MIN* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5652:9
  else:
    let ANIMATION_NORMALIZED_MIN* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5652:9
else:
  static :
    hint("Declaration of " & "ANIMATION_NORMALIZED_MIN" &
        " already exists, not redeclaring")
when not declared(ANIMATION_NORMALIZED_MAX):
  when 65535 is static:
    const
      ANIMATION_NORMALIZED_MAX* = 65535 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5655:9
  else:
    let ANIMATION_NORMALIZED_MAX* = 65535 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:5655:9
else:
  static :
    hint("Declaration of " & "ANIMATION_NORMALIZED_MAX" &
        " already exists, not redeclaring")
when not declared(NUM_ACTION_BAR_ITEMS):
  when 3 is static:
    const
      NUM_ACTION_BAR_ITEMS* = 3 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7572:9
  else:
    let NUM_ACTION_BAR_ITEMS* = 3 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:7572:9
else:
  static :
    hint("Declaration of " & "NUM_ACTION_BAR_ITEMS" &
        " already exists, not redeclaring")
when not declared(TZ_LEN):
  when 6 is static:
    const
      TZ_LEN* = 6            ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8359:9
  else:
    let TZ_LEN* = 6          ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8359:9
else:
  static :
    hint("Declaration of " & "TZ_LEN" & " already exists, not redeclaring")
when not declared(SECONDS_PER_MINUTE):
  when 60 is static:
    const
      SECONDS_PER_MINUTE* = 60 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8361:9
  else:
    let SECONDS_PER_MINUTE* = 60 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8361:9
else:
  static :
    hint("Declaration of " & "SECONDS_PER_MINUTE" &
        " already exists, not redeclaring")
when not declared(MINUTES_PER_HOUR):
  when 60 is static:
    const
      MINUTES_PER_HOUR* = 60 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8363:9
  else:
    let MINUTES_PER_HOUR* = 60 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8363:9
else:
  static :
    hint("Declaration of " & "MINUTES_PER_HOUR" &
        " already exists, not redeclaring")
when not declared(HOURS_PER_DAY):
  when 24 is static:
    const
      HOURS_PER_DAY* = 24    ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8367:9
  else:
    let HOURS_PER_DAY* = 24  ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.127/sdk-core/pebble/diorite/include/pebble.h:8367:9
else:
  static :
    hint("Declaration of " & "HOURS_PER_DAY" &
        " already exists, not redeclaring")
when not declared(MESSAGE_KEY_dummy):
  var MESSAGE_KEY_dummy* {.importc: "MESSAGE_KEY_dummy".}: uint32
else:
  static :
    hint("Declaration of " & "MESSAGE_KEY_dummy" &
        " already exists, not redeclaring")
when not declared(i18n_get_system_locale):
  proc i18n_get_system_locale*(): cstring {.cdecl,
      importc: "i18n_get_system_locale".}
else:
  static :
    hint("Declaration of " & "i18n_get_system_locale" &
        " already exists, not redeclaring")
when not declared(watch_info_get_model):
  proc watch_info_get_model*(): WatchInfoModel_603980299 {.cdecl,
      importc: "watch_info_get_model".}
else:
  static :
    hint("Declaration of " & "watch_info_get_model" &
        " already exists, not redeclaring")
when not declared(watch_info_get_firmware_version):
  proc watch_info_get_firmware_version*(): WatchInfoVersion_603980307 {.cdecl,
      importc: "watch_info_get_firmware_version".}
else:
  static :
    hint("Declaration of " & "watch_info_get_firmware_version" &
        " already exists, not redeclaring")
when not declared(watch_info_get_color):
  proc watch_info_get_color*(): WatchInfoColor_603980303 {.cdecl,
      importc: "watch_info_get_color".}
else:
  static :
    hint("Declaration of " & "watch_info_get_color" &
        " already exists, not redeclaring")
when not declared(sin_lookup):
  proc sin_lookup*(angle: int32): int32 {.cdecl, importc: "sin_lookup".}
else:
  static :
    hint("Declaration of " & "sin_lookup" & " already exists, not redeclaring")
when not declared(cos_lookup):
  proc cos_lookup*(angle: int32): int32 {.cdecl, importc: "cos_lookup".}
else:
  static :
    hint("Declaration of " & "cos_lookup" & " already exists, not redeclaring")
when not declared(atan2_lookup):
  proc atan2_lookup*(y: int16; x: int16): int32 {.cdecl, importc: "atan2_lookup".}
else:
  static :
    hint("Declaration of " & "atan2_lookup" & " already exists, not redeclaring")
when not declared(clock_copy_time_string):
  proc clock_copy_time_string*(buffer: cstring; size: uint8): void {.cdecl,
      importc: "clock_copy_time_string".}
else:
  static :
    hint("Declaration of " & "clock_copy_time_string" &
        " already exists, not redeclaring")
when not declared(clock_is_24h_style):
  proc clock_is_24h_style*(): bool {.cdecl, importc: "clock_is_24h_style".}
else:
  static :
    hint("Declaration of " & "clock_is_24h_style" &
        " already exists, not redeclaring")
when not declared(clock_to_timestamp):
  proc clock_to_timestamp*(day: WeekDay_603980311; hour: cint; minute: cint): time_t_603980313 {.
      cdecl, importc: "clock_to_timestamp".}
else:
  static :
    hint("Declaration of " & "clock_to_timestamp" &
        " already exists, not redeclaring")
when not declared(clock_is_timezone_set):
  proc clock_is_timezone_set*(): bool {.cdecl, importc: "clock_is_timezone_set".}
else:
  static :
    hint("Declaration of " & "clock_is_timezone_set" &
        " already exists, not redeclaring")
when not declared(clock_get_timezone):
  proc clock_get_timezone*(timezone: cstring; buffer_size: csize_t): void {.
      cdecl, importc: "clock_get_timezone".}
else:
  static :
    hint("Declaration of " & "clock_get_timezone" &
        " already exists, not redeclaring")
when not declared(connection_service_peek_pebble_app_connection):
  proc connection_service_peek_pebble_app_connection*(): bool {.cdecl,
      importc: "connection_service_peek_pebble_app_connection".}
else:
  static :
    hint("Declaration of " & "connection_service_peek_pebble_app_connection" &
        " already exists, not redeclaring")
when not declared(connection_service_peek_pebblekit_connection):
  proc connection_service_peek_pebblekit_connection*(): bool {.cdecl,
      importc: "connection_service_peek_pebblekit_connection".}
else:
  static :
    hint("Declaration of " & "connection_service_peek_pebblekit_connection" &
        " already exists, not redeclaring")
when not declared(connection_service_subscribe):
  proc connection_service_subscribe*(conn_handlers: ConnectionHandlers_603980323): void {.
      cdecl, importc: "connection_service_subscribe".}
else:
  static :
    hint("Declaration of " & "connection_service_subscribe" &
        " already exists, not redeclaring")
when not declared(connection_service_unsubscribe):
  proc connection_service_unsubscribe*(): void {.cdecl,
      importc: "connection_service_unsubscribe".}
else:
  static :
    hint("Declaration of " & "connection_service_unsubscribe" &
        " already exists, not redeclaring")
when not declared(bluetooth_connection_service_peek):
  proc bluetooth_connection_service_peek*(): bool {.cdecl,
      importc: "bluetooth_connection_service_peek".}
else:
  static :
    hint("Declaration of " & "bluetooth_connection_service_peek" &
        " already exists, not redeclaring")
when not declared(bluetooth_connection_service_subscribe):
  proc bluetooth_connection_service_subscribe*(handler: ConnectionHandler_603980319): void {.
      cdecl, importc: "bluetooth_connection_service_subscribe".}
else:
  static :
    hint("Declaration of " & "bluetooth_connection_service_subscribe" &
        " already exists, not redeclaring")
when not declared(bluetooth_connection_service_unsubscribe):
  proc bluetooth_connection_service_unsubscribe*(): void {.cdecl,
      importc: "bluetooth_connection_service_unsubscribe".}
else:
  static :
    hint("Declaration of " & "bluetooth_connection_service_unsubscribe" &
        " already exists, not redeclaring")
when not declared(app_focus_service_subscribe_handlers):
  proc app_focus_service_subscribe_handlers*(handlers: AppFocusHandlers_603980331): void {.
      cdecl, importc: "app_focus_service_subscribe_handlers".}
else:
  static :
    hint("Declaration of " & "app_focus_service_subscribe_handlers" &
        " already exists, not redeclaring")
when not declared(app_focus_service_subscribe):
  proc app_focus_service_subscribe*(handler: AppFocusHandler_603980327): void {.
      cdecl, importc: "app_focus_service_subscribe".}
else:
  static :
    hint("Declaration of " & "app_focus_service_subscribe" &
        " already exists, not redeclaring")
when not declared(app_focus_service_unsubscribe):
  proc app_focus_service_unsubscribe*(): void {.cdecl,
      importc: "app_focus_service_unsubscribe".}
else:
  static :
    hint("Declaration of " & "app_focus_service_unsubscribe" &
        " already exists, not redeclaring")
when not declared(battery_state_service_subscribe):
  proc battery_state_service_subscribe*(handler: BatteryStateHandler_603980337): void {.
      cdecl, importc: "battery_state_service_subscribe".}
else:
  static :
    hint("Declaration of " & "battery_state_service_subscribe" &
        " already exists, not redeclaring")
when not declared(battery_state_service_unsubscribe):
  proc battery_state_service_unsubscribe*(): void {.cdecl,
      importc: "battery_state_service_unsubscribe".}
else:
  static :
    hint("Declaration of " & "battery_state_service_unsubscribe" &
        " already exists, not redeclaring")
when not declared(battery_state_service_peek):
  proc battery_state_service_peek*(): BatteryChargeState_603980335 {.cdecl,
      importc: "battery_state_service_peek".}
else:
  static :
    hint("Declaration of " & "battery_state_service_peek" &
        " already exists, not redeclaring")
when not declared(accel_service_peek):
  proc accel_service_peek*(data: ptr AccelData_603980341): cint {.cdecl,
      importc: "accel_service_peek".}
else:
  static :
    hint("Declaration of " & "accel_service_peek" &
        " already exists, not redeclaring")
when not declared(accel_service_set_sampling_rate):
  proc accel_service_set_sampling_rate*(rate: AccelSamplingRate_603980359): cint {.
      cdecl, importc: "accel_service_set_sampling_rate".}
else:
  static :
    hint("Declaration of " & "accel_service_set_sampling_rate" &
        " already exists, not redeclaring")
when not declared(accel_service_set_samples_per_update):
  proc accel_service_set_samples_per_update*(num_samples: uint32): cint {.cdecl,
      importc: "accel_service_set_samples_per_update".}
else:
  static :
    hint("Declaration of " & "accel_service_set_samples_per_update" &
        " already exists, not redeclaring")
when not declared(accel_data_service_subscribe):
  proc accel_data_service_subscribe*(samples_per_update: uint32;
                                     handler: AccelDataHandler_603980351): void {.
      cdecl, importc: "accel_data_service_subscribe".}
else:
  static :
    hint("Declaration of " & "accel_data_service_subscribe" &
        " already exists, not redeclaring")
when not declared(accel_data_service_unsubscribe):
  proc accel_data_service_unsubscribe*(): void {.cdecl,
      importc: "accel_data_service_unsubscribe".}
else:
  static :
    hint("Declaration of " & "accel_data_service_unsubscribe" &
        " already exists, not redeclaring")
when not declared(accel_tap_service_subscribe):
  proc accel_tap_service_subscribe*(handler: AccelTapHandler_603980355): void {.
      cdecl, importc: "accel_tap_service_subscribe".}
else:
  static :
    hint("Declaration of " & "accel_tap_service_subscribe" &
        " already exists, not redeclaring")
when not declared(accel_tap_service_unsubscribe):
  proc accel_tap_service_unsubscribe*(): void {.cdecl,
      importc: "accel_tap_service_unsubscribe".}
else:
  static :
    hint("Declaration of " & "accel_tap_service_unsubscribe" &
        " already exists, not redeclaring")
when not declared(accel_raw_data_service_subscribe):
  proc accel_raw_data_service_subscribe*(samples_per_update: uint32;
      handler: AccelRawDataHandler_603980353): void {.cdecl,
      importc: "accel_raw_data_service_subscribe".}
else:
  static :
    hint("Declaration of " & "accel_raw_data_service_subscribe" &
        " already exists, not redeclaring")
when not declared(compass_service_set_heading_filter):
  proc compass_service_set_heading_filter*(filter: CompassHeading_603980365): cint {.
      cdecl, importc: "compass_service_set_heading_filter".}
else:
  static :
    hint("Declaration of " & "compass_service_set_heading_filter" &
        " already exists, not redeclaring")
when not declared(compass_service_subscribe):
  proc compass_service_subscribe*(handler: CompassHeadingHandler_603980371): void {.
      cdecl, importc: "compass_service_subscribe".}
else:
  static :
    hint("Declaration of " & "compass_service_subscribe" &
        " already exists, not redeclaring")
when not declared(compass_service_unsubscribe):
  proc compass_service_unsubscribe*(): void {.cdecl,
      importc: "compass_service_unsubscribe".}
else:
  static :
    hint("Declaration of " & "compass_service_unsubscribe" &
        " already exists, not redeclaring")
when not declared(compass_service_peek):
  proc compass_service_peek*(data: ptr CompassHeadingData_603980369): cint {.
      cdecl, importc: "compass_service_peek".}
else:
  static :
    hint("Declaration of " & "compass_service_peek" &
        " already exists, not redeclaring")
when not declared(tick_timer_service_subscribe):
  proc tick_timer_service_subscribe*(tick_units: TimeUnits_603980382;
                                     handler: TickHandler_603980384): void {.
      cdecl, importc: "tick_timer_service_subscribe".}
else:
  static :
    hint("Declaration of " & "tick_timer_service_subscribe" &
        " already exists, not redeclaring")
when not declared(tick_timer_service_unsubscribe):
  proc tick_timer_service_unsubscribe*(): void {.cdecl,
      importc: "tick_timer_service_unsubscribe".}
else:
  static :
    hint("Declaration of " & "tick_timer_service_unsubscribe" &
        " already exists, not redeclaring")
when not declared(health_service_sum):
  proc health_service_sum*(metric: HealthMetric_603980388; time_start: time_t_603980313;
                           time_end: time_t_603980313): HealthValue_603980390 {.
      cdecl, importc: "health_service_sum".}
else:
  static :
    hint("Declaration of " & "health_service_sum" &
        " already exists, not redeclaring")
when not declared(health_service_sum_today):
  proc health_service_sum_today*(metric: HealthMetric_603980388): HealthValue_603980390 {.
      cdecl, importc: "health_service_sum_today".}
else:
  static :
    hint("Declaration of " & "health_service_sum_today" &
        " already exists, not redeclaring")
when not declared(health_service_peek_current_value):
  proc health_service_peek_current_value*(metric: HealthMetric_603980388): HealthValue_603980390 {.
      cdecl, importc: "health_service_peek_current_value".}
else:
  static :
    hint("Declaration of " & "health_service_peek_current_value" &
        " already exists, not redeclaring")
when not declared(health_service_sum_averaged):
  proc health_service_sum_averaged*(metric: HealthMetric_603980388;
                                    time_start: time_t_603980313;
                                    time_end: time_t_603980313;
                                    scope: HealthServiceTimeScope_603980396): HealthValue_603980390 {.
      cdecl, importc: "health_service_sum_averaged".}
else:
  static :
    hint("Declaration of " & "health_service_sum_averaged" &
        " already exists, not redeclaring")
when not declared(health_service_aggregate_averaged):
  proc health_service_aggregate_averaged*(metric: HealthMetric_603980388;
      time_start: time_t_603980313; time_end: time_t_603980313;
      aggregation: HealthAggregation_603980400; scope: HealthServiceTimeScope_603980396): HealthValue_603980390 {.
      cdecl, importc: "health_service_aggregate_averaged".}
else:
  static :
    hint("Declaration of " & "health_service_aggregate_averaged" &
        " already exists, not redeclaring")
when not declared(health_service_peek_current_activities):
  proc health_service_peek_current_activities*(): HealthActivityMask_603980402 {.
      cdecl, importc: "health_service_peek_current_activities".}
else:
  static :
    hint("Declaration of " & "health_service_peek_current_activities" &
        " already exists, not redeclaring")
when not declared(health_service_activities_iterate):
  proc health_service_activities_iterate*(activity_mask: HealthActivityMask_603980402;
      time_start: time_t_603980313; time_end: time_t_603980313;
      direction: HealthIterationDirection_603980412;
      callback: HealthActivityIteratorCB_603980408; context: pointer): void {.
      cdecl, importc: "health_service_activities_iterate".}
else:
  static :
    hint("Declaration of " & "health_service_activities_iterate" &
        " already exists, not redeclaring")
when not declared(health_service_metric_accessible):
  proc health_service_metric_accessible*(metric: HealthMetric_603980388;
      time_start: time_t_603980313; time_end: time_t_603980313): HealthServiceAccessibilityMask_603980416 {.
      cdecl, importc: "health_service_metric_accessible".}
else:
  static :
    hint("Declaration of " & "health_service_metric_accessible" &
        " already exists, not redeclaring")
when not declared(health_service_metric_averaged_accessible):
  proc health_service_metric_averaged_accessible*(metric: HealthMetric_603980388;
      time_start: time_t_603980313; time_end: time_t_603980313;
      scope: HealthServiceTimeScope_603980396): HealthServiceAccessibilityMask_603980416 {.
      cdecl, importc: "health_service_metric_averaged_accessible".}
else:
  static :
    hint("Declaration of " & "health_service_metric_averaged_accessible" &
        " already exists, not redeclaring")
when not declared(health_service_metric_aggregate_averaged_accessible):
  proc health_service_metric_aggregate_averaged_accessible*(
      metric: HealthMetric_603980388; time_start: time_t_603980313;
      time_end: time_t_603980313; aggregation: HealthAggregation_603980400;
      scope: HealthServiceTimeScope_603980396): HealthServiceAccessibilityMask_603980416 {.
      cdecl, importc: "health_service_metric_aggregate_averaged_accessible".}
else:
  static :
    hint("Declaration of " &
        "health_service_metric_aggregate_averaged_accessible" &
        " already exists, not redeclaring")
when not declared(health_service_any_activity_accessible):
  proc health_service_any_activity_accessible*(
      activity_mask: HealthActivityMask_603980402; time_start: time_t_603980313;
      time_end: time_t_603980313): HealthServiceAccessibilityMask_603980416 {.
      cdecl, importc: "health_service_any_activity_accessible".}
else:
  static :
    hint("Declaration of " & "health_service_any_activity_accessible" &
        " already exists, not redeclaring")
when not declared(health_service_events_subscribe):
  proc health_service_events_subscribe*(handler: HealthEventHandler_603980422;
                                        context: pointer): bool {.cdecl,
      importc: "health_service_events_subscribe".}
else:
  static :
    hint("Declaration of " & "health_service_events_subscribe" &
        " already exists, not redeclaring")
when not declared(health_service_events_unsubscribe):
  proc health_service_events_unsubscribe*(): bool {.cdecl,
      importc: "health_service_events_unsubscribe".}
else:
  static :
    hint("Declaration of " & "health_service_events_unsubscribe" &
        " already exists, not redeclaring")
when not declared(health_service_set_heart_rate_sample_period):
  proc health_service_set_heart_rate_sample_period*(interval_sec: uint16): bool {.
      cdecl, importc: "health_service_set_heart_rate_sample_period".}
else:
  static :
    hint("Declaration of " & "health_service_set_heart_rate_sample_period" &
        " already exists, not redeclaring")
when not declared(health_service_get_heart_rate_sample_period_expiration_sec):
  proc health_service_get_heart_rate_sample_period_expiration_sec*(): uint16 {.
      cdecl,
      importc: "health_service_get_heart_rate_sample_period_expiration_sec".}
else:
  static :
    hint("Declaration of " &
        "health_service_get_heart_rate_sample_period_expiration_sec" &
        " already exists, not redeclaring")
when not declared(health_service_register_metric_alert):
  proc health_service_register_metric_alert*(metric: HealthMetric_603980388;
      threshold: HealthValue_603980390): ptr HealthMetricAlert_603980392 {.
      cdecl, importc: "health_service_register_metric_alert".}
else:
  static :
    hint("Declaration of " & "health_service_register_metric_alert" &
        " already exists, not redeclaring")
when not declared(health_service_cancel_metric_alert):
  proc health_service_cancel_metric_alert*(alert: ptr HealthMetricAlert_603980392): bool {.
      cdecl, importc: "health_service_cancel_metric_alert".}
else:
  static :
    hint("Declaration of " & "health_service_cancel_metric_alert" &
        " already exists, not redeclaring")
when not declared(health_service_get_minute_history):
  proc health_service_get_minute_history*(minute_data: ptr HealthMinuteData_603980430;
      max_records: uint32; time_start: ptr time_t_603980313;
      time_end: ptr time_t_603980313): uint32 {.cdecl,
      importc: "health_service_get_minute_history".}
else:
  static :
    hint("Declaration of " & "health_service_get_minute_history" &
        " already exists, not redeclaring")
when not declared(health_service_get_measurement_system_for_display):
  proc health_service_get_measurement_system_for_display*(metric: HealthMetric_603980388): MeasurementSystem_603980434 {.
      cdecl, importc: "health_service_get_measurement_system_for_display".}
else:
  static :
    hint("Declaration of " & "health_service_get_measurement_system_for_display" &
        " already exists, not redeclaring")
when not declared(data_logging_create):
  proc data_logging_create*(tag: uint32; item_type: DataLoggingItemType_603980440;
                            item_length: uint16; resume: bool): DataLoggingSessionRef_603980436 {.
      cdecl, importc: "data_logging_create".}
else:
  static :
    hint("Declaration of " & "data_logging_create" &
        " already exists, not redeclaring")
when not declared(data_logging_finish):
  proc data_logging_finish*(logging_session: DataLoggingSessionRef_603980436): void {.
      cdecl, importc: "data_logging_finish".}
else:
  static :
    hint("Declaration of " & "data_logging_finish" &
        " already exists, not redeclaring")
when not declared(data_logging_log):
  proc data_logging_log*(logging_session: DataLoggingSessionRef_603980436;
                         data: pointer; num_items: uint32): DataLoggingResult_603980444 {.
      cdecl, importc: "data_logging_log".}
else:
  static :
    hint("Declaration of " & "data_logging_log" &
        " already exists, not redeclaring")
when not declared(uuid_equal):
  proc uuid_equal*(uu1: ptr Uuid_603980448; uu2: ptr Uuid_603980448): bool {.
      cdecl, importc: "uuid_equal".}
else:
  static :
    hint("Declaration of " & "uuid_equal" & " already exists, not redeclaring")
when not declared(uuid_to_string):
  proc uuid_to_string*(uuid: ptr Uuid_603980448; buffer: cstring): void {.cdecl,
      importc: "uuid_to_string".}
else:
  static :
    hint("Declaration of " & "uuid_to_string" &
        " already exists, not redeclaring")
when not declared(app_log):
  proc app_log*(log_level: uint8; src_filename: cstring; src_line_number: cint;
                fmt: cstring): void {.cdecl, varargs, importc: "app_log".}
else:
  static :
    hint("Declaration of " & "app_log" & " already exists, not redeclaring")
when not declared(dict_calc_buffer_size):
  proc dict_calc_buffer_size*(tuple_count: uint8): uint32 {.cdecl, varargs,
      importc: "dict_calc_buffer_size".}
else:
  static :
    hint("Declaration of " & "dict_calc_buffer_size" &
        " already exists, not redeclaring")
when not declared(dict_size):
  proc dict_size*(iter: ptr DictionaryIterator_603980470): uint32 {.cdecl,
      importc: "dict_size".}
else:
  static :
    hint("Declaration of " & "dict_size" & " already exists, not redeclaring")
when not declared(dict_write_begin):
  proc dict_write_begin*(iter: ptr DictionaryIterator_603980470;
                         buffer: ptr uint8; size: uint16): DictionaryResult_603980456 {.
      cdecl, importc: "dict_write_begin".}
else:
  static :
    hint("Declaration of " & "dict_write_begin" &
        " already exists, not redeclaring")
when not declared(dict_write_data):
  proc dict_write_data*(iter: ptr DictionaryIterator_603980470; key: uint32;
                        data: ptr uint8; size: uint16): DictionaryResult_603980456 {.
      cdecl, importc: "dict_write_data".}
else:
  static :
    hint("Declaration of " & "dict_write_data" &
        " already exists, not redeclaring")
when not declared(dict_write_cstring):
  proc dict_write_cstring*(iter: ptr DictionaryIterator_603980470; key: uint32;
                           cstring: cstring): DictionaryResult_603980456 {.
      cdecl, importc: "dict_write_cstring".}
else:
  static :
    hint("Declaration of " & "dict_write_cstring" &
        " already exists, not redeclaring")
when not declared(dict_write_int):
  proc dict_write_int*(iter: ptr DictionaryIterator_603980470; key: uint32;
                       integer: pointer; width_bytes: uint8; is_signed: bool): DictionaryResult_603980456 {.
      cdecl, importc: "dict_write_int".}
else:
  static :
    hint("Declaration of " & "dict_write_int" &
        " already exists, not redeclaring")
when not declared(dict_write_uint8):
  proc dict_write_uint8*(iter: ptr DictionaryIterator_603980470; key: uint32;
                         value: uint8): DictionaryResult_603980456 {.cdecl,
      importc: "dict_write_uint8".}
else:
  static :
    hint("Declaration of " & "dict_write_uint8" &
        " already exists, not redeclaring")
when not declared(dict_write_uint16):
  proc dict_write_uint16*(iter: ptr DictionaryIterator_603980470; key: uint32;
                          value: uint16): DictionaryResult_603980456 {.cdecl,
      importc: "dict_write_uint16".}
else:
  static :
    hint("Declaration of " & "dict_write_uint16" &
        " already exists, not redeclaring")
when not declared(dict_write_uint32):
  proc dict_write_uint32*(iter: ptr DictionaryIterator_603980470; key: uint32;
                          value: uint32): DictionaryResult_603980456 {.cdecl,
      importc: "dict_write_uint32".}
else:
  static :
    hint("Declaration of " & "dict_write_uint32" &
        " already exists, not redeclaring")
when not declared(dict_write_int8):
  proc dict_write_int8*(iter: ptr DictionaryIterator_603980470; key: uint32;
                        value: int8): DictionaryResult_603980456 {.cdecl,
      importc: "dict_write_int8".}
else:
  static :
    hint("Declaration of " & "dict_write_int8" &
        " already exists, not redeclaring")
when not declared(dict_write_int16):
  proc dict_write_int16*(iter: ptr DictionaryIterator_603980470; key: uint32;
                         value: int16): DictionaryResult_603980456 {.cdecl,
      importc: "dict_write_int16".}
else:
  static :
    hint("Declaration of " & "dict_write_int16" &
        " already exists, not redeclaring")
when not declared(dict_write_int32):
  proc dict_write_int32*(iter: ptr DictionaryIterator_603980470; key: uint32;
                         value: int32): DictionaryResult_603980456 {.cdecl,
      importc: "dict_write_int32".}
else:
  static :
    hint("Declaration of " & "dict_write_int32" &
        " already exists, not redeclaring")
when not declared(dict_write_end):
  proc dict_write_end*(iter: ptr DictionaryIterator_603980470): uint32 {.cdecl,
      importc: "dict_write_end".}
else:
  static :
    hint("Declaration of " & "dict_write_end" &
        " already exists, not redeclaring")
when not declared(dict_read_begin_from_buffer):
  proc dict_read_begin_from_buffer*(iter: ptr DictionaryIterator_603980470;
                                    buffer: ptr uint8; size: uint16): ptr Tuple_f_603980464 {.
      cdecl, importc: "dict_read_begin_from_buffer".}
else:
  static :
    hint("Declaration of " & "dict_read_begin_from_buffer" &
        " already exists, not redeclaring")
when not declared(dict_read_next):
  proc dict_read_next*(iter: ptr DictionaryIterator_603980470): ptr Tuple_f_603980464 {.
      cdecl, importc: "dict_read_next".}
else:
  static :
    hint("Declaration of " & "dict_read_next" &
        " already exists, not redeclaring")
when not declared(dict_read_first):
  proc dict_read_first*(iter: ptr DictionaryIterator_603980470): ptr Tuple_f_603980464 {.
      cdecl, importc: "dict_read_first".}
else:
  static :
    hint("Declaration of " & "dict_read_first" &
        " already exists, not redeclaring")
when not declared(dict_serialize_tuplets):
  proc dict_serialize_tuplets*(callback: DictionarySerializeCallback_603980476;
                               context: pointer; tuplets: ptr Tuplet_603980474;
                               tuplets_count: uint8): DictionaryResult_603980456 {.
      cdecl, importc: "dict_serialize_tuplets".}
else:
  static :
    hint("Declaration of " & "dict_serialize_tuplets" &
        " already exists, not redeclaring")
when not declared(dict_serialize_tuplets_to_buffer):
  proc dict_serialize_tuplets_to_buffer*(tuplets: ptr Tuplet_603980474;
      tuplets_count: uint8; buffer: ptr uint8; size_in_out: ptr uint32): DictionaryResult_603980456 {.
      cdecl, importc: "dict_serialize_tuplets_to_buffer".}
else:
  static :
    hint("Declaration of " & "dict_serialize_tuplets_to_buffer" &
        " already exists, not redeclaring")
when not declared(dict_serialize_tuplets_to_buffer_with_iter):
  proc dict_serialize_tuplets_to_buffer_with_iter*(iter: ptr DictionaryIterator_603980470;
      tuplets: ptr Tuplet_603980474; tuplets_count: uint8; buffer: ptr uint8;
      size_in_out: ptr uint32): DictionaryResult_603980456 {.cdecl,
      importc: "dict_serialize_tuplets_to_buffer_with_iter".}
else:
  static :
    hint("Declaration of " & "dict_serialize_tuplets_to_buffer_with_iter" &
        " already exists, not redeclaring")
when not declared(dict_write_tuplet):
  proc dict_write_tuplet*(iter: ptr DictionaryIterator_603980470;
                          tuplet: ptr Tuplet_603980474): DictionaryResult_603980456 {.
      cdecl, importc: "dict_write_tuplet".}
else:
  static :
    hint("Declaration of " & "dict_write_tuplet" &
        " already exists, not redeclaring")
when not declared(dict_calc_buffer_size_from_tuplets):
  proc dict_calc_buffer_size_from_tuplets*(tuplets: ptr Tuplet_603980474;
      tuplets_count: uint8): uint32 {.cdecl, importc: "dict_calc_buffer_size_from_tuplets".}
else:
  static :
    hint("Declaration of " & "dict_calc_buffer_size_from_tuplets" &
        " already exists, not redeclaring")
when not declared(dict_merge):
  proc dict_merge*(dest: ptr DictionaryIterator_603980470;
                   dest_max_size_in_out: ptr uint32;
                   source: ptr DictionaryIterator_603980470;
                   update_existing_keys_only: bool;
                   key_callback: DictionaryKeyUpdatedCallback_603980478;
                   context: pointer): DictionaryResult_603980456 {.cdecl,
      importc: "dict_merge".}
else:
  static :
    hint("Declaration of " & "dict_merge" & " already exists, not redeclaring")
when not declared(dict_find):
  proc dict_find*(iter: ptr DictionaryIterator_603980470; key: uint32): ptr Tuple_f_603980464 {.
      cdecl, importc: "dict_find".}
else:
  static :
    hint("Declaration of " & "dict_find" & " already exists, not redeclaring")
when not declared(dictation_session_create):
  proc dictation_session_create*(buffer_size: uint32;
                                 callback: DictationSessionStatusCallback_603980486;
                                 callback_context: pointer): ptr DictationSession_603980480 {.
      cdecl, importc: "dictation_session_create".}
else:
  static :
    hint("Declaration of " & "dictation_session_create" &
        " already exists, not redeclaring")
when not declared(dictation_session_destroy):
  proc dictation_session_destroy*(session: ptr DictationSession_603980480): void {.
      cdecl, importc: "dictation_session_destroy".}
else:
  static :
    hint("Declaration of " & "dictation_session_destroy" &
        " already exists, not redeclaring")
when not declared(dictation_session_start):
  proc dictation_session_start*(session: ptr DictationSession_603980480): DictationSessionStatus_603980484 {.
      cdecl, importc: "dictation_session_start".}
else:
  static :
    hint("Declaration of " & "dictation_session_start" &
        " already exists, not redeclaring")
when not declared(dictation_session_stop):
  proc dictation_session_stop*(session: ptr DictationSession_603980480): DictationSessionStatus_603980484 {.
      cdecl, importc: "dictation_session_stop".}
else:
  static :
    hint("Declaration of " & "dictation_session_stop" &
        " already exists, not redeclaring")
when not declared(dictation_session_enable_confirmation):
  proc dictation_session_enable_confirmation*(session: ptr DictationSession_603980480;
      is_enabled: bool): void {.cdecl, importc: "dictation_session_enable_confirmation".}
else:
  static :
    hint("Declaration of " & "dictation_session_enable_confirmation" &
        " already exists, not redeclaring")
when not declared(dictation_session_enable_error_dialogs):
  proc dictation_session_enable_error_dialogs*(session: ptr DictationSession_603980480;
      is_enabled: bool): void {.cdecl, importc: "dictation_session_enable_error_dialogs".}
else:
  static :
    hint("Declaration of " & "dictation_session_enable_error_dialogs" &
        " already exists, not redeclaring")
when not declared(app_message_open):
  proc app_message_open*(size_inbound: uint32; size_outbound: uint32): AppMessageResult_603980490 {.
      cdecl, importc: "app_message_open".}
else:
  static :
    hint("Declaration of " & "app_message_open" &
        " already exists, not redeclaring")
when not declared(app_message_deregister_callbacks):
  proc app_message_deregister_callbacks*(): void {.cdecl,
      importc: "app_message_deregister_callbacks".}
else:
  static :
    hint("Declaration of " & "app_message_deregister_callbacks" &
        " already exists, not redeclaring")
when not declared(app_message_get_context):
  proc app_message_get_context*(): pointer {.cdecl,
      importc: "app_message_get_context".}
else:
  static :
    hint("Declaration of " & "app_message_get_context" &
        " already exists, not redeclaring")
when not declared(app_message_set_context):
  proc app_message_set_context*(context: pointer): pointer {.cdecl,
      importc: "app_message_set_context".}
else:
  static :
    hint("Declaration of " & "app_message_set_context" &
        " already exists, not redeclaring")
when not declared(app_message_register_inbox_received):
  proc app_message_register_inbox_received*(
      received_callback: AppMessageInboxReceived_603980492): AppMessageInboxReceived_603980492 {.
      cdecl, importc: "app_message_register_inbox_received".}
else:
  static :
    hint("Declaration of " & "app_message_register_inbox_received" &
        " already exists, not redeclaring")
when not declared(app_message_register_inbox_dropped):
  proc app_message_register_inbox_dropped*(
      dropped_callback: AppMessageInboxDropped_603980494): AppMessageInboxDropped_603980494 {.
      cdecl, importc: "app_message_register_inbox_dropped".}
else:
  static :
    hint("Declaration of " & "app_message_register_inbox_dropped" &
        " already exists, not redeclaring")
when not declared(app_message_register_outbox_sent):
  proc app_message_register_outbox_sent*(sent_callback: AppMessageOutboxSent_603980496): AppMessageOutboxSent_603980496 {.
      cdecl, importc: "app_message_register_outbox_sent".}
else:
  static :
    hint("Declaration of " & "app_message_register_outbox_sent" &
        " already exists, not redeclaring")
when not declared(app_message_register_outbox_failed):
  proc app_message_register_outbox_failed*(
      failed_callback: AppMessageOutboxFailed_603980498): AppMessageOutboxFailed_603980498 {.
      cdecl, importc: "app_message_register_outbox_failed".}
else:
  static :
    hint("Declaration of " & "app_message_register_outbox_failed" &
        " already exists, not redeclaring")
when not declared(app_message_inbox_size_maximum):
  proc app_message_inbox_size_maximum*(): uint32 {.cdecl,
      importc: "app_message_inbox_size_maximum".}
else:
  static :
    hint("Declaration of " & "app_message_inbox_size_maximum" &
        " already exists, not redeclaring")
when not declared(app_message_outbox_size_maximum):
  proc app_message_outbox_size_maximum*(): uint32 {.cdecl,
      importc: "app_message_outbox_size_maximum".}
else:
  static :
    hint("Declaration of " & "app_message_outbox_size_maximum" &
        " already exists, not redeclaring")
when not declared(app_message_outbox_begin):
  proc app_message_outbox_begin*(iterator_f: ptr ptr DictionaryIterator_603980470): AppMessageResult_603980490 {.
      cdecl, importc: "app_message_outbox_begin".}
else:
  static :
    hint("Declaration of " & "app_message_outbox_begin" &
        " already exists, not redeclaring")
when not declared(app_message_outbox_send):
  proc app_message_outbox_send*(): AppMessageResult_603980490 {.cdecl,
      importc: "app_message_outbox_send".}
else:
  static :
    hint("Declaration of " & "app_message_outbox_send" &
        " already exists, not redeclaring")
when not declared(app_sync_init):
  proc app_sync_init*(s: ptr struct_AppSync_603980504; buffer: ptr uint8;
                      buffer_size: uint16; keys_and_initial_values: ptr Tuplet_603980474;
                      count: uint8;
                      tuple_changed_callback: AppSyncTupleChangedCallback_603980500;
                      error_callback: AppSyncErrorCallback_603980502;
                      context: pointer): void {.cdecl, importc: "app_sync_init".}
else:
  static :
    hint("Declaration of " & "app_sync_init" &
        " already exists, not redeclaring")
when not declared(app_sync_deinit):
  proc app_sync_deinit*(s: ptr struct_AppSync_603980504): void {.cdecl,
      importc: "app_sync_deinit".}
else:
  static :
    hint("Declaration of " & "app_sync_deinit" &
        " already exists, not redeclaring")
when not declared(app_sync_set):
  proc app_sync_set*(s: ptr struct_AppSync_603980504;
                     keys_and_values_to_update: ptr Tuplet_603980474;
                     count: uint8): AppMessageResult_603980490 {.cdecl,
      importc: "app_sync_set".}
else:
  static :
    hint("Declaration of " & "app_sync_set" & " already exists, not redeclaring")
when not declared(app_sync_get):
  proc app_sync_get*(s: ptr struct_AppSync_603980504; key: uint32): ptr Tuple_f_603980464 {.
      cdecl, importc: "app_sync_get".}
else:
  static :
    hint("Declaration of " & "app_sync_get" & " already exists, not redeclaring")
when not declared(resource_get_handle):
  proc resource_get_handle*(resource_id: uint32): ResHandle_603980508 {.cdecl,
      importc: "resource_get_handle".}
else:
  static :
    hint("Declaration of " & "resource_get_handle" &
        " already exists, not redeclaring")
when not declared(resource_size):
  proc resource_size*(h: ResHandle_603980508): csize_t {.cdecl,
      importc: "resource_size".}
else:
  static :
    hint("Declaration of " & "resource_size" &
        " already exists, not redeclaring")
when not declared(resource_load):
  proc resource_load*(h: ResHandle_603980508; buffer: ptr uint8;
                      max_length: csize_t): csize_t {.cdecl,
      importc: "resource_load".}
else:
  static :
    hint("Declaration of " & "resource_load" &
        " already exists, not redeclaring")
when not declared(resource_load_byte_range):
  proc resource_load_byte_range*(h: ResHandle_603980508; start_offset: uint32;
                                 buffer: ptr uint8; num_bytes: csize_t): csize_t {.
      cdecl, importc: "resource_load_byte_range".}
else:
  static :
    hint("Declaration of " & "resource_load_byte_range" &
        " already exists, not redeclaring")
when not declared(app_event_loop):
  proc app_event_loop*(): void {.cdecl, importc: "app_event_loop".}
else:
  static :
    hint("Declaration of " & "app_event_loop" &
        " already exists, not redeclaring")
when not declared(app_worker_is_running):
  proc app_worker_is_running*(): bool {.cdecl, importc: "app_worker_is_running".}
else:
  static :
    hint("Declaration of " & "app_worker_is_running" &
        " already exists, not redeclaring")
when not declared(app_worker_launch):
  proc app_worker_launch*(): AppWorkerResult_603980512 {.cdecl,
      importc: "app_worker_launch".}
else:
  static :
    hint("Declaration of " & "app_worker_launch" &
        " already exists, not redeclaring")
when not declared(app_worker_kill):
  proc app_worker_kill*(): AppWorkerResult_603980512 {.cdecl,
      importc: "app_worker_kill".}
else:
  static :
    hint("Declaration of " & "app_worker_kill" &
        " already exists, not redeclaring")
when not declared(app_worker_message_subscribe):
  proc app_worker_message_subscribe*(handler: AppWorkerMessageHandler_603980518): bool {.
      cdecl, importc: "app_worker_message_subscribe".}
else:
  static :
    hint("Declaration of " & "app_worker_message_subscribe" &
        " already exists, not redeclaring")
when not declared(app_worker_message_unsubscribe):
  proc app_worker_message_unsubscribe*(): bool {.cdecl,
      importc: "app_worker_message_unsubscribe".}
else:
  static :
    hint("Declaration of " & "app_worker_message_unsubscribe" &
        " already exists, not redeclaring")
when not declared(app_worker_send_message):
  proc app_worker_send_message*(type_f: uint8; data: ptr AppWorkerMessage_603980516): void {.
      cdecl, importc: "app_worker_send_message".}
else:
  static :
    hint("Declaration of " & "app_worker_send_message" &
        " already exists, not redeclaring")
when not declared(app_comm_set_sniff_interval):
  proc app_comm_set_sniff_interval*(interval: SniffInterval_603980522): void {.
      cdecl, importc: "app_comm_set_sniff_interval".}
else:
  static :
    hint("Declaration of " & "app_comm_set_sniff_interval" &
        " already exists, not redeclaring")
when not declared(app_comm_get_sniff_interval):
  proc app_comm_get_sniff_interval*(): SniffInterval_603980522 {.cdecl,
      importc: "app_comm_get_sniff_interval".}
else:
  static :
    hint("Declaration of " & "app_comm_get_sniff_interval" &
        " already exists, not redeclaring")
when not declared(psleep):
  proc psleep*(millis: cint): void {.cdecl, importc: "psleep".}
else:
  static :
    hint("Declaration of " & "psleep" & " already exists, not redeclaring")
when not declared(app_timer_register):
  proc app_timer_register*(timeout_ms: uint32; callback: AppTimerCallback_603980526;
                           callback_data: pointer): ptr AppTimer_603980524 {.
      cdecl, importc: "app_timer_register".}
else:
  static :
    hint("Declaration of " & "app_timer_register" &
        " already exists, not redeclaring")
when not declared(app_timer_reschedule):
  proc app_timer_reschedule*(timer_handle: ptr AppTimer_603980524;
                             new_timeout_ms: uint32): bool {.cdecl,
      importc: "app_timer_reschedule".}
else:
  static :
    hint("Declaration of " & "app_timer_reschedule" &
        " already exists, not redeclaring")
when not declared(app_timer_cancel):
  proc app_timer_cancel*(timer_handle: ptr AppTimer_603980524): void {.cdecl,
      importc: "app_timer_cancel".}
else:
  static :
    hint("Declaration of " & "app_timer_cancel" &
        " already exists, not redeclaring")
when not declared(heap_bytes_free):
  proc heap_bytes_free*(): csize_t {.cdecl, importc: "heap_bytes_free".}
else:
  static :
    hint("Declaration of " & "heap_bytes_free" &
        " already exists, not redeclaring")
when not declared(heap_bytes_used):
  proc heap_bytes_used*(): csize_t {.cdecl, importc: "heap_bytes_used".}
else:
  static :
    hint("Declaration of " & "heap_bytes_used" &
        " already exists, not redeclaring")
when not declared(memory_cache_flush):
  proc memory_cache_flush*(start: pointer; size: csize_t): void {.cdecl,
      importc: "memory_cache_flush".}
else:
  static :
    hint("Declaration of " & "memory_cache_flush" &
        " already exists, not redeclaring")
when not declared(persist_exists):
  proc persist_exists*(key: uint32): bool {.cdecl, importc: "persist_exists".}
else:
  static :
    hint("Declaration of " & "persist_exists" &
        " already exists, not redeclaring")
when not declared(persist_get_size):
  proc persist_get_size*(key: uint32): cint {.cdecl, importc: "persist_get_size".}
else:
  static :
    hint("Declaration of " & "persist_get_size" &
        " already exists, not redeclaring")
when not declared(persist_read_bool):
  proc persist_read_bool*(key: uint32): bool {.cdecl,
      importc: "persist_read_bool".}
else:
  static :
    hint("Declaration of " & "persist_read_bool" &
        " already exists, not redeclaring")
when not declared(persist_read_int):
  proc persist_read_int*(key: uint32): int32 {.cdecl,
      importc: "persist_read_int".}
else:
  static :
    hint("Declaration of " & "persist_read_int" &
        " already exists, not redeclaring")
when not declared(persist_read_data):
  proc persist_read_data*(key: uint32; buffer: pointer; buffer_size: csize_t): cint {.
      cdecl, importc: "persist_read_data".}
else:
  static :
    hint("Declaration of " & "persist_read_data" &
        " already exists, not redeclaring")
when not declared(persist_read_string):
  proc persist_read_string*(key: uint32; buffer: cstring; buffer_size: csize_t): cint {.
      cdecl, importc: "persist_read_string".}
else:
  static :
    hint("Declaration of " & "persist_read_string" &
        " already exists, not redeclaring")
when not declared(persist_write_bool):
  proc persist_write_bool*(key: uint32; value: bool): status_t_603980532 {.
      cdecl, importc: "persist_write_bool".}
else:
  static :
    hint("Declaration of " & "persist_write_bool" &
        " already exists, not redeclaring")
when not declared(persist_write_int):
  proc persist_write_int*(key: uint32; value: int32): status_t_603980532 {.
      cdecl, importc: "persist_write_int".}
else:
  static :
    hint("Declaration of " & "persist_write_int" &
        " already exists, not redeclaring")
when not declared(persist_write_data):
  proc persist_write_data*(key: uint32; data: pointer; size: csize_t): cint {.
      cdecl, importc: "persist_write_data".}
else:
  static :
    hint("Declaration of " & "persist_write_data" &
        " already exists, not redeclaring")
when not declared(persist_write_string):
  proc persist_write_string*(key: uint32; cstring: cstring): cint {.cdecl,
      importc: "persist_write_string".}
else:
  static :
    hint("Declaration of " & "persist_write_string" &
        " already exists, not redeclaring")
when not declared(persist_delete):
  proc persist_delete*(key: uint32): status_t_603980532 {.cdecl,
      importc: "persist_delete".}
else:
  static :
    hint("Declaration of " & "persist_delete" &
        " already exists, not redeclaring")
when not declared(wakeup_service_subscribe):
  proc wakeup_service_subscribe*(handler: WakeupHandler_603980536): void {.
      cdecl, importc: "wakeup_service_subscribe".}
else:
  static :
    hint("Declaration of " & "wakeup_service_subscribe" &
        " already exists, not redeclaring")
when not declared(wakeup_schedule):
  proc wakeup_schedule*(timestamp: time_t_603980313; cookie: int32;
                        notify_if_missed: bool): WakeupId_603980534 {.cdecl,
      importc: "wakeup_schedule".}
else:
  static :
    hint("Declaration of " & "wakeup_schedule" &
        " already exists, not redeclaring")
when not declared(wakeup_cancel):
  proc wakeup_cancel*(wakeup_id: WakeupId_603980534): void {.cdecl,
      importc: "wakeup_cancel".}
else:
  static :
    hint("Declaration of " & "wakeup_cancel" &
        " already exists, not redeclaring")
when not declared(wakeup_cancel_all):
  proc wakeup_cancel_all*(): void {.cdecl, importc: "wakeup_cancel_all".}
else:
  static :
    hint("Declaration of " & "wakeup_cancel_all" &
        " already exists, not redeclaring")
when not declared(wakeup_get_launch_event):
  proc wakeup_get_launch_event*(wakeup_id: ptr WakeupId_603980534;
                                cookie: ptr int32): bool {.cdecl,
      importc: "wakeup_get_launch_event".}
else:
  static :
    hint("Declaration of " & "wakeup_get_launch_event" &
        " already exists, not redeclaring")
when not declared(wakeup_query):
  proc wakeup_query*(wakeup_id: WakeupId_603980534; timestamp: ptr time_t_603980313): bool {.
      cdecl, importc: "wakeup_query".}
else:
  static :
    hint("Declaration of " & "wakeup_query" & " already exists, not redeclaring")
when not declared(launch_reason):
  proc launch_reason*(): AppLaunchReason_603980540 {.cdecl,
      importc: "launch_reason".}
else:
  static :
    hint("Declaration of " & "launch_reason" &
        " already exists, not redeclaring")
when not declared(launch_get_args):
  proc launch_get_args*(): uint32 {.cdecl, importc: "launch_get_args".}
else:
  static :
    hint("Declaration of " & "launch_get_args" &
        " already exists, not redeclaring")
when not declared(exit_reason_set):
  proc exit_reason_set*(exit_reason: AppExitReason_603980544): void {.cdecl,
      importc: "exit_reason_set".}
else:
  static :
    hint("Declaration of " & "exit_reason_set" &
        " already exists, not redeclaring")
when not declared(app_glance_add_slice):
  proc app_glance_add_slice*(session: ptr AppGlanceReloadSession_603980556;
                             slice: AppGlanceSlice_603980550): AppGlanceResult_603980554 {.
      cdecl, importc: "app_glance_add_slice".}
else:
  static :
    hint("Declaration of " & "app_glance_add_slice" &
        " already exists, not redeclaring")
when not declared(app_glance_reload):
  proc app_glance_reload*(callback: AppGlanceReloadCallback_603980558;
                          context: pointer): void {.cdecl,
      importc: "app_glance_reload".}
else:
  static :
    hint("Declaration of " & "app_glance_reload" &
        " already exists, not redeclaring")
when not declared(gcolor_equal):
  proc gcolor_equal*(x: GColor8_603980562; y: GColor8_603980562): bool {.cdecl,
      importc: "gcolor_equal".}
else:
  static :
    hint("Declaration of " & "gcolor_equal" & " already exists, not redeclaring")
when not declared(gcolor_legible_over):
  proc gcolor_legible_over*(background_color: GColor8_603980562): GColor8_603980562 {.
      cdecl, importc: "gcolor_legible_over".}
else:
  static :
    hint("Declaration of " & "gcolor_legible_over" &
        " already exists, not redeclaring")
when not declared(gpoint_equal):
  proc gpoint_equal*(point_a: ptr GPoint_603980568; point_b: ptr GPoint_603980568): bool {.
      cdecl, importc: "gpoint_equal".}
else:
  static :
    hint("Declaration of " & "gpoint_equal" & " already exists, not redeclaring")
when not declared(gsize_equal):
  proc gsize_equal*(size_a: ptr GSize_603980572; size_b: ptr GSize_603980572): bool {.
      cdecl, importc: "gsize_equal".}
else:
  static :
    hint("Declaration of " & "gsize_equal" & " already exists, not redeclaring")
when not declared(grect_equal):
  proc grect_equal*(rect_a: ptr GRect_603980576; rect_b: ptr GRect_603980576): bool {.
      cdecl, importc: "grect_equal".}
else:
  static :
    hint("Declaration of " & "grect_equal" & " already exists, not redeclaring")
when not declared(grect_is_empty):
  proc grect_is_empty*(rect: ptr GRect_603980576): bool {.cdecl,
      importc: "grect_is_empty".}
else:
  static :
    hint("Declaration of " & "grect_is_empty" &
        " already exists, not redeclaring")
when not declared(grect_standardize):
  proc grect_standardize*(rect: ptr GRect_603980576): void {.cdecl,
      importc: "grect_standardize".}
else:
  static :
    hint("Declaration of " & "grect_standardize" &
        " already exists, not redeclaring")
when not declared(grect_clip):
  proc grect_clip*(rect_to_clip: ptr GRect_603980576; rect_clipper: ptr GRect_603980576): void {.
      cdecl, importc: "grect_clip".}
else:
  static :
    hint("Declaration of " & "grect_clip" & " already exists, not redeclaring")
when not declared(grect_contains_point):
  proc grect_contains_point*(rect: ptr GRect_603980576; point: ptr GPoint_603980568): bool {.
      cdecl, importc: "grect_contains_point".}
else:
  static :
    hint("Declaration of " & "grect_contains_point" &
        " already exists, not redeclaring")
when not declared(grect_center_point):
  proc grect_center_point*(rect: ptr GRect_603980576): GPoint_603980568 {.cdecl,
      importc: "grect_center_point".}
else:
  static :
    hint("Declaration of " & "grect_center_point" &
        " already exists, not redeclaring")
when not declared(grect_crop):
  proc grect_crop*(rect: GRect_603980576; crop_size_px: int32): GRect_603980576 {.
      cdecl, importc: "grect_crop".}
else:
  static :
    hint("Declaration of " & "grect_crop" & " already exists, not redeclaring")
when not declared(gbitmap_get_bytes_per_row):
  proc gbitmap_get_bytes_per_row*(bitmap: ptr GBitmap_603980582): uint16 {.
      cdecl, importc: "gbitmap_get_bytes_per_row".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_bytes_per_row" &
        " already exists, not redeclaring")
when not declared(gbitmap_get_format):
  proc gbitmap_get_format*(bitmap: ptr GBitmap_603980582): GBitmapFormat_603980580 {.
      cdecl, importc: "gbitmap_get_format".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_format" &
        " already exists, not redeclaring")
when not declared(gbitmap_get_data):
  proc gbitmap_get_data*(bitmap: ptr GBitmap_603980582): ptr uint8 {.cdecl,
      importc: "gbitmap_get_data".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_data" &
        " already exists, not redeclaring")
when not declared(gbitmap_set_data):
  proc gbitmap_set_data*(bitmap: ptr GBitmap_603980582; data: ptr uint8;
                         format: GBitmapFormat_603980580;
                         row_size_bytes: uint16; free_on_destroy: bool): void {.
      cdecl, importc: "gbitmap_set_data".}
else:
  static :
    hint("Declaration of " & "gbitmap_set_data" &
        " already exists, not redeclaring")
when not declared(gbitmap_get_bounds):
  proc gbitmap_get_bounds*(bitmap: ptr GBitmap_603980582): GRect_603980576 {.
      cdecl, importc: "gbitmap_get_bounds".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_bounds" &
        " already exists, not redeclaring")
when not declared(gbitmap_set_bounds):
  proc gbitmap_set_bounds*(bitmap: ptr GBitmap_603980582; bounds: GRect_603980576): void {.
      cdecl, importc: "gbitmap_set_bounds".}
else:
  static :
    hint("Declaration of " & "gbitmap_set_bounds" &
        " already exists, not redeclaring")
when not declared(gbitmap_get_palette):
  proc gbitmap_get_palette*(bitmap: ptr GBitmap_603980582): ptr GColor_603980564 {.
      cdecl, importc: "gbitmap_get_palette".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_palette" &
        " already exists, not redeclaring")
when not declared(gbitmap_set_palette):
  proc gbitmap_set_palette*(bitmap: ptr GBitmap_603980582; palette: ptr GColor_603980564;
                            free_on_destroy: bool): void {.cdecl,
      importc: "gbitmap_set_palette".}
else:
  static :
    hint("Declaration of " & "gbitmap_set_palette" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_with_resource):
  proc gbitmap_create_with_resource*(resource_id: uint32): ptr GBitmap_603980582 {.
      cdecl, importc: "gbitmap_create_with_resource".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_with_resource" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_with_data):
  proc gbitmap_create_with_data*(data: ptr uint8): ptr GBitmap_603980582 {.
      cdecl, importc: "gbitmap_create_with_data".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_with_data" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_as_sub_bitmap):
  proc gbitmap_create_as_sub_bitmap*(base_bitmap: ptr GBitmap_603980582;
                                     sub_rect: GRect_603980576): ptr GBitmap_603980582 {.
      cdecl, importc: "gbitmap_create_as_sub_bitmap".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_as_sub_bitmap" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_from_png_data):
  proc gbitmap_create_from_png_data*(png_data: ptr uint8; png_data_size: csize_t): ptr GBitmap_603980582 {.
      cdecl, importc: "gbitmap_create_from_png_data".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_from_png_data" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_blank):
  proc gbitmap_create_blank*(size: GSize_603980572; format: GBitmapFormat_603980580): ptr GBitmap_603980582 {.
      cdecl, importc: "gbitmap_create_blank".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_blank" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_blank_with_palette):
  proc gbitmap_create_blank_with_palette*(size: GSize_603980572;
      format: GBitmapFormat_603980580; palette: ptr GColor_603980564;
      free_on_destroy: bool): ptr GBitmap_603980582 {.cdecl,
      importc: "gbitmap_create_blank_with_palette".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_blank_with_palette" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_palettized_from_1bit):
  proc gbitmap_create_palettized_from_1bit*(src_bitmap: ptr GBitmap_603980582): ptr GBitmap_603980582 {.
      cdecl, importc: "gbitmap_create_palettized_from_1bit".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_palettized_from_1bit" &
        " already exists, not redeclaring")
when not declared(gbitmap_destroy):
  proc gbitmap_destroy*(bitmap: ptr GBitmap_603980582): void {.cdecl,
      importc: "gbitmap_destroy".}
else:
  static :
    hint("Declaration of " & "gbitmap_destroy" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_create_with_resource):
  proc gbitmap_sequence_create_with_resource*(resource_id: uint32): ptr GBitmapSequence_603980584 {.
      cdecl, importc: "gbitmap_sequence_create_with_resource".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_create_with_resource" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_update_bitmap_next_frame):
  proc gbitmap_sequence_update_bitmap_next_frame*(
      bitmap_sequence: ptr GBitmapSequence_603980584; bitmap: ptr GBitmap_603980582;
      delay_ms: ptr uint32): bool {.cdecl, importc: "gbitmap_sequence_update_bitmap_next_frame".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_update_bitmap_next_frame" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_update_bitmap_by_elapsed):
  proc gbitmap_sequence_update_bitmap_by_elapsed*(
      bitmap_sequence: ptr GBitmapSequence_603980584; bitmap: ptr GBitmap_603980582;
      elapsed_ms: uint32): bool {.cdecl, importc: "gbitmap_sequence_update_bitmap_by_elapsed".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_update_bitmap_by_elapsed" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_destroy):
  proc gbitmap_sequence_destroy*(bitmap_sequence: ptr GBitmapSequence_603980584): void {.
      cdecl, importc: "gbitmap_sequence_destroy".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_destroy" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_restart):
  proc gbitmap_sequence_restart*(bitmap_sequence: ptr GBitmapSequence_603980584): bool {.
      cdecl, importc: "gbitmap_sequence_restart".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_restart" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_get_current_frame_idx):
  proc gbitmap_sequence_get_current_frame_idx*(
      bitmap_sequence: ptr GBitmapSequence_603980584): int32 {.cdecl,
      importc: "gbitmap_sequence_get_current_frame_idx".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_get_current_frame_idx" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_get_total_num_frames):
  proc gbitmap_sequence_get_total_num_frames*(
      bitmap_sequence: ptr GBitmapSequence_603980584): uint32 {.cdecl,
      importc: "gbitmap_sequence_get_total_num_frames".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_get_total_num_frames" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_get_play_count):
  proc gbitmap_sequence_get_play_count*(bitmap_sequence: ptr GBitmapSequence_603980584): uint32 {.
      cdecl, importc: "gbitmap_sequence_get_play_count".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_get_play_count" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_set_play_count):
  proc gbitmap_sequence_set_play_count*(bitmap_sequence: ptr GBitmapSequence_603980584;
                                        play_count: uint32): void {.cdecl,
      importc: "gbitmap_sequence_set_play_count".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_set_play_count" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_get_bitmap_size):
  proc gbitmap_sequence_get_bitmap_size*(bitmap_sequence: ptr GBitmapSequence_603980584): GSize_603980572 {.
      cdecl, importc: "gbitmap_sequence_get_bitmap_size".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_get_bitmap_size" &
        " already exists, not redeclaring")
when not declared(gbitmap_get_data_row_info):
  proc gbitmap_get_data_row_info*(bitmap: ptr GBitmap_603980582; y: uint16): GBitmapDataRowInfo_603980588 {.
      cdecl, importc: "gbitmap_get_data_row_info".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_data_row_info" &
        " already exists, not redeclaring")
when not declared(grect_align):
  proc grect_align*(rect: ptr GRect_603980576; inside_rect: ptr GRect_603980576;
                    alignment: GAlign_603980592; clip: bool): void {.cdecl,
      importc: "grect_align".}
else:
  static :
    hint("Declaration of " & "grect_align" & " already exists, not redeclaring")
when not declared(grect_inset):
  proc grect_inset*(rect: GRect_603980576; insets: GEdgeInsets_603980602): GRect_603980576 {.
      cdecl, importc: "grect_inset".}
else:
  static :
    hint("Declaration of " & "grect_inset" & " already exists, not redeclaring")
when not declared(graphics_context_set_stroke_color):
  proc graphics_context_set_stroke_color*(ctx: ptr GContext_603980598;
      color: GColor_603980564): void {.cdecl, importc: "graphics_context_set_stroke_color".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_stroke_color" &
        " already exists, not redeclaring")
when not declared(graphics_context_set_fill_color):
  proc graphics_context_set_fill_color*(ctx: ptr GContext_603980598;
                                        color: GColor_603980564): void {.cdecl,
      importc: "graphics_context_set_fill_color".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_fill_color" &
        " already exists, not redeclaring")
when not declared(graphics_context_set_text_color):
  proc graphics_context_set_text_color*(ctx: ptr GContext_603980598;
                                        color: GColor_603980564): void {.cdecl,
      importc: "graphics_context_set_text_color".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_text_color" &
        " already exists, not redeclaring")
when not declared(graphics_context_set_compositing_mode):
  proc graphics_context_set_compositing_mode*(ctx: ptr GContext_603980598;
      mode: GCompOp_603980596): void {.cdecl, importc: "graphics_context_set_compositing_mode".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_compositing_mode" &
        " already exists, not redeclaring")
when not declared(graphics_context_set_antialiased):
  proc graphics_context_set_antialiased*(ctx: ptr GContext_603980598;
      enable: bool): void {.cdecl, importc: "graphics_context_set_antialiased".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_antialiased" &
        " already exists, not redeclaring")
when not declared(graphics_context_set_stroke_width):
  proc graphics_context_set_stroke_width*(ctx: ptr GContext_603980598;
      stroke_width: uint8): void {.cdecl,
                                   importc: "graphics_context_set_stroke_width".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_stroke_width" &
        " already exists, not redeclaring")
when not declared(graphics_draw_pixel):
  proc graphics_draw_pixel*(ctx: ptr GContext_603980598; point: GPoint_603980568): void {.
      cdecl, importc: "graphics_draw_pixel".}
else:
  static :
    hint("Declaration of " & "graphics_draw_pixel" &
        " already exists, not redeclaring")
when not declared(graphics_draw_line):
  proc graphics_draw_line*(ctx: ptr GContext_603980598; p0: GPoint_603980568;
                           p1: GPoint_603980568): void {.cdecl,
      importc: "graphics_draw_line".}
else:
  static :
    hint("Declaration of " & "graphics_draw_line" &
        " already exists, not redeclaring")
when not declared(graphics_draw_rect):
  proc graphics_draw_rect*(ctx: ptr GContext_603980598; rect: GRect_603980576): void {.
      cdecl, importc: "graphics_draw_rect".}
else:
  static :
    hint("Declaration of " & "graphics_draw_rect" &
        " already exists, not redeclaring")
when not declared(graphics_fill_rect):
  proc graphics_fill_rect*(ctx: ptr GContext_603980598; rect: GRect_603980576;
                           corner_radius: uint16; corner_mask: GCornerMask_603980606): void {.
      cdecl, importc: "graphics_fill_rect".}
else:
  static :
    hint("Declaration of " & "graphics_fill_rect" &
        " already exists, not redeclaring")
when not declared(graphics_draw_circle):
  proc graphics_draw_circle*(ctx: ptr GContext_603980598; p: GPoint_603980568;
                             radius: uint16): void {.cdecl,
      importc: "graphics_draw_circle".}
else:
  static :
    hint("Declaration of " & "graphics_draw_circle" &
        " already exists, not redeclaring")
when not declared(graphics_fill_circle):
  proc graphics_fill_circle*(ctx: ptr GContext_603980598; p: GPoint_603980568;
                             radius: uint16): void {.cdecl,
      importc: "graphics_fill_circle".}
else:
  static :
    hint("Declaration of " & "graphics_fill_circle" &
        " already exists, not redeclaring")
when not declared(graphics_draw_round_rect):
  proc graphics_draw_round_rect*(ctx: ptr GContext_603980598; rect: GRect_603980576;
                                 radius: uint16): void {.cdecl,
      importc: "graphics_draw_round_rect".}
else:
  static :
    hint("Declaration of " & "graphics_draw_round_rect" &
        " already exists, not redeclaring")
when not declared(graphics_draw_bitmap_in_rect):
  proc graphics_draw_bitmap_in_rect*(ctx: ptr GContext_603980598;
                                     bitmap: ptr GBitmap_603980582; rect: GRect_603980576): void {.
      cdecl, importc: "graphics_draw_bitmap_in_rect".}
else:
  static :
    hint("Declaration of " & "graphics_draw_bitmap_in_rect" &
        " already exists, not redeclaring")
when not declared(graphics_capture_frame_buffer):
  proc graphics_capture_frame_buffer*(ctx: ptr GContext_603980598): ptr GBitmap_603980582 {.
      cdecl, importc: "graphics_capture_frame_buffer".}
else:
  static :
    hint("Declaration of " & "graphics_capture_frame_buffer" &
        " already exists, not redeclaring")
when not declared(graphics_capture_frame_buffer_format):
  proc graphics_capture_frame_buffer_format*(ctx: ptr GContext_603980598;
      format: GBitmapFormat_603980580): ptr GBitmap_603980582 {.cdecl,
      importc: "graphics_capture_frame_buffer_format".}
else:
  static :
    hint("Declaration of " & "graphics_capture_frame_buffer_format" &
        " already exists, not redeclaring")
when not declared(graphics_release_frame_buffer):
  proc graphics_release_frame_buffer*(ctx: ptr GContext_603980598;
                                      buffer: ptr GBitmap_603980582): bool {.
      cdecl, importc: "graphics_release_frame_buffer".}
else:
  static :
    hint("Declaration of " & "graphics_release_frame_buffer" &
        " already exists, not redeclaring")
when not declared(graphics_frame_buffer_is_captured):
  proc graphics_frame_buffer_is_captured*(ctx: ptr GContext_603980598): bool {.
      cdecl, importc: "graphics_frame_buffer_is_captured".}
else:
  static :
    hint("Declaration of " & "graphics_frame_buffer_is_captured" &
        " already exists, not redeclaring")
when not declared(graphics_draw_rotated_bitmap):
  proc graphics_draw_rotated_bitmap*(ctx: ptr GContext_603980598;
                                     src: ptr GBitmap_603980582; src_ic: GPoint_603980568;
                                     rotation: cint; dest_ic: GPoint_603980568): void {.
      cdecl, importc: "graphics_draw_rotated_bitmap".}
else:
  static :
    hint("Declaration of " & "graphics_draw_rotated_bitmap" &
        " already exists, not redeclaring")
when not declared(graphics_draw_arc):
  proc graphics_draw_arc*(ctx: ptr GContext_603980598; rect: GRect_603980576;
                          scale_mode: GOvalScaleMode_603980610;
                          angle_start: int32; angle_end: int32): void {.cdecl,
      importc: "graphics_draw_arc".}
else:
  static :
    hint("Declaration of " & "graphics_draw_arc" &
        " already exists, not redeclaring")
when not declared(graphics_fill_radial):
  proc graphics_fill_radial*(ctx: ptr GContext_603980598; rect: GRect_603980576;
                             scale_mode: GOvalScaleMode_603980610;
                             inset_thickness: uint16; angle_start: int32;
                             angle_end: int32): void {.cdecl,
      importc: "graphics_fill_radial".}
else:
  static :
    hint("Declaration of " & "graphics_fill_radial" &
        " already exists, not redeclaring")
when not declared(gpoint_from_polar):
  proc gpoint_from_polar*(rect: GRect_603980576; scale_mode: GOvalScaleMode_603980610;
                          angle: int32): GPoint_603980568 {.cdecl,
      importc: "gpoint_from_polar".}
else:
  static :
    hint("Declaration of " & "gpoint_from_polar" &
        " already exists, not redeclaring")
when not declared(grect_centered_from_polar):
  proc grect_centered_from_polar*(rect: GRect_603980576;
                                  scale_mode: GOvalScaleMode_603980610;
                                  angle: int32; size: GSize_603980572): GRect_603980576 {.
      cdecl, importc: "grect_centered_from_polar".}
else:
  static :
    hint("Declaration of " & "grect_centered_from_polar" &
        " already exists, not redeclaring")
when not declared(gdraw_command_draw):
  proc gdraw_command_draw*(ctx: ptr GContext_603980598;
                           command: ptr GDrawCommand_603980612): void {.cdecl,
      importc: "gdraw_command_draw".}
else:
  static :
    hint("Declaration of " & "gdraw_command_draw" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_type):
  proc gdraw_command_get_type*(command: ptr GDrawCommand_603980612): GDrawCommandType_603980626 {.
      cdecl, importc: "gdraw_command_get_type".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_type" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_fill_color):
  proc gdraw_command_set_fill_color*(command: ptr GDrawCommand_603980612;
                                     fill_color: GColor_603980564): void {.
      cdecl, importc: "gdraw_command_set_fill_color".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_fill_color" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_fill_color):
  proc gdraw_command_get_fill_color*(command: ptr GDrawCommand_603980612): GColor_603980564 {.
      cdecl, importc: "gdraw_command_get_fill_color".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_fill_color" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_stroke_color):
  proc gdraw_command_set_stroke_color*(command: ptr GDrawCommand_603980612;
                                       stroke_color: GColor_603980564): void {.
      cdecl, importc: "gdraw_command_set_stroke_color".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_stroke_color" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_stroke_color):
  proc gdraw_command_get_stroke_color*(command: ptr GDrawCommand_603980612): GColor_603980564 {.
      cdecl, importc: "gdraw_command_get_stroke_color".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_stroke_color" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_stroke_width):
  proc gdraw_command_set_stroke_width*(command: ptr GDrawCommand_603980612;
                                       stroke_width: uint8): void {.cdecl,
      importc: "gdraw_command_set_stroke_width".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_stroke_width" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_stroke_width):
  proc gdraw_command_get_stroke_width*(command: ptr GDrawCommand_603980612): uint8 {.
      cdecl, importc: "gdraw_command_get_stroke_width".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_stroke_width" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_num_points):
  proc gdraw_command_get_num_points*(command: ptr GDrawCommand_603980612): uint16 {.
      cdecl, importc: "gdraw_command_get_num_points".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_num_points" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_point):
  proc gdraw_command_set_point*(command: ptr GDrawCommand_603980612;
                                point_idx: uint16; point: GPoint_603980568): void {.
      cdecl, importc: "gdraw_command_set_point".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_point" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_point):
  proc gdraw_command_get_point*(command: ptr GDrawCommand_603980612;
                                point_idx: uint16): GPoint_603980568 {.cdecl,
      importc: "gdraw_command_get_point".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_point" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_radius):
  proc gdraw_command_set_radius*(command: ptr GDrawCommand_603980612;
                                 radius: uint16): void {.cdecl,
      importc: "gdraw_command_set_radius".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_radius" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_radius):
  proc gdraw_command_get_radius*(command: ptr GDrawCommand_603980612): uint16 {.
      cdecl, importc: "gdraw_command_get_radius".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_radius" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_path_open):
  proc gdraw_command_set_path_open*(command: ptr GDrawCommand_603980612;
                                    path_open: bool): void {.cdecl,
      importc: "gdraw_command_set_path_open".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_path_open" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_path_open):
  proc gdraw_command_get_path_open*(command: ptr GDrawCommand_603980612): bool {.
      cdecl, importc: "gdraw_command_get_path_open".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_path_open" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_hidden):
  proc gdraw_command_set_hidden*(command: ptr GDrawCommand_603980612;
                                 hidden: bool): void {.cdecl,
      importc: "gdraw_command_set_hidden".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_hidden" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_hidden):
  proc gdraw_command_get_hidden*(command: ptr GDrawCommand_603980612): bool {.
      cdecl, importc: "gdraw_command_get_hidden".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_hidden" &
        " already exists, not redeclaring")
when not declared(gdraw_command_frame_draw):
  proc gdraw_command_frame_draw*(ctx: ptr GContext_603980598;
                                 sequence: ptr GDrawCommandSequence_603980622;
                                 frame: ptr GDrawCommandFrame_603980614;
                                 offset: GPoint_603980568): void {.cdecl,
      importc: "gdraw_command_frame_draw".}
else:
  static :
    hint("Declaration of " & "gdraw_command_frame_draw" &
        " already exists, not redeclaring")
when not declared(gdraw_command_frame_set_duration):
  proc gdraw_command_frame_set_duration*(frame: ptr GDrawCommandFrame_603980614;
      duration: uint32): void {.cdecl,
                                importc: "gdraw_command_frame_set_duration".}
else:
  static :
    hint("Declaration of " & "gdraw_command_frame_set_duration" &
        " already exists, not redeclaring")
when not declared(gdraw_command_frame_get_duration):
  proc gdraw_command_frame_get_duration*(frame: ptr GDrawCommandFrame_603980614): uint32 {.
      cdecl, importc: "gdraw_command_frame_get_duration".}
else:
  static :
    hint("Declaration of " & "gdraw_command_frame_get_duration" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_create_with_resource):
  proc gdraw_command_image_create_with_resource*(resource_id: uint32): ptr GDrawCommandImage_603980616 {.
      cdecl, importc: "gdraw_command_image_create_with_resource".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_create_with_resource" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_clone):
  proc gdraw_command_image_clone*(image: ptr GDrawCommandImage_603980616): ptr GDrawCommandImage_603980616 {.
      cdecl, importc: "gdraw_command_image_clone".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_clone" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_destroy):
  proc gdraw_command_image_destroy*(image: ptr GDrawCommandImage_603980616): void {.
      cdecl, importc: "gdraw_command_image_destroy".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_destroy" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_draw):
  proc gdraw_command_image_draw*(ctx: ptr GContext_603980598;
                                 image: ptr GDrawCommandImage_603980616;
                                 offset: GPoint_603980568): void {.cdecl,
      importc: "gdraw_command_image_draw".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_draw" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_get_bounds_size):
  proc gdraw_command_image_get_bounds_size*(image: ptr GDrawCommandImage_603980616): GSize_603980572 {.
      cdecl, importc: "gdraw_command_image_get_bounds_size".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_get_bounds_size" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_set_bounds_size):
  proc gdraw_command_image_set_bounds_size*(image: ptr GDrawCommandImage_603980616;
      size: GSize_603980572): void {.cdecl, importc: "gdraw_command_image_set_bounds_size".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_set_bounds_size" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_get_command_list):
  proc gdraw_command_image_get_command_list*(image: ptr GDrawCommandImage_603980616): ptr GDrawCommandList_603980618 {.
      cdecl, importc: "gdraw_command_image_get_command_list".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_get_command_list" &
        " already exists, not redeclaring")
when not declared(gdraw_command_list_iterate):
  proc gdraw_command_list_iterate*(command_list: ptr GDrawCommandList_603980618;
                                   handle_command: GDrawCommandListIteratorCb_603980620;
                                   callback_context: pointer): void {.cdecl,
      importc: "gdraw_command_list_iterate".}
else:
  static :
    hint("Declaration of " & "gdraw_command_list_iterate" &
        " already exists, not redeclaring")
when not declared(gdraw_command_list_draw):
  proc gdraw_command_list_draw*(ctx: ptr GContext_603980598;
                                command_list: ptr GDrawCommandList_603980618): void {.
      cdecl, importc: "gdraw_command_list_draw".}
else:
  static :
    hint("Declaration of " & "gdraw_command_list_draw" &
        " already exists, not redeclaring")
when not declared(gdraw_command_list_get_command):
  proc gdraw_command_list_get_command*(command_list: ptr GDrawCommandList_603980618;
                                       command_idx: uint16): ptr GDrawCommand_603980612 {.
      cdecl, importc: "gdraw_command_list_get_command".}
else:
  static :
    hint("Declaration of " & "gdraw_command_list_get_command" &
        " already exists, not redeclaring")
when not declared(gdraw_command_list_get_num_commands):
  proc gdraw_command_list_get_num_commands*(command_list: ptr GDrawCommandList_603980618): uint32 {.
      cdecl, importc: "gdraw_command_list_get_num_commands".}
else:
  static :
    hint("Declaration of " & "gdraw_command_list_get_num_commands" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_create_with_resource):
  proc gdraw_command_sequence_create_with_resource*(resource_id: uint32): ptr GDrawCommandSequence_603980622 {.
      cdecl, importc: "gdraw_command_sequence_create_with_resource".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_create_with_resource" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_clone):
  proc gdraw_command_sequence_clone*(sequence: ptr GDrawCommandSequence_603980622): ptr GDrawCommandSequence_603980622 {.
      cdecl, importc: "gdraw_command_sequence_clone".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_clone" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_destroy):
  proc gdraw_command_sequence_destroy*(sequence: ptr GDrawCommandSequence_603980622): void {.
      cdecl, importc: "gdraw_command_sequence_destroy".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_destroy" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_frame_by_elapsed):
  proc gdraw_command_sequence_get_frame_by_elapsed*(
      sequence: ptr GDrawCommandSequence_603980622; elapsed_ms: uint32): ptr GDrawCommandFrame_603980614 {.
      cdecl, importc: "gdraw_command_sequence_get_frame_by_elapsed".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_frame_by_elapsed" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_frame_by_index):
  proc gdraw_command_sequence_get_frame_by_index*(
      sequence: ptr GDrawCommandSequence_603980622; index: uint32): ptr GDrawCommandFrame_603980614 {.
      cdecl, importc: "gdraw_command_sequence_get_frame_by_index".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_frame_by_index" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_bounds_size):
  proc gdraw_command_sequence_get_bounds_size*(
      sequence: ptr GDrawCommandSequence_603980622): GSize_603980572 {.cdecl,
      importc: "gdraw_command_sequence_get_bounds_size".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_bounds_size" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_set_bounds_size):
  proc gdraw_command_sequence_set_bounds_size*(
      sequence: ptr GDrawCommandSequence_603980622; size: GSize_603980572): void {.
      cdecl, importc: "gdraw_command_sequence_set_bounds_size".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_set_bounds_size" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_play_count):
  proc gdraw_command_sequence_get_play_count*(sequence: ptr GDrawCommandSequence_603980622): uint32 {.
      cdecl, importc: "gdraw_command_sequence_get_play_count".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_play_count" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_set_play_count):
  proc gdraw_command_sequence_set_play_count*(
      sequence: ptr GDrawCommandSequence_603980622; play_count: uint32): void {.
      cdecl, importc: "gdraw_command_sequence_set_play_count".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_set_play_count" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_total_duration):
  proc gdraw_command_sequence_get_total_duration*(
      sequence: ptr GDrawCommandSequence_603980622): uint32 {.cdecl,
      importc: "gdraw_command_sequence_get_total_duration".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_total_duration" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_num_frames):
  proc gdraw_command_sequence_get_num_frames*(sequence: ptr GDrawCommandSequence_603980622): uint32 {.
      cdecl, importc: "gdraw_command_sequence_get_num_frames".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_num_frames" &
        " already exists, not redeclaring")
when not declared(gdraw_command_frame_get_command_list):
  proc gdraw_command_frame_get_command_list*(frame: ptr GDrawCommandFrame_603980614): ptr GDrawCommandList_603980618 {.
      cdecl, importc: "gdraw_command_frame_get_command_list".}
else:
  static :
    hint("Declaration of " & "gdraw_command_frame_get_command_list" &
        " already exists, not redeclaring")
when not declared(gpath_create):
  proc gpath_create*(init: ptr GPathInfo_603980630): ptr GPath_603980634 {.
      cdecl, importc: "gpath_create".}
else:
  static :
    hint("Declaration of " & "gpath_create" & " already exists, not redeclaring")
when not declared(gpath_destroy):
  proc gpath_destroy*(gpath: ptr GPath_603980634): void {.cdecl,
      importc: "gpath_destroy".}
else:
  static :
    hint("Declaration of " & "gpath_destroy" &
        " already exists, not redeclaring")
when not declared(gpath_draw_filled):
  proc gpath_draw_filled*(ctx: ptr GContext_603980598; path: ptr GPath_603980634): void {.
      cdecl, importc: "gpath_draw_filled".}
else:
  static :
    hint("Declaration of " & "gpath_draw_filled" &
        " already exists, not redeclaring")
when not declared(gpath_draw_outline):
  proc gpath_draw_outline*(ctx: ptr GContext_603980598; path: ptr GPath_603980634): void {.
      cdecl, importc: "gpath_draw_outline".}
else:
  static :
    hint("Declaration of " & "gpath_draw_outline" &
        " already exists, not redeclaring")
when not declared(gpath_rotate_to):
  proc gpath_rotate_to*(path: ptr GPath_603980634; angle: int32): void {.cdecl,
      importc: "gpath_rotate_to".}
else:
  static :
    hint("Declaration of " & "gpath_rotate_to" &
        " already exists, not redeclaring")
when not declared(gpath_move_to):
  proc gpath_move_to*(path: ptr GPath_603980634; point: GPoint_603980568): void {.
      cdecl, importc: "gpath_move_to".}
else:
  static :
    hint("Declaration of " & "gpath_move_to" &
        " already exists, not redeclaring")
when not declared(gpath_draw_outline_open):
  proc gpath_draw_outline_open*(ctx: ptr GContext_603980598; path: ptr GPath_603980634): void {.
      cdecl, importc: "gpath_draw_outline_open".}
else:
  static :
    hint("Declaration of " & "gpath_draw_outline_open" &
        " already exists, not redeclaring")
when not declared(fonts_get_system_font):
  proc fonts_get_system_font*(font_key: cstring): GFont_603980638 {.cdecl,
      importc: "fonts_get_system_font".}
else:
  static :
    hint("Declaration of " & "fonts_get_system_font" &
        " already exists, not redeclaring")
when not declared(fonts_load_custom_font):
  proc fonts_load_custom_font*(handle: ResHandle_603980508): GFont_603980638 {.
      cdecl, importc: "fonts_load_custom_font".}
else:
  static :
    hint("Declaration of " & "fonts_load_custom_font" &
        " already exists, not redeclaring")
when not declared(fonts_unload_custom_font):
  proc fonts_unload_custom_font*(font: GFont_603980638): void {.cdecl,
      importc: "fonts_unload_custom_font".}
else:
  static :
    hint("Declaration of " & "fonts_unload_custom_font" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_create):
  proc graphics_text_attributes_create*(): ptr GTextAttributes_603980648 {.
      cdecl, importc: "graphics_text_attributes_create".}
else:
  static :
    hint("Declaration of " & "graphics_text_attributes_create" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_destroy):
  proc graphics_text_attributes_destroy*(text_attributes: ptr GTextAttributes_603980648): void {.
      cdecl, importc: "graphics_text_attributes_destroy".}
else:
  static :
    hint("Declaration of " & "graphics_text_attributes_destroy" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_restore_default_text_flow):
  proc graphics_text_attributes_restore_default_text_flow*(
      text_attributes: ptr GTextAttributes_603980648): void {.cdecl,
      importc: "graphics_text_attributes_restore_default_text_flow".}
else:
  static :
    hint("Declaration of " &
        "graphics_text_attributes_restore_default_text_flow" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_enable_screen_text_flow):
  proc graphics_text_attributes_enable_screen_text_flow*(
      text_attributes: ptr GTextAttributes_603980648; inset: uint8): void {.
      cdecl, importc: "graphics_text_attributes_enable_screen_text_flow".}
else:
  static :
    hint("Declaration of " & "graphics_text_attributes_enable_screen_text_flow" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_restore_default_paging):
  proc graphics_text_attributes_restore_default_paging*(
      text_attributes: ptr GTextAttributes_603980648): void {.cdecl,
      importc: "graphics_text_attributes_restore_default_paging".}
else:
  static :
    hint("Declaration of " & "graphics_text_attributes_restore_default_paging" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_enable_paging):
  proc graphics_text_attributes_enable_paging*(
      text_attributes: ptr GTextAttributes_603980648;
      content_origin_on_screen: GPoint_603980568; paging_on_screen: GRect_603980576): void {.
      cdecl, importc: "graphics_text_attributes_enable_paging".}
else:
  static :
    hint("Declaration of " & "graphics_text_attributes_enable_paging" &
        " already exists, not redeclaring")
when not declared(graphics_draw_text):
  proc graphics_draw_text*(ctx: ptr GContext_603980598; text: cstring;
                           font: GFont_603980638; box: GRect_603980576;
                           overflow_mode: GTextOverflowMode_603980642;
                           alignment: GTextAlignment_603980646;
                           text_attributes: ptr GTextAttributes_603980648): void {.
      cdecl, importc: "graphics_draw_text".}
else:
  static :
    hint("Declaration of " & "graphics_draw_text" &
        " already exists, not redeclaring")
when not declared(graphics_text_layout_get_content_size):
  proc graphics_text_layout_get_content_size*(text: cstring; font: GFont_603980638;
      box: GRect_603980576; overflow_mode: GTextOverflowMode_603980642;
      alignment: GTextAlignment_603980646): GSize_603980572 {.cdecl,
      importc: "graphics_text_layout_get_content_size".}
else:
  static :
    hint("Declaration of " & "graphics_text_layout_get_content_size" &
        " already exists, not redeclaring")
when not declared(graphics_text_layout_get_content_size_with_attributes):
  proc graphics_text_layout_get_content_size_with_attributes*(text: cstring;
      font: GFont_603980638; box: GRect_603980576;
      overflow_mode: GTextOverflowMode_603980642; alignment: GTextAlignment_603980646;
      text_attributes: ptr GTextAttributes_603980648): GSize_603980572 {.cdecl,
      importc: "graphics_text_layout_get_content_size_with_attributes".}
else:
  static :
    hint("Declaration of " &
        "graphics_text_layout_get_content_size_with_attributes" &
        " already exists, not redeclaring")
when not declared(smartstrap_subscribe):
  proc smartstrap_subscribe*(handlers: SmartstrapHandlers_603980670): SmartstrapResult_603980652 {.
      cdecl, importc: "smartstrap_subscribe".}
else:
  static :
    hint("Declaration of " & "smartstrap_subscribe" &
        " already exists, not redeclaring")
when not declared(smartstrap_unsubscribe):
  proc smartstrap_unsubscribe*(): void {.cdecl,
      importc: "smartstrap_unsubscribe".}
else:
  static :
    hint("Declaration of " & "smartstrap_unsubscribe" &
        " already exists, not redeclaring")
when not declared(smartstrap_set_timeout):
  proc smartstrap_set_timeout*(timeout_ms: uint16): void {.cdecl,
      importc: "smartstrap_set_timeout".}
else:
  static :
    hint("Declaration of " & "smartstrap_set_timeout" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_create):
  proc smartstrap_attribute_create*(service_id: SmartstrapServiceId_603980654;
                                    attribute_id: SmartstrapAttributeId_603980656;
                                    buffer_length: csize_t): ptr SmartstrapAttribute_603980658 {.
      cdecl, importc: "smartstrap_attribute_create".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_create" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_destroy):
  proc smartstrap_attribute_destroy*(attribute: ptr SmartstrapAttribute_603980658): void {.
      cdecl, importc: "smartstrap_attribute_destroy".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_destroy" &
        " already exists, not redeclaring")
when not declared(smartstrap_service_is_available):
  proc smartstrap_service_is_available*(service_id: SmartstrapServiceId_603980654): bool {.
      cdecl, importc: "smartstrap_service_is_available".}
else:
  static :
    hint("Declaration of " & "smartstrap_service_is_available" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_get_service_id):
  proc smartstrap_attribute_get_service_id*(attribute: ptr SmartstrapAttribute_603980658): SmartstrapServiceId_603980654 {.
      cdecl, importc: "smartstrap_attribute_get_service_id".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_get_service_id" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_get_attribute_id):
  proc smartstrap_attribute_get_attribute_id*(attribute: ptr SmartstrapAttribute_603980658): SmartstrapAttributeId_603980656 {.
      cdecl, importc: "smartstrap_attribute_get_attribute_id".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_get_attribute_id" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_read):
  proc smartstrap_attribute_read*(attribute: ptr SmartstrapAttribute_603980658): SmartstrapResult_603980652 {.
      cdecl, importc: "smartstrap_attribute_read".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_read" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_begin_write):
  proc smartstrap_attribute_begin_write*(attribute: ptr SmartstrapAttribute_603980658;
      buffer: ptr ptr uint8; buffer_length: ptr csize_t): SmartstrapResult_603980652 {.
      cdecl, importc: "smartstrap_attribute_begin_write".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_begin_write" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_end_write):
  proc smartstrap_attribute_end_write*(attribute: ptr SmartstrapAttribute_603980658;
                                       write_length: csize_t; request_read: bool): SmartstrapResult_603980652 {.
      cdecl, importc: "smartstrap_attribute_end_write".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_end_write" &
        " already exists, not redeclaring")
when not declared(click_number_of_clicks_counted):
  proc click_number_of_clicks_counted*(recognizer: ClickRecognizerRef_603980672): uint8 {.
      cdecl, importc: "click_number_of_clicks_counted".}
else:
  static :
    hint("Declaration of " & "click_number_of_clicks_counted" &
        " already exists, not redeclaring")
when not declared(click_recognizer_get_button_id):
  proc click_recognizer_get_button_id*(recognizer: ClickRecognizerRef_603980672): ButtonId_603980295 {.
      cdecl, importc: "click_recognizer_get_button_id".}
else:
  static :
    hint("Declaration of " & "click_recognizer_get_button_id" &
        " already exists, not redeclaring")
when not declared(click_recognizer_is_repeating):
  proc click_recognizer_is_repeating*(recognizer: ClickRecognizerRef_603980672): bool {.
      cdecl, importc: "click_recognizer_is_repeating".}
else:
  static :
    hint("Declaration of " & "click_recognizer_is_repeating" &
        " already exists, not redeclaring")
when not declared(layer_create):
  proc layer_create*(frame: GRect_603980576): ptr Layer_603980678 {.cdecl,
      importc: "layer_create".}
else:
  static :
    hint("Declaration of " & "layer_create" & " already exists, not redeclaring")
when not declared(layer_create_with_data):
  proc layer_create_with_data*(frame: GRect_603980576; data_size: csize_t): ptr Layer_603980678 {.
      cdecl, importc: "layer_create_with_data".}
else:
  static :
    hint("Declaration of " & "layer_create_with_data" &
        " already exists, not redeclaring")
when not declared(layer_destroy):
  proc layer_destroy*(layer: ptr Layer_603980678): void {.cdecl,
      importc: "layer_destroy".}
else:
  static :
    hint("Declaration of " & "layer_destroy" &
        " already exists, not redeclaring")
when not declared(layer_mark_dirty):
  proc layer_mark_dirty*(layer: ptr Layer_603980678): void {.cdecl,
      importc: "layer_mark_dirty".}
else:
  static :
    hint("Declaration of " & "layer_mark_dirty" &
        " already exists, not redeclaring")
when not declared(layer_set_update_proc):
  proc layer_set_update_proc*(layer: ptr Layer_603980678;
                              update_proc: LayerUpdateProc_603980680): void {.
      cdecl, importc: "layer_set_update_proc".}
else:
  static :
    hint("Declaration of " & "layer_set_update_proc" &
        " already exists, not redeclaring")
when not declared(layer_set_frame):
  proc layer_set_frame*(layer: ptr Layer_603980678; frame: GRect_603980576): void {.
      cdecl, importc: "layer_set_frame".}
else:
  static :
    hint("Declaration of " & "layer_set_frame" &
        " already exists, not redeclaring")
when not declared(layer_get_frame):
  proc layer_get_frame*(layer: ptr Layer_603980678): GRect_603980576 {.cdecl,
      importc: "layer_get_frame".}
else:
  static :
    hint("Declaration of " & "layer_get_frame" &
        " already exists, not redeclaring")
when not declared(layer_set_bounds):
  proc layer_set_bounds*(layer: ptr Layer_603980678; bounds: GRect_603980576): void {.
      cdecl, importc: "layer_set_bounds".}
else:
  static :
    hint("Declaration of " & "layer_set_bounds" &
        " already exists, not redeclaring")
when not declared(layer_get_bounds):
  proc layer_get_bounds*(layer: ptr Layer_603980678): GRect_603980576 {.cdecl,
      importc: "layer_get_bounds".}
else:
  static :
    hint("Declaration of " & "layer_get_bounds" &
        " already exists, not redeclaring")
when not declared(layer_get_unobstructed_bounds):
  proc layer_get_unobstructed_bounds*(layer: ptr Layer_603980678): GRect_603980576 {.
      cdecl, importc: "layer_get_unobstructed_bounds".}
else:
  static :
    hint("Declaration of " & "layer_get_unobstructed_bounds" &
        " already exists, not redeclaring")
when not declared(layer_convert_point_to_screen):
  proc layer_convert_point_to_screen*(layer: ptr Layer_603980678; point: GPoint_603980568): GPoint_603980568 {.
      cdecl, importc: "layer_convert_point_to_screen".}
else:
  static :
    hint("Declaration of " & "layer_convert_point_to_screen" &
        " already exists, not redeclaring")
when not declared(layer_convert_rect_to_screen):
  proc layer_convert_rect_to_screen*(layer: ptr Layer_603980678; rect: GRect_603980576): GRect_603980576 {.
      cdecl, importc: "layer_convert_rect_to_screen".}
else:
  static :
    hint("Declaration of " & "layer_convert_rect_to_screen" &
        " already exists, not redeclaring")
when not declared(layer_get_window):
  proc layer_get_window*(layer: ptr Layer_603980678): ptr struct_Window {.cdecl,
      importc: "layer_get_window".}
else:
  static :
    hint("Declaration of " & "layer_get_window" &
        " already exists, not redeclaring")
when not declared(layer_remove_from_parent):
  proc layer_remove_from_parent*(child: ptr Layer_603980678): void {.cdecl,
      importc: "layer_remove_from_parent".}
else:
  static :
    hint("Declaration of " & "layer_remove_from_parent" &
        " already exists, not redeclaring")
when not declared(layer_remove_child_layers):
  proc layer_remove_child_layers*(parent: ptr Layer_603980678): void {.cdecl,
      importc: "layer_remove_child_layers".}
else:
  static :
    hint("Declaration of " & "layer_remove_child_layers" &
        " already exists, not redeclaring")
when not declared(layer_add_child):
  proc layer_add_child*(parent: ptr Layer_603980678; child: ptr Layer_603980678): void {.
      cdecl, importc: "layer_add_child".}
else:
  static :
    hint("Declaration of " & "layer_add_child" &
        " already exists, not redeclaring")
when not declared(layer_insert_below_sibling):
  proc layer_insert_below_sibling*(layer_to_insert: ptr Layer_603980678;
                                   below_sibling_layer: ptr Layer_603980678): void {.
      cdecl, importc: "layer_insert_below_sibling".}
else:
  static :
    hint("Declaration of " & "layer_insert_below_sibling" &
        " already exists, not redeclaring")
when not declared(layer_insert_above_sibling):
  proc layer_insert_above_sibling*(layer_to_insert: ptr Layer_603980678;
                                   above_sibling_layer: ptr Layer_603980678): void {.
      cdecl, importc: "layer_insert_above_sibling".}
else:
  static :
    hint("Declaration of " & "layer_insert_above_sibling" &
        " already exists, not redeclaring")
when not declared(layer_set_hidden):
  proc layer_set_hidden*(layer: ptr Layer_603980678; hidden: bool): void {.
      cdecl, importc: "layer_set_hidden".}
else:
  static :
    hint("Declaration of " & "layer_set_hidden" &
        " already exists, not redeclaring")
when not declared(layer_get_hidden):
  proc layer_get_hidden*(layer: ptr Layer_603980678): bool {.cdecl,
      importc: "layer_get_hidden".}
else:
  static :
    hint("Declaration of " & "layer_get_hidden" &
        " already exists, not redeclaring")
when not declared(layer_set_clips):
  proc layer_set_clips*(layer: ptr Layer_603980678; clips: bool): void {.cdecl,
      importc: "layer_set_clips".}
else:
  static :
    hint("Declaration of " & "layer_set_clips" &
        " already exists, not redeclaring")
when not declared(layer_get_clips):
  proc layer_get_clips*(layer: ptr Layer_603980678): bool {.cdecl,
      importc: "layer_get_clips".}
else:
  static :
    hint("Declaration of " & "layer_get_clips" &
        " already exists, not redeclaring")
when not declared(layer_get_data):
  proc layer_get_data*(layer: ptr Layer_603980678): pointer {.cdecl,
      importc: "layer_get_data".}
else:
  static :
    hint("Declaration of " & "layer_get_data" &
        " already exists, not redeclaring")
when not declared(window_create):
  proc window_create*(): ptr Window_603980682 {.cdecl, importc: "window_create".}
else:
  static :
    hint("Declaration of " & "window_create" &
        " already exists, not redeclaring")
when not declared(window_destroy):
  proc window_destroy*(window: ptr Window_603980682): void {.cdecl,
      importc: "window_destroy".}
else:
  static :
    hint("Declaration of " & "window_destroy" &
        " already exists, not redeclaring")
when not declared(window_set_click_config_provider):
  proc window_set_click_config_provider*(window: ptr Window_603980682;
      click_config_provider: ClickConfigProvider_603980676): void {.cdecl,
      importc: "window_set_click_config_provider".}
else:
  static :
    hint("Declaration of " & "window_set_click_config_provider" &
        " already exists, not redeclaring")
when not declared(window_set_click_config_provider_with_context):
  proc window_set_click_config_provider_with_context*(window: ptr Window_603980682;
      click_config_provider: ClickConfigProvider_603980676; context: pointer): void {.
      cdecl, importc: "window_set_click_config_provider_with_context".}
else:
  static :
    hint("Declaration of " & "window_set_click_config_provider_with_context" &
        " already exists, not redeclaring")
when not declared(window_get_click_config_provider):
  proc window_get_click_config_provider*(window: ptr Window_603980682): ClickConfigProvider_603980676 {.
      cdecl, importc: "window_get_click_config_provider".}
else:
  static :
    hint("Declaration of " & "window_get_click_config_provider" &
        " already exists, not redeclaring")
when not declared(window_get_click_config_context):
  proc window_get_click_config_context*(window: ptr Window_603980682): pointer {.
      cdecl, importc: "window_get_click_config_context".}
else:
  static :
    hint("Declaration of " & "window_get_click_config_context" &
        " already exists, not redeclaring")
when not declared(window_set_window_handlers):
  proc window_set_window_handlers*(window: ptr Window_603980682;
                                   handlers: WindowHandlers_603980688): void {.
      cdecl, importc: "window_set_window_handlers".}
else:
  static :
    hint("Declaration of " & "window_set_window_handlers" &
        " already exists, not redeclaring")
when not declared(window_get_root_layer):
  proc window_get_root_layer*(window: ptr Window_603980682): ptr struct_Layer {.
      cdecl, importc: "window_get_root_layer".}
else:
  static :
    hint("Declaration of " & "window_get_root_layer" &
        " already exists, not redeclaring")
when not declared(window_set_background_color):
  proc window_set_background_color*(window: ptr Window_603980682;
                                    background_color: GColor_603980564): void {.
      cdecl, importc: "window_set_background_color".}
else:
  static :
    hint("Declaration of " & "window_set_background_color" &
        " already exists, not redeclaring")
when not declared(window_is_loaded):
  proc window_is_loaded*(window: ptr Window_603980682): bool {.cdecl,
      importc: "window_is_loaded".}
else:
  static :
    hint("Declaration of " & "window_is_loaded" &
        " already exists, not redeclaring")
when not declared(window_set_user_data):
  proc window_set_user_data*(window: ptr Window_603980682; data: pointer): void {.
      cdecl, importc: "window_set_user_data".}
else:
  static :
    hint("Declaration of " & "window_set_user_data" &
        " already exists, not redeclaring")
when not declared(window_get_user_data):
  proc window_get_user_data*(window: ptr Window_603980682): pointer {.cdecl,
      importc: "window_get_user_data".}
else:
  static :
    hint("Declaration of " & "window_get_user_data" &
        " already exists, not redeclaring")
when not declared(window_single_click_subscribe):
  proc window_single_click_subscribe*(button_id: ButtonId_603980295;
                                      handler: ClickHandler_603980674): void {.
      cdecl, importc: "window_single_click_subscribe".}
else:
  static :
    hint("Declaration of " & "window_single_click_subscribe" &
        " already exists, not redeclaring")
when not declared(window_single_repeating_click_subscribe):
  proc window_single_repeating_click_subscribe*(button_id: ButtonId_603980295;
      repeat_interval_ms: uint16; handler: ClickHandler_603980674): void {.
      cdecl, importc: "window_single_repeating_click_subscribe".}
else:
  static :
    hint("Declaration of " & "window_single_repeating_click_subscribe" &
        " already exists, not redeclaring")
when not declared(window_multi_click_subscribe):
  proc window_multi_click_subscribe*(button_id: ButtonId_603980295;
                                     min_clicks: uint8; max_clicks: uint8;
                                     timeout: uint16; last_click_only: bool;
                                     handler: ClickHandler_603980674): void {.
      cdecl, importc: "window_multi_click_subscribe".}
else:
  static :
    hint("Declaration of " & "window_multi_click_subscribe" &
        " already exists, not redeclaring")
when not declared(window_long_click_subscribe):
  proc window_long_click_subscribe*(button_id: ButtonId_603980295;
                                    delay_ms: uint16;
                                    down_handler: ClickHandler_603980674;
                                    up_handler: ClickHandler_603980674): void {.
      cdecl, importc: "window_long_click_subscribe".}
else:
  static :
    hint("Declaration of " & "window_long_click_subscribe" &
        " already exists, not redeclaring")
when not declared(window_raw_click_subscribe):
  proc window_raw_click_subscribe*(button_id: ButtonId_603980295;
                                   down_handler: ClickHandler_603980674;
                                   up_handler: ClickHandler_603980674;
                                   context: pointer): void {.cdecl,
      importc: "window_raw_click_subscribe".}
else:
  static :
    hint("Declaration of " & "window_raw_click_subscribe" &
        " already exists, not redeclaring")
when not declared(window_set_click_context):
  proc window_set_click_context*(button_id: ButtonId_603980295; context: pointer): void {.
      cdecl, importc: "window_set_click_context".}
else:
  static :
    hint("Declaration of " & "window_set_click_context" &
        " already exists, not redeclaring")
when not declared(window_stack_push):
  proc window_stack_push*(window: ptr Window_603980682; animated: bool): void {.
      cdecl, importc: "window_stack_push".}
else:
  static :
    hint("Declaration of " & "window_stack_push" &
        " already exists, not redeclaring")
when not declared(window_stack_pop):
  proc window_stack_pop*(animated: bool): ptr Window_603980682 {.cdecl,
      importc: "window_stack_pop".}
else:
  static :
    hint("Declaration of " & "window_stack_pop" &
        " already exists, not redeclaring")
when not declared(window_stack_pop_all):
  proc window_stack_pop_all*(animated: bool): void {.cdecl,
      importc: "window_stack_pop_all".}
else:
  static :
    hint("Declaration of " & "window_stack_pop_all" &
        " already exists, not redeclaring")
when not declared(window_stack_remove):
  proc window_stack_remove*(window: ptr Window_603980682; animated: bool): bool {.
      cdecl, importc: "window_stack_remove".}
else:
  static :
    hint("Declaration of " & "window_stack_remove" &
        " already exists, not redeclaring")
when not declared(window_stack_get_top_window):
  proc window_stack_get_top_window*(): ptr Window_603980682 {.cdecl,
      importc: "window_stack_get_top_window".}
else:
  static :
    hint("Declaration of " & "window_stack_get_top_window" &
        " already exists, not redeclaring")
when not declared(window_stack_contains_window):
  proc window_stack_contains_window*(window: ptr Window_603980682): bool {.
      cdecl, importc: "window_stack_contains_window".}
else:
  static :
    hint("Declaration of " & "window_stack_contains_window" &
        " already exists, not redeclaring")
when not declared(animation_create):
  proc animation_create*(): ptr Animation_603980690 {.cdecl,
      importc: "animation_create".}
else:
  static :
    hint("Declaration of " & "animation_create" &
        " already exists, not redeclaring")
when not declared(animation_destroy):
  proc animation_destroy*(animation: ptr Animation_603980690): bool {.cdecl,
      importc: "animation_destroy".}
else:
  static :
    hint("Declaration of " & "animation_destroy" &
        " already exists, not redeclaring")
when not declared(animation_clone):
  proc animation_clone*(from_f: ptr Animation_603980690): ptr Animation_603980690 {.
      cdecl, importc: "animation_clone".}
else:
  static :
    hint("Declaration of " & "animation_clone" &
        " already exists, not redeclaring")
when not declared(animation_sequence_create):
  proc animation_sequence_create*(animation_a: ptr Animation_603980690;
                                  animation_b: ptr Animation_603980690;
                                  animation_c: ptr Animation_603980690): ptr Animation_603980690 {.
      cdecl, varargs, importc: "animation_sequence_create".}
else:
  static :
    hint("Declaration of " & "animation_sequence_create" &
        " already exists, not redeclaring")
when not declared(animation_sequence_create_from_array):
  proc animation_sequence_create_from_array*(animation_array: ptr ptr Animation_603980690;
      array_len: uint32): ptr Animation_603980690 {.cdecl,
      importc: "animation_sequence_create_from_array".}
else:
  static :
    hint("Declaration of " & "animation_sequence_create_from_array" &
        " already exists, not redeclaring")
when not declared(animation_spawn_create):
  proc animation_spawn_create*(animation_a: ptr Animation_603980690;
                               animation_b: ptr Animation_603980690;
                               animation_c: ptr Animation_603980690): ptr Animation_603980690 {.
      cdecl, varargs, importc: "animation_spawn_create".}
else:
  static :
    hint("Declaration of " & "animation_spawn_create" &
        " already exists, not redeclaring")
when not declared(animation_spawn_create_from_array):
  proc animation_spawn_create_from_array*(animation_array: ptr ptr Animation_603980690;
      array_len: uint32): ptr Animation_603980690 {.cdecl,
      importc: "animation_spawn_create_from_array".}
else:
  static :
    hint("Declaration of " & "animation_spawn_create_from_array" &
        " already exists, not redeclaring")
when not declared(animation_set_elapsed):
  proc animation_set_elapsed*(animation: ptr Animation_603980690;
                              elapsed_ms: uint32): bool {.cdecl,
      importc: "animation_set_elapsed".}
else:
  static :
    hint("Declaration of " & "animation_set_elapsed" &
        " already exists, not redeclaring")
when not declared(animation_get_elapsed):
  proc animation_get_elapsed*(animation: ptr Animation_603980690;
                              elapsed_ms: ptr int32): bool {.cdecl,
      importc: "animation_get_elapsed".}
else:
  static :
    hint("Declaration of " & "animation_get_elapsed" &
        " already exists, not redeclaring")
when not declared(animation_set_reverse):
  proc animation_set_reverse*(animation: ptr Animation_603980690; reverse: bool): bool {.
      cdecl, importc: "animation_set_reverse".}
else:
  static :
    hint("Declaration of " & "animation_set_reverse" &
        " already exists, not redeclaring")
when not declared(animation_get_reverse):
  proc animation_get_reverse*(animation: ptr Animation_603980690): bool {.cdecl,
      importc: "animation_get_reverse".}
else:
  static :
    hint("Declaration of " & "animation_get_reverse" &
        " already exists, not redeclaring")
when not declared(animation_set_play_count):
  proc animation_set_play_count*(animation: ptr Animation_603980690;
                                 play_count: uint32): bool {.cdecl,
      importc: "animation_set_play_count".}
else:
  static :
    hint("Declaration of " & "animation_set_play_count" &
        " already exists, not redeclaring")
when not declared(animation_get_play_count):
  proc animation_get_play_count*(animation: ptr Animation_603980690): uint32 {.
      cdecl, importc: "animation_get_play_count".}
else:
  static :
    hint("Declaration of " & "animation_get_play_count" &
        " already exists, not redeclaring")
when not declared(animation_set_duration):
  proc animation_set_duration*(animation: ptr Animation_603980690;
                               duration_ms: uint32): bool {.cdecl,
      importc: "animation_set_duration".}
else:
  static :
    hint("Declaration of " & "animation_set_duration" &
        " already exists, not redeclaring")
when not declared(animation_get_duration):
  proc animation_get_duration*(animation: ptr Animation_603980690;
                               include_delay: bool; include_play_count: bool): uint32 {.
      cdecl, importc: "animation_get_duration".}
else:
  static :
    hint("Declaration of " & "animation_get_duration" &
        " already exists, not redeclaring")
when not declared(animation_set_delay):
  proc animation_set_delay*(animation: ptr Animation_603980690; delay_ms: uint32): bool {.
      cdecl, importc: "animation_set_delay".}
else:
  static :
    hint("Declaration of " & "animation_set_delay" &
        " already exists, not redeclaring")
when not declared(animation_get_delay):
  proc animation_get_delay*(animation: ptr Animation_603980690): uint32 {.cdecl,
      importc: "animation_get_delay".}
else:
  static :
    hint("Declaration of " & "animation_get_delay" &
        " already exists, not redeclaring")
when not declared(animation_set_curve):
  proc animation_set_curve*(animation: ptr Animation_603980690;
                            curve: AnimationCurve_603980696): bool {.cdecl,
      importc: "animation_set_curve".}
else:
  static :
    hint("Declaration of " & "animation_set_curve" &
        " already exists, not redeclaring")
when not declared(animation_get_curve):
  proc animation_get_curve*(animation: ptr Animation_603980690): AnimationCurve_603980696 {.
      cdecl, importc: "animation_get_curve".}
else:
  static :
    hint("Declaration of " & "animation_get_curve" &
        " already exists, not redeclaring")
when not declared(animation_set_custom_curve):
  proc animation_set_custom_curve*(animation: ptr Animation_603980690;
                                   curve_function: AnimationCurveFunction_603980698): bool {.
      cdecl, importc: "animation_set_custom_curve".}
else:
  static :
    hint("Declaration of " & "animation_set_custom_curve" &
        " already exists, not redeclaring")
when not declared(animation_get_custom_curve):
  proc animation_get_custom_curve*(animation: ptr Animation_603980690): AnimationCurveFunction_603980698 {.
      cdecl, importc: "animation_get_custom_curve".}
else:
  static :
    hint("Declaration of " & "animation_get_custom_curve" &
        " already exists, not redeclaring")
when not declared(animation_set_handlers):
  proc animation_set_handlers*(animation: ptr Animation_603980690;
                               callbacks: AnimationHandlers_603980706;
                               context: pointer): bool {.cdecl,
      importc: "animation_set_handlers".}
else:
  static :
    hint("Declaration of " & "animation_set_handlers" &
        " already exists, not redeclaring")
when not declared(animation_get_context):
  proc animation_get_context*(animation: ptr Animation_603980690): pointer {.
      cdecl, importc: "animation_get_context".}
else:
  static :
    hint("Declaration of " & "animation_get_context" &
        " already exists, not redeclaring")
when not declared(animation_schedule):
  proc animation_schedule*(animation: ptr Animation_603980690): bool {.cdecl,
      importc: "animation_schedule".}
else:
  static :
    hint("Declaration of " & "animation_schedule" &
        " already exists, not redeclaring")
when not declared(animation_unschedule):
  proc animation_unschedule*(animation: ptr Animation_603980690): bool {.cdecl,
      importc: "animation_unschedule".}
else:
  static :
    hint("Declaration of " & "animation_unschedule" &
        " already exists, not redeclaring")
when not declared(animation_unschedule_all):
  proc animation_unschedule_all*(): void {.cdecl,
      importc: "animation_unschedule_all".}
else:
  static :
    hint("Declaration of " & "animation_unschedule_all" &
        " already exists, not redeclaring")
when not declared(animation_is_scheduled):
  proc animation_is_scheduled*(animation: ptr Animation_603980690): bool {.
      cdecl, importc: "animation_is_scheduled".}
else:
  static :
    hint("Declaration of " & "animation_is_scheduled" &
        " already exists, not redeclaring")
when not declared(animation_set_implementation):
  proc animation_set_implementation*(animation: ptr Animation_603980690;
      implementation: ptr AnimationImplementation_603980716): bool {.cdecl,
      importc: "animation_set_implementation".}
else:
  static :
    hint("Declaration of " & "animation_set_implementation" &
        " already exists, not redeclaring")
when not declared(animation_get_implementation):
  proc animation_get_implementation*(animation: ptr Animation_603980690): ptr AnimationImplementation_603980716 {.
      cdecl, importc: "animation_get_implementation".}
else:
  static :
    hint("Declaration of " & "animation_get_implementation" &
        " already exists, not redeclaring")
when not declared(property_animation_create_layer_frame):
  proc property_animation_create_layer_frame*(layer: ptr struct_Layer;
      from_frame: ptr GRect_603980576; to_frame: ptr GRect_603980576): ptr PropertyAnimation_603980726 {.
      cdecl, importc: "property_animation_create_layer_frame".}
else:
  static :
    hint("Declaration of " & "property_animation_create_layer_frame" &
        " already exists, not redeclaring")
when not declared(property_animation_create_bounds_origin):
  proc property_animation_create_bounds_origin*(layer: ptr struct_Layer;
      from_f: ptr GPoint_603980568; to: ptr GPoint_603980568): ptr PropertyAnimation_603980726 {.
      cdecl, importc: "property_animation_create_bounds_origin".}
else:
  static :
    hint("Declaration of " & "property_animation_create_bounds_origin" &
        " already exists, not redeclaring")
when not declared(property_animation_create):
  proc property_animation_create*(implementation: ptr PropertyAnimationImplementation_603980722;
                                  subject: pointer; from_value: pointer;
                                  to_value: pointer): ptr PropertyAnimation_603980726 {.
      cdecl, importc: "property_animation_create".}
else:
  static :
    hint("Declaration of " & "property_animation_create" &
        " already exists, not redeclaring")
when not declared(property_animation_destroy):
  proc property_animation_destroy*(property_animation: ptr PropertyAnimation_603980726): void {.
      cdecl, importc: "property_animation_destroy".}
else:
  static :
    hint("Declaration of " & "property_animation_destroy" &
        " already exists, not redeclaring")
when not declared(property_animation_update_int16):
  proc property_animation_update_int16*(property_animation: ptr PropertyAnimation_603980726;
                                        distance_normalized: uint32): void {.
      cdecl, importc: "property_animation_update_int16".}
else:
  static :
    hint("Declaration of " & "property_animation_update_int16" &
        " already exists, not redeclaring")
when not declared(property_animation_update_uint32):
  proc property_animation_update_uint32*(
      property_animation: ptr PropertyAnimation_603980726;
      distance_normalized: uint32): void {.cdecl,
      importc: "property_animation_update_uint32".}
else:
  static :
    hint("Declaration of " & "property_animation_update_uint32" &
        " already exists, not redeclaring")
when not declared(property_animation_update_gpoint):
  proc property_animation_update_gpoint*(
      property_animation: ptr PropertyAnimation_603980726;
      distance_normalized: uint32): void {.cdecl,
      importc: "property_animation_update_gpoint".}
else:
  static :
    hint("Declaration of " & "property_animation_update_gpoint" &
        " already exists, not redeclaring")
when not declared(property_animation_update_grect):
  proc property_animation_update_grect*(property_animation: ptr PropertyAnimation_603980726;
                                        distance_normalized: uint32): void {.
      cdecl, importc: "property_animation_update_grect".}
else:
  static :
    hint("Declaration of " & "property_animation_update_grect" &
        " already exists, not redeclaring")
when not declared(property_animation_update_gcolor8):
  proc property_animation_update_gcolor8*(
      property_animation: ptr PropertyAnimation_603980726;
      distance_normalized: uint32): void {.cdecl,
      importc: "property_animation_update_gcolor8".}
else:
  static :
    hint("Declaration of " & "property_animation_update_gcolor8" &
        " already exists, not redeclaring")
when not declared(property_animation_get_animation):
  proc property_animation_get_animation*(
      property_animation: ptr PropertyAnimation_603980726): ptr Animation_603980690 {.
      cdecl, importc: "property_animation_get_animation".}
else:
  static :
    hint("Declaration of " & "property_animation_get_animation" &
        " already exists, not redeclaring")
when not declared(property_animation_subject):
  proc property_animation_subject*(property_animation: ptr PropertyAnimation_603980726;
                                   subject: ptr pointer; set_f: bool): bool {.
      cdecl, importc: "property_animation_subject".}
else:
  static :
    hint("Declaration of " & "property_animation_subject" &
        " already exists, not redeclaring")
when not declared(property_animation_from):
  proc property_animation_from*(property_animation: ptr PropertyAnimation_603980726;
                                from_f: pointer; size: csize_t; set_f: bool): bool {.
      cdecl, importc: "property_animation_from".}
else:
  static :
    hint("Declaration of " & "property_animation_from" &
        " already exists, not redeclaring")
when not declared(property_animation_to):
  proc property_animation_to*(property_animation: ptr PropertyAnimation_603980726;
                              to: pointer; size: csize_t; set_f: bool): bool {.
      cdecl, importc: "property_animation_to".}
else:
  static :
    hint("Declaration of " & "property_animation_to" &
        " already exists, not redeclaring")
when not declared(unobstructed_area_service_subscribe):
  proc unobstructed_area_service_subscribe*(handlers: UnobstructedAreaHandlers_603980760;
      context: pointer): void {.cdecl,
                                importc: "unobstructed_area_service_subscribe".}
else:
  static :
    hint("Declaration of " & "unobstructed_area_service_subscribe" &
        " already exists, not redeclaring")
when not declared(unobstructed_area_service_unsubscribe):
  proc unobstructed_area_service_unsubscribe*(): void {.cdecl,
      importc: "unobstructed_area_service_unsubscribe".}
else:
  static :
    hint("Declaration of " & "unobstructed_area_service_unsubscribe" &
        " already exists, not redeclaring")
when not declared(text_layer_create):
  proc text_layer_create*(frame: GRect_603980576): ptr TextLayer_603980762 {.
      cdecl, importc: "text_layer_create".}
else:
  static :
    hint("Declaration of " & "text_layer_create" &
        " already exists, not redeclaring")
when not declared(text_layer_destroy):
  proc text_layer_destroy*(text_layer: ptr TextLayer_603980762): void {.cdecl,
      importc: "text_layer_destroy".}
else:
  static :
    hint("Declaration of " & "text_layer_destroy" &
        " already exists, not redeclaring")
when not declared(text_layer_get_layer):
  proc text_layer_get_layer*(text_layer: ptr TextLayer_603980762): ptr Layer_603980678 {.
      cdecl, importc: "text_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "text_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(text_layer_set_text):
  proc text_layer_set_text*(text_layer: ptr TextLayer_603980762; text: cstring): void {.
      cdecl, importc: "text_layer_set_text".}
else:
  static :
    hint("Declaration of " & "text_layer_set_text" &
        " already exists, not redeclaring")
when not declared(text_layer_get_text):
  proc text_layer_get_text*(text_layer: ptr TextLayer_603980762): cstring {.
      cdecl, importc: "text_layer_get_text".}
else:
  static :
    hint("Declaration of " & "text_layer_get_text" &
        " already exists, not redeclaring")
when not declared(text_layer_set_background_color):
  proc text_layer_set_background_color*(text_layer: ptr TextLayer_603980762;
                                        color: GColor_603980564): void {.cdecl,
      importc: "text_layer_set_background_color".}
else:
  static :
    hint("Declaration of " & "text_layer_set_background_color" &
        " already exists, not redeclaring")
when not declared(text_layer_set_text_color):
  proc text_layer_set_text_color*(text_layer: ptr TextLayer_603980762;
                                  color: GColor_603980564): void {.cdecl,
      importc: "text_layer_set_text_color".}
else:
  static :
    hint("Declaration of " & "text_layer_set_text_color" &
        " already exists, not redeclaring")
when not declared(text_layer_set_overflow_mode):
  proc text_layer_set_overflow_mode*(text_layer: ptr TextLayer_603980762;
                                     line_mode: GTextOverflowMode_603980642): void {.
      cdecl, importc: "text_layer_set_overflow_mode".}
else:
  static :
    hint("Declaration of " & "text_layer_set_overflow_mode" &
        " already exists, not redeclaring")
when not declared(text_layer_set_font):
  proc text_layer_set_font*(text_layer: ptr TextLayer_603980762; font: GFont_603980638): void {.
      cdecl, importc: "text_layer_set_font".}
else:
  static :
    hint("Declaration of " & "text_layer_set_font" &
        " already exists, not redeclaring")
when not declared(text_layer_set_text_alignment):
  proc text_layer_set_text_alignment*(text_layer: ptr TextLayer_603980762;
                                      text_alignment: GTextAlignment_603980646): void {.
      cdecl, importc: "text_layer_set_text_alignment".}
else:
  static :
    hint("Declaration of " & "text_layer_set_text_alignment" &
        " already exists, not redeclaring")
when not declared(text_layer_enable_screen_text_flow_and_paging):
  proc text_layer_enable_screen_text_flow_and_paging*(text_layer: ptr TextLayer_603980762;
      inset: uint8): void {.cdecl, importc: "text_layer_enable_screen_text_flow_and_paging".}
else:
  static :
    hint("Declaration of " & "text_layer_enable_screen_text_flow_and_paging" &
        " already exists, not redeclaring")
when not declared(text_layer_restore_default_text_flow_and_paging):
  proc text_layer_restore_default_text_flow_and_paging*(
      text_layer: ptr TextLayer_603980762): void {.cdecl,
      importc: "text_layer_restore_default_text_flow_and_paging".}
else:
  static :
    hint("Declaration of " & "text_layer_restore_default_text_flow_and_paging" &
        " already exists, not redeclaring")
when not declared(text_layer_get_content_size):
  proc text_layer_get_content_size*(text_layer: ptr TextLayer_603980762): GSize_603980572 {.
      cdecl, importc: "text_layer_get_content_size".}
else:
  static :
    hint("Declaration of " & "text_layer_get_content_size" &
        " already exists, not redeclaring")
when not declared(text_layer_set_size):
  proc text_layer_set_size*(text_layer: ptr TextLayer_603980762; max_size: GSize_603980572): void {.
      cdecl, importc: "text_layer_set_size".}
else:
  static :
    hint("Declaration of " & "text_layer_set_size" &
        " already exists, not redeclaring")
when not declared(scroll_layer_create):
  proc scroll_layer_create*(frame: GRect_603980576): ptr ScrollLayer_603980764 {.
      cdecl, importc: "scroll_layer_create".}
else:
  static :
    hint("Declaration of " & "scroll_layer_create" &
        " already exists, not redeclaring")
when not declared(scroll_layer_destroy):
  proc scroll_layer_destroy*(scroll_layer: ptr ScrollLayer_603980764): void {.
      cdecl, importc: "scroll_layer_destroy".}
else:
  static :
    hint("Declaration of " & "scroll_layer_destroy" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_layer):
  proc scroll_layer_get_layer*(scroll_layer: ptr ScrollLayer_603980764): ptr Layer_603980678 {.
      cdecl, importc: "scroll_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(scroll_layer_add_child):
  proc scroll_layer_add_child*(scroll_layer: ptr ScrollLayer_603980764;
                               child: ptr Layer_603980678): void {.cdecl,
      importc: "scroll_layer_add_child".}
else:
  static :
    hint("Declaration of " & "scroll_layer_add_child" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_click_config_onto_window):
  proc scroll_layer_set_click_config_onto_window*(scroll_layer: ptr ScrollLayer_603980764;
      window: ptr struct_Window): void {.cdecl,
      importc: "scroll_layer_set_click_config_onto_window".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_click_config_onto_window" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_callbacks):
  proc scroll_layer_set_callbacks*(scroll_layer: ptr ScrollLayer_603980764;
                                   callbacks: ScrollLayerCallbacks_603980770): void {.
      cdecl, importc: "scroll_layer_set_callbacks".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_callbacks" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_context):
  proc scroll_layer_set_context*(scroll_layer: ptr ScrollLayer_603980764;
                                 context: pointer): void {.cdecl,
      importc: "scroll_layer_set_context".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_context" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_content_offset):
  proc scroll_layer_set_content_offset*(scroll_layer: ptr ScrollLayer_603980764;
                                        offset: GPoint_603980568; animated: bool): void {.
      cdecl, importc: "scroll_layer_set_content_offset".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_content_offset" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_content_offset):
  proc scroll_layer_get_content_offset*(scroll_layer: ptr ScrollLayer_603980764): GPoint_603980568 {.
      cdecl, importc: "scroll_layer_get_content_offset".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_content_offset" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_content_size):
  proc scroll_layer_set_content_size*(scroll_layer: ptr ScrollLayer_603980764;
                                      size: GSize_603980572): void {.cdecl,
      importc: "scroll_layer_set_content_size".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_content_size" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_content_size):
  proc scroll_layer_get_content_size*(scroll_layer: ptr ScrollLayer_603980764): GSize_603980572 {.
      cdecl, importc: "scroll_layer_get_content_size".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_content_size" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_frame):
  proc scroll_layer_set_frame*(scroll_layer: ptr ScrollLayer_603980764;
                               frame: GRect_603980576): void {.cdecl,
      importc: "scroll_layer_set_frame".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_frame" &
        " already exists, not redeclaring")
when not declared(scroll_layer_scroll_up_click_handler):
  proc scroll_layer_scroll_up_click_handler*(recognizer: ClickRecognizerRef_603980672;
      context: pointer): void {.cdecl,
                                importc: "scroll_layer_scroll_up_click_handler".}
else:
  static :
    hint("Declaration of " & "scroll_layer_scroll_up_click_handler" &
        " already exists, not redeclaring")
when not declared(scroll_layer_scroll_down_click_handler):
  proc scroll_layer_scroll_down_click_handler*(recognizer: ClickRecognizerRef_603980672;
      context: pointer): void {.cdecl, importc: "scroll_layer_scroll_down_click_handler".}
else:
  static :
    hint("Declaration of " & "scroll_layer_scroll_down_click_handler" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_shadow_hidden):
  proc scroll_layer_set_shadow_hidden*(scroll_layer: ptr ScrollLayer_603980764;
                                       hidden: bool): void {.cdecl,
      importc: "scroll_layer_set_shadow_hidden".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_shadow_hidden" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_shadow_hidden):
  proc scroll_layer_get_shadow_hidden*(scroll_layer: ptr ScrollLayer_603980764): bool {.
      cdecl, importc: "scroll_layer_get_shadow_hidden".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_shadow_hidden" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_paging):
  proc scroll_layer_set_paging*(scroll_layer: ptr ScrollLayer_603980764;
                                paging_enabled: bool): void {.cdecl,
      importc: "scroll_layer_set_paging".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_paging" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_paging):
  proc scroll_layer_get_paging*(scroll_layer: ptr ScrollLayer_603980764): bool {.
      cdecl, importc: "scroll_layer_get_paging".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_paging" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_content_indicator):
  proc scroll_layer_get_content_indicator*(scroll_layer: ptr ScrollLayer_603980764): ptr ContentIndicator_603980772 {.
      cdecl, importc: "scroll_layer_get_content_indicator".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_content_indicator" &
        " already exists, not redeclaring")
when not declared(content_indicator_create):
  proc content_indicator_create*(): ptr ContentIndicator_603980772 {.cdecl,
      importc: "content_indicator_create".}
else:
  static :
    hint("Declaration of " & "content_indicator_create" &
        " already exists, not redeclaring")
when not declared(content_indicator_destroy):
  proc content_indicator_destroy*(content_indicator: ptr ContentIndicator_603980772): void {.
      cdecl, importc: "content_indicator_destroy".}
else:
  static :
    hint("Declaration of " & "content_indicator_destroy" &
        " already exists, not redeclaring")
when not declared(content_indicator_configure_direction):
  proc content_indicator_configure_direction*(
      content_indicator: ptr ContentIndicator_603980772;
      direction: ContentIndicatorDirection_603980776;
      config: ptr ContentIndicatorConfig_603980780): bool {.cdecl,
      importc: "content_indicator_configure_direction".}
else:
  static :
    hint("Declaration of " & "content_indicator_configure_direction" &
        " already exists, not redeclaring")
when not declared(content_indicator_get_content_available):
  proc content_indicator_get_content_available*(
      content_indicator: ptr ContentIndicator_603980772;
      direction: ContentIndicatorDirection_603980776): bool {.cdecl,
      importc: "content_indicator_get_content_available".}
else:
  static :
    hint("Declaration of " & "content_indicator_get_content_available" &
        " already exists, not redeclaring")
when not declared(content_indicator_set_content_available):
  proc content_indicator_set_content_available*(
      content_indicator: ptr ContentIndicator_603980772;
      direction: ContentIndicatorDirection_603980776; available: bool): void {.
      cdecl, importc: "content_indicator_set_content_available".}
else:
  static :
    hint("Declaration of " & "content_indicator_set_content_available" &
        " already exists, not redeclaring")
when not declared(menu_cell_basic_draw):
  proc menu_cell_basic_draw*(ctx: ptr GContext_603980598; cell_layer: ptr Layer_603980678;
                             title: cstring; subtitle: cstring;
                             icon: ptr GBitmap_603980582): void {.cdecl,
      importc: "menu_cell_basic_draw".}
else:
  static :
    hint("Declaration of " & "menu_cell_basic_draw" &
        " already exists, not redeclaring")
when not declared(menu_cell_title_draw):
  proc menu_cell_title_draw*(ctx: ptr GContext_603980598; cell_layer: ptr Layer_603980678;
                             title: cstring): void {.cdecl,
      importc: "menu_cell_title_draw".}
else:
  static :
    hint("Declaration of " & "menu_cell_title_draw" &
        " already exists, not redeclaring")
when not declared(menu_cell_basic_header_draw):
  proc menu_cell_basic_header_draw*(ctx: ptr GContext_603980598;
                                    cell_layer: ptr Layer_603980678;
                                    title: cstring): void {.cdecl,
      importc: "menu_cell_basic_header_draw".}
else:
  static :
    hint("Declaration of " & "menu_cell_basic_header_draw" &
        " already exists, not redeclaring")
when not declared(menu_index_compare):
  proc menu_index_compare*(a: ptr MenuIndex_603980784; b: ptr MenuIndex_603980784): int16 {.
      cdecl, importc: "menu_index_compare".}
else:
  static :
    hint("Declaration of " & "menu_index_compare" &
        " already exists, not redeclaring")
when not declared(menu_layer_create):
  proc menu_layer_create*(frame: GRect_603980576): ptr MenuLayer_603980790 {.
      cdecl, importc: "menu_layer_create".}
else:
  static :
    hint("Declaration of " & "menu_layer_create" &
        " already exists, not redeclaring")
when not declared(menu_layer_destroy):
  proc menu_layer_destroy*(menu_layer: ptr MenuLayer_603980790): void {.cdecl,
      importc: "menu_layer_destroy".}
else:
  static :
    hint("Declaration of " & "menu_layer_destroy" &
        " already exists, not redeclaring")
when not declared(menu_layer_get_layer):
  proc menu_layer_get_layer*(menu_layer: ptr MenuLayer_603980790): ptr Layer_603980678 {.
      cdecl, importc: "menu_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "menu_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(menu_layer_get_scroll_layer):
  proc menu_layer_get_scroll_layer*(menu_layer: ptr MenuLayer_603980790): ptr ScrollLayer_603980764 {.
      cdecl, importc: "menu_layer_get_scroll_layer".}
else:
  static :
    hint("Declaration of " & "menu_layer_get_scroll_layer" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_callbacks):
  proc menu_layer_set_callbacks*(menu_layer: ptr MenuLayer_603980790;
                                 callback_context: pointer;
                                 callbacks: MenuLayerCallbacks_603980818): void {.
      cdecl, importc: "menu_layer_set_callbacks".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_callbacks" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_click_config_onto_window):
  proc menu_layer_set_click_config_onto_window*(menu_layer: ptr MenuLayer_603980790;
      window: ptr struct_Window): void {.cdecl,
      importc: "menu_layer_set_click_config_onto_window".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_click_config_onto_window" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_selected_next):
  proc menu_layer_set_selected_next*(menu_layer: ptr MenuLayer_603980790;
                                     up: bool; scroll_align: MenuRowAlign_603980822;
                                     animated: bool): void {.cdecl,
      importc: "menu_layer_set_selected_next".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_selected_next" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_selected_index):
  proc menu_layer_set_selected_index*(menu_layer: ptr MenuLayer_603980790;
                                      index: MenuIndex_603980784;
                                      scroll_align: MenuRowAlign_603980822;
                                      animated: bool): void {.cdecl,
      importc: "menu_layer_set_selected_index".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_selected_index" &
        " already exists, not redeclaring")
when not declared(menu_layer_get_selected_index):
  proc menu_layer_get_selected_index*(menu_layer: ptr MenuLayer_603980790): MenuIndex_603980784 {.
      cdecl, importc: "menu_layer_get_selected_index".}
else:
  static :
    hint("Declaration of " & "menu_layer_get_selected_index" &
        " already exists, not redeclaring")
when not declared(menu_layer_reload_data):
  proc menu_layer_reload_data*(menu_layer: ptr MenuLayer_603980790): void {.
      cdecl, importc: "menu_layer_reload_data".}
else:
  static :
    hint("Declaration of " & "menu_layer_reload_data" &
        " already exists, not redeclaring")
when not declared(menu_cell_layer_is_highlighted):
  proc menu_cell_layer_is_highlighted*(cell_layer: ptr Layer_603980678): bool {.
      cdecl, importc: "menu_cell_layer_is_highlighted".}
else:
  static :
    hint("Declaration of " & "menu_cell_layer_is_highlighted" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_normal_colors):
  proc menu_layer_set_normal_colors*(menu_layer: ptr MenuLayer_603980790;
                                     background: GColor_603980564;
                                     foreground: GColor_603980564): void {.
      cdecl, importc: "menu_layer_set_normal_colors".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_normal_colors" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_highlight_colors):
  proc menu_layer_set_highlight_colors*(menu_layer: ptr MenuLayer_603980790;
                                        background: GColor_603980564;
                                        foreground: GColor_603980564): void {.
      cdecl, importc: "menu_layer_set_highlight_colors".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_highlight_colors" &
        " already exists, not redeclaring")
when not declared(menu_layer_pad_bottom_enable):
  proc menu_layer_pad_bottom_enable*(menu_layer: ptr MenuLayer_603980790;
                                     enable: bool): void {.cdecl,
      importc: "menu_layer_pad_bottom_enable".}
else:
  static :
    hint("Declaration of " & "menu_layer_pad_bottom_enable" &
        " already exists, not redeclaring")
when not declared(menu_layer_get_center_focused):
  proc menu_layer_get_center_focused*(menu_layer: ptr MenuLayer_603980790): bool {.
      cdecl, importc: "menu_layer_get_center_focused".}
else:
  static :
    hint("Declaration of " & "menu_layer_get_center_focused" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_center_focused):
  proc menu_layer_set_center_focused*(menu_layer: ptr MenuLayer_603980790;
                                      center_focused: bool): void {.cdecl,
      importc: "menu_layer_set_center_focused".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_center_focused" &
        " already exists, not redeclaring")
when not declared(menu_layer_is_index_selected):
  proc menu_layer_is_index_selected*(menu_layer: ptr MenuLayer_603980790;
                                     index: ptr MenuIndex_603980784): bool {.
      cdecl, importc: "menu_layer_is_index_selected".}
else:
  static :
    hint("Declaration of " & "menu_layer_is_index_selected" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_create):
  proc simple_menu_layer_create*(frame: GRect_603980576; window: ptr Window_603980682;
                                 sections: ptr SimpleMenuSection_603980834;
                                 num_sections: int32; callback_context: pointer): ptr SimpleMenuLayer_603980824 {.
      cdecl, importc: "simple_menu_layer_create".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_create" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_destroy):
  proc simple_menu_layer_destroy*(menu_layer: ptr SimpleMenuLayer_603980824): void {.
      cdecl, importc: "simple_menu_layer_destroy".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_destroy" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_get_layer):
  proc simple_menu_layer_get_layer*(simple_menu: ptr SimpleMenuLayer_603980824): ptr Layer_603980678 {.
      cdecl, importc: "simple_menu_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_get_selected_index):
  proc simple_menu_layer_get_selected_index*(simple_menu: ptr SimpleMenuLayer_603980824): cint {.
      cdecl, importc: "simple_menu_layer_get_selected_index".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_get_selected_index" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_set_selected_index):
  proc simple_menu_layer_set_selected_index*(simple_menu: ptr SimpleMenuLayer_603980824;
      index: int32; animated: bool): void {.cdecl,
      importc: "simple_menu_layer_set_selected_index".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_set_selected_index" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_get_menu_layer):
  proc simple_menu_layer_get_menu_layer*(simple_menu: ptr SimpleMenuLayer_603980824): ptr MenuLayer_603980790 {.
      cdecl, importc: "simple_menu_layer_get_menu_layer".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_get_menu_layer" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_create):
  proc action_bar_layer_create*(): ptr ActionBarLayer_603980840 {.cdecl,
      importc: "action_bar_layer_create".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_create" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_destroy):
  proc action_bar_layer_destroy*(action_bar_layer: ptr ActionBarLayer_603980840): void {.
      cdecl, importc: "action_bar_layer_destroy".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_destroy" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_get_layer):
  proc action_bar_layer_get_layer*(action_bar_layer: ptr ActionBarLayer_603980840): ptr Layer_603980678 {.
      cdecl, importc: "action_bar_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_context):
  proc action_bar_layer_set_context*(action_bar: ptr ActionBarLayer_603980840;
                                     context: pointer): void {.cdecl,
      importc: "action_bar_layer_set_context".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_context" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_click_config_provider):
  proc action_bar_layer_set_click_config_provider*(
      action_bar: ptr ActionBarLayer_603980840;
      click_config_provider: ClickConfigProvider_603980676): void {.cdecl,
      importc: "action_bar_layer_set_click_config_provider".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_click_config_provider" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_icon):
  proc action_bar_layer_set_icon*(action_bar: ptr ActionBarLayer_603980840;
                                  button_id: ButtonId_603980295;
                                  icon: ptr GBitmap_603980582): void {.cdecl,
      importc: "action_bar_layer_set_icon".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_icon" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_clear_icon):
  proc action_bar_layer_clear_icon*(action_bar: ptr ActionBarLayer_603980840;
                                    button_id: ButtonId_603980295): void {.
      cdecl, importc: "action_bar_layer_clear_icon".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_clear_icon" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_add_to_window):
  proc action_bar_layer_add_to_window*(action_bar: ptr ActionBarLayer_603980840;
                                       window: ptr struct_Window): void {.cdecl,
      importc: "action_bar_layer_add_to_window".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_add_to_window" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_remove_from_window):
  proc action_bar_layer_remove_from_window*(action_bar: ptr ActionBarLayer_603980840): void {.
      cdecl, importc: "action_bar_layer_remove_from_window".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_remove_from_window" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_background_color):
  proc action_bar_layer_set_background_color*(action_bar: ptr ActionBarLayer_603980840;
      background_color: GColor_603980564): void {.cdecl,
      importc: "action_bar_layer_set_background_color".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_background_color" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_icon_animated):
  proc action_bar_layer_set_icon_animated*(action_bar: ptr ActionBarLayer_603980840;
      button_id: ButtonId_603980295; icon: ptr GBitmap_603980582; animated: bool): void {.
      cdecl, importc: "action_bar_layer_set_icon_animated".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_icon_animated" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_icon_press_animation):
  proc action_bar_layer_set_icon_press_animation*(
      action_bar: ptr ActionBarLayer_603980840; button_id: ButtonId_603980295;
      animation: ActionBarLayerIconPressAnimation_603980838): void {.cdecl,
      importc: "action_bar_layer_set_icon_press_animation".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_icon_press_animation" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_create):
  proc status_bar_layer_create*(): ptr StatusBarLayer_603980842 {.cdecl,
      importc: "status_bar_layer_create".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_create" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_destroy):
  proc status_bar_layer_destroy*(status_bar_layer: ptr StatusBarLayer_603980842): void {.
      cdecl, importc: "status_bar_layer_destroy".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_destroy" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_get_layer):
  proc status_bar_layer_get_layer*(status_bar_layer: ptr StatusBarLayer_603980842): ptr Layer_603980678 {.
      cdecl, importc: "status_bar_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_get_background_color):
  proc status_bar_layer_get_background_color*(
      status_bar_layer: ptr StatusBarLayer_603980842): GColor_603980564 {.cdecl,
      importc: "status_bar_layer_get_background_color".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_get_background_color" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_get_foreground_color):
  proc status_bar_layer_get_foreground_color*(
      status_bar_layer: ptr StatusBarLayer_603980842): GColor_603980564 {.cdecl,
      importc: "status_bar_layer_get_foreground_color".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_get_foreground_color" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_set_colors):
  proc status_bar_layer_set_colors*(status_bar_layer: ptr StatusBarLayer_603980842;
                                    background: GColor_603980564;
                                    foreground: GColor_603980564): void {.cdecl,
      importc: "status_bar_layer_set_colors".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_set_colors" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_set_separator_mode):
  proc status_bar_layer_set_separator_mode*(
      status_bar_layer: ptr StatusBarLayer_603980842;
      mode: StatusBarLayerSeparatorMode_603980846): void {.cdecl,
      importc: "status_bar_layer_set_separator_mode".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_set_separator_mode" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_create):
  proc bitmap_layer_create*(frame: GRect_603980576): ptr BitmapLayer_603980848 {.
      cdecl, importc: "bitmap_layer_create".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_create" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_destroy):
  proc bitmap_layer_destroy*(bitmap_layer: ptr BitmapLayer_603980848): void {.
      cdecl, importc: "bitmap_layer_destroy".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_destroy" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_get_layer):
  proc bitmap_layer_get_layer*(bitmap_layer: ptr BitmapLayer_603980848): ptr Layer_603980678 {.
      cdecl, importc: "bitmap_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_get_bitmap):
  proc bitmap_layer_get_bitmap*(bitmap_layer: ptr BitmapLayer_603980848): ptr GBitmap_603980582 {.
      cdecl, importc: "bitmap_layer_get_bitmap".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_get_bitmap" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_set_bitmap):
  proc bitmap_layer_set_bitmap*(bitmap_layer: ptr BitmapLayer_603980848;
                                bitmap: ptr GBitmap_603980582): void {.cdecl,
      importc: "bitmap_layer_set_bitmap".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_set_bitmap" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_set_alignment):
  proc bitmap_layer_set_alignment*(bitmap_layer: ptr BitmapLayer_603980848;
                                   alignment: GAlign_603980592): void {.cdecl,
      importc: "bitmap_layer_set_alignment".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_set_alignment" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_set_background_color):
  proc bitmap_layer_set_background_color*(bitmap_layer: ptr BitmapLayer_603980848;
      color: GColor_603980564): void {.cdecl, importc: "bitmap_layer_set_background_color".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_set_background_color" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_set_compositing_mode):
  proc bitmap_layer_set_compositing_mode*(bitmap_layer: ptr BitmapLayer_603980848;
      mode: GCompOp_603980596): void {.cdecl, importc: "bitmap_layer_set_compositing_mode".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_set_compositing_mode" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_layer_create):
  proc rot_bitmap_layer_create*(bitmap: ptr GBitmap_603980582): ptr RotBitmapLayer_603980850 {.
      cdecl, importc: "rot_bitmap_layer_create".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_layer_create" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_layer_destroy):
  proc rot_bitmap_layer_destroy*(bitmap: ptr RotBitmapLayer_603980850): void {.
      cdecl, importc: "rot_bitmap_layer_destroy".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_layer_destroy" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_layer_set_corner_clip_color):
  proc rot_bitmap_layer_set_corner_clip_color*(bitmap: ptr RotBitmapLayer_603980850;
      color: GColor_603980564): void {.cdecl, importc: "rot_bitmap_layer_set_corner_clip_color".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_layer_set_corner_clip_color" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_layer_set_angle):
  proc rot_bitmap_layer_set_angle*(bitmap: ptr RotBitmapLayer_603980850;
                                   angle: int32): void {.cdecl,
      importc: "rot_bitmap_layer_set_angle".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_layer_set_angle" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_layer_increment_angle):
  proc rot_bitmap_layer_increment_angle*(bitmap: ptr RotBitmapLayer_603980850;
      angle_change: int32): void {.cdecl,
                                   importc: "rot_bitmap_layer_increment_angle".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_layer_increment_angle" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_set_src_ic):
  proc rot_bitmap_set_src_ic*(bitmap: ptr RotBitmapLayer_603980850; ic: GPoint_603980568): void {.
      cdecl, importc: "rot_bitmap_set_src_ic".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_set_src_ic" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_set_compositing_mode):
  proc rot_bitmap_set_compositing_mode*(bitmap: ptr RotBitmapLayer_603980850;
                                        mode: GCompOp_603980596): void {.cdecl,
      importc: "rot_bitmap_set_compositing_mode".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_set_compositing_mode" &
        " already exists, not redeclaring")
when not declared(number_window_create):
  proc number_window_create*(label: cstring; callbacks: NumberWindowCallbacks_603980858;
                             callback_context: pointer): ptr NumberWindow_603980852 {.
      cdecl, importc: "number_window_create".}
else:
  static :
    hint("Declaration of " & "number_window_create" &
        " already exists, not redeclaring")
when not declared(number_window_destroy):
  proc number_window_destroy*(number_window: ptr NumberWindow_603980852): void {.
      cdecl, importc: "number_window_destroy".}
else:
  static :
    hint("Declaration of " & "number_window_destroy" &
        " already exists, not redeclaring")
when not declared(number_window_set_label):
  proc number_window_set_label*(numberwindow: ptr NumberWindow_603980852;
                                label: cstring): void {.cdecl,
      importc: "number_window_set_label".}
else:
  static :
    hint("Declaration of " & "number_window_set_label" &
        " already exists, not redeclaring")
when not declared(number_window_set_max):
  proc number_window_set_max*(numberwindow: ptr NumberWindow_603980852;
                              max: int32): void {.cdecl,
      importc: "number_window_set_max".}
else:
  static :
    hint("Declaration of " & "number_window_set_max" &
        " already exists, not redeclaring")
when not declared(number_window_set_min):
  proc number_window_set_min*(numberwindow: ptr NumberWindow_603980852;
                              min: int32): void {.cdecl,
      importc: "number_window_set_min".}
else:
  static :
    hint("Declaration of " & "number_window_set_min" &
        " already exists, not redeclaring")
when not declared(number_window_set_value):
  proc number_window_set_value*(numberwindow: ptr NumberWindow_603980852;
                                value: int32): void {.cdecl,
      importc: "number_window_set_value".}
else:
  static :
    hint("Declaration of " & "number_window_set_value" &
        " already exists, not redeclaring")
when not declared(number_window_set_step_size):
  proc number_window_set_step_size*(numberwindow: ptr NumberWindow_603980852;
                                    step: int32): void {.cdecl,
      importc: "number_window_set_step_size".}
else:
  static :
    hint("Declaration of " & "number_window_set_step_size" &
        " already exists, not redeclaring")
when not declared(number_window_get_value):
  proc number_window_get_value*(numberwindow: ptr NumberWindow_603980852): int32 {.
      cdecl, importc: "number_window_get_value".}
else:
  static :
    hint("Declaration of " & "number_window_get_value" &
        " already exists, not redeclaring")
when not declared(number_window_get_window):
  proc number_window_get_window*(numberwindow: ptr NumberWindow_603980852): ptr Window_603980682 {.
      cdecl, importc: "number_window_get_window".}
else:
  static :
    hint("Declaration of " & "number_window_get_window" &
        " already exists, not redeclaring")
when not declared(action_menu_item_get_label):
  proc action_menu_item_get_label*(item: ptr ActionMenuItem_603980860): cstring {.
      cdecl, importc: "action_menu_item_get_label".}
else:
  static :
    hint("Declaration of " & "action_menu_item_get_label" &
        " already exists, not redeclaring")
when not declared(action_menu_item_get_action_data):
  proc action_menu_item_get_action_data*(item: ptr ActionMenuItem_603980860): pointer {.
      cdecl, importc: "action_menu_item_get_action_data".}
else:
  static :
    hint("Declaration of " & "action_menu_item_get_action_data" &
        " already exists, not redeclaring")
when not declared(action_menu_level_create):
  proc action_menu_level_create*(max_items: uint16): ptr ActionMenuLevel_603980862 {.
      cdecl, importc: "action_menu_level_create".}
else:
  static :
    hint("Declaration of " & "action_menu_level_create" &
        " already exists, not redeclaring")
when not declared(action_menu_level_set_display_mode):
  proc action_menu_level_set_display_mode*(level: ptr ActionMenuLevel_603980862;
      display_mode: ActionMenuLevelDisplayMode_603980874): void {.cdecl,
      importc: "action_menu_level_set_display_mode".}
else:
  static :
    hint("Declaration of " & "action_menu_level_set_display_mode" &
        " already exists, not redeclaring")
when not declared(action_menu_level_add_action):
  proc action_menu_level_add_action*(level: ptr ActionMenuLevel_603980862;
                                     label: cstring;
                                     cb: ActionMenuPerformActionCb_603980876;
                                     action_data: pointer): ptr ActionMenuItem_603980860 {.
      cdecl, importc: "action_menu_level_add_action".}
else:
  static :
    hint("Declaration of " & "action_menu_level_add_action" &
        " already exists, not redeclaring")
when not declared(action_menu_level_add_child):
  proc action_menu_level_add_child*(level: ptr ActionMenuLevel_603980862;
                                    child: ptr ActionMenuLevel_603980862;
                                    label: cstring): ptr ActionMenuItem_603980860 {.
      cdecl, importc: "action_menu_level_add_child".}
else:
  static :
    hint("Declaration of " & "action_menu_level_add_child" &
        " already exists, not redeclaring")
when not declared(action_menu_hierarchy_destroy):
  proc action_menu_hierarchy_destroy*(root: ptr ActionMenuLevel_603980862;
                                      each_cb: ActionMenuEachItemCb_603980878;
                                      context: pointer): void {.cdecl,
      importc: "action_menu_hierarchy_destroy".}
else:
  static :
    hint("Declaration of " & "action_menu_hierarchy_destroy" &
        " already exists, not redeclaring")
when not declared(action_menu_get_context):
  proc action_menu_get_context*(action_menu: ptr ActionMenu_603980868): pointer {.
      cdecl, importc: "action_menu_get_context".}
else:
  static :
    hint("Declaration of " & "action_menu_get_context" &
        " already exists, not redeclaring")
when not declared(action_menu_get_root_level):
  proc action_menu_get_root_level*(action_menu: ptr ActionMenu_603980868): ptr ActionMenuLevel_603980862 {.
      cdecl, importc: "action_menu_get_root_level".}
else:
  static :
    hint("Declaration of " & "action_menu_get_root_level" &
        " already exists, not redeclaring")
when not declared(action_menu_open):
  proc action_menu_open*(config: ptr ActionMenuConfig_603980882): ptr ActionMenu_603980868 {.
      cdecl, importc: "action_menu_open".}
else:
  static :
    hint("Declaration of " & "action_menu_open" &
        " already exists, not redeclaring")
when not declared(action_menu_freeze):
  proc action_menu_freeze*(action_menu: ptr ActionMenu_603980868): void {.cdecl,
      importc: "action_menu_freeze".}
else:
  static :
    hint("Declaration of " & "action_menu_freeze" &
        " already exists, not redeclaring")
when not declared(action_menu_unfreeze):
  proc action_menu_unfreeze*(action_menu: ptr ActionMenu_603980868): void {.
      cdecl, importc: "action_menu_unfreeze".}
else:
  static :
    hint("Declaration of " & "action_menu_unfreeze" &
        " already exists, not redeclaring")
when not declared(action_menu_set_result_window):
  proc action_menu_set_result_window*(action_menu: ptr ActionMenu_603980868;
                                      result_window: ptr Window_603980682): void {.
      cdecl, importc: "action_menu_set_result_window".}
else:
  static :
    hint("Declaration of " & "action_menu_set_result_window" &
        " already exists, not redeclaring")
when not declared(action_menu_close):
  proc action_menu_close*(action_menu: ptr ActionMenu_603980868; animated: bool): void {.
      cdecl, importc: "action_menu_close".}
else:
  static :
    hint("Declaration of " & "action_menu_close" &
        " already exists, not redeclaring")
when not declared(vibes_cancel):
  proc vibes_cancel*(): void {.cdecl, importc: "vibes_cancel".}
else:
  static :
    hint("Declaration of " & "vibes_cancel" & " already exists, not redeclaring")
when not declared(vibes_short_pulse):
  proc vibes_short_pulse*(): void {.cdecl, importc: "vibes_short_pulse".}
else:
  static :
    hint("Declaration of " & "vibes_short_pulse" &
        " already exists, not redeclaring")
when not declared(vibes_long_pulse):
  proc vibes_long_pulse*(): void {.cdecl, importc: "vibes_long_pulse".}
else:
  static :
    hint("Declaration of " & "vibes_long_pulse" &
        " already exists, not redeclaring")
when not declared(vibes_double_pulse):
  proc vibes_double_pulse*(): void {.cdecl, importc: "vibes_double_pulse".}
else:
  static :
    hint("Declaration of " & "vibes_double_pulse" &
        " already exists, not redeclaring")
when not declared(vibes_enqueue_custom_pattern):
  proc vibes_enqueue_custom_pattern*(pattern: VibePattern_603980886): void {.
      cdecl, importc: "vibes_enqueue_custom_pattern".}
else:
  static :
    hint("Declaration of " & "vibes_enqueue_custom_pattern" &
        " already exists, not redeclaring")
when not declared(light_enable_interaction):
  proc light_enable_interaction*(): void {.cdecl,
      importc: "light_enable_interaction".}
else:
  static :
    hint("Declaration of " & "light_enable_interaction" &
        " already exists, not redeclaring")
when not declared(light_enable):
  proc light_enable*(enable: bool): void {.cdecl, importc: "light_enable".}
else:
  static :
    hint("Declaration of " & "light_enable" & " already exists, not redeclaring")
when not declared(preferred_result_display_duration):
  proc preferred_result_display_duration*(): uint32 {.cdecl,
      importc: "preferred_result_display_duration".}
else:
  static :
    hint("Declaration of " & "preferred_result_display_duration" &
        " already exists, not redeclaring")
when not declared(preferred_content_size):
  proc preferred_content_size*(): PreferredContentSize_603980890 {.cdecl,
      importc: "preferred_content_size".}
else:
  static :
    hint("Declaration of " & "preferred_content_size" &
        " already exists, not redeclaring")
when not declared(quiet_time_is_active):
  proc quiet_time_is_active*(): bool {.cdecl, importc: "quiet_time_is_active".}
else:
  static :
    hint("Declaration of " & "quiet_time_is_active" &
        " already exists, not redeclaring")
when not declared(strftime):
  proc strftime*(s: cstring; maxsize: csize_t; format: cstring;
                 tm_p: ptr struct_tm_603980291): csize_t {.cdecl,
      importc: "strftime".}
else:
  static :
    hint("Declaration of " & "strftime" & " already exists, not redeclaring")
when not declared(localtime):
  proc localtime*(timep: ptr time_t_603980313): ptr struct_tm_603980291 {.cdecl,
      importc: "localtime".}
else:
  static :
    hint("Declaration of " & "localtime" & " already exists, not redeclaring")
when not declared(gmtime):
  proc gmtime*(timep: ptr time_t_603980313): ptr struct_tm_603980291 {.cdecl,
      importc: "gmtime".}
else:
  static :
    hint("Declaration of " & "gmtime" & " already exists, not redeclaring")
when not declared(mktime):
  proc mktime*(tb: ptr struct_tm_603980291): time_t_603980313 {.cdecl,
      importc: "mktime".}
else:
  static :
    hint("Declaration of " & "mktime" & " already exists, not redeclaring")
when not declared(time):
  proc time*(tloc: ptr time_t_603980313): time_t_603980313 {.cdecl,
      importc: "time".}
else:
  static :
    hint("Declaration of " & "time" & " already exists, not redeclaring")
when not declared(difftime):
  proc difftime*(end_f: time_t_603980313; beginning: time_t_603980313): cdouble {.
      cdecl, importc: "difftime".}
else:
  static :
    hint("Declaration of " & "difftime" & " already exists, not redeclaring")
when not declared(time_ms):
  proc time_ms*(t_utc: ptr time_t_603980313; out_ms: ptr uint16): uint16 {.
      cdecl, importc: "time_ms".}
else:
  static :
    hint("Declaration of " & "time_ms" & " already exists, not redeclaring")
when not declared(time_start_of_today):
  proc time_start_of_today*(): time_t_603980313 {.cdecl,
      importc: "time_start_of_today".}
else:
  static :
    hint("Declaration of " & "time_start_of_today" &
        " already exists, not redeclaring")
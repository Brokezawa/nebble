
{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint, warning, newLit, getSize


when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

type
  enum_ButtonId_570425848* {.size: sizeof(cuint).} = enum
    BUTTON_ID_BACK = 0, BUTTON_ID_UP = 1, BUTTON_ID_SELECT = 2,
    BUTTON_ID_DOWN = 3, NUM_BUTTONS = 4
type
  enum_WatchInfoModel_570425852* {.size: sizeof(cuint).} = enum
    WATCH_INFO_MODEL_UNKNOWN = 0, WATCH_INFO_MODEL_PEBBLE_ORIGINAL = 1,
    WATCH_INFO_MODEL_PEBBLE_STEEL = 2, WATCH_INFO_MODEL_PEBBLE_TIME = 3,
    WATCH_INFO_MODEL_PEBBLE_TIME_STEEL = 4,
    WATCH_INFO_MODEL_PEBBLE_TIME_ROUND_14 = 5,
    WATCH_INFO_MODEL_PEBBLE_TIME_ROUND_20 = 6, WATCH_INFO_MODEL_PEBBLE_2_HR = 7,
    WATCH_INFO_MODEL_PEBBLE_2_SE = 8, WATCH_INFO_MODEL_PEBBLE_TIME_2 = 9,
    WATCH_INFO_MODEL_COREDEVICES_C2D = 10,
    WATCH_INFO_MODEL_COREDEVICES_CT2 = 11, WATCH_INFO_MODEL_MAX = 12
type
  enum_WatchInfoColor_570425856* {.size: sizeof(cuint).} = enum
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
    WATCH_INFO_COLOR_COREDEVICES_C2D_BLACK = 34,
    WATCH_INFO_COLOR_COREDEVICES_C2D_WHITE = 35,
    WATCH_INFO_COLOR_COREDEVICES_CT2_BLACK = 36, WATCH_INFO_COLOR_MAX = 37
type
  enum_WeekDay_570425864* {.size: sizeof(cuint).} = enum
    TODAY = 0, SUNDAY = 1, MONDAY = 2, TUESDAY = 3, WEDNESDAY = 4, THURSDAY = 5,
    FRIDAY = 6, SATURDAY = 7
type
  enum_PlatformType_570425870* {.size: sizeof(cuint).} = enum
    PlatformTypeAplite = 0, PlatformTypeBasalt = 1, PlatformTypeChalk = 2,
    PlatformTypeDiorite = 3, PlatformTypeEmery = 4, PlatformTypeFlint = 5
type
  enum_AccelAxisType_570425902* {.size: sizeof(cuint).} = enum
    ACCEL_AXIS_X = 0, ACCEL_AXIS_Y = 1, ACCEL_AXIS_Z = 2
type
  enum_AccelSamplingRate_570425912* {.size: sizeof(cuint).} = enum
    ACCEL_SAMPLING_10HZ = 10, ACCEL_SAMPLING_25HZ = 25,
    ACCEL_SAMPLING_50HZ = 50, ACCEL_SAMPLING_100HZ = 100
type
  enum_CompassStatus_570425916* {.size: sizeof(cint).} = enum
    CompassStatusUnavailable = -1, CompassStatusDataInvalid = 0,
    CompassStatusCalibrating = 1, CompassStatusCalibrated = 2
type
  enum_TimeUnits_570425935* {.size: sizeof(cuint).} = enum
    SECOND_UNIT = 1, MINUTE_UNIT = 2, HOUR_UNIT = 4, DAY_UNIT = 8,
    MONTH_UNIT = 16, YEAR_UNIT = 32
type
  enum_HealthMetric_570425941* {.size: sizeof(cuint).} = enum
    HealthMetricStepCount = 0, HealthMetricActiveSeconds = 1,
    HealthMetricWalkedDistanceMeters = 2, HealthMetricSleepSeconds = 3,
    HealthMetricSleepRestfulSeconds = 4, HealthMetricRestingKCalories = 5,
    HealthMetricActiveKCalories = 6, HealthMetricHeartRateBPM = 7,
    HealthMetricHeartRateRawBPM = 8
type
  enum_HealthServiceTimeScope_570425949* {.size: sizeof(cuint).} = enum
    HealthServiceTimeScopeOnce = 0, HealthServiceTimeScopeWeekly = 1,
    HealthServiceTimeScopeDailyWeekdayOrWeekend = 2,
    HealthServiceTimeScopeDaily = 3
type
  enum_HealthAggregation_570425953* {.size: sizeof(cuint).} = enum
    HealthAggregationSum = 0, HealthAggregationAvg = 1,
    HealthAggregationMin = 2, HealthAggregationMax = 3
type
  enum_HealthActivity_570425959* {.size: sizeof(cuint).} = enum
    HealthActivityNone = 0, HealthActivitySleep = 1,
    HealthActivityRestfulSleep = 2, HealthActivityWalk = 4,
    HealthActivityRun = 8, HealthActivityOpenWorkout = 16
type
  enum_HealthIterationDirection_570425965* {.size: sizeof(cuint).} = enum
    HealthIterationDirectionPast = 0, HealthIterationDirectionFuture = 1
type
  enum_HealthServiceAccessibilityMask_570425969* {.size: sizeof(cuint).} = enum
    HealthServiceAccessibilityMaskAvailable = 1,
    HealthServiceAccessibilityMaskNoPermission = 2,
    HealthServiceAccessibilityMaskNotSupported = 4,
    HealthServiceAccessibilityMaskNotAvailable = 8
type
  enum_HealthEventType_570425973* {.size: sizeof(cuint).} = enum
    HealthEventSignificantUpdate = 0, HealthEventMovementUpdate = 1,
    HealthEventSleepUpdate = 2, HealthEventMetricAlert = 3,
    HealthEventHeartRateUpdate = 4
type
  enum_AmbientLightLevel_570425979* {.size: sizeof(cuint).} = enum
    AmbientLightLevelUnknown = 0, AmbientLightLevelVeryDark = 1,
    AmbientLightLevelDark = 2, AmbientLightLevelLight = 3,
    AmbientLightLevelVeryLight = 4
type
  enum_MeasurementSystem_570425987* {.size: sizeof(cuint).} = enum
    MeasurementSystemUnknown = 0, MeasurementSystemMetric = 1,
    MeasurementSystemImperial = 2
type
  enum_DataLoggingItemType_570425993* {.size: sizeof(cuint).} = enum
    DATA_LOGGING_BYTE_ARRAY = 0, DATA_LOGGING_UINT = 2, DATA_LOGGING_INT = 3
type
  enum_DataLoggingResult_570425997* {.size: sizeof(cuint).} = enum
    DATA_LOGGING_SUCCESS = 0, DATA_LOGGING_BUSY = 1, DATA_LOGGING_FULL = 2,
    DATA_LOGGING_NOT_FOUND = 3, DATA_LOGGING_CLOSED = 4,
    DATA_LOGGING_INVALID_PARAMS = 5, DATA_LOGGING_INTERNAL_ERR = 6
type
  enum_AppLogLevel_570426005* {.size: sizeof(cuint).} = enum
    APP_LOG_LEVEL_ERROR = 1, APP_LOG_LEVEL_WARNING = 50,
    APP_LOG_LEVEL_INFO = 100, APP_LOG_LEVEL_DEBUG = 200,
    APP_LOG_LEVEL_DEBUG_VERBOSE = 255
type
  enum_DictionaryResult_570426009* {.size: sizeof(cuint).} = enum
    DICT_OK = 0, DICT_NOT_ENOUGH_STORAGE = 2, DICT_INVALID_ARGS = 4,
    DICT_INTERNAL_INCONSISTENCY = 8, DICT_MALLOC_FAILED = 16
type
  enum_TupleType_570426013* {.size: sizeof(cuint).} = enum
    TUPLE_BYTE_ARRAY = 0, TUPLE_CSTRING = 1, TUPLE_UINT = 2, TUPLE_INT = 3
type
  enum_DictationSessionStatus_570426037* {.size: sizeof(cuint).} = enum
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
  enum_AppMessageResult_570426043* {.size: sizeof(cuint).} = enum
    APP_MSG_OK = 0, APP_MSG_SEND_TIMEOUT = 2, APP_MSG_SEND_REJECTED = 4,
    APP_MSG_NOT_CONNECTED = 8, APP_MSG_APP_NOT_RUNNING = 16,
    APP_MSG_INVALID_ARGS = 32, APP_MSG_BUSY = 64, APP_MSG_BUFFER_OVERFLOW = 128,
    APP_MSG_ALREADY_RELEASED = 512, APP_MSG_CALLBACK_ALREADY_REGISTERED = 1024,
    APP_MSG_CALLBACK_NOT_REGISTERED = 2048, APP_MSG_OUT_OF_MEMORY = 4096,
    APP_MSG_CLOSED = 8192, APP_MSG_INTERNAL_ERROR = 16384,
    APP_MSG_INVALID_STATE = 32768
type
  enum_AppWorkerResult_570426065* {.size: sizeof(cuint).} = enum
    APP_WORKER_RESULT_SUCCESS = 0, APP_WORKER_RESULT_NO_WORKER = 1,
    APP_WORKER_RESULT_DIFFERENT_APP = 2, APP_WORKER_RESULT_NOT_RUNNING = 3,
    APP_WORKER_RESULT_ALREADY_RUNNING = 4,
    APP_WORKER_RESULT_ASKING_CONFIRMATION = 5
type
  enum_SniffInterval_570426075* {.size: sizeof(cuint).} = enum
    SNIFF_INTERVAL_NORMAL = 0, SNIFF_INTERVAL_REDUCED = 1
type
  enum_StatusCode_570426083* {.size: sizeof(cint).} = enum
    E_AGAIN = -12, E_BUSY = -11, E_INVALID_OPERATION = -10,
    E_DOES_NOT_EXIST = -9, E_RANGE = -8, E_OUT_OF_RESOURCES = -7,
    E_OUT_OF_STORAGE = -6, E_OUT_OF_MEMORY = -5, E_INVALID_ARGUMENT = -4,
    E_INTERNAL = -3, E_UNKNOWN = -2, E_ERROR = -1, S_SUCCESS = 0, S_TRUE = 1,
    S_NO_MORE_ITEMS = 2, S_NO_ACTION_REQUIRED = 3
when not declared(S_FALSE):
  const
    S_FALSE* = enum_StatusCode_570426083.S_SUCCESS
else:
  static :
    hint("Declaration of " & "S_FALSE" & " already exists, not redeclaring")
type
  enum_AppLaunchReason_570426093* {.size: sizeof(cuint).} = enum
    APP_LAUNCH_SYSTEM = 0, APP_LAUNCH_USER = 1, APP_LAUNCH_PHONE = 2,
    APP_LAUNCH_WAKEUP = 3, APP_LAUNCH_WORKER = 4, APP_LAUNCH_QUICK_LAUNCH = 5,
    APP_LAUNCH_TIMELINE_ACTION = 6, APP_LAUNCH_SMARTSTRAP = 7
type
  enum_AppExitReason_570426097* {.size: sizeof(cuint).} = enum
    APP_EXIT_NOT_SPECIFIED = 0, APP_EXIT_ACTION_PERFORMED_SUCCESSFULLY = 1,
    NUM_EXIT_REASONS = 2
type
  enum_AppGlanceResult_570426107* {.size: sizeof(cuint).} = enum
    APP_GLANCE_RESULT_SUCCESS = 0,
    APP_GLANCE_RESULT_INVALID_TEMPLATE_STRING = 1,
    APP_GLANCE_RESULT_TEMPLATE_STRING_TOO_LONG = 2,
    APP_GLANCE_RESULT_INVALID_ICON = 4,
    APP_GLANCE_RESULT_SLICE_CAPACITY_EXCEEDED = 8,
    APP_GLANCE_RESULT_EXPIRES_IN_THE_PAST = 16,
    APP_GLANCE_RESULT_INVALID_SESSION = 32
type
  enum_GBitmapFormat_570426133* {.size: sizeof(cuint).} = enum
    GBitmapFormat1Bit = 0, GBitmapFormat8Bit = 1, GBitmapFormat1BitPalette = 2,
    GBitmapFormat2BitPalette = 3, GBitmapFormat4BitPalette = 4,
    GBitmapFormat8BitCircular = 5
type
  enum_GAlign_570426145* {.size: sizeof(cuint).} = enum
    GAlignCenter = 0, GAlignTopLeft = 1, GAlignTopRight = 2, GAlignTop = 3,
    GAlignLeft = 4, GAlignBottom = 5, GAlignRight = 6, GAlignBottomRight = 7,
    GAlignBottomLeft = 8
type
  enum_GCompOp_570426149* {.size: sizeof(cuint).} = enum
    GCompOpAssign = 0, GCompOpAssignInverted = 1, GCompOpOr = 2, GCompOpAnd = 3,
    GCompOpClear = 4, GCompOpSet = 5
type
  enum_GCornerMask_570426159* {.size: sizeof(cuint).} = enum
    GCornerNone = 0, GCornerTopLeft = 1, GCornerTopRight = 2, GCornersTop = 3,
    GCornerBottomLeft = 4, GCornersLeft = 5, GCornerBottomRight = 8,
    GCornersRight = 10, GCornersBottom = 12, GCornersAll = 15
type
  enum_GOvalScaleMode_570426163* {.size: sizeof(cuint).} = enum
    GOvalScaleModeFitCircle = 0, GOvalScaleModeFillCircle = 1
type
  enum_GDrawCommandType_570426179* {.size: sizeof(cuint).} = enum
    GDrawCommandTypeInvalid = 0, GDrawCommandTypePath = 1,
    GDrawCommandTypeCircle = 2, GDrawCommandTypePrecisePath = 3
type
  enum_GTextOverflowMode_570426195* {.size: sizeof(cuint).} = enum
    GTextOverflowModeWordWrap = 0, GTextOverflowModeTrailingEllipsis = 1,
    GTextOverflowModeFill = 2
type
  enum_GTextAlignment_570426199* {.size: sizeof(cuint).} = enum
    GTextAlignmentLeft = 0, GTextAlignmentCenter = 1, GTextAlignmentRight = 2
type
  enum_SmartstrapResult_570426205* {.size: sizeof(cuint).} = enum
    SmartstrapResultOk = 0, SmartstrapResultInvalidArgs = 1,
    SmartstrapResultNotPresent = 2, SmartstrapResultBusy = 3,
    SmartstrapResultServiceUnavailable = 4,
    SmartstrapResultAttributeUnsupported = 5, SmartstrapResultTimeOut = 6
type
  enum_AnimationCurve_570426249* {.size: sizeof(cuint).} = enum
    AnimationCurveLinear = 0, AnimationCurveEaseIn = 1,
    AnimationCurveEaseOut = 2, AnimationCurveEaseInOut = 3,
    AnimationCurveCustomFunction = 4,
    AnimationCurveCustomInterpolationFunction = 5, AnimationCurve_Reserved1 = 6,
    AnimationCurve_Reserved2 = 7
when not declared(AnimationCurveDefault):
  const
    AnimationCurveDefault* = enum_AnimationCurve_570426249.AnimationCurveEaseInOut
else:
  static :
    hint("Declaration of " & "AnimationCurveDefault" &
        " already exists, not redeclaring")
type
  enum_ContentIndicatorDirection_570426329* {.size: sizeof(cuint).} = enum
    ContentIndicatorDirectionUp = 0, ContentIndicatorDirectionDown = 1,
    NumContentIndicatorDirections = 2
type
  enum_MenuRowAlign_570426375* {.size: sizeof(cuint).} = enum
    MenuRowAlignNone = 0, MenuRowAlignCenter = 1, MenuRowAlignTop = 2,
    MenuRowAlignBottom = 3
type
  enum_ActionBarLayerIconPressAnimation_570426391* {.size: sizeof(cuint).} = enum
    ActionBarLayerIconPressAnimationNone = 0,
    ActionBarLayerIconPressAnimationMoveLeft = 1,
    ActionBarLayerIconPressAnimationMoveUp = 2,
    ActionBarLayerIconPressAnimationMoveRight = 3,
    ActionBarLayerIconPressAnimationMoveDown = 4
type
  enum_StatusBarLayerSeparatorMode_570426399* {.size: sizeof(cuint).} = enum
    StatusBarLayerSeparatorModeNone = 0, StatusBarLayerSeparatorModeDotted = 1
type
  enum_ActionMenuAlign_570426419* {.size: sizeof(cuint).} = enum
    ActionMenuAlignTop = 0, ActionMenuAlignCenter = 1
type
  enum_ActionMenuLevelDisplayMode_570426427* {.size: sizeof(cuint).} = enum
    ActionMenuLevelDisplayModeWide = 0, ActionMenuLevelDisplayModeThin = 1
type
  enum_PreferredContentSize_570426443* {.size: sizeof(cuint).} = enum
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
when not declared(union_80047):
  type
    union_80047* = object
else:
  static :
    hint("Declaration of " & "union_80047" & " already exists, not redeclaring")
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
  tm_570425844 = struct_tm_570425847 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:37:19
  struct_tm_570425846 {.pure, inheritable, bycopy.} = object
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
  ButtonId_570425850 = enum_ButtonId_570425849 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:169:3
  WatchInfoModel_570425854 = enum_WatchInfoModel_570425853 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:219:3
  WatchInfoColor_570425858 = enum_WatchInfoColor_570425857 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:269:3
  struct_WatchInfoVersion_570425860 {.pure, inheritable, bycopy.} = object
    major*: uint8            ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:274:9
    minor*: uint8
    patch*: uint8
  WatchInfoVersion_570425862 = struct_WatchInfoVersion_570425861 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:278:3
  WeekDay_570425866 = enum_WeekDay_570425865 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:348:3
  time_t_570425868 = compiler_darwin_time_t_570426451 ## Generated based on /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_time_t.h:31:33
  PlatformType_570425872 = enum_PlatformType_570425871 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:400:3
  ConnectionHandler_570425874 = proc (a0: bool): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:449:16
  struct_ConnectionHandlers_570425876 {.pure, inheritable, bycopy.} = object
    pebble_app_connection_handler*: ConnectionHandler_570425875 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:451:9
    pebblekit_connection_handler*: ConnectionHandler_570425875
  ConnectionHandlers_570425878 = struct_ConnectionHandlers_570425877 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:458:3
  BluetoothConnectionHandler_570425880 = ConnectionHandler_570425875 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:483:27
  AppFocusHandler_570425882 = proc (a0: bool): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:521:16
  struct_AppFocusHandlers_570425884 {.pure, inheritable, bycopy.} = object
    will_focus*: AppFocusHandler_570425883 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:535:9
    did_focus*: AppFocusHandler_570425883
  AppFocusHandlers_570425886 = struct_AppFocusHandlers_570425885 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:549:3
  struct_BatteryChargeState_570425888 {.pure, inheritable, bycopy.} = object
    charge_percent*: uint8   ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:591:9
    is_charging*: bool
    is_plugged*: bool
  BatteryChargeState_570425890 = struct_BatteryChargeState_570425889 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:598:3
  BatteryStateHandler_570425892 = proc (a0: BatteryChargeState_570425891): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:602:16
  struct_AccelData_570425894 {.pure, inheritable, bycopy, packed.} = object
    x*: int16                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:634:44
    y*: int16
    z*: int16
    did_vibrate*: bool
    timestamp*: uint64
  AccelData_570425896 = struct_AccelData_570425895 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:647:3
  struct_AccelRawData_570425898 {.pure, inheritable, bycopy, packed.} = object
    x*: int16                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:650:9
    y*: int16
    z*: int16
  AccelRawData_570425900 = struct_AccelRawData_570425899 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:657:3
  AccelAxisType_570425904 = enum_AccelAxisType_570425903 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:670:3
  AccelDataHandler_570425906 = proc (a0: ptr AccelData_570425897; a1: uint32): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:675:16
  AccelRawDataHandler_570425908 = proc (a0: ptr AccelRawData_570425901;
                                        a1: uint32; a2: uint64): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:681:16
  AccelTapHandler_570425910 = proc (a0: AccelAxisType_570425905; a1: int32): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:686:16
  AccelSamplingRate_570425914 = enum_AccelSamplingRate_570425913 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:698:3
  CompassStatus_570425918 = enum_CompassStatus_570425917 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:777:3
  CompassHeading_570425920 = int32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:784:17
  struct_CompassHeadingData_570425922 {.pure, inheritable, bycopy.} = object
    magnetic_heading*: CompassHeading_570425921 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:787:9
    true_heading*: CompassHeading_570425921
    compass_status*: CompassStatus_570425919
    is_declination_valid*: bool
  CompassHeadingData_570425924 = struct_CompassHeadingData_570425923 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:798:3
  CompassHeadingHandler_570425926 = proc (a0: CompassHeadingData_570425925): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:802:16
  TimeUnits_570425937 = enum_TimeUnits_570425936 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:857:3
  TickHandler_570425939 = proc (a0: ptr struct_tm_570425847; a1: TimeUnits_570425938): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:862:16
  HealthMetric_570425943 = enum_HealthMetric_570425942 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:907:3
  HealthValue_570425945 = int32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:910:17
  HealthMetricAlert_570425947 = struct_HealthMetricAlert ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:914:34
  HealthServiceTimeScope_570425951 = enum_HealthServiceTimeScope_570425950 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:953:3
  HealthAggregation_570425955 = enum_HealthAggregation_570425954 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1002:3
  HealthActivityMask_570425957 = uint32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1052:18
  HealthActivity_570425961 = enum_HealthActivity_570425960 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1071:3
  HealthActivityIteratorCB_570425963 = proc (a0: HealthActivity_570425962;
      a1: time_t_570425869; a2: time_t_570425869; a3: pointer): bool {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1085:16
  HealthIterationDirection_570425967 = enum_HealthIterationDirection_570425966 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1098:3
  HealthServiceAccessibilityMask_570425971 = enum_HealthServiceAccessibilityMask_570425970 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1128:3
  HealthEventType_570425975 = enum_HealthEventType_570425974 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1206:3
  HealthEventHandler_570425977 = proc (a0: HealthEventType_570425976;
                                       a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1212:16
  AmbientLightLevel_570425981 = enum_AmbientLightLevel_570425980 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1295:3
  struct_HealthMinuteData_570425983 {.pure, inheritable, bycopy.} = object
    steps*: uint8            ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1304:9
    orientation*: uint8
    vmc*: uint16
    is_invalid* {.bitsize: 1'i64.}: bool
    light* {.bitsize: 3'i64.}: AmbientLightLevel_570425982
    padding* {.bitsize: 4'i64.}: uint8
    heart_rate_bpm*: uint8
    reserved*: array[6'i64, uint8]
  HealthMinuteData_570425985 = struct_HealthMinuteData_570425984 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1314:3
  MeasurementSystem_570425989 = enum_MeasurementSystem_570425988 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1350:3
  DataLoggingSessionRef_570425991 = pointer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1405:15
  DataLoggingItemType_570425995 = enum_DataLoggingItemType_570425994 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1418:3
  DataLoggingResult_570425999 = enum_DataLoggingResult_570425998 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1429:3
  struct_Uuid_570426001 {.pure, inheritable, bycopy, packed.} = object
    byte0*: uint8            ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1484:9
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
  Uuid_570426003 = struct_Uuid_570426002 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1501:3
  AppLogLevel_570426007 = enum_AppLogLevel_570426006 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1574:3
  DictionaryResult_570426011 = enum_DictionaryResult_570426010 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1683:3
  TupleType_570426015 = enum_TupleType_570426014 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1697:3
  struct_Tuple_anon0_t {.union, bycopy.} = object
    data*: array[0'i64, uint8]
    cstring*: array[0'i64, cschar]
    uint8*: uint8
    uint16*: uint16
    uint32*: uint32
    int8*: int8
    int16*: int16
    int32*: int32
  struct_Tuple_570426017 {.pure, inheritable, bycopy, packed.} = object
    key*: uint32             ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1702:9
    type_f* {.bitsize: 8'i64.}: TupleType_570426016
    length*: uint16
    anon0*: struct_Tuple_anon0_t
    value*: ptr UncheckedArray[union_80047]
  Tuple_f_570426019 = struct_Tuple_570426018 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1739:3
  Dictionary_570426021 = struct_Dictionary ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1742:27
  struct_DictionaryIterator_570426023 {.pure, inheritable, bycopy.} = object
    dictionary*: ptr Dictionary_570426022 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1749:9
    end_f*: pointer
    cursor*: ptr Tuple_f_570426020
  DictionaryIterator_570426025 = struct_DictionaryIterator_570426024 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1757:3
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
  struct_Tuplet_570426027 {.pure, inheritable, bycopy.} = object
    type_f*: TupleType_570426016 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1871:16
    key*: uint32
    anon0*: struct_Tuplet_anon0_t
  Tuplet_570426029 = struct_Tuplet_570426028 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1904:3
  DictionarySerializeCallback_570426031 = proc (a0: ptr uint8; a1: uint16;
      a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1930:16
  DictionaryKeyUpdatedCallback_570426033 = proc (a0: uint32; a1: ptr Tuple_f_570426020;
      a2: ptr Tuple_f_570426020; a3: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1991:16
  DictationSession_570426035 = struct_DictationSession ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2019:33
  DictationSessionStatus_570426039 = enum_DictationSessionStatus_570426038 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2048:3
  DictationSessionStatusCallback_570426041 = proc (a0: ptr DictationSession_570426036;
      a1: DictationSessionStatus_570426040; a2: cstring; a3: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2058:16
  AppMessageResult_570426045 = enum_AppMessageResult_570426044 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2253:3
  AppMessageInboxReceived_570426047 = proc (a0: ptr DictionaryIterator_570426026;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2285:16
  AppMessageInboxDropped_570426049 = proc (a0: AppMessageResult_570426046;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2299:16
  AppMessageOutboxSent_570426051 = proc (a0: ptr DictionaryIterator_570426026;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2311:16
  AppMessageOutboxFailed_570426053 = proc (a0: ptr DictionaryIterator_570426026;
      a1: AppMessageResult_570426046; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2331:16
  AppSyncTupleChangedCallback_570426055 = proc (a0: uint32; a1: ptr Tuple_f_570426020;
      a2: ptr Tuple_f_570426020; a3: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2508:16
  AppSyncErrorCallback_570426057 = proc (a0: DictionaryResult_570426012;
      a1: AppMessageResult_570426046; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2519:16
  struct_AppSync_anon0_t {.union, bycopy.} = object
    current*: ptr Dictionary_570426022
    buffer*: ptr uint8
  struct_AppSync_callback_t {.pure, inheritable, bycopy.} = object
    value_changed*: AppSyncTupleChangedCallback_570426056
    error*: AppSyncErrorCallback_570426058
    context*: pointer
  struct_AppSync_570426059 {.pure, inheritable, bycopy.} = object
    current_iter*: DictionaryIterator_570426026 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2524:16
    anon0*: struct_AppSync_anon0_t
    buffer_size*: uint16
    callback*: struct_AppSync_callback_t
  AppSync_570426061 = struct_AppSync_570426060 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2536:3
  ResHandle_570426063 = pointer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2718:16
  AppWorkerResult_570426067 = enum_AppWorkerResult_570426066 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2799:3
  struct_AppWorkerMessage_570426069 {.pure, inheritable, bycopy.} = object
    data0*: uint16           ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2802:9
    data1*: uint16
    data2*: uint16
  AppWorkerMessage_570426071 = struct_AppWorkerMessage_570426070 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2806:3
  AppWorkerMessageHandler_570426073 = proc (a0: uint16; a1: ptr AppWorkerMessage_570426072): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2825:16
  SniffInterval_570426077 = enum_SniffInterval_570426076 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2870:3
  AppTimer_570426079 = struct_AppTimer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2893:25
  AppTimerCallback_570426081 = proc (a0: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2897:16
  StatusCode_570426085 = enum_StatusCode_570426084 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3024:3
  status_t_570426087 = int32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3027:17
  WakeupId_570426089 = int32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3111:17
  WakeupHandler_570426091 = proc (a0: WakeupId_570426090; a1: int32): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3116:16
  AppLaunchReason_570426095 = enum_AppLaunchReason_570426094 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3188:3
  AppExitReason_570426099 = enum_AppExitReason_570426098 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3219:3
  PublishedId_570426101 = uint32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3233:18
  struct_AppGlanceSlice_layout_t {.pure, inheritable, bycopy.} = object
    icon*: PublishedId_570426102
    subtitle_template_string*: cstring
  struct_AppGlanceSlice_570426103 {.pure, inheritable, bycopy.} = object
    layout*: struct_AppGlanceSlice_layout_t ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3245:16
    expiration_time*: time_t_570425869
  AppGlanceSlice_570426105 = struct_AppGlanceSlice_570426104 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3258:3
  AppGlanceResult_570426109 = enum_AppGlanceResult_570426108 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3276:3
  AppGlanceReloadSession_570426111 = struct_AppGlanceReloadSession ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3279:39
  AppGlanceReloadCallback_570426113 = proc (a0: ptr AppGlanceReloadSession_570426112;
      a1: csize_t; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3293:16
  union_GColor8_anon0_t {.pure, inheritable, bycopy.} = object
    b* {.bitsize: 2'i64.}: uint8
    g* {.bitsize: 2'i64.}: uint8
    r* {.bitsize: 2'i64.}: uint8
    a* {.bitsize: 2'i64.}: uint8
  union_GColor8_570426115 {.union, bycopy.} = object
    argb*: uint8             ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3314:15
    anon0*: union_GColor8_anon0_t
  GColor8_570426117 = union_GColor8_570426116 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3322:3
  GColor_570426119 = GColor8_570426118 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3324:17
  struct_GPoint_570426121 {.pure, inheritable, bycopy.} = object
    x*: int16                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3362:16
    y*: int16
  GPoint_570426123 = struct_GPoint_570426122 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3367:3
  struct_GSize_570426125 {.pure, inheritable, bycopy.} = object
    w*: int16                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3382:16
    h*: int16
  GSize_570426127 = struct_GSize_570426126 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3387:3
  struct_GRect_570426129 {.pure, inheritable, bycopy.} = object
    origin*: GPoint_570426124 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3403:16
    size*: GSize_570426128
  GRect_570426131 = struct_GRect_570426130 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3408:3
  GBitmapFormat_570426135 = enum_GBitmapFormat_570426134 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3481:3
  GBitmap_570426137 = struct_GBitmap ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3484:24
  GBitmapSequence_570426139 = struct_GBitmapSequence ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3487:32
  struct_GBitmapDataRowInfo_570426141 {.pure, inheritable, bycopy.} = object
    data*: ptr uint8         ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3729:9
    min_x*: int16
    max_x*: int16
  GBitmapDataRowInfo_570426143 = struct_GBitmapDataRowInfo_570426142 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3744:3
  GAlign_570426147 = enum_GAlign_570426146 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3778:3
  GCompOp_570426151 = enum_GCompOp_570426150 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3843:3
  GContext_570426153 = struct_GContext ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3846:25
  struct_GEdgeInsets_570426155 {.pure, inheritable, bycopy.} = object
    top*: int16              ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3850:9
    right*: int16
    bottom*: int16
    left*: int16
  GEdgeInsets_570426157 = struct_GEdgeInsets_570426156 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3859:3
  GCornerMask_570426161 = enum_GCornerMask_570426160 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4022:3
  GOvalScaleMode_570426165 = enum_GOvalScaleMode_570426164 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4153:3
  GDrawCommand_570426167 = struct_GDrawCommand ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4253:29
  GDrawCommandFrame_570426169 = struct_GDrawCommandFrame ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4259:34
  GDrawCommandImage_570426171 = struct_GDrawCommandImage ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4263:34
  GDrawCommandList_570426173 = struct_GDrawCommandList ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4266:33
  GDrawCommandListIteratorCb_570426175 = proc (a0: ptr GDrawCommand_570426168;
      a1: uint32; a2: pointer): bool {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4273:16
  GDrawCommandSequence_570426177 = struct_GDrawCommandSequence ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4278:37
  GDrawCommandType_570426181 = enum_GDrawCommandType_570426180 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4285:3
  struct_GPathInfo_570426183 {.pure, inheritable, bycopy.} = object
    num_points*: uint32      ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4568:16
    points*: ptr GPoint_570426124
  GPathInfo_570426185 = struct_GPathInfo_570426184 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4573:3
  struct_GPath_570426187 {.pure, inheritable, bycopy.} = object
    num_points*: uint32      ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4577:16
    points*: ptr GPoint_570426124
    rotation*: int32
    offset*: GPoint_570426124
  GPath_570426189 = struct_GPath_570426188 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4588:3
  FontInfo_570426191 = struct_FontInfo ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4657:25
  GFont_570426193 = ptr FontInfo_570426192 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4663:19
  GTextOverflowMode_570426197 = enum_GTextOverflowMode_570426196 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4719:3
  GTextAlignment_570426201 = enum_GTextAlignment_570426200 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4731:3
  GTextAttributes_570426203 = struct_GTextAttributes ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4734:32
  SmartstrapResult_570426207 = enum_SmartstrapResult_570426206 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4862:3
  SmartstrapServiceId_570426209 = uint16 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4865:18
  SmartstrapAttributeId_570426211 = uint16 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4868:18
  SmartstrapAttribute_570426213 = struct_SmartstrapAttribute ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4872:36
  SmartstrapServiceAvailabilityHandler_570426215 = proc (
      a0: SmartstrapServiceId_570426210; a1: bool): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4877:16
  SmartstrapReadHandler_570426217 = proc (a0: ptr SmartstrapAttribute_570426214;
      a1: SmartstrapResult_570426208; a2: ptr uint8; a3: csize_t): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4887:16
  SmartstrapWriteHandler_570426219 = proc (a0: ptr SmartstrapAttribute_570426214;
      a1: SmartstrapResult_570426208): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4893:16
  SmartstrapNotifyHandler_570426221 = proc (a0: ptr SmartstrapAttribute_570426214): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4897:16
  struct_SmartstrapHandlers_570426223 {.pure, inheritable, bycopy.} = object
    availability_did_change*: SmartstrapServiceAvailabilityHandler_570426216 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4900:9
    did_read*: SmartstrapReadHandler_570426218
    did_write*: SmartstrapWriteHandler_570426220
    notified*: SmartstrapNotifyHandler_570426222
  SmartstrapHandlers_570426225 = struct_SmartstrapHandlers_570426224 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4909:3
  ClickRecognizerRef_570426227 = pointer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5018:15
  ClickHandler_570426229 = proc (a0: ClickRecognizerRef_570426228; a1: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5025:16
  ClickConfigProvider_570426231 = proc (a0: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5038:16
  Layer_570426233 = struct_Layer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5100:22
  LayerUpdateProc_570426235 = proc (a0: ptr struct_Layer; a1: ptr GContext_570426154): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5110:16
  Window_570426237 = struct_Window ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5327:23
  WindowHandler_570426239 = proc (a0: ptr struct_Window): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5332:16
  struct_WindowHandlers_570426241 {.pure, inheritable, bycopy.} = object
    load*: WindowHandler_570426240 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5339:16
    appear*: WindowHandler_570426240
    disappear*: WindowHandler_570426240
    unload*: WindowHandler_570426240
  WindowHandlers_570426243 = struct_WindowHandlers_570426242 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5358:3
  Animation_570426245 = struct_Animation ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5581:26
  AnimationProgress_570426247 = int32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5585:17
  AnimationCurve_570426251 = enum_AnimationCurve_570426250 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5606:3
  AnimationCurveFunction_570426253 = proc (a0: AnimationProgress_570426248): AnimationProgress_570426248 {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5781:29
  AnimationStartedHandler_570426255 = proc (a0: ptr Animation_570426246;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5805:16
  AnimationStoppedHandler_570426257 = proc (a0: ptr Animation_570426246;
      a1: bool; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5818:16
  struct_AnimationHandlers_570426259 {.pure, inheritable, bycopy.} = object
    started*: AnimationStartedHandler_570426256 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5823:16
    stopped*: AnimationStoppedHandler_570426258
  AnimationHandlers_570426261 = struct_AnimationHandlers_570426260 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5828:3
  AnimationSetupImplementation_570426263 = proc (a0: ptr Animation_570426246): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5895:16
  AnimationUpdateImplementation_570426265 = proc (a0: ptr Animation_570426246;
      a1: AnimationProgress_570426248): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5917:16
  AnimationTeardownImplementation_570426267 = proc (a0: ptr Animation_570426246): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5927:16
  struct_AnimationImplementation_570426269 {.pure, inheritable, bycopy.} = object
    setup*: AnimationSetupImplementation_570426264 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5944:16
    update*: AnimationUpdateImplementation_570426266
    teardown*: AnimationTeardownImplementation_570426268
  AnimationImplementation_570426271 = struct_AnimationImplementation_570426270 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5954:3
  PropertyAnimationAccessors_570426273 = struct_PropertyAnimationAccessors_570426276 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6259:3
  struct_PropertyAnimationAccessors_setter_t {.union, bycopy.} = object
    int16*: Int16Setter_570426288
    gpoint*: GPointSetter_570426296
    grect*: GRectSetter_570426300
    gcolor8*: GColor8Setter_570426304
    uint32*: UInt32Setter_570426292
  struct_PropertyAnimationAccessors_getter_t {.union, bycopy.} = object
    int16*: Int16Getter_570426290
    gpoint*: GPointGetter_570426298
    grect*: GRectGetter_570426302
    gcolor8*: GColor8Getter_570426306
    uint32*: UInt32Getter_570426294
  struct_PropertyAnimationAccessors_570426275 {.pure, inheritable, bycopy.} = object
    setter*: struct_PropertyAnimationAccessors_setter_t ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6227:16
    getter*: struct_PropertyAnimationAccessors_getter_t
  PropertyAnimationImplementation_570426277 = struct_PropertyAnimationImplementation_570426280 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6269:3
  struct_PropertyAnimationImplementation_570426279 {.pure, inheritable, bycopy.} = object
    base*: AnimationImplementation_570426272 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6264:16
    accessors*: PropertyAnimationAccessors_570426274
  PropertyAnimation_570426281 = struct_PropertyAnimation ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6036:34
  GPointReturn_570426283 = GPoint_570426124 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6160:16
  GRectReturn_570426285 = GRect_570426132 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6164:15
  Int16Setter_570426287 = proc (a0: pointer; a1: int16): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6169:16
  Int16Getter_570426289 = proc (a0: pointer): int16 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6175:19
  UInt32Setter_570426291 = proc (a0: pointer; a1: uint32): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6180:16
  UInt32Getter_570426293 = proc (a0: pointer): uint32 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6186:20
  GPointSetter_570426295 = proc (a0: pointer; a1: GPoint_570426124): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6191:16
  GPointGetter_570426297 = proc (a0: pointer): GPointReturn_570426284 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6196:24
  GRectSetter_570426299 = proc (a0: pointer; a1: GRect_570426132): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6201:16
  GRectGetter_570426301 = proc (a0: pointer): GRectReturn_570426286 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6206:23
  GColor8Setter_570426303 = proc (a0: pointer; a1: GColor8_570426118): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6211:16
  GColor8Getter_570426305 = proc (a0: pointer): GColor8_570426118 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6217:19
  UnobstructedAreaWillChangeHandler_570426307 = proc (a0: GRect_570426132;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6415:16
  UnobstructedAreaChangeHandler_570426309 = proc (a0: AnimationProgress_570426248;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6421:16
  UnobstructedAreaDidChangeHandler_570426311 = proc (a0: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6425:16
  struct_UnobstructedAreaHandlers_570426313 {.pure, inheritable, bycopy.} = object
    will_change*: UnobstructedAreaWillChangeHandler_570426308 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6427:16
    change*: UnobstructedAreaChangeHandler_570426310
    did_change*: UnobstructedAreaDidChangeHandler_570426312
  UnobstructedAreaHandlers_570426315 = struct_UnobstructedAreaHandlers_570426314 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6434:3
  TextLayer_570426317 = struct_TextLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6470:26
  ScrollLayer_570426319 = struct_ScrollLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6609:28
  ScrollLayerCallback_570426321 = proc (a0: ptr struct_ScrollLayer; a1: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6612:16
  struct_ScrollLayerCallbacks_570426323 {.pure, inheritable, bycopy.} = object
    click_config_provider*: ClickConfigProvider_570426232 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6617:16
    content_offset_changed_handler*: ScrollLayerCallback_570426322
  ScrollLayerCallbacks_570426325 = struct_ScrollLayerCallbacks_570426324 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6629:3
  ContentIndicator_570426327 = struct_ContentIndicator ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6782:33
  ContentIndicatorDirection_570426331 = enum_ContentIndicatorDirection_570426330 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6796:3
  struct_ContentIndicatorConfig_colors_t {.pure, inheritable, bycopy.} = object
    foreground*: GColor_570426120
    background*: GColor_570426120
  struct_ContentIndicatorConfig_570426333 {.pure, inheritable, bycopy.} = object
    layer*: ptr Layer_570426234 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6800:9
    times_out*: bool
    alignment*: GAlign_570426148
    colors*: struct_ContentIndicatorConfig_colors_t
  ContentIndicatorConfig_570426335 = struct_ContentIndicatorConfig_570426334 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6808:3
  struct_MenuIndex_570426337 {.pure, inheritable, bycopy.} = object
    section*: uint16         ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6923:16
    row*: uint16
  MenuIndex_570426339 = struct_MenuIndex_570426338 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6928:3
  struct_MenuCellSpan_570426341 {.pure, inheritable, bycopy.} = object
    y*: int16                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6940:16
    h*: int16
    sep*: int16
    index*: MenuIndex_570426340
  MenuCellSpan_570426343 = struct_MenuCellSpan_570426342 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6945:3
  MenuLayer_570426345 = struct_MenuLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6948:26
  MenuLayerGetNumberOfSectionsCallback_570426347 = proc (
      a0: ptr struct_MenuLayer; a1: pointer): uint16 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6956:20
  MenuLayerGetNumberOfRowsInSectionsCallback_570426349 = proc (
      a0: ptr struct_MenuLayer; a1: uint16; a2: pointer): uint16 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6968:20
  MenuLayerGetCellHeightCallback_570426351 = proc (a0: ptr struct_MenuLayer;
      a1: ptr MenuIndex_570426340; a2: pointer): int16 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6980:19
  MenuLayerGetHeaderHeightCallback_570426353 = proc (a0: ptr struct_MenuLayer;
      a1: uint16; a2: pointer): int16 {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:6993:19
  MenuLayerGetSeparatorHeightCallback_570426355 = proc (
      a0: ptr struct_MenuLayer; a1: ptr MenuIndex_570426340; a2: pointer): int16 {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7005:19
  MenuLayerDrawRowCallback_570426357 = proc (a0: ptr GContext_570426154;
      a1: ptr Layer_570426234; a2: ptr MenuIndex_570426340; a3: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7021:16
  MenuLayerDrawHeaderCallback_570426359 = proc (a0: ptr GContext_570426154;
      a1: ptr Layer_570426234; a2: uint16; a3: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7040:16
  MenuLayerDrawSeparatorCallback_570426361 = proc (a0: ptr GContext_570426154;
      a1: ptr Layer_570426234; a2: ptr MenuIndex_570426340; a3: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7057:16
  MenuLayerSelectCallback_570426363 = proc (a0: ptr struct_MenuLayer;
      a1: ptr MenuIndex_570426340; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7069:16
  MenuLayerSelectionChangedCallback_570426365 = proc (a0: ptr struct_MenuLayer;
      a1: MenuIndex_570426340; a2: MenuIndex_570426340; a3: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7081:16
  MenuLayerSelectionWillChangeCallback_570426367 = proc (
      a0: ptr struct_MenuLayer; a1: ptr MenuIndex_570426340; a2: MenuIndex_570426340;
      a3: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7095:16
  MenuLayerDrawBackgroundCallback_570426369 = proc (a0: ptr GContext_570426154;
      a1: ptr Layer_570426234; a2: bool; a3: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7107:16
  struct_MenuLayerCallbacks_570426371 {.pure, inheritable, bycopy.} = object
    get_num_sections*: MenuLayerGetNumberOfSectionsCallback_570426348 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7113:16
    get_num_rows*: MenuLayerGetNumberOfRowsInSectionsCallback_570426350
    get_cell_height*: MenuLayerGetCellHeightCallback_570426352
    get_header_height*: MenuLayerGetHeaderHeightCallback_570426354
    draw_row*: MenuLayerDrawRowCallback_570426358
    draw_header*: MenuLayerDrawHeaderCallback_570426360
    select_click*: MenuLayerSelectCallback_570426364
    select_long_click*: MenuLayerSelectCallback_570426364
    selection_changed*: MenuLayerSelectionChangedCallback_570426366
    get_separator_height*: MenuLayerGetSeparatorHeightCallback_570426356
    draw_separator*: MenuLayerDrawSeparatorCallback_570426362
    selection_will_change*: MenuLayerSelectionWillChangeCallback_570426368
    draw_background*: MenuLayerDrawBackgroundCallback_570426370
  MenuLayerCallbacks_570426373 = struct_MenuLayerCallbacks_570426372 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7190:3
  MenuRowAlign_570426377 = enum_MenuRowAlign_570426376 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7267:3
  SimpleMenuLayer_570426379 = struct_SimpleMenuLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7398:32
  SimpleMenuLayerSelectCallback_570426381 = proc (a0: cint; a1: pointer): void {.
      cdecl.}                ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7404:16
  struct_SimpleMenuItem_570426383 {.pure, inheritable, bycopy.} = object
    title*: cstring          ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7407:9
    subtitle*: cstring
    icon*: ptr GBitmap_570426138
    callback*: SimpleMenuLayerSelectCallback_570426382
  SimpleMenuItem_570426385 = struct_SimpleMenuItem_570426384 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7417:3
  struct_SimpleMenuSection_570426387 {.pure, inheritable, bycopy.} = object
    title*: cstring          ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7420:9
    items*: ptr SimpleMenuItem_570426386
    num_items*: uint32
  SimpleMenuSection_570426389 = struct_SimpleMenuSection_570426388 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7427:3
  ActionBarLayerIconPressAnimation_570426393 = enum_ActionBarLayerIconPressAnimation_570426392 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7567:3
  ActionBarLayer_570426395 = struct_ActionBarLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7570:31
  StatusBarLayer_570426397 = struct_StatusBarLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7704:31
  StatusBarLayerSeparatorMode_570426401 = enum_StatusBarLayerSeparatorMode_570426400 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7712:3
  BitmapLayer_570426403 = struct_BitmapLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7802:28
  RotBitmapLayer_570426405 = struct_RotBitmapLayer ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7899:31
  NumberWindow_570426407 = struct_NumberWindow ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7967:29
  NumberWindowCallback_570426409 = proc (a0: ptr struct_NumberWindow;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7970:16
  struct_NumberWindowCallbacks_570426411 {.pure, inheritable, bycopy.} = object
    incremented*: NumberWindowCallback_570426410 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7973:9
    decremented*: NumberWindowCallback_570426410
    selected*: NumberWindowCallback_570426410
  NumberWindowCallbacks_570426413 = struct_NumberWindowCallbacks_570426412 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7984:3
  ActionMenuItem_570426415 = struct_ActionMenuItem ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8047:31
  ActionMenuLevel_570426417 = struct_ActionMenuLevel ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8050:32
  ActionMenuAlign_570426421 = enum_ActionMenuAlign_570426420 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8055:3
  ActionMenu_570426423 = struct_ActionMenu ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8057:27
  ActionMenuDidCloseCb_570426425 = proc (a0: ptr ActionMenu_570426424;
      a1: ptr ActionMenuItem_570426416; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8064:16
  ActionMenuLevelDisplayMode_570426429 = enum_ActionMenuLevelDisplayMode_570426428 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8073:3
  ActionMenuPerformActionCb_570426431 = proc (a0: ptr ActionMenu_570426424;
      a1: ptr ActionMenuItem_570426416; a2: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8081:16
  ActionMenuEachItemCb_570426433 = proc (a0: ptr ActionMenuItem_570426416;
      a1: pointer): void {.cdecl.} ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8088:16
  struct_ActionMenuConfig_colors_t {.pure, inheritable, bycopy.} = object
    background*: GColor_570426120
    foreground*: GColor_570426120
  struct_ActionMenuConfig_570426435 {.pure, inheritable, bycopy.} = object
    root_level*: ptr ActionMenuLevel_570426418 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8091:9
    context*: pointer
    colors*: struct_ActionMenuConfig_colors_t
    will_close*: ActionMenuDidCloseCb_570426426
    did_close*: ActionMenuDidCloseCb_570426426
    align*: ActionMenuAlign_570426422
  ActionMenuConfig_570426437 = struct_ActionMenuConfig_570426436 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8101:3
  struct_VibePattern_570426439 {.pure, inheritable, bycopy.} = object
    durations*: ptr uint32   ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8234:9
    num_segments*: uint32
  VibePattern_570426441 = struct_VibePattern_570426440 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8244:3
  PreferredContentSize_570426445 = enum_PreferredContentSize_570426444 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8311:3
  compiler_darwin_time_t_570426450 = clong ## Generated based on /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:119:33
  SmartstrapNotifyHandler_570426222 = (when declared(SmartstrapNotifyHandler):
    when ownSizeof(SmartstrapNotifyHandler) !=
        ownSizeof(SmartstrapNotifyHandler_570426221):
      static :
        warning("Declaration of " & "SmartstrapNotifyHandler" &
            " exists but with different size")
    SmartstrapNotifyHandler
  else:
    SmartstrapNotifyHandler_570426221)
  enum_WeekDay_570425865 = (when declared(enum_WeekDay):
    when ownSizeof(enum_WeekDay) != ownSizeof(enum_WeekDay_570425864):
      static :
        warning("Declaration of " & "enum_WeekDay" &
            " exists but with different size")
    enum_WeekDay
  else:
    enum_WeekDay_570425864)
  Dictionary_570426022 = (when declared(Dictionary):
    when ownSizeof(Dictionary) != ownSizeof(Dictionary_570426021):
      static :
        warning("Declaration of " & "Dictionary" &
            " exists but with different size")
    Dictionary
  else:
    Dictionary_570426021)
  AnimationCurveFunction_570426254 = (when declared(AnimationCurveFunction):
    when ownSizeof(AnimationCurveFunction) != ownSizeof(AnimationCurveFunction_570426253):
      static :
        warning("Declaration of " & "AnimationCurveFunction" &
            " exists but with different size")
    AnimationCurveFunction
  else:
    AnimationCurveFunction_570426253)
  SimpleMenuItem_570426386 = (when declared(SimpleMenuItem):
    when ownSizeof(SimpleMenuItem) != ownSizeof(SimpleMenuItem_570426385):
      static :
        warning("Declaration of " & "SimpleMenuItem" &
            " exists but with different size")
    SimpleMenuItem
  else:
    SimpleMenuItem_570426385)
  SimpleMenuSection_570426390 = (when declared(SimpleMenuSection):
    when ownSizeof(SimpleMenuSection) != ownSizeof(SimpleMenuSection_570426389):
      static :
        warning("Declaration of " & "SimpleMenuSection" &
            " exists but with different size")
    SimpleMenuSection
  else:
    SimpleMenuSection_570426389)
  enum_TimeUnits_570425936 = (when declared(enum_TimeUnits):
    when ownSizeof(enum_TimeUnits) != ownSizeof(enum_TimeUnits_570425935):
      static :
        warning("Declaration of " & "enum_TimeUnits" &
            " exists but with different size")
    enum_TimeUnits
  else:
    enum_TimeUnits_570425935)
  HealthActivityMask_570425958 = (when declared(HealthActivityMask):
    when ownSizeof(HealthActivityMask) != ownSizeof(HealthActivityMask_570425957):
      static :
        warning("Declaration of " & "HealthActivityMask" &
            " exists but with different size")
    HealthActivityMask
  else:
    HealthActivityMask_570425957)
  GOvalScaleMode_570426166 = (when declared(GOvalScaleMode):
    when ownSizeof(GOvalScaleMode) != ownSizeof(GOvalScaleMode_570426165):
      static :
        warning("Declaration of " & "GOvalScaleMode" &
            " exists but with different size")
    GOvalScaleMode
  else:
    GOvalScaleMode_570426165)
  struct_AnimationHandlers_570426260 = (when declared(struct_AnimationHandlers):
    when ownSizeof(struct_AnimationHandlers) !=
        ownSizeof(struct_AnimationHandlers_570426259):
      static :
        warning("Declaration of " & "struct_AnimationHandlers" &
            " exists but with different size")
    struct_AnimationHandlers
  else:
    struct_AnimationHandlers_570426259)
  struct_SimpleMenuSection_570426388 = (when declared(struct_SimpleMenuSection):
    when ownSizeof(struct_SimpleMenuSection) !=
        ownSizeof(struct_SimpleMenuSection_570426387):
      static :
        warning("Declaration of " & "struct_SimpleMenuSection" &
            " exists but with different size")
    struct_SimpleMenuSection
  else:
    struct_SimpleMenuSection_570426387)
  struct_GPath_570426188 = (when declared(struct_GPath):
    when ownSizeof(struct_GPath) != ownSizeof(struct_GPath_570426187):
      static :
        warning("Declaration of " & "struct_GPath" &
            " exists but with different size")
    struct_GPath
  else:
    struct_GPath_570426187)
  enum_ButtonId_570425849 = (when declared(enum_ButtonId):
    when ownSizeof(enum_ButtonId) != ownSizeof(enum_ButtonId_570425848):
      static :
        warning("Declaration of " & "enum_ButtonId" &
            " exists but with different size")
    enum_ButtonId
  else:
    enum_ButtonId_570425848)
  FontInfo_570426192 = (when declared(FontInfo):
    when ownSizeof(FontInfo) != ownSizeof(FontInfo_570426191):
      static :
        warning("Declaration of " & "FontInfo" &
            " exists but with different size")
    FontInfo
  else:
    FontInfo_570426191)
  UInt32Getter_570426294 = (when declared(UInt32Getter):
    when ownSizeof(UInt32Getter) != ownSizeof(UInt32Getter_570426293):
      static :
        warning("Declaration of " & "UInt32Getter" &
            " exists but with different size")
    UInt32Getter
  else:
    UInt32Getter_570426293)
  BatteryChargeState_570425891 = (when declared(BatteryChargeState):
    when ownSizeof(BatteryChargeState) != ownSizeof(BatteryChargeState_570425890):
      static :
        warning("Declaration of " & "BatteryChargeState" &
            " exists but with different size")
    BatteryChargeState
  else:
    BatteryChargeState_570425890)
  AppSyncTupleChangedCallback_570426056 = (when declared(
      AppSyncTupleChangedCallback):
    when ownSizeof(AppSyncTupleChangedCallback) !=
        ownSizeof(AppSyncTupleChangedCallback_570426055):
      static :
        warning("Declaration of " & "AppSyncTupleChangedCallback" &
            " exists but with different size")
    AppSyncTupleChangedCallback
  else:
    AppSyncTupleChangedCallback_570426055)
  enum_SniffInterval_570426076 = (when declared(enum_SniffInterval):
    when ownSizeof(enum_SniffInterval) != ownSizeof(enum_SniffInterval_570426075):
      static :
        warning("Declaration of " & "enum_SniffInterval" &
            " exists but with different size")
    enum_SniffInterval
  else:
    enum_SniffInterval_570426075)
  GDrawCommandListIteratorCb_570426176 = (when declared(
      GDrawCommandListIteratorCb):
    when ownSizeof(GDrawCommandListIteratorCb) !=
        ownSizeof(GDrawCommandListIteratorCb_570426175):
      static :
        warning("Declaration of " & "GDrawCommandListIteratorCb" &
            " exists but with different size")
    GDrawCommandListIteratorCb
  else:
    GDrawCommandListIteratorCb_570426175)
  AnimationUpdateImplementation_570426266 = (when declared(
      AnimationUpdateImplementation):
    when ownSizeof(AnimationUpdateImplementation) !=
        ownSizeof(AnimationUpdateImplementation_570426265):
      static :
        warning("Declaration of " & "AnimationUpdateImplementation" &
            " exists but with different size")
    AnimationUpdateImplementation
  else:
    AnimationUpdateImplementation_570426265)
  ActionMenu_570426424 = (when declared(ActionMenu):
    when ownSizeof(ActionMenu) != ownSizeof(ActionMenu_570426423):
      static :
        warning("Declaration of " & "ActionMenu" &
            " exists but with different size")
    ActionMenu
  else:
    ActionMenu_570426423)
  MenuLayerSelectionChangedCallback_570426366 = (when declared(
      MenuLayerSelectionChangedCallback):
    when ownSizeof(MenuLayerSelectionChangedCallback) !=
        ownSizeof(MenuLayerSelectionChangedCallback_570426365):
      static :
        warning("Declaration of " & "MenuLayerSelectionChangedCallback" &
            " exists but with different size")
    MenuLayerSelectionChangedCallback
  else:
    MenuLayerSelectionChangedCallback_570426365)
  MenuLayerGetCellHeightCallback_570426352 = (when declared(
      MenuLayerGetCellHeightCallback):
    when ownSizeof(MenuLayerGetCellHeightCallback) !=
        ownSizeof(MenuLayerGetCellHeightCallback_570426351):
      static :
        warning("Declaration of " & "MenuLayerGetCellHeightCallback" &
            " exists but with different size")
    MenuLayerGetCellHeightCallback
  else:
    MenuLayerGetCellHeightCallback_570426351)
  enum_GCompOp_570426150 = (when declared(enum_GCompOp):
    when ownSizeof(enum_GCompOp) != ownSizeof(enum_GCompOp_570426149):
      static :
        warning("Declaration of " & "enum_GCompOp" &
            " exists but with different size")
    enum_GCompOp
  else:
    enum_GCompOp_570426149)
  MenuLayerSelectionWillChangeCallback_570426368 = (when declared(
      MenuLayerSelectionWillChangeCallback):
    when ownSizeof(MenuLayerSelectionWillChangeCallback) !=
        ownSizeof(MenuLayerSelectionWillChangeCallback_570426367):
      static :
        warning("Declaration of " & "MenuLayerSelectionWillChangeCallback" &
            " exists but with different size")
    MenuLayerSelectionWillChangeCallback
  else:
    MenuLayerSelectionWillChangeCallback_570426367)
  struct_PropertyAnimationAccessors_570426276 = (when declared(
      struct_PropertyAnimationAccessors):
    when ownSizeof(struct_PropertyAnimationAccessors) !=
        ownSizeof(struct_PropertyAnimationAccessors_570426275):
      static :
        warning("Declaration of " & "struct_PropertyAnimationAccessors" &
            " exists but with different size")
    struct_PropertyAnimationAccessors
  else:
    struct_PropertyAnimationAccessors_570426275)
  MenuLayerCallbacks_570426374 = (when declared(MenuLayerCallbacks):
    when ownSizeof(MenuLayerCallbacks) != ownSizeof(MenuLayerCallbacks_570426373):
      static :
        warning("Declaration of " & "MenuLayerCallbacks" &
            " exists but with different size")
    MenuLayerCallbacks
  else:
    MenuLayerCallbacks_570426373)
  HealthValue_570425946 = (when declared(HealthValue):
    when ownSizeof(HealthValue) != ownSizeof(HealthValue_570425945):
      static :
        warning("Declaration of " & "HealthValue" &
            " exists but with different size")
    HealthValue
  else:
    HealthValue_570425945)
  enum_WatchInfoColor_570425857 = (when declared(enum_WatchInfoColor):
    when ownSizeof(enum_WatchInfoColor) != ownSizeof(enum_WatchInfoColor_570425856):
      static :
        warning("Declaration of " & "enum_WatchInfoColor" &
            " exists but with different size")
    enum_WatchInfoColor
  else:
    enum_WatchInfoColor_570425856)
  AccelAxisType_570425905 = (when declared(AccelAxisType):
    when ownSizeof(AccelAxisType) != ownSizeof(AccelAxisType_570425904):
      static :
        warning("Declaration of " & "AccelAxisType" &
            " exists but with different size")
    AccelAxisType
  else:
    AccelAxisType_570425904)
  enum_DataLoggingResult_570425998 = (when declared(enum_DataLoggingResult):
    when ownSizeof(enum_DataLoggingResult) != ownSizeof(enum_DataLoggingResult_570425997):
      static :
        warning("Declaration of " & "enum_DataLoggingResult" &
            " exists but with different size")
    enum_DataLoggingResult
  else:
    enum_DataLoggingResult_570425997)
  AppExitReason_570426100 = (when declared(AppExitReason):
    when ownSizeof(AppExitReason) != ownSizeof(AppExitReason_570426099):
      static :
        warning("Declaration of " & "AppExitReason" &
            " exists but with different size")
    AppExitReason
  else:
    AppExitReason_570426099)
  PropertyAnimationImplementation_570426278 = (when declared(
      PropertyAnimationImplementation):
    when ownSizeof(PropertyAnimationImplementation) !=
        ownSizeof(PropertyAnimationImplementation_570426277):
      static :
        warning("Declaration of " & "PropertyAnimationImplementation" &
            " exists but with different size")
    PropertyAnimationImplementation
  else:
    PropertyAnimationImplementation_570426277)
  PropertyAnimation_570426282 = (when declared(PropertyAnimation):
    when ownSizeof(PropertyAnimation) != ownSizeof(PropertyAnimation_570426281):
      static :
        warning("Declaration of " & "PropertyAnimation" &
            " exists but with different size")
    PropertyAnimation
  else:
    PropertyAnimation_570426281)
  struct_WatchInfoVersion_570425861 = (when declared(struct_WatchInfoVersion):
    when ownSizeof(struct_WatchInfoVersion) !=
        ownSizeof(struct_WatchInfoVersion_570425860):
      static :
        warning("Declaration of " & "struct_WatchInfoVersion" &
            " exists but with different size")
    struct_WatchInfoVersion
  else:
    struct_WatchInfoVersion_570425860)
  NumberWindowCallbacks_570426414 = (when declared(NumberWindowCallbacks):
    when ownSizeof(NumberWindowCallbacks) != ownSizeof(NumberWindowCallbacks_570426413):
      static :
        warning("Declaration of " & "NumberWindowCallbacks" &
            " exists but with different size")
    NumberWindowCallbacks
  else:
    NumberWindowCallbacks_570426413)
  GDrawCommandFrame_570426170 = (when declared(GDrawCommandFrame):
    when ownSizeof(GDrawCommandFrame) != ownSizeof(GDrawCommandFrame_570426169):
      static :
        warning("Declaration of " & "GDrawCommandFrame" &
            " exists but with different size")
    GDrawCommandFrame
  else:
    GDrawCommandFrame_570426169)
  GBitmapDataRowInfo_570426144 = (when declared(GBitmapDataRowInfo):
    when ownSizeof(GBitmapDataRowInfo) != ownSizeof(GBitmapDataRowInfo_570426143):
      static :
        warning("Declaration of " & "GBitmapDataRowInfo" &
            " exists but with different size")
    GBitmapDataRowInfo
  else:
    GBitmapDataRowInfo_570426143)
  MenuLayerDrawRowCallback_570426358 = (when declared(MenuLayerDrawRowCallback):
    when ownSizeof(MenuLayerDrawRowCallback) !=
        ownSizeof(MenuLayerDrawRowCallback_570426357):
      static :
        warning("Declaration of " & "MenuLayerDrawRowCallback" &
            " exists but with different size")
    MenuLayerDrawRowCallback
  else:
    MenuLayerDrawRowCallback_570426357)
  struct_SimpleMenuItem_570426384 = (when declared(struct_SimpleMenuItem):
    when ownSizeof(struct_SimpleMenuItem) != ownSizeof(struct_SimpleMenuItem_570426383):
      static :
        warning("Declaration of " & "struct_SimpleMenuItem" &
            " exists but with different size")
    struct_SimpleMenuItem
  else:
    struct_SimpleMenuItem_570426383)
  Layer_570426234 = (when declared(Layer):
    when ownSizeof(Layer) != ownSizeof(Layer_570426233):
      static :
        warning("Declaration of " & "Layer" & " exists but with different size")
    Layer
  else:
    Layer_570426233)
  struct_AppFocusHandlers_570425885 = (when declared(struct_AppFocusHandlers):
    when ownSizeof(struct_AppFocusHandlers) !=
        ownSizeof(struct_AppFocusHandlers_570425884):
      static :
        warning("Declaration of " & "struct_AppFocusHandlers" &
            " exists but with different size")
    struct_AppFocusHandlers
  else:
    struct_AppFocusHandlers_570425884)
  AnimationImplementation_570426272 = (when declared(AnimationImplementation):
    when ownSizeof(AnimationImplementation) !=
        ownSizeof(AnimationImplementation_570426271):
      static :
        warning("Declaration of " & "AnimationImplementation" &
            " exists but with different size")
    AnimationImplementation
  else:
    AnimationImplementation_570426271)
  enum_ActionBarLayerIconPressAnimation_570426392 = (when declared(
      enum_ActionBarLayerIconPressAnimation):
    when ownSizeof(enum_ActionBarLayerIconPressAnimation) !=
        ownSizeof(enum_ActionBarLayerIconPressAnimation_570426391):
      static :
        warning("Declaration of " & "enum_ActionBarLayerIconPressAnimation" &
            " exists but with different size")
    enum_ActionBarLayerIconPressAnimation
  else:
    enum_ActionBarLayerIconPressAnimation_570426391)
  HealthActivity_570425962 = (when declared(HealthActivity):
    when ownSizeof(HealthActivity) != ownSizeof(HealthActivity_570425961):
      static :
        warning("Declaration of " & "HealthActivity" &
            " exists but with different size")
    HealthActivity
  else:
    HealthActivity_570425961)
  GColor8_570426118 = (when declared(GColor8):
    when ownSizeof(GColor8) != ownSizeof(GColor8_570426117):
      static :
        warning("Declaration of " & "GColor8" &
            " exists but with different size")
    GColor8
  else:
    GColor8_570426117)
  struct_Tuplet_570426028 = (when declared(struct_Tuplet):
    when ownSizeof(struct_Tuplet) != ownSizeof(struct_Tuplet_570426027):
      static :
        warning("Declaration of " & "struct_Tuplet" &
            " exists but with different size")
    struct_Tuplet
  else:
    struct_Tuplet_570426027)
  DictationSessionStatusCallback_570426042 = (when declared(
      DictationSessionStatusCallback):
    when ownSizeof(DictationSessionStatusCallback) !=
        ownSizeof(DictationSessionStatusCallback_570426041):
      static :
        warning("Declaration of " & "DictationSessionStatusCallback" &
            " exists but with different size")
    DictationSessionStatusCallback
  else:
    DictationSessionStatusCallback_570426041)
  DictionarySerializeCallback_570426032 = (when declared(
      DictionarySerializeCallback):
    when ownSizeof(DictionarySerializeCallback) !=
        ownSizeof(DictionarySerializeCallback_570426031):
      static :
        warning("Declaration of " & "DictionarySerializeCallback" &
            " exists but with different size")
    DictionarySerializeCallback
  else:
    DictionarySerializeCallback_570426031)
  GColor8Getter_570426306 = (when declared(GColor8Getter):
    when ownSizeof(GColor8Getter) != ownSizeof(GColor8Getter_570426305):
      static :
        warning("Declaration of " & "GColor8Getter" &
            " exists but with different size")
    GColor8Getter
  else:
    GColor8Getter_570426305)
  ResHandle_570426064 = (when declared(ResHandle):
    when ownSizeof(ResHandle) != ownSizeof(ResHandle_570426063):
      static :
        warning("Declaration of " & "ResHandle" &
            " exists but with different size")
    ResHandle
  else:
    ResHandle_570426063)
  enum_HealthServiceAccessibilityMask_570425970 = (when declared(
      enum_HealthServiceAccessibilityMask):
    when ownSizeof(enum_HealthServiceAccessibilityMask) !=
        ownSizeof(enum_HealthServiceAccessibilityMask_570425969):
      static :
        warning("Declaration of " & "enum_HealthServiceAccessibilityMask" &
            " exists but with different size")
    enum_HealthServiceAccessibilityMask
  else:
    enum_HealthServiceAccessibilityMask_570425969)
  Int16Setter_570426288 = (when declared(Int16Setter):
    when ownSizeof(Int16Setter) != ownSizeof(Int16Setter_570426287):
      static :
        warning("Declaration of " & "Int16Setter" &
            " exists but with different size")
    Int16Setter
  else:
    Int16Setter_570426287)
  MeasurementSystem_570425990 = (when declared(MeasurementSystem):
    when ownSizeof(MeasurementSystem) != ownSizeof(MeasurementSystem_570425989):
      static :
        warning("Declaration of " & "MeasurementSystem" &
            " exists but with different size")
    MeasurementSystem
  else:
    MeasurementSystem_570425989)
  ScrollLayerCallbacks_570426326 = (when declared(ScrollLayerCallbacks):
    when ownSizeof(ScrollLayerCallbacks) != ownSizeof(ScrollLayerCallbacks_570426325):
      static :
        warning("Declaration of " & "ScrollLayerCallbacks" &
            " exists but with different size")
    ScrollLayerCallbacks
  else:
    ScrollLayerCallbacks_570426325)
  ContentIndicatorConfig_570426336 = (when declared(ContentIndicatorConfig):
    when ownSizeof(ContentIndicatorConfig) != ownSizeof(ContentIndicatorConfig_570426335):
      static :
        warning("Declaration of " & "ContentIndicatorConfig" &
            " exists but with different size")
    ContentIndicatorConfig
  else:
    ContentIndicatorConfig_570426335)
  ActionMenuConfig_570426438 = (when declared(ActionMenuConfig):
    when ownSizeof(ActionMenuConfig) != ownSizeof(ActionMenuConfig_570426437):
      static :
        warning("Declaration of " & "ActionMenuConfig" &
            " exists but with different size")
    ActionMenuConfig
  else:
    ActionMenuConfig_570426437)
  struct_AppSync_570426060 = (when declared(struct_AppSync):
    when ownSizeof(struct_AppSync) != ownSizeof(struct_AppSync_570426059):
      static :
        warning("Declaration of " & "struct_AppSync" &
            " exists but with different size")
    struct_AppSync
  else:
    struct_AppSync_570426059)
  AppGlanceResult_570426110 = (when declared(AppGlanceResult):
    when ownSizeof(AppGlanceResult) != ownSizeof(AppGlanceResult_570426109):
      static :
        warning("Declaration of " & "AppGlanceResult" &
            " exists but with different size")
    AppGlanceResult
  else:
    AppGlanceResult_570426109)
  AppSync_570426062 = (when declared(AppSync):
    when ownSizeof(AppSync) != ownSizeof(AppSync_570426061):
      static :
        warning("Declaration of " & "AppSync" &
            " exists but with different size")
    AppSync
  else:
    AppSync_570426061)
  WatchInfoModel_570425855 = (when declared(WatchInfoModel):
    when ownSizeof(WatchInfoModel) != ownSizeof(WatchInfoModel_570425854):
      static :
        warning("Declaration of " & "WatchInfoModel" &
            " exists but with different size")
    WatchInfoModel
  else:
    WatchInfoModel_570425854)
  ConnectionHandler_570425875 = (when declared(ConnectionHandler):
    when ownSizeof(ConnectionHandler) != ownSizeof(ConnectionHandler_570425874):
      static :
        warning("Declaration of " & "ConnectionHandler" &
            " exists but with different size")
    ConnectionHandler
  else:
    ConnectionHandler_570425874)
  GTextOverflowMode_570426198 = (when declared(GTextOverflowMode):
    when ownSizeof(GTextOverflowMode) != ownSizeof(GTextOverflowMode_570426197):
      static :
        warning("Declaration of " & "GTextOverflowMode" &
            " exists but with different size")
    GTextOverflowMode
  else:
    GTextOverflowMode_570426197)
  MenuLayerGetNumberOfSectionsCallback_570426348 = (when declared(
      MenuLayerGetNumberOfSectionsCallback):
    when ownSizeof(MenuLayerGetNumberOfSectionsCallback) !=
        ownSizeof(MenuLayerGetNumberOfSectionsCallback_570426347):
      static :
        warning("Declaration of " & "MenuLayerGetNumberOfSectionsCallback" &
            " exists but with different size")
    MenuLayerGetNumberOfSectionsCallback
  else:
    MenuLayerGetNumberOfSectionsCallback_570426347)
  AppLogLevel_570426008 = (when declared(AppLogLevel):
    when ownSizeof(AppLogLevel) != ownSizeof(AppLogLevel_570426007):
      static :
        warning("Declaration of " & "AppLogLevel" &
            " exists but with different size")
    AppLogLevel
  else:
    AppLogLevel_570426007)
  enum_AccelSamplingRate_570425913 = (when declared(enum_AccelSamplingRate):
    when ownSizeof(enum_AccelSamplingRate) != ownSizeof(enum_AccelSamplingRate_570425912):
      static :
        warning("Declaration of " & "enum_AccelSamplingRate" &
            " exists but with different size")
    enum_AccelSamplingRate
  else:
    enum_AccelSamplingRate_570425912)
  HealthServiceTimeScope_570425952 = (when declared(HealthServiceTimeScope):
    when ownSizeof(HealthServiceTimeScope) != ownSizeof(HealthServiceTimeScope_570425951):
      static :
        warning("Declaration of " & "HealthServiceTimeScope" &
            " exists but with different size")
    HealthServiceTimeScope
  else:
    HealthServiceTimeScope_570425951)
  AnimationHandlers_570426262 = (when declared(AnimationHandlers):
    when ownSizeof(AnimationHandlers) != ownSizeof(AnimationHandlers_570426261):
      static :
        warning("Declaration of " & "AnimationHandlers" &
            " exists but with different size")
    AnimationHandlers
  else:
    AnimationHandlers_570426261)
  struct_AnimationImplementation_570426270 = (when declared(
      struct_AnimationImplementation):
    when ownSizeof(struct_AnimationImplementation) !=
        ownSizeof(struct_AnimationImplementation_570426269):
      static :
        warning("Declaration of " & "struct_AnimationImplementation" &
            " exists but with different size")
    struct_AnimationImplementation
  else:
    struct_AnimationImplementation_570426269)
  GPointSetter_570426296 = (when declared(GPointSetter):
    when ownSizeof(GPointSetter) != ownSizeof(GPointSetter_570426295):
      static :
        warning("Declaration of " & "GPointSetter" &
            " exists but with different size")
    GPointSetter
  else:
    GPointSetter_570426295)
  HealthMinuteData_570425986 = (when declared(HealthMinuteData):
    when ownSizeof(HealthMinuteData) != ownSizeof(HealthMinuteData_570425985):
      static :
        warning("Declaration of " & "HealthMinuteData" &
            " exists but with different size")
    HealthMinuteData
  else:
    HealthMinuteData_570425985)
  AccelDataHandler_570425907 = (when declared(AccelDataHandler):
    when ownSizeof(AccelDataHandler) != ownSizeof(AccelDataHandler_570425906):
      static :
        warning("Declaration of " & "AccelDataHandler" &
            " exists but with different size")
    AccelDataHandler
  else:
    AccelDataHandler_570425906)
  MenuLayerGetNumberOfRowsInSectionsCallback_570426350 = (when declared(
      MenuLayerGetNumberOfRowsInSectionsCallback):
    when ownSizeof(MenuLayerGetNumberOfRowsInSectionsCallback) !=
        ownSizeof(MenuLayerGetNumberOfRowsInSectionsCallback_570426349):
      static :
        warning("Declaration of " & "MenuLayerGetNumberOfRowsInSectionsCallback" &
            " exists but with different size")
    MenuLayerGetNumberOfRowsInSectionsCallback
  else:
    MenuLayerGetNumberOfRowsInSectionsCallback_570426349)
  enum_StatusBarLayerSeparatorMode_570426400 = (when declared(
      enum_StatusBarLayerSeparatorMode):
    when ownSizeof(enum_StatusBarLayerSeparatorMode) !=
        ownSizeof(enum_StatusBarLayerSeparatorMode_570426399):
      static :
        warning("Declaration of " & "enum_StatusBarLayerSeparatorMode" &
            " exists but with different size")
    enum_StatusBarLayerSeparatorMode
  else:
    enum_StatusBarLayerSeparatorMode_570426399)
  enum_GTextOverflowMode_570426196 = (when declared(enum_GTextOverflowMode):
    when ownSizeof(enum_GTextOverflowMode) != ownSizeof(enum_GTextOverflowMode_570426195):
      static :
        warning("Declaration of " & "enum_GTextOverflowMode" &
            " exists but with different size")
    enum_GTextOverflowMode
  else:
    enum_GTextOverflowMode_570426195)
  enum_HealthMetric_570425942 = (when declared(enum_HealthMetric):
    when ownSizeof(enum_HealthMetric) != ownSizeof(enum_HealthMetric_570425941):
      static :
        warning("Declaration of " & "enum_HealthMetric" &
            " exists but with different size")
    enum_HealthMetric
  else:
    enum_HealthMetric_570425941)
  HealthAggregation_570425956 = (when declared(HealthAggregation):
    when ownSizeof(HealthAggregation) != ownSizeof(HealthAggregation_570425955):
      static :
        warning("Declaration of " & "HealthAggregation" &
            " exists but with different size")
    HealthAggregation
  else:
    HealthAggregation_570425955)
  enum_MenuRowAlign_570426376 = (when declared(enum_MenuRowAlign):
    when ownSizeof(enum_MenuRowAlign) != ownSizeof(enum_MenuRowAlign_570426375):
      static :
        warning("Declaration of " & "enum_MenuRowAlign" &
            " exists but with different size")
    enum_MenuRowAlign
  else:
    enum_MenuRowAlign_570426375)
  Int16Getter_570426290 = (when declared(Int16Getter):
    when ownSizeof(Int16Getter) != ownSizeof(Int16Getter_570426289):
      static :
        warning("Declaration of " & "Int16Getter" &
            " exists but with different size")
    Int16Getter
  else:
    Int16Getter_570426289)
  enum_StatusCode_570426084 = (when declared(enum_StatusCode):
    when ownSizeof(enum_StatusCode) != ownSizeof(enum_StatusCode_570426083):
      static :
        warning("Declaration of " & "enum_StatusCode" &
            " exists but with different size")
    enum_StatusCode
  else:
    enum_StatusCode_570426083)
  WindowHandler_570426240 = (when declared(WindowHandler):
    when ownSizeof(WindowHandler) != ownSizeof(WindowHandler_570426239):
      static :
        warning("Declaration of " & "WindowHandler" &
            " exists but with different size")
    WindowHandler
  else:
    WindowHandler_570426239)
  enum_PreferredContentSize_570426444 = (when declared(enum_PreferredContentSize):
    when ownSizeof(enum_PreferredContentSize) !=
        ownSizeof(enum_PreferredContentSize_570426443):
      static :
        warning("Declaration of " & "enum_PreferredContentSize" &
            " exists but with different size")
    enum_PreferredContentSize
  else:
    enum_PreferredContentSize_570426443)
  WatchInfoColor_570425859 = (when declared(WatchInfoColor):
    when ownSizeof(WatchInfoColor) != ownSizeof(WatchInfoColor_570425858):
      static :
        warning("Declaration of " & "WatchInfoColor" &
            " exists but with different size")
    WatchInfoColor
  else:
    WatchInfoColor_570425858)
  ButtonId_570425851 = (when declared(ButtonId):
    when ownSizeof(ButtonId) != ownSizeof(ButtonId_570425850):
      static :
        warning("Declaration of " & "ButtonId" &
            " exists but with different size")
    ButtonId
  else:
    ButtonId_570425850)
  enum_CompassStatus_570425917 = (when declared(enum_CompassStatus):
    when ownSizeof(enum_CompassStatus) != ownSizeof(enum_CompassStatus_570425916):
      static :
        warning("Declaration of " & "enum_CompassStatus" &
            " exists but with different size")
    enum_CompassStatus
  else:
    enum_CompassStatus_570425916)
  enum_TupleType_570426014 = (when declared(enum_TupleType):
    when ownSizeof(enum_TupleType) != ownSizeof(enum_TupleType_570426013):
      static :
        warning("Declaration of " & "enum_TupleType" &
            " exists but with different size")
    enum_TupleType
  else:
    enum_TupleType_570426013)
  ScrollLayer_570426320 = (when declared(ScrollLayer):
    when ownSizeof(ScrollLayer) != ownSizeof(ScrollLayer_570426319):
      static :
        warning("Declaration of " & "ScrollLayer" &
            " exists but with different size")
    ScrollLayer
  else:
    ScrollLayer_570426319)
  GPoint_570426124 = (when declared(GPoint):
    when ownSizeof(GPoint) != ownSizeof(GPoint_570426123):
      static :
        warning("Declaration of " & "GPoint" & " exists but with different size")
    GPoint
  else:
    GPoint_570426123)
  struct_GRect_570426130 = (when declared(struct_GRect):
    when ownSizeof(struct_GRect) != ownSizeof(struct_GRect_570426129):
      static :
        warning("Declaration of " & "struct_GRect" &
            " exists but with different size")
    struct_GRect
  else:
    struct_GRect_570426129)
  AppFocusHandler_570425883 = (when declared(AppFocusHandler):
    when ownSizeof(AppFocusHandler) != ownSizeof(AppFocusHandler_570425882):
      static :
        warning("Declaration of " & "AppFocusHandler" &
            " exists but with different size")
    AppFocusHandler
  else:
    AppFocusHandler_570425882)
  SmartstrapServiceAvailabilityHandler_570426216 = (when declared(
      SmartstrapServiceAvailabilityHandler):
    when ownSizeof(SmartstrapServiceAvailabilityHandler) !=
        ownSizeof(SmartstrapServiceAvailabilityHandler_570426215):
      static :
        warning("Declaration of " & "SmartstrapServiceAvailabilityHandler" &
            " exists but with different size")
    SmartstrapServiceAvailabilityHandler
  else:
    SmartstrapServiceAvailabilityHandler_570426215)
  GRectGetter_570426302 = (when declared(GRectGetter):
    when ownSizeof(GRectGetter) != ownSizeof(GRectGetter_570426301):
      static :
        warning("Declaration of " & "GRectGetter" &
            " exists but with different size")
    GRectGetter
  else:
    GRectGetter_570426301)
  struct_UnobstructedAreaHandlers_570426314 = (when declared(
      struct_UnobstructedAreaHandlers):
    when ownSizeof(struct_UnobstructedAreaHandlers) !=
        ownSizeof(struct_UnobstructedAreaHandlers_570426313):
      static :
        warning("Declaration of " & "struct_UnobstructedAreaHandlers" &
            " exists but with different size")
    struct_UnobstructedAreaHandlers
  else:
    struct_UnobstructedAreaHandlers_570426313)
  GSize_570426128 = (when declared(GSize):
    when ownSizeof(GSize) != ownSizeof(GSize_570426127):
      static :
        warning("Declaration of " & "GSize" & " exists but with different size")
    GSize
  else:
    GSize_570426127)
  MenuLayerDrawHeaderCallback_570426360 = (when declared(
      MenuLayerDrawHeaderCallback):
    when ownSizeof(MenuLayerDrawHeaderCallback) !=
        ownSizeof(MenuLayerDrawHeaderCallback_570426359):
      static :
        warning("Declaration of " & "MenuLayerDrawHeaderCallback" &
            " exists but with different size")
    MenuLayerDrawHeaderCallback
  else:
    MenuLayerDrawHeaderCallback_570426359)
  GColor_570426120 = (when declared(GColor):
    when ownSizeof(GColor) != ownSizeof(GColor_570426119):
      static :
        warning("Declaration of " & "GColor" & " exists but with different size")
    GColor
  else:
    GColor_570426119)
  struct_WindowHandlers_570426242 = (when declared(struct_WindowHandlers):
    when ownSizeof(struct_WindowHandlers) != ownSizeof(struct_WindowHandlers_570426241):
      static :
        warning("Declaration of " & "struct_WindowHandlers" &
            " exists but with different size")
    struct_WindowHandlers
  else:
    struct_WindowHandlers_570426241)
  GCornerMask_570426162 = (when declared(GCornerMask):
    when ownSizeof(GCornerMask) != ownSizeof(GCornerMask_570426161):
      static :
        warning("Declaration of " & "GCornerMask" &
            " exists but with different size")
    GCornerMask
  else:
    GCornerMask_570426161)
  enum_AppGlanceResult_570426108 = (when declared(enum_AppGlanceResult):
    when ownSizeof(enum_AppGlanceResult) != ownSizeof(enum_AppGlanceResult_570426107):
      static :
        warning("Declaration of " & "enum_AppGlanceResult" &
            " exists but with different size")
    enum_AppGlanceResult
  else:
    enum_AppGlanceResult_570426107)
  BluetoothConnectionHandler_570425881 = (when declared(
      BluetoothConnectionHandler):
    when ownSizeof(BluetoothConnectionHandler) !=
        ownSizeof(BluetoothConnectionHandler_570425880):
      static :
        warning("Declaration of " & "BluetoothConnectionHandler" &
            " exists but with different size")
    BluetoothConnectionHandler
  else:
    BluetoothConnectionHandler_570425880)
  enum_HealthServiceTimeScope_570425950 = (when declared(
      enum_HealthServiceTimeScope):
    when ownSizeof(enum_HealthServiceTimeScope) !=
        ownSizeof(enum_HealthServiceTimeScope_570425949):
      static :
        warning("Declaration of " & "enum_HealthServiceTimeScope" &
            " exists but with different size")
    enum_HealthServiceTimeScope
  else:
    enum_HealthServiceTimeScope_570425949)
  HealthActivityIteratorCB_570425964 = (when declared(HealthActivityIteratorCB):
    when ownSizeof(HealthActivityIteratorCB) !=
        ownSizeof(HealthActivityIteratorCB_570425963):
      static :
        warning("Declaration of " & "HealthActivityIteratorCB" &
            " exists but with different size")
    HealthActivityIteratorCB
  else:
    HealthActivityIteratorCB_570425963)
  AppTimerCallback_570426082 = (when declared(AppTimerCallback):
    when ownSizeof(AppTimerCallback) != ownSizeof(AppTimerCallback_570426081):
      static :
        warning("Declaration of " & "AppTimerCallback" &
            " exists but with different size")
    AppTimerCallback
  else:
    AppTimerCallback_570426081)
  enum_AppExitReason_570426098 = (when declared(enum_AppExitReason):
    when ownSizeof(enum_AppExitReason) != ownSizeof(enum_AppExitReason_570426097):
      static :
        warning("Declaration of " & "enum_AppExitReason" &
            " exists but with different size")
    enum_AppExitReason
  else:
    enum_AppExitReason_570426097)
  AccelData_570425897 = (when declared(AccelData):
    when ownSizeof(AccelData) != ownSizeof(AccelData_570425896):
      static :
        warning("Declaration of " & "AccelData" &
            " exists but with different size")
    AccelData
  else:
    AccelData_570425896)
  struct_GPoint_570426122 = (when declared(struct_GPoint):
    when ownSizeof(struct_GPoint) != ownSizeof(struct_GPoint_570426121):
      static :
        warning("Declaration of " & "struct_GPoint" &
            " exists but with different size")
    struct_GPoint
  else:
    struct_GPoint_570426121)
  enum_AnimationCurve_570426250 = (when declared(enum_AnimationCurve):
    when ownSizeof(enum_AnimationCurve) != ownSizeof(enum_AnimationCurve_570426249):
      static :
        warning("Declaration of " & "enum_AnimationCurve" &
            " exists but with different size")
    enum_AnimationCurve
  else:
    enum_AnimationCurve_570426249)
  ContentIndicatorDirection_570426332 = (when declared(ContentIndicatorDirection):
    when ownSizeof(ContentIndicatorDirection) !=
        ownSizeof(ContentIndicatorDirection_570426331):
      static :
        warning("Declaration of " & "ContentIndicatorDirection" &
            " exists but with different size")
    ContentIndicatorDirection
  else:
    ContentIndicatorDirection_570426331)
  struct_ScrollLayerCallbacks_570426324 = (when declared(
      struct_ScrollLayerCallbacks):
    when ownSizeof(struct_ScrollLayerCallbacks) !=
        ownSizeof(struct_ScrollLayerCallbacks_570426323):
      static :
        warning("Declaration of " & "struct_ScrollLayerCallbacks" &
            " exists but with different size")
    struct_ScrollLayerCallbacks
  else:
    struct_ScrollLayerCallbacks_570426323)
  GRectReturn_570426286 = (when declared(GRectReturn):
    when ownSizeof(GRectReturn) != ownSizeof(GRectReturn_570426285):
      static :
        warning("Declaration of " & "GRectReturn" &
            " exists but with different size")
    GRectReturn
  else:
    GRectReturn_570426285)
  GAlign_570426148 = (when declared(GAlign):
    when ownSizeof(GAlign) != ownSizeof(GAlign_570426147):
      static :
        warning("Declaration of " & "GAlign" & " exists but with different size")
    GAlign
  else:
    GAlign_570426147)
  ClickRecognizerRef_570426228 = (when declared(ClickRecognizerRef):
    when ownSizeof(ClickRecognizerRef) != ownSizeof(ClickRecognizerRef_570426227):
      static :
        warning("Declaration of " & "ClickRecognizerRef" &
            " exists but with different size")
    ClickRecognizerRef
  else:
    ClickRecognizerRef_570426227)
  struct_Uuid_570426002 = (when declared(struct_Uuid):
    when ownSizeof(struct_Uuid) != ownSizeof(struct_Uuid_570426001):
      static :
        warning("Declaration of " & "struct_Uuid" &
            " exists but with different size")
    struct_Uuid
  else:
    struct_Uuid_570426001)
  struct_AccelData_570425895 = (when declared(struct_AccelData):
    when ownSizeof(struct_AccelData) != ownSizeof(struct_AccelData_570425894):
      static :
        warning("Declaration of " & "struct_AccelData" &
            " exists but with different size")
    struct_AccelData
  else:
    struct_AccelData_570425894)
  AmbientLightLevel_570425982 = (when declared(AmbientLightLevel):
    when ownSizeof(AmbientLightLevel) != ownSizeof(AmbientLightLevel_570425981):
      static :
        warning("Declaration of " & "AmbientLightLevel" &
            " exists but with different size")
    AmbientLightLevel
  else:
    AmbientLightLevel_570425981)
  tm_570425845 = (when declared(tm):
    when ownSizeof(tm) != ownSizeof(tm_570425844):
      static :
        warning("Declaration of " & "tm" & " exists but with different size")
    tm
  else:
    tm_570425844)
  SmartstrapAttribute_570426214 = (when declared(SmartstrapAttribute):
    when ownSizeof(SmartstrapAttribute) != ownSizeof(SmartstrapAttribute_570426213):
      static :
        warning("Declaration of " & "SmartstrapAttribute" &
            " exists but with different size")
    SmartstrapAttribute
  else:
    SmartstrapAttribute_570426213)
  DictionaryKeyUpdatedCallback_570426034 = (when declared(
      DictionaryKeyUpdatedCallback):
    when ownSizeof(DictionaryKeyUpdatedCallback) !=
        ownSizeof(DictionaryKeyUpdatedCallback_570426033):
      static :
        warning("Declaration of " & "DictionaryKeyUpdatedCallback" &
            " exists but with different size")
    DictionaryKeyUpdatedCallback
  else:
    DictionaryKeyUpdatedCallback_570426033)
  struct_GEdgeInsets_570426156 = (when declared(struct_GEdgeInsets):
    when ownSizeof(struct_GEdgeInsets) != ownSizeof(struct_GEdgeInsets_570426155):
      static :
        warning("Declaration of " & "struct_GEdgeInsets" &
            " exists but with different size")
    struct_GEdgeInsets
  else:
    struct_GEdgeInsets_570426155)
  TextLayer_570426318 = (when declared(TextLayer):
    when ownSizeof(TextLayer) != ownSizeof(TextLayer_570426317):
      static :
        warning("Declaration of " & "TextLayer" &
            " exists but with different size")
    TextLayer
  else:
    TextLayer_570426317)
  enum_HealthEventType_570425974 = (when declared(enum_HealthEventType):
    when ownSizeof(enum_HealthEventType) != ownSizeof(enum_HealthEventType_570425973):
      static :
        warning("Declaration of " & "enum_HealthEventType" &
            " exists but with different size")
    enum_HealthEventType
  else:
    enum_HealthEventType_570425973)
  struct_AppWorkerMessage_570426070 = (when declared(struct_AppWorkerMessage):
    when ownSizeof(struct_AppWorkerMessage) !=
        ownSizeof(struct_AppWorkerMessage_570426069):
      static :
        warning("Declaration of " & "struct_AppWorkerMessage" &
            " exists but with different size")
    struct_AppWorkerMessage
  else:
    struct_AppWorkerMessage_570426069)
  AppMessageResult_570426046 = (when declared(AppMessageResult):
    when ownSizeof(AppMessageResult) != ownSizeof(AppMessageResult_570426045):
      static :
        warning("Declaration of " & "AppMessageResult" &
            " exists but with different size")
    AppMessageResult
  else:
    AppMessageResult_570426045)
  MenuLayerDrawBackgroundCallback_570426370 = (when declared(
      MenuLayerDrawBackgroundCallback):
    when ownSizeof(MenuLayerDrawBackgroundCallback) !=
        ownSizeof(MenuLayerDrawBackgroundCallback_570426369):
      static :
        warning("Declaration of " & "MenuLayerDrawBackgroundCallback" &
            " exists but with different size")
    MenuLayerDrawBackgroundCallback
  else:
    MenuLayerDrawBackgroundCallback_570426369)
  AccelTapHandler_570425911 = (when declared(AccelTapHandler):
    when ownSizeof(AccelTapHandler) != ownSizeof(AccelTapHandler_570425910):
      static :
        warning("Declaration of " & "AccelTapHandler" &
            " exists but with different size")
    AccelTapHandler
  else:
    AccelTapHandler_570425910)
  enum_GCornerMask_570426160 = (when declared(enum_GCornerMask):
    when ownSizeof(enum_GCornerMask) != ownSizeof(enum_GCornerMask_570426159):
      static :
        warning("Declaration of " & "enum_GCornerMask" &
            " exists but with different size")
    enum_GCornerMask
  else:
    enum_GCornerMask_570426159)
  PublishedId_570426102 = (when declared(PublishedId):
    when ownSizeof(PublishedId) != ownSizeof(PublishedId_570426101):
      static :
        warning("Declaration of " & "PublishedId" &
            " exists but with different size")
    PublishedId
  else:
    PublishedId_570426101)
  Tuple_f_570426020 = (when declared(Tuple_f):
    when ownSizeof(Tuple_f) != ownSizeof(Tuple_f_570426019):
      static :
        warning("Declaration of " & "Tuple_f" &
            " exists but with different size")
    Tuple_f
  else:
    Tuple_f_570426019)
  UnobstructedAreaWillChangeHandler_570426308 = (when declared(
      UnobstructedAreaWillChangeHandler):
    when ownSizeof(UnobstructedAreaWillChangeHandler) !=
        ownSizeof(UnobstructedAreaWillChangeHandler_570426307):
      static :
        warning("Declaration of " & "UnobstructedAreaWillChangeHandler" &
            " exists but with different size")
    UnobstructedAreaWillChangeHandler
  else:
    UnobstructedAreaWillChangeHandler_570426307)
  AppGlanceReloadSession_570426112 = (when declared(AppGlanceReloadSession):
    when ownSizeof(AppGlanceReloadSession) != ownSizeof(AppGlanceReloadSession_570426111):
      static :
        warning("Declaration of " & "AppGlanceReloadSession" &
            " exists but with different size")
    AppGlanceReloadSession
  else:
    AppGlanceReloadSession_570426111)
  ActionMenuLevel_570426418 = (when declared(ActionMenuLevel):
    when ownSizeof(ActionMenuLevel) != ownSizeof(ActionMenuLevel_570426417):
      static :
        warning("Declaration of " & "ActionMenuLevel" &
            " exists but with different size")
    ActionMenuLevel
  else:
    ActionMenuLevel_570426417)
  GContext_570426154 = (when declared(GContext):
    when ownSizeof(GContext) != ownSizeof(GContext_570426153):
      static :
        warning("Declaration of " & "GContext" &
            " exists but with different size")
    GContext
  else:
    GContext_570426153)
  SmartstrapServiceId_570426210 = (when declared(SmartstrapServiceId):
    when ownSizeof(SmartstrapServiceId) != ownSizeof(SmartstrapServiceId_570426209):
      static :
        warning("Declaration of " & "SmartstrapServiceId" &
            " exists but with different size")
    SmartstrapServiceId
  else:
    SmartstrapServiceId_570426209)
  AnimationTeardownImplementation_570426268 = (when declared(
      AnimationTeardownImplementation):
    when ownSizeof(AnimationTeardownImplementation) !=
        ownSizeof(AnimationTeardownImplementation_570426267):
      static :
        warning("Declaration of " & "AnimationTeardownImplementation" &
            " exists but with different size")
    AnimationTeardownImplementation
  else:
    AnimationTeardownImplementation_570426267)
  Tuplet_570426030 = (when declared(Tuplet):
    when ownSizeof(Tuplet) != ownSizeof(Tuplet_570426029):
      static :
        warning("Declaration of " & "Tuplet" & " exists but with different size")
    Tuplet
  else:
    Tuplet_570426029)
  struct_CompassHeadingData_570425923 = (when declared(struct_CompassHeadingData):
    when ownSizeof(struct_CompassHeadingData) !=
        ownSizeof(struct_CompassHeadingData_570425922):
      static :
        warning("Declaration of " & "struct_CompassHeadingData" &
            " exists but with different size")
    struct_CompassHeadingData
  else:
    struct_CompassHeadingData_570425922)
  StatusBarLayerSeparatorMode_570426402 = (when declared(
      StatusBarLayerSeparatorMode):
    when ownSizeof(StatusBarLayerSeparatorMode) !=
        ownSizeof(StatusBarLayerSeparatorMode_570426401):
      static :
        warning("Declaration of " & "StatusBarLayerSeparatorMode" &
            " exists but with different size")
    StatusBarLayerSeparatorMode
  else:
    StatusBarLayerSeparatorMode_570426401)
  struct_Tuple_570426018 = (when declared(struct_Tuple):
    when ownSizeof(struct_Tuple) != ownSizeof(struct_Tuple_570426017):
      static :
        warning("Declaration of " & "struct_Tuple" &
            " exists but with different size")
    struct_Tuple
  else:
    struct_Tuple_570426017)
  AppFocusHandlers_570425887 = (when declared(AppFocusHandlers):
    when ownSizeof(AppFocusHandlers) != ownSizeof(AppFocusHandlers_570425886):
      static :
        warning("Declaration of " & "AppFocusHandlers" &
            " exists but with different size")
    AppFocusHandlers
  else:
    AppFocusHandlers_570425886)
  enum_DictionaryResult_570426010 = (when declared(enum_DictionaryResult):
    when ownSizeof(enum_DictionaryResult) != ownSizeof(enum_DictionaryResult_570426009):
      static :
        warning("Declaration of " & "enum_DictionaryResult" &
            " exists but with different size")
    enum_DictionaryResult
  else:
    enum_DictionaryResult_570426009)
  TickHandler_570425940 = (when declared(TickHandler):
    when ownSizeof(TickHandler) != ownSizeof(TickHandler_570425939):
      static :
        warning("Declaration of " & "TickHandler" &
            " exists but with different size")
    TickHandler
  else:
    TickHandler_570425939)
  HealthIterationDirection_570425968 = (when declared(HealthIterationDirection):
    when ownSizeof(HealthIterationDirection) !=
        ownSizeof(HealthIterationDirection_570425967):
      static :
        warning("Declaration of " & "HealthIterationDirection" &
            " exists but with different size")
    HealthIterationDirection
  else:
    HealthIterationDirection_570425967)
  struct_DictionaryIterator_570426024 = (when declared(struct_DictionaryIterator):
    when ownSizeof(struct_DictionaryIterator) !=
        ownSizeof(struct_DictionaryIterator_570426023):
      static :
        warning("Declaration of " & "struct_DictionaryIterator" &
            " exists but with different size")
    struct_DictionaryIterator
  else:
    struct_DictionaryIterator_570426023)
  TimeUnits_570425938 = (when declared(TimeUnits):
    when ownSizeof(TimeUnits) != ownSizeof(TimeUnits_570425937):
      static :
        warning("Declaration of " & "TimeUnits" &
            " exists but with different size")
    TimeUnits
  else:
    TimeUnits_570425937)
  enum_AppLaunchReason_570426094 = (when declared(enum_AppLaunchReason):
    when ownSizeof(enum_AppLaunchReason) != ownSizeof(enum_AppLaunchReason_570426093):
      static :
        warning("Declaration of " & "enum_AppLaunchReason" &
            " exists but with different size")
    enum_AppLaunchReason
  else:
    enum_AppLaunchReason_570426093)
  ClickHandler_570426230 = (when declared(ClickHandler):
    when ownSizeof(ClickHandler) != ownSizeof(ClickHandler_570426229):
      static :
        warning("Declaration of " & "ClickHandler" &
            " exists but with different size")
    ClickHandler
  else:
    ClickHandler_570426229)
  MenuLayerSelectCallback_570426364 = (when declared(MenuLayerSelectCallback):
    when ownSizeof(MenuLayerSelectCallback) !=
        ownSizeof(MenuLayerSelectCallback_570426363):
      static :
        warning("Declaration of " & "MenuLayerSelectCallback" &
            " exists but with different size")
    MenuLayerSelectCallback
  else:
    MenuLayerSelectCallback_570426363)
  NumberWindowCallback_570426410 = (when declared(NumberWindowCallback):
    when ownSizeof(NumberWindowCallback) != ownSizeof(NumberWindowCallback_570426409):
      static :
        warning("Declaration of " & "NumberWindowCallback" &
            " exists but with different size")
    NumberWindowCallback
  else:
    NumberWindowCallback_570426409)
  AppMessageInboxDropped_570426050 = (when declared(AppMessageInboxDropped):
    when ownSizeof(AppMessageInboxDropped) != ownSizeof(AppMessageInboxDropped_570426049):
      static :
        warning("Declaration of " & "AppMessageInboxDropped" &
            " exists but with different size")
    AppMessageInboxDropped
  else:
    AppMessageInboxDropped_570426049)
  struct_SmartstrapHandlers_570426224 = (when declared(struct_SmartstrapHandlers):
    when ownSizeof(struct_SmartstrapHandlers) !=
        ownSizeof(struct_SmartstrapHandlers_570426223):
      static :
        warning("Declaration of " & "struct_SmartstrapHandlers" &
            " exists but with different size")
    struct_SmartstrapHandlers
  else:
    struct_SmartstrapHandlers_570426223)
  struct_MenuCellSpan_570426342 = (when declared(struct_MenuCellSpan):
    when ownSizeof(struct_MenuCellSpan) != ownSizeof(struct_MenuCellSpan_570426341):
      static :
        warning("Declaration of " & "struct_MenuCellSpan" &
            " exists but with different size")
    struct_MenuCellSpan
  else:
    struct_MenuCellSpan_570426341)
  AppLaunchReason_570426096 = (when declared(AppLaunchReason):
    when ownSizeof(AppLaunchReason) != ownSizeof(AppLaunchReason_570426095):
      static :
        warning("Declaration of " & "AppLaunchReason" &
            " exists but with different size")
    AppLaunchReason
  else:
    AppLaunchReason_570426095)
  WindowHandlers_570426244 = (when declared(WindowHandlers):
    when ownSizeof(WindowHandlers) != ownSizeof(WindowHandlers_570426243):
      static :
        warning("Declaration of " & "WindowHandlers" &
            " exists but with different size")
    WindowHandlers
  else:
    WindowHandlers_570426243)
  AppMessageInboxReceived_570426048 = (when declared(AppMessageInboxReceived):
    when ownSizeof(AppMessageInboxReceived) !=
        ownSizeof(AppMessageInboxReceived_570426047):
      static :
        warning("Declaration of " & "AppMessageInboxReceived" &
            " exists but with different size")
    AppMessageInboxReceived
  else:
    AppMessageInboxReceived_570426047)
  struct_BatteryChargeState_570425889 = (when declared(struct_BatteryChargeState):
    when ownSizeof(struct_BatteryChargeState) !=
        ownSizeof(struct_BatteryChargeState_570425888):
      static :
        warning("Declaration of " & "struct_BatteryChargeState" &
            " exists but with different size")
    struct_BatteryChargeState
  else:
    struct_BatteryChargeState_570425888)
  enum_GTextAlignment_570426200 = (when declared(enum_GTextAlignment):
    when ownSizeof(enum_GTextAlignment) != ownSizeof(enum_GTextAlignment_570426199):
      static :
        warning("Declaration of " & "enum_GTextAlignment" &
            " exists but with different size")
    enum_GTextAlignment
  else:
    enum_GTextAlignment_570426199)
  UnobstructedAreaDidChangeHandler_570426312 = (when declared(
      UnobstructedAreaDidChangeHandler):
    when ownSizeof(UnobstructedAreaDidChangeHandler) !=
        ownSizeof(UnobstructedAreaDidChangeHandler_570426311):
      static :
        warning("Declaration of " & "UnobstructedAreaDidChangeHandler" &
            " exists but with different size")
    UnobstructedAreaDidChangeHandler
  else:
    UnobstructedAreaDidChangeHandler_570426311)
  LayerUpdateProc_570426236 = (when declared(LayerUpdateProc):
    when ownSizeof(LayerUpdateProc) != ownSizeof(LayerUpdateProc_570426235):
      static :
        warning("Declaration of " & "LayerUpdateProc" &
            " exists but with different size")
    LayerUpdateProc
  else:
    LayerUpdateProc_570426235)
  HealthEventHandler_570425978 = (when declared(HealthEventHandler):
    when ownSizeof(HealthEventHandler) != ownSizeof(HealthEventHandler_570425977):
      static :
        warning("Declaration of " & "HealthEventHandler" &
            " exists but with different size")
    HealthEventHandler
  else:
    HealthEventHandler_570425977)
  enum_ActionMenuLevelDisplayMode_570426428 = (when declared(
      enum_ActionMenuLevelDisplayMode):
    when ownSizeof(enum_ActionMenuLevelDisplayMode) !=
        ownSizeof(enum_ActionMenuLevelDisplayMode_570426427):
      static :
        warning("Declaration of " & "enum_ActionMenuLevelDisplayMode" &
            " exists but with different size")
    enum_ActionMenuLevelDisplayMode
  else:
    enum_ActionMenuLevelDisplayMode_570426427)
  WakeupId_570426090 = (when declared(WakeupId):
    when ownSizeof(WakeupId) != ownSizeof(WakeupId_570426089):
      static :
        warning("Declaration of " & "WakeupId" &
            " exists but with different size")
    WakeupId
  else:
    WakeupId_570426089)
  SmartstrapResult_570426208 = (when declared(SmartstrapResult):
    when ownSizeof(SmartstrapResult) != ownSizeof(SmartstrapResult_570426207):
      static :
        warning("Declaration of " & "SmartstrapResult" &
            " exists but with different size")
    SmartstrapResult
  else:
    SmartstrapResult_570426207)
  MenuCellSpan_570426344 = (when declared(MenuCellSpan):
    when ownSizeof(MenuCellSpan) != ownSizeof(MenuCellSpan_570426343):
      static :
        warning("Declaration of " & "MenuCellSpan" &
            " exists but with different size")
    MenuCellSpan
  else:
    MenuCellSpan_570426343)
  DataLoggingSessionRef_570425992 = (when declared(DataLoggingSessionRef):
    when ownSizeof(DataLoggingSessionRef) != ownSizeof(DataLoggingSessionRef_570425991):
      static :
        warning("Declaration of " & "DataLoggingSessionRef" &
            " exists but with different size")
    DataLoggingSessionRef
  else:
    DataLoggingSessionRef_570425991)
  StatusBarLayer_570426398 = (when declared(StatusBarLayer):
    when ownSizeof(StatusBarLayer) != ownSizeof(StatusBarLayer_570426397):
      static :
        warning("Declaration of " & "StatusBarLayer" &
            " exists but with different size")
    StatusBarLayer
  else:
    StatusBarLayer_570426397)
  AccelRawData_570425901 = (when declared(AccelRawData):
    when ownSizeof(AccelRawData) != ownSizeof(AccelRawData_570425900):
      static :
        warning("Declaration of " & "AccelRawData" &
            " exists but with different size")
    AccelRawData
  else:
    AccelRawData_570425900)
  struct_ActionMenuConfig_570426436 = (when declared(struct_ActionMenuConfig):
    when ownSizeof(struct_ActionMenuConfig) !=
        ownSizeof(struct_ActionMenuConfig_570426435):
      static :
        warning("Declaration of " & "struct_ActionMenuConfig" &
            " exists but with different size")
    struct_ActionMenuConfig
  else:
    struct_ActionMenuConfig_570426435)
  struct_tm_570425847 = (when declared(struct_tm):
    when ownSizeof(struct_tm) != ownSizeof(struct_tm_570425846):
      static :
        warning("Declaration of " & "struct_tm" &
            " exists but with different size")
    struct_tm
  else:
    struct_tm_570425846)
  enum_GOvalScaleMode_570426164 = (when declared(enum_GOvalScaleMode):
    when ownSizeof(enum_GOvalScaleMode) != ownSizeof(enum_GOvalScaleMode_570426163):
      static :
        warning("Declaration of " & "enum_GOvalScaleMode" &
            " exists but with different size")
    enum_GOvalScaleMode
  else:
    enum_GOvalScaleMode_570426163)
  ActionMenuLevelDisplayMode_570426430 = (when declared(
      ActionMenuLevelDisplayMode):
    when ownSizeof(ActionMenuLevelDisplayMode) !=
        ownSizeof(ActionMenuLevelDisplayMode_570426429):
      static :
        warning("Declaration of " & "ActionMenuLevelDisplayMode" &
            " exists but with different size")
    ActionMenuLevelDisplayMode
  else:
    ActionMenuLevelDisplayMode_570426429)
  status_t_570426088 = (when declared(status_t):
    when ownSizeof(status_t) != ownSizeof(status_t_570426087):
      static :
        warning("Declaration of " & "status_t" &
            " exists but with different size")
    status_t
  else:
    status_t_570426087)
  VibePattern_570426442 = (when declared(VibePattern):
    when ownSizeof(VibePattern) != ownSizeof(VibePattern_570426441):
      static :
        warning("Declaration of " & "VibePattern" &
            " exists but with different size")
    VibePattern
  else:
    VibePattern_570426441)
  GDrawCommand_570426168 = (when declared(GDrawCommand):
    when ownSizeof(GDrawCommand) != ownSizeof(GDrawCommand_570426167):
      static :
        warning("Declaration of " & "GDrawCommand" &
            " exists but with different size")
    GDrawCommand
  else:
    GDrawCommand_570426167)
  SimpleMenuLayer_570426380 = (when declared(SimpleMenuLayer):
    when ownSizeof(SimpleMenuLayer) != ownSizeof(SimpleMenuLayer_570426379):
      static :
        warning("Declaration of " & "SimpleMenuLayer" &
            " exists but with different size")
    SimpleMenuLayer
  else:
    SimpleMenuLayer_570426379)
  GDrawCommandType_570426182 = (when declared(GDrawCommandType):
    when ownSizeof(GDrawCommandType) != ownSizeof(GDrawCommandType_570426181):
      static :
        warning("Declaration of " & "GDrawCommandType" &
            " exists but with different size")
    GDrawCommandType
  else:
    GDrawCommandType_570426181)
  enum_DataLoggingItemType_570425994 = (when declared(enum_DataLoggingItemType):
    when ownSizeof(enum_DataLoggingItemType) !=
        ownSizeof(enum_DataLoggingItemType_570425993):
      static :
        warning("Declaration of " & "enum_DataLoggingItemType" &
            " exists but with different size")
    enum_DataLoggingItemType
  else:
    enum_DataLoggingItemType_570425993)
  GPointGetter_570426298 = (when declared(GPointGetter):
    when ownSizeof(GPointGetter) != ownSizeof(GPointGetter_570426297):
      static :
        warning("Declaration of " & "GPointGetter" &
            " exists but with different size")
    GPointGetter
  else:
    GPointGetter_570426297)
  HealthServiceAccessibilityMask_570425972 = (when declared(
      HealthServiceAccessibilityMask):
    when ownSizeof(HealthServiceAccessibilityMask) !=
        ownSizeof(HealthServiceAccessibilityMask_570425971):
      static :
        warning("Declaration of " & "HealthServiceAccessibilityMask" &
            " exists but with different size")
    HealthServiceAccessibilityMask
  else:
    HealthServiceAccessibilityMask_570425971)
  enum_ActionMenuAlign_570426420 = (when declared(enum_ActionMenuAlign):
    when ownSizeof(enum_ActionMenuAlign) != ownSizeof(enum_ActionMenuAlign_570426419):
      static :
        warning("Declaration of " & "enum_ActionMenuAlign" &
            " exists but with different size")
    enum_ActionMenuAlign
  else:
    enum_ActionMenuAlign_570426419)
  enum_AppLogLevel_570426006 = (when declared(enum_AppLogLevel):
    when ownSizeof(enum_AppLogLevel) != ownSizeof(enum_AppLogLevel_570426005):
      static :
        warning("Declaration of " & "enum_AppLogLevel" &
            " exists but with different size")
    enum_AppLogLevel
  else:
    enum_AppLogLevel_570426005)
  DataLoggingItemType_570425996 = (when declared(DataLoggingItemType):
    when ownSizeof(DataLoggingItemType) != ownSizeof(DataLoggingItemType_570425995):
      static :
        warning("Declaration of " & "DataLoggingItemType" &
            " exists but with different size")
    DataLoggingItemType
  else:
    DataLoggingItemType_570425995)
  AppGlanceSlice_570426106 = (when declared(AppGlanceSlice):
    when ownSizeof(AppGlanceSlice) != ownSizeof(AppGlanceSlice_570426105):
      static :
        warning("Declaration of " & "AppGlanceSlice" &
            " exists but with different size")
    AppGlanceSlice
  else:
    AppGlanceSlice_570426105)
  AnimationStartedHandler_570426256 = (when declared(AnimationStartedHandler):
    when ownSizeof(AnimationStartedHandler) !=
        ownSizeof(AnimationStartedHandler_570426255):
      static :
        warning("Declaration of " & "AnimationStartedHandler" &
            " exists but with different size")
    AnimationStartedHandler
  else:
    AnimationStartedHandler_570426255)
  HealthMetric_570425944 = (when declared(HealthMetric):
    when ownSizeof(HealthMetric) != ownSizeof(HealthMetric_570425943):
      static :
        warning("Declaration of " & "HealthMetric" &
            " exists but with different size")
    HealthMetric
  else:
    HealthMetric_570425943)
  DictationSession_570426036 = (when declared(DictationSession):
    when ownSizeof(DictationSession) != ownSizeof(DictationSession_570426035):
      static :
        warning("Declaration of " & "DictationSession" &
            " exists but with different size")
    DictationSession
  else:
    DictationSession_570426035)
  GPointReturn_570426284 = (when declared(GPointReturn):
    when ownSizeof(GPointReturn) != ownSizeof(GPointReturn_570426283):
      static :
        warning("Declaration of " & "GPointReturn" &
            " exists but with different size")
    GPointReturn
  else:
    GPointReturn_570426283)
  enum_ContentIndicatorDirection_570426330 = (when declared(
      enum_ContentIndicatorDirection):
    when ownSizeof(enum_ContentIndicatorDirection) !=
        ownSizeof(enum_ContentIndicatorDirection_570426329):
      static :
        warning("Declaration of " & "enum_ContentIndicatorDirection" &
            " exists but with different size")
    enum_ContentIndicatorDirection
  else:
    enum_ContentIndicatorDirection_570426329)
  SniffInterval_570426078 = (when declared(SniffInterval):
    when ownSizeof(SniffInterval) != ownSizeof(SniffInterval_570426077):
      static :
        warning("Declaration of " & "SniffInterval" &
            " exists but with different size")
    SniffInterval
  else:
    SniffInterval_570426077)
  CompassHeadingData_570425925 = (when declared(CompassHeadingData):
    when ownSizeof(CompassHeadingData) != ownSizeof(CompassHeadingData_570425924):
      static :
        warning("Declaration of " & "CompassHeadingData" &
            " exists but with different size")
    CompassHeadingData
  else:
    CompassHeadingData_570425924)
  AnimationProgress_570426248 = (when declared(AnimationProgress):
    when ownSizeof(AnimationProgress) != ownSizeof(AnimationProgress_570426247):
      static :
        warning("Declaration of " & "AnimationProgress" &
            " exists but with different size")
    AnimationProgress
  else:
    AnimationProgress_570426247)
  BitmapLayer_570426404 = (when declared(BitmapLayer):
    when ownSizeof(BitmapLayer) != ownSizeof(BitmapLayer_570426403):
      static :
        warning("Declaration of " & "BitmapLayer" &
            " exists but with different size")
    BitmapLayer
  else:
    BitmapLayer_570426403)
  PlatformType_570425873 = (when declared(PlatformType):
    when ownSizeof(PlatformType) != ownSizeof(PlatformType_570425872):
      static :
        warning("Declaration of " & "PlatformType" &
            " exists but with different size")
    PlatformType
  else:
    PlatformType_570425872)
  struct_GBitmapDataRowInfo_570426142 = (when declared(struct_GBitmapDataRowInfo):
    when ownSizeof(struct_GBitmapDataRowInfo) !=
        ownSizeof(struct_GBitmapDataRowInfo_570426141):
      static :
        warning("Declaration of " & "struct_GBitmapDataRowInfo" &
            " exists but with different size")
    struct_GBitmapDataRowInfo
  else:
    struct_GBitmapDataRowInfo_570426141)
  enum_GDrawCommandType_570426180 = (when declared(enum_GDrawCommandType):
    when ownSizeof(enum_GDrawCommandType) != ownSizeof(enum_GDrawCommandType_570426179):
      static :
        warning("Declaration of " & "enum_GDrawCommandType" &
            " exists but with different size")
    enum_GDrawCommandType
  else:
    enum_GDrawCommandType_570426179)
  AppGlanceReloadCallback_570426114 = (when declared(AppGlanceReloadCallback):
    when ownSizeof(AppGlanceReloadCallback) !=
        ownSizeof(AppGlanceReloadCallback_570426113):
      static :
        warning("Declaration of " & "AppGlanceReloadCallback" &
            " exists but with different size")
    AppGlanceReloadCallback
  else:
    AppGlanceReloadCallback_570426113)
  AccelSamplingRate_570425915 = (when declared(AccelSamplingRate):
    when ownSizeof(AccelSamplingRate) != ownSizeof(AccelSamplingRate_570425914):
      static :
        warning("Declaration of " & "AccelSamplingRate" &
            " exists but with different size")
    AccelSamplingRate
  else:
    AccelSamplingRate_570425914)
  GTextAlignment_570426202 = (when declared(GTextAlignment):
    when ownSizeof(GTextAlignment) != ownSizeof(GTextAlignment_570426201):
      static :
        warning("Declaration of " & "GTextAlignment" &
            " exists but with different size")
    GTextAlignment
  else:
    GTextAlignment_570426201)
  struct_HealthMinuteData_570425984 = (when declared(struct_HealthMinuteData):
    when ownSizeof(struct_HealthMinuteData) !=
        ownSizeof(struct_HealthMinuteData_570425983):
      static :
        warning("Declaration of " & "struct_HealthMinuteData" &
            " exists but with different size")
    struct_HealthMinuteData
  else:
    struct_HealthMinuteData_570425983)
  DictionaryIterator_570426026 = (when declared(DictionaryIterator):
    when ownSizeof(DictionaryIterator) != ownSizeof(DictionaryIterator_570426025):
      static :
        warning("Declaration of " & "DictionaryIterator" &
            " exists but with different size")
    DictionaryIterator
  else:
    DictionaryIterator_570426025)
  AppTimer_570426080 = (when declared(AppTimer):
    when ownSizeof(AppTimer) != ownSizeof(AppTimer_570426079):
      static :
        warning("Declaration of " & "AppTimer" &
            " exists but with different size")
    AppTimer
  else:
    AppTimer_570426079)
  NumberWindow_570426408 = (when declared(NumberWindow):
    when ownSizeof(NumberWindow) != ownSizeof(NumberWindow_570426407):
      static :
        warning("Declaration of " & "NumberWindow" &
            " exists but with different size")
    NumberWindow
  else:
    NumberWindow_570426407)
  HealthMetricAlert_570425948 = (when declared(HealthMetricAlert):
    when ownSizeof(HealthMetricAlert) != ownSizeof(HealthMetricAlert_570425947):
      static :
        warning("Declaration of " & "HealthMetricAlert" &
            " exists but with different size")
    HealthMetricAlert
  else:
    HealthMetricAlert_570425947)
  MenuLayer_570426346 = (when declared(MenuLayer):
    when ownSizeof(MenuLayer) != ownSizeof(MenuLayer_570426345):
      static :
        warning("Declaration of " & "MenuLayer" &
            " exists but with different size")
    MenuLayer
  else:
    MenuLayer_570426345)
  enum_MeasurementSystem_570425988 = (when declared(enum_MeasurementSystem):
    when ownSizeof(enum_MeasurementSystem) != ownSizeof(enum_MeasurementSystem_570425987):
      static :
        warning("Declaration of " & "enum_MeasurementSystem" &
            " exists but with different size")
    enum_MeasurementSystem
  else:
    enum_MeasurementSystem_570425987)
  WatchInfoVersion_570425863 = (when declared(WatchInfoVersion):
    when ownSizeof(WatchInfoVersion) != ownSizeof(WatchInfoVersion_570425862):
      static :
        warning("Declaration of " & "WatchInfoVersion" &
            " exists but with different size")
    WatchInfoVersion
  else:
    WatchInfoVersion_570425862)
  UnobstructedAreaChangeHandler_570426310 = (when declared(
      UnobstructedAreaChangeHandler):
    when ownSizeof(UnobstructedAreaChangeHandler) !=
        ownSizeof(UnobstructedAreaChangeHandler_570426309):
      static :
        warning("Declaration of " & "UnobstructedAreaChangeHandler" &
            " exists but with different size")
    UnobstructedAreaChangeHandler
  else:
    UnobstructedAreaChangeHandler_570426309)
  enum_AccelAxisType_570425903 = (when declared(enum_AccelAxisType):
    when ownSizeof(enum_AccelAxisType) != ownSizeof(enum_AccelAxisType_570425902):
      static :
        warning("Declaration of " & "enum_AccelAxisType" &
            " exists but with different size")
    enum_AccelAxisType
  else:
    enum_AccelAxisType_570425902)
  enum_HealthIterationDirection_570425966 = (when declared(
      enum_HealthIterationDirection):
    when ownSizeof(enum_HealthIterationDirection) !=
        ownSizeof(enum_HealthIterationDirection_570425965):
      static :
        warning("Declaration of " & "enum_HealthIterationDirection" &
            " exists but with different size")
    enum_HealthIterationDirection
  else:
    enum_HealthIterationDirection_570425965)
  enum_AmbientLightLevel_570425980 = (when declared(enum_AmbientLightLevel):
    when ownSizeof(enum_AmbientLightLevel) != ownSizeof(enum_AmbientLightLevel_570425979):
      static :
        warning("Declaration of " & "enum_AmbientLightLevel" &
            " exists but with different size")
    enum_AmbientLightLevel
  else:
    enum_AmbientLightLevel_570425979)
  AppWorkerMessage_570426072 = (when declared(AppWorkerMessage):
    when ownSizeof(AppWorkerMessage) != ownSizeof(AppWorkerMessage_570426071):
      static :
        warning("Declaration of " & "AppWorkerMessage" &
            " exists but with different size")
    AppWorkerMessage
  else:
    AppWorkerMessage_570426071)
  AnimationStoppedHandler_570426258 = (when declared(AnimationStoppedHandler):
    when ownSizeof(AnimationStoppedHandler) !=
        ownSizeof(AnimationStoppedHandler_570426257):
      static :
        warning("Declaration of " & "AnimationStoppedHandler" &
            " exists but with different size")
    AnimationStoppedHandler
  else:
    AnimationStoppedHandler_570426257)
  BatteryStateHandler_570425893 = (when declared(BatteryStateHandler):
    when ownSizeof(BatteryStateHandler) != ownSizeof(BatteryStateHandler_570425892):
      static :
        warning("Declaration of " & "BatteryStateHandler" &
            " exists but with different size")
    BatteryStateHandler
  else:
    BatteryStateHandler_570425892)
  GCompOp_570426152 = (when declared(GCompOp):
    when ownSizeof(GCompOp) != ownSizeof(GCompOp_570426151):
      static :
        warning("Declaration of " & "GCompOp" &
            " exists but with different size")
    GCompOp
  else:
    GCompOp_570426151)
  GDrawCommandSequence_570426178 = (when declared(GDrawCommandSequence):
    when ownSizeof(GDrawCommandSequence) != ownSizeof(GDrawCommandSequence_570426177):
      static :
        warning("Declaration of " & "GDrawCommandSequence" &
            " exists but with different size")
    GDrawCommandSequence
  else:
    GDrawCommandSequence_570426177)
  GRectSetter_570426300 = (when declared(GRectSetter):
    when ownSizeof(GRectSetter) != ownSizeof(GRectSetter_570426299):
      static :
        warning("Declaration of " & "GRectSetter" &
            " exists but with different size")
    GRectSetter
  else:
    GRectSetter_570426299)
  struct_ConnectionHandlers_570425877 = (when declared(struct_ConnectionHandlers):
    when ownSizeof(struct_ConnectionHandlers) !=
        ownSizeof(struct_ConnectionHandlers_570425876):
      static :
        warning("Declaration of " & "struct_ConnectionHandlers" &
            " exists but with different size")
    struct_ConnectionHandlers
  else:
    struct_ConnectionHandlers_570425876)
  MenuLayerGetHeaderHeightCallback_570426354 = (when declared(
      MenuLayerGetHeaderHeightCallback):
    when ownSizeof(MenuLayerGetHeaderHeightCallback) !=
        ownSizeof(MenuLayerGetHeaderHeightCallback_570426353):
      static :
        warning("Declaration of " & "MenuLayerGetHeaderHeightCallback" &
            " exists but with different size")
    MenuLayerGetHeaderHeightCallback
  else:
    MenuLayerGetHeaderHeightCallback_570426353)
  GBitmap_570426138 = (when declared(GBitmap):
    when ownSizeof(GBitmap) != ownSizeof(GBitmap_570426137):
      static :
        warning("Declaration of " & "GBitmap" &
            " exists but with different size")
    GBitmap
  else:
    GBitmap_570426137)
  enum_AppMessageResult_570426044 = (when declared(enum_AppMessageResult):
    when ownSizeof(enum_AppMessageResult) != ownSizeof(enum_AppMessageResult_570426043):
      static :
        warning("Declaration of " & "enum_AppMessageResult" &
            " exists but with different size")
    enum_AppMessageResult
  else:
    enum_AppMessageResult_570426043)
  MenuLayerGetSeparatorHeightCallback_570426356 = (when declared(
      MenuLayerGetSeparatorHeightCallback):
    when ownSizeof(MenuLayerGetSeparatorHeightCallback) !=
        ownSizeof(MenuLayerGetSeparatorHeightCallback_570426355):
      static :
        warning("Declaration of " & "MenuLayerGetSeparatorHeightCallback" &
            " exists but with different size")
    MenuLayerGetSeparatorHeightCallback
  else:
    MenuLayerGetSeparatorHeightCallback_570426355)
  enum_HealthActivity_570425960 = (when declared(enum_HealthActivity):
    when ownSizeof(enum_HealthActivity) != ownSizeof(enum_HealthActivity_570425959):
      static :
        warning("Declaration of " & "enum_HealthActivity" &
            " exists but with different size")
    enum_HealthActivity
  else:
    enum_HealthActivity_570425959)
  MenuRowAlign_570426378 = (when declared(MenuRowAlign):
    when ownSizeof(MenuRowAlign) != ownSizeof(MenuRowAlign_570426377):
      static :
        warning("Declaration of " & "MenuRowAlign" &
            " exists but with different size")
    MenuRowAlign
  else:
    MenuRowAlign_570426377)
  time_t_570425869 = (when declared(time_t):
    when ownSizeof(time_t) != ownSizeof(time_t_570425868):
      static :
        warning("Declaration of " & "time_t" & " exists but with different size")
    time_t
  else:
    time_t_570425868)
  AppMessageOutboxSent_570426052 = (when declared(AppMessageOutboxSent):
    when ownSizeof(AppMessageOutboxSent) != ownSizeof(AppMessageOutboxSent_570426051):
      static :
        warning("Declaration of " & "AppMessageOutboxSent" &
            " exists but with different size")
    AppMessageOutboxSent
  else:
    AppMessageOutboxSent_570426051)
  DictationSessionStatus_570426040 = (when declared(DictationSessionStatus):
    when ownSizeof(DictationSessionStatus) != ownSizeof(DictationSessionStatus_570426039):
      static :
        warning("Declaration of " & "DictationSessionStatus" &
            " exists but with different size")
    DictationSessionStatus
  else:
    DictationSessionStatus_570426039)
  GBitmapSequence_570426140 = (when declared(GBitmapSequence):
    when ownSizeof(GBitmapSequence) != ownSizeof(GBitmapSequence_570426139):
      static :
        warning("Declaration of " & "GBitmapSequence" &
            " exists but with different size")
    GBitmapSequence
  else:
    GBitmapSequence_570426139)
  AppMessageOutboxFailed_570426054 = (when declared(AppMessageOutboxFailed):
    when ownSizeof(AppMessageOutboxFailed) != ownSizeof(AppMessageOutboxFailed_570426053):
      static :
        warning("Declaration of " & "AppMessageOutboxFailed" &
            " exists but with different size")
    AppMessageOutboxFailed
  else:
    AppMessageOutboxFailed_570426053)
  TupleType_570426016 = (when declared(TupleType):
    when ownSizeof(TupleType) != ownSizeof(TupleType_570426015):
      static :
        warning("Declaration of " & "TupleType" &
            " exists but with different size")
    TupleType
  else:
    TupleType_570426015)
  struct_GPathInfo_570426184 = (when declared(struct_GPathInfo):
    when ownSizeof(struct_GPathInfo) != ownSizeof(struct_GPathInfo_570426183):
      static :
        warning("Declaration of " & "struct_GPathInfo" &
            " exists but with different size")
    struct_GPathInfo
  else:
    struct_GPathInfo_570426183)
  GPathInfo_570426186 = (when declared(GPathInfo):
    when ownSizeof(GPathInfo) != ownSizeof(GPathInfo_570426185):
      static :
        warning("Declaration of " & "GPathInfo" &
            " exists but with different size")
    GPathInfo
  else:
    GPathInfo_570426185)
  enum_AppWorkerResult_570426066 = (when declared(enum_AppWorkerResult):
    when ownSizeof(enum_AppWorkerResult) != ownSizeof(enum_AppWorkerResult_570426065):
      static :
        warning("Declaration of " & "enum_AppWorkerResult" &
            " exists but with different size")
    enum_AppWorkerResult
  else:
    enum_AppWorkerResult_570426065)
  enum_GBitmapFormat_570426134 = (when declared(enum_GBitmapFormat):
    when ownSizeof(enum_GBitmapFormat) != ownSizeof(enum_GBitmapFormat_570426133):
      static :
        warning("Declaration of " & "enum_GBitmapFormat" &
            " exists but with different size")
    enum_GBitmapFormat
  else:
    enum_GBitmapFormat_570426133)
  CompassHeading_570425921 = (when declared(CompassHeading):
    when ownSizeof(CompassHeading) != ownSizeof(CompassHeading_570425920):
      static :
        warning("Declaration of " & "CompassHeading" &
            " exists but with different size")
    CompassHeading
  else:
    CompassHeading_570425920)
  GColor8Setter_570426304 = (when declared(GColor8Setter):
    when ownSizeof(GColor8Setter) != ownSizeof(GColor8Setter_570426303):
      static :
        warning("Declaration of " & "GColor8Setter" &
            " exists but with different size")
    GColor8Setter
  else:
    GColor8Setter_570426303)
  struct_MenuLayerCallbacks_570426372 = (when declared(struct_MenuLayerCallbacks):
    when ownSizeof(struct_MenuLayerCallbacks) !=
        ownSizeof(struct_MenuLayerCallbacks_570426371):
      static :
        warning("Declaration of " & "struct_MenuLayerCallbacks" &
            " exists but with different size")
    struct_MenuLayerCallbacks
  else:
    struct_MenuLayerCallbacks_570426371)
  GDrawCommandList_570426174 = (when declared(GDrawCommandList):
    when ownSizeof(GDrawCommandList) != ownSizeof(GDrawCommandList_570426173):
      static :
        warning("Declaration of " & "GDrawCommandList" &
            " exists but with different size")
    GDrawCommandList
  else:
    GDrawCommandList_570426173)
  struct_NumberWindowCallbacks_570426412 = (when declared(
      struct_NumberWindowCallbacks):
    when ownSizeof(struct_NumberWindowCallbacks) !=
        ownSizeof(struct_NumberWindowCallbacks_570426411):
      static :
        warning("Declaration of " & "struct_NumberWindowCallbacks" &
            " exists but with different size")
    struct_NumberWindowCallbacks
  else:
    struct_NumberWindowCallbacks_570426411)
  enum_HealthAggregation_570425954 = (when declared(enum_HealthAggregation):
    when ownSizeof(enum_HealthAggregation) != ownSizeof(enum_HealthAggregation_570425953):
      static :
        warning("Declaration of " & "enum_HealthAggregation" &
            " exists but with different size")
    enum_HealthAggregation
  else:
    enum_HealthAggregation_570425953)
  ScrollLayerCallback_570426322 = (when declared(ScrollLayerCallback):
    when ownSizeof(ScrollLayerCallback) != ownSizeof(ScrollLayerCallback_570426321):
      static :
        warning("Declaration of " & "ScrollLayerCallback" &
            " exists but with different size")
    ScrollLayerCallback
  else:
    ScrollLayerCallback_570426321)
  ActionMenuItem_570426416 = (when declared(ActionMenuItem):
    when ownSizeof(ActionMenuItem) != ownSizeof(ActionMenuItem_570426415):
      static :
        warning("Declaration of " & "ActionMenuItem" &
            " exists but with different size")
    ActionMenuItem
  else:
    ActionMenuItem_570426415)
  ActionMenuPerformActionCb_570426432 = (when declared(ActionMenuPerformActionCb):
    when ownSizeof(ActionMenuPerformActionCb) !=
        ownSizeof(ActionMenuPerformActionCb_570426431):
      static :
        warning("Declaration of " & "ActionMenuPerformActionCb" &
            " exists but with different size")
    ActionMenuPerformActionCb
  else:
    ActionMenuPerformActionCb_570426431)
  struct_MenuIndex_570426338 = (when declared(struct_MenuIndex):
    when ownSizeof(struct_MenuIndex) != ownSizeof(struct_MenuIndex_570426337):
      static :
        warning("Declaration of " & "struct_MenuIndex" &
            " exists but with different size")
    struct_MenuIndex
  else:
    struct_MenuIndex_570426337)
  RotBitmapLayer_570426406 = (when declared(RotBitmapLayer):
    when ownSizeof(RotBitmapLayer) != ownSizeof(RotBitmapLayer_570426405):
      static :
        warning("Declaration of " & "RotBitmapLayer" &
            " exists but with different size")
    RotBitmapLayer
  else:
    RotBitmapLayer_570426405)
  GBitmapFormat_570426136 = (when declared(GBitmapFormat):
    when ownSizeof(GBitmapFormat) != ownSizeof(GBitmapFormat_570426135):
      static :
        warning("Declaration of " & "GBitmapFormat" &
            " exists but with different size")
    GBitmapFormat
  else:
    GBitmapFormat_570426135)
  GEdgeInsets_570426158 = (when declared(GEdgeInsets):
    when ownSizeof(GEdgeInsets) != ownSizeof(GEdgeInsets_570426157):
      static :
        warning("Declaration of " & "GEdgeInsets" &
            " exists but with different size")
    GEdgeInsets
  else:
    GEdgeInsets_570426157)
  AppSyncErrorCallback_570426058 = (when declared(AppSyncErrorCallback):
    when ownSizeof(AppSyncErrorCallback) != ownSizeof(AppSyncErrorCallback_570426057):
      static :
        warning("Declaration of " & "AppSyncErrorCallback" &
            " exists but with different size")
    AppSyncErrorCallback
  else:
    AppSyncErrorCallback_570426057)
  GRect_570426132 = (when declared(GRect):
    when ownSizeof(GRect) != ownSizeof(GRect_570426131):
      static :
        warning("Declaration of " & "GRect" & " exists but with different size")
    GRect
  else:
    GRect_570426131)
  ConnectionHandlers_570425879 = (when declared(ConnectionHandlers):
    when ownSizeof(ConnectionHandlers) != ownSizeof(ConnectionHandlers_570425878):
      static :
        warning("Declaration of " & "ConnectionHandlers" &
            " exists but with different size")
    ConnectionHandlers
  else:
    ConnectionHandlers_570425878)
  GTextAttributes_570426204 = (when declared(GTextAttributes):
    when ownSizeof(GTextAttributes) != ownSizeof(GTextAttributes_570426203):
      static :
        warning("Declaration of " & "GTextAttributes" &
            " exists but with different size")
    GTextAttributes
  else:
    GTextAttributes_570426203)
  WakeupHandler_570426092 = (when declared(WakeupHandler):
    when ownSizeof(WakeupHandler) != ownSizeof(WakeupHandler_570426091):
      static :
        warning("Declaration of " & "WakeupHandler" &
            " exists but with different size")
    WakeupHandler
  else:
    WakeupHandler_570426091)
  HealthEventType_570425976 = (when declared(HealthEventType):
    when ownSizeof(HealthEventType) != ownSizeof(HealthEventType_570425975):
      static :
        warning("Declaration of " & "HealthEventType" &
            " exists but with different size")
    HealthEventType
  else:
    HealthEventType_570425975)
  struct_PropertyAnimationImplementation_570426280 = (when declared(
      struct_PropertyAnimationImplementation):
    when ownSizeof(struct_PropertyAnimationImplementation) !=
        ownSizeof(struct_PropertyAnimationImplementation_570426279):
      static :
        warning("Declaration of " & "struct_PropertyAnimationImplementation" &
            " exists but with different size")
    struct_PropertyAnimationImplementation
  else:
    struct_PropertyAnimationImplementation_570426279)
  Uuid_570426004 = (when declared(Uuid):
    when ownSizeof(Uuid) != ownSizeof(Uuid_570426003):
      static :
        warning("Declaration of " & "Uuid" & " exists but with different size")
    Uuid
  else:
    Uuid_570426003)
  ActionBarLayerIconPressAnimation_570426394 = (when declared(
      ActionBarLayerIconPressAnimation):
    when ownSizeof(ActionBarLayerIconPressAnimation) !=
        ownSizeof(ActionBarLayerIconPressAnimation_570426393):
      static :
        warning("Declaration of " & "ActionBarLayerIconPressAnimation" &
            " exists but with different size")
    ActionBarLayerIconPressAnimation
  else:
    ActionBarLayerIconPressAnimation_570426393)
  UnobstructedAreaHandlers_570426316 = (when declared(UnobstructedAreaHandlers):
    when ownSizeof(UnobstructedAreaHandlers) !=
        ownSizeof(UnobstructedAreaHandlers_570426315):
      static :
        warning("Declaration of " & "UnobstructedAreaHandlers" &
            " exists but with different size")
    UnobstructedAreaHandlers
  else:
    UnobstructedAreaHandlers_570426315)
  CompassHeadingHandler_570425927 = (when declared(CompassHeadingHandler):
    when ownSizeof(CompassHeadingHandler) != ownSizeof(CompassHeadingHandler_570425926):
      static :
        warning("Declaration of " & "CompassHeadingHandler" &
            " exists but with different size")
    CompassHeadingHandler
  else:
    CompassHeadingHandler_570425926)
  UInt32Setter_570426292 = (when declared(UInt32Setter):
    when ownSizeof(UInt32Setter) != ownSizeof(UInt32Setter_570426291):
      static :
        warning("Declaration of " & "UInt32Setter" &
            " exists but with different size")
    UInt32Setter
  else:
    UInt32Setter_570426291)
  ActionMenuEachItemCb_570426434 = (when declared(ActionMenuEachItemCb):
    when ownSizeof(ActionMenuEachItemCb) != ownSizeof(ActionMenuEachItemCb_570426433):
      static :
        warning("Declaration of " & "ActionMenuEachItemCb" &
            " exists but with different size")
    ActionMenuEachItemCb
  else:
    ActionMenuEachItemCb_570426433)
  enum_GAlign_570426146 = (when declared(enum_GAlign):
    when ownSizeof(enum_GAlign) != ownSizeof(enum_GAlign_570426145):
      static :
        warning("Declaration of " & "enum_GAlign" &
            " exists but with different size")
    enum_GAlign
  else:
    enum_GAlign_570426145)
  AnimationSetupImplementation_570426264 = (when declared(
      AnimationSetupImplementation):
    when ownSizeof(AnimationSetupImplementation) !=
        ownSizeof(AnimationSetupImplementation_570426263):
      static :
        warning("Declaration of " & "AnimationSetupImplementation" &
            " exists but with different size")
    AnimationSetupImplementation
  else:
    AnimationSetupImplementation_570426263)
  PropertyAnimationAccessors_570426274 = (when declared(
      PropertyAnimationAccessors):
    when ownSizeof(PropertyAnimationAccessors) !=
        ownSizeof(PropertyAnimationAccessors_570426273):
      static :
        warning("Declaration of " & "PropertyAnimationAccessors" &
            " exists but with different size")
    PropertyAnimationAccessors
  else:
    PropertyAnimationAccessors_570426273)
  CompassStatus_570425919 = (when declared(CompassStatus):
    when ownSizeof(CompassStatus) != ownSizeof(CompassStatus_570425918):
      static :
        warning("Declaration of " & "CompassStatus" &
            " exists but with different size")
    CompassStatus
  else:
    CompassStatus_570425918)
  AppWorkerResult_570426068 = (when declared(AppWorkerResult):
    when ownSizeof(AppWorkerResult) != ownSizeof(AppWorkerResult_570426067):
      static :
        warning("Declaration of " & "AppWorkerResult" &
            " exists but with different size")
    AppWorkerResult
  else:
    AppWorkerResult_570426067)
  SmartstrapReadHandler_570426218 = (when declared(SmartstrapReadHandler):
    when ownSizeof(SmartstrapReadHandler) != ownSizeof(SmartstrapReadHandler_570426217):
      static :
        warning("Declaration of " & "SmartstrapReadHandler" &
            " exists but with different size")
    SmartstrapReadHandler
  else:
    SmartstrapReadHandler_570426217)
  GDrawCommandImage_570426172 = (when declared(GDrawCommandImage):
    when ownSizeof(GDrawCommandImage) != ownSizeof(GDrawCommandImage_570426171):
      static :
        warning("Declaration of " & "GDrawCommandImage" &
            " exists but with different size")
    GDrawCommandImage
  else:
    GDrawCommandImage_570426171)
  union_GColor8_570426116 = (when declared(union_GColor8):
    when ownSizeof(union_GColor8) != ownSizeof(union_GColor8_570426115):
      static :
        warning("Declaration of " & "union_GColor8" &
            " exists but with different size")
    union_GColor8
  else:
    union_GColor8_570426115)
  ContentIndicator_570426328 = (when declared(ContentIndicator):
    when ownSizeof(ContentIndicator) != ownSizeof(ContentIndicator_570426327):
      static :
        warning("Declaration of " & "ContentIndicator" &
            " exists but with different size")
    ContentIndicator
  else:
    ContentIndicator_570426327)
  SimpleMenuLayerSelectCallback_570426382 = (when declared(
      SimpleMenuLayerSelectCallback):
    when ownSizeof(SimpleMenuLayerSelectCallback) !=
        ownSizeof(SimpleMenuLayerSelectCallback_570426381):
      static :
        warning("Declaration of " & "SimpleMenuLayerSelectCallback" &
            " exists but with different size")
    SimpleMenuLayerSelectCallback
  else:
    SimpleMenuLayerSelectCallback_570426381)
  enum_PlatformType_570425871 = (when declared(enum_PlatformType):
    when ownSizeof(enum_PlatformType) != ownSizeof(enum_PlatformType_570425870):
      static :
        warning("Declaration of " & "enum_PlatformType" &
            " exists but with different size")
    enum_PlatformType
  else:
    enum_PlatformType_570425870)
  struct_ContentIndicatorConfig_570426334 = (when declared(
      struct_ContentIndicatorConfig):
    when ownSizeof(struct_ContentIndicatorConfig) !=
        ownSizeof(struct_ContentIndicatorConfig_570426333):
      static :
        warning("Declaration of " & "struct_ContentIndicatorConfig" &
            " exists but with different size")
    struct_ContentIndicatorConfig
  else:
    struct_ContentIndicatorConfig_570426333)
  struct_VibePattern_570426440 = (when declared(struct_VibePattern):
    when ownSizeof(struct_VibePattern) != ownSizeof(struct_VibePattern_570426439):
      static :
        warning("Declaration of " & "struct_VibePattern" &
            " exists but with different size")
    struct_VibePattern
  else:
    struct_VibePattern_570426439)
  SmartstrapAttributeId_570426212 = (when declared(SmartstrapAttributeId):
    when ownSizeof(SmartstrapAttributeId) != ownSizeof(SmartstrapAttributeId_570426211):
      static :
        warning("Declaration of " & "SmartstrapAttributeId" &
            " exists but with different size")
    SmartstrapAttributeId
  else:
    SmartstrapAttributeId_570426211)
  PreferredContentSize_570426446 = (when declared(PreferredContentSize):
    when ownSizeof(PreferredContentSize) != ownSizeof(PreferredContentSize_570426445):
      static :
        warning("Declaration of " & "PreferredContentSize" &
            " exists but with different size")
    PreferredContentSize
  else:
    PreferredContentSize_570426445)
  ClickConfigProvider_570426232 = (when declared(ClickConfigProvider):
    when ownSizeof(ClickConfigProvider) != ownSizeof(ClickConfigProvider_570426231):
      static :
        warning("Declaration of " & "ClickConfigProvider" &
            " exists but with different size")
    ClickConfigProvider
  else:
    ClickConfigProvider_570426231)
  MenuIndex_570426340 = (when declared(MenuIndex):
    when ownSizeof(MenuIndex) != ownSizeof(MenuIndex_570426339):
      static :
        warning("Declaration of " & "MenuIndex" &
            " exists but with different size")
    MenuIndex
  else:
    MenuIndex_570426339)
  ActionMenuAlign_570426422 = (when declared(ActionMenuAlign):
    when ownSizeof(ActionMenuAlign) != ownSizeof(ActionMenuAlign_570426421):
      static :
        warning("Declaration of " & "ActionMenuAlign" &
            " exists but with different size")
    ActionMenuAlign
  else:
    ActionMenuAlign_570426421)
  Animation_570426246 = (when declared(Animation):
    when ownSizeof(Animation) != ownSizeof(Animation_570426245):
      static :
        warning("Declaration of " & "Animation" &
            " exists but with different size")
    Animation
  else:
    Animation_570426245)
  ActionMenuDidCloseCb_570426426 = (when declared(ActionMenuDidCloseCb):
    when ownSizeof(ActionMenuDidCloseCb) != ownSizeof(ActionMenuDidCloseCb_570426425):
      static :
        warning("Declaration of " & "ActionMenuDidCloseCb" &
            " exists but with different size")
    ActionMenuDidCloseCb
  else:
    ActionMenuDidCloseCb_570426425)
  struct_AppGlanceSlice_570426104 = (when declared(struct_AppGlanceSlice):
    when ownSizeof(struct_AppGlanceSlice) != ownSizeof(struct_AppGlanceSlice_570426103):
      static :
        warning("Declaration of " & "struct_AppGlanceSlice" &
            " exists but with different size")
    struct_AppGlanceSlice
  else:
    struct_AppGlanceSlice_570426103)
  Window_570426238 = (when declared(Window):
    when ownSizeof(Window) != ownSizeof(Window_570426237):
      static :
        warning("Declaration of " & "Window" & " exists but with different size")
    Window
  else:
    Window_570426237)
  DataLoggingResult_570426000 = (when declared(DataLoggingResult):
    when ownSizeof(DataLoggingResult) != ownSizeof(DataLoggingResult_570425999):
      static :
        warning("Declaration of " & "DataLoggingResult" &
            " exists but with different size")
    DataLoggingResult
  else:
    DataLoggingResult_570425999)
  StatusCode_570426086 = (when declared(StatusCode):
    when ownSizeof(StatusCode) != ownSizeof(StatusCode_570426085):
      static :
        warning("Declaration of " & "StatusCode" &
            " exists but with different size")
    StatusCode
  else:
    StatusCode_570426085)
  enum_DictationSessionStatus_570426038 = (when declared(
      enum_DictationSessionStatus):
    when ownSizeof(enum_DictationSessionStatus) !=
        ownSizeof(enum_DictationSessionStatus_570426037):
      static :
        warning("Declaration of " & "enum_DictationSessionStatus" &
            " exists but with different size")
    enum_DictationSessionStatus
  else:
    enum_DictationSessionStatus_570426037)
  SmartstrapWriteHandler_570426220 = (when declared(SmartstrapWriteHandler):
    when ownSizeof(SmartstrapWriteHandler) != ownSizeof(SmartstrapWriteHandler_570426219):
      static :
        warning("Declaration of " & "SmartstrapWriteHandler" &
            " exists but with different size")
    SmartstrapWriteHandler
  else:
    SmartstrapWriteHandler_570426219)
  SmartstrapHandlers_570426226 = (when declared(SmartstrapHandlers):
    when ownSizeof(SmartstrapHandlers) != ownSizeof(SmartstrapHandlers_570426225):
      static :
        warning("Declaration of " & "SmartstrapHandlers" &
            " exists but with different size")
    SmartstrapHandlers
  else:
    SmartstrapHandlers_570426225)
  AccelRawDataHandler_570425909 = (when declared(AccelRawDataHandler):
    when ownSizeof(AccelRawDataHandler) != ownSizeof(AccelRawDataHandler_570425908):
      static :
        warning("Declaration of " & "AccelRawDataHandler" &
            " exists but with different size")
    AccelRawDataHandler
  else:
    AccelRawDataHandler_570425908)
  WeekDay_570425867 = (when declared(WeekDay):
    when ownSizeof(WeekDay) != ownSizeof(WeekDay_570425866):
      static :
        warning("Declaration of " & "WeekDay" &
            " exists but with different size")
    WeekDay
  else:
    WeekDay_570425866)
  enum_WatchInfoModel_570425853 = (when declared(enum_WatchInfoModel):
    when ownSizeof(enum_WatchInfoModel) != ownSizeof(enum_WatchInfoModel_570425852):
      static :
        warning("Declaration of " & "enum_WatchInfoModel" &
            " exists but with different size")
    enum_WatchInfoModel
  else:
    enum_WatchInfoModel_570425852)
  AppWorkerMessageHandler_570426074 = (when declared(AppWorkerMessageHandler):
    when ownSizeof(AppWorkerMessageHandler) !=
        ownSizeof(AppWorkerMessageHandler_570426073):
      static :
        warning("Declaration of " & "AppWorkerMessageHandler" &
            " exists but with different size")
    AppWorkerMessageHandler
  else:
    AppWorkerMessageHandler_570426073)
  GFont_570426194 = (when declared(GFont):
    when ownSizeof(GFont) != ownSizeof(GFont_570426193):
      static :
        warning("Declaration of " & "GFont" & " exists but with different size")
    GFont
  else:
    GFont_570426193)
  ActionBarLayer_570426396 = (when declared(ActionBarLayer):
    when ownSizeof(ActionBarLayer) != ownSizeof(ActionBarLayer_570426395):
      static :
        warning("Declaration of " & "ActionBarLayer" &
            " exists but with different size")
    ActionBarLayer
  else:
    ActionBarLayer_570426395)
  struct_AccelRawData_570425899 = (when declared(struct_AccelRawData):
    when ownSizeof(struct_AccelRawData) != ownSizeof(struct_AccelRawData_570425898):
      static :
        warning("Declaration of " & "struct_AccelRawData" &
            " exists but with different size")
    struct_AccelRawData
  else:
    struct_AccelRawData_570425898)
  DictionaryResult_570426012 = (when declared(DictionaryResult):
    when ownSizeof(DictionaryResult) != ownSizeof(DictionaryResult_570426011):
      static :
        warning("Declaration of " & "DictionaryResult" &
            " exists but with different size")
    DictionaryResult
  else:
    DictionaryResult_570426011)
  struct_GSize_570426126 = (when declared(struct_GSize):
    when ownSizeof(struct_GSize) != ownSizeof(struct_GSize_570426125):
      static :
        warning("Declaration of " & "struct_GSize" &
            " exists but with different size")
    struct_GSize
  else:
    struct_GSize_570426125)
  GPath_570426190 = (when declared(GPath):
    when ownSizeof(GPath) != ownSizeof(GPath_570426189):
      static :
        warning("Declaration of " & "GPath" & " exists but with different size")
    GPath
  else:
    GPath_570426189)
  AnimationCurve_570426252 = (when declared(AnimationCurve):
    when ownSizeof(AnimationCurve) != ownSizeof(AnimationCurve_570426251):
      static :
        warning("Declaration of " & "AnimationCurve" &
            " exists but with different size")
    AnimationCurve
  else:
    AnimationCurve_570426251)
  compiler_darwin_time_t_570426451 = (when declared(compiler_darwin_time_t):
    when ownSizeof(compiler_darwin_time_t) != ownSizeof(compiler_darwin_time_t_570426450):
      static :
        warning("Declaration of " & "compiler_darwin_time_t" &
            " exists but with different size")
    compiler_darwin_time_t
  else:
    compiler_darwin_time_t_570426450)
  enum_SmartstrapResult_570426206 = (when declared(enum_SmartstrapResult):
    when ownSizeof(enum_SmartstrapResult) != ownSizeof(enum_SmartstrapResult_570426205):
      static :
        warning("Declaration of " & "enum_SmartstrapResult" &
            " exists but with different size")
    enum_SmartstrapResult
  else:
    enum_SmartstrapResult_570426205)
  MenuLayerDrawSeparatorCallback_570426362 = (when declared(
      MenuLayerDrawSeparatorCallback):
    when ownSizeof(MenuLayerDrawSeparatorCallback) !=
        ownSizeof(MenuLayerDrawSeparatorCallback_570426361):
      static :
        warning("Declaration of " & "MenuLayerDrawSeparatorCallback" &
            " exists but with different size")
    MenuLayerDrawSeparatorCallback
  else:
    MenuLayerDrawSeparatorCallback_570426361)
when not declared(SmartstrapNotifyHandler):
  type
    SmartstrapNotifyHandler* = SmartstrapNotifyHandler_570426221
else:
  static :
    hint("Declaration of " & "SmartstrapNotifyHandler" &
        " already exists, not redeclaring")
when not declared(enum_WeekDay):
  type
    enum_WeekDay* = enum_WeekDay_570425864
else:
  static :
    hint("Declaration of " & "enum_WeekDay" & " already exists, not redeclaring")
when not declared(Dictionary):
  type
    Dictionary* = Dictionary_570426021
else:
  static :
    hint("Declaration of " & "Dictionary" & " already exists, not redeclaring")
when not declared(AnimationCurveFunction):
  type
    AnimationCurveFunction* = AnimationCurveFunction_570426253
else:
  static :
    hint("Declaration of " & "AnimationCurveFunction" &
        " already exists, not redeclaring")
when not declared(SimpleMenuItem):
  type
    SimpleMenuItem* = SimpleMenuItem_570426385
else:
  static :
    hint("Declaration of " & "SimpleMenuItem" &
        " already exists, not redeclaring")
when not declared(SimpleMenuSection):
  type
    SimpleMenuSection* = SimpleMenuSection_570426389
else:
  static :
    hint("Declaration of " & "SimpleMenuSection" &
        " already exists, not redeclaring")
when not declared(enum_TimeUnits):
  type
    enum_TimeUnits* = enum_TimeUnits_570425935
else:
  static :
    hint("Declaration of " & "enum_TimeUnits" &
        " already exists, not redeclaring")
when not declared(HealthActivityMask):
  type
    HealthActivityMask* = HealthActivityMask_570425957
else:
  static :
    hint("Declaration of " & "HealthActivityMask" &
        " already exists, not redeclaring")
when not declared(GOvalScaleMode):
  type
    GOvalScaleMode* = GOvalScaleMode_570426165
else:
  static :
    hint("Declaration of " & "GOvalScaleMode" &
        " already exists, not redeclaring")
when not declared(struct_AnimationHandlers):
  type
    struct_AnimationHandlers* = struct_AnimationHandlers_570426259
else:
  static :
    hint("Declaration of " & "struct_AnimationHandlers" &
        " already exists, not redeclaring")
when not declared(struct_SimpleMenuSection):
  type
    struct_SimpleMenuSection* = struct_SimpleMenuSection_570426387
else:
  static :
    hint("Declaration of " & "struct_SimpleMenuSection" &
        " already exists, not redeclaring")
when not declared(struct_GPath):
  type
    struct_GPath* = struct_GPath_570426187
else:
  static :
    hint("Declaration of " & "struct_GPath" & " already exists, not redeclaring")
when not declared(enum_ButtonId):
  type
    enum_ButtonId* = enum_ButtonId_570425848
else:
  static :
    hint("Declaration of " & "enum_ButtonId" &
        " already exists, not redeclaring")
when not declared(FontInfo):
  type
    FontInfo* = FontInfo_570426191
else:
  static :
    hint("Declaration of " & "FontInfo" & " already exists, not redeclaring")
when not declared(UInt32Getter):
  type
    UInt32Getter* = UInt32Getter_570426293
else:
  static :
    hint("Declaration of " & "UInt32Getter" & " already exists, not redeclaring")
when not declared(BatteryChargeState):
  type
    BatteryChargeState* = BatteryChargeState_570425890
else:
  static :
    hint("Declaration of " & "BatteryChargeState" &
        " already exists, not redeclaring")
when not declared(AppSyncTupleChangedCallback):
  type
    AppSyncTupleChangedCallback* = AppSyncTupleChangedCallback_570426055
else:
  static :
    hint("Declaration of " & "AppSyncTupleChangedCallback" &
        " already exists, not redeclaring")
when not declared(enum_SniffInterval):
  type
    enum_SniffInterval* = enum_SniffInterval_570426075
else:
  static :
    hint("Declaration of " & "enum_SniffInterval" &
        " already exists, not redeclaring")
when not declared(GDrawCommandListIteratorCb):
  type
    GDrawCommandListIteratorCb* = GDrawCommandListIteratorCb_570426175
else:
  static :
    hint("Declaration of " & "GDrawCommandListIteratorCb" &
        " already exists, not redeclaring")
when not declared(AnimationUpdateImplementation):
  type
    AnimationUpdateImplementation* = AnimationUpdateImplementation_570426265
else:
  static :
    hint("Declaration of " & "AnimationUpdateImplementation" &
        " already exists, not redeclaring")
when not declared(ActionMenu):
  type
    ActionMenu* = ActionMenu_570426423
else:
  static :
    hint("Declaration of " & "ActionMenu" & " already exists, not redeclaring")
when not declared(MenuLayerSelectionChangedCallback):
  type
    MenuLayerSelectionChangedCallback* = MenuLayerSelectionChangedCallback_570426365
else:
  static :
    hint("Declaration of " & "MenuLayerSelectionChangedCallback" &
        " already exists, not redeclaring")
when not declared(MenuLayerGetCellHeightCallback):
  type
    MenuLayerGetCellHeightCallback* = MenuLayerGetCellHeightCallback_570426351
else:
  static :
    hint("Declaration of " & "MenuLayerGetCellHeightCallback" &
        " already exists, not redeclaring")
when not declared(enum_GCompOp):
  type
    enum_GCompOp* = enum_GCompOp_570426149
else:
  static :
    hint("Declaration of " & "enum_GCompOp" & " already exists, not redeclaring")
when not declared(MenuLayerSelectionWillChangeCallback):
  type
    MenuLayerSelectionWillChangeCallback* = MenuLayerSelectionWillChangeCallback_570426367
else:
  static :
    hint("Declaration of " & "MenuLayerSelectionWillChangeCallback" &
        " already exists, not redeclaring")
when not declared(struct_PropertyAnimationAccessors):
  type
    struct_PropertyAnimationAccessors* = struct_PropertyAnimationAccessors_570426275
else:
  static :
    hint("Declaration of " & "struct_PropertyAnimationAccessors" &
        " already exists, not redeclaring")
when not declared(MenuLayerCallbacks):
  type
    MenuLayerCallbacks* = MenuLayerCallbacks_570426373
else:
  static :
    hint("Declaration of " & "MenuLayerCallbacks" &
        " already exists, not redeclaring")
when not declared(HealthValue):
  type
    HealthValue* = HealthValue_570425945
else:
  static :
    hint("Declaration of " & "HealthValue" & " already exists, not redeclaring")
when not declared(enum_WatchInfoColor):
  type
    enum_WatchInfoColor* = enum_WatchInfoColor_570425856
else:
  static :
    hint("Declaration of " & "enum_WatchInfoColor" &
        " already exists, not redeclaring")
when not declared(AccelAxisType):
  type
    AccelAxisType* = AccelAxisType_570425904
else:
  static :
    hint("Declaration of " & "AccelAxisType" &
        " already exists, not redeclaring")
when not declared(enum_DataLoggingResult):
  type
    enum_DataLoggingResult* = enum_DataLoggingResult_570425997
else:
  static :
    hint("Declaration of " & "enum_DataLoggingResult" &
        " already exists, not redeclaring")
when not declared(AppExitReason):
  type
    AppExitReason* = AppExitReason_570426099
else:
  static :
    hint("Declaration of " & "AppExitReason" &
        " already exists, not redeclaring")
when not declared(PropertyAnimationImplementation):
  type
    PropertyAnimationImplementation* = PropertyAnimationImplementation_570426277
else:
  static :
    hint("Declaration of " & "PropertyAnimationImplementation" &
        " already exists, not redeclaring")
when not declared(PropertyAnimation):
  type
    PropertyAnimation* = PropertyAnimation_570426281
else:
  static :
    hint("Declaration of " & "PropertyAnimation" &
        " already exists, not redeclaring")
when not declared(struct_WatchInfoVersion):
  type
    struct_WatchInfoVersion* = struct_WatchInfoVersion_570425860
else:
  static :
    hint("Declaration of " & "struct_WatchInfoVersion" &
        " already exists, not redeclaring")
when not declared(NumberWindowCallbacks):
  type
    NumberWindowCallbacks* = NumberWindowCallbacks_570426413
else:
  static :
    hint("Declaration of " & "NumberWindowCallbacks" &
        " already exists, not redeclaring")
when not declared(GDrawCommandFrame):
  type
    GDrawCommandFrame* = GDrawCommandFrame_570426169
else:
  static :
    hint("Declaration of " & "GDrawCommandFrame" &
        " already exists, not redeclaring")
when not declared(GBitmapDataRowInfo):
  type
    GBitmapDataRowInfo* = GBitmapDataRowInfo_570426143
else:
  static :
    hint("Declaration of " & "GBitmapDataRowInfo" &
        " already exists, not redeclaring")
when not declared(MenuLayerDrawRowCallback):
  type
    MenuLayerDrawRowCallback* = MenuLayerDrawRowCallback_570426357
else:
  static :
    hint("Declaration of " & "MenuLayerDrawRowCallback" &
        " already exists, not redeclaring")
when not declared(struct_SimpleMenuItem):
  type
    struct_SimpleMenuItem* = struct_SimpleMenuItem_570426383
else:
  static :
    hint("Declaration of " & "struct_SimpleMenuItem" &
        " already exists, not redeclaring")
when not declared(Layer):
  type
    Layer* = Layer_570426233
else:
  static :
    hint("Declaration of " & "Layer" & " already exists, not redeclaring")
when not declared(struct_AppFocusHandlers):
  type
    struct_AppFocusHandlers* = struct_AppFocusHandlers_570425884
else:
  static :
    hint("Declaration of " & "struct_AppFocusHandlers" &
        " already exists, not redeclaring")
when not declared(AnimationImplementation):
  type
    AnimationImplementation* = AnimationImplementation_570426271
else:
  static :
    hint("Declaration of " & "AnimationImplementation" &
        " already exists, not redeclaring")
when not declared(enum_ActionBarLayerIconPressAnimation):
  type
    enum_ActionBarLayerIconPressAnimation* = enum_ActionBarLayerIconPressAnimation_570426391
else:
  static :
    hint("Declaration of " & "enum_ActionBarLayerIconPressAnimation" &
        " already exists, not redeclaring")
when not declared(HealthActivity):
  type
    HealthActivity* = HealthActivity_570425961
else:
  static :
    hint("Declaration of " & "HealthActivity" &
        " already exists, not redeclaring")
when not declared(GColor8):
  type
    GColor8* = GColor8_570426117
else:
  static :
    hint("Declaration of " & "GColor8" & " already exists, not redeclaring")
when not declared(struct_Tuplet):
  type
    struct_Tuplet* = struct_Tuplet_570426027
else:
  static :
    hint("Declaration of " & "struct_Tuplet" &
        " already exists, not redeclaring")
when not declared(DictationSessionStatusCallback):
  type
    DictationSessionStatusCallback* = DictationSessionStatusCallback_570426041
else:
  static :
    hint("Declaration of " & "DictationSessionStatusCallback" &
        " already exists, not redeclaring")
when not declared(DictionarySerializeCallback):
  type
    DictionarySerializeCallback* = DictionarySerializeCallback_570426031
else:
  static :
    hint("Declaration of " & "DictionarySerializeCallback" &
        " already exists, not redeclaring")
when not declared(GColor8Getter):
  type
    GColor8Getter* = GColor8Getter_570426305
else:
  static :
    hint("Declaration of " & "GColor8Getter" &
        " already exists, not redeclaring")
when not declared(ResHandle):
  type
    ResHandle* = ResHandle_570426063
else:
  static :
    hint("Declaration of " & "ResHandle" & " already exists, not redeclaring")
when not declared(enum_HealthServiceAccessibilityMask):
  type
    enum_HealthServiceAccessibilityMask* = enum_HealthServiceAccessibilityMask_570425969
else:
  static :
    hint("Declaration of " & "enum_HealthServiceAccessibilityMask" &
        " already exists, not redeclaring")
when not declared(Int16Setter):
  type
    Int16Setter* = Int16Setter_570426287
else:
  static :
    hint("Declaration of " & "Int16Setter" & " already exists, not redeclaring")
when not declared(MeasurementSystem):
  type
    MeasurementSystem* = MeasurementSystem_570425989
else:
  static :
    hint("Declaration of " & "MeasurementSystem" &
        " already exists, not redeclaring")
when not declared(ScrollLayerCallbacks):
  type
    ScrollLayerCallbacks* = ScrollLayerCallbacks_570426325
else:
  static :
    hint("Declaration of " & "ScrollLayerCallbacks" &
        " already exists, not redeclaring")
when not declared(ContentIndicatorConfig):
  type
    ContentIndicatorConfig* = ContentIndicatorConfig_570426335
else:
  static :
    hint("Declaration of " & "ContentIndicatorConfig" &
        " already exists, not redeclaring")
when not declared(ActionMenuConfig):
  type
    ActionMenuConfig* = ActionMenuConfig_570426437
else:
  static :
    hint("Declaration of " & "ActionMenuConfig" &
        " already exists, not redeclaring")
when not declared(struct_AppSync):
  type
    struct_AppSync* = struct_AppSync_570426059
else:
  static :
    hint("Declaration of " & "struct_AppSync" &
        " already exists, not redeclaring")
when not declared(AppGlanceResult):
  type
    AppGlanceResult* = AppGlanceResult_570426109
else:
  static :
    hint("Declaration of " & "AppGlanceResult" &
        " already exists, not redeclaring")
when not declared(AppSync):
  type
    AppSync* = AppSync_570426061
else:
  static :
    hint("Declaration of " & "AppSync" & " already exists, not redeclaring")
when not declared(WatchInfoModel):
  type
    WatchInfoModel* = WatchInfoModel_570425854
else:
  static :
    hint("Declaration of " & "WatchInfoModel" &
        " already exists, not redeclaring")
when not declared(ConnectionHandler):
  type
    ConnectionHandler* = ConnectionHandler_570425874
else:
  static :
    hint("Declaration of " & "ConnectionHandler" &
        " already exists, not redeclaring")
when not declared(GTextOverflowMode):
  type
    GTextOverflowMode* = GTextOverflowMode_570426197
else:
  static :
    hint("Declaration of " & "GTextOverflowMode" &
        " already exists, not redeclaring")
when not declared(MenuLayerGetNumberOfSectionsCallback):
  type
    MenuLayerGetNumberOfSectionsCallback* = MenuLayerGetNumberOfSectionsCallback_570426347
else:
  static :
    hint("Declaration of " & "MenuLayerGetNumberOfSectionsCallback" &
        " already exists, not redeclaring")
when not declared(AppLogLevel):
  type
    AppLogLevel* = AppLogLevel_570426007
else:
  static :
    hint("Declaration of " & "AppLogLevel" & " already exists, not redeclaring")
when not declared(enum_AccelSamplingRate):
  type
    enum_AccelSamplingRate* = enum_AccelSamplingRate_570425912
else:
  static :
    hint("Declaration of " & "enum_AccelSamplingRate" &
        " already exists, not redeclaring")
when not declared(HealthServiceTimeScope):
  type
    HealthServiceTimeScope* = HealthServiceTimeScope_570425951
else:
  static :
    hint("Declaration of " & "HealthServiceTimeScope" &
        " already exists, not redeclaring")
when not declared(AnimationHandlers):
  type
    AnimationHandlers* = AnimationHandlers_570426261
else:
  static :
    hint("Declaration of " & "AnimationHandlers" &
        " already exists, not redeclaring")
when not declared(struct_AnimationImplementation):
  type
    struct_AnimationImplementation* = struct_AnimationImplementation_570426269
else:
  static :
    hint("Declaration of " & "struct_AnimationImplementation" &
        " already exists, not redeclaring")
when not declared(GPointSetter):
  type
    GPointSetter* = GPointSetter_570426295
else:
  static :
    hint("Declaration of " & "GPointSetter" & " already exists, not redeclaring")
when not declared(HealthMinuteData):
  type
    HealthMinuteData* = HealthMinuteData_570425985
else:
  static :
    hint("Declaration of " & "HealthMinuteData" &
        " already exists, not redeclaring")
when not declared(AccelDataHandler):
  type
    AccelDataHandler* = AccelDataHandler_570425906
else:
  static :
    hint("Declaration of " & "AccelDataHandler" &
        " already exists, not redeclaring")
when not declared(MenuLayerGetNumberOfRowsInSectionsCallback):
  type
    MenuLayerGetNumberOfRowsInSectionsCallback* = MenuLayerGetNumberOfRowsInSectionsCallback_570426349
else:
  static :
    hint("Declaration of " & "MenuLayerGetNumberOfRowsInSectionsCallback" &
        " already exists, not redeclaring")
when not declared(enum_StatusBarLayerSeparatorMode):
  type
    enum_StatusBarLayerSeparatorMode* = enum_StatusBarLayerSeparatorMode_570426399
else:
  static :
    hint("Declaration of " & "enum_StatusBarLayerSeparatorMode" &
        " already exists, not redeclaring")
when not declared(enum_GTextOverflowMode):
  type
    enum_GTextOverflowMode* = enum_GTextOverflowMode_570426195
else:
  static :
    hint("Declaration of " & "enum_GTextOverflowMode" &
        " already exists, not redeclaring")
when not declared(enum_HealthMetric):
  type
    enum_HealthMetric* = enum_HealthMetric_570425941
else:
  static :
    hint("Declaration of " & "enum_HealthMetric" &
        " already exists, not redeclaring")
when not declared(HealthAggregation):
  type
    HealthAggregation* = HealthAggregation_570425955
else:
  static :
    hint("Declaration of " & "HealthAggregation" &
        " already exists, not redeclaring")
when not declared(enum_MenuRowAlign):
  type
    enum_MenuRowAlign* = enum_MenuRowAlign_570426375
else:
  static :
    hint("Declaration of " & "enum_MenuRowAlign" &
        " already exists, not redeclaring")
when not declared(Int16Getter):
  type
    Int16Getter* = Int16Getter_570426289
else:
  static :
    hint("Declaration of " & "Int16Getter" & " already exists, not redeclaring")
when not declared(enum_StatusCode):
  type
    enum_StatusCode* = enum_StatusCode_570426083
else:
  static :
    hint("Declaration of " & "enum_StatusCode" &
        " already exists, not redeclaring")
when not declared(WindowHandler):
  type
    WindowHandler* = WindowHandler_570426239
else:
  static :
    hint("Declaration of " & "WindowHandler" &
        " already exists, not redeclaring")
when not declared(enum_PreferredContentSize):
  type
    enum_PreferredContentSize* = enum_PreferredContentSize_570426443
else:
  static :
    hint("Declaration of " & "enum_PreferredContentSize" &
        " already exists, not redeclaring")
when not declared(WatchInfoColor):
  type
    WatchInfoColor* = WatchInfoColor_570425858
else:
  static :
    hint("Declaration of " & "WatchInfoColor" &
        " already exists, not redeclaring")
when not declared(ButtonId):
  type
    ButtonId* = ButtonId_570425850
else:
  static :
    hint("Declaration of " & "ButtonId" & " already exists, not redeclaring")
when not declared(enum_CompassStatus):
  type
    enum_CompassStatus* = enum_CompassStatus_570425916
else:
  static :
    hint("Declaration of " & "enum_CompassStatus" &
        " already exists, not redeclaring")
when not declared(enum_TupleType):
  type
    enum_TupleType* = enum_TupleType_570426013
else:
  static :
    hint("Declaration of " & "enum_TupleType" &
        " already exists, not redeclaring")
when not declared(ScrollLayer):
  type
    ScrollLayer* = ScrollLayer_570426319
else:
  static :
    hint("Declaration of " & "ScrollLayer" & " already exists, not redeclaring")
when not declared(GPoint):
  type
    GPoint* = GPoint_570426123
else:
  static :
    hint("Declaration of " & "GPoint" & " already exists, not redeclaring")
when not declared(struct_GRect):
  type
    struct_GRect* = struct_GRect_570426129
else:
  static :
    hint("Declaration of " & "struct_GRect" & " already exists, not redeclaring")
when not declared(AppFocusHandler):
  type
    AppFocusHandler* = AppFocusHandler_570425882
else:
  static :
    hint("Declaration of " & "AppFocusHandler" &
        " already exists, not redeclaring")
when not declared(SmartstrapServiceAvailabilityHandler):
  type
    SmartstrapServiceAvailabilityHandler* = SmartstrapServiceAvailabilityHandler_570426215
else:
  static :
    hint("Declaration of " & "SmartstrapServiceAvailabilityHandler" &
        " already exists, not redeclaring")
when not declared(GRectGetter):
  type
    GRectGetter* = GRectGetter_570426301
else:
  static :
    hint("Declaration of " & "GRectGetter" & " already exists, not redeclaring")
when not declared(struct_UnobstructedAreaHandlers):
  type
    struct_UnobstructedAreaHandlers* = struct_UnobstructedAreaHandlers_570426313
else:
  static :
    hint("Declaration of " & "struct_UnobstructedAreaHandlers" &
        " already exists, not redeclaring")
when not declared(GSize):
  type
    GSize* = GSize_570426127
else:
  static :
    hint("Declaration of " & "GSize" & " already exists, not redeclaring")
when not declared(MenuLayerDrawHeaderCallback):
  type
    MenuLayerDrawHeaderCallback* = MenuLayerDrawHeaderCallback_570426359
else:
  static :
    hint("Declaration of " & "MenuLayerDrawHeaderCallback" &
        " already exists, not redeclaring")
when not declared(GColor):
  type
    GColor* = GColor_570426119
else:
  static :
    hint("Declaration of " & "GColor" & " already exists, not redeclaring")
when not declared(struct_WindowHandlers):
  type
    struct_WindowHandlers* = struct_WindowHandlers_570426241
else:
  static :
    hint("Declaration of " & "struct_WindowHandlers" &
        " already exists, not redeclaring")
when not declared(GCornerMask):
  type
    GCornerMask* = GCornerMask_570426161
else:
  static :
    hint("Declaration of " & "GCornerMask" & " already exists, not redeclaring")
when not declared(enum_AppGlanceResult):
  type
    enum_AppGlanceResult* = enum_AppGlanceResult_570426107
else:
  static :
    hint("Declaration of " & "enum_AppGlanceResult" &
        " already exists, not redeclaring")
when not declared(BluetoothConnectionHandler):
  type
    BluetoothConnectionHandler* = BluetoothConnectionHandler_570425880
else:
  static :
    hint("Declaration of " & "BluetoothConnectionHandler" &
        " already exists, not redeclaring")
when not declared(enum_HealthServiceTimeScope):
  type
    enum_HealthServiceTimeScope* = enum_HealthServiceTimeScope_570425949
else:
  static :
    hint("Declaration of " & "enum_HealthServiceTimeScope" &
        " already exists, not redeclaring")
when not declared(HealthActivityIteratorCB):
  type
    HealthActivityIteratorCB* = HealthActivityIteratorCB_570425963
else:
  static :
    hint("Declaration of " & "HealthActivityIteratorCB" &
        " already exists, not redeclaring")
when not declared(AppTimerCallback):
  type
    AppTimerCallback* = AppTimerCallback_570426081
else:
  static :
    hint("Declaration of " & "AppTimerCallback" &
        " already exists, not redeclaring")
when not declared(enum_AppExitReason):
  type
    enum_AppExitReason* = enum_AppExitReason_570426097
else:
  static :
    hint("Declaration of " & "enum_AppExitReason" &
        " already exists, not redeclaring")
when not declared(AccelData):
  type
    AccelData* = AccelData_570425896
else:
  static :
    hint("Declaration of " & "AccelData" & " already exists, not redeclaring")
when not declared(struct_GPoint):
  type
    struct_GPoint* = struct_GPoint_570426121
else:
  static :
    hint("Declaration of " & "struct_GPoint" &
        " already exists, not redeclaring")
when not declared(enum_AnimationCurve):
  type
    enum_AnimationCurve* = enum_AnimationCurve_570426249
else:
  static :
    hint("Declaration of " & "enum_AnimationCurve" &
        " already exists, not redeclaring")
when not declared(ContentIndicatorDirection):
  type
    ContentIndicatorDirection* = ContentIndicatorDirection_570426331
else:
  static :
    hint("Declaration of " & "ContentIndicatorDirection" &
        " already exists, not redeclaring")
when not declared(struct_ScrollLayerCallbacks):
  type
    struct_ScrollLayerCallbacks* = struct_ScrollLayerCallbacks_570426323
else:
  static :
    hint("Declaration of " & "struct_ScrollLayerCallbacks" &
        " already exists, not redeclaring")
when not declared(GRectReturn):
  type
    GRectReturn* = GRectReturn_570426285
else:
  static :
    hint("Declaration of " & "GRectReturn" & " already exists, not redeclaring")
when not declared(GAlign):
  type
    GAlign* = GAlign_570426147
else:
  static :
    hint("Declaration of " & "GAlign" & " already exists, not redeclaring")
when not declared(ClickRecognizerRef):
  type
    ClickRecognizerRef* = ClickRecognizerRef_570426227
else:
  static :
    hint("Declaration of " & "ClickRecognizerRef" &
        " already exists, not redeclaring")
when not declared(struct_Uuid):
  type
    struct_Uuid* = struct_Uuid_570426001
else:
  static :
    hint("Declaration of " & "struct_Uuid" & " already exists, not redeclaring")
when not declared(struct_AccelData):
  type
    struct_AccelData* = struct_AccelData_570425894
else:
  static :
    hint("Declaration of " & "struct_AccelData" &
        " already exists, not redeclaring")
when not declared(AmbientLightLevel):
  type
    AmbientLightLevel* = AmbientLightLevel_570425981
else:
  static :
    hint("Declaration of " & "AmbientLightLevel" &
        " already exists, not redeclaring")
when not declared(tm):
  type
    tm* = tm_570425844
else:
  static :
    hint("Declaration of " & "tm" & " already exists, not redeclaring")
when not declared(SmartstrapAttribute):
  type
    SmartstrapAttribute* = SmartstrapAttribute_570426213
else:
  static :
    hint("Declaration of " & "SmartstrapAttribute" &
        " already exists, not redeclaring")
when not declared(DictionaryKeyUpdatedCallback):
  type
    DictionaryKeyUpdatedCallback* = DictionaryKeyUpdatedCallback_570426033
else:
  static :
    hint("Declaration of " & "DictionaryKeyUpdatedCallback" &
        " already exists, not redeclaring")
when not declared(struct_GEdgeInsets):
  type
    struct_GEdgeInsets* = struct_GEdgeInsets_570426155
else:
  static :
    hint("Declaration of " & "struct_GEdgeInsets" &
        " already exists, not redeclaring")
when not declared(TextLayer):
  type
    TextLayer* = TextLayer_570426317
else:
  static :
    hint("Declaration of " & "TextLayer" & " already exists, not redeclaring")
when not declared(enum_HealthEventType):
  type
    enum_HealthEventType* = enum_HealthEventType_570425973
else:
  static :
    hint("Declaration of " & "enum_HealthEventType" &
        " already exists, not redeclaring")
when not declared(struct_AppWorkerMessage):
  type
    struct_AppWorkerMessage* = struct_AppWorkerMessage_570426069
else:
  static :
    hint("Declaration of " & "struct_AppWorkerMessage" &
        " already exists, not redeclaring")
when not declared(AppMessageResult):
  type
    AppMessageResult* = AppMessageResult_570426045
else:
  static :
    hint("Declaration of " & "AppMessageResult" &
        " already exists, not redeclaring")
when not declared(MenuLayerDrawBackgroundCallback):
  type
    MenuLayerDrawBackgroundCallback* = MenuLayerDrawBackgroundCallback_570426369
else:
  static :
    hint("Declaration of " & "MenuLayerDrawBackgroundCallback" &
        " already exists, not redeclaring")
when not declared(AccelTapHandler):
  type
    AccelTapHandler* = AccelTapHandler_570425910
else:
  static :
    hint("Declaration of " & "AccelTapHandler" &
        " already exists, not redeclaring")
when not declared(enum_GCornerMask):
  type
    enum_GCornerMask* = enum_GCornerMask_570426159
else:
  static :
    hint("Declaration of " & "enum_GCornerMask" &
        " already exists, not redeclaring")
when not declared(PublishedId):
  type
    PublishedId* = PublishedId_570426101
else:
  static :
    hint("Declaration of " & "PublishedId" & " already exists, not redeclaring")
when not declared(Tuple_f):
  type
    Tuple_f* = Tuple_f_570426019
else:
  static :
    hint("Declaration of " & "Tuple_f" & " already exists, not redeclaring")
when not declared(UnobstructedAreaWillChangeHandler):
  type
    UnobstructedAreaWillChangeHandler* = UnobstructedAreaWillChangeHandler_570426307
else:
  static :
    hint("Declaration of " & "UnobstructedAreaWillChangeHandler" &
        " already exists, not redeclaring")
when not declared(AppGlanceReloadSession):
  type
    AppGlanceReloadSession* = AppGlanceReloadSession_570426111
else:
  static :
    hint("Declaration of " & "AppGlanceReloadSession" &
        " already exists, not redeclaring")
when not declared(ActionMenuLevel):
  type
    ActionMenuLevel* = ActionMenuLevel_570426417
else:
  static :
    hint("Declaration of " & "ActionMenuLevel" &
        " already exists, not redeclaring")
when not declared(GContext):
  type
    GContext* = GContext_570426153
else:
  static :
    hint("Declaration of " & "GContext" & " already exists, not redeclaring")
when not declared(SmartstrapServiceId):
  type
    SmartstrapServiceId* = SmartstrapServiceId_570426209
else:
  static :
    hint("Declaration of " & "SmartstrapServiceId" &
        " already exists, not redeclaring")
when not declared(AnimationTeardownImplementation):
  type
    AnimationTeardownImplementation* = AnimationTeardownImplementation_570426267
else:
  static :
    hint("Declaration of " & "AnimationTeardownImplementation" &
        " already exists, not redeclaring")
when not declared(Tuplet):
  type
    Tuplet* = Tuplet_570426029
else:
  static :
    hint("Declaration of " & "Tuplet" & " already exists, not redeclaring")
when not declared(struct_CompassHeadingData):
  type
    struct_CompassHeadingData* = struct_CompassHeadingData_570425922
else:
  static :
    hint("Declaration of " & "struct_CompassHeadingData" &
        " already exists, not redeclaring")
when not declared(StatusBarLayerSeparatorMode):
  type
    StatusBarLayerSeparatorMode* = StatusBarLayerSeparatorMode_570426401
else:
  static :
    hint("Declaration of " & "StatusBarLayerSeparatorMode" &
        " already exists, not redeclaring")
when not declared(struct_Tuple):
  type
    struct_Tuple* = struct_Tuple_570426017
else:
  static :
    hint("Declaration of " & "struct_Tuple" & " already exists, not redeclaring")
when not declared(AppFocusHandlers):
  type
    AppFocusHandlers* = AppFocusHandlers_570425886
else:
  static :
    hint("Declaration of " & "AppFocusHandlers" &
        " already exists, not redeclaring")
when not declared(enum_DictionaryResult):
  type
    enum_DictionaryResult* = enum_DictionaryResult_570426009
else:
  static :
    hint("Declaration of " & "enum_DictionaryResult" &
        " already exists, not redeclaring")
when not declared(TickHandler):
  type
    TickHandler* = TickHandler_570425939
else:
  static :
    hint("Declaration of " & "TickHandler" & " already exists, not redeclaring")
when not declared(HealthIterationDirection):
  type
    HealthIterationDirection* = HealthIterationDirection_570425967
else:
  static :
    hint("Declaration of " & "HealthIterationDirection" &
        " already exists, not redeclaring")
when not declared(struct_DictionaryIterator):
  type
    struct_DictionaryIterator* = struct_DictionaryIterator_570426023
else:
  static :
    hint("Declaration of " & "struct_DictionaryIterator" &
        " already exists, not redeclaring")
when not declared(TimeUnits):
  type
    TimeUnits* = TimeUnits_570425937
else:
  static :
    hint("Declaration of " & "TimeUnits" & " already exists, not redeclaring")
when not declared(enum_AppLaunchReason):
  type
    enum_AppLaunchReason* = enum_AppLaunchReason_570426093
else:
  static :
    hint("Declaration of " & "enum_AppLaunchReason" &
        " already exists, not redeclaring")
when not declared(ClickHandler):
  type
    ClickHandler* = ClickHandler_570426229
else:
  static :
    hint("Declaration of " & "ClickHandler" & " already exists, not redeclaring")
when not declared(MenuLayerSelectCallback):
  type
    MenuLayerSelectCallback* = MenuLayerSelectCallback_570426363
else:
  static :
    hint("Declaration of " & "MenuLayerSelectCallback" &
        " already exists, not redeclaring")
when not declared(NumberWindowCallback):
  type
    NumberWindowCallback* = NumberWindowCallback_570426409
else:
  static :
    hint("Declaration of " & "NumberWindowCallback" &
        " already exists, not redeclaring")
when not declared(AppMessageInboxDropped):
  type
    AppMessageInboxDropped* = AppMessageInboxDropped_570426049
else:
  static :
    hint("Declaration of " & "AppMessageInboxDropped" &
        " already exists, not redeclaring")
when not declared(struct_SmartstrapHandlers):
  type
    struct_SmartstrapHandlers* = struct_SmartstrapHandlers_570426223
else:
  static :
    hint("Declaration of " & "struct_SmartstrapHandlers" &
        " already exists, not redeclaring")
when not declared(struct_MenuCellSpan):
  type
    struct_MenuCellSpan* = struct_MenuCellSpan_570426341
else:
  static :
    hint("Declaration of " & "struct_MenuCellSpan" &
        " already exists, not redeclaring")
when not declared(AppLaunchReason):
  type
    AppLaunchReason* = AppLaunchReason_570426095
else:
  static :
    hint("Declaration of " & "AppLaunchReason" &
        " already exists, not redeclaring")
when not declared(WindowHandlers):
  type
    WindowHandlers* = WindowHandlers_570426243
else:
  static :
    hint("Declaration of " & "WindowHandlers" &
        " already exists, not redeclaring")
when not declared(AppMessageInboxReceived):
  type
    AppMessageInboxReceived* = AppMessageInboxReceived_570426047
else:
  static :
    hint("Declaration of " & "AppMessageInboxReceived" &
        " already exists, not redeclaring")
when not declared(struct_BatteryChargeState):
  type
    struct_BatteryChargeState* = struct_BatteryChargeState_570425888
else:
  static :
    hint("Declaration of " & "struct_BatteryChargeState" &
        " already exists, not redeclaring")
when not declared(enum_GTextAlignment):
  type
    enum_GTextAlignment* = enum_GTextAlignment_570426199
else:
  static :
    hint("Declaration of " & "enum_GTextAlignment" &
        " already exists, not redeclaring")
when not declared(UnobstructedAreaDidChangeHandler):
  type
    UnobstructedAreaDidChangeHandler* = UnobstructedAreaDidChangeHandler_570426311
else:
  static :
    hint("Declaration of " & "UnobstructedAreaDidChangeHandler" &
        " already exists, not redeclaring")
when not declared(LayerUpdateProc):
  type
    LayerUpdateProc* = LayerUpdateProc_570426235
else:
  static :
    hint("Declaration of " & "LayerUpdateProc" &
        " already exists, not redeclaring")
when not declared(HealthEventHandler):
  type
    HealthEventHandler* = HealthEventHandler_570425977
else:
  static :
    hint("Declaration of " & "HealthEventHandler" &
        " already exists, not redeclaring")
when not declared(enum_ActionMenuLevelDisplayMode):
  type
    enum_ActionMenuLevelDisplayMode* = enum_ActionMenuLevelDisplayMode_570426427
else:
  static :
    hint("Declaration of " & "enum_ActionMenuLevelDisplayMode" &
        " already exists, not redeclaring")
when not declared(WakeupId):
  type
    WakeupId* = WakeupId_570426089
else:
  static :
    hint("Declaration of " & "WakeupId" & " already exists, not redeclaring")
when not declared(SmartstrapResult):
  type
    SmartstrapResult* = SmartstrapResult_570426207
else:
  static :
    hint("Declaration of " & "SmartstrapResult" &
        " already exists, not redeclaring")
when not declared(MenuCellSpan):
  type
    MenuCellSpan* = MenuCellSpan_570426343
else:
  static :
    hint("Declaration of " & "MenuCellSpan" & " already exists, not redeclaring")
when not declared(DataLoggingSessionRef):
  type
    DataLoggingSessionRef* = DataLoggingSessionRef_570425991
else:
  static :
    hint("Declaration of " & "DataLoggingSessionRef" &
        " already exists, not redeclaring")
when not declared(StatusBarLayer):
  type
    StatusBarLayer* = StatusBarLayer_570426397
else:
  static :
    hint("Declaration of " & "StatusBarLayer" &
        " already exists, not redeclaring")
when not declared(AccelRawData):
  type
    AccelRawData* = AccelRawData_570425900
else:
  static :
    hint("Declaration of " & "AccelRawData" & " already exists, not redeclaring")
when not declared(struct_ActionMenuConfig):
  type
    struct_ActionMenuConfig* = struct_ActionMenuConfig_570426435
else:
  static :
    hint("Declaration of " & "struct_ActionMenuConfig" &
        " already exists, not redeclaring")
when not declared(struct_tm):
  type
    struct_tm* = struct_tm_570425846
else:
  static :
    hint("Declaration of " & "struct_tm" & " already exists, not redeclaring")
when not declared(enum_GOvalScaleMode):
  type
    enum_GOvalScaleMode* = enum_GOvalScaleMode_570426163
else:
  static :
    hint("Declaration of " & "enum_GOvalScaleMode" &
        " already exists, not redeclaring")
when not declared(ActionMenuLevelDisplayMode):
  type
    ActionMenuLevelDisplayMode* = ActionMenuLevelDisplayMode_570426429
else:
  static :
    hint("Declaration of " & "ActionMenuLevelDisplayMode" &
        " already exists, not redeclaring")
when not declared(status_t):
  type
    status_t* = status_t_570426087
else:
  static :
    hint("Declaration of " & "status_t" & " already exists, not redeclaring")
when not declared(VibePattern):
  type
    VibePattern* = VibePattern_570426441
else:
  static :
    hint("Declaration of " & "VibePattern" & " already exists, not redeclaring")
when not declared(GDrawCommand):
  type
    GDrawCommand* = GDrawCommand_570426167
else:
  static :
    hint("Declaration of " & "GDrawCommand" & " already exists, not redeclaring")
when not declared(SimpleMenuLayer):
  type
    SimpleMenuLayer* = SimpleMenuLayer_570426379
else:
  static :
    hint("Declaration of " & "SimpleMenuLayer" &
        " already exists, not redeclaring")
when not declared(GDrawCommandType):
  type
    GDrawCommandType* = GDrawCommandType_570426181
else:
  static :
    hint("Declaration of " & "GDrawCommandType" &
        " already exists, not redeclaring")
when not declared(enum_DataLoggingItemType):
  type
    enum_DataLoggingItemType* = enum_DataLoggingItemType_570425993
else:
  static :
    hint("Declaration of " & "enum_DataLoggingItemType" &
        " already exists, not redeclaring")
when not declared(GPointGetter):
  type
    GPointGetter* = GPointGetter_570426297
else:
  static :
    hint("Declaration of " & "GPointGetter" & " already exists, not redeclaring")
when not declared(HealthServiceAccessibilityMask):
  type
    HealthServiceAccessibilityMask* = HealthServiceAccessibilityMask_570425971
else:
  static :
    hint("Declaration of " & "HealthServiceAccessibilityMask" &
        " already exists, not redeclaring")
when not declared(enum_ActionMenuAlign):
  type
    enum_ActionMenuAlign* = enum_ActionMenuAlign_570426419
else:
  static :
    hint("Declaration of " & "enum_ActionMenuAlign" &
        " already exists, not redeclaring")
when not declared(enum_AppLogLevel):
  type
    enum_AppLogLevel* = enum_AppLogLevel_570426005
else:
  static :
    hint("Declaration of " & "enum_AppLogLevel" &
        " already exists, not redeclaring")
when not declared(DataLoggingItemType):
  type
    DataLoggingItemType* = DataLoggingItemType_570425995
else:
  static :
    hint("Declaration of " & "DataLoggingItemType" &
        " already exists, not redeclaring")
when not declared(AppGlanceSlice):
  type
    AppGlanceSlice* = AppGlanceSlice_570426105
else:
  static :
    hint("Declaration of " & "AppGlanceSlice" &
        " already exists, not redeclaring")
when not declared(AnimationStartedHandler):
  type
    AnimationStartedHandler* = AnimationStartedHandler_570426255
else:
  static :
    hint("Declaration of " & "AnimationStartedHandler" &
        " already exists, not redeclaring")
when not declared(HealthMetric):
  type
    HealthMetric* = HealthMetric_570425943
else:
  static :
    hint("Declaration of " & "HealthMetric" & " already exists, not redeclaring")
when not declared(DictationSession):
  type
    DictationSession* = DictationSession_570426035
else:
  static :
    hint("Declaration of " & "DictationSession" &
        " already exists, not redeclaring")
when not declared(GPointReturn):
  type
    GPointReturn* = GPointReturn_570426283
else:
  static :
    hint("Declaration of " & "GPointReturn" & " already exists, not redeclaring")
when not declared(enum_ContentIndicatorDirection):
  type
    enum_ContentIndicatorDirection* = enum_ContentIndicatorDirection_570426329
else:
  static :
    hint("Declaration of " & "enum_ContentIndicatorDirection" &
        " already exists, not redeclaring")
when not declared(SniffInterval):
  type
    SniffInterval* = SniffInterval_570426077
else:
  static :
    hint("Declaration of " & "SniffInterval" &
        " already exists, not redeclaring")
when not declared(CompassHeadingData):
  type
    CompassHeadingData* = CompassHeadingData_570425924
else:
  static :
    hint("Declaration of " & "CompassHeadingData" &
        " already exists, not redeclaring")
when not declared(AnimationProgress):
  type
    AnimationProgress* = AnimationProgress_570426247
else:
  static :
    hint("Declaration of " & "AnimationProgress" &
        " already exists, not redeclaring")
when not declared(BitmapLayer):
  type
    BitmapLayer* = BitmapLayer_570426403
else:
  static :
    hint("Declaration of " & "BitmapLayer" & " already exists, not redeclaring")
when not declared(PlatformType):
  type
    PlatformType* = PlatformType_570425872
else:
  static :
    hint("Declaration of " & "PlatformType" & " already exists, not redeclaring")
when not declared(struct_GBitmapDataRowInfo):
  type
    struct_GBitmapDataRowInfo* = struct_GBitmapDataRowInfo_570426141
else:
  static :
    hint("Declaration of " & "struct_GBitmapDataRowInfo" &
        " already exists, not redeclaring")
when not declared(enum_GDrawCommandType):
  type
    enum_GDrawCommandType* = enum_GDrawCommandType_570426179
else:
  static :
    hint("Declaration of " & "enum_GDrawCommandType" &
        " already exists, not redeclaring")
when not declared(AppGlanceReloadCallback):
  type
    AppGlanceReloadCallback* = AppGlanceReloadCallback_570426113
else:
  static :
    hint("Declaration of " & "AppGlanceReloadCallback" &
        " already exists, not redeclaring")
when not declared(AccelSamplingRate):
  type
    AccelSamplingRate* = AccelSamplingRate_570425914
else:
  static :
    hint("Declaration of " & "AccelSamplingRate" &
        " already exists, not redeclaring")
when not declared(GTextAlignment):
  type
    GTextAlignment* = GTextAlignment_570426201
else:
  static :
    hint("Declaration of " & "GTextAlignment" &
        " already exists, not redeclaring")
when not declared(struct_HealthMinuteData):
  type
    struct_HealthMinuteData* = struct_HealthMinuteData_570425983
else:
  static :
    hint("Declaration of " & "struct_HealthMinuteData" &
        " already exists, not redeclaring")
when not declared(DictionaryIterator):
  type
    DictionaryIterator* = DictionaryIterator_570426025
else:
  static :
    hint("Declaration of " & "DictionaryIterator" &
        " already exists, not redeclaring")
when not declared(AppTimer):
  type
    AppTimer* = AppTimer_570426079
else:
  static :
    hint("Declaration of " & "AppTimer" & " already exists, not redeclaring")
when not declared(NumberWindow):
  type
    NumberWindow* = NumberWindow_570426407
else:
  static :
    hint("Declaration of " & "NumberWindow" & " already exists, not redeclaring")
when not declared(HealthMetricAlert):
  type
    HealthMetricAlert* = HealthMetricAlert_570425947
else:
  static :
    hint("Declaration of " & "HealthMetricAlert" &
        " already exists, not redeclaring")
when not declared(MenuLayer):
  type
    MenuLayer* = MenuLayer_570426345
else:
  static :
    hint("Declaration of " & "MenuLayer" & " already exists, not redeclaring")
when not declared(enum_MeasurementSystem):
  type
    enum_MeasurementSystem* = enum_MeasurementSystem_570425987
else:
  static :
    hint("Declaration of " & "enum_MeasurementSystem" &
        " already exists, not redeclaring")
when not declared(WatchInfoVersion):
  type
    WatchInfoVersion* = WatchInfoVersion_570425862
else:
  static :
    hint("Declaration of " & "WatchInfoVersion" &
        " already exists, not redeclaring")
when not declared(UnobstructedAreaChangeHandler):
  type
    UnobstructedAreaChangeHandler* = UnobstructedAreaChangeHandler_570426309
else:
  static :
    hint("Declaration of " & "UnobstructedAreaChangeHandler" &
        " already exists, not redeclaring")
when not declared(enum_AccelAxisType):
  type
    enum_AccelAxisType* = enum_AccelAxisType_570425902
else:
  static :
    hint("Declaration of " & "enum_AccelAxisType" &
        " already exists, not redeclaring")
when not declared(enum_HealthIterationDirection):
  type
    enum_HealthIterationDirection* = enum_HealthIterationDirection_570425965
else:
  static :
    hint("Declaration of " & "enum_HealthIterationDirection" &
        " already exists, not redeclaring")
when not declared(enum_AmbientLightLevel):
  type
    enum_AmbientLightLevel* = enum_AmbientLightLevel_570425979
else:
  static :
    hint("Declaration of " & "enum_AmbientLightLevel" &
        " already exists, not redeclaring")
when not declared(AppWorkerMessage):
  type
    AppWorkerMessage* = AppWorkerMessage_570426071
else:
  static :
    hint("Declaration of " & "AppWorkerMessage" &
        " already exists, not redeclaring")
when not declared(AnimationStoppedHandler):
  type
    AnimationStoppedHandler* = AnimationStoppedHandler_570426257
else:
  static :
    hint("Declaration of " & "AnimationStoppedHandler" &
        " already exists, not redeclaring")
when not declared(BatteryStateHandler):
  type
    BatteryStateHandler* = BatteryStateHandler_570425892
else:
  static :
    hint("Declaration of " & "BatteryStateHandler" &
        " already exists, not redeclaring")
when not declared(GCompOp):
  type
    GCompOp* = GCompOp_570426151
else:
  static :
    hint("Declaration of " & "GCompOp" & " already exists, not redeclaring")
when not declared(GDrawCommandSequence):
  type
    GDrawCommandSequence* = GDrawCommandSequence_570426177
else:
  static :
    hint("Declaration of " & "GDrawCommandSequence" &
        " already exists, not redeclaring")
when not declared(GRectSetter):
  type
    GRectSetter* = GRectSetter_570426299
else:
  static :
    hint("Declaration of " & "GRectSetter" & " already exists, not redeclaring")
when not declared(struct_ConnectionHandlers):
  type
    struct_ConnectionHandlers* = struct_ConnectionHandlers_570425876
else:
  static :
    hint("Declaration of " & "struct_ConnectionHandlers" &
        " already exists, not redeclaring")
when not declared(MenuLayerGetHeaderHeightCallback):
  type
    MenuLayerGetHeaderHeightCallback* = MenuLayerGetHeaderHeightCallback_570426353
else:
  static :
    hint("Declaration of " & "MenuLayerGetHeaderHeightCallback" &
        " already exists, not redeclaring")
when not declared(GBitmap):
  type
    GBitmap* = GBitmap_570426137
else:
  static :
    hint("Declaration of " & "GBitmap" & " already exists, not redeclaring")
when not declared(enum_AppMessageResult):
  type
    enum_AppMessageResult* = enum_AppMessageResult_570426043
else:
  static :
    hint("Declaration of " & "enum_AppMessageResult" &
        " already exists, not redeclaring")
when not declared(MenuLayerGetSeparatorHeightCallback):
  type
    MenuLayerGetSeparatorHeightCallback* = MenuLayerGetSeparatorHeightCallback_570426355
else:
  static :
    hint("Declaration of " & "MenuLayerGetSeparatorHeightCallback" &
        " already exists, not redeclaring")
when not declared(enum_HealthActivity):
  type
    enum_HealthActivity* = enum_HealthActivity_570425959
else:
  static :
    hint("Declaration of " & "enum_HealthActivity" &
        " already exists, not redeclaring")
when not declared(MenuRowAlign):
  type
    MenuRowAlign* = MenuRowAlign_570426377
else:
  static :
    hint("Declaration of " & "MenuRowAlign" & " already exists, not redeclaring")
when not declared(time_t):
  type
    time_t* = time_t_570425868
else:
  static :
    hint("Declaration of " & "time_t" & " already exists, not redeclaring")
when not declared(AppMessageOutboxSent):
  type
    AppMessageOutboxSent* = AppMessageOutboxSent_570426051
else:
  static :
    hint("Declaration of " & "AppMessageOutboxSent" &
        " already exists, not redeclaring")
when not declared(DictationSessionStatus):
  type
    DictationSessionStatus* = DictationSessionStatus_570426039
else:
  static :
    hint("Declaration of " & "DictationSessionStatus" &
        " already exists, not redeclaring")
when not declared(GBitmapSequence):
  type
    GBitmapSequence* = GBitmapSequence_570426139
else:
  static :
    hint("Declaration of " & "GBitmapSequence" &
        " already exists, not redeclaring")
when not declared(AppMessageOutboxFailed):
  type
    AppMessageOutboxFailed* = AppMessageOutboxFailed_570426053
else:
  static :
    hint("Declaration of " & "AppMessageOutboxFailed" &
        " already exists, not redeclaring")
when not declared(TupleType):
  type
    TupleType* = TupleType_570426015
else:
  static :
    hint("Declaration of " & "TupleType" & " already exists, not redeclaring")
when not declared(struct_GPathInfo):
  type
    struct_GPathInfo* = struct_GPathInfo_570426183
else:
  static :
    hint("Declaration of " & "struct_GPathInfo" &
        " already exists, not redeclaring")
when not declared(GPathInfo):
  type
    GPathInfo* = GPathInfo_570426185
else:
  static :
    hint("Declaration of " & "GPathInfo" & " already exists, not redeclaring")
when not declared(enum_AppWorkerResult):
  type
    enum_AppWorkerResult* = enum_AppWorkerResult_570426065
else:
  static :
    hint("Declaration of " & "enum_AppWorkerResult" &
        " already exists, not redeclaring")
when not declared(enum_GBitmapFormat):
  type
    enum_GBitmapFormat* = enum_GBitmapFormat_570426133
else:
  static :
    hint("Declaration of " & "enum_GBitmapFormat" &
        " already exists, not redeclaring")
when not declared(CompassHeading):
  type
    CompassHeading* = CompassHeading_570425920
else:
  static :
    hint("Declaration of " & "CompassHeading" &
        " already exists, not redeclaring")
when not declared(GColor8Setter):
  type
    GColor8Setter* = GColor8Setter_570426303
else:
  static :
    hint("Declaration of " & "GColor8Setter" &
        " already exists, not redeclaring")
when not declared(struct_MenuLayerCallbacks):
  type
    struct_MenuLayerCallbacks* = struct_MenuLayerCallbacks_570426371
else:
  static :
    hint("Declaration of " & "struct_MenuLayerCallbacks" &
        " already exists, not redeclaring")
when not declared(GDrawCommandList):
  type
    GDrawCommandList* = GDrawCommandList_570426173
else:
  static :
    hint("Declaration of " & "GDrawCommandList" &
        " already exists, not redeclaring")
when not declared(struct_NumberWindowCallbacks):
  type
    struct_NumberWindowCallbacks* = struct_NumberWindowCallbacks_570426411
else:
  static :
    hint("Declaration of " & "struct_NumberWindowCallbacks" &
        " already exists, not redeclaring")
when not declared(enum_HealthAggregation):
  type
    enum_HealthAggregation* = enum_HealthAggregation_570425953
else:
  static :
    hint("Declaration of " & "enum_HealthAggregation" &
        " already exists, not redeclaring")
when not declared(ScrollLayerCallback):
  type
    ScrollLayerCallback* = ScrollLayerCallback_570426321
else:
  static :
    hint("Declaration of " & "ScrollLayerCallback" &
        " already exists, not redeclaring")
when not declared(ActionMenuItem):
  type
    ActionMenuItem* = ActionMenuItem_570426415
else:
  static :
    hint("Declaration of " & "ActionMenuItem" &
        " already exists, not redeclaring")
when not declared(ActionMenuPerformActionCb):
  type
    ActionMenuPerformActionCb* = ActionMenuPerformActionCb_570426431
else:
  static :
    hint("Declaration of " & "ActionMenuPerformActionCb" &
        " already exists, not redeclaring")
when not declared(struct_MenuIndex):
  type
    struct_MenuIndex* = struct_MenuIndex_570426337
else:
  static :
    hint("Declaration of " & "struct_MenuIndex" &
        " already exists, not redeclaring")
when not declared(RotBitmapLayer):
  type
    RotBitmapLayer* = RotBitmapLayer_570426405
else:
  static :
    hint("Declaration of " & "RotBitmapLayer" &
        " already exists, not redeclaring")
when not declared(GBitmapFormat):
  type
    GBitmapFormat* = GBitmapFormat_570426135
else:
  static :
    hint("Declaration of " & "GBitmapFormat" &
        " already exists, not redeclaring")
when not declared(GEdgeInsets):
  type
    GEdgeInsets* = GEdgeInsets_570426157
else:
  static :
    hint("Declaration of " & "GEdgeInsets" & " already exists, not redeclaring")
when not declared(AppSyncErrorCallback):
  type
    AppSyncErrorCallback* = AppSyncErrorCallback_570426057
else:
  static :
    hint("Declaration of " & "AppSyncErrorCallback" &
        " already exists, not redeclaring")
when not declared(GRect):
  type
    GRect* = GRect_570426131
else:
  static :
    hint("Declaration of " & "GRect" & " already exists, not redeclaring")
when not declared(ConnectionHandlers):
  type
    ConnectionHandlers* = ConnectionHandlers_570425878
else:
  static :
    hint("Declaration of " & "ConnectionHandlers" &
        " already exists, not redeclaring")
when not declared(GTextAttributes):
  type
    GTextAttributes* = GTextAttributes_570426203
else:
  static :
    hint("Declaration of " & "GTextAttributes" &
        " already exists, not redeclaring")
when not declared(WakeupHandler):
  type
    WakeupHandler* = WakeupHandler_570426091
else:
  static :
    hint("Declaration of " & "WakeupHandler" &
        " already exists, not redeclaring")
when not declared(HealthEventType):
  type
    HealthEventType* = HealthEventType_570425975
else:
  static :
    hint("Declaration of " & "HealthEventType" &
        " already exists, not redeclaring")
when not declared(struct_PropertyAnimationImplementation):
  type
    struct_PropertyAnimationImplementation* = struct_PropertyAnimationImplementation_570426279
else:
  static :
    hint("Declaration of " & "struct_PropertyAnimationImplementation" &
        " already exists, not redeclaring")
when not declared(Uuid):
  type
    Uuid* = Uuid_570426003
else:
  static :
    hint("Declaration of " & "Uuid" & " already exists, not redeclaring")
when not declared(ActionBarLayerIconPressAnimation):
  type
    ActionBarLayerIconPressAnimation* = ActionBarLayerIconPressAnimation_570426393
else:
  static :
    hint("Declaration of " & "ActionBarLayerIconPressAnimation" &
        " already exists, not redeclaring")
when not declared(UnobstructedAreaHandlers):
  type
    UnobstructedAreaHandlers* = UnobstructedAreaHandlers_570426315
else:
  static :
    hint("Declaration of " & "UnobstructedAreaHandlers" &
        " already exists, not redeclaring")
when not declared(CompassHeadingHandler):
  type
    CompassHeadingHandler* = CompassHeadingHandler_570425926
else:
  static :
    hint("Declaration of " & "CompassHeadingHandler" &
        " already exists, not redeclaring")
when not declared(UInt32Setter):
  type
    UInt32Setter* = UInt32Setter_570426291
else:
  static :
    hint("Declaration of " & "UInt32Setter" & " already exists, not redeclaring")
when not declared(ActionMenuEachItemCb):
  type
    ActionMenuEachItemCb* = ActionMenuEachItemCb_570426433
else:
  static :
    hint("Declaration of " & "ActionMenuEachItemCb" &
        " already exists, not redeclaring")
when not declared(enum_GAlign):
  type
    enum_GAlign* = enum_GAlign_570426145
else:
  static :
    hint("Declaration of " & "enum_GAlign" & " already exists, not redeclaring")
when not declared(AnimationSetupImplementation):
  type
    AnimationSetupImplementation* = AnimationSetupImplementation_570426263
else:
  static :
    hint("Declaration of " & "AnimationSetupImplementation" &
        " already exists, not redeclaring")
when not declared(PropertyAnimationAccessors):
  type
    PropertyAnimationAccessors* = PropertyAnimationAccessors_570426273
else:
  static :
    hint("Declaration of " & "PropertyAnimationAccessors" &
        " already exists, not redeclaring")
when not declared(CompassStatus):
  type
    CompassStatus* = CompassStatus_570425918
else:
  static :
    hint("Declaration of " & "CompassStatus" &
        " already exists, not redeclaring")
when not declared(AppWorkerResult):
  type
    AppWorkerResult* = AppWorkerResult_570426067
else:
  static :
    hint("Declaration of " & "AppWorkerResult" &
        " already exists, not redeclaring")
when not declared(SmartstrapReadHandler):
  type
    SmartstrapReadHandler* = SmartstrapReadHandler_570426217
else:
  static :
    hint("Declaration of " & "SmartstrapReadHandler" &
        " already exists, not redeclaring")
when not declared(GDrawCommandImage):
  type
    GDrawCommandImage* = GDrawCommandImage_570426171
else:
  static :
    hint("Declaration of " & "GDrawCommandImage" &
        " already exists, not redeclaring")
when not declared(union_GColor8):
  type
    union_GColor8* = union_GColor8_570426115
else:
  static :
    hint("Declaration of " & "union_GColor8" &
        " already exists, not redeclaring")
when not declared(ContentIndicator):
  type
    ContentIndicator* = ContentIndicator_570426327
else:
  static :
    hint("Declaration of " & "ContentIndicator" &
        " already exists, not redeclaring")
when not declared(SimpleMenuLayerSelectCallback):
  type
    SimpleMenuLayerSelectCallback* = SimpleMenuLayerSelectCallback_570426381
else:
  static :
    hint("Declaration of " & "SimpleMenuLayerSelectCallback" &
        " already exists, not redeclaring")
when not declared(enum_PlatformType):
  type
    enum_PlatformType* = enum_PlatformType_570425870
else:
  static :
    hint("Declaration of " & "enum_PlatformType" &
        " already exists, not redeclaring")
when not declared(struct_ContentIndicatorConfig):
  type
    struct_ContentIndicatorConfig* = struct_ContentIndicatorConfig_570426333
else:
  static :
    hint("Declaration of " & "struct_ContentIndicatorConfig" &
        " already exists, not redeclaring")
when not declared(struct_VibePattern):
  type
    struct_VibePattern* = struct_VibePattern_570426439
else:
  static :
    hint("Declaration of " & "struct_VibePattern" &
        " already exists, not redeclaring")
when not declared(SmartstrapAttributeId):
  type
    SmartstrapAttributeId* = SmartstrapAttributeId_570426211
else:
  static :
    hint("Declaration of " & "SmartstrapAttributeId" &
        " already exists, not redeclaring")
when not declared(PreferredContentSize):
  type
    PreferredContentSize* = PreferredContentSize_570426445
else:
  static :
    hint("Declaration of " & "PreferredContentSize" &
        " already exists, not redeclaring")
when not declared(ClickConfigProvider):
  type
    ClickConfigProvider* = ClickConfigProvider_570426231
else:
  static :
    hint("Declaration of " & "ClickConfigProvider" &
        " already exists, not redeclaring")
when not declared(MenuIndex):
  type
    MenuIndex* = MenuIndex_570426339
else:
  static :
    hint("Declaration of " & "MenuIndex" & " already exists, not redeclaring")
when not declared(ActionMenuAlign):
  type
    ActionMenuAlign* = ActionMenuAlign_570426421
else:
  static :
    hint("Declaration of " & "ActionMenuAlign" &
        " already exists, not redeclaring")
when not declared(Animation):
  type
    Animation* = Animation_570426245
else:
  static :
    hint("Declaration of " & "Animation" & " already exists, not redeclaring")
when not declared(ActionMenuDidCloseCb):
  type
    ActionMenuDidCloseCb* = ActionMenuDidCloseCb_570426425
else:
  static :
    hint("Declaration of " & "ActionMenuDidCloseCb" &
        " already exists, not redeclaring")
when not declared(struct_AppGlanceSlice):
  type
    struct_AppGlanceSlice* = struct_AppGlanceSlice_570426103
else:
  static :
    hint("Declaration of " & "struct_AppGlanceSlice" &
        " already exists, not redeclaring")
when not declared(Window):
  type
    Window* = Window_570426237
else:
  static :
    hint("Declaration of " & "Window" & " already exists, not redeclaring")
when not declared(DataLoggingResult):
  type
    DataLoggingResult* = DataLoggingResult_570425999
else:
  static :
    hint("Declaration of " & "DataLoggingResult" &
        " already exists, not redeclaring")
when not declared(StatusCode):
  type
    StatusCode* = StatusCode_570426085
else:
  static :
    hint("Declaration of " & "StatusCode" & " already exists, not redeclaring")
when not declared(enum_DictationSessionStatus):
  type
    enum_DictationSessionStatus* = enum_DictationSessionStatus_570426037
else:
  static :
    hint("Declaration of " & "enum_DictationSessionStatus" &
        " already exists, not redeclaring")
when not declared(SmartstrapWriteHandler):
  type
    SmartstrapWriteHandler* = SmartstrapWriteHandler_570426219
else:
  static :
    hint("Declaration of " & "SmartstrapWriteHandler" &
        " already exists, not redeclaring")
when not declared(SmartstrapHandlers):
  type
    SmartstrapHandlers* = SmartstrapHandlers_570426225
else:
  static :
    hint("Declaration of " & "SmartstrapHandlers" &
        " already exists, not redeclaring")
when not declared(AccelRawDataHandler):
  type
    AccelRawDataHandler* = AccelRawDataHandler_570425908
else:
  static :
    hint("Declaration of " & "AccelRawDataHandler" &
        " already exists, not redeclaring")
when not declared(WeekDay):
  type
    WeekDay* = WeekDay_570425866
else:
  static :
    hint("Declaration of " & "WeekDay" & " already exists, not redeclaring")
when not declared(enum_WatchInfoModel):
  type
    enum_WatchInfoModel* = enum_WatchInfoModel_570425852
else:
  static :
    hint("Declaration of " & "enum_WatchInfoModel" &
        " already exists, not redeclaring")
when not declared(AppWorkerMessageHandler):
  type
    AppWorkerMessageHandler* = AppWorkerMessageHandler_570426073
else:
  static :
    hint("Declaration of " & "AppWorkerMessageHandler" &
        " already exists, not redeclaring")
when not declared(GFont):
  type
    GFont* = GFont_570426193
else:
  static :
    hint("Declaration of " & "GFont" & " already exists, not redeclaring")
when not declared(ActionBarLayer):
  type
    ActionBarLayer* = ActionBarLayer_570426395
else:
  static :
    hint("Declaration of " & "ActionBarLayer" &
        " already exists, not redeclaring")
when not declared(struct_AccelRawData):
  type
    struct_AccelRawData* = struct_AccelRawData_570425898
else:
  static :
    hint("Declaration of " & "struct_AccelRawData" &
        " already exists, not redeclaring")
when not declared(DictionaryResult):
  type
    DictionaryResult* = DictionaryResult_570426011
else:
  static :
    hint("Declaration of " & "DictionaryResult" &
        " already exists, not redeclaring")
when not declared(struct_GSize):
  type
    struct_GSize* = struct_GSize_570426125
else:
  static :
    hint("Declaration of " & "struct_GSize" & " already exists, not redeclaring")
when not declared(GPath):
  type
    GPath* = GPath_570426189
else:
  static :
    hint("Declaration of " & "GPath" & " already exists, not redeclaring")
when not declared(AnimationCurve):
  type
    AnimationCurve* = AnimationCurve_570426251
else:
  static :
    hint("Declaration of " & "AnimationCurve" &
        " already exists, not redeclaring")
when not declared(compiler_darwin_time_t):
  type
    compiler_darwin_time_t* = compiler_darwin_time_t_570426450
else:
  static :
    hint("Declaration of " & "compiler_darwin_time_t" &
        " already exists, not redeclaring")
when not declared(enum_SmartstrapResult):
  type
    enum_SmartstrapResult* = enum_SmartstrapResult_570426205
else:
  static :
    hint("Declaration of " & "enum_SmartstrapResult" &
        " already exists, not redeclaring")
when not declared(MenuLayerDrawSeparatorCallback):
  type
    MenuLayerDrawSeparatorCallback* = MenuLayerDrawSeparatorCallback_570426361
else:
  static :
    hint("Declaration of " & "MenuLayerDrawSeparatorCallback" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_FONT_FALLBACK_INTERNAL):
  when "RESOURCE_ID_FONT_FALLBACK_INTERNAL" is static:
    const
      FONT_KEY_FONT_FALLBACK_INTERNAL* = "RESOURCE_ID_FONT_FALLBACK_INTERNAL" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:3:9
  else:
    let FONT_KEY_FONT_FALLBACK_INTERNAL* = "RESOURCE_ID_FONT_FALLBACK_INTERNAL" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:3:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_FONT_FALLBACK_INTERNAL" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_18_BOLD):
  when "RESOURCE_ID_GOTHIC_18_BOLD" is static:
    const
      FONT_KEY_GOTHIC_18_BOLD* = "RESOURCE_ID_GOTHIC_18_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:4:9
  else:
    let FONT_KEY_GOTHIC_18_BOLD* = "RESOURCE_ID_GOTHIC_18_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:4:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_18_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_24):
  when "RESOURCE_ID_GOTHIC_24" is static:
    const
      FONT_KEY_GOTHIC_24* = "RESOURCE_ID_GOTHIC_24" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:5:9
  else:
    let FONT_KEY_GOTHIC_24* = "RESOURCE_ID_GOTHIC_24" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:5:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_24" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_09):
  when "RESOURCE_ID_GOTHIC_09" is static:
    const
      FONT_KEY_GOTHIC_09* = "RESOURCE_ID_GOTHIC_09" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:6:9
  else:
    let FONT_KEY_GOTHIC_09* = "RESOURCE_ID_GOTHIC_09" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:6:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_09" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_14):
  when "RESOURCE_ID_GOTHIC_14" is static:
    const
      FONT_KEY_GOTHIC_14* = "RESOURCE_ID_GOTHIC_14" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:7:9
  else:
    let FONT_KEY_GOTHIC_14* = "RESOURCE_ID_GOTHIC_14" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:7:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_14" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_14_BOLD):
  when "RESOURCE_ID_GOTHIC_14_BOLD" is static:
    const
      FONT_KEY_GOTHIC_14_BOLD* = "RESOURCE_ID_GOTHIC_14_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:8:9
  else:
    let FONT_KEY_GOTHIC_14_BOLD* = "RESOURCE_ID_GOTHIC_14_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:8:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_14_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_18):
  when "RESOURCE_ID_GOTHIC_18" is static:
    const
      FONT_KEY_GOTHIC_18* = "RESOURCE_ID_GOTHIC_18" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:9:9
  else:
    let FONT_KEY_GOTHIC_18* = "RESOURCE_ID_GOTHIC_18" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:9:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_18" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_24_BOLD):
  when "RESOURCE_ID_GOTHIC_24_BOLD" is static:
    const
      FONT_KEY_GOTHIC_24_BOLD* = "RESOURCE_ID_GOTHIC_24_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:10:9
  else:
    let FONT_KEY_GOTHIC_24_BOLD* = "RESOURCE_ID_GOTHIC_24_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:10:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_24_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_28):
  when "RESOURCE_ID_GOTHIC_28" is static:
    const
      FONT_KEY_GOTHIC_28* = "RESOURCE_ID_GOTHIC_28" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:11:9
  else:
    let FONT_KEY_GOTHIC_28* = "RESOURCE_ID_GOTHIC_28" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:11:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_28" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_GOTHIC_28_BOLD):
  when "RESOURCE_ID_GOTHIC_28_BOLD" is static:
    const
      FONT_KEY_GOTHIC_28_BOLD* = "RESOURCE_ID_GOTHIC_28_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:12:9
  else:
    let FONT_KEY_GOTHIC_28_BOLD* = "RESOURCE_ID_GOTHIC_28_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:12:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_GOTHIC_28_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_30_BLACK):
  when "RESOURCE_ID_BITHAM_30_BLACK" is static:
    const
      FONT_KEY_BITHAM_30_BLACK* = "RESOURCE_ID_BITHAM_30_BLACK" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:13:9
  else:
    let FONT_KEY_BITHAM_30_BLACK* = "RESOURCE_ID_BITHAM_30_BLACK" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:13:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_30_BLACK" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_42_BOLD):
  when "RESOURCE_ID_BITHAM_42_BOLD" is static:
    const
      FONT_KEY_BITHAM_42_BOLD* = "RESOURCE_ID_BITHAM_42_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:14:9
  else:
    let FONT_KEY_BITHAM_42_BOLD* = "RESOURCE_ID_BITHAM_42_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:14:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_42_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_42_LIGHT):
  when "RESOURCE_ID_BITHAM_42_LIGHT" is static:
    const
      FONT_KEY_BITHAM_42_LIGHT* = "RESOURCE_ID_BITHAM_42_LIGHT" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:15:9
  else:
    let FONT_KEY_BITHAM_42_LIGHT* = "RESOURCE_ID_BITHAM_42_LIGHT" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:15:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_42_LIGHT" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_42_MEDIUM_NUMBERS):
  when "RESOURCE_ID_BITHAM_42_MEDIUM_NUMBERS" is static:
    const
      FONT_KEY_BITHAM_42_MEDIUM_NUMBERS* = "RESOURCE_ID_BITHAM_42_MEDIUM_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:16:9
  else:
    let FONT_KEY_BITHAM_42_MEDIUM_NUMBERS* = "RESOURCE_ID_BITHAM_42_MEDIUM_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:16:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_42_MEDIUM_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_34_MEDIUM_NUMBERS):
  when "RESOURCE_ID_BITHAM_34_MEDIUM_NUMBERS" is static:
    const
      FONT_KEY_BITHAM_34_MEDIUM_NUMBERS* = "RESOURCE_ID_BITHAM_34_MEDIUM_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:17:9
  else:
    let FONT_KEY_BITHAM_34_MEDIUM_NUMBERS* = "RESOURCE_ID_BITHAM_34_MEDIUM_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:17:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_34_MEDIUM_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_34_LIGHT_SUBSET):
  when "RESOURCE_ID_BITHAM_34_LIGHT_SUBSET" is static:
    const
      FONT_KEY_BITHAM_34_LIGHT_SUBSET* = "RESOURCE_ID_BITHAM_34_LIGHT_SUBSET" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:18:9
  else:
    let FONT_KEY_BITHAM_34_LIGHT_SUBSET* = "RESOURCE_ID_BITHAM_34_LIGHT_SUBSET" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:18:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_34_LIGHT_SUBSET" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_BITHAM_18_LIGHT_SUBSET):
  when "RESOURCE_ID_BITHAM_18_LIGHT_SUBSET" is static:
    const
      FONT_KEY_BITHAM_18_LIGHT_SUBSET* = "RESOURCE_ID_BITHAM_18_LIGHT_SUBSET" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:19:9
  else:
    let FONT_KEY_BITHAM_18_LIGHT_SUBSET* = "RESOURCE_ID_BITHAM_18_LIGHT_SUBSET" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:19:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_BITHAM_18_LIGHT_SUBSET" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_ROBOTO_CONDENSED_21):
  when "RESOURCE_ID_ROBOTO_CONDENSED_21" is static:
    const
      FONT_KEY_ROBOTO_CONDENSED_21* = "RESOURCE_ID_ROBOTO_CONDENSED_21" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:20:9
  else:
    let FONT_KEY_ROBOTO_CONDENSED_21* = "RESOURCE_ID_ROBOTO_CONDENSED_21" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:20:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_ROBOTO_CONDENSED_21" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_ROBOTO_BOLD_SUBSET_49):
  when "RESOURCE_ID_ROBOTO_BOLD_SUBSET_49" is static:
    const
      FONT_KEY_ROBOTO_BOLD_SUBSET_49* = "RESOURCE_ID_ROBOTO_BOLD_SUBSET_49" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:21:9
  else:
    let FONT_KEY_ROBOTO_BOLD_SUBSET_49* = "RESOURCE_ID_ROBOTO_BOLD_SUBSET_49" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:21:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_ROBOTO_BOLD_SUBSET_49" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_DROID_SERIF_28_BOLD):
  when "RESOURCE_ID_DROID_SERIF_28_BOLD" is static:
    const
      FONT_KEY_DROID_SERIF_28_BOLD* = "RESOURCE_ID_DROID_SERIF_28_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:22:9
  else:
    let FONT_KEY_DROID_SERIF_28_BOLD* = "RESOURCE_ID_DROID_SERIF_28_BOLD" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:22:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_DROID_SERIF_28_BOLD" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_20_BOLD_NUMBERS):
  when "RESOURCE_ID_LECO_20_BOLD_NUMBERS" is static:
    const
      FONT_KEY_LECO_20_BOLD_NUMBERS* = "RESOURCE_ID_LECO_20_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:23:9
  else:
    let FONT_KEY_LECO_20_BOLD_NUMBERS* = "RESOURCE_ID_LECO_20_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:23:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_20_BOLD_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_26_BOLD_NUMBERS_AM_PM):
  when "RESOURCE_ID_LECO_26_BOLD_NUMBERS_AM_PM" is static:
    const
      FONT_KEY_LECO_26_BOLD_NUMBERS_AM_PM* = "RESOURCE_ID_LECO_26_BOLD_NUMBERS_AM_PM" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:24:9
  else:
    let FONT_KEY_LECO_26_BOLD_NUMBERS_AM_PM* = "RESOURCE_ID_LECO_26_BOLD_NUMBERS_AM_PM" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:24:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_26_BOLD_NUMBERS_AM_PM" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_32_BOLD_NUMBERS):
  when "RESOURCE_ID_LECO_32_BOLD_NUMBERS" is static:
    const
      FONT_KEY_LECO_32_BOLD_NUMBERS* = "RESOURCE_ID_LECO_32_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:25:9
  else:
    let FONT_KEY_LECO_32_BOLD_NUMBERS* = "RESOURCE_ID_LECO_32_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:25:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_32_BOLD_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_36_BOLD_NUMBERS):
  when "RESOURCE_ID_LECO_36_BOLD_NUMBERS" is static:
    const
      FONT_KEY_LECO_36_BOLD_NUMBERS* = "RESOURCE_ID_LECO_36_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:26:9
  else:
    let FONT_KEY_LECO_36_BOLD_NUMBERS* = "RESOURCE_ID_LECO_36_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:26:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_36_BOLD_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_38_BOLD_NUMBERS):
  when "RESOURCE_ID_LECO_38_BOLD_NUMBERS" is static:
    const
      FONT_KEY_LECO_38_BOLD_NUMBERS* = "RESOURCE_ID_LECO_38_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:27:9
  else:
    let FONT_KEY_LECO_38_BOLD_NUMBERS* = "RESOURCE_ID_LECO_38_BOLD_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:27:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_38_BOLD_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_42_NUMBERS):
  when "RESOURCE_ID_LECO_42_NUMBERS" is static:
    const
      FONT_KEY_LECO_42_NUMBERS* = "RESOURCE_ID_LECO_42_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:28:9
  else:
    let FONT_KEY_LECO_42_NUMBERS* = "RESOURCE_ID_LECO_42_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:28:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_42_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_LECO_28_LIGHT_NUMBERS):
  when "RESOURCE_ID_LECO_28_LIGHT_NUMBERS" is static:
    const
      FONT_KEY_LECO_28_LIGHT_NUMBERS* = "RESOURCE_ID_LECO_28_LIGHT_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:29:9
  else:
    let FONT_KEY_LECO_28_LIGHT_NUMBERS* = "RESOURCE_ID_LECO_28_LIGHT_NUMBERS" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:29:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_LECO_28_LIGHT_NUMBERS" &
        " already exists, not redeclaring")
when not declared(FONT_KEY_FONT_FALLBACK):
  when "RESOURCE_ID_FONT_FALLBACK" is static:
    const
      FONT_KEY_FONT_FALLBACK* = "RESOURCE_ID_FONT_FALLBACK" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:30:9
  else:
    let FONT_KEY_FONT_FALLBACK* = "RESOURCE_ID_FONT_FALLBACK" ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble_fonts.h:30:9
else:
  static :
    hint("Declaration of " & "FONT_KEY_FONT_FALLBACK" &
        " already exists, not redeclaring")
when not declared(DEFAULT_MENU_ICON):
  when 0 is static:
    const
      DEFAULT_MENU_ICON* = 0 ## Generated based on /Users/zawa/Projects/pebble/nebble/src/nebble/ffi/stubs/src/resource_ids.auto.h:5:9
  else:
    let DEFAULT_MENU_ICON* = 0 ## Generated based on /Users/zawa/Projects/pebble/nebble/src/nebble/ffi/stubs/src/resource_ids.auto.h:5:9
else:
  static :
    hint("Declaration of " & "DEFAULT_MENU_ICON" &
        " already exists, not redeclaring")
when not declared(PBL_APP_INFO_SIMPLE):
  when PBL_APP_INFO is typedesc:
    type
      PBL_APP_INFO_SIMPLE* = PBL_APP_INFO ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:14:9
  else:
    when PBL_APP_INFO is static:
      const
        PBL_APP_INFO_SIMPLE* = PBL_APP_INFO ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:14:9
    else:
      let PBL_APP_INFO_SIMPLE* = PBL_APP_INFO ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:14:9
else:
  static :
    hint("Declaration of " & "PBL_APP_INFO_SIMPLE" &
        " already exists, not redeclaring")
when not declared(TRIG_MAX_RATIO):
  when 65535 is static:
    const
      TRIG_MAX_RATIO* = 65535 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:297:9
  else:
    let TRIG_MAX_RATIO* = 65535 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:297:9
else:
  static :
    hint("Declaration of " & "TRIG_MAX_RATIO" &
        " already exists, not redeclaring")
when not declared(TRIG_MAX_ANGLE):
  when 65536 is static:
    const
      TRIG_MAX_ANGLE* = 65536 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:302:9
  else:
    let TRIG_MAX_ANGLE* = 65536 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:302:9
else:
  static :
    hint("Declaration of " & "TRIG_MAX_ANGLE" &
        " already exists, not redeclaring")
when not declared(TIMEZONE_NAME_LENGTH):
  when 32 is static:
    const
      TIMEZONE_NAME_LENGTH* = 32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:379:9
  else:
    let TIMEZONE_NAME_LENGTH* = 32 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:379:9
else:
  static :
    hint("Declaration of " & "TIMEZONE_NAME_LENGTH" &
        " already exists, not redeclaring")
when not declared(PBL_PLATFORM_TYPE_CURRENT):
  when PlatformTypeFlint is typedesc:
    type
      PBL_PLATFORM_TYPE_CURRENT* = PlatformTypeFlint ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:402:9
  else:
    when PlatformTypeFlint is static:
      const
        PBL_PLATFORM_TYPE_CURRENT* = PlatformTypeFlint ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:402:9
    else:
      let PBL_PLATFORM_TYPE_CURRENT* = PlatformTypeFlint ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:402:9
else:
  static :
    hint("Declaration of " & "PBL_PLATFORM_TYPE_CURRENT" &
        " already exists, not redeclaring")
when not declared(UUID_SIZE):
  when 16 is static:
    const
      UUID_SIZE* = 16        ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1503:9
  else:
    let UUID_SIZE* = 16      ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:1503:9
else:
  static :
    hint("Declaration of " & "UUID_SIZE" & " already exists, not redeclaring")
when not declared(APP_MESSAGE_INBOX_SIZE_MINIMUM):
  when 124 is static:
    const
      APP_MESSAGE_INBOX_SIZE_MINIMUM* = 124 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2445:9
  else:
    let APP_MESSAGE_INBOX_SIZE_MINIMUM* = 124 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2445:9
else:
  static :
    hint("Declaration of " & "APP_MESSAGE_INBOX_SIZE_MINIMUM" &
        " already exists, not redeclaring")
when not declared(APP_MESSAGE_OUTBOX_SIZE_MINIMUM):
  when 636 is static:
    const
      APP_MESSAGE_OUTBOX_SIZE_MINIMUM* = 636 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2452:9
  else:
    let APP_MESSAGE_OUTBOX_SIZE_MINIMUM* = 636 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2452:9
else:
  static :
    hint("Declaration of " & "APP_MESSAGE_OUTBOX_SIZE_MINIMUM" &
        " already exists, not redeclaring")
when not declared(RESOURCE_ID_FONT_FALLBACK):
  when RESOURCE_ID_GOTHIC_14 is typedesc:
    type
      RESOURCE_ID_FONT_FALLBACK* = RESOURCE_ID_GOTHIC_14 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2720:9
  else:
    when RESOURCE_ID_GOTHIC_14 is static:
      const
        RESOURCE_ID_FONT_FALLBACK* = RESOURCE_ID_GOTHIC_14 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2720:9
    else:
      let RESOURCE_ID_FONT_FALLBACK* = RESOURCE_ID_GOTHIC_14 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2720:9
else:
  static :
    hint("Declaration of " & "RESOURCE_ID_FONT_FALLBACK" &
        " already exists, not redeclaring")
when not declared(PERSIST_DATA_MAX_LENGTH):
  when 256 is static:
    const
      PERSIST_DATA_MAX_LENGTH* = 256 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2966:9
  else:
    let PERSIST_DATA_MAX_LENGTH* = 256 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2966:9
else:
  static :
    hint("Declaration of " & "PERSIST_DATA_MAX_LENGTH" &
        " already exists, not redeclaring")
when not declared(PERSIST_STRING_MAX_LENGTH):
  when PERSIST_DATA_MAX_LENGTH is typedesc:
    type
      PERSIST_STRING_MAX_LENGTH* = PERSIST_DATA_MAX_LENGTH ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2969:9
  else:
    when PERSIST_DATA_MAX_LENGTH is static:
      const
        PERSIST_STRING_MAX_LENGTH* = PERSIST_DATA_MAX_LENGTH ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2969:9
    else:
      let PERSIST_STRING_MAX_LENGTH* = PERSIST_DATA_MAX_LENGTH ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:2969:9
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
      PLAY_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3471:9
  else:
    when UINT32_MAX is static:
      const
        PLAY_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3471:9
    else:
      let PLAY_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:3471:9
else:
  static :
    hint("Declaration of " & "PLAY_DURATION_INFINITE" &
        " already exists, not redeclaring")
when not declared(SMARTSTRAP_TIMEOUT_DEFAULT):
  when 250 is static:
    const
      SMARTSTRAP_TIMEOUT_DEFAULT* = 250 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4833:9
  else:
    let SMARTSTRAP_TIMEOUT_DEFAULT* = 250 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4833:9
else:
  static :
    hint("Declaration of " & "SMARTSTRAP_TIMEOUT_DEFAULT" &
        " already exists, not redeclaring")
when not declared(SMARTSTRAP_RAW_DATA_SERVICE_ID):
  when 0 is static:
    const
      SMARTSTRAP_RAW_DATA_SERVICE_ID* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4836:9
  else:
    let SMARTSTRAP_RAW_DATA_SERVICE_ID* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4836:9
else:
  static :
    hint("Declaration of " & "SMARTSTRAP_RAW_DATA_SERVICE_ID" &
        " already exists, not redeclaring")
when not declared(SMARTSTRAP_RAW_DATA_ATTRIBUTE_ID):
  when 0 is static:
    const
      SMARTSTRAP_RAW_DATA_ATTRIBUTE_ID* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4839:9
  else:
    let SMARTSTRAP_RAW_DATA_ATTRIBUTE_ID* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:4839:9
else:
  static :
    hint("Declaration of " & "SMARTSTRAP_RAW_DATA_ATTRIBUTE_ID" &
        " already exists, not redeclaring")
when not declared(ANIMATION_DURATION_INFINITE):
  when UINT32_MAX is typedesc:
    type
      ANIMATION_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5632:9
  else:
    when UINT32_MAX is static:
      const
        ANIMATION_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5632:9
    else:
      let ANIMATION_DURATION_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5632:9
else:
  static :
    hint("Declaration of " & "ANIMATION_DURATION_INFINITE" &
        " already exists, not redeclaring")
when not declared(ANIMATION_PLAY_COUNT_INFINITE):
  when UINT32_MAX is typedesc:
    type
      ANIMATION_PLAY_COUNT_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5637:9
  else:
    when UINT32_MAX is static:
      const
        ANIMATION_PLAY_COUNT_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5637:9
    else:
      let ANIMATION_PLAY_COUNT_INFINITE* = UINT32_MAX ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5637:9
else:
  static :
    hint("Declaration of " & "ANIMATION_PLAY_COUNT_INFINITE" &
        " already exists, not redeclaring")
when not declared(ANIMATION_NORMALIZED_MIN):
  when 0 is static:
    const
      ANIMATION_NORMALIZED_MIN* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5640:9
  else:
    let ANIMATION_NORMALIZED_MIN* = 0 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5640:9
else:
  static :
    hint("Declaration of " & "ANIMATION_NORMALIZED_MIN" &
        " already exists, not redeclaring")
when not declared(ANIMATION_NORMALIZED_MAX):
  when 65535 is static:
    const
      ANIMATION_NORMALIZED_MAX* = 65535 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5643:9
  else:
    let ANIMATION_NORMALIZED_MAX* = 65535 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:5643:9
else:
  static :
    hint("Declaration of " & "ANIMATION_NORMALIZED_MAX" &
        " already exists, not redeclaring")
when not declared(NUM_ACTION_BAR_ITEMS):
  when 3 is static:
    const
      NUM_ACTION_BAR_ITEMS* = 3 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7559:9
  else:
    let NUM_ACTION_BAR_ITEMS* = 3 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:7559:9
else:
  static :
    hint("Declaration of " & "NUM_ACTION_BAR_ITEMS" &
        " already exists, not redeclaring")
when not declared(TZ_LEN):
  when 6 is static:
    const
      TZ_LEN* = 6            ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8345:9
  else:
    let TZ_LEN* = 6          ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8345:9
else:
  static :
    hint("Declaration of " & "TZ_LEN" & " already exists, not redeclaring")
when not declared(SECONDS_PER_MINUTE):
  when 60 is static:
    const
      SECONDS_PER_MINUTE* = 60 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8347:9
  else:
    let SECONDS_PER_MINUTE* = 60 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8347:9
else:
  static :
    hint("Declaration of " & "SECONDS_PER_MINUTE" &
        " already exists, not redeclaring")
when not declared(MINUTES_PER_HOUR):
  when 60 is static:
    const
      MINUTES_PER_HOUR* = 60 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8349:9
  else:
    let MINUTES_PER_HOUR* = 60 ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8349:9
else:
  static :
    hint("Declaration of " & "MINUTES_PER_HOUR" &
        " already exists, not redeclaring")
when not declared(HOURS_PER_DAY):
  when 24 is static:
    const
      HOURS_PER_DAY* = 24    ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8353:9
  else:
    let HOURS_PER_DAY* = 24  ## Generated based on /Users/zawa/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble/flint/include/pebble.h:8353:9
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
  proc watch_info_get_model*(): WatchInfoModel_570425855 {.cdecl,
      importc: "watch_info_get_model".}
else:
  static :
    hint("Declaration of " & "watch_info_get_model" &
        " already exists, not redeclaring")
when not declared(watch_info_get_firmware_version):
  proc watch_info_get_firmware_version*(): WatchInfoVersion_570425863 {.cdecl,
      importc: "watch_info_get_firmware_version".}
else:
  static :
    hint("Declaration of " & "watch_info_get_firmware_version" &
        " already exists, not redeclaring")
when not declared(watch_info_get_color):
  proc watch_info_get_color*(): WatchInfoColor_570425859 {.cdecl,
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
  proc clock_to_timestamp*(day: WeekDay_570425867; hour: cint; minute: cint): time_t_570425869 {.
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
  proc connection_service_subscribe*(conn_handlers: ConnectionHandlers_570425879): void {.
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
  proc bluetooth_connection_service_subscribe*(handler: ConnectionHandler_570425875): void {.
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
  proc app_focus_service_subscribe_handlers*(handlers: AppFocusHandlers_570425887): void {.
      cdecl, importc: "app_focus_service_subscribe_handlers".}
else:
  static :
    hint("Declaration of " & "app_focus_service_subscribe_handlers" &
        " already exists, not redeclaring")
when not declared(app_focus_service_subscribe):
  proc app_focus_service_subscribe*(handler: AppFocusHandler_570425883): void {.
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
  proc battery_state_service_subscribe*(handler: BatteryStateHandler_570425893): void {.
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
  proc battery_state_service_peek*(): BatteryChargeState_570425891 {.cdecl,
      importc: "battery_state_service_peek".}
else:
  static :
    hint("Declaration of " & "battery_state_service_peek" &
        " already exists, not redeclaring")
when not declared(accel_service_peek):
  proc accel_service_peek*(data: ptr AccelData_570425897): cint {.cdecl,
      importc: "accel_service_peek".}
else:
  static :
    hint("Declaration of " & "accel_service_peek" &
        " already exists, not redeclaring")
when not declared(accel_service_set_sampling_rate):
  proc accel_service_set_sampling_rate*(rate: AccelSamplingRate_570425915): cint {.
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
                                     handler: AccelDataHandler_570425907): void {.
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
  proc accel_tap_service_subscribe*(handler: AccelTapHandler_570425911): void {.
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
      handler: AccelRawDataHandler_570425909): void {.cdecl,
      importc: "accel_raw_data_service_subscribe".}
else:
  static :
    hint("Declaration of " & "accel_raw_data_service_subscribe" &
        " already exists, not redeclaring")
when not declared(compass_service_set_heading_filter):
  proc compass_service_set_heading_filter*(filter: CompassHeading_570425921): cint {.
      cdecl, importc: "compass_service_set_heading_filter".}
else:
  static :
    hint("Declaration of " & "compass_service_set_heading_filter" &
        " already exists, not redeclaring")
when not declared(compass_service_subscribe):
  proc compass_service_subscribe*(handler: CompassHeadingHandler_570425927): void {.
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
  proc compass_service_peek*(data: ptr CompassHeadingData_570425925): cint {.
      cdecl, importc: "compass_service_peek".}
else:
  static :
    hint("Declaration of " & "compass_service_peek" &
        " already exists, not redeclaring")
when not declared(tick_timer_service_subscribe):
  proc tick_timer_service_subscribe*(tick_units: TimeUnits_570425938;
                                     handler: TickHandler_570425940): void {.
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
  proc health_service_sum*(metric: HealthMetric_570425944; time_start: time_t_570425869;
                           time_end: time_t_570425869): HealthValue_570425946 {.
      cdecl, importc: "health_service_sum".}
else:
  static :
    hint("Declaration of " & "health_service_sum" &
        " already exists, not redeclaring")
when not declared(health_service_sum_today):
  proc health_service_sum_today*(metric: HealthMetric_570425944): HealthValue_570425946 {.
      cdecl, importc: "health_service_sum_today".}
else:
  static :
    hint("Declaration of " & "health_service_sum_today" &
        " already exists, not redeclaring")
when not declared(health_service_peek_current_value):
  proc health_service_peek_current_value*(metric: HealthMetric_570425944): HealthValue_570425946 {.
      cdecl, importc: "health_service_peek_current_value".}
else:
  static :
    hint("Declaration of " & "health_service_peek_current_value" &
        " already exists, not redeclaring")
when not declared(health_service_sum_averaged):
  proc health_service_sum_averaged*(metric: HealthMetric_570425944;
                                    time_start: time_t_570425869;
                                    time_end: time_t_570425869;
                                    scope: HealthServiceTimeScope_570425952): HealthValue_570425946 {.
      cdecl, importc: "health_service_sum_averaged".}
else:
  static :
    hint("Declaration of " & "health_service_sum_averaged" &
        " already exists, not redeclaring")
when not declared(health_service_aggregate_averaged):
  proc health_service_aggregate_averaged*(metric: HealthMetric_570425944;
      time_start: time_t_570425869; time_end: time_t_570425869;
      aggregation: HealthAggregation_570425956; scope: HealthServiceTimeScope_570425952): HealthValue_570425946 {.
      cdecl, importc: "health_service_aggregate_averaged".}
else:
  static :
    hint("Declaration of " & "health_service_aggregate_averaged" &
        " already exists, not redeclaring")
when not declared(health_service_peek_current_activities):
  proc health_service_peek_current_activities*(): HealthActivityMask_570425958 {.
      cdecl, importc: "health_service_peek_current_activities".}
else:
  static :
    hint("Declaration of " & "health_service_peek_current_activities" &
        " already exists, not redeclaring")
when not declared(health_service_activities_iterate):
  proc health_service_activities_iterate*(activity_mask: HealthActivityMask_570425958;
      time_start: time_t_570425869; time_end: time_t_570425869;
      direction: HealthIterationDirection_570425968;
      callback: HealthActivityIteratorCB_570425964; context: pointer): void {.
      cdecl, importc: "health_service_activities_iterate".}
else:
  static :
    hint("Declaration of " & "health_service_activities_iterate" &
        " already exists, not redeclaring")
when not declared(health_service_metric_accessible):
  proc health_service_metric_accessible*(metric: HealthMetric_570425944;
      time_start: time_t_570425869; time_end: time_t_570425869): HealthServiceAccessibilityMask_570425972 {.
      cdecl, importc: "health_service_metric_accessible".}
else:
  static :
    hint("Declaration of " & "health_service_metric_accessible" &
        " already exists, not redeclaring")
when not declared(health_service_metric_averaged_accessible):
  proc health_service_metric_averaged_accessible*(metric: HealthMetric_570425944;
      time_start: time_t_570425869; time_end: time_t_570425869;
      scope: HealthServiceTimeScope_570425952): HealthServiceAccessibilityMask_570425972 {.
      cdecl, importc: "health_service_metric_averaged_accessible".}
else:
  static :
    hint("Declaration of " & "health_service_metric_averaged_accessible" &
        " already exists, not redeclaring")
when not declared(health_service_metric_aggregate_averaged_accessible):
  proc health_service_metric_aggregate_averaged_accessible*(
      metric: HealthMetric_570425944; time_start: time_t_570425869;
      time_end: time_t_570425869; aggregation: HealthAggregation_570425956;
      scope: HealthServiceTimeScope_570425952): HealthServiceAccessibilityMask_570425972 {.
      cdecl, importc: "health_service_metric_aggregate_averaged_accessible".}
else:
  static :
    hint("Declaration of " &
        "health_service_metric_aggregate_averaged_accessible" &
        " already exists, not redeclaring")
when not declared(health_service_any_activity_accessible):
  proc health_service_any_activity_accessible*(
      activity_mask: HealthActivityMask_570425958; time_start: time_t_570425869;
      time_end: time_t_570425869): HealthServiceAccessibilityMask_570425972 {.
      cdecl, importc: "health_service_any_activity_accessible".}
else:
  static :
    hint("Declaration of " & "health_service_any_activity_accessible" &
        " already exists, not redeclaring")
when not declared(health_service_events_subscribe):
  proc health_service_events_subscribe*(handler: HealthEventHandler_570425978;
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
  proc health_service_register_metric_alert*(metric: HealthMetric_570425944;
      threshold: HealthValue_570425946): ptr HealthMetricAlert_570425948 {.
      cdecl, importc: "health_service_register_metric_alert".}
else:
  static :
    hint("Declaration of " & "health_service_register_metric_alert" &
        " already exists, not redeclaring")
when not declared(health_service_cancel_metric_alert):
  proc health_service_cancel_metric_alert*(alert: ptr HealthMetricAlert_570425948): bool {.
      cdecl, importc: "health_service_cancel_metric_alert".}
else:
  static :
    hint("Declaration of " & "health_service_cancel_metric_alert" &
        " already exists, not redeclaring")
when not declared(health_service_get_minute_history):
  proc health_service_get_minute_history*(minute_data: ptr HealthMinuteData_570425986;
      max_records: uint32; time_start: ptr time_t_570425869;
      time_end: ptr time_t_570425869): uint32 {.cdecl,
      importc: "health_service_get_minute_history".}
else:
  static :
    hint("Declaration of " & "health_service_get_minute_history" &
        " already exists, not redeclaring")
when not declared(health_service_get_measurement_system_for_display):
  proc health_service_get_measurement_system_for_display*(metric: HealthMetric_570425944): MeasurementSystem_570425990 {.
      cdecl, importc: "health_service_get_measurement_system_for_display".}
else:
  static :
    hint("Declaration of " & "health_service_get_measurement_system_for_display" &
        " already exists, not redeclaring")
when not declared(data_logging_create):
  proc data_logging_create*(tag: uint32; item_type: DataLoggingItemType_570425996;
                            item_length: uint16; resume: bool): DataLoggingSessionRef_570425992 {.
      cdecl, importc: "data_logging_create".}
else:
  static :
    hint("Declaration of " & "data_logging_create" &
        " already exists, not redeclaring")
when not declared(data_logging_finish):
  proc data_logging_finish*(logging_session: DataLoggingSessionRef_570425992): void {.
      cdecl, importc: "data_logging_finish".}
else:
  static :
    hint("Declaration of " & "data_logging_finish" &
        " already exists, not redeclaring")
when not declared(data_logging_log):
  proc data_logging_log*(logging_session: DataLoggingSessionRef_570425992;
                         data: pointer; num_items: uint32): DataLoggingResult_570426000 {.
      cdecl, importc: "data_logging_log".}
else:
  static :
    hint("Declaration of " & "data_logging_log" &
        " already exists, not redeclaring")
when not declared(uuid_equal):
  proc uuid_equal*(uu1: ptr Uuid_570426004; uu2: ptr Uuid_570426004): bool {.
      cdecl, importc: "uuid_equal".}
else:
  static :
    hint("Declaration of " & "uuid_equal" & " already exists, not redeclaring")
when not declared(uuid_to_string):
  proc uuid_to_string*(uuid: ptr Uuid_570426004; buffer: cstring): void {.cdecl,
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
  proc dict_size*(iter: ptr DictionaryIterator_570426026): uint32 {.cdecl,
      importc: "dict_size".}
else:
  static :
    hint("Declaration of " & "dict_size" & " already exists, not redeclaring")
when not declared(dict_write_begin):
  proc dict_write_begin*(iter: ptr DictionaryIterator_570426026;
                         buffer: ptr uint8; size: uint16): DictionaryResult_570426012 {.
      cdecl, importc: "dict_write_begin".}
else:
  static :
    hint("Declaration of " & "dict_write_begin" &
        " already exists, not redeclaring")
when not declared(dict_write_data):
  proc dict_write_data*(iter: ptr DictionaryIterator_570426026; key: uint32;
                        data: ptr uint8; size: uint16): DictionaryResult_570426012 {.
      cdecl, importc: "dict_write_data".}
else:
  static :
    hint("Declaration of " & "dict_write_data" &
        " already exists, not redeclaring")
when not declared(dict_write_cstring):
  proc dict_write_cstring*(iter: ptr DictionaryIterator_570426026; key: uint32;
                           cstring: cstring): DictionaryResult_570426012 {.
      cdecl, importc: "dict_write_cstring".}
else:
  static :
    hint("Declaration of " & "dict_write_cstring" &
        " already exists, not redeclaring")
when not declared(dict_write_int):
  proc dict_write_int*(iter: ptr DictionaryIterator_570426026; key: uint32;
                       integer: pointer; width_bytes: uint8; is_signed: bool): DictionaryResult_570426012 {.
      cdecl, importc: "dict_write_int".}
else:
  static :
    hint("Declaration of " & "dict_write_int" &
        " already exists, not redeclaring")
when not declared(dict_write_uint8):
  proc dict_write_uint8*(iter: ptr DictionaryIterator_570426026; key: uint32;
                         value: uint8): DictionaryResult_570426012 {.cdecl,
      importc: "dict_write_uint8".}
else:
  static :
    hint("Declaration of " & "dict_write_uint8" &
        " already exists, not redeclaring")
when not declared(dict_write_uint16):
  proc dict_write_uint16*(iter: ptr DictionaryIterator_570426026; key: uint32;
                          value: uint16): DictionaryResult_570426012 {.cdecl,
      importc: "dict_write_uint16".}
else:
  static :
    hint("Declaration of " & "dict_write_uint16" &
        " already exists, not redeclaring")
when not declared(dict_write_uint32):
  proc dict_write_uint32*(iter: ptr DictionaryIterator_570426026; key: uint32;
                          value: uint32): DictionaryResult_570426012 {.cdecl,
      importc: "dict_write_uint32".}
else:
  static :
    hint("Declaration of " & "dict_write_uint32" &
        " already exists, not redeclaring")
when not declared(dict_write_int8):
  proc dict_write_int8*(iter: ptr DictionaryIterator_570426026; key: uint32;
                        value: int8): DictionaryResult_570426012 {.cdecl,
      importc: "dict_write_int8".}
else:
  static :
    hint("Declaration of " & "dict_write_int8" &
        " already exists, not redeclaring")
when not declared(dict_write_int16):
  proc dict_write_int16*(iter: ptr DictionaryIterator_570426026; key: uint32;
                         value: int16): DictionaryResult_570426012 {.cdecl,
      importc: "dict_write_int16".}
else:
  static :
    hint("Declaration of " & "dict_write_int16" &
        " already exists, not redeclaring")
when not declared(dict_write_int32):
  proc dict_write_int32*(iter: ptr DictionaryIterator_570426026; key: uint32;
                         value: int32): DictionaryResult_570426012 {.cdecl,
      importc: "dict_write_int32".}
else:
  static :
    hint("Declaration of " & "dict_write_int32" &
        " already exists, not redeclaring")
when not declared(dict_write_end):
  proc dict_write_end*(iter: ptr DictionaryIterator_570426026): uint32 {.cdecl,
      importc: "dict_write_end".}
else:
  static :
    hint("Declaration of " & "dict_write_end" &
        " already exists, not redeclaring")
when not declared(dict_read_begin_from_buffer):
  proc dict_read_begin_from_buffer*(iter: ptr DictionaryIterator_570426026;
                                    buffer: ptr uint8; size: uint16): ptr Tuple_f_570426020 {.
      cdecl, importc: "dict_read_begin_from_buffer".}
else:
  static :
    hint("Declaration of " & "dict_read_begin_from_buffer" &
        " already exists, not redeclaring")
when not declared(dict_read_next):
  proc dict_read_next*(iter: ptr DictionaryIterator_570426026): ptr Tuple_f_570426020 {.
      cdecl, importc: "dict_read_next".}
else:
  static :
    hint("Declaration of " & "dict_read_next" &
        " already exists, not redeclaring")
when not declared(dict_read_first):
  proc dict_read_first*(iter: ptr DictionaryIterator_570426026): ptr Tuple_f_570426020 {.
      cdecl, importc: "dict_read_first".}
else:
  static :
    hint("Declaration of " & "dict_read_first" &
        " already exists, not redeclaring")
when not declared(dict_serialize_tuplets):
  proc dict_serialize_tuplets*(callback: DictionarySerializeCallback_570426032;
                               context: pointer; tuplets: ptr Tuplet_570426030;
                               tuplets_count: uint8): DictionaryResult_570426012 {.
      cdecl, importc: "dict_serialize_tuplets".}
else:
  static :
    hint("Declaration of " & "dict_serialize_tuplets" &
        " already exists, not redeclaring")
when not declared(dict_serialize_tuplets_to_buffer):
  proc dict_serialize_tuplets_to_buffer*(tuplets: ptr Tuplet_570426030;
      tuplets_count: uint8; buffer: ptr uint8; size_in_out: ptr uint32): DictionaryResult_570426012 {.
      cdecl, importc: "dict_serialize_tuplets_to_buffer".}
else:
  static :
    hint("Declaration of " & "dict_serialize_tuplets_to_buffer" &
        " already exists, not redeclaring")
when not declared(dict_serialize_tuplets_to_buffer_with_iter):
  proc dict_serialize_tuplets_to_buffer_with_iter*(iter: ptr DictionaryIterator_570426026;
      tuplets: ptr Tuplet_570426030; tuplets_count: uint8; buffer: ptr uint8;
      size_in_out: ptr uint32): DictionaryResult_570426012 {.cdecl,
      importc: "dict_serialize_tuplets_to_buffer_with_iter".}
else:
  static :
    hint("Declaration of " & "dict_serialize_tuplets_to_buffer_with_iter" &
        " already exists, not redeclaring")
when not declared(dict_write_tuplet):
  proc dict_write_tuplet*(iter: ptr DictionaryIterator_570426026;
                          tuplet: ptr Tuplet_570426030): DictionaryResult_570426012 {.
      cdecl, importc: "dict_write_tuplet".}
else:
  static :
    hint("Declaration of " & "dict_write_tuplet" &
        " already exists, not redeclaring")
when not declared(dict_calc_buffer_size_from_tuplets):
  proc dict_calc_buffer_size_from_tuplets*(tuplets: ptr Tuplet_570426030;
      tuplets_count: uint8): uint32 {.cdecl, importc: "dict_calc_buffer_size_from_tuplets".}
else:
  static :
    hint("Declaration of " & "dict_calc_buffer_size_from_tuplets" &
        " already exists, not redeclaring")
when not declared(dict_merge):
  proc dict_merge*(dest: ptr DictionaryIterator_570426026;
                   dest_max_size_in_out: ptr uint32;
                   source: ptr DictionaryIterator_570426026;
                   update_existing_keys_only: bool;
                   key_callback: DictionaryKeyUpdatedCallback_570426034;
                   context: pointer): DictionaryResult_570426012 {.cdecl,
      importc: "dict_merge".}
else:
  static :
    hint("Declaration of " & "dict_merge" & " already exists, not redeclaring")
when not declared(dict_find):
  proc dict_find*(iter: ptr DictionaryIterator_570426026; key: uint32): ptr Tuple_f_570426020 {.
      cdecl, importc: "dict_find".}
else:
  static :
    hint("Declaration of " & "dict_find" & " already exists, not redeclaring")
when not declared(dictation_session_create):
  proc dictation_session_create*(buffer_size: uint32;
                                 callback: DictationSessionStatusCallback_570426042;
                                 callback_context: pointer): ptr DictationSession_570426036 {.
      cdecl, importc: "dictation_session_create".}
else:
  static :
    hint("Declaration of " & "dictation_session_create" &
        " already exists, not redeclaring")
when not declared(dictation_session_destroy):
  proc dictation_session_destroy*(session: ptr DictationSession_570426036): void {.
      cdecl, importc: "dictation_session_destroy".}
else:
  static :
    hint("Declaration of " & "dictation_session_destroy" &
        " already exists, not redeclaring")
when not declared(dictation_session_start):
  proc dictation_session_start*(session: ptr DictationSession_570426036): DictationSessionStatus_570426040 {.
      cdecl, importc: "dictation_session_start".}
else:
  static :
    hint("Declaration of " & "dictation_session_start" &
        " already exists, not redeclaring")
when not declared(dictation_session_stop):
  proc dictation_session_stop*(session: ptr DictationSession_570426036): DictationSessionStatus_570426040 {.
      cdecl, importc: "dictation_session_stop".}
else:
  static :
    hint("Declaration of " & "dictation_session_stop" &
        " already exists, not redeclaring")
when not declared(dictation_session_enable_confirmation):
  proc dictation_session_enable_confirmation*(session: ptr DictationSession_570426036;
      is_enabled: bool): void {.cdecl, importc: "dictation_session_enable_confirmation".}
else:
  static :
    hint("Declaration of " & "dictation_session_enable_confirmation" &
        " already exists, not redeclaring")
when not declared(dictation_session_enable_error_dialogs):
  proc dictation_session_enable_error_dialogs*(session: ptr DictationSession_570426036;
      is_enabled: bool): void {.cdecl, importc: "dictation_session_enable_error_dialogs".}
else:
  static :
    hint("Declaration of " & "dictation_session_enable_error_dialogs" &
        " already exists, not redeclaring")
when not declared(app_message_open):
  proc app_message_open*(size_inbound: uint32; size_outbound: uint32): AppMessageResult_570426046 {.
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
      received_callback: AppMessageInboxReceived_570426048): AppMessageInboxReceived_570426048 {.
      cdecl, importc: "app_message_register_inbox_received".}
else:
  static :
    hint("Declaration of " & "app_message_register_inbox_received" &
        " already exists, not redeclaring")
when not declared(app_message_register_inbox_dropped):
  proc app_message_register_inbox_dropped*(
      dropped_callback: AppMessageInboxDropped_570426050): AppMessageInboxDropped_570426050 {.
      cdecl, importc: "app_message_register_inbox_dropped".}
else:
  static :
    hint("Declaration of " & "app_message_register_inbox_dropped" &
        " already exists, not redeclaring")
when not declared(app_message_register_outbox_sent):
  proc app_message_register_outbox_sent*(sent_callback: AppMessageOutboxSent_570426052): AppMessageOutboxSent_570426052 {.
      cdecl, importc: "app_message_register_outbox_sent".}
else:
  static :
    hint("Declaration of " & "app_message_register_outbox_sent" &
        " already exists, not redeclaring")
when not declared(app_message_register_outbox_failed):
  proc app_message_register_outbox_failed*(
      failed_callback: AppMessageOutboxFailed_570426054): AppMessageOutboxFailed_570426054 {.
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
  proc app_message_outbox_begin*(iterator_f: ptr ptr DictionaryIterator_570426026): AppMessageResult_570426046 {.
      cdecl, importc: "app_message_outbox_begin".}
else:
  static :
    hint("Declaration of " & "app_message_outbox_begin" &
        " already exists, not redeclaring")
when not declared(app_message_outbox_send):
  proc app_message_outbox_send*(): AppMessageResult_570426046 {.cdecl,
      importc: "app_message_outbox_send".}
else:
  static :
    hint("Declaration of " & "app_message_outbox_send" &
        " already exists, not redeclaring")
when not declared(app_sync_init):
  proc app_sync_init*(s: ptr struct_AppSync_570426060; buffer: ptr uint8;
                      buffer_size: uint16; keys_and_initial_values: ptr Tuplet_570426030;
                      count: uint8;
                      tuple_changed_callback: AppSyncTupleChangedCallback_570426056;
                      error_callback: AppSyncErrorCallback_570426058;
                      context: pointer): void {.cdecl, importc: "app_sync_init".}
else:
  static :
    hint("Declaration of " & "app_sync_init" &
        " already exists, not redeclaring")
when not declared(app_sync_deinit):
  proc app_sync_deinit*(s: ptr struct_AppSync_570426060): void {.cdecl,
      importc: "app_sync_deinit".}
else:
  static :
    hint("Declaration of " & "app_sync_deinit" &
        " already exists, not redeclaring")
when not declared(app_sync_set):
  proc app_sync_set*(s: ptr struct_AppSync_570426060;
                     keys_and_values_to_update: ptr Tuplet_570426030;
                     count: uint8): AppMessageResult_570426046 {.cdecl,
      importc: "app_sync_set".}
else:
  static :
    hint("Declaration of " & "app_sync_set" & " already exists, not redeclaring")
when not declared(app_sync_get):
  proc app_sync_get*(s: ptr struct_AppSync_570426060; key: uint32): ptr Tuple_f_570426020 {.
      cdecl, importc: "app_sync_get".}
else:
  static :
    hint("Declaration of " & "app_sync_get" & " already exists, not redeclaring")
when not declared(resource_get_handle):
  proc resource_get_handle*(resource_id: uint32): ResHandle_570426064 {.cdecl,
      importc: "resource_get_handle".}
else:
  static :
    hint("Declaration of " & "resource_get_handle" &
        " already exists, not redeclaring")
when not declared(resource_size):
  proc resource_size*(h: ResHandle_570426064): csize_t {.cdecl,
      importc: "resource_size".}
else:
  static :
    hint("Declaration of " & "resource_size" &
        " already exists, not redeclaring")
when not declared(resource_load):
  proc resource_load*(h: ResHandle_570426064; buffer: ptr uint8;
                      max_length: csize_t): csize_t {.cdecl,
      importc: "resource_load".}
else:
  static :
    hint("Declaration of " & "resource_load" &
        " already exists, not redeclaring")
when not declared(resource_load_byte_range):
  proc resource_load_byte_range*(h: ResHandle_570426064; start_offset: uint32;
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
  proc app_worker_launch*(): AppWorkerResult_570426068 {.cdecl,
      importc: "app_worker_launch".}
else:
  static :
    hint("Declaration of " & "app_worker_launch" &
        " already exists, not redeclaring")
when not declared(app_worker_kill):
  proc app_worker_kill*(): AppWorkerResult_570426068 {.cdecl,
      importc: "app_worker_kill".}
else:
  static :
    hint("Declaration of " & "app_worker_kill" &
        " already exists, not redeclaring")
when not declared(app_worker_message_subscribe):
  proc app_worker_message_subscribe*(handler: AppWorkerMessageHandler_570426074): bool {.
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
  proc app_worker_send_message*(type_f: uint8; data: ptr AppWorkerMessage_570426072): void {.
      cdecl, importc: "app_worker_send_message".}
else:
  static :
    hint("Declaration of " & "app_worker_send_message" &
        " already exists, not redeclaring")
when not declared(app_comm_set_sniff_interval):
  proc app_comm_set_sniff_interval*(interval: SniffInterval_570426078): void {.
      cdecl, importc: "app_comm_set_sniff_interval".}
else:
  static :
    hint("Declaration of " & "app_comm_set_sniff_interval" &
        " already exists, not redeclaring")
when not declared(app_comm_get_sniff_interval):
  proc app_comm_get_sniff_interval*(): SniffInterval_570426078 {.cdecl,
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
  proc app_timer_register*(timeout_ms: uint32; callback: AppTimerCallback_570426082;
                           callback_data: pointer): ptr AppTimer_570426080 {.
      cdecl, importc: "app_timer_register".}
else:
  static :
    hint("Declaration of " & "app_timer_register" &
        " already exists, not redeclaring")
when not declared(app_timer_reschedule):
  proc app_timer_reschedule*(timer_handle: ptr AppTimer_570426080;
                             new_timeout_ms: uint32): bool {.cdecl,
      importc: "app_timer_reschedule".}
else:
  static :
    hint("Declaration of " & "app_timer_reschedule" &
        " already exists, not redeclaring")
when not declared(app_timer_cancel):
  proc app_timer_cancel*(timer_handle: ptr AppTimer_570426080): void {.cdecl,
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
  proc persist_write_bool*(key: uint32; value: bool): status_t_570426088 {.
      cdecl, importc: "persist_write_bool".}
else:
  static :
    hint("Declaration of " & "persist_write_bool" &
        " already exists, not redeclaring")
when not declared(persist_write_int):
  proc persist_write_int*(key: uint32; value: int32): status_t_570426088 {.
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
  proc persist_delete*(key: uint32): status_t_570426088 {.cdecl,
      importc: "persist_delete".}
else:
  static :
    hint("Declaration of " & "persist_delete" &
        " already exists, not redeclaring")
when not declared(wakeup_service_subscribe):
  proc wakeup_service_subscribe*(handler: WakeupHandler_570426092): void {.
      cdecl, importc: "wakeup_service_subscribe".}
else:
  static :
    hint("Declaration of " & "wakeup_service_subscribe" &
        " already exists, not redeclaring")
when not declared(wakeup_schedule):
  proc wakeup_schedule*(timestamp: time_t_570425869; cookie: int32;
                        notify_if_missed: bool): WakeupId_570426090 {.cdecl,
      importc: "wakeup_schedule".}
else:
  static :
    hint("Declaration of " & "wakeup_schedule" &
        " already exists, not redeclaring")
when not declared(wakeup_cancel):
  proc wakeup_cancel*(wakeup_id: WakeupId_570426090): void {.cdecl,
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
  proc wakeup_get_launch_event*(wakeup_id: ptr WakeupId_570426090;
                                cookie: ptr int32): bool {.cdecl,
      importc: "wakeup_get_launch_event".}
else:
  static :
    hint("Declaration of " & "wakeup_get_launch_event" &
        " already exists, not redeclaring")
when not declared(wakeup_query):
  proc wakeup_query*(wakeup_id: WakeupId_570426090; timestamp: ptr time_t_570425869): bool {.
      cdecl, importc: "wakeup_query".}
else:
  static :
    hint("Declaration of " & "wakeup_query" & " already exists, not redeclaring")
when not declared(launch_reason):
  proc launch_reason*(): AppLaunchReason_570426096 {.cdecl,
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
  proc exit_reason_set*(exit_reason: AppExitReason_570426100): void {.cdecl,
      importc: "exit_reason_set".}
else:
  static :
    hint("Declaration of " & "exit_reason_set" &
        " already exists, not redeclaring")
when not declared(app_glance_add_slice):
  proc app_glance_add_slice*(session: ptr AppGlanceReloadSession_570426112;
                             slice: AppGlanceSlice_570426106): AppGlanceResult_570426110 {.
      cdecl, importc: "app_glance_add_slice".}
else:
  static :
    hint("Declaration of " & "app_glance_add_slice" &
        " already exists, not redeclaring")
when not declared(app_glance_reload):
  proc app_glance_reload*(callback: AppGlanceReloadCallback_570426114;
                          context: pointer): void {.cdecl,
      importc: "app_glance_reload".}
else:
  static :
    hint("Declaration of " & "app_glance_reload" &
        " already exists, not redeclaring")
when not declared(gcolor_equal):
  proc gcolor_equal*(x: GColor8_570426118; y: GColor8_570426118): bool {.cdecl,
      importc: "gcolor_equal".}
else:
  static :
    hint("Declaration of " & "gcolor_equal" & " already exists, not redeclaring")
when not declared(gcolor_legible_over):
  proc gcolor_legible_over*(background_color: GColor8_570426118): GColor8_570426118 {.
      cdecl, importc: "gcolor_legible_over".}
else:
  static :
    hint("Declaration of " & "gcolor_legible_over" &
        " already exists, not redeclaring")
when not declared(gpoint_equal):
  proc gpoint_equal*(point_a: ptr GPoint_570426124; point_b: ptr GPoint_570426124): bool {.
      cdecl, importc: "gpoint_equal".}
else:
  static :
    hint("Declaration of " & "gpoint_equal" & " already exists, not redeclaring")
when not declared(gsize_equal):
  proc gsize_equal*(size_a: ptr GSize_570426128; size_b: ptr GSize_570426128): bool {.
      cdecl, importc: "gsize_equal".}
else:
  static :
    hint("Declaration of " & "gsize_equal" & " already exists, not redeclaring")
when not declared(grect_equal):
  proc grect_equal*(rect_a: ptr GRect_570426132; rect_b: ptr GRect_570426132): bool {.
      cdecl, importc: "grect_equal".}
else:
  static :
    hint("Declaration of " & "grect_equal" & " already exists, not redeclaring")
when not declared(grect_is_empty):
  proc grect_is_empty*(rect: ptr GRect_570426132): bool {.cdecl,
      importc: "grect_is_empty".}
else:
  static :
    hint("Declaration of " & "grect_is_empty" &
        " already exists, not redeclaring")
when not declared(grect_standardize):
  proc grect_standardize*(rect: ptr GRect_570426132): void {.cdecl,
      importc: "grect_standardize".}
else:
  static :
    hint("Declaration of " & "grect_standardize" &
        " already exists, not redeclaring")
when not declared(grect_clip):
  proc grect_clip*(rect_to_clip: ptr GRect_570426132; rect_clipper: ptr GRect_570426132): void {.
      cdecl, importc: "grect_clip".}
else:
  static :
    hint("Declaration of " & "grect_clip" & " already exists, not redeclaring")
when not declared(grect_contains_point):
  proc grect_contains_point*(rect: ptr GRect_570426132; point: ptr GPoint_570426124): bool {.
      cdecl, importc: "grect_contains_point".}
else:
  static :
    hint("Declaration of " & "grect_contains_point" &
        " already exists, not redeclaring")
when not declared(grect_center_point):
  proc grect_center_point*(rect: ptr GRect_570426132): GPoint_570426124 {.cdecl,
      importc: "grect_center_point".}
else:
  static :
    hint("Declaration of " & "grect_center_point" &
        " already exists, not redeclaring")
when not declared(grect_crop):
  proc grect_crop*(rect: GRect_570426132; crop_size_px: int32): GRect_570426132 {.
      cdecl, importc: "grect_crop".}
else:
  static :
    hint("Declaration of " & "grect_crop" & " already exists, not redeclaring")
when not declared(gbitmap_get_bytes_per_row):
  proc gbitmap_get_bytes_per_row*(bitmap: ptr GBitmap_570426138): uint16 {.
      cdecl, importc: "gbitmap_get_bytes_per_row".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_bytes_per_row" &
        " already exists, not redeclaring")
when not declared(gbitmap_get_format):
  proc gbitmap_get_format*(bitmap: ptr GBitmap_570426138): GBitmapFormat_570426136 {.
      cdecl, importc: "gbitmap_get_format".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_format" &
        " already exists, not redeclaring")
when not declared(gbitmap_get_data):
  proc gbitmap_get_data*(bitmap: ptr GBitmap_570426138): ptr uint8 {.cdecl,
      importc: "gbitmap_get_data".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_data" &
        " already exists, not redeclaring")
when not declared(gbitmap_set_data):
  proc gbitmap_set_data*(bitmap: ptr GBitmap_570426138; data: ptr uint8;
                         format: GBitmapFormat_570426136;
                         row_size_bytes: uint16; free_on_destroy: bool): void {.
      cdecl, importc: "gbitmap_set_data".}
else:
  static :
    hint("Declaration of " & "gbitmap_set_data" &
        " already exists, not redeclaring")
when not declared(gbitmap_get_bounds):
  proc gbitmap_get_bounds*(bitmap: ptr GBitmap_570426138): GRect_570426132 {.
      cdecl, importc: "gbitmap_get_bounds".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_bounds" &
        " already exists, not redeclaring")
when not declared(gbitmap_set_bounds):
  proc gbitmap_set_bounds*(bitmap: ptr GBitmap_570426138; bounds: GRect_570426132): void {.
      cdecl, importc: "gbitmap_set_bounds".}
else:
  static :
    hint("Declaration of " & "gbitmap_set_bounds" &
        " already exists, not redeclaring")
when not declared(gbitmap_get_palette):
  proc gbitmap_get_palette*(bitmap: ptr GBitmap_570426138): ptr GColor_570426120 {.
      cdecl, importc: "gbitmap_get_palette".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_palette" &
        " already exists, not redeclaring")
when not declared(gbitmap_set_palette):
  proc gbitmap_set_palette*(bitmap: ptr GBitmap_570426138; palette: ptr GColor_570426120;
                            free_on_destroy: bool): void {.cdecl,
      importc: "gbitmap_set_palette".}
else:
  static :
    hint("Declaration of " & "gbitmap_set_palette" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_with_resource):
  proc gbitmap_create_with_resource*(resource_id: uint32): ptr GBitmap_570426138 {.
      cdecl, importc: "gbitmap_create_with_resource".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_with_resource" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_with_data):
  proc gbitmap_create_with_data*(data: ptr uint8): ptr GBitmap_570426138 {.
      cdecl, importc: "gbitmap_create_with_data".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_with_data" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_as_sub_bitmap):
  proc gbitmap_create_as_sub_bitmap*(base_bitmap: ptr GBitmap_570426138;
                                     sub_rect: GRect_570426132): ptr GBitmap_570426138 {.
      cdecl, importc: "gbitmap_create_as_sub_bitmap".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_as_sub_bitmap" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_from_png_data):
  proc gbitmap_create_from_png_data*(png_data: ptr uint8; png_data_size: csize_t): ptr GBitmap_570426138 {.
      cdecl, importc: "gbitmap_create_from_png_data".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_from_png_data" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_blank):
  proc gbitmap_create_blank*(size: GSize_570426128; format: GBitmapFormat_570426136): ptr GBitmap_570426138 {.
      cdecl, importc: "gbitmap_create_blank".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_blank" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_blank_with_palette):
  proc gbitmap_create_blank_with_palette*(size: GSize_570426128;
      format: GBitmapFormat_570426136; palette: ptr GColor_570426120;
      free_on_destroy: bool): ptr GBitmap_570426138 {.cdecl,
      importc: "gbitmap_create_blank_with_palette".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_blank_with_palette" &
        " already exists, not redeclaring")
when not declared(gbitmap_create_palettized_from_1bit):
  proc gbitmap_create_palettized_from_1bit*(src_bitmap: ptr GBitmap_570426138): ptr GBitmap_570426138 {.
      cdecl, importc: "gbitmap_create_palettized_from_1bit".}
else:
  static :
    hint("Declaration of " & "gbitmap_create_palettized_from_1bit" &
        " already exists, not redeclaring")
when not declared(gbitmap_destroy):
  proc gbitmap_destroy*(bitmap: ptr GBitmap_570426138): void {.cdecl,
      importc: "gbitmap_destroy".}
else:
  static :
    hint("Declaration of " & "gbitmap_destroy" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_create_with_resource):
  proc gbitmap_sequence_create_with_resource*(resource_id: uint32): ptr GBitmapSequence_570426140 {.
      cdecl, importc: "gbitmap_sequence_create_with_resource".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_create_with_resource" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_update_bitmap_next_frame):
  proc gbitmap_sequence_update_bitmap_next_frame*(
      bitmap_sequence: ptr GBitmapSequence_570426140; bitmap: ptr GBitmap_570426138;
      delay_ms: ptr uint32): bool {.cdecl, importc: "gbitmap_sequence_update_bitmap_next_frame".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_update_bitmap_next_frame" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_update_bitmap_by_elapsed):
  proc gbitmap_sequence_update_bitmap_by_elapsed*(
      bitmap_sequence: ptr GBitmapSequence_570426140; bitmap: ptr GBitmap_570426138;
      elapsed_ms: uint32): bool {.cdecl, importc: "gbitmap_sequence_update_bitmap_by_elapsed".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_update_bitmap_by_elapsed" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_destroy):
  proc gbitmap_sequence_destroy*(bitmap_sequence: ptr GBitmapSequence_570426140): void {.
      cdecl, importc: "gbitmap_sequence_destroy".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_destroy" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_restart):
  proc gbitmap_sequence_restart*(bitmap_sequence: ptr GBitmapSequence_570426140): bool {.
      cdecl, importc: "gbitmap_sequence_restart".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_restart" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_get_current_frame_idx):
  proc gbitmap_sequence_get_current_frame_idx*(
      bitmap_sequence: ptr GBitmapSequence_570426140): int32 {.cdecl,
      importc: "gbitmap_sequence_get_current_frame_idx".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_get_current_frame_idx" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_get_total_num_frames):
  proc gbitmap_sequence_get_total_num_frames*(
      bitmap_sequence: ptr GBitmapSequence_570426140): uint32 {.cdecl,
      importc: "gbitmap_sequence_get_total_num_frames".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_get_total_num_frames" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_get_play_count):
  proc gbitmap_sequence_get_play_count*(bitmap_sequence: ptr GBitmapSequence_570426140): uint32 {.
      cdecl, importc: "gbitmap_sequence_get_play_count".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_get_play_count" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_set_play_count):
  proc gbitmap_sequence_set_play_count*(bitmap_sequence: ptr GBitmapSequence_570426140;
                                        play_count: uint32): void {.cdecl,
      importc: "gbitmap_sequence_set_play_count".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_set_play_count" &
        " already exists, not redeclaring")
when not declared(gbitmap_sequence_get_bitmap_size):
  proc gbitmap_sequence_get_bitmap_size*(bitmap_sequence: ptr GBitmapSequence_570426140): GSize_570426128 {.
      cdecl, importc: "gbitmap_sequence_get_bitmap_size".}
else:
  static :
    hint("Declaration of " & "gbitmap_sequence_get_bitmap_size" &
        " already exists, not redeclaring")
when not declared(gbitmap_get_data_row_info):
  proc gbitmap_get_data_row_info*(bitmap: ptr GBitmap_570426138; y: uint16): GBitmapDataRowInfo_570426144 {.
      cdecl, importc: "gbitmap_get_data_row_info".}
else:
  static :
    hint("Declaration of " & "gbitmap_get_data_row_info" &
        " already exists, not redeclaring")
when not declared(grect_align):
  proc grect_align*(rect: ptr GRect_570426132; inside_rect: ptr GRect_570426132;
                    alignment: GAlign_570426148; clip: bool): void {.cdecl,
      importc: "grect_align".}
else:
  static :
    hint("Declaration of " & "grect_align" & " already exists, not redeclaring")
when not declared(grect_inset):
  proc grect_inset*(rect: GRect_570426132; insets: GEdgeInsets_570426158): GRect_570426132 {.
      cdecl, importc: "grect_inset".}
else:
  static :
    hint("Declaration of " & "grect_inset" & " already exists, not redeclaring")
when not declared(graphics_context_set_stroke_color):
  proc graphics_context_set_stroke_color*(ctx: ptr GContext_570426154;
      color: GColor_570426120): void {.cdecl, importc: "graphics_context_set_stroke_color".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_stroke_color" &
        " already exists, not redeclaring")
when not declared(graphics_context_set_fill_color):
  proc graphics_context_set_fill_color*(ctx: ptr GContext_570426154;
                                        color: GColor_570426120): void {.cdecl,
      importc: "graphics_context_set_fill_color".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_fill_color" &
        " already exists, not redeclaring")
when not declared(graphics_context_set_text_color):
  proc graphics_context_set_text_color*(ctx: ptr GContext_570426154;
                                        color: GColor_570426120): void {.cdecl,
      importc: "graphics_context_set_text_color".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_text_color" &
        " already exists, not redeclaring")
when not declared(graphics_context_set_compositing_mode):
  proc graphics_context_set_compositing_mode*(ctx: ptr GContext_570426154;
      mode: GCompOp_570426152): void {.cdecl, importc: "graphics_context_set_compositing_mode".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_compositing_mode" &
        " already exists, not redeclaring")
when not declared(graphics_context_set_antialiased):
  proc graphics_context_set_antialiased*(ctx: ptr GContext_570426154;
      enable: bool): void {.cdecl, importc: "graphics_context_set_antialiased".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_antialiased" &
        " already exists, not redeclaring")
when not declared(graphics_context_set_stroke_width):
  proc graphics_context_set_stroke_width*(ctx: ptr GContext_570426154;
      stroke_width: uint8): void {.cdecl,
                                   importc: "graphics_context_set_stroke_width".}
else:
  static :
    hint("Declaration of " & "graphics_context_set_stroke_width" &
        " already exists, not redeclaring")
when not declared(graphics_draw_pixel):
  proc graphics_draw_pixel*(ctx: ptr GContext_570426154; point: GPoint_570426124): void {.
      cdecl, importc: "graphics_draw_pixel".}
else:
  static :
    hint("Declaration of " & "graphics_draw_pixel" &
        " already exists, not redeclaring")
when not declared(graphics_draw_line):
  proc graphics_draw_line*(ctx: ptr GContext_570426154; p0: GPoint_570426124;
                           p1: GPoint_570426124): void {.cdecl,
      importc: "graphics_draw_line".}
else:
  static :
    hint("Declaration of " & "graphics_draw_line" &
        " already exists, not redeclaring")
when not declared(graphics_draw_rect):
  proc graphics_draw_rect*(ctx: ptr GContext_570426154; rect: GRect_570426132): void {.
      cdecl, importc: "graphics_draw_rect".}
else:
  static :
    hint("Declaration of " & "graphics_draw_rect" &
        " already exists, not redeclaring")
when not declared(graphics_fill_rect):
  proc graphics_fill_rect*(ctx: ptr GContext_570426154; rect: GRect_570426132;
                           corner_radius: uint16; corner_mask: GCornerMask_570426162): void {.
      cdecl, importc: "graphics_fill_rect".}
else:
  static :
    hint("Declaration of " & "graphics_fill_rect" &
        " already exists, not redeclaring")
when not declared(graphics_draw_circle):
  proc graphics_draw_circle*(ctx: ptr GContext_570426154; p: GPoint_570426124;
                             radius: uint16): void {.cdecl,
      importc: "graphics_draw_circle".}
else:
  static :
    hint("Declaration of " & "graphics_draw_circle" &
        " already exists, not redeclaring")
when not declared(graphics_fill_circle):
  proc graphics_fill_circle*(ctx: ptr GContext_570426154; p: GPoint_570426124;
                             radius: uint16): void {.cdecl,
      importc: "graphics_fill_circle".}
else:
  static :
    hint("Declaration of " & "graphics_fill_circle" &
        " already exists, not redeclaring")
when not declared(graphics_draw_round_rect):
  proc graphics_draw_round_rect*(ctx: ptr GContext_570426154; rect: GRect_570426132;
                                 radius: uint16): void {.cdecl,
      importc: "graphics_draw_round_rect".}
else:
  static :
    hint("Declaration of " & "graphics_draw_round_rect" &
        " already exists, not redeclaring")
when not declared(graphics_draw_bitmap_in_rect):
  proc graphics_draw_bitmap_in_rect*(ctx: ptr GContext_570426154;
                                     bitmap: ptr GBitmap_570426138; rect: GRect_570426132): void {.
      cdecl, importc: "graphics_draw_bitmap_in_rect".}
else:
  static :
    hint("Declaration of " & "graphics_draw_bitmap_in_rect" &
        " already exists, not redeclaring")
when not declared(graphics_capture_frame_buffer):
  proc graphics_capture_frame_buffer*(ctx: ptr GContext_570426154): ptr GBitmap_570426138 {.
      cdecl, importc: "graphics_capture_frame_buffer".}
else:
  static :
    hint("Declaration of " & "graphics_capture_frame_buffer" &
        " already exists, not redeclaring")
when not declared(graphics_capture_frame_buffer_format):
  proc graphics_capture_frame_buffer_format*(ctx: ptr GContext_570426154;
      format: GBitmapFormat_570426136): ptr GBitmap_570426138 {.cdecl,
      importc: "graphics_capture_frame_buffer_format".}
else:
  static :
    hint("Declaration of " & "graphics_capture_frame_buffer_format" &
        " already exists, not redeclaring")
when not declared(graphics_release_frame_buffer):
  proc graphics_release_frame_buffer*(ctx: ptr GContext_570426154;
                                      buffer: ptr GBitmap_570426138): bool {.
      cdecl, importc: "graphics_release_frame_buffer".}
else:
  static :
    hint("Declaration of " & "graphics_release_frame_buffer" &
        " already exists, not redeclaring")
when not declared(graphics_frame_buffer_is_captured):
  proc graphics_frame_buffer_is_captured*(ctx: ptr GContext_570426154): bool {.
      cdecl, importc: "graphics_frame_buffer_is_captured".}
else:
  static :
    hint("Declaration of " & "graphics_frame_buffer_is_captured" &
        " already exists, not redeclaring")
when not declared(graphics_draw_rotated_bitmap):
  proc graphics_draw_rotated_bitmap*(ctx: ptr GContext_570426154;
                                     src: ptr GBitmap_570426138; src_ic: GPoint_570426124;
                                     rotation: cint; dest_ic: GPoint_570426124): void {.
      cdecl, importc: "graphics_draw_rotated_bitmap".}
else:
  static :
    hint("Declaration of " & "graphics_draw_rotated_bitmap" &
        " already exists, not redeclaring")
when not declared(graphics_draw_arc):
  proc graphics_draw_arc*(ctx: ptr GContext_570426154; rect: GRect_570426132;
                          scale_mode: GOvalScaleMode_570426166;
                          angle_start: int32; angle_end: int32): void {.cdecl,
      importc: "graphics_draw_arc".}
else:
  static :
    hint("Declaration of " & "graphics_draw_arc" &
        " already exists, not redeclaring")
when not declared(graphics_fill_radial):
  proc graphics_fill_radial*(ctx: ptr GContext_570426154; rect: GRect_570426132;
                             scale_mode: GOvalScaleMode_570426166;
                             inset_thickness: uint16; angle_start: int32;
                             angle_end: int32): void {.cdecl,
      importc: "graphics_fill_radial".}
else:
  static :
    hint("Declaration of " & "graphics_fill_radial" &
        " already exists, not redeclaring")
when not declared(gpoint_from_polar):
  proc gpoint_from_polar*(rect: GRect_570426132; scale_mode: GOvalScaleMode_570426166;
                          angle: int32): GPoint_570426124 {.cdecl,
      importc: "gpoint_from_polar".}
else:
  static :
    hint("Declaration of " & "gpoint_from_polar" &
        " already exists, not redeclaring")
when not declared(grect_centered_from_polar):
  proc grect_centered_from_polar*(rect: GRect_570426132;
                                  scale_mode: GOvalScaleMode_570426166;
                                  angle: int32; size: GSize_570426128): GRect_570426132 {.
      cdecl, importc: "grect_centered_from_polar".}
else:
  static :
    hint("Declaration of " & "grect_centered_from_polar" &
        " already exists, not redeclaring")
when not declared(gdraw_command_draw):
  proc gdraw_command_draw*(ctx: ptr GContext_570426154;
                           command: ptr GDrawCommand_570426168): void {.cdecl,
      importc: "gdraw_command_draw".}
else:
  static :
    hint("Declaration of " & "gdraw_command_draw" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_type):
  proc gdraw_command_get_type*(command: ptr GDrawCommand_570426168): GDrawCommandType_570426182 {.
      cdecl, importc: "gdraw_command_get_type".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_type" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_fill_color):
  proc gdraw_command_set_fill_color*(command: ptr GDrawCommand_570426168;
                                     fill_color: GColor_570426120): void {.
      cdecl, importc: "gdraw_command_set_fill_color".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_fill_color" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_fill_color):
  proc gdraw_command_get_fill_color*(command: ptr GDrawCommand_570426168): GColor_570426120 {.
      cdecl, importc: "gdraw_command_get_fill_color".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_fill_color" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_stroke_color):
  proc gdraw_command_set_stroke_color*(command: ptr GDrawCommand_570426168;
                                       stroke_color: GColor_570426120): void {.
      cdecl, importc: "gdraw_command_set_stroke_color".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_stroke_color" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_stroke_color):
  proc gdraw_command_get_stroke_color*(command: ptr GDrawCommand_570426168): GColor_570426120 {.
      cdecl, importc: "gdraw_command_get_stroke_color".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_stroke_color" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_stroke_width):
  proc gdraw_command_set_stroke_width*(command: ptr GDrawCommand_570426168;
                                       stroke_width: uint8): void {.cdecl,
      importc: "gdraw_command_set_stroke_width".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_stroke_width" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_stroke_width):
  proc gdraw_command_get_stroke_width*(command: ptr GDrawCommand_570426168): uint8 {.
      cdecl, importc: "gdraw_command_get_stroke_width".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_stroke_width" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_num_points):
  proc gdraw_command_get_num_points*(command: ptr GDrawCommand_570426168): uint16 {.
      cdecl, importc: "gdraw_command_get_num_points".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_num_points" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_point):
  proc gdraw_command_set_point*(command: ptr GDrawCommand_570426168;
                                point_idx: uint16; point: GPoint_570426124): void {.
      cdecl, importc: "gdraw_command_set_point".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_point" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_point):
  proc gdraw_command_get_point*(command: ptr GDrawCommand_570426168;
                                point_idx: uint16): GPoint_570426124 {.cdecl,
      importc: "gdraw_command_get_point".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_point" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_radius):
  proc gdraw_command_set_radius*(command: ptr GDrawCommand_570426168;
                                 radius: uint16): void {.cdecl,
      importc: "gdraw_command_set_radius".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_radius" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_radius):
  proc gdraw_command_get_radius*(command: ptr GDrawCommand_570426168): uint16 {.
      cdecl, importc: "gdraw_command_get_radius".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_radius" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_path_open):
  proc gdraw_command_set_path_open*(command: ptr GDrawCommand_570426168;
                                    path_open: bool): void {.cdecl,
      importc: "gdraw_command_set_path_open".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_path_open" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_path_open):
  proc gdraw_command_get_path_open*(command: ptr GDrawCommand_570426168): bool {.
      cdecl, importc: "gdraw_command_get_path_open".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_path_open" &
        " already exists, not redeclaring")
when not declared(gdraw_command_set_hidden):
  proc gdraw_command_set_hidden*(command: ptr GDrawCommand_570426168;
                                 hidden: bool): void {.cdecl,
      importc: "gdraw_command_set_hidden".}
else:
  static :
    hint("Declaration of " & "gdraw_command_set_hidden" &
        " already exists, not redeclaring")
when not declared(gdraw_command_get_hidden):
  proc gdraw_command_get_hidden*(command: ptr GDrawCommand_570426168): bool {.
      cdecl, importc: "gdraw_command_get_hidden".}
else:
  static :
    hint("Declaration of " & "gdraw_command_get_hidden" &
        " already exists, not redeclaring")
when not declared(gdraw_command_frame_draw):
  proc gdraw_command_frame_draw*(ctx: ptr GContext_570426154;
                                 sequence: ptr GDrawCommandSequence_570426178;
                                 frame: ptr GDrawCommandFrame_570426170;
                                 offset: GPoint_570426124): void {.cdecl,
      importc: "gdraw_command_frame_draw".}
else:
  static :
    hint("Declaration of " & "gdraw_command_frame_draw" &
        " already exists, not redeclaring")
when not declared(gdraw_command_frame_set_duration):
  proc gdraw_command_frame_set_duration*(frame: ptr GDrawCommandFrame_570426170;
      duration: uint32): void {.cdecl,
                                importc: "gdraw_command_frame_set_duration".}
else:
  static :
    hint("Declaration of " & "gdraw_command_frame_set_duration" &
        " already exists, not redeclaring")
when not declared(gdraw_command_frame_get_duration):
  proc gdraw_command_frame_get_duration*(frame: ptr GDrawCommandFrame_570426170): uint32 {.
      cdecl, importc: "gdraw_command_frame_get_duration".}
else:
  static :
    hint("Declaration of " & "gdraw_command_frame_get_duration" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_create_with_resource):
  proc gdraw_command_image_create_with_resource*(resource_id: uint32): ptr GDrawCommandImage_570426172 {.
      cdecl, importc: "gdraw_command_image_create_with_resource".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_create_with_resource" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_clone):
  proc gdraw_command_image_clone*(image: ptr GDrawCommandImage_570426172): ptr GDrawCommandImage_570426172 {.
      cdecl, importc: "gdraw_command_image_clone".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_clone" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_destroy):
  proc gdraw_command_image_destroy*(image: ptr GDrawCommandImage_570426172): void {.
      cdecl, importc: "gdraw_command_image_destroy".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_destroy" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_draw):
  proc gdraw_command_image_draw*(ctx: ptr GContext_570426154;
                                 image: ptr GDrawCommandImage_570426172;
                                 offset: GPoint_570426124): void {.cdecl,
      importc: "gdraw_command_image_draw".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_draw" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_get_bounds_size):
  proc gdraw_command_image_get_bounds_size*(image: ptr GDrawCommandImage_570426172): GSize_570426128 {.
      cdecl, importc: "gdraw_command_image_get_bounds_size".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_get_bounds_size" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_set_bounds_size):
  proc gdraw_command_image_set_bounds_size*(image: ptr GDrawCommandImage_570426172;
      size: GSize_570426128): void {.cdecl, importc: "gdraw_command_image_set_bounds_size".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_set_bounds_size" &
        " already exists, not redeclaring")
when not declared(gdraw_command_image_get_command_list):
  proc gdraw_command_image_get_command_list*(image: ptr GDrawCommandImage_570426172): ptr GDrawCommandList_570426174 {.
      cdecl, importc: "gdraw_command_image_get_command_list".}
else:
  static :
    hint("Declaration of " & "gdraw_command_image_get_command_list" &
        " already exists, not redeclaring")
when not declared(gdraw_command_list_iterate):
  proc gdraw_command_list_iterate*(command_list: ptr GDrawCommandList_570426174;
                                   handle_command: GDrawCommandListIteratorCb_570426176;
                                   callback_context: pointer): void {.cdecl,
      importc: "gdraw_command_list_iterate".}
else:
  static :
    hint("Declaration of " & "gdraw_command_list_iterate" &
        " already exists, not redeclaring")
when not declared(gdraw_command_list_draw):
  proc gdraw_command_list_draw*(ctx: ptr GContext_570426154;
                                command_list: ptr GDrawCommandList_570426174): void {.
      cdecl, importc: "gdraw_command_list_draw".}
else:
  static :
    hint("Declaration of " & "gdraw_command_list_draw" &
        " already exists, not redeclaring")
when not declared(gdraw_command_list_get_command):
  proc gdraw_command_list_get_command*(command_list: ptr GDrawCommandList_570426174;
                                       command_idx: uint16): ptr GDrawCommand_570426168 {.
      cdecl, importc: "gdraw_command_list_get_command".}
else:
  static :
    hint("Declaration of " & "gdraw_command_list_get_command" &
        " already exists, not redeclaring")
when not declared(gdraw_command_list_get_num_commands):
  proc gdraw_command_list_get_num_commands*(command_list: ptr GDrawCommandList_570426174): uint32 {.
      cdecl, importc: "gdraw_command_list_get_num_commands".}
else:
  static :
    hint("Declaration of " & "gdraw_command_list_get_num_commands" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_create_with_resource):
  proc gdraw_command_sequence_create_with_resource*(resource_id: uint32): ptr GDrawCommandSequence_570426178 {.
      cdecl, importc: "gdraw_command_sequence_create_with_resource".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_create_with_resource" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_clone):
  proc gdraw_command_sequence_clone*(sequence: ptr GDrawCommandSequence_570426178): ptr GDrawCommandSequence_570426178 {.
      cdecl, importc: "gdraw_command_sequence_clone".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_clone" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_destroy):
  proc gdraw_command_sequence_destroy*(sequence: ptr GDrawCommandSequence_570426178): void {.
      cdecl, importc: "gdraw_command_sequence_destroy".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_destroy" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_frame_by_elapsed):
  proc gdraw_command_sequence_get_frame_by_elapsed*(
      sequence: ptr GDrawCommandSequence_570426178; elapsed_ms: uint32): ptr GDrawCommandFrame_570426170 {.
      cdecl, importc: "gdraw_command_sequence_get_frame_by_elapsed".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_frame_by_elapsed" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_frame_by_index):
  proc gdraw_command_sequence_get_frame_by_index*(
      sequence: ptr GDrawCommandSequence_570426178; index: uint32): ptr GDrawCommandFrame_570426170 {.
      cdecl, importc: "gdraw_command_sequence_get_frame_by_index".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_frame_by_index" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_bounds_size):
  proc gdraw_command_sequence_get_bounds_size*(
      sequence: ptr GDrawCommandSequence_570426178): GSize_570426128 {.cdecl,
      importc: "gdraw_command_sequence_get_bounds_size".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_bounds_size" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_set_bounds_size):
  proc gdraw_command_sequence_set_bounds_size*(
      sequence: ptr GDrawCommandSequence_570426178; size: GSize_570426128): void {.
      cdecl, importc: "gdraw_command_sequence_set_bounds_size".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_set_bounds_size" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_play_count):
  proc gdraw_command_sequence_get_play_count*(sequence: ptr GDrawCommandSequence_570426178): uint32 {.
      cdecl, importc: "gdraw_command_sequence_get_play_count".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_play_count" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_set_play_count):
  proc gdraw_command_sequence_set_play_count*(
      sequence: ptr GDrawCommandSequence_570426178; play_count: uint32): void {.
      cdecl, importc: "gdraw_command_sequence_set_play_count".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_set_play_count" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_total_duration):
  proc gdraw_command_sequence_get_total_duration*(
      sequence: ptr GDrawCommandSequence_570426178): uint32 {.cdecl,
      importc: "gdraw_command_sequence_get_total_duration".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_total_duration" &
        " already exists, not redeclaring")
when not declared(gdraw_command_sequence_get_num_frames):
  proc gdraw_command_sequence_get_num_frames*(sequence: ptr GDrawCommandSequence_570426178): uint32 {.
      cdecl, importc: "gdraw_command_sequence_get_num_frames".}
else:
  static :
    hint("Declaration of " & "gdraw_command_sequence_get_num_frames" &
        " already exists, not redeclaring")
when not declared(gdraw_command_frame_get_command_list):
  proc gdraw_command_frame_get_command_list*(frame: ptr GDrawCommandFrame_570426170): ptr GDrawCommandList_570426174 {.
      cdecl, importc: "gdraw_command_frame_get_command_list".}
else:
  static :
    hint("Declaration of " & "gdraw_command_frame_get_command_list" &
        " already exists, not redeclaring")
when not declared(gpath_create):
  proc gpath_create*(init: ptr GPathInfo_570426186): ptr GPath_570426190 {.
      cdecl, importc: "gpath_create".}
else:
  static :
    hint("Declaration of " & "gpath_create" & " already exists, not redeclaring")
when not declared(gpath_destroy):
  proc gpath_destroy*(gpath: ptr GPath_570426190): void {.cdecl,
      importc: "gpath_destroy".}
else:
  static :
    hint("Declaration of " & "gpath_destroy" &
        " already exists, not redeclaring")
when not declared(gpath_draw_filled):
  proc gpath_draw_filled*(ctx: ptr GContext_570426154; path: ptr GPath_570426190): void {.
      cdecl, importc: "gpath_draw_filled".}
else:
  static :
    hint("Declaration of " & "gpath_draw_filled" &
        " already exists, not redeclaring")
when not declared(gpath_draw_outline):
  proc gpath_draw_outline*(ctx: ptr GContext_570426154; path: ptr GPath_570426190): void {.
      cdecl, importc: "gpath_draw_outline".}
else:
  static :
    hint("Declaration of " & "gpath_draw_outline" &
        " already exists, not redeclaring")
when not declared(gpath_rotate_to):
  proc gpath_rotate_to*(path: ptr GPath_570426190; angle: int32): void {.cdecl,
      importc: "gpath_rotate_to".}
else:
  static :
    hint("Declaration of " & "gpath_rotate_to" &
        " already exists, not redeclaring")
when not declared(gpath_move_to):
  proc gpath_move_to*(path: ptr GPath_570426190; point: GPoint_570426124): void {.
      cdecl, importc: "gpath_move_to".}
else:
  static :
    hint("Declaration of " & "gpath_move_to" &
        " already exists, not redeclaring")
when not declared(gpath_draw_outline_open):
  proc gpath_draw_outline_open*(ctx: ptr GContext_570426154; path: ptr GPath_570426190): void {.
      cdecl, importc: "gpath_draw_outline_open".}
else:
  static :
    hint("Declaration of " & "gpath_draw_outline_open" &
        " already exists, not redeclaring")
when not declared(fonts_get_system_font):
  proc fonts_get_system_font*(font_key: cstring): GFont_570426194 {.cdecl,
      importc: "fonts_get_system_font".}
else:
  static :
    hint("Declaration of " & "fonts_get_system_font" &
        " already exists, not redeclaring")
when not declared(fonts_load_custom_font):
  proc fonts_load_custom_font*(handle: ResHandle_570426064): GFont_570426194 {.
      cdecl, importc: "fonts_load_custom_font".}
else:
  static :
    hint("Declaration of " & "fonts_load_custom_font" &
        " already exists, not redeclaring")
when not declared(fonts_unload_custom_font):
  proc fonts_unload_custom_font*(font: GFont_570426194): void {.cdecl,
      importc: "fonts_unload_custom_font".}
else:
  static :
    hint("Declaration of " & "fonts_unload_custom_font" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_create):
  proc graphics_text_attributes_create*(): ptr GTextAttributes_570426204 {.
      cdecl, importc: "graphics_text_attributes_create".}
else:
  static :
    hint("Declaration of " & "graphics_text_attributes_create" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_destroy):
  proc graphics_text_attributes_destroy*(text_attributes: ptr GTextAttributes_570426204): void {.
      cdecl, importc: "graphics_text_attributes_destroy".}
else:
  static :
    hint("Declaration of " & "graphics_text_attributes_destroy" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_restore_default_text_flow):
  proc graphics_text_attributes_restore_default_text_flow*(
      text_attributes: ptr GTextAttributes_570426204): void {.cdecl,
      importc: "graphics_text_attributes_restore_default_text_flow".}
else:
  static :
    hint("Declaration of " &
        "graphics_text_attributes_restore_default_text_flow" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_enable_screen_text_flow):
  proc graphics_text_attributes_enable_screen_text_flow*(
      text_attributes: ptr GTextAttributes_570426204; inset: uint8): void {.
      cdecl, importc: "graphics_text_attributes_enable_screen_text_flow".}
else:
  static :
    hint("Declaration of " & "graphics_text_attributes_enable_screen_text_flow" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_restore_default_paging):
  proc graphics_text_attributes_restore_default_paging*(
      text_attributes: ptr GTextAttributes_570426204): void {.cdecl,
      importc: "graphics_text_attributes_restore_default_paging".}
else:
  static :
    hint("Declaration of " & "graphics_text_attributes_restore_default_paging" &
        " already exists, not redeclaring")
when not declared(graphics_text_attributes_enable_paging):
  proc graphics_text_attributes_enable_paging*(
      text_attributes: ptr GTextAttributes_570426204;
      content_origin_on_screen: GPoint_570426124; paging_on_screen: GRect_570426132): void {.
      cdecl, importc: "graphics_text_attributes_enable_paging".}
else:
  static :
    hint("Declaration of " & "graphics_text_attributes_enable_paging" &
        " already exists, not redeclaring")
when not declared(graphics_draw_text):
  proc graphics_draw_text*(ctx: ptr GContext_570426154; text: cstring;
                           font: GFont_570426194; box: GRect_570426132;
                           overflow_mode: GTextOverflowMode_570426198;
                           alignment: GTextAlignment_570426202;
                           text_attributes: ptr GTextAttributes_570426204): void {.
      cdecl, importc: "graphics_draw_text".}
else:
  static :
    hint("Declaration of " & "graphics_draw_text" &
        " already exists, not redeclaring")
when not declared(graphics_text_layout_get_content_size):
  proc graphics_text_layout_get_content_size*(text: cstring; font: GFont_570426194;
      box: GRect_570426132; overflow_mode: GTextOverflowMode_570426198;
      alignment: GTextAlignment_570426202): GSize_570426128 {.cdecl,
      importc: "graphics_text_layout_get_content_size".}
else:
  static :
    hint("Declaration of " & "graphics_text_layout_get_content_size" &
        " already exists, not redeclaring")
when not declared(graphics_text_layout_get_content_size_with_attributes):
  proc graphics_text_layout_get_content_size_with_attributes*(text: cstring;
      font: GFont_570426194; box: GRect_570426132;
      overflow_mode: GTextOverflowMode_570426198; alignment: GTextAlignment_570426202;
      text_attributes: ptr GTextAttributes_570426204): GSize_570426128 {.cdecl,
      importc: "graphics_text_layout_get_content_size_with_attributes".}
else:
  static :
    hint("Declaration of " &
        "graphics_text_layout_get_content_size_with_attributes" &
        " already exists, not redeclaring")
when not declared(smartstrap_subscribe):
  proc smartstrap_subscribe*(handlers: SmartstrapHandlers_570426226): SmartstrapResult_570426208 {.
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
  proc smartstrap_attribute_create*(service_id: SmartstrapServiceId_570426210;
                                    attribute_id: SmartstrapAttributeId_570426212;
                                    buffer_length: csize_t): ptr SmartstrapAttribute_570426214 {.
      cdecl, importc: "smartstrap_attribute_create".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_create" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_destroy):
  proc smartstrap_attribute_destroy*(attribute: ptr SmartstrapAttribute_570426214): void {.
      cdecl, importc: "smartstrap_attribute_destroy".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_destroy" &
        " already exists, not redeclaring")
when not declared(smartstrap_service_is_available):
  proc smartstrap_service_is_available*(service_id: SmartstrapServiceId_570426210): bool {.
      cdecl, importc: "smartstrap_service_is_available".}
else:
  static :
    hint("Declaration of " & "smartstrap_service_is_available" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_get_service_id):
  proc smartstrap_attribute_get_service_id*(attribute: ptr SmartstrapAttribute_570426214): SmartstrapServiceId_570426210 {.
      cdecl, importc: "smartstrap_attribute_get_service_id".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_get_service_id" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_get_attribute_id):
  proc smartstrap_attribute_get_attribute_id*(attribute: ptr SmartstrapAttribute_570426214): SmartstrapAttributeId_570426212 {.
      cdecl, importc: "smartstrap_attribute_get_attribute_id".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_get_attribute_id" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_read):
  proc smartstrap_attribute_read*(attribute: ptr SmartstrapAttribute_570426214): SmartstrapResult_570426208 {.
      cdecl, importc: "smartstrap_attribute_read".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_read" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_begin_write):
  proc smartstrap_attribute_begin_write*(attribute: ptr SmartstrapAttribute_570426214;
      buffer: ptr ptr uint8; buffer_length: ptr csize_t): SmartstrapResult_570426208 {.
      cdecl, importc: "smartstrap_attribute_begin_write".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_begin_write" &
        " already exists, not redeclaring")
when not declared(smartstrap_attribute_end_write):
  proc smartstrap_attribute_end_write*(attribute: ptr SmartstrapAttribute_570426214;
                                       write_length: csize_t; request_read: bool): SmartstrapResult_570426208 {.
      cdecl, importc: "smartstrap_attribute_end_write".}
else:
  static :
    hint("Declaration of " & "smartstrap_attribute_end_write" &
        " already exists, not redeclaring")
when not declared(click_number_of_clicks_counted):
  proc click_number_of_clicks_counted*(recognizer: ClickRecognizerRef_570426228): uint8 {.
      cdecl, importc: "click_number_of_clicks_counted".}
else:
  static :
    hint("Declaration of " & "click_number_of_clicks_counted" &
        " already exists, not redeclaring")
when not declared(click_recognizer_get_button_id):
  proc click_recognizer_get_button_id*(recognizer: ClickRecognizerRef_570426228): ButtonId_570425851 {.
      cdecl, importc: "click_recognizer_get_button_id".}
else:
  static :
    hint("Declaration of " & "click_recognizer_get_button_id" &
        " already exists, not redeclaring")
when not declared(click_recognizer_is_repeating):
  proc click_recognizer_is_repeating*(recognizer: ClickRecognizerRef_570426228): bool {.
      cdecl, importc: "click_recognizer_is_repeating".}
else:
  static :
    hint("Declaration of " & "click_recognizer_is_repeating" &
        " already exists, not redeclaring")
when not declared(layer_create):
  proc layer_create*(frame: GRect_570426132): ptr Layer_570426234 {.cdecl,
      importc: "layer_create".}
else:
  static :
    hint("Declaration of " & "layer_create" & " already exists, not redeclaring")
when not declared(layer_create_with_data):
  proc layer_create_with_data*(frame: GRect_570426132; data_size: csize_t): ptr Layer_570426234 {.
      cdecl, importc: "layer_create_with_data".}
else:
  static :
    hint("Declaration of " & "layer_create_with_data" &
        " already exists, not redeclaring")
when not declared(layer_destroy):
  proc layer_destroy*(layer: ptr Layer_570426234): void {.cdecl,
      importc: "layer_destroy".}
else:
  static :
    hint("Declaration of " & "layer_destroy" &
        " already exists, not redeclaring")
when not declared(layer_mark_dirty):
  proc layer_mark_dirty*(layer: ptr Layer_570426234): void {.cdecl,
      importc: "layer_mark_dirty".}
else:
  static :
    hint("Declaration of " & "layer_mark_dirty" &
        " already exists, not redeclaring")
when not declared(layer_set_update_proc):
  proc layer_set_update_proc*(layer: ptr Layer_570426234;
                              update_proc: LayerUpdateProc_570426236): void {.
      cdecl, importc: "layer_set_update_proc".}
else:
  static :
    hint("Declaration of " & "layer_set_update_proc" &
        " already exists, not redeclaring")
when not declared(layer_set_frame):
  proc layer_set_frame*(layer: ptr Layer_570426234; frame: GRect_570426132): void {.
      cdecl, importc: "layer_set_frame".}
else:
  static :
    hint("Declaration of " & "layer_set_frame" &
        " already exists, not redeclaring")
when not declared(layer_get_frame):
  proc layer_get_frame*(layer: ptr Layer_570426234): GRect_570426132 {.cdecl,
      importc: "layer_get_frame".}
else:
  static :
    hint("Declaration of " & "layer_get_frame" &
        " already exists, not redeclaring")
when not declared(layer_set_bounds):
  proc layer_set_bounds*(layer: ptr Layer_570426234; bounds: GRect_570426132): void {.
      cdecl, importc: "layer_set_bounds".}
else:
  static :
    hint("Declaration of " & "layer_set_bounds" &
        " already exists, not redeclaring")
when not declared(layer_get_bounds):
  proc layer_get_bounds*(layer: ptr Layer_570426234): GRect_570426132 {.cdecl,
      importc: "layer_get_bounds".}
else:
  static :
    hint("Declaration of " & "layer_get_bounds" &
        " already exists, not redeclaring")
when not declared(layer_get_unobstructed_bounds):
  proc layer_get_unobstructed_bounds*(layer: ptr Layer_570426234): GRect_570426132 {.
      cdecl, importc: "layer_get_unobstructed_bounds".}
else:
  static :
    hint("Declaration of " & "layer_get_unobstructed_bounds" &
        " already exists, not redeclaring")
when not declared(layer_convert_point_to_screen):
  proc layer_convert_point_to_screen*(layer: ptr Layer_570426234; point: GPoint_570426124): GPoint_570426124 {.
      cdecl, importc: "layer_convert_point_to_screen".}
else:
  static :
    hint("Declaration of " & "layer_convert_point_to_screen" &
        " already exists, not redeclaring")
when not declared(layer_convert_rect_to_screen):
  proc layer_convert_rect_to_screen*(layer: ptr Layer_570426234; rect: GRect_570426132): GRect_570426132 {.
      cdecl, importc: "layer_convert_rect_to_screen".}
else:
  static :
    hint("Declaration of " & "layer_convert_rect_to_screen" &
        " already exists, not redeclaring")
when not declared(layer_get_window):
  proc layer_get_window*(layer: ptr Layer_570426234): ptr struct_Window {.cdecl,
      importc: "layer_get_window".}
else:
  static :
    hint("Declaration of " & "layer_get_window" &
        " already exists, not redeclaring")
when not declared(layer_remove_from_parent):
  proc layer_remove_from_parent*(child: ptr Layer_570426234): void {.cdecl,
      importc: "layer_remove_from_parent".}
else:
  static :
    hint("Declaration of " & "layer_remove_from_parent" &
        " already exists, not redeclaring")
when not declared(layer_remove_child_layers):
  proc layer_remove_child_layers*(parent: ptr Layer_570426234): void {.cdecl,
      importc: "layer_remove_child_layers".}
else:
  static :
    hint("Declaration of " & "layer_remove_child_layers" &
        " already exists, not redeclaring")
when not declared(layer_add_child):
  proc layer_add_child*(parent: ptr Layer_570426234; child: ptr Layer_570426234): void {.
      cdecl, importc: "layer_add_child".}
else:
  static :
    hint("Declaration of " & "layer_add_child" &
        " already exists, not redeclaring")
when not declared(layer_insert_below_sibling):
  proc layer_insert_below_sibling*(layer_to_insert: ptr Layer_570426234;
                                   below_sibling_layer: ptr Layer_570426234): void {.
      cdecl, importc: "layer_insert_below_sibling".}
else:
  static :
    hint("Declaration of " & "layer_insert_below_sibling" &
        " already exists, not redeclaring")
when not declared(layer_insert_above_sibling):
  proc layer_insert_above_sibling*(layer_to_insert: ptr Layer_570426234;
                                   above_sibling_layer: ptr Layer_570426234): void {.
      cdecl, importc: "layer_insert_above_sibling".}
else:
  static :
    hint("Declaration of " & "layer_insert_above_sibling" &
        " already exists, not redeclaring")
when not declared(layer_set_hidden):
  proc layer_set_hidden*(layer: ptr Layer_570426234; hidden: bool): void {.
      cdecl, importc: "layer_set_hidden".}
else:
  static :
    hint("Declaration of " & "layer_set_hidden" &
        " already exists, not redeclaring")
when not declared(layer_get_hidden):
  proc layer_get_hidden*(layer: ptr Layer_570426234): bool {.cdecl,
      importc: "layer_get_hidden".}
else:
  static :
    hint("Declaration of " & "layer_get_hidden" &
        " already exists, not redeclaring")
when not declared(layer_set_clips):
  proc layer_set_clips*(layer: ptr Layer_570426234; clips: bool): void {.cdecl,
      importc: "layer_set_clips".}
else:
  static :
    hint("Declaration of " & "layer_set_clips" &
        " already exists, not redeclaring")
when not declared(layer_get_clips):
  proc layer_get_clips*(layer: ptr Layer_570426234): bool {.cdecl,
      importc: "layer_get_clips".}
else:
  static :
    hint("Declaration of " & "layer_get_clips" &
        " already exists, not redeclaring")
when not declared(layer_get_data):
  proc layer_get_data*(layer: ptr Layer_570426234): pointer {.cdecl,
      importc: "layer_get_data".}
else:
  static :
    hint("Declaration of " & "layer_get_data" &
        " already exists, not redeclaring")
when not declared(window_create):
  proc window_create*(): ptr Window_570426238 {.cdecl, importc: "window_create".}
else:
  static :
    hint("Declaration of " & "window_create" &
        " already exists, not redeclaring")
when not declared(window_destroy):
  proc window_destroy*(window: ptr Window_570426238): void {.cdecl,
      importc: "window_destroy".}
else:
  static :
    hint("Declaration of " & "window_destroy" &
        " already exists, not redeclaring")
when not declared(window_set_click_config_provider):
  proc window_set_click_config_provider*(window: ptr Window_570426238;
      click_config_provider: ClickConfigProvider_570426232): void {.cdecl,
      importc: "window_set_click_config_provider".}
else:
  static :
    hint("Declaration of " & "window_set_click_config_provider" &
        " already exists, not redeclaring")
when not declared(window_set_click_config_provider_with_context):
  proc window_set_click_config_provider_with_context*(window: ptr Window_570426238;
      click_config_provider: ClickConfigProvider_570426232; context: pointer): void {.
      cdecl, importc: "window_set_click_config_provider_with_context".}
else:
  static :
    hint("Declaration of " & "window_set_click_config_provider_with_context" &
        " already exists, not redeclaring")
when not declared(window_get_click_config_provider):
  proc window_get_click_config_provider*(window: ptr Window_570426238): ClickConfigProvider_570426232 {.
      cdecl, importc: "window_get_click_config_provider".}
else:
  static :
    hint("Declaration of " & "window_get_click_config_provider" &
        " already exists, not redeclaring")
when not declared(window_get_click_config_context):
  proc window_get_click_config_context*(window: ptr Window_570426238): pointer {.
      cdecl, importc: "window_get_click_config_context".}
else:
  static :
    hint("Declaration of " & "window_get_click_config_context" &
        " already exists, not redeclaring")
when not declared(window_set_window_handlers):
  proc window_set_window_handlers*(window: ptr Window_570426238;
                                   handlers: WindowHandlers_570426244): void {.
      cdecl, importc: "window_set_window_handlers".}
else:
  static :
    hint("Declaration of " & "window_set_window_handlers" &
        " already exists, not redeclaring")
when not declared(window_get_root_layer):
  proc window_get_root_layer*(window: ptr Window_570426238): ptr struct_Layer {.
      cdecl, importc: "window_get_root_layer".}
else:
  static :
    hint("Declaration of " & "window_get_root_layer" &
        " already exists, not redeclaring")
when not declared(window_set_background_color):
  proc window_set_background_color*(window: ptr Window_570426238;
                                    background_color: GColor_570426120): void {.
      cdecl, importc: "window_set_background_color".}
else:
  static :
    hint("Declaration of " & "window_set_background_color" &
        " already exists, not redeclaring")
when not declared(window_is_loaded):
  proc window_is_loaded*(window: ptr Window_570426238): bool {.cdecl,
      importc: "window_is_loaded".}
else:
  static :
    hint("Declaration of " & "window_is_loaded" &
        " already exists, not redeclaring")
when not declared(window_set_user_data):
  proc window_set_user_data*(window: ptr Window_570426238; data: pointer): void {.
      cdecl, importc: "window_set_user_data".}
else:
  static :
    hint("Declaration of " & "window_set_user_data" &
        " already exists, not redeclaring")
when not declared(window_get_user_data):
  proc window_get_user_data*(window: ptr Window_570426238): pointer {.cdecl,
      importc: "window_get_user_data".}
else:
  static :
    hint("Declaration of " & "window_get_user_data" &
        " already exists, not redeclaring")
when not declared(window_single_click_subscribe):
  proc window_single_click_subscribe*(button_id: ButtonId_570425851;
                                      handler: ClickHandler_570426230): void {.
      cdecl, importc: "window_single_click_subscribe".}
else:
  static :
    hint("Declaration of " & "window_single_click_subscribe" &
        " already exists, not redeclaring")
when not declared(window_single_repeating_click_subscribe):
  proc window_single_repeating_click_subscribe*(button_id: ButtonId_570425851;
      repeat_interval_ms: uint16; handler: ClickHandler_570426230): void {.
      cdecl, importc: "window_single_repeating_click_subscribe".}
else:
  static :
    hint("Declaration of " & "window_single_repeating_click_subscribe" &
        " already exists, not redeclaring")
when not declared(window_multi_click_subscribe):
  proc window_multi_click_subscribe*(button_id: ButtonId_570425851;
                                     min_clicks: uint8; max_clicks: uint8;
                                     timeout: uint16; last_click_only: bool;
                                     handler: ClickHandler_570426230): void {.
      cdecl, importc: "window_multi_click_subscribe".}
else:
  static :
    hint("Declaration of " & "window_multi_click_subscribe" &
        " already exists, not redeclaring")
when not declared(window_long_click_subscribe):
  proc window_long_click_subscribe*(button_id: ButtonId_570425851;
                                    delay_ms: uint16;
                                    down_handler: ClickHandler_570426230;
                                    up_handler: ClickHandler_570426230): void {.
      cdecl, importc: "window_long_click_subscribe".}
else:
  static :
    hint("Declaration of " & "window_long_click_subscribe" &
        " already exists, not redeclaring")
when not declared(window_raw_click_subscribe):
  proc window_raw_click_subscribe*(button_id: ButtonId_570425851;
                                   down_handler: ClickHandler_570426230;
                                   up_handler: ClickHandler_570426230;
                                   context: pointer): void {.cdecl,
      importc: "window_raw_click_subscribe".}
else:
  static :
    hint("Declaration of " & "window_raw_click_subscribe" &
        " already exists, not redeclaring")
when not declared(window_set_click_context):
  proc window_set_click_context*(button_id: ButtonId_570425851; context: pointer): void {.
      cdecl, importc: "window_set_click_context".}
else:
  static :
    hint("Declaration of " & "window_set_click_context" &
        " already exists, not redeclaring")
when not declared(window_stack_push):
  proc window_stack_push*(window: ptr Window_570426238; animated: bool): void {.
      cdecl, importc: "window_stack_push".}
else:
  static :
    hint("Declaration of " & "window_stack_push" &
        " already exists, not redeclaring")
when not declared(window_stack_pop):
  proc window_stack_pop*(animated: bool): ptr Window_570426238 {.cdecl,
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
  proc window_stack_remove*(window: ptr Window_570426238; animated: bool): bool {.
      cdecl, importc: "window_stack_remove".}
else:
  static :
    hint("Declaration of " & "window_stack_remove" &
        " already exists, not redeclaring")
when not declared(window_stack_get_top_window):
  proc window_stack_get_top_window*(): ptr Window_570426238 {.cdecl,
      importc: "window_stack_get_top_window".}
else:
  static :
    hint("Declaration of " & "window_stack_get_top_window" &
        " already exists, not redeclaring")
when not declared(window_stack_contains_window):
  proc window_stack_contains_window*(window: ptr Window_570426238): bool {.
      cdecl, importc: "window_stack_contains_window".}
else:
  static :
    hint("Declaration of " & "window_stack_contains_window" &
        " already exists, not redeclaring")
when not declared(animation_create):
  proc animation_create*(): ptr Animation_570426246 {.cdecl,
      importc: "animation_create".}
else:
  static :
    hint("Declaration of " & "animation_create" &
        " already exists, not redeclaring")
when not declared(animation_destroy):
  proc animation_destroy*(animation: ptr Animation_570426246): bool {.cdecl,
      importc: "animation_destroy".}
else:
  static :
    hint("Declaration of " & "animation_destroy" &
        " already exists, not redeclaring")
when not declared(animation_clone):
  proc animation_clone*(from_f: ptr Animation_570426246): ptr Animation_570426246 {.
      cdecl, importc: "animation_clone".}
else:
  static :
    hint("Declaration of " & "animation_clone" &
        " already exists, not redeclaring")
when not declared(animation_sequence_create):
  proc animation_sequence_create*(animation_a: ptr Animation_570426246;
                                  animation_b: ptr Animation_570426246;
                                  animation_c: ptr Animation_570426246): ptr Animation_570426246 {.
      cdecl, varargs, importc: "animation_sequence_create".}
else:
  static :
    hint("Declaration of " & "animation_sequence_create" &
        " already exists, not redeclaring")
when not declared(animation_sequence_create_from_array):
  proc animation_sequence_create_from_array*(animation_array: ptr ptr Animation_570426246;
      array_len: uint32): ptr Animation_570426246 {.cdecl,
      importc: "animation_sequence_create_from_array".}
else:
  static :
    hint("Declaration of " & "animation_sequence_create_from_array" &
        " already exists, not redeclaring")
when not declared(animation_spawn_create):
  proc animation_spawn_create*(animation_a: ptr Animation_570426246;
                               animation_b: ptr Animation_570426246;
                               animation_c: ptr Animation_570426246): ptr Animation_570426246 {.
      cdecl, varargs, importc: "animation_spawn_create".}
else:
  static :
    hint("Declaration of " & "animation_spawn_create" &
        " already exists, not redeclaring")
when not declared(animation_spawn_create_from_array):
  proc animation_spawn_create_from_array*(animation_array: ptr ptr Animation_570426246;
      array_len: uint32): ptr Animation_570426246 {.cdecl,
      importc: "animation_spawn_create_from_array".}
else:
  static :
    hint("Declaration of " & "animation_spawn_create_from_array" &
        " already exists, not redeclaring")
when not declared(animation_set_elapsed):
  proc animation_set_elapsed*(animation: ptr Animation_570426246;
                              elapsed_ms: uint32): bool {.cdecl,
      importc: "animation_set_elapsed".}
else:
  static :
    hint("Declaration of " & "animation_set_elapsed" &
        " already exists, not redeclaring")
when not declared(animation_get_elapsed):
  proc animation_get_elapsed*(animation: ptr Animation_570426246;
                              elapsed_ms: ptr int32): bool {.cdecl,
      importc: "animation_get_elapsed".}
else:
  static :
    hint("Declaration of " & "animation_get_elapsed" &
        " already exists, not redeclaring")
when not declared(animation_set_reverse):
  proc animation_set_reverse*(animation: ptr Animation_570426246; reverse: bool): bool {.
      cdecl, importc: "animation_set_reverse".}
else:
  static :
    hint("Declaration of " & "animation_set_reverse" &
        " already exists, not redeclaring")
when not declared(animation_get_reverse):
  proc animation_get_reverse*(animation: ptr Animation_570426246): bool {.cdecl,
      importc: "animation_get_reverse".}
else:
  static :
    hint("Declaration of " & "animation_get_reverse" &
        " already exists, not redeclaring")
when not declared(animation_set_play_count):
  proc animation_set_play_count*(animation: ptr Animation_570426246;
                                 play_count: uint32): bool {.cdecl,
      importc: "animation_set_play_count".}
else:
  static :
    hint("Declaration of " & "animation_set_play_count" &
        " already exists, not redeclaring")
when not declared(animation_get_play_count):
  proc animation_get_play_count*(animation: ptr Animation_570426246): uint32 {.
      cdecl, importc: "animation_get_play_count".}
else:
  static :
    hint("Declaration of " & "animation_get_play_count" &
        " already exists, not redeclaring")
when not declared(animation_set_duration):
  proc animation_set_duration*(animation: ptr Animation_570426246;
                               duration_ms: uint32): bool {.cdecl,
      importc: "animation_set_duration".}
else:
  static :
    hint("Declaration of " & "animation_set_duration" &
        " already exists, not redeclaring")
when not declared(animation_get_duration):
  proc animation_get_duration*(animation: ptr Animation_570426246;
                               include_delay: bool; include_play_count: bool): uint32 {.
      cdecl, importc: "animation_get_duration".}
else:
  static :
    hint("Declaration of " & "animation_get_duration" &
        " already exists, not redeclaring")
when not declared(animation_set_delay):
  proc animation_set_delay*(animation: ptr Animation_570426246; delay_ms: uint32): bool {.
      cdecl, importc: "animation_set_delay".}
else:
  static :
    hint("Declaration of " & "animation_set_delay" &
        " already exists, not redeclaring")
when not declared(animation_get_delay):
  proc animation_get_delay*(animation: ptr Animation_570426246): uint32 {.cdecl,
      importc: "animation_get_delay".}
else:
  static :
    hint("Declaration of " & "animation_get_delay" &
        " already exists, not redeclaring")
when not declared(animation_set_curve):
  proc animation_set_curve*(animation: ptr Animation_570426246;
                            curve: AnimationCurve_570426252): bool {.cdecl,
      importc: "animation_set_curve".}
else:
  static :
    hint("Declaration of " & "animation_set_curve" &
        " already exists, not redeclaring")
when not declared(animation_get_curve):
  proc animation_get_curve*(animation: ptr Animation_570426246): AnimationCurve_570426252 {.
      cdecl, importc: "animation_get_curve".}
else:
  static :
    hint("Declaration of " & "animation_get_curve" &
        " already exists, not redeclaring")
when not declared(animation_set_custom_curve):
  proc animation_set_custom_curve*(animation: ptr Animation_570426246;
                                   curve_function: AnimationCurveFunction_570426254): bool {.
      cdecl, importc: "animation_set_custom_curve".}
else:
  static :
    hint("Declaration of " & "animation_set_custom_curve" &
        " already exists, not redeclaring")
when not declared(animation_get_custom_curve):
  proc animation_get_custom_curve*(animation: ptr Animation_570426246): AnimationCurveFunction_570426254 {.
      cdecl, importc: "animation_get_custom_curve".}
else:
  static :
    hint("Declaration of " & "animation_get_custom_curve" &
        " already exists, not redeclaring")
when not declared(animation_set_handlers):
  proc animation_set_handlers*(animation: ptr Animation_570426246;
                               callbacks: AnimationHandlers_570426262;
                               context: pointer): bool {.cdecl,
      importc: "animation_set_handlers".}
else:
  static :
    hint("Declaration of " & "animation_set_handlers" &
        " already exists, not redeclaring")
when not declared(animation_get_context):
  proc animation_get_context*(animation: ptr Animation_570426246): pointer {.
      cdecl, importc: "animation_get_context".}
else:
  static :
    hint("Declaration of " & "animation_get_context" &
        " already exists, not redeclaring")
when not declared(animation_schedule):
  proc animation_schedule*(animation: ptr Animation_570426246): bool {.cdecl,
      importc: "animation_schedule".}
else:
  static :
    hint("Declaration of " & "animation_schedule" &
        " already exists, not redeclaring")
when not declared(animation_unschedule):
  proc animation_unschedule*(animation: ptr Animation_570426246): bool {.cdecl,
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
  proc animation_is_scheduled*(animation: ptr Animation_570426246): bool {.
      cdecl, importc: "animation_is_scheduled".}
else:
  static :
    hint("Declaration of " & "animation_is_scheduled" &
        " already exists, not redeclaring")
when not declared(animation_set_implementation):
  proc animation_set_implementation*(animation: ptr Animation_570426246;
      implementation: ptr AnimationImplementation_570426272): bool {.cdecl,
      importc: "animation_set_implementation".}
else:
  static :
    hint("Declaration of " & "animation_set_implementation" &
        " already exists, not redeclaring")
when not declared(animation_get_implementation):
  proc animation_get_implementation*(animation: ptr Animation_570426246): ptr AnimationImplementation_570426272 {.
      cdecl, importc: "animation_get_implementation".}
else:
  static :
    hint("Declaration of " & "animation_get_implementation" &
        " already exists, not redeclaring")
when not declared(property_animation_create_layer_frame):
  proc property_animation_create_layer_frame*(layer: ptr struct_Layer;
      from_frame: ptr GRect_570426132; to_frame: ptr GRect_570426132): ptr PropertyAnimation_570426282 {.
      cdecl, importc: "property_animation_create_layer_frame".}
else:
  static :
    hint("Declaration of " & "property_animation_create_layer_frame" &
        " already exists, not redeclaring")
when not declared(property_animation_create_bounds_origin):
  proc property_animation_create_bounds_origin*(layer: ptr struct_Layer;
      from_f: ptr GPoint_570426124; to: ptr GPoint_570426124): ptr PropertyAnimation_570426282 {.
      cdecl, importc: "property_animation_create_bounds_origin".}
else:
  static :
    hint("Declaration of " & "property_animation_create_bounds_origin" &
        " already exists, not redeclaring")
when not declared(property_animation_create):
  proc property_animation_create*(implementation: ptr PropertyAnimationImplementation_570426278;
                                  subject: pointer; from_value: pointer;
                                  to_value: pointer): ptr PropertyAnimation_570426282 {.
      cdecl, importc: "property_animation_create".}
else:
  static :
    hint("Declaration of " & "property_animation_create" &
        " already exists, not redeclaring")
when not declared(property_animation_destroy):
  proc property_animation_destroy*(property_animation: ptr PropertyAnimation_570426282): void {.
      cdecl, importc: "property_animation_destroy".}
else:
  static :
    hint("Declaration of " & "property_animation_destroy" &
        " already exists, not redeclaring")
when not declared(property_animation_update_int16):
  proc property_animation_update_int16*(property_animation: ptr PropertyAnimation_570426282;
                                        distance_normalized: uint32): void {.
      cdecl, importc: "property_animation_update_int16".}
else:
  static :
    hint("Declaration of " & "property_animation_update_int16" &
        " already exists, not redeclaring")
when not declared(property_animation_update_uint32):
  proc property_animation_update_uint32*(
      property_animation: ptr PropertyAnimation_570426282;
      distance_normalized: uint32): void {.cdecl,
      importc: "property_animation_update_uint32".}
else:
  static :
    hint("Declaration of " & "property_animation_update_uint32" &
        " already exists, not redeclaring")
when not declared(property_animation_update_gpoint):
  proc property_animation_update_gpoint*(
      property_animation: ptr PropertyAnimation_570426282;
      distance_normalized: uint32): void {.cdecl,
      importc: "property_animation_update_gpoint".}
else:
  static :
    hint("Declaration of " & "property_animation_update_gpoint" &
        " already exists, not redeclaring")
when not declared(property_animation_update_grect):
  proc property_animation_update_grect*(property_animation: ptr PropertyAnimation_570426282;
                                        distance_normalized: uint32): void {.
      cdecl, importc: "property_animation_update_grect".}
else:
  static :
    hint("Declaration of " & "property_animation_update_grect" &
        " already exists, not redeclaring")
when not declared(property_animation_update_gcolor8):
  proc property_animation_update_gcolor8*(
      property_animation: ptr PropertyAnimation_570426282;
      distance_normalized: uint32): void {.cdecl,
      importc: "property_animation_update_gcolor8".}
else:
  static :
    hint("Declaration of " & "property_animation_update_gcolor8" &
        " already exists, not redeclaring")
when not declared(property_animation_get_animation):
  proc property_animation_get_animation*(
      property_animation: ptr PropertyAnimation_570426282): ptr Animation_570426246 {.
      cdecl, importc: "property_animation_get_animation".}
else:
  static :
    hint("Declaration of " & "property_animation_get_animation" &
        " already exists, not redeclaring")
when not declared(property_animation_subject):
  proc property_animation_subject*(property_animation: ptr PropertyAnimation_570426282;
                                   subject: ptr pointer; set_f: bool): bool {.
      cdecl, importc: "property_animation_subject".}
else:
  static :
    hint("Declaration of " & "property_animation_subject" &
        " already exists, not redeclaring")
when not declared(property_animation_from):
  proc property_animation_from*(property_animation: ptr PropertyAnimation_570426282;
                                from_f: pointer; size: csize_t; set_f: bool): bool {.
      cdecl, importc: "property_animation_from".}
else:
  static :
    hint("Declaration of " & "property_animation_from" &
        " already exists, not redeclaring")
when not declared(property_animation_to):
  proc property_animation_to*(property_animation: ptr PropertyAnimation_570426282;
                              to: pointer; size: csize_t; set_f: bool): bool {.
      cdecl, importc: "property_animation_to".}
else:
  static :
    hint("Declaration of " & "property_animation_to" &
        " already exists, not redeclaring")
when not declared(unobstructed_area_service_subscribe):
  proc unobstructed_area_service_subscribe*(handlers: UnobstructedAreaHandlers_570426316;
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
  proc text_layer_create*(frame: GRect_570426132): ptr TextLayer_570426318 {.
      cdecl, importc: "text_layer_create".}
else:
  static :
    hint("Declaration of " & "text_layer_create" &
        " already exists, not redeclaring")
when not declared(text_layer_destroy):
  proc text_layer_destroy*(text_layer: ptr TextLayer_570426318): void {.cdecl,
      importc: "text_layer_destroy".}
else:
  static :
    hint("Declaration of " & "text_layer_destroy" &
        " already exists, not redeclaring")
when not declared(text_layer_get_layer):
  proc text_layer_get_layer*(text_layer: ptr TextLayer_570426318): ptr Layer_570426234 {.
      cdecl, importc: "text_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "text_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(text_layer_set_text):
  proc text_layer_set_text*(text_layer: ptr TextLayer_570426318; text: cstring): void {.
      cdecl, importc: "text_layer_set_text".}
else:
  static :
    hint("Declaration of " & "text_layer_set_text" &
        " already exists, not redeclaring")
when not declared(text_layer_get_text):
  proc text_layer_get_text*(text_layer: ptr TextLayer_570426318): cstring {.
      cdecl, importc: "text_layer_get_text".}
else:
  static :
    hint("Declaration of " & "text_layer_get_text" &
        " already exists, not redeclaring")
when not declared(text_layer_set_background_color):
  proc text_layer_set_background_color*(text_layer: ptr TextLayer_570426318;
                                        color: GColor_570426120): void {.cdecl,
      importc: "text_layer_set_background_color".}
else:
  static :
    hint("Declaration of " & "text_layer_set_background_color" &
        " already exists, not redeclaring")
when not declared(text_layer_set_text_color):
  proc text_layer_set_text_color*(text_layer: ptr TextLayer_570426318;
                                  color: GColor_570426120): void {.cdecl,
      importc: "text_layer_set_text_color".}
else:
  static :
    hint("Declaration of " & "text_layer_set_text_color" &
        " already exists, not redeclaring")
when not declared(text_layer_set_overflow_mode):
  proc text_layer_set_overflow_mode*(text_layer: ptr TextLayer_570426318;
                                     line_mode: GTextOverflowMode_570426198): void {.
      cdecl, importc: "text_layer_set_overflow_mode".}
else:
  static :
    hint("Declaration of " & "text_layer_set_overflow_mode" &
        " already exists, not redeclaring")
when not declared(text_layer_set_font):
  proc text_layer_set_font*(text_layer: ptr TextLayer_570426318; font: GFont_570426194): void {.
      cdecl, importc: "text_layer_set_font".}
else:
  static :
    hint("Declaration of " & "text_layer_set_font" &
        " already exists, not redeclaring")
when not declared(text_layer_set_text_alignment):
  proc text_layer_set_text_alignment*(text_layer: ptr TextLayer_570426318;
                                      text_alignment: GTextAlignment_570426202): void {.
      cdecl, importc: "text_layer_set_text_alignment".}
else:
  static :
    hint("Declaration of " & "text_layer_set_text_alignment" &
        " already exists, not redeclaring")
when not declared(text_layer_enable_screen_text_flow_and_paging):
  proc text_layer_enable_screen_text_flow_and_paging*(text_layer: ptr TextLayer_570426318;
      inset: uint8): void {.cdecl, importc: "text_layer_enable_screen_text_flow_and_paging".}
else:
  static :
    hint("Declaration of " & "text_layer_enable_screen_text_flow_and_paging" &
        " already exists, not redeclaring")
when not declared(text_layer_restore_default_text_flow_and_paging):
  proc text_layer_restore_default_text_flow_and_paging*(
      text_layer: ptr TextLayer_570426318): void {.cdecl,
      importc: "text_layer_restore_default_text_flow_and_paging".}
else:
  static :
    hint("Declaration of " & "text_layer_restore_default_text_flow_and_paging" &
        " already exists, not redeclaring")
when not declared(text_layer_get_content_size):
  proc text_layer_get_content_size*(text_layer: ptr TextLayer_570426318): GSize_570426128 {.
      cdecl, importc: "text_layer_get_content_size".}
else:
  static :
    hint("Declaration of " & "text_layer_get_content_size" &
        " already exists, not redeclaring")
when not declared(text_layer_set_size):
  proc text_layer_set_size*(text_layer: ptr TextLayer_570426318; max_size: GSize_570426128): void {.
      cdecl, importc: "text_layer_set_size".}
else:
  static :
    hint("Declaration of " & "text_layer_set_size" &
        " already exists, not redeclaring")
when not declared(scroll_layer_create):
  proc scroll_layer_create*(frame: GRect_570426132): ptr ScrollLayer_570426320 {.
      cdecl, importc: "scroll_layer_create".}
else:
  static :
    hint("Declaration of " & "scroll_layer_create" &
        " already exists, not redeclaring")
when not declared(scroll_layer_destroy):
  proc scroll_layer_destroy*(scroll_layer: ptr ScrollLayer_570426320): void {.
      cdecl, importc: "scroll_layer_destroy".}
else:
  static :
    hint("Declaration of " & "scroll_layer_destroy" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_layer):
  proc scroll_layer_get_layer*(scroll_layer: ptr ScrollLayer_570426320): ptr Layer_570426234 {.
      cdecl, importc: "scroll_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(scroll_layer_add_child):
  proc scroll_layer_add_child*(scroll_layer: ptr ScrollLayer_570426320;
                               child: ptr Layer_570426234): void {.cdecl,
      importc: "scroll_layer_add_child".}
else:
  static :
    hint("Declaration of " & "scroll_layer_add_child" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_click_config_onto_window):
  proc scroll_layer_set_click_config_onto_window*(scroll_layer: ptr ScrollLayer_570426320;
      window: ptr struct_Window): void {.cdecl,
      importc: "scroll_layer_set_click_config_onto_window".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_click_config_onto_window" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_callbacks):
  proc scroll_layer_set_callbacks*(scroll_layer: ptr ScrollLayer_570426320;
                                   callbacks: ScrollLayerCallbacks_570426326): void {.
      cdecl, importc: "scroll_layer_set_callbacks".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_callbacks" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_context):
  proc scroll_layer_set_context*(scroll_layer: ptr ScrollLayer_570426320;
                                 context: pointer): void {.cdecl,
      importc: "scroll_layer_set_context".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_context" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_content_offset):
  proc scroll_layer_set_content_offset*(scroll_layer: ptr ScrollLayer_570426320;
                                        offset: GPoint_570426124; animated: bool): void {.
      cdecl, importc: "scroll_layer_set_content_offset".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_content_offset" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_content_offset):
  proc scroll_layer_get_content_offset*(scroll_layer: ptr ScrollLayer_570426320): GPoint_570426124 {.
      cdecl, importc: "scroll_layer_get_content_offset".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_content_offset" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_content_size):
  proc scroll_layer_set_content_size*(scroll_layer: ptr ScrollLayer_570426320;
                                      size: GSize_570426128): void {.cdecl,
      importc: "scroll_layer_set_content_size".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_content_size" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_content_size):
  proc scroll_layer_get_content_size*(scroll_layer: ptr ScrollLayer_570426320): GSize_570426128 {.
      cdecl, importc: "scroll_layer_get_content_size".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_content_size" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_frame):
  proc scroll_layer_set_frame*(scroll_layer: ptr ScrollLayer_570426320;
                               frame: GRect_570426132): void {.cdecl,
      importc: "scroll_layer_set_frame".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_frame" &
        " already exists, not redeclaring")
when not declared(scroll_layer_scroll_up_click_handler):
  proc scroll_layer_scroll_up_click_handler*(recognizer: ClickRecognizerRef_570426228;
      context: pointer): void {.cdecl,
                                importc: "scroll_layer_scroll_up_click_handler".}
else:
  static :
    hint("Declaration of " & "scroll_layer_scroll_up_click_handler" &
        " already exists, not redeclaring")
when not declared(scroll_layer_scroll_down_click_handler):
  proc scroll_layer_scroll_down_click_handler*(recognizer: ClickRecognizerRef_570426228;
      context: pointer): void {.cdecl, importc: "scroll_layer_scroll_down_click_handler".}
else:
  static :
    hint("Declaration of " & "scroll_layer_scroll_down_click_handler" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_shadow_hidden):
  proc scroll_layer_set_shadow_hidden*(scroll_layer: ptr ScrollLayer_570426320;
                                       hidden: bool): void {.cdecl,
      importc: "scroll_layer_set_shadow_hidden".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_shadow_hidden" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_shadow_hidden):
  proc scroll_layer_get_shadow_hidden*(scroll_layer: ptr ScrollLayer_570426320): bool {.
      cdecl, importc: "scroll_layer_get_shadow_hidden".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_shadow_hidden" &
        " already exists, not redeclaring")
when not declared(scroll_layer_set_paging):
  proc scroll_layer_set_paging*(scroll_layer: ptr ScrollLayer_570426320;
                                paging_enabled: bool): void {.cdecl,
      importc: "scroll_layer_set_paging".}
else:
  static :
    hint("Declaration of " & "scroll_layer_set_paging" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_paging):
  proc scroll_layer_get_paging*(scroll_layer: ptr ScrollLayer_570426320): bool {.
      cdecl, importc: "scroll_layer_get_paging".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_paging" &
        " already exists, not redeclaring")
when not declared(scroll_layer_get_content_indicator):
  proc scroll_layer_get_content_indicator*(scroll_layer: ptr ScrollLayer_570426320): ptr ContentIndicator_570426328 {.
      cdecl, importc: "scroll_layer_get_content_indicator".}
else:
  static :
    hint("Declaration of " & "scroll_layer_get_content_indicator" &
        " already exists, not redeclaring")
when not declared(content_indicator_create):
  proc content_indicator_create*(): ptr ContentIndicator_570426328 {.cdecl,
      importc: "content_indicator_create".}
else:
  static :
    hint("Declaration of " & "content_indicator_create" &
        " already exists, not redeclaring")
when not declared(content_indicator_destroy):
  proc content_indicator_destroy*(content_indicator: ptr ContentIndicator_570426328): void {.
      cdecl, importc: "content_indicator_destroy".}
else:
  static :
    hint("Declaration of " & "content_indicator_destroy" &
        " already exists, not redeclaring")
when not declared(content_indicator_configure_direction):
  proc content_indicator_configure_direction*(
      content_indicator: ptr ContentIndicator_570426328;
      direction: ContentIndicatorDirection_570426332;
      config: ptr ContentIndicatorConfig_570426336): bool {.cdecl,
      importc: "content_indicator_configure_direction".}
else:
  static :
    hint("Declaration of " & "content_indicator_configure_direction" &
        " already exists, not redeclaring")
when not declared(content_indicator_get_content_available):
  proc content_indicator_get_content_available*(
      content_indicator: ptr ContentIndicator_570426328;
      direction: ContentIndicatorDirection_570426332): bool {.cdecl,
      importc: "content_indicator_get_content_available".}
else:
  static :
    hint("Declaration of " & "content_indicator_get_content_available" &
        " already exists, not redeclaring")
when not declared(content_indicator_set_content_available):
  proc content_indicator_set_content_available*(
      content_indicator: ptr ContentIndicator_570426328;
      direction: ContentIndicatorDirection_570426332; available: bool): void {.
      cdecl, importc: "content_indicator_set_content_available".}
else:
  static :
    hint("Declaration of " & "content_indicator_set_content_available" &
        " already exists, not redeclaring")
when not declared(menu_cell_basic_draw):
  proc menu_cell_basic_draw*(ctx: ptr GContext_570426154; cell_layer: ptr Layer_570426234;
                             title: cstring; subtitle: cstring;
                             icon: ptr GBitmap_570426138): void {.cdecl,
      importc: "menu_cell_basic_draw".}
else:
  static :
    hint("Declaration of " & "menu_cell_basic_draw" &
        " already exists, not redeclaring")
when not declared(menu_cell_title_draw):
  proc menu_cell_title_draw*(ctx: ptr GContext_570426154; cell_layer: ptr Layer_570426234;
                             title: cstring): void {.cdecl,
      importc: "menu_cell_title_draw".}
else:
  static :
    hint("Declaration of " & "menu_cell_title_draw" &
        " already exists, not redeclaring")
when not declared(menu_cell_basic_header_draw):
  proc menu_cell_basic_header_draw*(ctx: ptr GContext_570426154;
                                    cell_layer: ptr Layer_570426234;
                                    title: cstring): void {.cdecl,
      importc: "menu_cell_basic_header_draw".}
else:
  static :
    hint("Declaration of " & "menu_cell_basic_header_draw" &
        " already exists, not redeclaring")
when not declared(menu_index_compare):
  proc menu_index_compare*(a: ptr MenuIndex_570426340; b: ptr MenuIndex_570426340): int16 {.
      cdecl, importc: "menu_index_compare".}
else:
  static :
    hint("Declaration of " & "menu_index_compare" &
        " already exists, not redeclaring")
when not declared(menu_layer_create):
  proc menu_layer_create*(frame: GRect_570426132): ptr MenuLayer_570426346 {.
      cdecl, importc: "menu_layer_create".}
else:
  static :
    hint("Declaration of " & "menu_layer_create" &
        " already exists, not redeclaring")
when not declared(menu_layer_destroy):
  proc menu_layer_destroy*(menu_layer: ptr MenuLayer_570426346): void {.cdecl,
      importc: "menu_layer_destroy".}
else:
  static :
    hint("Declaration of " & "menu_layer_destroy" &
        " already exists, not redeclaring")
when not declared(menu_layer_get_layer):
  proc menu_layer_get_layer*(menu_layer: ptr MenuLayer_570426346): ptr Layer_570426234 {.
      cdecl, importc: "menu_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "menu_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(menu_layer_get_scroll_layer):
  proc menu_layer_get_scroll_layer*(menu_layer: ptr MenuLayer_570426346): ptr ScrollLayer_570426320 {.
      cdecl, importc: "menu_layer_get_scroll_layer".}
else:
  static :
    hint("Declaration of " & "menu_layer_get_scroll_layer" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_callbacks):
  proc menu_layer_set_callbacks*(menu_layer: ptr MenuLayer_570426346;
                                 callback_context: pointer;
                                 callbacks: MenuLayerCallbacks_570426374): void {.
      cdecl, importc: "menu_layer_set_callbacks".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_callbacks" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_click_config_onto_window):
  proc menu_layer_set_click_config_onto_window*(menu_layer: ptr MenuLayer_570426346;
      window: ptr struct_Window): void {.cdecl,
      importc: "menu_layer_set_click_config_onto_window".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_click_config_onto_window" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_selected_next):
  proc menu_layer_set_selected_next*(menu_layer: ptr MenuLayer_570426346;
                                     up: bool; scroll_align: MenuRowAlign_570426378;
                                     animated: bool): void {.cdecl,
      importc: "menu_layer_set_selected_next".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_selected_next" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_selected_index):
  proc menu_layer_set_selected_index*(menu_layer: ptr MenuLayer_570426346;
                                      index: MenuIndex_570426340;
                                      scroll_align: MenuRowAlign_570426378;
                                      animated: bool): void {.cdecl,
      importc: "menu_layer_set_selected_index".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_selected_index" &
        " already exists, not redeclaring")
when not declared(menu_layer_get_selected_index):
  proc menu_layer_get_selected_index*(menu_layer: ptr MenuLayer_570426346): MenuIndex_570426340 {.
      cdecl, importc: "menu_layer_get_selected_index".}
else:
  static :
    hint("Declaration of " & "menu_layer_get_selected_index" &
        " already exists, not redeclaring")
when not declared(menu_layer_reload_data):
  proc menu_layer_reload_data*(menu_layer: ptr MenuLayer_570426346): void {.
      cdecl, importc: "menu_layer_reload_data".}
else:
  static :
    hint("Declaration of " & "menu_layer_reload_data" &
        " already exists, not redeclaring")
when not declared(menu_cell_layer_is_highlighted):
  proc menu_cell_layer_is_highlighted*(cell_layer: ptr Layer_570426234): bool {.
      cdecl, importc: "menu_cell_layer_is_highlighted".}
else:
  static :
    hint("Declaration of " & "menu_cell_layer_is_highlighted" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_normal_colors):
  proc menu_layer_set_normal_colors*(menu_layer: ptr MenuLayer_570426346;
                                     background: GColor_570426120;
                                     foreground: GColor_570426120): void {.
      cdecl, importc: "menu_layer_set_normal_colors".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_normal_colors" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_highlight_colors):
  proc menu_layer_set_highlight_colors*(menu_layer: ptr MenuLayer_570426346;
                                        background: GColor_570426120;
                                        foreground: GColor_570426120): void {.
      cdecl, importc: "menu_layer_set_highlight_colors".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_highlight_colors" &
        " already exists, not redeclaring")
when not declared(menu_layer_pad_bottom_enable):
  proc menu_layer_pad_bottom_enable*(menu_layer: ptr MenuLayer_570426346;
                                     enable: bool): void {.cdecl,
      importc: "menu_layer_pad_bottom_enable".}
else:
  static :
    hint("Declaration of " & "menu_layer_pad_bottom_enable" &
        " already exists, not redeclaring")
when not declared(menu_layer_get_center_focused):
  proc menu_layer_get_center_focused*(menu_layer: ptr MenuLayer_570426346): bool {.
      cdecl, importc: "menu_layer_get_center_focused".}
else:
  static :
    hint("Declaration of " & "menu_layer_get_center_focused" &
        " already exists, not redeclaring")
when not declared(menu_layer_set_center_focused):
  proc menu_layer_set_center_focused*(menu_layer: ptr MenuLayer_570426346;
                                      center_focused: bool): void {.cdecl,
      importc: "menu_layer_set_center_focused".}
else:
  static :
    hint("Declaration of " & "menu_layer_set_center_focused" &
        " already exists, not redeclaring")
when not declared(menu_layer_is_index_selected):
  proc menu_layer_is_index_selected*(menu_layer: ptr MenuLayer_570426346;
                                     index: ptr MenuIndex_570426340): bool {.
      cdecl, importc: "menu_layer_is_index_selected".}
else:
  static :
    hint("Declaration of " & "menu_layer_is_index_selected" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_create):
  proc simple_menu_layer_create*(frame: GRect_570426132; window: ptr Window_570426238;
                                 sections: ptr SimpleMenuSection_570426390;
                                 num_sections: int32; callback_context: pointer): ptr SimpleMenuLayer_570426380 {.
      cdecl, importc: "simple_menu_layer_create".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_create" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_destroy):
  proc simple_menu_layer_destroy*(menu_layer: ptr SimpleMenuLayer_570426380): void {.
      cdecl, importc: "simple_menu_layer_destroy".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_destroy" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_get_layer):
  proc simple_menu_layer_get_layer*(simple_menu: ptr SimpleMenuLayer_570426380): ptr Layer_570426234 {.
      cdecl, importc: "simple_menu_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_get_selected_index):
  proc simple_menu_layer_get_selected_index*(simple_menu: ptr SimpleMenuLayer_570426380): cint {.
      cdecl, importc: "simple_menu_layer_get_selected_index".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_get_selected_index" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_set_selected_index):
  proc simple_menu_layer_set_selected_index*(simple_menu: ptr SimpleMenuLayer_570426380;
      index: int32; animated: bool): void {.cdecl,
      importc: "simple_menu_layer_set_selected_index".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_set_selected_index" &
        " already exists, not redeclaring")
when not declared(simple_menu_layer_get_menu_layer):
  proc simple_menu_layer_get_menu_layer*(simple_menu: ptr SimpleMenuLayer_570426380): ptr MenuLayer_570426346 {.
      cdecl, importc: "simple_menu_layer_get_menu_layer".}
else:
  static :
    hint("Declaration of " & "simple_menu_layer_get_menu_layer" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_create):
  proc action_bar_layer_create*(): ptr ActionBarLayer_570426396 {.cdecl,
      importc: "action_bar_layer_create".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_create" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_destroy):
  proc action_bar_layer_destroy*(action_bar_layer: ptr ActionBarLayer_570426396): void {.
      cdecl, importc: "action_bar_layer_destroy".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_destroy" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_get_layer):
  proc action_bar_layer_get_layer*(action_bar_layer: ptr ActionBarLayer_570426396): ptr Layer_570426234 {.
      cdecl, importc: "action_bar_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_context):
  proc action_bar_layer_set_context*(action_bar: ptr ActionBarLayer_570426396;
                                     context: pointer): void {.cdecl,
      importc: "action_bar_layer_set_context".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_context" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_click_config_provider):
  proc action_bar_layer_set_click_config_provider*(
      action_bar: ptr ActionBarLayer_570426396;
      click_config_provider: ClickConfigProvider_570426232): void {.cdecl,
      importc: "action_bar_layer_set_click_config_provider".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_click_config_provider" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_icon):
  proc action_bar_layer_set_icon*(action_bar: ptr ActionBarLayer_570426396;
                                  button_id: ButtonId_570425851;
                                  icon: ptr GBitmap_570426138): void {.cdecl,
      importc: "action_bar_layer_set_icon".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_icon" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_clear_icon):
  proc action_bar_layer_clear_icon*(action_bar: ptr ActionBarLayer_570426396;
                                    button_id: ButtonId_570425851): void {.
      cdecl, importc: "action_bar_layer_clear_icon".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_clear_icon" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_add_to_window):
  proc action_bar_layer_add_to_window*(action_bar: ptr ActionBarLayer_570426396;
                                       window: ptr struct_Window): void {.cdecl,
      importc: "action_bar_layer_add_to_window".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_add_to_window" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_remove_from_window):
  proc action_bar_layer_remove_from_window*(action_bar: ptr ActionBarLayer_570426396): void {.
      cdecl, importc: "action_bar_layer_remove_from_window".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_remove_from_window" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_background_color):
  proc action_bar_layer_set_background_color*(action_bar: ptr ActionBarLayer_570426396;
      background_color: GColor_570426120): void {.cdecl,
      importc: "action_bar_layer_set_background_color".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_background_color" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_icon_animated):
  proc action_bar_layer_set_icon_animated*(action_bar: ptr ActionBarLayer_570426396;
      button_id: ButtonId_570425851; icon: ptr GBitmap_570426138; animated: bool): void {.
      cdecl, importc: "action_bar_layer_set_icon_animated".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_icon_animated" &
        " already exists, not redeclaring")
when not declared(action_bar_layer_set_icon_press_animation):
  proc action_bar_layer_set_icon_press_animation*(
      action_bar: ptr ActionBarLayer_570426396; button_id: ButtonId_570425851;
      animation: ActionBarLayerIconPressAnimation_570426394): void {.cdecl,
      importc: "action_bar_layer_set_icon_press_animation".}
else:
  static :
    hint("Declaration of " & "action_bar_layer_set_icon_press_animation" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_create):
  proc status_bar_layer_create*(): ptr StatusBarLayer_570426398 {.cdecl,
      importc: "status_bar_layer_create".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_create" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_destroy):
  proc status_bar_layer_destroy*(status_bar_layer: ptr StatusBarLayer_570426398): void {.
      cdecl, importc: "status_bar_layer_destroy".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_destroy" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_get_layer):
  proc status_bar_layer_get_layer*(status_bar_layer: ptr StatusBarLayer_570426398): ptr Layer_570426234 {.
      cdecl, importc: "status_bar_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_get_background_color):
  proc status_bar_layer_get_background_color*(
      status_bar_layer: ptr StatusBarLayer_570426398): GColor_570426120 {.cdecl,
      importc: "status_bar_layer_get_background_color".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_get_background_color" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_get_foreground_color):
  proc status_bar_layer_get_foreground_color*(
      status_bar_layer: ptr StatusBarLayer_570426398): GColor_570426120 {.cdecl,
      importc: "status_bar_layer_get_foreground_color".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_get_foreground_color" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_set_colors):
  proc status_bar_layer_set_colors*(status_bar_layer: ptr StatusBarLayer_570426398;
                                    background: GColor_570426120;
                                    foreground: GColor_570426120): void {.cdecl,
      importc: "status_bar_layer_set_colors".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_set_colors" &
        " already exists, not redeclaring")
when not declared(status_bar_layer_set_separator_mode):
  proc status_bar_layer_set_separator_mode*(
      status_bar_layer: ptr StatusBarLayer_570426398;
      mode: StatusBarLayerSeparatorMode_570426402): void {.cdecl,
      importc: "status_bar_layer_set_separator_mode".}
else:
  static :
    hint("Declaration of " & "status_bar_layer_set_separator_mode" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_create):
  proc bitmap_layer_create*(frame: GRect_570426132): ptr BitmapLayer_570426404 {.
      cdecl, importc: "bitmap_layer_create".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_create" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_destroy):
  proc bitmap_layer_destroy*(bitmap_layer: ptr BitmapLayer_570426404): void {.
      cdecl, importc: "bitmap_layer_destroy".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_destroy" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_get_layer):
  proc bitmap_layer_get_layer*(bitmap_layer: ptr BitmapLayer_570426404): ptr Layer_570426234 {.
      cdecl, importc: "bitmap_layer_get_layer".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_get_layer" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_get_bitmap):
  proc bitmap_layer_get_bitmap*(bitmap_layer: ptr BitmapLayer_570426404): ptr GBitmap_570426138 {.
      cdecl, importc: "bitmap_layer_get_bitmap".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_get_bitmap" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_set_bitmap):
  proc bitmap_layer_set_bitmap*(bitmap_layer: ptr BitmapLayer_570426404;
                                bitmap: ptr GBitmap_570426138): void {.cdecl,
      importc: "bitmap_layer_set_bitmap".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_set_bitmap" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_set_alignment):
  proc bitmap_layer_set_alignment*(bitmap_layer: ptr BitmapLayer_570426404;
                                   alignment: GAlign_570426148): void {.cdecl,
      importc: "bitmap_layer_set_alignment".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_set_alignment" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_set_background_color):
  proc bitmap_layer_set_background_color*(bitmap_layer: ptr BitmapLayer_570426404;
      color: GColor_570426120): void {.cdecl, importc: "bitmap_layer_set_background_color".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_set_background_color" &
        " already exists, not redeclaring")
when not declared(bitmap_layer_set_compositing_mode):
  proc bitmap_layer_set_compositing_mode*(bitmap_layer: ptr BitmapLayer_570426404;
      mode: GCompOp_570426152): void {.cdecl, importc: "bitmap_layer_set_compositing_mode".}
else:
  static :
    hint("Declaration of " & "bitmap_layer_set_compositing_mode" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_layer_create):
  proc rot_bitmap_layer_create*(bitmap: ptr GBitmap_570426138): ptr RotBitmapLayer_570426406 {.
      cdecl, importc: "rot_bitmap_layer_create".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_layer_create" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_layer_destroy):
  proc rot_bitmap_layer_destroy*(bitmap: ptr RotBitmapLayer_570426406): void {.
      cdecl, importc: "rot_bitmap_layer_destroy".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_layer_destroy" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_layer_set_corner_clip_color):
  proc rot_bitmap_layer_set_corner_clip_color*(bitmap: ptr RotBitmapLayer_570426406;
      color: GColor_570426120): void {.cdecl, importc: "rot_bitmap_layer_set_corner_clip_color".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_layer_set_corner_clip_color" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_layer_set_angle):
  proc rot_bitmap_layer_set_angle*(bitmap: ptr RotBitmapLayer_570426406;
                                   angle: int32): void {.cdecl,
      importc: "rot_bitmap_layer_set_angle".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_layer_set_angle" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_layer_increment_angle):
  proc rot_bitmap_layer_increment_angle*(bitmap: ptr RotBitmapLayer_570426406;
      angle_change: int32): void {.cdecl,
                                   importc: "rot_bitmap_layer_increment_angle".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_layer_increment_angle" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_set_src_ic):
  proc rot_bitmap_set_src_ic*(bitmap: ptr RotBitmapLayer_570426406; ic: GPoint_570426124): void {.
      cdecl, importc: "rot_bitmap_set_src_ic".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_set_src_ic" &
        " already exists, not redeclaring")
when not declared(rot_bitmap_set_compositing_mode):
  proc rot_bitmap_set_compositing_mode*(bitmap: ptr RotBitmapLayer_570426406;
                                        mode: GCompOp_570426152): void {.cdecl,
      importc: "rot_bitmap_set_compositing_mode".}
else:
  static :
    hint("Declaration of " & "rot_bitmap_set_compositing_mode" &
        " already exists, not redeclaring")
when not declared(number_window_create):
  proc number_window_create*(label: cstring; callbacks: NumberWindowCallbacks_570426414;
                             callback_context: pointer): ptr NumberWindow_570426408 {.
      cdecl, importc: "number_window_create".}
else:
  static :
    hint("Declaration of " & "number_window_create" &
        " already exists, not redeclaring")
when not declared(number_window_destroy):
  proc number_window_destroy*(number_window: ptr NumberWindow_570426408): void {.
      cdecl, importc: "number_window_destroy".}
else:
  static :
    hint("Declaration of " & "number_window_destroy" &
        " already exists, not redeclaring")
when not declared(number_window_set_label):
  proc number_window_set_label*(numberwindow: ptr NumberWindow_570426408;
                                label: cstring): void {.cdecl,
      importc: "number_window_set_label".}
else:
  static :
    hint("Declaration of " & "number_window_set_label" &
        " already exists, not redeclaring")
when not declared(number_window_set_max):
  proc number_window_set_max*(numberwindow: ptr NumberWindow_570426408;
                              max: int32): void {.cdecl,
      importc: "number_window_set_max".}
else:
  static :
    hint("Declaration of " & "number_window_set_max" &
        " already exists, not redeclaring")
when not declared(number_window_set_min):
  proc number_window_set_min*(numberwindow: ptr NumberWindow_570426408;
                              min: int32): void {.cdecl,
      importc: "number_window_set_min".}
else:
  static :
    hint("Declaration of " & "number_window_set_min" &
        " already exists, not redeclaring")
when not declared(number_window_set_value):
  proc number_window_set_value*(numberwindow: ptr NumberWindow_570426408;
                                value: int32): void {.cdecl,
      importc: "number_window_set_value".}
else:
  static :
    hint("Declaration of " & "number_window_set_value" &
        " already exists, not redeclaring")
when not declared(number_window_set_step_size):
  proc number_window_set_step_size*(numberwindow: ptr NumberWindow_570426408;
                                    step: int32): void {.cdecl,
      importc: "number_window_set_step_size".}
else:
  static :
    hint("Declaration of " & "number_window_set_step_size" &
        " already exists, not redeclaring")
when not declared(number_window_get_value):
  proc number_window_get_value*(numberwindow: ptr NumberWindow_570426408): int32 {.
      cdecl, importc: "number_window_get_value".}
else:
  static :
    hint("Declaration of " & "number_window_get_value" &
        " already exists, not redeclaring")
when not declared(number_window_get_window):
  proc number_window_get_window*(numberwindow: ptr NumberWindow_570426408): ptr Window_570426238 {.
      cdecl, importc: "number_window_get_window".}
else:
  static :
    hint("Declaration of " & "number_window_get_window" &
        " already exists, not redeclaring")
when not declared(action_menu_item_get_label):
  proc action_menu_item_get_label*(item: ptr ActionMenuItem_570426416): cstring {.
      cdecl, importc: "action_menu_item_get_label".}
else:
  static :
    hint("Declaration of " & "action_menu_item_get_label" &
        " already exists, not redeclaring")
when not declared(action_menu_item_get_action_data):
  proc action_menu_item_get_action_data*(item: ptr ActionMenuItem_570426416): pointer {.
      cdecl, importc: "action_menu_item_get_action_data".}
else:
  static :
    hint("Declaration of " & "action_menu_item_get_action_data" &
        " already exists, not redeclaring")
when not declared(action_menu_level_create):
  proc action_menu_level_create*(max_items: uint16): ptr ActionMenuLevel_570426418 {.
      cdecl, importc: "action_menu_level_create".}
else:
  static :
    hint("Declaration of " & "action_menu_level_create" &
        " already exists, not redeclaring")
when not declared(action_menu_level_set_display_mode):
  proc action_menu_level_set_display_mode*(level: ptr ActionMenuLevel_570426418;
      display_mode: ActionMenuLevelDisplayMode_570426430): void {.cdecl,
      importc: "action_menu_level_set_display_mode".}
else:
  static :
    hint("Declaration of " & "action_menu_level_set_display_mode" &
        " already exists, not redeclaring")
when not declared(action_menu_level_add_action):
  proc action_menu_level_add_action*(level: ptr ActionMenuLevel_570426418;
                                     label: cstring;
                                     cb: ActionMenuPerformActionCb_570426432;
                                     action_data: pointer): ptr ActionMenuItem_570426416 {.
      cdecl, importc: "action_menu_level_add_action".}
else:
  static :
    hint("Declaration of " & "action_menu_level_add_action" &
        " already exists, not redeclaring")
when not declared(action_menu_level_add_child):
  proc action_menu_level_add_child*(level: ptr ActionMenuLevel_570426418;
                                    child: ptr ActionMenuLevel_570426418;
                                    label: cstring): ptr ActionMenuItem_570426416 {.
      cdecl, importc: "action_menu_level_add_child".}
else:
  static :
    hint("Declaration of " & "action_menu_level_add_child" &
        " already exists, not redeclaring")
when not declared(action_menu_hierarchy_destroy):
  proc action_menu_hierarchy_destroy*(root: ptr ActionMenuLevel_570426418;
                                      each_cb: ActionMenuEachItemCb_570426434;
                                      context: pointer): void {.cdecl,
      importc: "action_menu_hierarchy_destroy".}
else:
  static :
    hint("Declaration of " & "action_menu_hierarchy_destroy" &
        " already exists, not redeclaring")
when not declared(action_menu_get_context):
  proc action_menu_get_context*(action_menu: ptr ActionMenu_570426424): pointer {.
      cdecl, importc: "action_menu_get_context".}
else:
  static :
    hint("Declaration of " & "action_menu_get_context" &
        " already exists, not redeclaring")
when not declared(action_menu_get_root_level):
  proc action_menu_get_root_level*(action_menu: ptr ActionMenu_570426424): ptr ActionMenuLevel_570426418 {.
      cdecl, importc: "action_menu_get_root_level".}
else:
  static :
    hint("Declaration of " & "action_menu_get_root_level" &
        " already exists, not redeclaring")
when not declared(action_menu_open):
  proc action_menu_open*(config: ptr ActionMenuConfig_570426438): ptr ActionMenu_570426424 {.
      cdecl, importc: "action_menu_open".}
else:
  static :
    hint("Declaration of " & "action_menu_open" &
        " already exists, not redeclaring")
when not declared(action_menu_freeze):
  proc action_menu_freeze*(action_menu: ptr ActionMenu_570426424): void {.cdecl,
      importc: "action_menu_freeze".}
else:
  static :
    hint("Declaration of " & "action_menu_freeze" &
        " already exists, not redeclaring")
when not declared(action_menu_unfreeze):
  proc action_menu_unfreeze*(action_menu: ptr ActionMenu_570426424): void {.
      cdecl, importc: "action_menu_unfreeze".}
else:
  static :
    hint("Declaration of " & "action_menu_unfreeze" &
        " already exists, not redeclaring")
when not declared(action_menu_set_result_window):
  proc action_menu_set_result_window*(action_menu: ptr ActionMenu_570426424;
                                      result_window: ptr Window_570426238): void {.
      cdecl, importc: "action_menu_set_result_window".}
else:
  static :
    hint("Declaration of " & "action_menu_set_result_window" &
        " already exists, not redeclaring")
when not declared(action_menu_close):
  proc action_menu_close*(action_menu: ptr ActionMenu_570426424; animated: bool): void {.
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
  proc vibes_enqueue_custom_pattern*(pattern: VibePattern_570426442): void {.
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
  proc preferred_content_size*(): PreferredContentSize_570426446 {.cdecl,
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
                 tm_p: ptr struct_tm_570425847): cint {.cdecl,
      importc: "strftime".}
else:
  static :
    hint("Declaration of " & "strftime" & " already exists, not redeclaring")
when not declared(localtime):
  proc localtime*(timep: ptr time_t_570425869): ptr struct_tm_570425847 {.cdecl,
      importc: "localtime".}
else:
  static :
    hint("Declaration of " & "localtime" & " already exists, not redeclaring")
when not declared(gmtime):
  proc gmtime*(timep: ptr time_t_570425869): ptr struct_tm_570425847 {.cdecl,
      importc: "gmtime".}
else:
  static :
    hint("Declaration of " & "gmtime" & " already exists, not redeclaring")
when not declared(mktime):
  proc mktime*(tb: ptr struct_tm_570425847): time_t_570425869 {.cdecl,
      importc: "mktime".}
else:
  static :
    hint("Declaration of " & "mktime" & " already exists, not redeclaring")
when not declared(time):
  proc time*(tloc: ptr time_t_570425869): time_t_570425869 {.cdecl,
      importc: "time".}
else:
  static :
    hint("Declaration of " & "time" & " already exists, not redeclaring")
when not declared(difftime):
  proc difftime*(end_f: time_t_570425869; beginning: time_t_570425869): cdouble {.
      cdecl, importc: "difftime".}
else:
  static :
    hint("Declaration of " & "difftime" & " already exists, not redeclaring")
when not declared(time_ms):
  proc time_ms*(t_utc: ptr time_t_570425869; out_ms: ptr uint16): uint16 {.
      cdecl, importc: "time_ms".}
else:
  static :
    hint("Declaration of " & "time_ms" & " already exists, not redeclaring")
when not declared(time_start_of_today):
  proc time_start_of_today*(): time_t_570425869 {.cdecl,
      importc: "time_start_of_today".}
else:
  static :
    hint("Declaration of " & "time_start_of_today" &
        " already exists, not redeclaring")
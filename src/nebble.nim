## Nebble: High-level idiomatic Nim API for the Pebble smartwatch SDK.
##
## This is the umbrella module that re-exports all high-level modules.
## For low-level FFI bindings, use `import nebble/ffi`.
##
## Usage:
##   import nebble
##
## Compile with one of:
##   -d:pebbleAplite
##   -d:pebbleBasalt    (default if none specified)
##   -d:pebbleChalk
##   -d:pebbleDiorite
##   -d:pebbleEmery
##   -d:pebbleFlint
##
## For cross-compilation to ARM Pebble hardware, use the flags in tests/nim.cfg:
##   --os:any --cpu:arm --mm:arc -d:useMalloc --noMain --compileOnly
##   -d:noSignalHandler --threads:off -d:danger

# Import FFI and export commonly used types/constants (not functions to avoid ambiguity)
import nebble/ffi
export Window, WindowHandlers, ClickConfigProvider, ClickRecognizerRef
export Layer, GRect, GPoint, GSize, GColor, GContext, GOvalScaleMode
export TextLayer, GFont, GTextAlignment
export BitmapLayer, GBitmap, GBitmapSequence, GBitmapFormat
export RotBitmapLayer
export ActionBarLayer
export ScrollLayer
export ContentIndicator, ContentIndicatorDirection
export GTextAttributes
export MenuLayer, SimpleMenuLayer, MenuIndex
export StatusBarLayer
export HealthMetric, HealthValue, HealthActivity, HealthEventType
export HealthMinuteData, HealthServiceTimeScope, HealthServiceAccessibilityMask
export HealthActivityMask, HealthIterationDirection, MeasurementSystem

# Const aliases for HealthMetric values (needed because HealthMetric is a typedef)
# Wrapped in when declared to support platforms without specific metrics (e.g. Aplite)
when declared(ffi.HealthMetricStepCount):
  const HealthMetricStepCount* = ffi.HealthMetricStepCount
when declared(ffi.HealthMetricActiveSeconds):
  const HealthMetricActiveSeconds* = ffi.HealthMetricActiveSeconds
when declared(ffi.HealthMetricWalkedDistanceMeters):
  const HealthMetricWalkedDistanceMeters* = ffi.HealthMetricWalkedDistanceMeters
when declared(ffi.HealthMetricSleepSeconds):
  const HealthMetricSleepSeconds* = ffi.HealthMetricSleepSeconds
when declared(ffi.HealthMetricSleepRestfulSeconds):
  const HealthMetricSleepRestfulSeconds* = ffi.HealthMetricSleepRestfulSeconds
when declared(ffi.HealthMetricRestingKCalories):
  const HealthMetricRestingKCalories* = ffi.HealthMetricRestingKCalories
when declared(ffi.HealthMetricActiveKCalories):
  const HealthMetricActiveKCalories* = ffi.HealthMetricActiveKCalories
when declared(ffi.HealthMetricHeartRateBPM):
  const HealthMetricHeartRateBPM* = ffi.HealthMetricHeartRateBPM
when declared(ffi.HealthMetricHeartRateRawBPM):
  const HealthMetricHeartRateRawBPM* = ffi.HealthMetricHeartRateRawBPM

const
  HealthServiceAccessibilityMaskAvailable* = ffi.HealthServiceAccessibilityMaskAvailable
  HealthServiceAccessibilityMaskNoPermission* = ffi.HealthServiceAccessibilityMaskNoPermission
  HealthServiceAccessibilityMaskNotSupported* = ffi.HealthServiceAccessibilityMaskNotSupported
  HealthServiceAccessibilityMaskNotAvailable* = ffi.HealthServiceAccessibilityMaskNotAvailable
export AccelData, AccelRawData
export PreferredContentSize
export WatchInfoModel, WatchInfoColor, WatchInfoVersion
export BatteryChargeState, BatteryStateHandler
export BluetoothConnectionHandler
export VibePattern
export CompassHeadingData, CompassHeadingHandler, CompassHeading
export makeGRect, makeGPoint, makeGSize, makeUuid
export GColorClear, GColorBlack, GColorWhite, makeGColor8
# Export all 64 color constants from macros.nim
export GColorOxfordBlue, GColorDukeBlue, GColorBlue, GColorDarkGreen
export GColorMidnightGreen, GColorCobaltBlue, GColorBlueMoon, GColorIslamicGreen
export GColorJaegerGreen, GColorTiffanyBlue, GColorVividCerulean, GColorGreen
export GColorMalachite, GColorMediumSpringGreen, GColorCyan, GColorBulgarianRose
export GColorImperialPurple, GColorIndigo, GColorElectricUltramarine, GColorArmyGreen
export GColorDarkGray, GColorLiberty, GColorVeryLightBlue, GColorKellyGreen
export GColorMayGreen, GColorCadetBlue, GColorPictonBlue, GColorBrightGreen
export GColorScreaminGreen, GColorMediumAquamarine, GColorElectricBlue, GColorDarkCandyAppleRed
export GColorJazzberryJam, GColorPurple, GColorVividViolet, GColorWindsorTan
export GColorRoseVale, GColorPurpureus, GColorLavenderIndigo, GColorLimerick
export GColorBrass, GColorLightGray, GColorBabyBlueEyes, GColorSpringBud
export GColorInchworm, GColorMintGreen, GColorCeleste, GColorRed, GColorFolly
export GColorFashionMagenta, GColorMagenta, GColorOrange, GColorSunsetOrange
export GColorBrilliantRose, GColorShockingPink, GColorChromeYellow, GColorRajah
export GColorMelon, GColorRichBrilliantLavender, GColorYellow, GColorIcterine
export GColorPastelYellow
export GDrawCommandImage, GDrawCommandSequence, GDrawCommandFrame
export GDrawCommandType, GDrawCommand, GDrawCommandList
export TimeUnits, ButtonId, AnimationCurve

# ============================================================================
# Constants (Enum Values)
# ============================================================================
## Re-export enum values and font keys for convenience.
## These are defined as const values since Futhark-generated enum aliases
## don't auto-export with their types.

import nebble/constants
export constants

# Note: Types (GTextAlignment, GTextOverflowMode, GAlign, GColor8, TimeUnits, ButtonId, AnimationCurve)
# are already exported from FFI above. The constants module exports their values.

# Keep font types
export GFont

# Export additional color constants from macros (ffi already includes macros.nim)
# All 64 GColor* constants are available via ffi/macros.nim

# Export font keys (these work directly from FFI via 'let' bindings)
export FONT_KEY_GOTHIC_14, FONT_KEY_GOTHIC_14_BOLD
export FONT_KEY_GOTHIC_18, FONT_KEY_GOTHIC_18_BOLD
export FONT_KEY_GOTHIC_24, FONT_KEY_GOTHIC_24_BOLD
export FONT_KEY_GOTHIC_28, FONT_KEY_GOTHIC_28_BOLD
export FONT_KEY_BITHAM_30_BLACK
export FONT_KEY_BITHAM_42_BOLD, FONT_KEY_BITHAM_42_LIGHT
export FONT_KEY_ROBOTO_CONDENSED_21
export FONT_KEY_ROBOTO_BOLD_SUBSET_49
export FONT_KEY_DROID_SERIF_28_BOLD

# ============================================================================
# Foundation
# ============================================================================

import nebble/foundation/app
export app
export app.pebbleApp

import nebble/foundation/time
export time

import nebble/foundation/timer
export timer

import nebble/foundation/storage
export storage

import nebble/foundation/wakeup
export wakeup

import nebble/foundation/watch_info
export watch_info

import nebble/foundation/logging
export logging

import nebble/foundation/i18n
export i18n

import nebble/foundation/memory
export memory

import nebble/foundation/platform
export platform

# ============================================================================
# Foundation Events (Event Services)
# ============================================================================

import nebble/foundation/events/accel
export accel

import nebble/foundation/events/battery
export battery

import nebble/foundation/events/compass
export compass

import nebble/foundation/events/connection
export connection

import nebble/foundation/events/focus
export focus

import nebble/foundation/events/health
export health

import nebble/foundation/events/tick
export tick

# ============================================================================
# UI Components
# ============================================================================

import nebble/ui/window
export window

import nebble/ui/layer
export layer

import nebble/ui/animation
export animation

import nebble/ui/clicks
export clicks

import nebble/ui/text_layer
export text_layer

import nebble/ui/bitmap_layer
export bitmap_layer

import nebble/ui/menu_layer
export menu_layer

import nebble/ui/simple_menu_layer
export simple_menu_layer

import nebble/ui/number_window
export number_window

import nebble/ui/scroll_layer
export scroll_layer

import nebble/ui/content_indicator
export content_indicator

import nebble/ui/action_bar
export action_bar

import nebble/ui/status_bar
export status_bar

import nebble/ui/action_menu
export action_menu

import nebble/ui/rot_bitmap_layer
export rot_bitmap_layer

import nebble/ui/light
export light

import nebble/ui/vibes
export vibes

import nebble/ui/preferences
export preferences

import nebble/ui/unobstructed_area
export unobstructed_area

import nebble/ui/window_stack
export window_stack

import nebble/ui/declarative
export declarative

# ============================================================================
# Managed Types (ARC Memory Management)
# ============================================================================

import nebble/ffi/managed
export managed except DefineUniqueHandle  # Template not needed by users

import nebble/ui/property_animation
export property_animation

# ============================================================================
# Graphics
# ============================================================================

import nebble/graphics/graphics
export graphics

import nebble/graphics/bitmap_sequence
export bitmap_sequence

import nebble/graphics/draw_command
export draw_command

import nebble/graphics/draw_command_image
export draw_command_image

import nebble/graphics/draw_command_sequence
export draw_command_sequence

import nebble/graphics/draw_command_detail
export draw_command_detail

import nebble/graphics/gpath
export gpath

import nebble/graphics/text_attributes
export text_attributes

import nebble/graphics/fonts
export fonts

import nebble/graphics/bitmap_ref
export bitmap_ref

import nebble/graphics/font_ref
export font_ref

# ============================================================================
# Communication
# ============================================================================

import nebble/comms/message
export message

import nebble/comms/typed_message
export typed_message

import nebble/comms/app_sync
export app_sync

import nebble/comms/app_comm
export app_comm

import nebble/comms/data_logging
export data_logging

import nebble/comms/worker
export worker

import nebble/comms/smartstrap
export smartstrap

# ============================================================================
# Resources
# ============================================================================

import nebble/resources
export resources

# ============================================================================
# Input
# ============================================================================

import nebble/input/dictation
export dictation

# ============================================================================
# Utilities
# ============================================================================

import nebble/util/math
export math

import nebble/util/uuid
export uuid

import nebble/util/fixed_strings
export fixed_strings

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
export TimeUnits, TickHandler, tm, time_t
export HealthMetric, HealthValue, HealthActivity, HealthEventType
export HealthMinuteData, HealthServiceTimeScope, HealthServiceAccessibilityMask
export HealthActivityMask, HealthIterationDirection, MeasurementSystem
export AccelData, AccelRawData
export PreferredContentSize
export WatchInfoModel, WatchInfoColor, WatchInfoVersion
export BatteryChargeState, BatteryStateHandler
export BluetoothConnectionHandler
export VibePattern
export CompassHeadingData, CompassHeadingHandler, CompassHeading
export time, localtime, gmtime, strftime, clock_is_24h_style
export makeGRect, makeGPoint, makeGSize, makeUuid
export GColorClear, GColorBlack, GColorWhite, makeGColor8
export GDrawCommandImage, GDrawCommandSequence, GDrawCommandFrame
export GDrawCommandType, GDrawCommand, GDrawCommandList

# ============================================================================
# Core Framework
# ============================================================================

import nebble/core/app
export app
export app.pebbleApp

import nebble/core/window
export window

import nebble/core/layer
export layer

import nebble/core/clicks
export clicks

import nebble/core/animation
export animation

# ============================================================================
# UI Components
# ============================================================================

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

# ============================================================================
# Graphics
# ============================================================================

import nebble/graphics/graphics
export graphics

import nebble/graphics/bitmap_sequence
export bitmap_sequence

import nebble/graphics/rot_bitmap_layer
export rot_bitmap_layer

import nebble/graphics/draw_command
export draw_command

import nebble/graphics/draw_command_detail
export draw_command_detail

import nebble/graphics/gpath
export gpath

import nebble/graphics/text_attributes
export text_attributes

# ============================================================================
# System Services
# ============================================================================

import nebble/system/system
export system

import nebble/system/time
export time

# ============================================================================
# Health
# ============================================================================

import nebble/health/health
export health

# ============================================================================
# Communication
# ============================================================================

import nebble/comms/message
export message

import nebble/comms/app_sync
export app_sync

import nebble/comms/app_comm
export app_comm

import nebble/comms/data_logging
export data_logging

import nebble/comms/worker
export worker

import nebble/comms/wakeup
export wakeup

# ============================================================================
# Input
# ============================================================================

import nebble/input/accel
export accel

import nebble/input/dictation
export dictation

import nebble/input/unobstructed_area
export unobstructed_area

# ============================================================================
# Storage
# ============================================================================

import nebble/storage/storage
export storage

import nebble/storage/resources
export resources

import nebble/storage/fonts
export fonts

# ============================================================================
# Advanced
# ============================================================================

import nebble/advanced/math
export math

import nebble/advanced/uuid
export uuid

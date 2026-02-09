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
export BitmapLayer, GBitmap, GBitmapSequence
export RotBitmapLayer
export ActionBarLayer
export ScrollLayer
export ContentIndicator, ContentIndicatorDirection
export GTextAttributes
export MenuLayer, SimpleMenuLayer, MenuIndex
export StatusBarLayer
export TimeUnits, TickHandler, tm, time_t
export HealthMetric, HealthValue
export AccelData, AccelRawData
export CompassHeadingData
export BatteryChargeState
export BluetoothConnectionHandler
export time, localtime, gmtime, strftime, clock_is_24h_style
export makeGRect, makeGPoint, makeGSize, makeUuid
export GColorClear, GColorBlack, GColorWhite, makeGColor8

# Re-export all high-level modules
import nebble/app
export app
export app.pebbleApp  # Export the macro explicitly for easier use

import nebble/window
export window

import nebble/layer
export layer

import nebble/text_layer
export text_layer

import nebble/text_attributes
export text_attributes

import nebble/clicks
export clicks

import nebble/graphics
export graphics

import nebble/gpath
export gpath

import nebble/draw_command
export draw_command

import nebble/timer
export timer

import nebble/tick
export tick

import nebble/bitmap_layer
export bitmap_layer

import nebble/bitmap_sequence
export bitmap_sequence

import nebble/rot_bitmap_layer
export rot_bitmap_layer

import nebble/menu_layer
export menu_layer

import nebble/simple_menu_layer
export simple_menu_layer

import nebble/number_window
export number_window

import nebble/scroll_layer
export scroll_layer

import nebble/content_indicator
export content_indicator

import nebble/action_bar
export action_bar

import nebble/status_bar
export status_bar

import nebble/fonts
export fonts

import nebble/resources
export resources

import nebble/math
export math

import nebble/system
export system

import nebble/uuid
export uuid

import nebble/unobstructed_area
export unobstructed_area

import nebble/action_menu
export action_menu

# Batch 3: Animation
import nebble/animation
export animation

# Batch 4: System Services
import nebble/battery
export battery

import nebble/bluetooth
export bluetooth

import nebble/vibes
export vibes

import nebble/light
export light

import nebble/watch_info
export watch_info

import nebble/accel
export accel

import nebble/compass
export compass

import nebble/health
export health

# Batch 5: Communication & Storage
import nebble/message
export message

import nebble/app_sync
export app_sync

import nebble/app_comm
export app_comm

import nebble/storage
export storage

import nebble/data_logging
export data_logging

import nebble/worker
export worker

# Batch 6: Advanced
import nebble/wakeup
export wakeup

import nebble/app_glance
export app_glance

import nebble/dictation
export dictation

import nebble/smartstrap
export smartstrap

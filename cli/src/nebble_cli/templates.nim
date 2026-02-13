## Project templates for Nebble

import std/strutils

proc getAppTemplate*(name: string): string =
  ## Get the hello world app template
  result = "## " & name & """ - Pebble app written in Nim
##
## This is a basic Pebble app that demonstrates the Nebble API.
## Uses the nebbleWatchface macro for declarative UI and interaction.

import nebble

# Forward declarations of handlers used in DSL
proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}
proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}
proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}

var
  clickCount = 0
  textBuffer: array[32, char] # Buffer for dynamic text

# Declarative UI and interaction
nebbleWatchface:
  textLayer:
    id = myTextLayer
    frame = (0, 60, 144, 40)
    text = "Press SELECT"
    alignment = GTextAlignmentCenter
    
  clicks:
    BUTTON_ID_SELECT = selectClickHandler
    BUTTON_ID_UP = upClickHandler
    BUTTON_ID_DOWN = downClickHandler

# Event Handlers
proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle SELECT button clicks
  inc clickCount
  myTextLayer.staticText(textBuffer, "Clicks: " & $clickCount)

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle UP button clicks
  myTextLayer.text = "UP pressed!"

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle DOWN button clicks
  myTextLayer.text = "DOWN pressed!"
"""

proc getWatchfaceTemplate*(name: string): string =
  ## Get the watchface template
  result = "## " & name & """ - Pebble watchface written in Nim
##
## This is a basic watchface that demonstrates the Nebble API.
## Uses the nebbleWatchface DSL for minimal boilerplate.

import nebble

# Forward declaration of handlers used in DSL
proc updateTime(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.}

var
  timeBuffer: array[16, char]
  dateBuffer: array[32, char]

# Declarative Watchface
nebbleWatchface:

  window:
    backgroundColor = GColorBlack

  textLayer:
    id = timeLayer
    frame = (0, 50, 144, 60)
    text = "00:00"
    font = FONT_KEY_BITHAM_42_BOLD
    color = GColorWhite
    alignment = GTextAlignmentCenter
    
  textLayer:
    id = dateLayer
    frame = (0, 115, 144, 30)
    text = "Jan 1"
    font = FONT_KEY_GOTHIC_24
    color = GColorWhite
    alignment = GTextAlignmentCenter

  tickTimer:
    unit = MINUTE_UNIT
    handler = updateTime

# Event Handlers
proc updateTime(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  ## Update the time display
  let localTime = tickTime
  
  # Update time
  if clockIs24hStyle():
    discard strftime(addr timeBuffer[0], 16, "%H:%M", localTime)
  else:
    discard strftime(addr timeBuffer[0], 16, "%I:%M", localTime)
  
  timeLayer.text = cast[cstring](addr timeBuffer[0])
  
  # Update date
  discard strftime(addr dateBuffer[0], 32, "%a, %b %e", localTime)
  dateLayer.text = cast[cstring](addr dateBuffer[0])
"""

proc getNimCfg*(): string =
  ## Get nim.cfg for cross-compilation
  result = """# Nim cross-compilation configuration for Pebble
# These flags enable bare-metal ARM compilation

# Target configuration
--os:any
--cpu:arm
--mm:arc

# Memory management
-d:useMalloc
--noMain

# Compilation mode
--compileOnly
-d:noSignalHandler
--threads:off
-d:danger

# Disable checks for minimal binary size
-d:noSignalHandler

# Nimcache directory
--nimcache:nimcache

# Path to nebble library (adjust based on your project location)
# This assumes nebble is installed via nimble or available in parent directories
# --path:"path/to/nebble/src"
"""

proc getWscript*(): string =
  ## Get wscript for Pebble build system integration
  result = """#
# This file is the default set of rules to compile a Pebble project.
#
# Feel free to customize this to your needs.
#

import os.path
try:
    from sh import CommandNotFound, jshint, cat, ErrorReturnCode_1
    hint = jshint
except (ImportError, CommandNotFound):
    hint = None

top = '.'
out = 'build'

def options(ctx):
    ctx.load('pebble_sdk')

def configure(ctx):
    ctx.load('pebble_sdk')

def build(ctx):
    ctx.load('pebble_sdk')

    build_worker = os.path.exists('worker_src')
    binaries = []

    for p in ctx.env.TARGET_PLATFORMS:
        ctx.set_env(ctx.all_envs[p])
        ctx.set_group(ctx.env.PLATFORM_NAME)
        
        # Suppress warnings from Nim-generated C code
        # Must be done per-platform after set_env
        if '-Werror' in ctx.env.CFLAGS:
            ctx.env.CFLAGS.remove('-Werror')
        ctx.env.CFLAGS.append('-w')
        
        app_elf='{}/pebble-app.elf'.format(ctx.env.BUILD_DIR)
        ctx.pbl_program(source=ctx.path.ant_glob('src/c/**/*.c'),
        target=app_elf)

        if build_worker:
            worker_elf='{}/pebble-worker.elf'.format(ctx.env.BUILD_DIR)
            binaries.append({'platform': p, 'app_elf': app_elf, 'worker_elf': worker_elf})
            ctx.pbl_worker(source=ctx.path.ant_glob('worker_src/**/*.c'),
            target=worker_elf)
        else:
            binaries.append({'platform': p, 'app_elf': app_elf})

    ctx.set_group('bundle')
    ctx.pbl_bundle(binaries=binaries, js=ctx.path.ant_glob('src/pkjs/**/*.js'), js_pebble=ctx.path.ant_glob('src/pkjs/**/*.json'))
"""

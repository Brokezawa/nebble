## Project templates for Nebble

import std/strutils

proc getAppTemplate*(name: string): string =
  ## Get the hello world app template
  result = "## " & name & """ - Pebble app written in Nim
##
## This is a basic Pebble app that demonstrates the Nebble API.

import nebble

var
  window: ptr Window
  textLayer: ptr TextLayer
  clickCount = 0

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle SELECT button clicks
  inc clickCount
  textLayer.text = "Clicks: " & $clickCount

proc upClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle UP button clicks
  textLayer.text = "UP pressed!"

proc downClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  ## Handle DOWN button clicks
  textLayer.text = "DOWN pressed!"

proc clickConfigProvider(context: pointer) {.cdecl.} =
  ## Configure click handlers
  onClick(BUTTON_ID_SELECT, selectClickHandler)
  onClick(BUTTON_ID_UP, upClickHandler)
  onClick(BUTTON_ID_DOWN, downClickHandler)

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create text layer
  textLayer = newTextLayer(makeGRect(0, 60, bounds.size.w, 40))
  textLayer.text = "Press SELECT"
  textLayer.textAlignment = GTextAlignmentCenter
  
  # Add to window
  rootLayer.addChild(textLayer.getLayer())

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  textLayer.destroy()

proc init() =
  ## Initialize the app
  window = newWindow()
  window.clickConfig = clickConfigProvider
  window.setHandlers(
    load = windowLoad,
    unload = windowUnload
  )
  window.push(animated = true)

proc deinit() =
  ## Deinitialize the app
  window.destroy()

proc main(): cint {.exportc, cdecl.} =
  ## App entry point
  init()
  eventLoop()
  deinit()
  return 0
"""

proc getWatchfaceTemplate*(name: string): string =
  ## Get the watchface template
  result = "## " & name & """ - Pebble watchface written in Nim
##
## This is a basic watchface that demonstrates the Nebble API.

import nebble

var
  window: ptr Window
  timeLayer: ptr TextLayer
  dateLayer: ptr TextLayer
  timeBuffer: array[16, char]  # Must be module-scope to persist
  dateBuffer: array[32, char]  # Must be module-scope to persist

proc updateTime() =
  ## Update the time display
  var tickTime: time_t
  discard time(addr tickTime)
  
  var localTime = localtime(addr tickTime)
  
  # Update time
  if clock_is_24h_style():
    discard strftime(addr timeBuffer[0], 16, "%H:%M", localTime)
  else:
    discard strftime(addr timeBuffer[0], 16, "%I:%M", localTime)
  
  timeLayer.text = cast[cstring](addr timeBuffer[0])
  
  # Update date
  discard strftime(addr dateBuffer[0], 32, "%a, %b %e", localTime)
  dateLayer.text = cast[cstring](addr dateBuffer[0])

proc tickHandler(tickTime: ptr tm; unitsChanged: TimeUnits) {.cdecl.} =
  ## Handle tick timer events
  updateTime()

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Window load handler - create UI
  let rootLayer = win.rootLayer
  let bounds = rootLayer.bounds
  
  # Create time layer (large)
  timeLayer = newTextLayer(makeGRect(0, 50, bounds.size.w, 60))
  timeLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  timeLayer.font = getSystemFont("RESOURCE_ID_BITHAM_42_BOLD")
  
  # Create date layer (small)
  dateLayer = newTextLayer(makeGRect(0, 115, bounds.size.w, 30))
  dateLayer.textAlignment = GTextAlignment.GTextAlignmentCenter
  dateLayer.font = getSystemFont("RESOURCE_ID_GOTHIC_24")
  
  # Add to window
  rootLayer.addChild(timeLayer.getLayer())
  rootLayer.addChild(dateLayer.getLayer())
  
  # Initial time update (called here after layers are created)
  updateTime()

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Window unload handler - destroy UI
  timeLayer.destroy()
  dateLayer.destroy()

proc init() =
  ## Initialize the watchface
  window = newWindow()
  window.setHandlers(
    load = windowLoad,
    unload = windowUnload
  )
  window.push(animated = true)
  
  # Subscribe to tick timer (update every minute)
  tick.subscribe(TimeUnits.MINUTE_UNIT, tickHandler)

proc deinit() =
  ## Deinitialize the watchface
  window.destroy()

proc main(): cint {.exportc, cdecl.} =
  ## Watchface entry point
  init()
  eventLoop()
  deinit()
  return 0
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

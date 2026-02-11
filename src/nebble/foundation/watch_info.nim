## High-level Nim wrapper for Pebble Watch Info API.
##
## Provides information about the watch hardware and firmware.

import nebble/ffi

export ffi.WatchInfoModel, ffi.WatchInfoColor, ffi.WatchInfoVersion

# ============================================================================
# Watch Model
# ============================================================================

proc model*(): WatchInfoModel {.inline.} =
  ## Get the watch model (e.g. WatchModelBasalt, WatchModelChalk).
  ## Equivalent to C function `watch_info_get_model()`.
  result = ffi.watch_info_get_model()

proc color*(): WatchInfoColor {.inline.} =
  ## Get the watch case color.
  ## Equivalent to C function `watch_info_get_color()`.
  result = ffi.watch_info_get_color()

proc firmwareVersion*(): tuple[major: uint8; minor: uint8; patch: uint8] {.inline.} =
  ## Get the firmware version as a tuple (major, minor, patch).
  ## Equivalent to C function `watch_info_get_firmware_version()`.
  let version = ffi.watch_info_get_firmware_version()
  result = (version.major, version.minor, version.patch)

# ============================================================================
# Model Detection Helpers
# ============================================================================

proc isAplite*(): bool {.inline.} =
  ## Check if running on Aplite (Pebble Classic/Steel).
  let m = model()
  result = m == WATCH_INFO_MODEL_PEBBLE_ORIGINAL or m == WATCH_INFO_MODEL_PEBBLE_STEEL

proc isBasalt*(): bool {.inline.} =
  ## Check if running on Basalt (Pebble Time/Time Steel).
  result = model() == WATCH_INFO_MODEL_PEBBLE_TIME or model() == WATCH_INFO_MODEL_PEBBLE_TIME_STEEL

proc isChalk*(): bool {.inline.} =
  ## Check if running on Chalk (Pebble Time Round).
  let m = model()
  result = m == WATCH_INFO_MODEL_PEBBLE_TIME_ROUND_14 or m == WATCH_INFO_MODEL_PEBBLE_TIME_ROUND_20

proc isDiorite*(): bool {.inline.} =
  ## Check if running on Diorite (Pebble 2).  
  let m = model()
  result = m == WATCH_INFO_MODEL_PEBBLE_2_HR or m == WATCH_INFO_MODEL_PEBBLE_2_SE

proc isEmery*(): bool {.inline.} =
  ## Check if running on Emery (Pebble Time 2).
  result = model() == WATCH_INFO_MODEL_PEBBLE_TIME_2

proc isColorPlatform*(): bool {.inline.} =
  ## Check if running on a color-capable platform.
  result = isBasalt() or isChalk() or isEmery()

## High-level Nim wrapper for Pebble Watch Info API.
##
## Provides information about the watch model, firmware version, and color.

import nebble/ffi

export ffi.WatchInfoModel, ffi.WatchInfoVersion, ffi.WatchInfoColor

# ============================================================================
# Watch Information
# ============================================================================

proc model*(): WatchInfoModel {.inline.} =
  ## Get the watch model (WATCH_INFO_MODEL_PEBBLE_ORIGINAL, etc.).
  ## Equivalent to C function `watch_info_get_model()`.
  ffi.watch_info_get_model()

proc firmwareVersion*(): WatchInfoVersion {.inline.} =
  ## Get the firmware version structure.
  ## Equivalent to C function `watch_info_get_firmware_version()`.
  ffi.watch_info_get_firmware_version()

proc color*(): WatchInfoColor {.inline.} =
  ## Get the watch color (e.g., WATCH_INFO_COLOR_BLACK, WATCH_INFO_COLOR_WHITE).
  ## Equivalent to C function `watch_info_get_color()`.
  ffi.watch_info_get_color()

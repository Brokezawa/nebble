## High-level Nim wrapper for Pebble Fonts API.
##
## Provides access to system fonts and custom font loading/unloading.

import nebble/ffi
export GFont, ResHandle

# ============================================================================
# System Fonts
# ============================================================================

proc getSystemFont*(fontKey: cstring): GFont {.inline.} =
  ## Get a system font by its key constant.
  ## Equivalent to C function `ffi.fonts_get_system_font(font_key)`.
  ## 
  ## Common font keys (re-exported from FFI):
  ## - FONT_KEY_GOTHIC_14
  ## - FONT_KEY_GOTHIC_18
  ## - FONT_KEY_GOTHIC_18_BOLD
  ## - FONT_KEY_GOTHIC_24
  ## - FONT_KEY_GOTHIC_24_BOLD
  ## - FONT_KEY_GOTHIC_28
  ## - FONT_KEY_GOTHIC_28_BOLD
  ## - FONT_KEY_BITHAM_30_BLACK
  ## - FONT_KEY_BITHAM_42_BOLD
  ## - FONT_KEY_BITHAM_42_LIGHT
  ## - FONT_KEY_ROBOTO_CONDENSED_21
  ## - FONT_KEY_ROBOTO_BOLD_SUBSET_49
  ## - FONT_KEY_DROID_SERIALIZE_28_BOLD
  ffi.fonts_get_system_font(fontKey)

# ============================================================================
# Custom Fonts
# ============================================================================

proc loadCustomFont*(handle: ResHandle): GFont {.inline.} =
  ## Load a custom font from a resource handle.
  ## Equivalent to C function `ffi.fonts_load_custom_font(handle)`.
  ffi.fonts_load_custom_font(handle)

proc unloadCustomFont*(font: GFont) {.inline.} =
  ## Unload a custom font and free its memory.
  ## Equivalent to C function `ffi.fonts_unload_custom_font(font)`.
  ffi.fonts_unload_custom_font(font)

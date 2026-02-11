## Reference-Counted GFont Handle
##
## Provides reference counting for custom font resources using Nim's `ref` type
## with ARC memory management. System fonts don't need reference counting,
## but custom loaded fonts do.
##
## **Key Features:**
## - Reference counting for custom fonts via ARC
## - System font optimization (no destruction needed)
## - Automatic cleanup when last reference goes out of scope
##
## **Usage Example:**
##   ```nim
##   import nebble/graphics/font_ref
##   
##   var customFont: GFontRef
##   
##   proc windowLoad(win: ptr Window) {.cdecl.} =
##     # Load custom font - reference count = 1
##     customFont = loadFontRef(RESOURCE_ID_CUSTOM_FONT)
##     
##     textLayer.font = customFont.font
##   
##   proc windowUnload(win: ptr Window) {.cdecl.} =
##     # Clear reference - ARC destroys font when count reaches 0
##     customFont = nil
##   ```

import nebble/ffi
import nebble/graphics/fonts

# ============================================================================
# Internal Object Type (must be defined before ref type and hooks)
# ============================================================================

type GFontRefObj = object
  ## Internal font reference object.
  font: GFont
  isSystemFont: bool  ## true if system font (don't unload)
  resourceId: uint32  ## Resource ID for custom fonts (0 for system)

# ============================================================================
# ARC Destructor (must be defined immediately after object type)
# ============================================================================

proc `=destroy`(obj: var GFontRefObj) =
  ## Unload font if it's a custom loaded font.
  ##
  ## System fonts should never be unloaded - they're managed by the system.
  if obj.font != nil and not obj.isSystemFont:
    fonts_unload_custom_font(obj.font)
  obj.font = nil

# ============================================================================
# Reference Type (defined after hooks for proper binding)
# ============================================================================

type GFontRef* = ref GFontRefObj
  ## Reference-counted font wrapper.
  ##
  ## Use this type for custom fonts loaded from resources. System fonts
  ## (obtained via fonts_get_system_font) should NOT use this wrapper
  ## as they are managed by the system.
  ##
  ## **Example:**
  ##   var font: GFontRef = loadFontRef(RESOURCE_ID_CUSTOM_FONT)
  ##   # font destroyed automatically when last reference cleared

# ============================================================================
# Constructors
# ============================================================================

proc loadFontRef*(resourceId: uint32): GFontRef =
  ## Load a custom font from resources with reference counting.
  ##
  ## **Parameters:**
  ## - `resourceId`: The RESOURCE_ID_* constant for the font
  ##
  ## **Example:**
  ##   var myFont = loadFontRef(RESOURCE_ID_FONT_ROBOTO_24)
  ##   textLayer.font = myFont.font
  ##
  ## **Note:** Use `systemFontRef()` for system fonts - they don't need
  ## reference counting and have zero overhead.
  new(result)
  let handle = resource_get_handle(resourceId)
  result.font = fonts_load_custom_font(handle)
  result.isSystemFont = false
  result.resourceId = resourceId

proc systemFontRef*(fontKey: cstring): GFontRef =
  ## Get a system font wrapped in a reference-counted container.
  ##
  ## **Warning:** This creates a wrapper with isSystemFont=true. The font
  ## is NOT actually reference-counted (system fonts are managed by the OS).
  ## This is provided for API consistency but has minimal overhead.
  ##
  ## **Recommendation:** For system fonts, prefer using the raw GFont
  ## directly: `textLayer.font = fonts_get_system_font(FONT_KEY_GOTHIC_24)`
  new(result)
  result.font = fonts_get_system_font(fontKey)
  result.isSystemFont = true
  result.resourceId = 0

# ============================================================================
# Convenience Constructors for Common System Fonts
# ============================================================================

proc fontRefGothic14*: GFontRef {.inline.} =
  ## Get GOTHIC_14 system font (reference-counted wrapper).
  systemFontRef(FONT_KEY_GOTHIC_14)

proc fontRefGothic18*: GFontRef {.inline.} =
  ## Get GOTHIC_18 system font (reference-counted wrapper).
  systemFontRef(FONT_KEY_GOTHIC_18)

proc fontRefGothic24*: GFontRef {.inline.} =
  ## Get GOTHIC_24 system font (reference-counted wrapper).
  systemFontRef(FONT_KEY_GOTHIC_24)

proc fontRefGothic28*: GFontRef {.inline.} =
  ## Get GOTHIC_28 system font (reference-counted wrapper).
  systemFontRef(FONT_KEY_GOTHIC_28)

proc fontRefGothicBold14*: GFontRef {.inline.} =
  ## Get GOTHIC_14_BOLD system font (reference-counted wrapper).
  when defined(pebbleAplite) or defined(pebbleDiorite):
    systemFontRef(FONT_KEY_GOTHIC_14)  # Fallback on BW platforms
  else:
    systemFontRef(FONT_KEY_GOTHIC_14_BOLD)

proc fontRefBitham42Bold*: GFontRef {.inline.} =
  ## Get BITHAM_42_BOLD system font (reference-counted wrapper).
  when defined(pebbleAplite) or defined(pebbleDiorite):
    systemFontRef(FONT_KEY_BITHAM_42_BOLD)
  else:
    systemFontRef(FONT_KEY_BITHAM_42_BOLD)

# ============================================================================
# Property Accessors
# ============================================================================

proc font*(fontRef: GFontRef): GFont {.inline.} =
  ## Get the raw font handle for use with layers.
  ##
  ## **Example:**
  ##   textLayer.font = myFontRef.font
  if fontRef != nil:
    fontRef.font
  else:
    nil

proc resourceId*(fontRef: GFontRef): uint32 {.inline.} =
  ## Get the resource ID (0 for system fonts).
  if fontRef != nil:
    fontRef.resourceId
  else:
    0

# ============================================================================
# Information Queries
# ============================================================================

proc isValid*(fontRef: GFontRef): bool {.inline.} =
  ## Check if reference is valid (not nil and has font).
  fontRef != nil and fontRef.font != nil

proc isSystemFont*(fontRef: GFontRef): bool {.inline.} =
  ## Check if this is a system font (not reference-counted).
  if fontRef != nil:
    fontRef.isSystemFont
  else:
    false

proc isCustomFont*(fontRef: GFontRef): bool {.inline.} =
  ## Check if this is a custom loaded font (reference-counted).
  if fontRef != nil:
    not fontRef.isSystemFont
  else:
    false

# ============================================================================
# Font Capabilities
# ============================================================================

proc hasExternalFonts*(): bool {.inline.} =
  ## Check if platform supports external (custom) fonts.
  fonts_get_system_font(FONT_KEY_FONT_FALLBACK) != nil

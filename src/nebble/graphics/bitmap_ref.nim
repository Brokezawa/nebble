## Reference-Counted GBitmap Handle
##
## Provides reference counting for bitmap resources using Nim's `ref` type
## with ARC memory management. This allows bitmaps to be safely shared
## between multiple layers or objects.
##
## **Key Features:**
## - Reference counting via ARC (automatic)
## - Support for sub-bitmaps (non-owning views)
## - Palette management for palettized formats
## - System resource bitmaps (no destruction needed)
##
## **Usage Example:**
##   ```nim
##   import nebble/graphics/bitmap_ref
##   
##   var backgroundBitmap: GBitmapRef
##   
##   proc windowLoad(win: ptr Window) {.cdecl.} =
##     # Load bitmap - reference count = 1
##     backgroundBitmap = newBitmapRef(RESOURCE_ID_BACKGROUND)
##     
##     # Create sub-bitmap (shares data, no copy)
##     var subBitmap = createSubBitmapRef(backgroundBitmap, 
##                                       makeGRect(0, 0, 50, 50))
##     # subBitmap shares data with backgroundBitmap
##     
##     # Use in layer...
##     bitmapLayer.bitmap = backgroundBitmap.bitmap
##   
##   proc windowUnload(win: ptr Window) {.cdecl.} =
##     # Just clear the reference - ARC handles destruction
##     backgroundBitmap = nil
##   ```

import nebble/ffi
import nebble/ffi/managed
import nebble/graphics/graphics

# ============================================================================
# Reference-Counted Bitmap Object
# ============================================================================

# ============================================================================
# Internal Object Type (must be defined before ref type and hooks)
# ============================================================================

type GBitmapRefObj = object
  ## Internal bitmap reference object.
  bitmap: ptr GBitmap
  isSubBitmap: bool        ## true if this is a sub-bitmap (doesn't own data)
  isSystemResource: bool   ## true if loaded from system resources
  parent: ref GBitmapRefObj       ## strong reference to parent for sub-bitmaps

# ============================================================================
# ARC Destructor (must be defined immediately after object type)
# ============================================================================

proc `=destroy`(obj: var GBitmapRefObj) =
  ## Destroy bitmap if we own it.
  ##
  ## Sub-bitmaps don't own their data - destroying them doesn't affect
  ## the parent bitmap. System resource bitmaps shouldn't be destroyed.
  # If this object owns the underlying bitmap memory, destroy it.
  # Sub-bitmaps don't own their data and system resources shouldn't be destroyed.
  if obj.bitmap != nil and not obj.isSubBitmap and not obj.isSystemResource:
    gbitmap_destroy(obj.bitmap)
  # Release parent reference (if any) so ARC can clean up parent when appropriate.
  obj.parent = nil
  obj.bitmap = nil

# ============================================================================
# Reference Type (defined after hooks for proper binding)
# ============================================================================

type GBitmapRef* = ref GBitmapRefObj
  ## Reference-counted bitmap wrapper.
  ##
  ## Use this type for bitmaps that need to be shared between multiple
  ## objects. ARC automatically manages the reference count and destroys
  ## the bitmap when the last reference goes out of scope.
  ##
  ## **Example:**
  ##   var bitmap: GBitmapRef = newBitmapRef(RESOURCE_ID_IMAGE)
  ##   # bitmap destroyed automatically when last reference cleared

# ============================================================================
# Constructors
# ============================================================================

proc newBitmapRef*(resourceId: uint32): GBitmapRef =
  ## Create a reference-counted bitmap from a resource.
  ##
  ## **Parameters:**
  ## - `resourceId`: The RESOURCE_ID_* constant
  ##
  ## **Example:**
  ##   var bitmap = newBitmapRef(RESOURCE_ID_MY_IMAGE)
  new(result)
  result.bitmap = gbitmap_create_with_resource(resourceId)
  result.isSubBitmap = false
  result.isSystemResource = true  # Resource-based, don't destroy
  result.parent = nil

proc newBitmapRef*(data: ptr uint8): GBitmapRef =
  ## Create a reference-counted bitmap from raw data (PBI format).
  new(result)
  result.bitmap = gbitmap_create_with_data(data)
  result.isSubBitmap = false
  result.isSystemResource = false
  result.parent = nil

proc newBitmapRef*(pngData: ptr uint8, len: int): GBitmapRef =
  ## Create a reference-counted bitmap from raw PNG data.
  ## This avoids Nim heap allocations if the data is in a static buffer.
  new(result)
  when declared(gbitmap_create_from_png_data):
    result.bitmap = gbitmap_create_from_png_data(pngData, len.csize_t)
  else:
    result.bitmap = nil
  result.isSubBitmap = false
  result.isSystemResource = false
  result.parent = nil

proc newBitmapRef*(pngData: seq[byte]): GBitmapRef =
  ## Create a reference-counted bitmap from PNG data.
  ## **Note:** This will allocate on the Nim heap due to the `seq[byte]` parameter.
  ## Use the `ptr uint8` overload for zero-heap operation with static data.
  if pngData.len == 0: return nil
  result = newBitmapRef(unsafeAddr pngData[0], pngData.len)

# ============================================================================
# Sub-Bitmap Constructors
# ============================================================================

proc createSubBitmapRef*(parent: GBitmapRef, subRect: GRect): GBitmapRef =
  ## Create a sub-bitmap that shares data with parent.
  ##
  ## The sub-bitmap provides a view into a portion of the parent bitmap.
  ## It does NOT own the data - the parent must outlive the sub-bitmap.
  ##
  ## **Parameters:**
  ## - `parent`: The parent bitmap (must remain alive)
  ## - `subRect`: The rectangle within the parent to use
  ##
  ## **Example:**
  ##   var spriteSheet = newBitmapRef(RESOURCE_ID_SPRITES)
  ##   var playerSprite = createSubBitmapRef(spriteSheet, 
  ##                                         makeGRect(0, 0, 32, 32))
  # Ensure parent is valid
  if parent == nil or parent.bitmap == nil:
    return nil

  # Create sub-bitmap that references parent's data
  new(result)
  result.bitmap = gbitmap_create_as_sub_bitmap(parent.bitmap, subRect)
  result.isSubBitmap = true
  result.isSystemResource = false
  # Keep a strong reference to parent to prevent parent being destroyed
  result.parent = parent

proc createSubBitmapRef*(parent: GBitmapRef, x, y, w, h: int16): GBitmapRef =
  ## Create sub-bitmap with individual coordinates.
  createSubBitmapRef(parent, makeGRect(x, y, w, h))

# ============================================================================
# Blank Bitmap Constructors
# ============================================================================

proc newBlankBitmapRef*(size: GSize, format: GBitmapFormat): GBitmapRef =
  ## Create a blank bitmap for offscreen rendering.
  ##
  ## **Parameters:**
  ## - `size`: Width and height of the bitmap
  ## - `format`: Pixel format (e.g., GBitmapFormat1Bit, GBitmapFormat8Bit)
  new(result)
  result.bitmap = gbitmap_create_blank(size, format)
  result.isSubBitmap = false
  result.isSystemResource = false
  result.parent = nil

proc newBlankBitmapRef*(size: GSize, format: GBitmapFormat,
                       palette: ptr GColor, freeOnDestroy: bool): GBitmapRef =
  ## Create blank bitmap with custom palette.
  ##
  ## **Parameters:**
  ## - `palette`: Pointer to palette data
  ## - `freeOnDestroy`: If true, palette is freed with bitmap
  new(result)
  when declared(gbitmap_create_blank_with_palette):
    result.bitmap = gbitmap_create_blank_with_palette(size, format, 
                                                      palette, freeOnDestroy)
  else:
    result.bitmap = nil
  result.isSubBitmap = false
  result.isSystemResource = false
  result.parent = nil

# ============================================================================
# Property Accessors
# ============================================================================

proc bitmap*(bitmapRef: GBitmapRef): ptr GBitmap {.inline.} =
  ## Get the raw bitmap pointer for use with layers.
  ##
  ## **Example:**
  ##   bitmapLayer.bitmap = myBitmapRef.bitmap
  if bitmapRef != nil:
    bitmapRef.bitmap
  else:
    nil

proc size*(bitmapRef: GBitmapRef): GSize {.inline.} =
  ## Get bitmap dimensions.
  if bitmapRef != nil and bitmapRef.bitmap != nil:
    gbitmap_get_bounds(bitmapRef.bitmap).size
  else:
    makeGSize(0, 0)

proc bounds*(bitmapRef: GBitmapRef): GRect {.inline.} =
  ## Get bitmap bounds.
  if bitmapRef != nil and bitmapRef.bitmap != nil:
    gbitmap_get_bounds(bitmapRef.bitmap)
  else:
    makeGRect(0, 0, 0, 0)

proc format*(bitmapRef: GBitmapRef): GBitmapFormat {.inline.} =
  ## Get bitmap pixel format.
  if bitmapRef != nil and bitmapRef.bitmap != nil:
    gbitmap_get_format(bitmapRef.bitmap)
  else:
    GBitmapFormat1Bit  # Default/fallback

proc bytesPerRow*(bitmapRef: GBitmapRef): uint16 {.inline.} =
  ## Get bytes per row.
  if bitmapRef != nil and bitmapRef.bitmap != nil:
    gbitmap_get_bytes_per_row(bitmapRef.bitmap)
  else:
    0

proc palette*(bitmapRef: GBitmapRef): ptr GColor {.inline.} =
  ## Get palette pointer (for palettized formats).
  if bitmapRef != nil and bitmapRef.bitmap != nil:
    gbitmap_get_palette(bitmapRef.bitmap)
  else:
    nil

proc paletteSizeForFormat*(format: GBitmapFormat): int {.inline.} =
  ## Get expected palette size (number of colors) for a bitmap format.
  ## Returns 0 for non-palettized formats.
  case format
  of GBitmapFormat1BitPalette: result = 2
  of GBitmapFormat2BitPalette: result = 4
  of GBitmapFormat4BitPalette: result = 16
  of GBitmapFormat8Bit, GBitmapFormat8BitCircular: result = 0  # Direct color, no palette
  of GBitmapFormat1Bit: result = 0  # Monochrome, no palette
  else: result = 0

proc `palette=`*(bitmapRef: GBitmapRef, palette: ptr GColor) {.inline.} =
  ## Set palette for palettized bitmaps.
  ##
  ## **Palette Requirements:**
  ## - 1BitPalette: 2 colors (black and white)
  ## - 2BitPalette: 4 colors
  ## - 4BitPalette: 16 colors
  ## - 8Bit: Direct color, no palette (will trigger debug warning)
  ##
  ## **⚠️ Safety:** The palette pointer must remain valid for the lifetime
  ## of the bitmap. The palette is NOT copied. Use static arrays or ensure
  ## the palette outlives the bitmap.
  if bitmapRef != nil and bitmapRef.bitmap != nil:
    when ManagedDebug or ManagedStrict:
      let format = gbitmap_get_format(bitmapRef.bitmap)
      let expectedSize = paletteSizeForFormat(format)
      if expectedSize > 0 and palette == nil:
        when ManagedStrict:
          raise newException(AssertionDefect, "Palette required for this format")
      elif expectedSize == 0:
        when ManagedStrict:
          raise newException(AssertionDefect, "Palette not expected for this format")
    # By default do not free the palette on destroy; user may manage lifetime
    gbitmap_set_palette(bitmapRef.bitmap, palette, false)

# ============================================================================
# Data Access
# ============================================================================

proc data*(bitmapRef: GBitmapRef): ptr uint8 {.inline.} =
  ## Get pointer to raw pixel data.
  if bitmapRef != nil and bitmapRef.bitmap != nil:
    gbitmap_get_data(bitmapRef.bitmap)
  else:
    nil

proc `data=`*(bitmapRef: GBitmapRef, data: ptr uint8, format: GBitmapFormat, rowSizeBytes: uint16, freeOnDestroy: bool = false) {.inline.} =
  ## Set raw pixel data pointer.
  if bitmapRef != nil and bitmapRef.bitmap != nil:
    gbitmap_set_data(bitmapRef.bitmap, data, format, rowSizeBytes, freeOnDestroy)

# ============================================================================
# Information Queries
# ============================================================================

proc isValid*(bitmapRef: GBitmapRef): bool {.inline.} =
  ## Check if reference is valid (not nil and has bitmap).
  bitmapRef != nil and bitmapRef.bitmap != nil

proc isSubBitmap*(bitmapRef: GBitmapRef): bool {.inline.} =
  ## Check if this is a sub-bitmap (shares data).
  if bitmapRef != nil:
    bitmapRef.isSubBitmap
  else:
    false

proc isSystemResource*(bitmapRef: GBitmapRef): bool {.inline.} =
  ## Check if loaded from system resources.
  if bitmapRef != nil:
    bitmapRef.isSystemResource
  else:
    false

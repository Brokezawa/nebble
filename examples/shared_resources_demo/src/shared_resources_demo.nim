## Shared Resources Demo
##
## Demonstrates reference-counted resources (GBitmapRef, GFontRef).
## Shows how ARC manages shared resources automatically.
##
## Key Features:
## - GBitmapRef for shared bitmaps
## - GFontRef for custom fonts
## - Sub-bitmaps that share data
## - Automatic cleanup when last reference goes out of scope

import nebble
import nebble/ffi
import nebble/ui/text_layer_managed
import nebble/ui/bitmap_layer_managed
import nebble/graphics/bitmap_ref
import nebble/graphics/font_ref

# Module-level shared resources
var 
  spriteSheet: GBitmapRef    # Shared sprite sheet
  playerSprite: GBitmapRef   # Sub-bitmap (shares data)
  enemySprite: GBitmapRef    # Sub-bitmap (shares data)
  customFont: GFontRef       # Custom font
  titleLayer: TextLayerHandle
  bitmapLayer1: BitmapLayerHandle
  bitmapLayer2: BitmapLayerHandle

proc windowLoad(win: ptr Window) {.cdecl.} =
  ## Create shared resources
  
  let bounds = win.rootLayer.bounds
  
  # Load a sprite sheet (imagine this is a 64x32 image with multiple sprites)
  # In a real app, you'd have RESOURCE_ID_SPRITE_SHEET
  # For demo, we'll create a blank bitmap
  spriteSheet = newBlankBitmapRef(makeGSize(64, 32), GBitmapFormat8Bit)
  
  # Create sub-bitmaps that share the sprite sheet data
  # These are views into different parts of the sprite sheet
  playerSprite = createSubBitmapRef(spriteSheet, makeGRect(0, 0, 32, 32))
  enemySprite = createSubBitmapRef(spriteSheet, makeGRect(32, 0, 32, 32))
  
  # Note: spriteSheet reference count is now 3 (1 + 2 sub-bitmaps)
  # When we clear all 3, the bitmap will be destroyed
  
  # Create bitmap layers using the shared sprites
  bitmapLayer1 = newBitmapLayerHandle(makeGRect(10, 40, 32, 32))
  bitmapLayer1.bitmap = playerSprite.bitmap
  bitmapLayer1.alignment = GAlignCenter
  win.rootLayer.addChild(bitmapLayer1.getLayer())
  
  bitmapLayer2 = newBitmapLayerHandle(makeGRect(50, 40, 32, 32))
  bitmapLayer2.bitmap = enemySprite.bitmap
  bitmapLayer2.alignment = GAlignCenter
  win.rootLayer.addChild(bitmapLayer2.getLayer())
  
  # Load custom font (if you have one)
  # customFont = loadFontRef(RESOURCE_ID_CUSTOM_FONT)
  # For demo, use system font wrapper
  customFont = fontRefGothic24()
  
  # Create text layer with custom font
  titleLayer = newTextLayerHandle(
    makeGRect(0, 10, bounds.size.w, 24),
    "Shared Resources".cstring,
    customFont.font,
    GTextAlignmentCenter
  )
  titleLayer.textColor = GColorWhite
  win.rootLayer.addChild(titleLayer.getLayer())
  
  # Log resource info
  echo "Sprite sheet size: ", spriteSheet.size.w, "x", spriteSheet.size.h
  echo "Player sprite is sub-bitmap: ", playerSprite.isSubBitmap
  echo "Enemy sprite is sub-bitmap: ", enemySprite.isSubBitmap
  echo "Custom font valid: ", customFont.isValid

proc windowUnload(win: ptr Window) {.cdecl.} =
  ## Demonstrate ARC cleanup of shared resources.
  ##
  ## Order doesn't matter - ARC manages reference counts.
  ## The spriteSheet will only be destroyed when ALL references
  ## (spriteSheet, playerSprite, enemySprite) are cleared.
  
  # Clear layers first (they don't own the bitmaps, just reference them)
  bitmapLayer1 = BitmapLayerHandle(nil)
  bitmapLayer2 = BitmapLayerHandle(nil)
  titleLayer = TextLayerHandle(nil)
  
  # Now clear the bitmap references
  # spriteSheet won't be destroyed until ALL refs are cleared
  playerSprite = nil  # Just this reference - spriteSheet still alive
  echo "Player sprite cleared, sprite sheet still has refs"
  
  enemySprite = nil   # Just this reference - spriteSheet still alive
  echo "Enemy sprite cleared, sprite sheet still has refs"
  
  spriteSheet = nil   # Last reference - NOW spriteSheet is destroyed!
  echo "Sprite sheet cleared - bitmap destroyed!"
  
  # Clear font reference
  customFont = nil
  echo "Font cleared!"

pebbleApp(
  load = windowLoad,
  unload = windowUnload
)

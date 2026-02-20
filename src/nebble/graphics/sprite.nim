## Sprite Sheet and Animation Support
##
## Provides zero-copy sprite management with animation support.
## Two APIs available:
##
## 1. **Managed Handles** (Safe, Recommended)
##    - Automatic memory management via ARC
##    - Owns bitmap resources
##    - No manual cleanup needed
##
## 2. **Raw Pointers** (Advanced)
##    - Zero overhead
##    - User manages lifetimes
##    - For shared bitmap scenarios
##
## Example (Managed):
##   var sheet = newSpriteSheetHandle(RESOURCE_ID_SPRITES, 32, 32)
##   var player = newAnimatedSpriteHandle(sheet, numFrames=8, frameDelay=100)
##   player.update(elapsedMs)
##   player.draw(ctx, pos)
##   # Both destroyed automatically
##
## Example (Raw):
##   var bitmap = newBitmap(RESOURCE_ID_SPRITES)  # User owns
##   var sheet = newSpriteSheet(bitmap, 32, 32)   # Stack value
##   var player = newAnimatedSprite(sheet.addr, 8, 100)  # Stack value
##   # User must ensure bitmap outlives sheet and player

import nebble/ffi
import nebble/graphics/graphics
import nebble/ffi/managed

# ============================================================================
# Types
# ============================================================================

type
  AnimationMode* = enum
    ## Animation playback modes
    amLoop,     ## Loop indefinitely (default)
    amOnce,     ## Play once and stop on last frame
    amPingPong  ## Forward then backward (bounce)

  SpriteSheetData* = object
    ## Internal data for sprite sheet (stored in handle)
    spriteWidth*, spriteHeight*: uint8
    cols*, rows*, totalSprites*: uint8

  AnimatedSpriteState* = object
    ## Animation state (no C allocation, pure Nim)
    currentFrame*, totalFrames*: uint8
    frameDelay*: uint16
    mode*: AnimationMode
    direction*: int8
    isPlaying*: bool

  # Raw types (advanced API)
  SpriteSheet* = object
    ## A bitmap containing multiple sprites arranged in a grid.
    ## Zero-copy: just references the original bitmap.
    ## WARNING: User must ensure bitmap outlives this object
    bitmap*: ptr GBitmap            ## Source bitmap containing all sprites
    spriteWidth*: uint8             ## Width of each sprite in pixels
    spriteHeight*: uint8            ## Height of each sprite in pixels
    cols*: uint8                    ## Number of columns in the grid
    rows*: uint8                    ## Number of rows in the grid
    totalSprites*: uint8            ## Total number of sprites (cols * rows)

  SpriteFrame* = object
    ## A view into a specific sprite within a SpriteSheet.
    ## Zero-copy: just references the sheet and frame index.
    ## WARNING: User must ensure sheet outlives this object
    sheet*: ptr SpriteSheet       ## Parent sprite sheet
    index*: uint8                 ## Frame index (0 to totalSprites-1)

  AnimatedSprite* = object
    ## A sprite with frame-based animation support.
    ## WARNING: User must ensure sheet outlives this object
    sheet*: ptr SpriteSheet       ## Source sprite sheet (pointer allows sharing)
    currentFrame*: uint8          ## Current frame being displayed
    totalFrames*: uint8           ## Total frames in animation
    frameDelay*: uint16           ## Milliseconds per frame
    mode*: AnimationMode          ## Animation mode
    direction*: int8              ## For ping-pong: 1=forward, -1=backward
    isPlaying*: bool              ## True if animation is active

# ============================================================================
# Managed Handle Types
# ============================================================================

type
  SpriteSheetHandle* = object
    ## Managed handle that owns both the GBitmap and SpriteSheet data.
    ## Automatically destroys resources when out of scope.
    pBitmap: ptr GBitmap           ## Owned bitmap
    data: SpriteSheetData          ## Sheet metadata
    ownership: HandleOwnership

  AnimatedSpriteHandle* = object
    ## Managed handle for animated sprites.
    ## References a SpriteSheetHandle (does not own it).
    ## Manages animation state and frame updates.
    pSheetHandle: ptr SpriteSheetHandle  ## Reference to sheet handle (not owned)
    state: AnimatedSpriteState           ## Animation state
    ownership: HandleOwnership

# ============================================================================
# SpriteSheetHandle Lifetime Management
# ============================================================================

proc `=destroy`*(h: var SpriteSheetHandle) =
  ## Destroy the sprite sheet and its bitmap.
  when declared(gbitmap_destroy):
    if h.pBitmap != nil and h.ownership == hoOwned:
      gbitmap_destroy(h.pBitmap)
  h.pBitmap = nil
  h.ownership = hoNone

proc `=wasMoved`*(h: var SpriteSheetHandle) =
  h.pBitmap = nil
  h.ownership = hoNone

proc `=copy`*(dest: var SpriteSheetHandle, src: SpriteSheetHandle) {.error.} =
  ## Copying is disabled to prevent double-free.
  discard

proc `=sink`*(dest: var SpriteSheetHandle, src: SpriteSheetHandle) =
  ## Move semantics - transfers ownership.
  `=destroy`(dest)
  dest.pBitmap = src.pBitmap
  dest.data = src.data
  dest.ownership = src.ownership
  var srcPtr = cast[ptr SpriteSheetHandle](addr src)
  srcPtr.pBitmap = nil
  srcPtr.ownership = hoNone

proc isValid*(h: SpriteSheetHandle): bool {.inline.} = h.pBitmap != nil
proc isNil*(h: SpriteSheetHandle): bool {.inline.} = h.pBitmap == nil

# ============================================================================
# AnimatedSpriteHandle Lifetime Management
# ============================================================================

proc `=destroy`*(h: var AnimatedSpriteHandle) =
  ## Clean up animation handle.
  ## Note: Does NOT destroy the sheet handle (just references it).
  h.pSheetHandle = nil
  h.ownership = hoNone

proc `=wasMoved`*(h: var AnimatedSpriteHandle) =
  h.pSheetHandle = nil
  h.ownership = hoNone

proc `=copy`*(dest: var AnimatedSpriteHandle, src: AnimatedSpriteHandle) {.error.} =
  ## Copying is disabled.
  discard

proc `=sink`*(dest: var AnimatedSpriteHandle, src: AnimatedSpriteHandle) =
  ## Move semantics.
  `=destroy`(dest)
  dest.pSheetHandle = src.pSheetHandle
  dest.state = src.state
  dest.ownership = src.ownership
  var srcPtr = cast[ptr AnimatedSpriteHandle](addr src)
  srcPtr.pSheetHandle = nil
  srcPtr.ownership = hoNone

proc isValid*(h: AnimatedSpriteHandle): bool {.inline.} = h.pSheetHandle != nil
proc isNil*(h: AnimatedSpriteHandle): bool {.inline.} = h.pSheetHandle == nil

# ============================================================================
# Managed Handle Constructors
# ============================================================================

proc newSpriteSheetHandle*(resourceId: uint32, spriteWidth, spriteHeight: uint8): SpriteSheetHandle {.inline.} =
  ## Create a managed sprite sheet from a resource.
  ##
  ## Parameters:
  ##   - resourceId: The resource ID of the bitmap containing all sprites
  ##   - spriteWidth: Width of each sprite in pixels
  ##   - spriteHeight: Height of each sprite in pixels
  ##
  ## The bitmap should have sprites arranged in a grid (left-to-right, top-to-bottom).
  ## The handle owns the bitmap and will destroy it when done.
  when declared(gbitmap_create_with_resource):
    result.pBitmap = gbitmap_create_with_resource(resourceId)
  if result.pBitmap == nil:
    return
  
  result.ownership = hoOwned
  result.data.spriteWidth = spriteWidth
  result.data.spriteHeight = spriteHeight
  
  # Calculate grid dimensions
  when declared(gbitmap_get_bounds):
    let bounds = result.pBitmap.bounds
    result.data.cols = (bounds.size.w.int div spriteWidth.int).uint8
    result.data.rows = (bounds.size.h.int div spriteHeight.int).uint8
    result.data.totalSprites = result.data.cols * result.data.rows

proc newSpriteSheetHandle*(bitmap: ptr GBitmap, spriteWidth, spriteHeight: uint8): SpriteSheetHandle {.inline.} =
  ## Create a managed sprite sheet from an existing bitmap (unowned).
  ##
  ## The handle does NOT take ownership of the bitmap.
  ## User must ensure bitmap outlives the handle.
  result.pBitmap = bitmap
  result.ownership = hoUnowned
  result.data.spriteWidth = spriteWidth
  result.data.spriteHeight = spriteHeight
  
  when declared(gbitmap_get_bounds):
    let bounds = bitmap.bounds
    result.data.cols = (bounds.size.w.int div spriteWidth.int).uint8
    result.data.rows = (bounds.size.h.int div spriteHeight.int).uint8
    result.data.totalSprites = result.data.cols * result.data.rows

proc newAnimatedSpriteHandle*(sheet: var SpriteSheetHandle, numFrames: uint8, frameDelay: uint16 = 100): AnimatedSpriteHandle {.inline.} =
  ## Create a managed animated sprite.
  ##
  ## Parameters:
  ##   - sheet: The sprite sheet handle containing animation frames
  ##   - numFrames: Number of frames in the animation
  ##   - frameDelay: Milliseconds to display each frame (default: 100ms = 10fps)
  ##
  ## The animation frames are assumed to be at indices 0 to numFrames-1 in the sheet.
  ## The handle references the sheet handle (does not own it).
  result.pSheetHandle = addr sheet
  result.state.totalFrames = min(numFrames, sheet.data.totalSprites)
  result.state.frameDelay = frameDelay
  result.state.currentFrame = 0
  result.state.mode = amLoop
  result.state.direction = 1
  result.state.isPlaying = true
  result.ownership = hoUnowned

# ============================================================================
# Managed Handle Operations
# ============================================================================

proc getBitmap*(h: SpriteSheetHandle): ptr GBitmap {.inline.} =
  ## Get the underlying bitmap pointer.
  h.pBitmap

proc getFrameSourceRect*(h: SpriteSheetHandle, index: uint8): GRect {.inline.} =
  ## Calculate the source rectangle for a frame.
  let col = index mod h.data.cols
  let row = index div h.data.cols
  
  result.origin.x = (col * h.data.spriteWidth).int16
  result.origin.y = (row * h.data.spriteHeight).int16
  result.size.w = h.data.spriteWidth.int16
  result.size.h = h.data.spriteHeight.int16

proc draw*(h: SpriteSheetHandle, index: uint8, ctx: ptr GContext, pos: GPoint) {.inline.} =
  ## Draw a specific sprite from the sheet by index.
  when declared(gbitmap_create_as_sub_bitmap) and declared(gbitmap_destroy):
    if h.pBitmap == nil: return
    
    let srcRect = h.getFrameSourceRect(index)
    let subBitmap = gbitmap_create_as_sub_bitmap(h.pBitmap, srcRect)
    if subBitmap != nil:
      let destRect = makeGRect(pos.x, pos.y, srcRect.size.w, srcRect.size.h)
      graphics_draw_bitmap_in_rect(ctx, subBitmap, destRect)
      gbitmap_destroy(subBitmap)

# ============================================================================
# AnimatedSpriteHandle Operations
# ============================================================================

proc update*(h: var AnimatedSpriteHandle, elapsedMs: uint16): bool {.inline.} =
  ## Update animation state and advance frame if needed.
  ##
  ## Parameters:
  ##   - elapsedMs: Milliseconds elapsed since last update
  ##
  ## Returns true if the frame changed this update.
  if h.pSheetHandle == nil or not h.state.isPlaying or h.state.totalFrames <= 1:
    return false
  
  if elapsedMs < h.state.frameDelay:
    return false
  
  result = true
  
  case h.state.mode
  of amLoop:
    h.state.currentFrame = (h.state.currentFrame + 1) mod h.state.totalFrames
    
  of amOnce:
    if h.state.currentFrame < h.state.totalFrames - 1:
      h.state.currentFrame += 1
    else:
      h.state.isPlaying = false
      
  of amPingPong:
    h.state.currentFrame = (h.state.currentFrame.int8 + h.state.direction).uint8
    
    if h.state.currentFrame >= h.state.totalFrames - 1:
      h.state.currentFrame = h.state.totalFrames - 1
      h.state.direction = -1
    elif h.state.currentFrame == 0:
      h.state.currentFrame = 0
      h.state.direction = 1

proc draw*(h: AnimatedSpriteHandle, ctx: ptr GContext, pos: GPoint) {.inline.} =
  ## Draw the current animation frame.
  if h.pSheetHandle == nil or h.state.totalFrames == 0: return
  h.pSheetHandle[].draw(h.state.currentFrame, ctx, pos)

proc play*(h: var AnimatedSpriteHandle, mode: AnimationMode = amLoop) {.inline.} =
  ## Start or resume animation playback.
  h.state.isPlaying = true
  h.state.mode = mode
  h.state.direction = 1
  if mode == amPingPong:
    h.state.currentFrame = 0

proc pause*(h: var AnimatedSpriteHandle) {.inline.} =
  ## Pause animation at current frame.
  h.state.isPlaying = false

proc reset*(h: var AnimatedSpriteHandle) {.inline.} =
  ## Reset animation to first frame.
  h.state.currentFrame = 0
  h.state.direction = 1

proc setFrameRate*(h: var AnimatedSpriteHandle, fps: uint8) {.inline.} =
  ## Set animation frame rate (frames per second).
  if fps > 0:
    h.state.frameDelay = (1000 div fps).uint16

proc currentFrame*(h: AnimatedSpriteHandle): uint8 {.inline.} = h.state.currentFrame
proc totalFrames*(h: AnimatedSpriteHandle): uint8 {.inline.} = h.state.totalFrames
proc frameDelay*(h: AnimatedSpriteHandle): uint16 {.inline.} = h.state.frameDelay
proc mode*(h: AnimatedSpriteHandle): AnimationMode {.inline.} = h.state.mode
proc isPlaying*(h: AnimatedSpriteHandle): bool {.inline.} = h.state.isPlaying

# ============================================================================
# Raw API (Advanced - User manages lifetimes)
# ============================================================================

proc newSpriteSheet*(bitmap: ptr GBitmap, spriteWidth, spriteHeight: uint8): SpriteSheet {.inline.} =
  ## Create a sprite sheet from a bitmap (raw API).
  ##
  ## WARNING: User must ensure bitmap outlives this SpriteSheet.
  result.bitmap = bitmap
  result.spriteWidth = spriteWidth
  result.spriteHeight = spriteHeight
  
  when declared(gbitmap_get_bounds):
    let bounds = bitmap.bounds
    result.cols = (bounds.size.w.int div spriteWidth.int).uint8
    result.rows = (bounds.size.h.int div spriteHeight.int).uint8
    result.totalSprites = result.cols * result.rows

proc getFrame*(sheet: ptr SpriteSheet, index: uint8): SpriteFrame {.inline.} =
  ## Get a specific frame from the sprite sheet (raw API).
  ##
  ## WARNING: User must ensure sheet outlives the returned SpriteFrame.
  result.sheet = sheet
  result.index = min(index, sheet[].totalSprites - 1)

proc getFrameSourceRect*(frame: SpriteFrame): GRect {.inline.} =
  ## Calculate the source rectangle for a frame (raw API).
  let sheet = frame.sheet
  let col = frame.index mod sheet.cols
  let row = frame.index div sheet.cols
  
  result.origin.x = (col * sheet.spriteWidth).int16
  result.origin.y = (row * sheet.spriteHeight).int16
  result.size.w = sheet.spriteWidth.int16
  result.size.h = sheet.spriteHeight.int16

proc draw*(frame: SpriteFrame, ctx: ptr GContext, pos: GPoint) {.inline.} =
  ## Draw a single sprite frame (raw API).
  when declared(gbitmap_create_as_sub_bitmap) and declared(gbitmap_destroy):
    if frame.sheet == nil: return
    
    let srcRect = frame.getFrameSourceRect()
    let subBitmap = gbitmap_create_as_sub_bitmap(frame.sheet.bitmap, srcRect)
    if subBitmap != nil:
      let destRect = makeGRect(pos.x, pos.y, srcRect.size.w, srcRect.size.h)
      graphics_draw_bitmap_in_rect(ctx, subBitmap, destRect)
      gbitmap_destroy(subBitmap)

proc draw*(sheet: ptr SpriteSheet, index: uint8, ctx: ptr GContext, pos: GPoint) {.inline.} =
  ## Draw a specific sprite from the sheet by index (raw API).
  let frame = sheet.getFrame(index)
  frame.draw(ctx, pos)

proc newAnimatedSprite*(sheet: ptr SpriteSheet, numFrames: uint8, frameDelay: uint16 = 100): AnimatedSprite {.inline.} =
  ## Create an animated sprite (raw API).
  ##
  ## WARNING: User must ensure sheet outlives this AnimatedSprite.
  result.sheet = sheet
  result.totalFrames = min(numFrames, sheet[].totalSprites)
  result.frameDelay = frameDelay
  result.currentFrame = 0
  result.mode = amLoop
  result.direction = 1
  result.isPlaying = true

proc update*(sprite: var AnimatedSprite, elapsedMs: uint16): bool {.inline.} =
  ## Update animation state (raw API).
  if not sprite.isPlaying or sprite.totalFrames <= 1:
    return false
  
  if elapsedMs < sprite.frameDelay:
    return false
  
  result = true
  
  case sprite.mode
  of amLoop:
    sprite.currentFrame = (sprite.currentFrame + 1) mod sprite.totalFrames
    
  of amOnce:
    if sprite.currentFrame < sprite.totalFrames - 1:
      sprite.currentFrame += 1
    else:
      sprite.isPlaying = false
      
  of amPingPong:
    sprite.currentFrame = (sprite.currentFrame.int8 + sprite.direction).uint8
    
    if sprite.currentFrame >= sprite.totalFrames - 1:
      sprite.currentFrame = sprite.totalFrames - 1
      sprite.direction = -1
    elif sprite.currentFrame == 0:
      sprite.currentFrame = 0
      sprite.direction = 1

proc draw*(sprite: AnimatedSprite, ctx: ptr GContext, pos: GPoint) {.inline.} =
  ## Draw the current animation frame (raw API).
  if sprite.totalFrames == 0: return
  var frame = sprite.sheet.getFrame(sprite.currentFrame)
  frame.draw(ctx, pos)

proc getCurrentFrame*(sprite: AnimatedSprite): SpriteFrame {.inline.} =
  ## Get the current frame (raw API).
  result = sprite.sheet.getFrame(sprite.currentFrame)

proc play*(sprite: var AnimatedSprite, mode: AnimationMode = amLoop) {.inline.} =
  sprite.isPlaying = true
  sprite.mode = mode
  sprite.direction = 1
  if sprite.mode == amPingPong:
    sprite.currentFrame = 0

proc pause*(sprite: var AnimatedSprite) {.inline.} =
  sprite.isPlaying = false

proc reset*(sprite: var AnimatedSprite) {.inline.} =
  sprite.currentFrame = 0
  sprite.direction = 1

proc setFrameRate*(sprite: var AnimatedSprite, fps: uint8) {.inline.} =
  if fps > 0:
    sprite.frameDelay = (1000 div fps).uint16

template withAnimation*(sprite: var AnimatedSprite, elapsedMs: uint16, body: untyped) =
  ## Execute code block while animation is playing (raw API).
  if sprite.update(elapsedMs):
    body

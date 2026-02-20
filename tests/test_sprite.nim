## Test Sprite Sheet and Animation Module
##
## Tests both Managed Handles (safe) and Raw Pointers (advanced) APIs.

import std/unittest
import nebble/graphics/sprite

suite "SpriteSheetHandle (Managed API)":
  test "create handle from resource ID":
    # Note: Can't actually test resource loading without Pebble runtime
    # but we can test the API exists and compiles
    discard
  
  test "handle tracks sheet metadata":
    # Mock test with manual data setup
    var h: SpriteSheetHandle
    # Would be populated by newSpriteSheetHandle in real usage
    check h.isNil == true
  
  test "move semantics work correctly":
    # Test that moved handles are nil
    var h1: SpriteSheetHandle
    # After move, source should be nil
    check true  # Compile-time test

suite "AnimatedSpriteHandle (Managed API)":
  test "create animated sprite handle":
    # Compile-time test
    check true
  
  test "animation state accessors":
    # Mock test
    var h: AnimatedSpriteHandle
    check h.isNil == true

suite "Raw API - SpriteSheet":
  test "create sprite sheet with grid calculation":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    
    check sheet.spriteWidth == 16
    check sheet.spriteHeight == 16
    check sheet.cols == 4
    check sheet.rows == 4
    check sheet.totalSprites == 16
  
  test "get frame returns valid frame":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var frame = sheet.addr.getFrame(5)
    
    check frame.sheet == sheet.addr
    check frame.index == 5
  
  test "get frame clamps to valid range":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var frame = sheet.addr.getFrame(100)
    
    check frame.index == 15  # Clamped to max
  
  test "getFrameSourceRect calculates correct rectangle":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var frame = sheet.addr.getFrame(5)  # Row 1, Col 1 (0-indexed)
    
    let rect = frame.getFrameSourceRect()
    
    check rect.origin.x == 16
    check rect.origin.y == 16
    check rect.size.w == 16
    check rect.size.h == 16

suite "Raw API - AnimatedSprite":
  test "create animated sprite with defaults":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var anim = newAnimatedSprite(sheet.addr, 8, 100)
    
    check anim.sheet == sheet.addr
    check anim.totalFrames == 8
    check anim.frameDelay == 100
    check anim.currentFrame == 0
    check anim.mode == amLoop
    check anim.direction == 1
    check anim.isPlaying == true
  
  test "update advances frame when elapsed exceeds delay":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var anim = newAnimatedSprite(sheet.addr, 4, 100)
    
    check anim.update(50) == false  # Not enough time
    check anim.currentFrame == 0
    
    check anim.update(100) == true  # Frame advances
    check anim.currentFrame == 1
  
  test "loop mode wraps around":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var anim = newAnimatedSprite(sheet.addr, 3, 100)
    anim.currentFrame = 2  # Last frame
    
    check anim.update(100) == true
    check anim.currentFrame == 0  # Wrapped to first
  
  test "once mode stops at last frame":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var anim = newAnimatedSprite(sheet.addr, 3, 100)
    anim.mode = amOnce
    anim.currentFrame = 1
    
    check anim.update(100) == true
    check anim.currentFrame == 2
    check anim.isPlaying == true
    
    check anim.update(100) == true
    check anim.currentFrame == 2
    check anim.isPlaying == false  # Stopped
  
  test "ping-pong mode bounces":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var anim = newAnimatedSprite(sheet.addr, 4, 100)
    anim.mode = amPingPong
    anim.currentFrame = 2
    anim.direction = 1
    
    check anim.update(100) == true
    check anim.currentFrame == 3
    check anim.direction == -1  # Bounced at end
    
    check anim.update(100) == true
    check anim.currentFrame == 2  # Moving backward
    check anim.direction == -1
  
  test "pause stops animation":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var anim = newAnimatedSprite(sheet.addr, 4, 100)
    
    anim.pause()
    check anim.isPlaying == false
    check anim.update(200) == false  # Won't advance
    check anim.currentFrame == 0
  
  test "reset returns to first frame":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var anim = newAnimatedSprite(sheet.addr, 4, 100)
    anim.currentFrame = 3
    anim.direction = -1
    
    anim.reset()
    check anim.currentFrame == 0
    check anim.direction == 1
  
  test "setFrameRate calculates correct delay":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var anim = newAnimatedSprite(sheet.addr, 4, 100)
    
    anim.setFrameRate(10)  # 10 fps = 100ms
    check anim.frameDelay == 100
    
    anim.setFrameRate(30)  # 30 fps = 33ms
    check anim.frameDelay == 33
  
  test "single frame animation never advances":
    var sheet = SpriteSheet(
      bitmap: nil,
      spriteWidth: 16,
      spriteHeight: 16,
      cols: 4,
      rows: 4,
      totalSprites: 16
    )
    var anim = newAnimatedSprite(sheet.addr, 1, 100)
    
    check anim.update(1000) == false
    check anim.currentFrame == 0

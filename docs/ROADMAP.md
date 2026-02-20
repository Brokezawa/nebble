# Nebble Roadmap

**Status:** v1.0.0 Release  
**Last Updated:** February 19, 2026

## ✅ Completed Milestones (v1.0.0)

### Phase 1: Foundation
- [x] **FFI Bindings**: Generated bindings for all 6 Pebble platforms.
- [x] **Build System**: `nebble` CLI tool for project management.
- [x] **Platform Support**: Verified compilation on all platforms.

### Phase 2: High-Level API
- [x] **Core UI**: Managed handles for all Layer types.
- [x] **Graphics**: Idiomatic wrappers for drawing and paths.
- [x] **Events**: Coverage for all Pebble event services.
- [x] **Managed Types**: Robust ownership model (`hoOwned`, `hoParented`).

### Phase 3: Full-Stack & Hardening
- [x] **Declarative DSL**: Powerful `nebbleApp` macro for minimal boilerplate.
- [x] **Unified Full-Stack**: Support for writing `pebble-js-app.js` in Nim.
- [x] **Modern Tooling**: `package.json` support and improved CLI workflow.
- [x] **Zero-Heap Architecture**: `FixedString` and heap-free formatting.
- [x] **Validation**: Core examples covering the entire SDK stack.

---

## 🚀 Implementation Plan (v1.1.0)

### Sprint 1: Quick Wins

#### 1.1 Examples Repository
**Goal**: Move examples to separate repository to reduce package size

**Implementation**:
- Create `nebble-examples` repository on GitHub
- Move all 13 examples (accelerometer_demo through vibes_demo)
- Remove examples/ directory from main nebble package
- Update nimble test tasks to build `hello_world` and `simple_watchface` from CLI templates
- Update documentation to point to new repository

**Files Affected**:
- Delete: `examples/*` (13 directories)
- Modify: `nebble.nimble` (update test tasks)
- Modify: `docs/GETTING_STARTED.md`
- Modify: `docs/ARCHITECTURE.md`

**Dependencies**: GitHub repository creation
**Complexity**: Low
**Effort**: 1-2 days
**Breaking Changes**: Users must clone nebble-examples for sample projects

---

#### 1.2 Sprite Sheet Support
**Goal**: Zero-copy sprite management with animation support

**Implementation**:
Create `nebble/graphics/sprite.nim` with:
- `SpriteSheet` type referencing bitmap with sprite dimensions
- `AnimatedSprite` type with frame cycling support
- `SpriteFrame` view into specific sprite in sheet
- Frame-based animation (timer-driven frame advancement)
- Support for play once, loop, and ping-pong animations

**API Design**:
```nim
type
  SpriteSheet* = object
    bitmap: GBitmapHandle
    spriteWidth, spriteHeight: uint8
    cols, rows: uint8
  
  AnimatedSprite* = object
    sheet: SpriteSheet
    currentFrame: uint8
    totalFrames: uint8
    frameDelay: uint16  # ms between frames
    lastUpdate: uint32  # timestamp
    mode: AnimationMode  # Loop, Once, PingPong

type AnimationMode* = enum amLoop, amOnce, amPingPong

proc update*(sprite: var AnimatedSprite): bool
  ## Returns true if frame changed, updates currentFrame based on timing
  
proc draw*(sprite: AnimatedSprite, ctx: ptr GContext, pos: GPoint)
  ## Draws current frame at position
  
proc play*(sprite: var AnimatedSprite, mode: AnimationMode = amLoop)
proc pause*(sprite: var AnimatedSprite)
proc reset*(sprite: var AnimatedSprite)
```

**Files to Create**:
- `src/nebble/graphics/sprite.nim`
- `examples/` (in nebble-examples repo): `sprite_demo/`

**Dependencies**:
- GBitmap FFI bindings
- Timer foundation
- Graphics context

**Complexity**: Low
**Effort**: 2-3 days
**Breaking Changes**: None

---

### Sprint 2: Developer Experience

#### 2.1 Menu DSL
**Goal**: Declarative macro-based menu definition hiding pointer arithmetic

**Implementation**:
Create `nebble/ui/menu_dsl.nim` with compile-time macro:

**Features**:
- Declarative menu definition (nebbleApp-style consistency)
- Automatic static array generation with correct sizes
- Icon support for each menu item
- Section headers
- Callback binding
- No manual `addr` operations visible to user

**API Design**:
```nim
# User writes:
nebbleApp:
  menu:
    section "Main Menu":
      item "Start", icon = ICON_PLAY, callback = onStart
      item "Settings", icon = ICON_SETTINGS, callback = onSettings
    section "System":
      item "About", subtitle = "v1.0", callback = onAbout

# Macro expands to:
# - Static array of SimpleMenuItem
# - Static array of SimpleMenuSection  
# - Proper pointer setup (hidden from user)
# - Automatic callback wiring
```

**Implementation Strategy**:
1. Parse menu DSL at compile time
2. Count total items and sections
3. Generate static arrays with `const`
4. Set up pointers automatically
5. Generate initialization code in `init:` block

**Files to Create**:
- `src/nebble/ui/menu_dsl.nim`

**Dependencies**:
- macros module
- simple_menu_layer FFI bindings
- Consistent with nebbleApp macro style

**Complexity**: Medium
**Effort**: 3-4 days
**Breaking Changes**: None (adds new DSL)

---

#### 2.2 AppMessage Serialization
**Goal**: Macro-driven object mapping with automatic versioning

**Implementation**:
Create `nebble/comms/typed_serialization.nim`:

**Features**:
- Compile-time generation of serialize/deserialize code
- Support primitives (int, uint, bool, FixedString)
- Support nested objects
- Automatic schema versioning (backward compatibility)
- Zero runtime overhead (all code generated at compile time)

**API Design**:
```nim
type
  MyMessage* {.version: 1.} = object
    command*: uint8
    value*: int32
    name*: FixedString[32]

# Macro generates:
proc serialize(msg: MyMessage, iter: ptr DictionaryIterator)
proc deserialize(iter: ptr DictionaryIterator): MyMessage

# Usage:
proc sendCommand(cmd: uint8, val: int32) =
  var msg = MyMessage(command: cmd, value: val, name: "test")
  outbox.send(msg)  # Auto-serializes with version header

proc inboxHandler(iter: ptr DictionaryIterator) =
  let msg = iter.deserializeAs(MyMessage)  # Auto-deserializes, handles versioning
  case msg.command:
    of CMD_START: start()
```

**Schema Versioning**:
- First byte of message = schema version
- Deserializer checks version, handles migration
- Old code can read new messages (ignores unknown fields)
- New code can read old messages (uses defaults for missing fields)

**Files to Create**:
- `src/nebble/comms/typed_serialization.nim`

**Dependencies**:
- macros module
- typed_message module
- May need reflection utilities

**Complexity**: Medium-High
**Effort**: 5-7 days
**Breaking Changes**: None (new module)

---

### Sprint 3: Advanced Features

#### 3.1 Framebuffer Access
**Goal**: Safe iterator for direct pixel manipulation

**Implementation**:
Create `nebble/graphics/framebuffer.nim`:

**Features**:
- Safe wrapper around framebuffer pointer
- Bounds-checked pixel access
- Iterator for region-based operations
- Read and write operations
- Automatic context lock/unlock

**API Design**:
```nim
type
  FrameBufferContext* = object
    pCtx: ptr GContext
    width, height: int16

proc lock*(win: WindowHandle): FrameBufferContext
  ## Lock framebuffer for direct access
  
proc unlock*(ctx: FrameBufferContext)
  ## Release framebuffer

iterator pixels*(ctx: FrameBufferContext, region: GRect = GRectZero): (int16, int16, var GColor) =
  ## Yields (x, y, color) for each pixel in region
  ## Allows: `color = GColorRed`
  
proc getPixel*(ctx: FrameBufferContext, x, y: int16): GColor
proc setPixel*(ctx: FrameBufferContext, x, y: int16, color: GColor)
```

**Usage Pattern**:
```nim
let fb = window.lock()
for x, y, color in fb.pixels():
  # Direct pixel manipulation
  color = calculatePixel(x, y)
window.unlock()
```

**Files to Create**:
- `src/nebble/graphics/framebuffer.nim`

**Dependencies**:
- FFI graphics context bindings
- Platform-specific framebuffer constants

**Complexity**: Medium
**Effort**: 2-3 days
**Breaking Changes**: None

---

#### 3.2 Animation DSL
**Goal**: Fluent builders for complex sequences (Nim-idiomatic)

**Implementation**:
Create `nebble/ui/animation_dsl.nim` with declarative style (consistent with nebbleApp):

**Features**:
- Sequential animations (`then`)
- Parallel animations (`parallel` block)
- Easing functions
- Callbacks
- Chained property animations
- Declarative syntax (not imperative builder)

**API Design**:
```nim
# Declarative style (consistent with nebbleApp)
nebbleApp:
  # ... other components ...
  
  animation:
    on: buttonPress
    sequence:
      parallel:
        layer1.moveTo(100, 50).duration(500).easeInOut
        layer2.fadeTo(GColorClear).duration(300)
      then:
        layer1.scale(1.5).duration(200).easeOut
      then:
        parallel:
          layer1.moveTo(0, 0).duration(400)
          layer2.fadeTo(GColorBlack).duration(400)
    onComplete:
      vibes.shortPulse()
      animationState = done
```

**Implementation Strategy**:
1. Parse animation blocks at compile time
2. Generate PropertyAnimation setup code
3. Handle timing and sequencing
4. Wire up callbacks
5. Integrate with existing animation system

**Files to Create**:
- `src/nebble/ui/animation_dsl.nim`

**Dependencies**:
- property_animation module
- Timer foundation
- macros module

**Complexity**: Medium
**Effort**: 4-5 days
**Breaking Changes**: None (adds new API)

---

## Implementation Schedule

### Week 1 (Sprint 1)
- [ ] Create nebble-examples repository
- [ ] Migrate all examples
- [ ] Update test tasks in nebble.nimble
- [ ] Implement Sprite Sheet module
- [ ] Create sprite animation demo

### Week 2-3 (Sprint 2)
- [ ] Implement Menu DSL
- [ ] Implement AppMessage Serialization
- [ ] Create comprehensive examples for both
- [ ] Update documentation

### Week 4-5 (Sprint 3)
- [ ] Implement Framebuffer Access
- [ ] Implement Animation DSL
- [ ] Create advanced graphics demos
- [ ] Final testing and documentation

---

## Known Limitations

- **No Garbage Collection**: Cycle collection is disabled; manual management of reference cycles is required.
- **Callbacks**: All handlers must be `{.cdecl.}` global procedures.
- **Stdlib**: Only non-syscall modules are supported in device code.

---

## Notes

- All new APIs follow Nim idioms and are consistent with existing nebbleApp macro style
- Breaking changes avoided where possible
- Focus on compile-time safety and zero-overhead abstractions
- Documentation updates accompany each feature

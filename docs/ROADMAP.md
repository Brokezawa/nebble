# Nebble Roadmap

**Status:** v1.1.0 Release (Ready)  
**Last Updated:** February 20, 2026

---

## Current Release: v1.1.0

**Release Date**: February 20, 2026  
**Tag**: `v1.1.0`  
**Key Commits**: `006460c`, `9e39532`, `7047c29`

### ✅ Completed in v1.1.0

#### 1. CLI Integration and FixedString Improvements
**Commit**: `006460c`

Merged the CLI tool into the main package and improved the FixedString API.

**Changes**:
- CLI source moved to `tools/nebble.nim`
- Binary output: `bin/tools/nebble`
- FixedString API enhancements for heap-free operations
- Zero heap fragmentation guarantee

---

#### 2. Examples Repository Migration  
**Commit**: `9e39532`

Moved all examples to a separate repository to reduce package size.

**Changes**:
- Removed 13 examples from main package
- Examples now in `nebble-examples` repository
- Updated test infrastructure to use CLI templates
- Reduced package size by ~60%

**Migration**:
```bash
# Clone examples separately
git clone https://github.com/Brokezawa/nebble-examples
```

---

#### 3. Sprite Sheet Support with Managed Handles
**Commit**: `7047c29`

Zero-copy sprite management with **two API options** for different use cases.

##### Managed API (Safe - Recommended)
ARC-managed handles with automatic lifecycle management.

**Types**:
- `SpriteSheetHandle` - Owns GBitmap, auto-destroyed
- `AnimatedSpriteHandle` - References sheet, manages animation state

**Example**:
```nim
var sheet = newSpriteSheetHandle(RESOURCE_ID_SPRITES, 32, 32)
var player = newAnimatedSpriteHandle(sheet, 8, 100)
player.update(elapsedMs)
player.draw(ctx, pos)
# Auto-cleanup when out of scope
```

##### Raw API (Advanced - Zero Overhead)
Stack-allocated types for maximum performance.

**Types**:
- `SpriteSheet` - Value type, user manages lifetime
- `AnimatedSprite` - Value type, user manages lifetime
- `SpriteFrame` - View into sheet

**Example**:
```nim
var bitmap = newBitmap(RESOURCE_ID_SPRITES)
var sheet = newSpriteSheet(bitmap, 32, 32)
var player = newAnimatedSprite(sheet.addr, 8, 100)
# Manual cleanup required
destroy(bitmap)
```

**Features**:
- `AnimationMode`: Loop, Once, Ping-Pong
- Zero-copy drawing via sub-bitmaps
- Elapsed-time based (no getTime() dependency)

**Files**:
- `src/nebble/graphics/sprite.nim` (new)
- `tests/test_sprite.nim` (tests for both APIs)
- Updated `src/nebble/graphics/graphics.nim`

---

#### 2. Examples Repository Migration
**Commit**: `9e39532`

Moved all examples to a separate repository to reduce package size.

**Completed**:
- Removed all 13 examples from main nebble package
- Updated nimble test tasks to use CLI templates (`hello_world`, `simple_watchface`)
- Fixed test path issues with cross-platform compatible paths
- All 14 platform builds passing (7 platforms × 2 templates)

**Migration**:
```bash
# Clone examples separately
git clone https://github.com/Brokezawa/nebble-examples
```

---

### ⚠️ v1.1.0 Breaking Changes

1. **CLI Path Changed**
   - Old: `bin/nebble`
   - New: `bin/tools/nebble`
   - Update any scripts referencing the old path

2. **Examples Removed from Package**
   - Examples no longer included in nimble package
   - Clone `nebble-examples` repo separately
   - Affects: Documentation links, tutorials

3. **Test Infrastructure Updated**
   - `nimble test` now uses CLI templates
   - No longer builds example projects
   - Faster but different validation approach

---

## Previous Releases

### v1.0.0 (Foundation Release)

#### Phase 1: Foundation
- [x] **FFI Bindings**: Generated bindings for all 7 Pebble platforms.
- [x] **Build System**: `nebble` CLI tool for project management.
- [x] **Platform Support**: Verified compilation on all platforms.

#### Phase 2: High-Level API
- [x] **Core UI**: Managed handles for all Layer types.
- [x] **Graphics**: Idiomatic wrappers for drawing and paths.
- [x] **Events**: Coverage for all Pebble event services.
- [x] **Managed Types**: Robust ownership model (`hoOwned`, `hoParented`).

#### Phase 3: Full-Stack & Hardening
- [x] **Declarative DSL**: Powerful `nebbleApp` macro for minimal boilerplate.
- [x] **Unified Full-Stack**: Support for writing `pebble-js-app.js` in Nim.
- [x] **Modern Tooling**: `package.json` support and improved CLI workflow.
- [x] **Zero-Heap Architecture**: `FixedString` and heap-free formatting.
- [x] **Validation**: Core examples covering the entire SDK stack.

---

## Future Releases

### v1.2.0 - Developer Experience (Planned)

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

**Complexity**: Medium-High
**Effort**: 5-7 days
**Breaking Changes**: None (new module)

---

#### 2.3 Worker Binary Support
**Goal**: Enable background worker binaries for persistent background tasks

**Implementation**:
Create `nebble/worker/` module for worker binary support:

**Features**:
- Worker binary scaffolding (`worker_main` macro)
- Worker-specific event loop (`worker_event_loop`)
- App-to-worker and worker-to-app message passing
- Tick timer service in worker context
- Persistent storage access from worker
- High-level API matching foreground app patterns

**API Design**:
```nim
# worker.nim - Background worker entry point
nebbleWorker:
  init:
    # Subscribe to tick timer in worker context
    tickTimer.subscribe(TimeUnits.SECOND_UNIT, handleTick)
    
  proc handleTick(tickTime: ptr tm, unitsChanged: TimeUnits) {.cdecl.} =
    # Increment counter in background
    s_ticks.inc
    
    # Send data to foreground app
    let msg = AppWorkerMessage(data0: s_ticks)
    workerSendMessage(WORKER_TICKS, msg)

# main.nim - Foreground app
nebbleApp:
  init:
    # Subscribe to worker messages
    workerMessage.subscribe(handleWorkerMessage)
    
  proc handleWorkerMessage(data: AppWorkerMessage) {.cdecl.} =
    # Update UI with data from worker
    counter = data.data0
    updateText()
```

**CLI Support**:
```bash
nebble new my_worker --worker    # Create worker binary project
nebble build --worker             # Build worker binary
```

**Implementation Strategy**:
1. Create worker-specific FFI bindings (`pebble_worker.h`)
2. Implement `worker_event_loop()` wrapper
3. Add `nebbleWorker` macro for worker entry point
4. Implement message passing APIs
5. Update CLI to support worker builds
6. Handle worker/foreground app communication

**Complexity**: Medium-High
**Effort**: 4-6 days
**Breaking Changes**: None (adds new module)

---

### v1.3.0 - Advanced Features (Planned)

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

**Complexity**: Medium
**Effort**: 4-5 days
**Breaking Changes**: None (adds new API)

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

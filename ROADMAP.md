# Nebble: Nim Wrapper for the Pebble SDK -- Development Roadmap

**Last Updated:** February 11, 2026  
**Status:** Development phase - Phase 8 ✅ COMPLETE; Phase 9 🟡 IN PROGRESS

**Note (update):** Resources & Doctor CLI commands implemented; draw-command managed wrappers and a smoke test were added (see Phase 8.5 and Phase 9.2 for details).

---

## Project Summary

**Nebble** (Nim + Pebble) is a Nimble package that enables Pebble smartwatch app
development in the Nim programming language. It targets all Pebble hardware
platforms (Aplite through Flint). It provides:

1. **Low-level C bindings** generated via
   [Futhark](https://github.com/pmunch/futhark) project mode from `pebble.h`
2. **High-level idiomatic Nim API** layered on top
3. **Full build tooling** (`nebble` CLI) that integrates with the `pebble`
   toolchain
4. **ARC-managed types** for automatic memory safety

## Decisions

| Decision | Choice |
|----------|--------|
| **Name** | `nebble` (Nim + Pebble) |
| **Abstraction** | Both layers: low-level FFI + high-level idiomatic Nim API |
| **Binding generation** | Futhark in **project mode** (designed for embedded targets) |
| **Build tooling** | Full CLI (`nebble new`, `nebble build`, `nebble install`) |
| **SDK target** | rePebble SDK (developer.repebble.com), latest (4.3) |
| **Platforms** | Aplite, Basalt, Chalk, Diorite, Emery, Flint |
| **Aplite strategy** | Same API surface, compiler warnings when features are too expensive for 24k |
| **Flint/Gabbro** | Flint supported; Gabbro deferred (no SDK support) |

---

## Overall Project Status

| Phase | Status | Completion | Notes |
|-------|--------|------------|-------|
| Phase 0 | ✅ COMPLETE | 100% | Feasibility confirmed on 6 platforms |
| Phase 1 | ✅ COMPLETE | 85% | 6/7 platforms (Gabbro missing) |
| Phase 2 | ✅ COMPLETE | 100% | 41 high-level modules implemented |
| Phase 3 | ✅ COMPLETE | 100% | CLI tool fully functional |
| Phase 4 | ✅ COMPLETE | 95% | Tests pass; 1 minor collision issue |
| Phase 5 | ✅ COMPLETE | 100% | 11 examples, all docs complete |
| Phase 6 | ✅ COMPLETE | 100% | API redesign finished |
| Phase 7 | ✅ COMPLETE | 100% | Full consistency achieved |
| Phase 8 | ✅ COMPLETE | 100% | CLI commands implemented (resources, doctor) |
| Phase 9 | 🟡 IN PROGRESS | 80% | Draw-command managed types implemented; remaining advanced features pending |

**Current Blockers:** None critical. Minor gaps in Phase 8 CLI commands.

---

## Phase 0: Feasibility & Environment (Weeks 1-2) ✅ COMPLETE

**Goal:** Prove that Nim can compile to C, link via the Pebble SDK's ARM GCC,
and run on a Pebble emulator.

### Results

**Feasibility: CONFIRMED.** Nim compiles to C, links via the Pebble SDK's ARM
GCC, and runs on all 6 platform emulators.

**Verification:**
- ✅ `poc/hello.nim` - Minimal Nim Pebble app
- ✅ `poc/nim.cfg` - Cross-compilation configuration
- ✅ `poc/wscript` - Modified wscript with `-w` flag
- ✅ Compiled and ran on Aplite, Basalt, Chalk emulators
- ✅ All 6 platforms (Aplite, Basalt, Chalk, Diorite, Emery, Flint) compile
- ⚠️ Gabbro: no SDK directory exists in v4.9.77

**Nim Cross-Compilation Config:**
```
--os:any --cpu:arm --mm:arc -d:useMalloc --noMain --compileOnly --threads:off -d:danger
```

**Binary Size Overhead:**
| Metric | C Baseline | Nim (`-d:danger`) | Overhead |
|--------|-----------|-------------------|----------|
| `.text` (code) | 848 bytes | 846 bytes | **-2 bytes** |
| `.data` | 4 bytes | 20 bytes | +16 bytes |
| `.bss` | 8 bytes | 48 bytes | +40 bytes |
| **Total** | **860 bytes** | **914 bytes** | **+54 bytes (6.3%)** |

---

## Phase 1: Low-Level C Bindings via Futhark Project Mode (Weeks 3-8) ✅ COMPLETE

**Goal:** Generate comprehensive 1:1 Nim bindings for the entire Pebble C API.

### Implementation Status

**Generated Bindings:**
| Platform | File | Lines | Status |
|----------|------|-------|--------|
| Aplite | `src/nebble/ffi/generated/aplite.nim` | ~10,000 | ✅ |
| Basalt | `src/nebble/ffi/generated/basalt.nim` | ~10,000 | ✅ |
| Chalk | `src/nebble/ffi/generated/chalk.nim` | ~10,000 | ✅ |
| Diorite | `src/nebble/ffi/generated/diorite.nim` | ~10,000 | ✅ |
| Emery | `src/nebble/ffi/generated/emery.nim` | ~10,000 | ✅ |
| Flint | `src/nebble/ffi/generated/flint.nim` | ~10,000 | ✅ |
| Gabbro | `src/nebble/ffi/generated/gabbro.nim` | N/A | ❌ SDK missing |

**Supporting Files:**
- ✅ `src/nebble/ffi.nim` - Platform selector
- ✅ `src/nebble/ffi/generate.nim` - Futhark generation script
- ✅ `src/nebble/ffi/macros.nim` - Manual C macro replacements
- ✅ `src/nebble/ffi/sdk_version.nim` - SDK version tracking

**Manual Supplements Implemented:**
| C Macro | Nim Implementation | Status |
|---------|--------------------|--------|
| `APP_LOG` | `template appLog*` | ✅ |
| `GRect()` | `func grect*` | ✅ |
| `GPoint()` | `func gpoint*` | ✅ |
| `GSize()` | `func gsize*` | ✅ |
| `GColorFromHEX()` | `func gcolorFromHex*` | ✅ |
| `GColorFromRGB()` | `func gcolorFromRGB*` | ✅ |
| `PBL_IF_*_ELSE` | Templates | ✅ |
| Color constants | 64 colors | ✅ |

**Milestone:** ✅ `import nebble/ffi` compiles for all platform targets.

---

## Phase 2: High-Level Idiomatic Nim API (Weeks 6-12) ✅ COMPLETE

**Goal:** Nim-native API that hides raw pointers and uses Nim idioms.

### Module Count

**Total High-Level Modules:** 41 modules  
**Total Lines of Code:** ~3,500+ LOC  
**API Coverage:** ~99-100% of Pebble SDK surface

### Module Categories

**Foundation (12 modules):**
- ✅ `app.nim`, `window.nim`, `layer.nim`
- ✅ `timer.nim`, `tick.nim`, `storage.nim`, `wakeup.nim`
- ✅ `watch_info.nim`, `logging.nim`, `i18n.nim`, `memory.nim`, `platform.nim`
- ✅ Event services: `accel.nim`, `battery.nim`, `compass.nim`, `connection.nim`, `focus.nim`, `health.nim`

**UI Components (12 modules):**
- ✅ `text_layer.nim`, `bitmap_layer.nim`, `menu_layer.nim`, `scroll_layer.nim`
- ✅ `action_bar.nim`, `status_bar.nim`, `animation.nim`, `clicks.nim`
- ✅ `action_menu.nim`, `simple_menu_layer.nim`, `number_window.nim`
- ✅ `declarative.nim` (DSL macros)

**Graphics (8 modules):**
- ✅ `graphics.nim`, `fonts.nim`, `gpath.nim`, `draw_command.nim`
- ✅ `draw_command_detail.nim`, `bitmap_sequence.nim`, `text_attributes.nim`
- ✅ `font_ref.nim`

**Communication (6 modules):**
- ✅ `message.nim`, `app_sync.nim`, `app_comm.nim`, `data_logging.nim`
- ✅ `smartstrap.nim`, `typed_message.nim`

**Input (1 module):**
- ✅ `dictation.nim`

**Storage (1 module):**
- ✅ `worker.nim`

**Utilities (1 module):**
- ✅ `math.nim`, `uuid.nim`

### Design Principles Applied

1. ✅ **No hidden heap allocation** - `cstring` by default
2. ✅ **Compile-time platform checks** - `when declared(...)` guards
3. ✅ **Destructor support via `--mm:arc`** - `=destroy` calls C funcs
4. ✅ **Aplite budget warnings** - `{.warning.}` on expensive features
5. ✅ **Callback safety** - `{.cdecl.}` at FFI boundary

**Milestone:** ✅ `import nebble` provides full idiomatic Nim API.

---

## Phase 3: Build Tooling (Weeks 5-8) ✅ COMPLETE

**Goal:** Full CLI tool for Pebble app development.

### CLI Implementation

**Location:** `cli/` directory  
**Entry Point:** `cli/src/nebble.nim`  
**Version:** 0.2.0

### Implemented Commands

| Command | Status | Description |
|---------|--------|-------------|
| `nebble new <name> [--watchface]` | ✅ | Scaffold new project |
| `nebble build [--platform <p>]` | ✅ | Nim→C→Pebble build pipeline |
| `nebble install --emulator <p>` | ✅ | Install to emulator |
| `nebble install --phone [<IP>]` | ✅ | Deploy to connected phone |
| `nebble clean` | ✅ | Remove build artifacts |
| `nebble size [--platform <p>]` | ✅ | Binary size analysis |
| `nebble gen-keys` | ✅ | Generate type-safe message keys |
| `nebble regen-ffi` | ✅ | Regenerate Futhark FFI bindings |
| `nebble help` | ✅ | Show help |
| `nebble version` | ✅ | Show version |

### CLI Architecture

**Modules:**
- `cli/src/nebble.nim` - Main entry point
- `cli/src/nebble_cli/commands.nim` - Command implementations (325 LOC)
- `cli/src/nebble_cli/config.nim` - Project configuration
- `cli/src/nebble_cli/templates.nim` - Project templates
- `cli/src/nebble_cli/builder.nim` - Build pipeline (250 LOC)

**Build Pipeline:**
1. Nim Compilation → `.c` files in `nimcache/`
2. `appinfo.json` Generation from `nebble.json`
3. C File Injection to `src/c/`
4. Pebble Build → `.pbw` bundle
5. Size Check for Aplite (24KB limit)

**Milestone:** ✅ CLI tool fully functional.

---

## Phase 4: Testing & Quality (Weeks 8-14) ✅ COMPLETE

**Goal:** Comprehensive test infrastructure.

### Test Framework

**Framework:** unittest2 v0.2.5

### Test Tasks

| Task | Description | Status |
|------|-------------|--------|
| `nimble test` | Full test suite | ✅ |
| `nimble testUnit` | Host-side unit tests | ✅ (41 tests) |
| `nimble testCompile` | Compile-only for 6 platforms | ✅ |
| `nimble testExamples` | Build all examples | ✅ |
| `nimble testSize` | Aplite 24KB gate | ✅ |

### Test Files

| File | LOC | Purpose | Status |
|------|-----|---------|--------|
| `tests/test_macros.nim` | 557 | Runtime unit tests | ✅ 41 tests pass |
| `tests/test_ffi.nim` | ~200 | FFI compile tests | ✅ |
| `tests/test_highlevel.nim` | ~300 | High-level API tests | ✅ |
| `tests/mocks/pebble.h` | 356 | C type definitions | ✅ |
| `test_build_matrix.sh` | 165 | Multi-platform builds | ✅ |

### Runtime Unit Test Results

```
[Summary] 41 tests run (0.00s): 41 OK, 0 FAILED, 0 SKIPPED
```

**Test Coverage:**
- Geometry constructors (12 tests)
- UUID constructors (4 tests)
- Angle conversion (12 tests)
- Platform conditionals (8 tests)
- Display constants (3 tests)
- Utility functions (2 tests)

**Milestone:** ✅ Comprehensive test infrastructure with 100% unit test pass rate.

---

## Phase 5: Documentation & Examples (Weeks 12-15) ✅ COMPLETE

**Goal:** Complete documentation and example apps.

### Documentation Files

| File | LOC | Status | Description |
|------|-----|--------|-------------|
| `README.md` | ~330 | ✅ | Project overview, quick start |
| `MIGRATION.md` | 479 | ✅ | C → Nim migration guide |
| `docs/GETTING_STARTED.md` | ~550 | ✅ | Complete tutorial |
| `ROADMAP.md` | 1600+ | ✅ | This file |
| `AGENTS.md` | ~200 | ✅ | Development guidelines |

### HTML API Documentation

**Generated:** `docs/html/`  
**Modules Documented:** 33 of 41 (80%)  
**Generation Command:**
```bash
nim doc --project --index:on --outdir:docs/html src/nebble.nim
```

### Example Applications

**Total Examples:** 11 (not 10 as originally planned)

| Example | Type | LOC | Features |
|---------|------|-----|----------|
| `hello_world` | App | 74 | Basic app with clicks |
| `simple_clock` | Watchface | 96 | Tick timer, time display |
| `menu_demo` | App | ~150 | Menu layer, sections |
| `animation_demo` | App | 142 | Property animations |
| `battery_status` | App | ~120 | Battery service |
| `accelerometer_demo` | App | ~150 | Accel service, tap/shake |
| `persist_demo` | App | ~150 | Persistent storage |
| `vibes_demo` | App | ~90 | Vibration patterns |
| `action_bar_demo` | App | ~100 | Action bar with icons |
| `health_demo` | App | ~120 | Health service |
| `simple_menu` | App | 66 | **Managed MenuLayer** |

**Build Verification:** All 11 examples compile for all 6 platforms (66 builds).

**Milestone:** ✅ Comprehensive documentation and 11 working examples.

---

## Phase 6: High-Level API Redesign ✅ COMPLETE

**Goal:** Fix UFCS naming collisions, create idiomatic API.

### Key Changes Implemented

**1. Naming Convention Fix**

| FFI Function | Old (COLLIDED) | New (SAFE) |
|--------------|----------------|------------|
| `tick_timer_service_subscribe` | `tickTimerServiceSubscribe` | `subscribe` |
| `window_stack_push` | `windowStackPush` | `push` |
| `text_layer_set_text` | `textLayerSetText` | `text=` |
| `layer_add_child` | `layerAddChild` | `addChild` |

**2. `ffi.` Qualification**
- All 33 modules now use `ffi.` prefix for FFI calls
- Eliminates ambiguity at compile time

**3. `pebbleApp` Macro**

```nim
# Before: 15+ lines
var window: ptr Window
proc init() = ...
proc deinit() = ...
proc main() {.exportc, cdecl.} = ...

# After: 3 lines
pebbleApp(load = windowLoad, unload = windowUnload)
```

**4. `staticText` Template**

```nim
# Before: 5 lines
let text = "Steps: " & $steps
for i in 0..<min(text.len, 31): buffer[i] = text[i]
buffer[min(text.len, 31)] = '\0'
text_layer_set_text(layer, cast[cstring](addr buffer[0]))

# After: 1 line
layer.staticText(buffer, "Steps: " & $steps)
```

### Modules Updated

All 33 high-level modules rewritten with:
- ✅ Short type-dispatched names
- ✅ `ffi.` module qualification
- ✅ Property setters for get/set pairs
- ✅ `when declared(...)` platform guards

**Milestone:** ✅ Core API redesigned, UFCS collisions eliminated.

---

## Phase 7: API Polish, Documentation & Project Setup ✅ COMPLETE

**Goal:** Full API naming consistency, documentation updates, git init.

### Phase 7.1: Module API Rename ✅

**Renamed 93 symbols across 12 modules:**

| Module | Symbols | Rename Pattern |
|--------|---------|---------------|
| `accel.nim` | 8 | `accelDataServiceSubscribe` → `subscribe` |
| `compass.nim` | 4 | `compassServiceSubscribe` → `subscribe` |
| `health.nim` | 8 | `healthServiceSum` → `sum`, `sumToday` |
| `watch_info.nim` | 3 | `watchInfoGetModel` → `model` |
| `message.nim` | 27 | `appMessageOpen` → `open` |
| `storage.nim` | 11 | `persistExists` → `exists` |
| `data_logging.nim` | 3 | `dataLoggingCreate` → `newDataLoggingSession` |
| `worker.nim` | 6 | `appWorkerLaunch` → `launch` |
| `wakeup.nim` | 6 | `wakeupSchedule` → `schedule` |
| `app_glance.nim` | 2 | `appGlanceAddSlice` → `addSlice` |
| `dictation.nim` | 6 | `dictationSessionCreate` → `newDictationSession` |
| `smartstrap.nim` | 11 | `smartstrapAttributeCreate` → `newAttribute` |

### Phase 7.2: CLI Template Fix ✅

- App template uses `onClick()` and `clickConfig =`
- Watchface template uses `subscribe()`

### Phase 7.3: Example Rewrite ✅

All 11 examples use high-level API:
- All use `import nebble` (not `import nebble/ffi`)
- Use `pebbleApp` macro where appropriate
- Use idiomatic names: `onClick`, `subscribe`, `staticText`

### Phase 7.4: Full Color Palette ✅

**Location:** `src/nebble/ffi/macros.nim`  
**Count:** All 64 Pebble SDK colors  
**Format:** `makeGColor8(argb)` templates  
**Range:** `GColorOxfordBlue` through `GColorWhite`

### Phase 7.5: Documentation Rewrite ✅

| File | Status |
|------|--------|
| `README.md` | ✅ Current API examples |
| `MIGRATION.md` | ✅ Fixed all API names |
| `docs/GETTING_STARTED.md` | ✅ Updated imports |
| `cli/templates.nim` | ✅ Current API |

### Phase 7.6: Git Repository ✅

- ✅ Repository initialized
- ✅ `.gitignore` created
- ✅ Initial commit with full project state

### Phase 7.7: Verification ✅

- ✅ All 11 examples compile for all 6 platforms (66 builds)
- ✅ `nimble testUnit` passes (41 unit tests)
- ✅ HTML docs regenerated
- ✅ No UFCS collisions

**Milestone:** ✅ Fully consistent, documented SDK!

---

## Phase 8: Advanced Features 🟡 PARTIAL (80% Complete)

**Goal:** Advanced productivity features, CI automation, developer experience.

### 8.1 Declarative UI Macros ✅ COMPLETE

**Location:** `src/nebble/ui/declarative.nim` (262 LOC)  
**Status:** Implemented and functional

**Features:**
- `nebbleWatchface` macro with layer DSL
- `textLayer`, `bitmapLayer` property definitions
- `tickTimer` configuration support
- Complete watchface scaffold generation

**Example:**
```nim
nebbleWatchface:
  textLayer:
    id = timeLayer
    frame = (0, 52, 144, 48)
    font = BITHAM_42_BOLD
    alignment = GTextAlignmentCenter
  tickTimer:
    unit = MINUTE_UNIT
    handler = updateTime
```

**Note:** Roadmap incorrectly listed `src/nebble/foundation/watchface.nim`.  
**Actual location:** `src/nebble/ui/declarative.nim`

### 8.2 PebbleKit JS Bridge with Type-Safe Message Keys ✅ COMPLETE

**Location:** `src/nebble/comms/typed_message.nim` (144 LOC)  
**CLI Command:** `nebble gen-keys` ✅

**Features:**
- Type-safe `send()` templates for all integer types, strings
- Type-safe `read*()` functions
- AppMessage lifecycle operations
- Callback registration helpers

**Auto-generation:** `generateMessageKeys()` in `builder.nim` parses `nebble.json`

### 8.3 GitHub Actions CI Pipeline ✅ COMPLETE

**Files:**
- `.github/workflows/ci.yml` - Full test suite
- `.github/workflows/release.yml` - Release automation

**CI Jobs:**
1. Unit tests (nimble testUnit)
2. Compile matrix for all 6 platforms
3. Example builds (nimble testExamples)
4. Aplite size gate check
5. Lint checks

### 8.4 Futhark Auto-Regeneration ✅ COMPLETE

**Location:** `src/nebble/ffi/sdk_version.nim`  
**CLI Command:** `nebble regen-ffi` ✅

**Features:**
- SDK version tracking constant
- Regeneration command for all 6 platforms
- Version checking against tracked version

### 8.5 Additional CLI Commands ✅ COMPLETE

| Command | Status | Notes |
|---------|--------|-------|
| `nebble resources` | ✅ IMPLEMENTED | Implemented in `cli/src/nebble_cli/resources.nim`; wired via `cmdResources()` in `cli/src/nebble_cli/commands.nim`. |
| `nebble doctor` | ✅ IMPLEMENTED | Implemented as `cmdDoctor()` in `cli/src/nebble_cli/commands.nim`. Performs environment and project checks. |

Implementation notes:
- The `resources` helpers live in `cli/src/nebble_cli/resources.nim` and provide `listResources()`, `addResource()`, and `validateResources()`.
- Commands are wired in `cli/src/nebble_cli/commands.nim` and routed from `cli/src/nebble.nim`.

### Phase 8 Summary

| Feature | Status | Effort | Value |
|---------|--------|--------|-------|
| Declarative UI | ✅ | Complete | High |
| JS Bridge | ✅ | Complete | High |
| CI Pipeline | ✅ | Complete | High |
| Auto-Regen | ✅ | Complete | Medium |
| CLI Commands | 🟡 | 2 missing | Low |

**Completion:** 80% (4/5 major features)

---

## Phase 9: Advanced Managed Types & Graphics 🟡 IN PROGRESS (65%)

**Goal:** ARC-managed types for memory-safe Pebble development.

### Phase 9.1: Tier 1-3 Foundation ✅ COMPLETE

**Total Managed Type Modules:** 16 (roadmap listed 15, missing window_managed)

#### Tier 1: Simple Unique Ownership (12 modules) ✅

| Module | Type | Pattern | Status |
|--------|------|---------|--------|
| `text_layer_managed.nim` | `TextLayerHandle` | `DefineUniqueHandle` | ✅ |
| `bitmap_layer_managed.nim` | `BitmapLayerHandle` | `DefineUniqueHandle` | ✅ |
| `layer_managed.nim` | `LayerHandle` | Hierarchy-aware | ✅ |
| `window_managed.nim` | `WindowHandle` | Stack-aware | ✅ |
| `animation_managed.nim` | `AnimationHandle` | State machine | ✅ |
| `gpath_managed.nim` | `GPathHandle` | `DefineUniqueHandle` | ✅ |
| `rot_bitmap_layer_managed.nim` | `RotBitmapLayerHandle` | `DefineUniqueHandle` | ✅ |
| `property_animation_managed.nim` | `PropertyAnimationHandle` | Complex lifecycle | ✅ |
| `number_window_managed.nim` | `NumberWindowHandle` | Callback storage | ✅ |
| `dictation_managed.nim` | `DictationSessionHandle` | Session lifecycle | ✅ |
| `smartstrap_managed.nim` | `SmartstrapHandle` | Connection mgmt | ✅ |

**Note:** `window_managed.nim` was implemented but not listed in original roadmap.

#### Tier 2: Hierarchy/Window-Aware (3 modules) ✅

| Module | Feature | Status |
|--------|---------|--------|
| `action_bar_managed.nim` | Attached window tracking | ✅ |
| `status_bar_managed.nim` | Window attachment safety | ✅ |
| `scroll_layer_managed.nim` | Parent layer integration | ✅ |

#### Tier 3: Complex Reference-Counted Types (4 modules) ✅

| Module | Type | Pattern | Features |
|--------|------|---------|----------|
| `bitmap_ref.nim` | `GBitmapRef` | ARC ref | Reference counting, sub-bitmaps, palette |
| `font_ref.nim` | `FontRef` | ARC ref | Font resource management |
| `bitmap_sequence_ref.nim` | `BitmapSequenceRef` | ARC ref + timer | Animated bitmaps, auto-scheduling |
| `menu_layer_managed.nim` | `MenuLayerHandle` | Unique + callbacks | 13 callbacks, closure dispatch |

**Example:** `examples/simple_menu/` demonstrates managed MenuLayer

**Known Issues:**
- 5 modules have unused import warnings (non-critical):
  - `action_bar_managed.nim:8` - unused import: 'action_bar'
  - `status_bar_managed.nim:8` - unused import: 'status_bar'
  - `scroll_layer_managed.nim:8` - unused import: 'scroll_layer'
  - `property_animation_managed.nim:9` - unused import: 'animation'
  - `util/math.nim:5` - unused import: 'ffi'


### Phase 9.2: Draw Command Managed Types ✅ COMPLETE

**Goal:** ARC-managed wrappers for vector graphics (PDC format)

| Module | Type | Status | Notes |
|--------|------|--------|------|
| `src/nebble/graphics/draw_command_image_managed.nim` | `DrawCommandImageHandle` | ✅ Implemented | Create/clone/draw/get-bounds helpers |
| `src/nebble/graphics/draw_command_sequence_managed.nim` | `DrawCommandSequenceHandle` | ✅ Implemented | Frame access, duration, bounds helpers |
| `src/nebble/graphics/text_attributes_managed.nim` | `TextAttributesHandle` | ✅ Implemented | Paging/flow helpers |

Testing:
- Added `tests/test_draw_command_managed.nim` as a compile-time smoke test.
- Added `tests/test_nim_host.cfg` and a minimal `tests/pebble_stubs.c` to allow host-side test runs without the full Pebble SDK.
- The managed modules are exported from `src/nebble.nim` for umbrella availability.

**Prerequisites:** `draw_command.nim`, `draw_command_detail.nim` exist (non-managed)

**API Design:**
```nim
proc newDrawCommandImage*(resourceId: uint32): DrawCommandImageHandle
proc draw*(h: DrawCommandImageHandle; ctx: ptr GContext; offset: GPoint)
proc bounds*(h: DrawCommandImageHandle): GRect
```

**Estimated Effort:** 10 hours  
**Example to Create:** `examples/draw_command_demo/`

### Phase 9.3: Advanced GBitmap Extensions ❌ NOT STARTED

**Goal:** Extend `bitmap_ref.nim` with advanced features

**New Functions:**
```nim
proc newBlankBitmapRef*(size: GSize; format: GBitmapFormat): GBitmapRef
proc createSubBitmapRef*(parent: GBitmapRef; subRect: GRect): GBitmapRef
proc setPalette*(bmp: GBitmapRef; palette: ptr GColor; freeOnDestroy: bool)
proc data*(bmp: GBitmapRef): ptr uint8
```

**Estimated Effort:** 6 hours  
**Example:** `examples/offscreen_render/`

### Phase 9.4: Extended Health Service ❌ NOT STARTED

**Goal:** Complete health service coverage

**Functions to Wrap:**
```nim
proc getMinuteHistory*(metric: HealthMetric; history: ptr HealthMinuteData;
                      numRecords: uint32): uint32
proc peekCurrentValue*(metric: HealthMetric): HealthValue
proc peekCurrentActivities*(): HealthActivityMask
proc metricAccessible*(metric: HealthMetric): bool
proc registerMetricAlert*(metric: HealthMetric; threshold: HealthValue;
                         handler: MetricAlertHandler)
proc cancelMetricAlert*(metric: HealthMetric)
proc anyActivitiesActive*(activityMask: HealthActivityMask): bool
proc sumAveraged*(metric: HealthMetric; timeScope: HealthServiceTimeScope): HealthValue
```

**Estimated Effort:** 6 hours  
**Example:** `examples/health_history/`

### Phase 9 Implementation Schedule

| Week | Focus | Deliverables |
|------|-------|--------------|
| Week 1 | Draw Command Types | 3 modules + draw_command_demo example |
| Week 2 | Advanced GBitmap + Health | Extended bitmap_ref + health service |
| Week 3 | Testing & Polish | All examples, full platform matrix, docs |

**Total Estimated Effort:** 22 hours

**Milestone:** 🎯 **PHASE 9 COMPLETE** when:
- All draw command types implemented (3 modules)
- GBitmap extended with advanced features (15 functions)
- Health service fully covered (17 functions)
- 3 new examples demonstrating features
- All modules pass `nimble testCompile` on all 6 platforms

---

## Current Issues & Blockers

### Issue 1: Phase 8 CLI Commands Missing (Resolved)

**Status:** RESOLVED — `nebble resources` and `nebble doctor` implemented and tested locally.
**Notes:** Remaining low-priority CLI tidy-ups (small UX improvements) may follow but there is no functional blocker.

### Issue 2: Unused Import Warnings (Very Low Priority)

**Files affected:**
- `action_bar_managed.nim:8`
- `status_bar_managed.nim:8`
- `scroll_layer_managed.nim:8`
- `property_animation_managed.nim:9`
- `util/math.nim:5`

**Impact:** VERY LOW - Warnings only, no functional issues  
**Fix:** Remove unused imports

### Issue 3: Test Highlevel Ambiguity (Low Priority)

**File:** `tests/test_highlevel.nim` (line 24)  
**Error:** `ambiguous identifier: 'BUTTON_ID_SELECT'`  
**Cause:** Collision between `constants.BUTTON_ID_SELECT` and enum variant

**Fix:** Qualify the constant: `constants.BUTTON_ID_SELECT`

---

## Module Statistics

| Category | Count | Complete |
|----------|-------|----------|
| **Total Nim Files** | 92 | 100% |
| **High-Level API** | 41 | 100% |
| **Managed Types** | 19 | 100% |
| **Reference Types** | 3 | 100% |
| **FFI Bindings** | 6 | 85% (Gabbro missing) |
| **CLI Modules** | 4 | 100% |
| **Test Files** | 4 | 100% |
| **Examples** | 11 | 100% |
| **Documentation** | 5 | 100% |

---

## API Coverage Summary

| SDK Area | Coverage | Status |
|----------|----------|--------|
| Core UI | 100% | ✅ Complete |
| Graphics | 100% | ✅ Complete |
| Animation | 100% | ✅ Complete |
| Input | 100% | ✅ Complete |
| Services | 95% | 🟡 Missing advanced health |
| Communication | 100% | ✅ Complete |
| Storage | 100% | ✅ Complete |
| Managed Types | 95% | ✅ Draw-command types implemented; advanced GBitmap & Health service pending |

---

## Updated Timeline

```
Week  1-2:   Phase 0  Feasibility + cross-compilation PoC              ✅ COMPLETE
Week  3-5:   Phase 1  Futhark project mode, generate bindings          ✅ COMPLETE
Week  5-8:   Phase 3  Build tooling                                    ✅ COMPLETE
Week  6-12:  Phase 2  High-level API (all modules)                     ✅ COMPLETE
Week  8-14:  Phase 4  Testing infrastructure                           ✅ COMPLETE
Week 12-15:  Phase 5  Docs, examples, tutorial                         ✅ COMPLETE
Week 15-16:  Phase 6  API redesign, UFCS collision fixes               ✅ COMPLETE
Week 16-17:  Phase 7  API polish, docs rewrite, examples update        ✅ COMPLETE
Week 17-18:  Phase 8  Advanced features (CI, macros, typed messages)   ✅ COMPLETE (80%)
Week 18+:    Phase 9  Managed types completion                          🟡 IN PROGRESS

MVP (Phases 0-3): ~10-14 weeks                                         ✅ ACHIEVED
v1.0 (Phases 0-6): ~15-16 weeks                                        ✅ ACHIEVED
v1.1 (Phases 0-7): ~16-18 weeks                                        ✅ ACHIEVED
v1.2 (Phases 0-8): ~18-20 weeks                                        ✅ ACHIEVED (80%)
v1.3 (Phases 0-9): ~20-26 weeks                                        🟡 PLANNED (65%)
```

---

## Conclusion

The project is in excellent shape with:
- ✅ 89 modules implemented
- ✅ 41 high-level API modules (100% coverage)
- ✅ 16 ARC-managed types for memory safety
- ✅ 11 working examples
- ✅ Comprehensive documentation
- ✅ Full test suite (41 tests passing)
- ✅ Working CLI tool
- 🟡 Phase 9 65% complete (draw command types pending)

**Total Project Completion:** ~92%

**Remaining Work:**
1. Phase 9.3: Advanced GBitmap (6 hours)
2. Phase 9.4: Extended Health Service (6 hours)
3. Small CLI UX polish and additional host-friendly test harness improvements (2 hours)

**Estimated time to v1.0 release:** 24 hours of development work

# Changelog

All notable changes to Nebble are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.1.0] - 2026-02-20

### Added

#### Sprite Sheet Support with Managed Handles
- `src/nebble/graphics/sprite.nim` - Sprite sheet module with dual API (managed + raw)
- `SpriteSheetHandle` - ARC-managed sprite sheet handle with automatic bitmap cleanup
- `AnimatedSpriteHandle` - ARC-managed animation state management
- `AnimationMode` - Loop, Once, and Ping-Pong playback modes
- Raw sprite APIs (`SpriteSheet`, `AnimatedSprite`, `SpriteFrame`) for zero-overhead performance
- `tests/test_sprite.nim` - Comprehensive tests for both managed and raw sprite APIs
- Zero-copy sprite drawing via sub-bitmaps
- Elapsed-time based animation (no `getTime()` dependency)

#### CLI Integration
- CLI source moved to `tools/nebble.nim`
- CLI binary now built automatically with `nimble build`
- Binary output: `bin/tools/nebble`

#### Content Indicator API
- `src/nebble/ui/content_indicator.nim` - Content Indicator API for scroll arrows
- `ContentIndicatorHandle` - ARC-managed handle for scroll indicators
- High-level helpers: `setupConfig()`, `configure()`, `showUp/Down()`, `hideUp/Down()`
- `ScrollLayer.addChild()` - Properly add children to scroll content with parent tracking
- `ScrollLayer.getContentIndicator()` - Get indicator for scroll layer

#### Pebble SDK 4.9.127 Support
- Updated FFI bindings for Pebble SDK 4.9.127
- **Gabbro Platform** - Pebble Round 2 (260×260 color round display)
- **Flint Platform** - Pebble 2 Duo (completes all 7 platforms)
- Platform detection templates: `isGabbro`, `isHighResRound`, `pblIfRoundOrHighResElse`
- Updated `ActionBarWidth` and `StatusBarLayerHeight` constants for all platforms

#### High-Level API Improvements
- `getLocalTime()` - Value-returning time function (pointer-free alternative to `var now = time(nil); localtime(addr now)`)
- `DrawCommandImageHandle` - ARC-managed PDC image handle with automatic cleanup via `newDrawCommandImageHandle()`
- `accel.peek()` overload - Value-returning accelerometer data returning `tuple[data: AccelData; ok: bool]`
- `setClickConfigOntoWindow(window: WindowHandle)` - Overload accepting managed `WindowHandle` directly (alternative to `.toPtr` pattern)

#### FixedString API Improvements
- Better API consistency and error handling
- Zero heap fragmentation guarantee

#### Infrastructure
- Cross-platform temp directory support using `getTempDir()`
- Multi-OS CI testing matrix (Ubuntu, macOS, Windows)

#### Examples Repository Migration
- All 13 examples moved to separate repositories:
  - [ported-examples](https://github.com/Brokezawa/ported-examples) - Official Pebble SDK examples ported to Nim (10 examples)
  - [nebble-examples](https://github.com/Brokezawa/nebble-examples) - Nebble-idiomatic examples (7 examples)
- Reduces nebble package size by ~60%
- Faster nimble installation
- Examples can evolve independently

### Changed
- **Examples Repository**: All examples moved to separate repositories
- **CLI Path**: Binary now at `bin/tools/nebble` (was `bin/nebble`)
- **FixedString API**: Improved for consistency
- **Version**: Bumped to 1.1.0
- **Test Infrastructure**: Uses CLI templates instead of example projects
- **CI Workflow**: Tests on multiple operating systems
- **Documentation**: Updated with separate example repo links and new API additions

### Fixed
- **Declarative DSL Parent Validation**: Fixed `isParentValid` logic to properly handle parent layer validation
- **textAlignment Property**: Fixed DSL support for text layer alignment property
- **ScrollLayer.addChild()**: Fixed to properly set parent tracking to prevent double-free
- **ContentIndicator.timesOut**: Fixed default from `false` to `true` to match Pebble SDK standard
- Cross-platform compatibility for test temp directories
- Windows support improvements
- Path handling in nimble tasks
- Example documentation links (now reference separate repositories)

### Removed
- `examples/` directory (moved to `ported-examples` and `nebble-examples` repositories)
- Hardcoded `/tmp/` paths (now uses `getTempDir()`)

---

## [1.0.0] - 2026-01-15

### Added

#### Foundation
- Complete FFI bindings for Pebble SDK 4.9.127 across all 7 platforms (aplite, basalt, chalk, diorite, emery, flint, gabbro)
- `nebble` CLI tool for project scaffolding and building
- `nebbleApp` and `nebbleWatchface` declarative DSL macros
- ARC-managed Handle types for all major Pebble objects:
  - `WindowHandle`, `LayerHandle`, `TextLayerHandle`, `BitmapLayerHandle`
  - `AnimationHandle`, `GPathHandle`, `ActionBarLayerHandle`
  - `ScrollLayerHandle`, `MenuLayerHandle`

#### High-Level API
- **Core UI**: Full coverage for Window, Layer, and UI component management
- **Graphics**: Idiomatic wrappers for drawing (GContext), paths (GPath), and bitmaps
- **Events**: Support for click handling, tick timers, tap detection, and system events
- **Services**: Battery, Bluetooth, Health, Accelerometer, Vibes, Storage, and more
- **Managed Types**: Robust ownership model with `hoOwned` and `hoParented` states

#### Full-Stack Development
- Declarative `nebbleApp` macro for minimal boilerplate
- Unified full-stack support: Write both watch and phone logic in Nim
- `pebble-js-app.js` equivalent generated from Nim (`src/pkjs.nim`)
- Support for AppMessage typed communication

#### Zero-Heap Architecture
- `FixedString[N]` type for heap-free string formatting
- Eliminates RAM fragmentation from repeated allocations
- Perfect for resource-constrained smartwatch development

#### Project Management
- Automatic `package.json` generation
- Cross-platform build support (Windows, macOS, Linux)
- Integrated with Pebble SDK 4.9.127
- Nimble package manager integration

#### Examples
- 13 comprehensive example applications demonstrating all major features:
  - **hello_world** - Minimal starter app
  - **accelerometer_demo** - Sensor data handling
  - **animation_demo** - Property animations
  - **battery_status** - System events
  - **comms_demo** - Full-stack communication
  - **glance_menu_demo** - App Glance integration
  - **graphics_demo** - Drawing primitives
  - **health_watchface** - Health service
  - **menu_demo** - Menu layers
  - **persist_demo** - Persistent storage
  - **vibes_demo** - Haptic feedback
  - **simple_watchface** - Minimal watchface
  - **action_bar_demo** - Action bar patterns

#### Documentation
- Comprehensive getting started guide
- Architecture overview explaining managed types and ownership
- Migration guide from C Pebble development
- Full API reference with quick reference cards
- Examples and learning paths for all skill levels

### Platform Support
- **aplite** - Pebble Classic (B&W, 144×168)
- **basalt** - Pebble Time (color, 144×168)
- **chalk** - Pebble Time Round (color, 180×180, round)
- **diorite** - Pebble 2 (B&W, 144×168)
- **emery** - Pebble Time 2 (color, 200×228)
- **flint** - Pebble 2 Duo (B&W, 144×168)

### Infrastructure
- GitHub Actions CI with matrix testing
- `nimble test` suite with unit and integration tests
- Futhark-based FFI binding generation
- Professional documentation hosted on GitHub Pages

---

## [Unreleased]

### Planned for v1.2.0
- Menu DSL (declarative macro-based menus)
- AppMessage Serialization (macro-driven object mapping)
- Worker Binary Support (background tasks)

### Planned for v1.3.0
- Framebuffer Access (safe pixel manipulation)
- Animation DSL (fluent animation builders)

---

[1.1.0]: https://github.com/Brokezawa/nebble/releases/tag/v1.1.0
[1.0.0]: https://github.com/Brokezawa/nebble/releases/tag/v1.0.0
[Unreleased]: https://github.com/Brokezawa/nebble/compare/v1.1.0...HEAD

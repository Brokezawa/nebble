# Nebble v1.1.0 Release Notes

## 🚀 Overview

Nebble v1.1.0 brings significant architectural improvements and new features focused on developer experience and code safety. This release introduces **managed sprite handles** with automatic memory management, **migrates examples to a separate repository**, and includes **CLI integration** directly into the main package.

---

## ✨ New Features

### 1. Sprite Sheet Support with Managed Handles

Zero-copy sprite management with **two API options** to suit different needs:

#### **Managed API (Safe - Recommended)**
Automatic memory management via ARC. No manual cleanup needed.

```nim
import nebble/graphics/graphics

# Create managed handle - bitmap owned automatically
var sheet = newSpriteSheetHandle(RESOURCE_ID_SPRITES, 32, 32)
var player = newAnimatedSpriteHandle(sheet, numFrames=8, frameDelay=100)

# Use in your app
if player.update(elapsedMs):
  layer.markDirty()
player.draw(ctx, playerPos)

# Both destroyed automatically when out of scope - no leaks!
```

**Features:**
- `SpriteSheetHandle`: ARC-managed sprite sheets with automatic bitmap lifecycle
- `AnimatedSpriteHandle`: Safe animation state management
- `AnimationMode`: Loop, Once, and Ping-Pong playback modes
- Zero-copy drawing using sub-bitmaps
- Elapsed-time based animation (no `getTime()` dependency)

#### **Raw API (Advanced - Zero Overhead)**
For maximum performance when you need control.

```nim
# User owns and manages all lifetimes
var bitmap = newBitmap(RESOURCE_ID_SPRITES)
var sheet = newSpriteSheet(bitmap, 32, 32)  # Stack value
var player = newAnimatedSprite(sheet.addr, 8, 100)

// Manual cleanup required
destroy(bitmap)
```

---

### 2. CLI Integration in Main Package

The `nebble` CLI tool is now **built from the main package** rather than being a separate component. This simplifies installation and ensures version consistency.

**Changes:**
- CLI source moved to `tools/nebble.nim`
- Built automatically with `nimble build`
- Binary output: `bin/tools/nebble`

---

### 3. FixedString API Improvements

Enhanced `FixedString` type for heap-free string operations:
- Better API consistency
- Improved error handling
- Zero heap fragmentation guarantee

---

### 4. Examples Repository Migration

All 13 examples have been **moved to a separate repository** to reduce package size and installation times.

**Migration Guide:**
```bash
# Old (v1.0.0):
cd nebble/examples/hello_world

# New (v1.1.0):
git clone https://github.com/Brokezawa/nebble-examples
cd nebble-examples/hello_world
```

**Why this change?**
- Reduces nebble package size by ~60%
- Faster nimble installation
- Examples can evolve independently
- Better organization

---

## 📦 Installation

```bash
nimble install nebble@1.1.0
```

---

## 🔄 Breaking Changes

1. **CLI Path Change**: The CLI binary is now at `bin/tools/nebble` instead of `bin/nebble`

2. **Examples Removed**: The `examples/` directory is no longer included in the package. Clone the separate `nebble-examples` repository for sample projects.

3. **Test Updates**: `nimble test` now uses CLI templates (`hello_world`, `simple_watchface`) instead of example projects.

4. **Sprite API**: The original sprite API (if you were using it from a pre-release) has been restructured with managed handles as the primary interface.

---

## 🧪 Testing

This release includes comprehensive testing:

- **Unit Tests**: 41 tests for macro utilities
- **Sprite Tests**: Tests for both managed and raw APIs
- **Integration Tests**: All 12 platform builds verified (6 platforms × 2 templates)
- **CI Matrix**: Ubuntu, macOS, and Windows

Run tests locally:
```bash
nimble test        # Full test suite
nimble testUnit    # Unit tests only
nimble testExample # Integration tests
nimble testSize    # Binary size checks
```

---

## 📋 Full Changelog

### Added
- `src/nebble/graphics/sprite.nim` - Sprite sheet module with dual API (managed + raw)
- `SpriteSheetHandle` - ARC-managed sprite sheet handle
- `AnimatedSpriteHandle` - ARC-managed animation handle
- `src/nebble/ui/content_indicator.nim` - Content Indicator API for scroll arrows
- `ContentIndicatorHandle` - ARC-managed handle for scroll indicators
- High-level helpers: `setupConfig()`, `configure()`, `showUp/Down()`, `hideUp/Down()`
- `ScrollLayer.addChild()` - Properly add children to scroll content
- `ScrollLayer.getContentIndicator()` - Get indicator for scroll layer
- `tests/test_sprite.nim` - Comprehensive tests for sprite functionality
- Cross-platform temp directory support using `getTempDir()`
- Multi-OS CI testing matrix (Ubuntu, macOS, Windows)

### Changed
- **CLI Integration**: Merged CLI into main package (`tools/nebble.nim`)
- **FixedString API**: Improved heap-free string operations
- **Version**: Bumped to 1.1.0
- **Test Infrastructure**: Uses CLI templates instead of example projects
- **CI Workflow**: Tests on multiple operating systems
- **Documentation**: Updated ROADMAP with clear release schedule

### Removed
- `examples/` directory (moved to separate repository)
- Hardcoded `/tmp/` paths (now uses `getTempDir()`)

### Fixed
- **Declarative DSL Parent Validation**: Fixed `isParentValid` logic to properly handle parent layer validation
- **textAlignment Property**: Fixed DSL support for text layer alignment property
- **ScrollLayer.addChild()**: Fixed to properly set parent tracking to prevent double-free
- **ContentIndicator.timesOut**: Fixed default from `false` to `true` to match Pebble SDK standard
- Cross-platform compatibility for test temp directories
- Windows support improvements
- Path handling in nimble tasks

---

## 🗺️ Roadmap

**v1.2.0** (Next) - Developer Experience:
- Menu DSL (declarative macro-based menus)
- AppMessage Serialization (macro-driven object mapping)

**v1.3.0** (Future) - Advanced Features:
- Framebuffer Access (safe pixel manipulation)
- Animation DSL (fluent animation builders)

See [ROADMAP.md](docs/ROADMAP.md) for full details.

---

## 📝 Commit History

This release includes the following key commits:

- `7047c29` - Release v1.1.0: Sprite Sheets with Managed Handles and Examples Migration
- `9e39532` - feat: migrate examples to separate repository (v1.1.0)
- `006460c` - refactor: merge CLI into main package and improve FixedString API

---

## 👏 Contributors

Thanks to everyone who contributed to this release!

- Brokezawa (maintainer)
- Community contributors

---

## 📄 License

MIT License - See LICENSE file for details.

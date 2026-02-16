# Nebble Roadmap

**Status:** v1.0.0 Release Candidate
**Last Updated:** February 12, 2026

## ✅ Completed Milestones

### Phase 1: Foundation (v0.1)
- [x] **FFI Bindings**: Generated bindings for all 6 Pebble platforms (Aplite, Basalt, Chalk, Diorite, Emery, Flint) using Futhark.
- [x] **Build System**: `nebble` CLI tool for project scaffolding, cross-compilation, and `.pbw` generation.
- [x] **Platform Support**: Verified compilation on all platforms.

### Phase 2: High-Level API (v0.5)
- [x] **Core UI**: Managed handles for `Window`, `TextLayer`, `BitmapLayer`, `Layer`.
- [x] **Graphics**: `GContext`, `GBitmap` (with ref counting), `GPath`, `GFont`.
- [x] **Events**: Services for `TickTimer`, `Battery`, `Accel`, `Compass`, `Connection`, `Health`.
- [x] **Input**: `ClickConfig`, `Dictation`.
- [x] **Storage**: Persistent storage wrapper.
- [x] **Communication**: AppMessage and AppSync wrappers.

### Phase 3: Advanced Features (v0.8)
- [x] **Declarative UI**: `nebbleWatchface` macro for DSL-style UI construction.
- [x] **Type-Safe Messaging**: `gen-keys` command and typed message helpers.
- [x] **Managed Types**: Transitioned all APIs to ARC-managed handles (`*Handle` types) to prevent memory leaks and double-frees.
- [x] **Draw Commands**: Support for PDC vector graphics.

### Phase 4: Polish & Release (v1.0)
- [x] **API Consolidation**: Merged managed and unmanaged APIs into a single idiomatic interface.
- [x] **Documentation**: Comprehensive guides, migration docs, and API reference.
- [x] **Examples**: 11 working examples covering all major features (AppMessage, Glance, Menu, Sensors).
- [x] **Hardening**: Evaluated and implemented OOM checks, null guards, and stack-allocated group procs.
- [x] **Release**: v1.0 complete and stable.

---

## 🚀 Future Roadmap (v1.1+)

### 1. Advanced Graphics (Evaluated)
- [ ] **Framebuffer Access**: Safe wrapper around `captureFrameBuffer` with bit-packing logic for 1/2/4-bit formats (Complexity: Medium).
- [ ] **Animation Helpers**: Fluent DSL builders for complex sequences (Complexity: Medium).
- [ ] **Sprite Sheet**: Zero-copy sprite management using `createAsSubBitmap` (Complexity: Low).

### 2. Developer Experience
- [ ] **Hot Reloading**: Experimental support for hot reloading code (via AppMessage injection or partial updates) on emulator.
- [ ] **Emulator Integration**: Better integration with QEMU management from `nebble` CLI.
- [ ] **AppMessage Serialization**: Macro-driven object mapping to/from `DictionaryIterator` for type-safe communication.
- [ ] **Adaptive DSL Layouts**: Built-in support in `nebbleApp` for automatically responding to `UnobstructedArea` (Quick View) events.

### 3. Ecosystem
- [ ] **Package Registry**: Central repository for Nebble libraries (UI components, drivers).
- [ ] **Unified Nim Full-Stack**: Support for writing phone-side JavaScript logic (`pebble-js-app.js`) in Nim, allowing type sharing between watch and phone.

### 4. Hardware
- [ ] **Rebble Web**: Integration with Rebble Web services for timeline and configuration.
- [ ] **Bangle.js Port**: Experimental backend for Bangle.js (JS-based) using Nim JS backend? (Long term).

---

## Known Limitations

- **No Garbage Collection**: We use ARC/ORC. Cycle collection is disabled. Reference cycles will leak memory.
- **Closures in Callbacks**: Pebble C SDK does not support environment pointers for callbacks. You cannot use capturing closures for event handlers (use `{.cdecl.}` global procs).
- **Stdlib**: Only a subset of Nim's stdlib is available (math, strutils, etc.). OS interactions are not supported.

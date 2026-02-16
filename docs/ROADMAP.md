# Nebble Roadmap

**Status:** v1.0.0 Release
**Last Updated:** February 16, 2026

## ✅ Completed Milestones

### Phase 1: Foundation
- [x] **FFI Bindings**: Generated bindings for all 6 Pebble platforms.
- [x] **Build System**: `nebble` CLI tool for project management.
- [x] **Platform Support**: Verified compilation on all platforms.

### Phase 2: High-Level API
- [x] **Core UI**: Managed handles for all Layer types.
- [x] **Graphics**: Idiomatic wrappers for drawing and paths.
- [x] **Events**: Coverage for all Pebble event services.
- [x] **Managed Types**: Robust ownership model (`hoOwned`, `hoParented`).

### Phase 3: Polish & Hardening
- [x] **Declarative DSL**: Powerful `nebbleApp` macro for minimal boilerplate.
- [x] **Zero-Heap Architecture**: `FixedString` and heap-free formatting.
- [x] **Stability**: OOM guards, nil safety, and release-mode hardening.
- [x] **Validation**: 11 core examples covering the entire SDK.

---

## 🚀 Future Roadmap (v1.1+)

### 1. Advanced Graphics
- [ ] **Framebuffer Access**: Safe iterator for direct pixel manipulation (Complexity: Medium).
- [ ] **Animation DSL**: Fluent builders for complex sequences (Complexity: Medium).
- [ ] **Sprite Sheet**: Zero-copy sprite management helper (Complexity: Low).

### 2. Developer Experience
- [ ] **Emulator Integration**: Improved QEMU process management from CLI.
- [ ] **VS Code Extension**: Syntax highlighting and snippets.
- [ ] **AppMessage Serialization**: Macro-driven object mapping.

### 3. Ecosystem
- [ ] **Unified Nim Full-Stack**: Support for writing `pebble-js-app.js` in Nim.
- [ ] **Package Registry**: Central repository for community components.

---

## Known Limitations

- **No Garbage Collection**: Cycle collection is disabled; manual management of reference cycles is required.
- **Callbacks**: All handlers must be `{.cdecl.}` global procedures.
- **Stdlib**: Only non-syscall modules are supported in device code.

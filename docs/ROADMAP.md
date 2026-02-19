# Nebble Roadmap

**Status:** v1.0.0 Release
**Last Updated:** February 16, 2026

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

## 🚀 Future Roadmap (v1.1+)

### 1. Advanced Graphics
- [ ] **Framebuffer Access**: Safe iterator for direct pixel manipulation (Complexity: Medium).
- [ ] **Animation DSL**: Fluent builders for complex sequences (Complexity: Medium).
- [ ] **Sprite Sheet**: Zero-copy sprite management helper (Complexity: Low).

### 2. Developer Experience
- [ ] **Emulator Integration**: Improved QEMU process management from CLI.
- [ ] **AppMessage Serialization**: Macro-driven object mapping.
- [ ] **Menu DSL**: Declarative macro-based menu definition that hides pointer arithmetic (Complexity: Medium). Currently requires `addr menuSections[0]` which breaks high-level API abstraction.

### 3. Ecosystem
- [ ] **Examples Repository**: Separate repository for example projects to reduce package size and improve organization.
- [ ] **Package Registry**: Central repository for community components.
- [ ] **Cloud Build**: Web-based build service integration.

---

## Known Limitations

- **No Garbage Collection**: Cycle collection is disabled; manual management of reference cycles is required.
- **Callbacks**: All handlers must be `{.cdecl.}` global procedures.
- **Stdlib**: Only non-syscall modules are supported in device code.

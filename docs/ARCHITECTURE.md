# Nebble Architecture

This document describes the internal architecture of the Nebble wrapper and how it enables developing Pebble smartwatch applications using Nim.

## 1. Architectural Overview

Nebble is built on a **two-layer design** that bridges the gap between the low-level Pebble C SDK and idiomatic Nim.

### Layer 1: Low-Level FFI (`nebble/ffi`)
This layer provides a 1:1 mapping of the Pebble C API.
- **Generation:** Uses [Futhark](https://github.com/arnetheduck/futhark) to parse Pebble SDK headers and generate Nim bindings.
- **Conventions:** Preserves C naming (`snake_case`) and semantics.
- **Platform Specifics:** Contains six generated modules (`ffi/generated/basalt.nim`, etc.), one for each hardware platform.
- **Multiplexing:** The top-level `ffi.nim` uses compile-time switches (`-d:pebbleBasalt`) to export the correct platform bindings.

### Layer 2: High-Level Idiomatic API (`nebble/*`)
This layer wraps the FFI in Nim-friendly abstractions.
- **Naming:** Uses Nim `camelCase`.
- **Patterns:** Replaces manual function calls with object methods and property-style accessors (e.g., `layer.frame = rect`).
- **Safety:** Employs managed handles (via ARC) to prevent common C errors like type-mismatch or null pointer dereferences.

---

## 2. Memory Management (The Managed System)

The most significant technical challenge in wrapping the Pebble SDK is its manual memory management (`_create` and `_destroy` pairs) in a 24KB-256KB RAM environment.

### ARC-Based Handles
Nebble uses Nim's **ARC (Automatic Reference Counting)** memory management. We implement "Managed Handles" using an ownership-aware object model:

1. **Internal Structure:** Handles (e.g., `TextLayerHandle`) are defined as `DefineUniqueHandle` types containing:
   - `pRaw`: The underlying C pointer to the SDK resource.
   - `ownership`: A `HandleOwnership` enum (`hoOwned`, `hoParented`, `hoUnowned`).
2. **Destructors:** We implement the `=destroy` hook. Nim calls this automatically when a handle goes out of scope or is reassigned. The destructor only calls the C `_destroy` function if `ownership == hoOwned`.
3. **Move Semantics:** Copying is disabled via `{.error.}` on `=copy`, ensuring unique ownership of UI resources. Reassignment performs a `=sink` which transfers ownership and invalidates the source.

### Hierarchy & Ownership Lifecycle
Pebble's UI system is hierarchical: destroying a parent Layer automatically destroys its children. To prevent **double-free errors**, Nebble handles automatically transition through ownership states:
- **`hoOwned`**: The handle is responsible for calling C `_destroy`.
- **`hoParented`**: The layer has been added to a parent (via `addChild` or insertion). The SDK now manages its memory; Nim's destructor will skip the C `_destroy` call.
- **`hoUnowned`**: A transient wrapper around a system-provided pointer (like `window.rootLayer`). It will never be destroyed by Nim.

When a layer is removed from its parent, the handle automatically transitions back to `hoOwned`, ensuring it isn't leaked.

---

## 3. The Build Pipeline

Nebble doesn't just provide a library; it provides an intelligent compilation pipeline via the `nebble` CLI.

1. **Nim Phase:**
   - **Watch:** `nim c --os:any --cpu:arm --mm:arc --compileOnly ...` compiles Nim to C source files.
   - **Phone:** `nim js -d:release ...` compiles `src/pkjs.nim` to JavaScript.
   - Cross-compilation flags are used to target the ARM Cortex-M architecture without a standard OS.
2. **Bridge Phase:** 
   - The CLI generates a unified `package.json` (replacing the legacy `appinfo.json`) that lists all target platforms.
   - Nim-generated C files are segregated into platform-specific subdirectories (e.g., `src/c/aplite/`, `src/c/basalt/`) to allow for distinct platform-specific optimizations and defines.
3. **Pebble Phase:** `pebble build`
   - The Pebble SDK's `waf` build system takes over.
   - Because all target platforms are defined in one manifest and sources are segregated, a single `pebble build` command produces a unified `.pbw` bundle.
   - This bundle contains the binaries and resources for all requested hardware platforms.

---

## 4. Metaprogramming & Scaffolding

### The `nebbleApp` Macro
To remove C boilerplate (entry point, window creation, event loop), Nebble uses a powerful macro that generates the entire app skeleton. Key features include:
- **Responsive Layout:** Supports `fullWidth`, `fullHeight`, `x=center`, and `y=center` which calculate coordinates at runtime relative to the parent layer's bounds.
- **Initialization Order:** Ensures the window is pushed to the stack *before* the user's `init:` block runs, making all UI components available for manipulation immediately.
- **Runtime Init:** Explicitly handles `NimMain()` and provides the necessary `_exit` stubs for the ARM toolchain.

### Heap-Free Strings (`FixedString`)
Since `TextLayer` doesn't copy the string it displays, and heap allocations are expensive/dangerous on Pebble, Nebble provides a `FixedString[N]` type and an `f` macro for safe, stack-based formatting:
1. **Zero Allocation:** All string operations happen within a pre-allocated stack buffer.
2. **Safety:** The `f` macro provides `fmt`-like convenience while ensuring bounds-checking and null-termination.
3. **Storage Integration:** The persistent storage API (`storage.read`) natively supports `FixedString` for safe data loading.

---

## 5. Platform Abstraction

Pebble hardware varies significantly (B&W vs. Color, Rectangular vs. Round). Nebble handles this using Nim's `when` statement:

```nim
# Type-safe platform detection
when declared(GColorRed):
  # This block is only compiled for Basalt, Chalk, Emery
  textLayer.textColor = GColorRed
```

Because `when` is evaluated at compile-time, features not supported on a platform (like the Microphone or Heart Rate Monitor) result in **zero code weight** on platforms that don't have them (like Aplite).

---

## 6. Technical Limitations

- **No GC:** Nebble uses ARC/ORC. Cycle collection is disabled by default to save RAM.
- **No Stdlib Syscalls:** Nim's standard library functions that require OS syscalls (files, network, standard I/O) are unavailable. Use Pebble-specific alternatives (e.g., `storage` for files).
- **Callbacks:** All callbacks passed to the SDK must be marked `{.cdecl.}` and cannot be closures, as the C SDK does not support environment pointers.

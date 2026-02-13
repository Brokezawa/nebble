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
- **Safety:** Employs distinct types and managed handles to prevent common C errors like type-mismatch or null pointer dereferences.

---

## 2. Memory Management (The Managed System)

The most significant technical challenge in wrapping the Pebble SDK is its manual memory management (`_create` and `_destroy` pairs) in a 24KB-256KB RAM environment.

### ARC-Based Handles
Nebble uses Nim's **ARC (Automatic Reference Counting)** memory management. We implement "Managed Handles" using the following pattern:

1. **Distinct Types:** Handles are defined as `distinct ptr T`.
2. **Destructors:** We implement the `=destroy` hook. When a handle goes out of scope or is reassigned, Nim automatically calls the corresponding C `_destroy` function.
3. **Move Semantics:** Copying is disabled via `{.error.}` on `=copy`, ensuring unique ownership of UI resources.

### Hierarchy Awareness
Pebble's UI system is hierarchical: destroying a parent Layer automatically destroys its children. To prevent **double-free errors**, Nebble's `LayerHandle` tracks its parent state:
- If a layer has a parent, the destructor skips calling `layer_destroy`.
- If a layer is orphaned, the destructor cleans up the memory.

---

## 3. The Build Pipeline

Nebble doesn't just provide a library; it provides a compilation pipeline via the `nebble` CLI.

1. **Nim Phase:** `nim c --os:any --cpu:arm --mm:arc --compileOnly ...`
   - Nim compiles the code into C source files.
   - Cross-compilation flags are used to target the ARM Cortex-M architecture without a standard OS.
2. **Bridge Phase:** The CLI copies the generated C files into the `src/c/` directory of a standard Pebble project structure.
3. **Pebble Phase:** `pebble build`
   - The Pebble SDK's `waf` build system takes over.
   - It compiles the generated C files using the Pebble ARM GCC toolchain and links them against the Pebble OS object libraries.
   - Resources (images, fonts) are bundled into the final `.pbw`.

---

## 4. Metaprogramming & Scaffolding

### The `pebbleApp` Macro
To remove C boilerplate (entry point, window creation, event loop), Nebble uses a powerful macro that generates the entire app skeleton at compile-time based on provided handlers.

### The `staticText` Template
Since `TextLayer` doesn't copy the string it displays, using dynamic Nim strings is dangerous (they might be freed while the layer still points to them). 
The `staticText` template:
1. Validates a module-level buffer exists.
2. Safely copies the dynamic Nim string into the static C-compatible buffer.
3. Updates the `TextLayer` pointer.

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

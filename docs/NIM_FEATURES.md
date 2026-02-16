# Nim Features for Pebble Development

Nim provides several significant advantages over C for developing Pebble smartwatch applications. This document outlines why Nim is an excellent choice for Pebble development and how it improves safety, productivity, and performance.

## 1. Safety and Memory Management

### Managed Handles (RAII)
Pebble apps operate in extremely resource-constrained environments (24KB to 256KB RAM). Manual memory management in C often leads to leaks. Nebble uses Nim's **ARC (Automatic Reference Counting)** and destructor hooks to provide "Managed Handles":
- **Deterministic Destruction**: Memory is freed as soon as a handle goes out of scope.
- **Ownership Model**: Handles explicitly track state via the `HandleOwnership` enum:
    - **hoOwned**: Handle owns the resource and will call C destroy.
    - **hoParented**: Resource is owned by a parent (e.g. Layer added to Window). Handle will skip destroy.
    - **hoUnowned**: Transient wrapper for system-managed pointers.
- **Move Semantics**: Handles are unique; they cannot be copied, only moved.
- **No Manual Free**: You never need to call `window_destroy()`. Nim does it for you.

### Zero-Heap Architecture
Nebble is designed to minimize or eliminate heap allocations during runtime. This prevents RAM fragmentation and ensures your app stays within the strict 24KB limit of some Pebble models.

**Key Components:**
- **FixedString[N]**: Replaces dynamic strings with stack-allocated buffers.
- **f Macro**: Heap-free string formatting.
- **ARC/ORC**: Deterministic memory management without GC pauses.

For more details on performance optimization, see [Zero-Heap Performance](HEAP_FREE.md).

### Type Safety
Nim's strong type system prevents many common C errors:
- **Distinct Types**: `LayerHandle` and `WindowHandle` are distinct types. You cannot accidentally pass a Window to a function expecting a Layer.
- **Nil Safety**: While Pebble SDK relies on pointers, Nebble's handles include safety checks (`checkValid`) to catch use-after-free or null access during development.

## 2. Expressive Syntax and Modern Features

### Declarative UI (nebbleApp DSL)
Nebble provides a powerful macro-based DSL that eliminates 90% of Pebble boilerplate. It allows you to define windows, layers, and event handlers in a single expressive block.

**Key Features:**
- **Boilerplate Removal**: Automatically handles global variables, window creation, and destruction.
- **Responsive Layout**: Support for `fullWidth`, `center`, and dynamic coordinate calculation.
- **Safety**: Enforces correct initialization order to prevent null-pointer crashes.

For a detailed guide, see [Declarative DSL](DECLARATIVE_DSL.md).

### Dot-Syntax and Properties
While Pebble SDK is C-based, Nebble wraps it in Nim's dot-syntax and property-style accessors:
```nim
# Nim style
window.backgroundColor = GColorBlack
textLayer.text = "Hello"

# vs C style
window_set_background_color(window, GColorBlack);
text_layer_set_text(text_layer, "Hello");
```

## 3. High-Level Performance

### Zero-Cost Abstractions
Nim compiles directly to C. Most of Nebble's high-level wrappers are marked `{.inline.}`, meaning they result in the exact same C code as if you had written it manually. You get high-level syntax with low-level performance.

### Conditional Compilation
Nim's `when` statement is a type-safe version of `#ifdef`. It allows for powerful platform-specific optimizations:
```nim
when defined(pebbleColor):
  # Only compiled for color platforms (Basalt, Chalk, etc.)
  textLayer.backgroundColor = GColorBlue
else:
  # Only compiled for B&W platforms (Aplite, Diorite)
  textLayer.backgroundColor = GColorWhite
```

## 4. Better Development Experience

### Standard Library (Pebble-Safe)
Nim provides a modern standard library for bit manipulation, math, and string operations. Nebble ensures that only "Pebble-safe" modules (those not requiring syscalls) are used in device code.

### Error Handling
Instead of relying on error codes, Nim encourages safe patterns. While exceptions are disabled on Pebble for size, Nim's `doAssert` provides robust checks that are stripped in release builds, ensuring maximum performance.

---

By using Nim, Pebble developers can focus on building features rather than managing memory and fighting pointers, all while targeting the same tiny hardware with binary sizes often identical to C.

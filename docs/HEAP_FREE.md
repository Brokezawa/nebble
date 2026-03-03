# Zero-Heap Architecture

Nebble is engineered for maximum stability and performance on Pebble's extremely limited hardware (as little as 24KB RAM on Aplite). A core pillar of this design is the **Zero-Heap Architecture**.

## The Problem with the Heap

In a typical Nim or C application, dynamic strings and sequences are allocated on the **heap** using `malloc`. On Pebble, this presents several risks:
1. **Fragmentation**: Frequent allocations and deallocations of small strings can fragment the tiny RAM, eventually leading to allocation failures even if total free RAM is sufficient.
2. **Predictability**: Heap allocations can fail at runtime. In an embedded watchface, a crash due to an out-of-memory (OOM) error is a poor user experience.
3. **Performance**: Allocating and freeing memory takes CPU cycles, which impacts battery life and UI responsiveness.

## The Nebble Solution

Nebble provides high-level abstractions that look and feel like modern Nim but operate entirely on the **stack** or in **static storage**.

### 1. `FixedString[N]`

Instead of the dynamic `string` type, Nebble uses `FixedString[N]`. This is a stack-allocated buffer with a fixed maximum capacity.

```nim
var msg: FixedString[32] # 32 bytes pre-allocated on the stack
```

### 2. The `f` (Format) Macro

To format strings without `sprintf` or Nim's `$` (which allocates), Nebble provides the `f` macro. It performs type-to-string conversion at runtime into the fixed buffer.

```nim
var count = 42
var status: FixedString[32]

status.f("Steps: ", count, "!") # Zero heap usage!
textLayer.text = status         # Sets the layer text safely
```

### 3. Managed Handles (ARC)

Nebble uses Nim's **ARC (Automatic Reference Counting)**. Unlike a traditional Garbage Collector, ARC doesn't have a "stop-the-world" phase or a background thread. It inserts deterministic `free`/`destroy` calls at compile-time. Combined with our **Ownership Model**, this ensures that even when we *do* use heap (like for `AppSync` buffers), the cleanup is instant and predictable.

### 4. Static Data over sequences

Nebble APIs are audited to avoid `seq[T]`. Where Pebble requires arrays of data (like for `Animation` groups or `VibePattern` durations), Nebble uses stack-allocated arrays or `varargs` that compile down to C arrays.

## Best Practices for Developers

To maintain the performance benefits of Nebble, follow these rules:

1. **Avoid `$`**: The stringification operator in Nim usually allocates a new `string`. Use `str.f(...)` instead.
2. **Avoid `&`**: Concatenating strings (`"a" & "b"`) always allocates.
3. **Use `cstring` for Literals**: Static strings like `"Hello"` are zero-cost.
4. **Prefer `FixedString` for Dynamic UI**: If your text changes (e.g., a clock or step counter), use `FixedString`.

By following these patterns, your Nebble app will have a perfectly flat memory profile, zero fragmentation, and maximum battery efficiency.

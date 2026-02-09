# AGENTS.md — Nebble (Nim + Pebble SDK)

Nim wrapper for the Pebble smartwatch SDK. Two-layer architecture: low-level
FFI bindings (Futhark-generated, committed to VCS) + future high-level
idiomatic Nim API on top.

## Project Layout

```
nebble.nimble                     # Package metadata (nim >= 2.2.0, futhark >= 0.15.0)
src/nebble/ffi.nim                # Platform selector — includes correct generated/*.nim + macros.nim
src/nebble/ffi/generate.nim       # Futhark generator (run on HOST, not cross-compiled)
src/nebble/ffi/macros.nim         # Manual Nim replacements for C macros Futhark cannot wrap
src/nebble/ffi/generated/*.nim    # ~10k-line generated bindings per platform (DO NOT hand-edit)
src/nebble/ffi/stubs/             # Stub headers for build-generated .auto.h files
tests/test_ffi.nim                # Compile-only verification test
tests/nim.cfg                     # Cross-compilation flags for tests
poc/                              # Phase 0 proof-of-concept (manual importc)
```

## Build & Test Commands

### Compile the test (single test — primary verification)

```bash
nim c tests/test_ffi.nim
```

This cross-compiles to C for ARM (`--compileOnly`). There is no runtime test
suite — the target is bare-metal Pebble hardware. A successful `nim c` means
the bindings are valid.

### Compile for a specific platform

Default is basalt. Override with `-d:pebble<Platform>`:

```bash
nim c -d:pebbleAplite tests/test_ffi.nim
nim c -d:pebbleChalk  tests/test_ffi.nim
```

Valid flags: `-d:pebbleAplite`, `-d:pebbleBasalt`, `-d:pebbleChalk`,
`-d:pebbleDiorite`, `-d:pebbleEmery`, `-d:pebbleFlint`.

### Regenerate FFI bindings (requires Futhark + libclang on host)

```bash
# Single platform
nim r -d:futharkRebuild -d:opirRebuild -d:platform=basalt src/nebble/ffi/generate.nim

# All platforms
for p in aplite basalt chalk diorite emery flint; do
  nim r -d:futharkRebuild -d:opirRebuild -d:platform=$p src/nebble/ffi/generate.nim
done
```

After regeneration, remove `from os import parentDir` from each generated file
— it breaks `--os:any` cross-compilation.

### Full Pebble build (end-to-end .pbw)

1. `nim c --compileOnly` your app
2. Copy `nimcache/*.c` + `nimbase.h` into a Pebble project's `src/c/`
3. `pebble build` (uses Waf + ARM GCC)
4. `pebble install --emulator basalt`

The Pebble project's `wscript` must add `-w` to CFLAGS to suppress warnings
from Nim-generated C code (Pebble uses `-Werror`).

### Debugging crashes on emulator

**IMPORTANT:** The Pebble emulator can enter a corrupted state after a crash.
Symptoms include:
- Subsequent `pebble install` commands succeed but the app continues to crash
- Fixed code still crashes even though the build completed successfully
- The crash appears to persist despite code changes

**Solution:** After any crash, kill and restart the emulator completely before
testing new builds. Do not reuse a running emulator instance that experienced
a crash.

**Recommended debugging workflow:**
1. Make your code change
2. `pebble build && pebble clean`
3. **Kill the emulator completely** (don't reuse running instance)
4. `pebble install --emulator basalt` (starts fresh emulator)
5. Test the new build

Without step 3, you may be testing corrupted emulator state rather than your
actual code changes.

### Linting / Formatting

No linter or formatter is configured. Follow the style conventions below.

## Cross-Compilation Flags

All Nim compilation targeting Pebble uses these flags (set in `tests/nim.cfg`):

```
--os:any --cpu:arm --mm:arc -d:useMalloc --noMain
--compileOnly -d:noSignalHandler --threads:off -d:danger
```

## Code Style

### Naming Conventions

| Layer | Convention | Examples |
|-------|-----------|----------|
| FFI (generated) | C `snake_case` preserved exactly | `window_create`, `text_layer_set_text` |
| Macro supplements | `camelCase`, `make` prefix for constructors | `makeGPoint`, `makeGRect`, `makeUuid` |
| Constants | `UPPER_SNAKE_CASE` matching C SDK | `BUTTON_ID_SELECT`, `TRIG_MAX_ANGLE` |
| Platform flags | `camelCase` with `pebble` prefix | `-d:pebbleBasalt`, `-d:pebbleAplite` |
| Reserved word renames | Append `_f` suffix | `type` → `type_f`, `from` → `from_f` |

### Exports and Visibility

- All public symbols use the `*` export marker.
- Internal helpers omit `*`.

### Pragmas

- `{.inline.}` — convenience wrappers and templates.
- `{.cdecl.}` — all callback procs passed to Pebble C functions.
- `{.exportc, cdecl.}` — `main()` entry point only.
- `{.importc, header: "pebble.h".}` — only in the old PoC; new code uses Futhark bindings.
- `{.warning.}` — for features expensive on Aplite (24 KB RAM).

### Callbacks

Never use Nim closures at the FFI boundary. All callbacks must be
`{.cdecl.}` proc types (no captured environment).

### Templates vs Macros

- Use `template` for simple inline expansions and constants.
- Use `macro` when you need `varargs[untyped]` (e.g., `APP_LOG`).
  Nim templates do not support true varargs — this was a bug fix.

### Doc Comments

Use `##` doc comments. Reference the equivalent C macro/function name:

```nim
template makeGPoint*(x, y: int16): GPoint =
  ## Equivalent to C macro `GPoint(x, y)`.
  GPoint(x: x.cshort, y: y.cshort)
```

### Section Organization

Use banner comments to delimit sections in longer files:

```nim
# ============================================================================
# Geometry Constructors
# ============================================================================
```

### Imports

- Use `import` for modules (e.g., `import nebble/ffi`).
- Use `include` for generated platform files (they are meant to be textually included).
- Never add `from os import ...` in generated or cross-compiled files — breaks `--os:any`.

### Types

- Use Nim's C-compatible types at the FFI boundary: `cint`, `cshort`, `cushort`,
  `cuint`, `uint8`, `int16`, `uint16`, `int32`, `uint32`.
- Use `ptr T` for C pointer parameters, never Nim `ref`.
- `when not declared(...)` guards for symbols that may already exist in
  generated bindings (e.g., `TRIG_MAX_ANGLE`).

### Error Handling

Pebble SDK functions return `NULL` pointers or status codes on failure.
Check return values; do not raise Nim exceptions (no exception support
with `--os:any`).

### Memory

- No hidden heap allocations. ARC (`--mm:arc`) with `-d:useMalloc`.
- Aplite has only 24 KB RAM. Use `{.warning.}` pragmas on features
  that are expensive or unavailable on Aplite.
- Pebble manages most object lifetimes (`*_create` / `*_destroy` pairs).

## Generated Bindings — Do Not Hand-Edit

Files in `src/nebble/ffi/generated/` are machine-generated by Futhark.
Do not edit them manually. If the C API changes, re-run the generator
and remove the `from os import parentDir` line from each output file.

The generated files are committed to VCS so end users do not need
Futhark or libclang installed.

## Platform Differences

| Feature     | aplite | basalt | chalk | diorite | emery | flint |
|-------------|--------|--------|-------|---------|-------|-------|
| Color       | No     | Yes    | Yes   | No      | Yes   | No    |
| Round       | No     | No     | Yes   | No      | No    | No    |
| Health      | Stub   | Real   | Real  | Real    | Real  | Real  |
| Microphone  | No     | Yes    | Yes   | Yes     | Yes   | Yes   |
| Smartstrap  | No     | Yes    | Yes   | Yes     | Yes   | No    |
| Display     | 144x168| 144x168| 180x180| 144x168| 200x228| 144x168|

Aplite generated bindings are ~134 lines shorter (fewer APIs).
Use compile-time `when defined(pebble*)` checks for platform-specific code.

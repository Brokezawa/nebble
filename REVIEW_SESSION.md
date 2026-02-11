# Code Review: ARC Managed Modules (Session Summary)

## Review Date: February 2026
## Modules Reviewed:
- `src/nebble/graphics/bitmap_sequence_ref.nim` (NEW)
- `src/nebble/ui/menu_layer_managed.nim` (NEW)
- `examples/simple_menu/` (NEW)

---

## 1. Code Quality Assessment

### 1.1 BitmapSequenceRef (`bitmap_sequence_ref.nim`)

**Strengths:**
- ✅ Follows established patterns from `bitmap_ref.nim` for reference-counted types
- ✅ Proper separation of object type and ref type with destructor immediately after object
- ✅ Consistent naming conventions (`newBitmapSequenceRef`, `wrapBitmapSequence`)
- ✅ Proper inline pragmas for zero-overhead accessors
- ✅ Comprehensive null-checking in all accessor methods
- ✅ Timer cancellation in destructor prevents dangling timer callbacks
- ✅ Clear documentation and usage examples

**Issues Found:**
- ⚠️ **Missing nil check in `internalBitmapSeqTimer`**: The trampoline casts `ctx` to `BitmapSequenceRef` but doesn't verify the ref object itself is valid after cast
- ⚠️ **Timer pointer not cleared on manual cancel**: If user calls `scheduleNextFrame` again before timer fires, old timer is canceled but new timer may race
- ⚠️ **No play count tracking**: The `playCount` property doesn't track actual remaining plays

**Recommendations:**
1. Add `if h == nil: return` after cast in `internalBitmapSeqTimer`
2. Consider using a timer ID instead of pointer for safer comparison
3. Add documentation about thread safety (timers are single-threaded on Pebble)

### 1.2 MenuLayerManaged (`menu_layer_managed.nim`)

**Strengths:**
- ✅ Comprehensive callback coverage (all 11 MenuLayerCallbacks fields)
- ✅ Proper use of `ref object` for callback wrapper to keep closures alive
- ✅ C-cdecl trampolines match FFI signatures exactly
- ✅ Proper `=destroy`, `=wasMoved`, `=sink`, `=copy` hooks for unique ownership
- ✅ Nil checks in all trampolines prevent crashes on missing callbacks
- ✅ Helper constructor `newMenuLayerCallbacks` for ergonomic API
- ✅ Converter to/from raw pointer for C interop

**Issues Found:**
- ⚠️ **Field copying in `setCallbacks` incomplete**: Only copies first 5 fields, missing the 8 new Tier-3 fields (getHeaderHeight, drawHeader, etc.)
- ⚠️ **Missing nil check for `h.callbacks` in trampolines**: If wrapper is freed but menu still calls back, could access freed memory
- ⚠️ **No protection against double-registration**: Calling `setCallbacks` twice leaks the first wrapper (only nil'd, not freed)
- ⚠️ **Converter `toHandle` creates incomplete handle**: Raw pointer wrapper has no callbacks set up

**Recommendations:**
1. Fix field copying to include all 13 callback fields
2. Add `isNil` check after cast in trampolines
3. Use `reset` or explicit dealloc before replacing callbacks
4. Document that `toHandle` is for advanced use only

### 1.3 SimpleMenu Example (`examples/simple_menu/`)

**Strengths:**
- ✅ Clean, idiomatic Nim code
- ✅ Demonstrates multiple callback types (headers, separators, selection)
- ✅ Uses `pebbleApp` macro for minimal boilerplate
- ✅ Proper cleanup in `windowUnload`
- ✅ Good documentation in README

**Issues Found:**
- ⚠️ **Callback procs use `{.nimcall.}` instead of `{.cdecl.}`**: While this works for the wrapper trampolines, it's inconsistent with Pebble callback conventions
- ⚠️ **Missing `getCellHeight` callback**: Menu may not render correctly on all platforms
- ⚠️ **No error handling for `newMenuLayerHandle` failure**: Could return nil handle

**Recommendations:**
1. Document why `{.nimcall.}` is acceptable here (trampoline converts to cdecl)
2. Add `getCellHeight` for completeness
3. Add assertion after `newMenuLayerHandle`

---

## 2. Memory Leak Analysis

### 2.1 BitmapSequenceRef

**Leak Risk: LOW**

| Scenario | Analysis | Status |
|----------|----------|--------|
| Normal lifecycle | Destructor cancels timer and destroys sequence | ✅ Safe |
| Early drop | ARC destroys properly, timer canceled | ✅ Safe |
| Timer fires after drop | Timer callback checks nil | ✅ Safe |
| Multiple schedules | Old timer canceled before new registration | ✅ Safe |
| wrapBitmapSequence(owned=false) | Destructor skips destroy, only cancels timer | ✅ Safe |

**Potential Issue:**
- If `scheduleNextFrame` is called with delay=0, timer is set to nil but previous timer (if any) should still be canceled. Current code cancels before checking delay, so safe.

### 2.2 MenuLayerManaged

**Leak Risk: MEDIUM** (due to incomplete field copying)

| Scenario | Analysis | Status |
|----------|----------|--------|
| Normal lifecycle | Destructor destroys menu, nils wrapper (ARC frees) | ✅ Safe |
| setCallbacks twice | First wrapper leaked (only nil'd, not freed) | ⚠️ **LEAK** |
| removeCallbacks then drop | Wrapper freed via ARC, menu destroyed | ✅ Safe |
| Wrapper with closures | ARC keeps alive via ref count | ✅ Safe |
| toHandle converter | Creates handle without wrapper - destructor safe | ✅ Safe |

**Confirmed Bugs:**
1. **Field Copying Bug**: In `setCallbacks`, lines 205-210 only copy 5 fields. The new fields (getHeaderHeight, drawHeader, etc.) are NOT copied, so they remain nil even if user provides them.

2. **Double-setCallbacks Leak**: When replacing callbacks, the old wrapper is only nil'd (line 200), not explicitly freed. Since it's a ref, ARC should eventually free it, but during the procedure, both references exist.

### 2.3 Example Code

**Leak Risk: LOW**

The example properly handles cleanup by assigning `MenuLayerHandle(nil)` in unload, which triggers the destructor.

---

## 3. Logic Bugs Found

### Critical Bug: MenuLayer Field Copying

In `menu_layer_managed.nim`, line 193-210:

```nim
proc setCallbacks*(h: var MenuLayerHandle, wrapper: MenuLayerCallbacksWrapper, ctx: pointer = nil) =
  # ...
  var p: MenuLayerCallbacksWrapper
  new(p)
  p.getNumSections = wrapper.getNumSections
  p.getNumRows = wrapper.getNumRows
  p.drawRow = wrapper.drawRow
  p.getCellHeight = wrapper.getCellHeight
  p.selectClick = wrapper.selectClick
  # MISSING: getHeaderHeight, drawHeader, selectLongClick, etc.
  h.callbacks = p
```

**Impact**: User-provided callbacks for headers, separators, etc. are silently ignored.

**Fix**: Add all 13 field assignments.

### Minor Bug: BitmapSequence Timer Race

In `scheduleNextFrame`:

```nim
if h.timer != nil:
  cancel(h.timer)  # Timer may still fire if already queued
  h.timer = nil
```

On Pebble, `app_timer_cancel` returns immediately but the timer may already be in the event queue. The trampoline checks `h.seq != nil` which is safe, but `h.timer` assignment is not atomic.

**Impact**: Low - trampoline checks nil, worst case schedules extra frame.

---

## 4. Recommendations Summary

### Immediate Fixes Needed

1. **menu_layer_managed.nim:193-210** - Add missing field copies:
   ```nim
   p.getHeaderHeight = wrapper.getHeaderHeight
   p.drawHeader = wrapper.drawHeader
   p.selectLongClick = wrapper.selectLongClick
   p.selectionChanged = wrapper.selectionChanged
   p.getSeparatorHeight = wrapper.getSeparatorHeight
   p.drawSeparator = wrapper.drawSeparator
   p.selectionWillChange = wrapper.selectionWillChange
   p.drawBackground = wrapper.drawBackground
   ```

2. **bitmap_sequence_ref.nim:102** - Add nil check:
   ```nim
   let h = cast[BitmapSequenceRef](ctx)
   if h == nil: return
   ```

3. **examples/simple_menu/src/simple_menu.nim:7-43** - Add `getCellHeight` callback for completeness.

### Code Style Improvements

1. Add ` {.inline.}` to trampoline procs that are simple delegators
2. Consider adding `checkValid` calls in public API methods (when ManagedDebug)
3. Document thread-safety guarantees (Pebble is single-threaded)

### Testing Recommendations

1. Add compile-only test that uses all 13 callback fields
2. Test with `nebbleManagedDebug` and `nebbleManagedStrict` flags
3. Verify no leaks with repeated setCallbacks/removeCallbacks cycles

---

## 5. Architecture Compliance

| Requirement | Status | Notes |
|-------------|--------|-------|
| ARC-compatible | ✅ | All hooks implemented correctly |
| Zero-overhead | ✅ | Inline accessors, no extra allocations |
| FFI interop | ✅ | Converters provided for ptr T |
| No hidden allocations | ✅ | Explicit new() calls only |
| Platform guards | ✅ | None needed (callbacks are generic) |
| Cdecl callbacks | ✅ | All trampolines use {.cdecl.} |

---

## 6. Overall Assessment

**Code Quality: GOOD** (with critical bug fix needed)

The new modules follow established patterns well and integrate cleanly with the existing codebase. The critical bug in `setCallbacks` field copying must be fixed before the header/separator callbacks will work. Once fixed, these modules provide a solid foundation for managed MenuLayer usage.

**Memory Safety: GOOD** (with minor leak risk)

ARC handles the lifecycle correctly. The only leak risk is double-setCallbacks, which is minor (ref will be freed eventually) and unlikely in normal usage.

**Recommendation**: Fix the field copying bug, then these modules are ready for use.

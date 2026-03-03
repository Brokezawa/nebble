# Nebble v1.1.0 Codebase Audit

## Summary
- Scope: entire repository (src, tests, CLI, docs, build scripts).
- Findings: 7 total (3 Medium, 3 Low, 1 Informational).
- No code changes were made; this report only documents findings.

## Scope & Methodology
- Reviewed core modules in `src/`, CLI tooling, and test stubs.
- Focused on Nim best practices (AGENTS.md), memory safety, error handling, and
  performance-sensitive paths.
- Used targeted searches for FFI calls, pointer usage, and allocation patterns,
  with manual review of critical sections.

## Severity Scale
- **Critical**: Likely exploitable or fatal runtime corruption.
- **High**: Likely crash/data corruption in common paths.
- **Medium**: Incorrect behavior or significant risk in specific scenarios.
- **Low**: Minor correctness/performance/maintainability concern.
- **Informational**: Design/style observation; not a defect.

## Findings

### Medium

**A-01 — PNG bitmap creation passes size 0**  
**Files:** `src/nebble/graphics/graphics.nim:147-150`  
**Category:** Potential bugs/edge cases, Memory safety  
**Details:** `newBitmapFromData` calls `gbitmap_create_from_png_data(data, 0)`.
The Pebble API expects a valid byte length; passing 0 can cause decode failure or
out-of-bounds reads depending on SDK implementation.  
**Recommendation:** Require a length parameter (or compute it) and pass the
correct size to the SDK function.

**A-02 — AppSync allows zero-length buffer**  
**Files:** `src/nebble/comms/app_sync.nim:52-74`  
**Category:** Potential bugs/edge cases  
**Details:** `newAppSyncHandle` allocates `bufferSize` bytes and calls
`app_sync_init` even when `bufferSize == 0`. This can create a zero-length
buffer and undefined behavior in the SDK.  
**Recommendation:** Guard against zero buffer sizes (return invalid handle or
assert) before calling `app_sync_init`.

**A-03 — Dictionary write errors discarded**  
**Files:** `src/nebble/comms/typed_message.nim:45-75`  
**Category:** Code quality, Error handling  
**Details:** `send*` templates discard `dictWrite*` return codes, which can hide
serialization failures (e.g., buffer full).  
**Recommendation:** Surface return codes or provide a checked variant to allow
callers to handle failures explicitly.

### Low

**A-04 — Per-frame sub-bitmap allocation in sprite draw**  
**Files:** `src/nebble/graphics/sprite.nim:273-283`, `402-412`  
**Category:** Performance  
**Details:** Each draw call creates/destroys a sub-bitmap via
`gbitmap_create_as_sub_bitmap`. This can cause per-frame allocation churn.  
**Recommendation:** Cache sub-bitmaps per frame or reuse a scratch bitmap where
possible.

**A-05 — Test stub frees bitmap data without ownership tracking**  
**Files:** `tests/pebble_stubs.c:50-56`, `75-87`, `177-185`  
**Category:** Memory safety (test environment)  
**Details:** `gbitmap_destroy` always frees `data`, while
`gbitmap_create_with_data` documents that caller owns the data. `gbitmap_set_data`
also frees previous data and ignores `free_on_destroy`, risking double-free or
invalid free in tests.  
**Recommendation:** Track ownership flags in the stub and respect
`free_on_destroy` to avoid test-only memory errors.

**A-06 — Snake_case proc in high-level UI module**  
**Files:** `src/nebble/ui/declarative.nim:500-501`  
**Category:** Readability/maintainability  
**Details:** `pebble_exit` uses snake_case in a high-level module that otherwise
uses camelCase.  
**Recommendation:** Rename or isolate in a lower-level module if possible
(keeping `_exit` export as needed).

### Informational

**A-07 — Raw pointer API exposure in draw_command**  
**Files:** `src/nebble/graphics/draw_command.nim:14-45`  
**Category:** Code quality / API design  
**Details:** High-level wrappers expose `ptr GDrawCommand*` types directly,
contrary to the “managed handles” guidance in AGENTS.md.  
**Recommendation:** Consider managed handle wrappers to enforce ownership and
reduce pointer misuse.

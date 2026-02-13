# Nebble Testing Guide

Nebble has a comprehensive test suite that verifies both the Nim-to-C compilation pipeline and the API functionality across all Pebble platforms.

## Test Tasks

The test suite is managed via `nimble`. The following tasks are available:

### 1. `nimble testUnit` (Host Tests)
Runs unit tests on the host machine (macOS/Linux) using minimal mocks for Pebble types.
- Verifies macro generation (`pebbleApp`, `DefineUniqueHandle`).
- Checks math utilities and logic that doesn't depend on Pebble OS.
- **Speed:** Very fast. Run this frequently during development.

### 2. `nimble testExample` (Build Matrix)
Builds all example applications for all 6 Pebble platforms.
- This is an integration test for the entire pipeline: Nim → C → Pebble SDK (ARM GCC) → .pbw.
- Verifies that the API compiles correctly against the real Pebble SDK headers.
- Checks binary sizes (especially for Aplite's 24KB limit).
- **Speed:** Slow (~2-3 minutes). Run before committing.

### 3. `nimble test` (Full Suite)
Runs `testUnit` followed by `testExample`. This is the CI entry point.

## Adding New Tests

### Unit Tests
Add new test files to `tests/`.
- Use `unittest2`.
- Use `tests/mocks/pebble.h` for C type definitions if needed.
- Add execution line to `nebble.nimble` under `testUnit`.

### Integration Tests (Examples)
Add a new example app in `examples/`.
- Must have `nebble.json`, `nim.cfg`, `wscript`, and `src/<name>.nim`.
- The `testExample` task automatically discovers all valid projects in `examples/` and adds them to the build matrix.

## Manual Testing

For UI behavior and runtime checks, manual testing on the emulator is required.
1. Build an example: `nebble build --platform basalt`
2. Install: `nebble install --emulator basalt`
3. Verify behavior in the QEMU window.

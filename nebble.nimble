# Package
version       = "0.1.0"
author        = "zawa"
description   = "Nim wrapper for the Pebble smartwatch SDK"
license       = "MIT"
srcDir        = "src"

# Dependencies
requires "nim >= 2.2.0"
requires "futhark >= 0.15.0"
requires "unittest2 >= 0.2.5"

# Helper procs
proc capitalizeAscii(s: string): string =
  if s.len == 0: return s
  result = s
  result[0] = s[0].toUpperAscii

# Tasks
task test, "Run all tests (unit + compile + examples + size check)":
  echo "═══════════════════════════════════════════════════════"
  echo "Running all Nebble tests"
  echo "═══════════════════════════════════════════════════════"
  echo ""
  
  # 1. Host-side unit tests (runtime, macOS native)
  # Skip tests/nim.cfg which has ARM cross-compile flags
  echo "→ Running host-side unit tests..."
  exec "nim c --skipProjCfg -d:pebbleBasalt -r tests/test_macros.nim"
  echo ""
  
  # 2. Compile-only tests (ARM cross-compile, all platforms)
  echo "→ Running compile-only tests for all platforms..."
  for platform in ["aplite", "basalt", "chalk", "diorite", "emery", "flint"]:
    let flag = "-d:pebble" & capitalizeAscii(platform)
    echo "  Testing FFI on " & platform & "..."
    exec "nim c " & flag & " tests/test_ffi.nim"
    echo "  Testing high-level API on " & platform & "..."
    exec "nim c " & flag & " tests/test_highlevel.nim"
  echo ""
  
  # 3. Integration: build all examples for all platforms
  echo "→ Running integration tests (example builds)..."
  exec "bash test_build_matrix.sh"

task testUnit, "Run host-side unit tests only":
  echo "Running unit tests..."
  exec "nim c --skipProjCfg -d:pebbleBasalt -r tests/test_macros.nim"

task testCompile, "Compile-only tests for all platforms":
  echo "Running compile-only tests for all 6 platforms..."
  for platform in ["aplite", "basalt", "chalk", "diorite", "emery", "flint"]:
    let flag = "-d:pebble" & capitalizeAscii(platform)
    echo "→ " & platform & ":"
    echo "  Testing FFI..."
    exec "nim c " & flag & " tests/test_ffi.nim"
    echo "  Testing high-level API..."
    exec "nim c " & flag & " tests/test_highlevel.nim"

task testExamples, "Build all examples for all platforms":
  echo "Building all examples for all platforms..."
  exec "bash test_build_matrix.sh"

task testSize, "Check Aplite binary size < 24KB for all examples":
  echo "Checking Aplite binary sizes..."
  exec "bash test_build_matrix.sh"

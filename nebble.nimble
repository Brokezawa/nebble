# Package
version       = "1.0.0"
author        = "Brokezawa"
description   = "Nim wrapper for the Pebble smartwatch SDK"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["tools/nebble"]

# Dependencies
requires "nim >= 2.2.0"
requires "unittest2 >= 0.2.5"

import os, strutils, algorithm

# Helper procs
proc capitalizeAscii(s: string): string =
  if s.len == 0: return s
  result = s
  result[0] = s[0].toUpperAscii

# Tasks
task testUnit, "Run host-side unit tests only":
  echo "═══════════════════════════════════════════════════════"
  echo "Running Unit Tests"
  echo "═══════════════════════════════════════════════════════"
  # Run macro tests
  exec "nim c --skipProjCfg -d:pebbleBasalt -r tests/test_macros.nim"
  # Compile-only API tests (cross-compile check). tests/nim.cfg sets
  # --compileOnly and adds --path:"../src" so we must NOT use -r.
  exec "nim c -d:pebbleBasalt tests/test_highlevel.nim"

task testExample, "Build CLI template projects for all platforms (Integration Tests)":
  echo "═══════════════════════════════════════════════════════"
  echo "Running Integration Tests (Build Matrix)"
  echo "═══════════════════════════════════════════════════════"
  
  let platforms = ["aplite", "basalt", "chalk", "diorite", "emery", "flint"]
  let testDir = "/tmp/nebble_test_projects"
  
  # Clean and create test directory using shell commands
  exec "rm -rf " & testDir
  exec "mkdir -p " & testDir
  
  var successCount = 0
  var failCount = 0
  
  # Test hello_world (app template)
  echo "\n=== Testing: hello_world (app template) ==="
  withDir testDir:
    exec "../bin/nebble new hello_world"
    withDir "hello_world":
      for p in platforms:
        echo "  Building hello_world for " & p & "..."
        try:
          exec "../../bin/nebble build --platform " & p
          inc successCount
        except:
          echo "  FAILED: hello_world on " & p
          inc failCount
  
  # Test simple_watchface (watchface template)
  echo "\n=== Testing: simple_watchface (watchface template) ==="
  withDir testDir:
    exec "../bin/nebble new simple_watchface --watchface"
    withDir "simple_watchface":
      for p in platforms:
        echo "  Building simple_watchface for " & p & "..."
        try:
          exec "../../bin/nebble build --platform " & p
          inc successCount
        except:
          echo "  FAILED: simple_watchface on " & p
          inc failCount
  
  # Cleanup
  exec "rm -rf " & testDir
  
  echo "\n═══════════════════════════════════════════════════════"
  echo "Matrix Results"
  echo "═══════════════════════════════════════════════════════"
  echo "Successful builds: " & $successCount
  echo "Failed builds:     " & $failCount
  
  if failCount > 0:
    quit("Some builds failed", 1)

task testSize, "Check binary size for template projects (Aplite limit)":
  let testDir = "/tmp/nebble_size_test"
  
  # Clean and create test directory using shell commands
  exec "rm -rf " & testDir
  exec "mkdir -p " & testDir
  
  withDir testDir:
    # Test hello_world app size
    echo "\n=== Size check: hello_world (app template) ==="
    exec "../bin/nebble new hello_world"
    withDir "hello_world":
      exec "../../bin/nebble size --platform aplite"
    
    # Test simple_watchface size
    echo "\n=== Size check: simple_watchface (watchface template) ==="
    exec "../bin/nebble new simple_watchface --watchface"
    withDir "simple_watchface":
      exec "../../bin/nebble size --platform aplite"
  
  # Cleanup
  exec "rm -rf " & testDir

task test, "Run all tests (unit + examples + size)":
  exec "nimble testUnit"
  exec "nimble testExample"
  exec "nimble testSize"

task regenFfi, "Regenerate FFI bindings using Futhark":
  echo "Regenerating FFI bindings..."
  for platform in ["aplite", "basalt", "chalk", "diorite", "emery", "flint"]:
    echo "→ " & platform & ":"
    exec "nim r -d:futharkRebuild -d:opirRebuild -d:platform=" & platform & " src/nebble/ffi/generate.nim"

task docs, "Generate documentation":
  echo "Generating documentation..."
  if not dirExists("docs/html"):
    mkDir("docs/html")
  
  # Standard documentation generation for high-level API
  let docCmd = "nim doc --project --git.url:https://github.com/Brokezawa/nebble --git.commit:main --outdir:docs/html --path:src src/nebble.nim"
  exec docCmd
  
  # Documentation for JS component
  let pkjsDocCmd = "nim doc --backend:js --git.url:https://github.com/Brokezawa/nebble --git.commit:main --outdir:docs/html --path:src src/nebble/pkjs.nim"
  exec pkjsDocCmd

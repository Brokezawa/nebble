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

task testExample, "Build all examples for all platforms (Integration Tests)":
  echo "═══════════════════════════════════════════════════════"
  echo "Running Integration Tests (Build Matrix)"
  echo "═══════════════════════════════════════════════════════"
  
  let platforms = ["aplite", "basalt", "chalk", "diorite", "emery", "flint"]
  var examples: seq[string] = @[]
  
  # Find examples
  for kind, path in walkDir("examples"):
    if kind == pcDir:
      let name = path.extractFilename
      if fileExists(path & "/src/" & name & ".nim"):
        examples.add(name)
  
  examples.sort()
  
  var successCount = 0
  var failCount = 0
  
  for ex in examples:
    echo "\n=== Testing: " & ex & " ==="
    withDir "examples/" & ex:
      for p in platforms:
        let cmd = "../../bin/nebble build --platform " & p
        echo "  Building for " & p & "..."
        try:
          exec cmd
          inc successCount
        except:
          echo "  FAILED: " & ex & " on " & p
          inc failCount
  
  echo "\n═══════════════════════════════════════════════════════"
  echo "Matrix Results"
  echo "═══════════════════════════════════════════════════════"
  echo "Successful builds: " & $successCount
  echo "Failed builds:     " & $failCount
  
  if failCount > 0:
    quit("Some builds failed", 1)

task testSize, "Check binary size for all examples (Aplite limit)":
  let platforms = ["aplite"]
  for kind, path in walkDir("examples"):
    if kind == pcDir:
      let name = path.extractFilename
      if fileExists(path & "/src/" & name & ".nim"):
        echo "\n=== Size check: " & name & " ==="
        withDir path:
          exec "../../bin/nebble size --platform aplite"

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

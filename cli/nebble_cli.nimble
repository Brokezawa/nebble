# Package

version       = "0.1.0"
author        = "Nebble Contributors"
description   = "CLI tool for building Pebble smartwatch apps in Nim"
license       = "MIT"
srcDir        = "src"
bin           = @["nebble"]
binDir        = "bin"

# Dependencies

requires "nim >= 2.2.0"
requires "nebble"  # The library package

# Tasks

task build, "Build the nebble CLI":
  exec "nim c -d:release -o:bin/nebble src/nebble.nim"

task install_local, "Install nebble CLI locally":
  exec "nimble build"
  exec "cp bin/nebble ~/.nimble/bin/"

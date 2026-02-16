# Package

version       = "1.0.0"
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
  let binExt = when defined(windows): ".exe" else: ""
  let binFile = "bin/nebble" & binExt
  # In Nimble tasks, we should use standardized paths or shell expansion
  # Since getHomeDir isn't available, we'll use a portable shell command
  if defined(windows):
    let binFileWin = binFile.replace("/", "\\")
    exec "if not exist %USERPROFILE%\\.nimble\\bin mkdir %USERPROFILE%\\.nimble\\bin"
    exec "copy /Y " & binFileWin & " %USERPROFILE%\\.nimble\\bin\\nebble.exe"
  else:
    exec "mkdir -p ~/.nimble/bin"
    exec "cp bin/nebble ~/.nimble/bin/"

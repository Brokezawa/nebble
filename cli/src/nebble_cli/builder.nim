## Build pipeline: Nim → C → Pebble

import std/[os, osproc, strutils, json]
import config

proc compileNimToC*(cfg: NebbleConfig, platform: string): bool =
  ## Compile Nim code to C for the specified platform
  let
    sourcePath = "src" / (cfg.name & ".nim")
    nimcacheDir = "nimcache"
    platformDefine = "-d:pebble" & platform.capitalizeAscii()
  
  if not fileExists(sourcePath):
    echo "Error: Source file not found: ", sourcePath
    return false
  
  # Clean nimcache directory
  if dirExists(nimcacheDir):
    removeDir(nimcacheDir)
  createDir(nimcacheDir)
  
  # Find nebble library path
  # Try common locations: installed via nimble, or relative to examples/
  var nebblePath = ""
  let possiblePaths = [
    "../../src",  # For examples/ directory
    "../src",      # For project one level up
    "src",         # For root nebble directory
  ]
  
  for path in possiblePaths:
    if dirExists(path / "nebble"):
      nebblePath = path
      break
  
  # Compile Nim to C
  var cmd = "nim c --compileOnly " & platformDefine & " --nimcache:" & nimcacheDir
  if nebblePath != "":
    cmd &= " --path:\"" & nebblePath & "\""
  cmd &= " " & sourcePath
  
  echo "  Running: ", cmd
  let (output, exitCode) = execCmdEx(cmd)
  
  if exitCode != 0:
    echo "  Nim compilation failed:"
    echo output
    return false
  
  return true

proc generateAppInfo*(cfg: NebbleConfig, platform: string): bool =
  ## Generate appinfo.json from nebble.json config
  # Pebble SDK expects appinfo.json in project root, not in build/
  
  # Determine watchface or app
  let isWatchface = cfg.appType == "watchface"
  
  # Convert version to Major.Minor format (Pebble requirement)
  # "1.0.0" -> "1.0", "2.3.5" -> "2.3"
  let versionParts = cfg.version.split('.')
  let versionLabel = if versionParts.len >= 2:
    versionParts[0] & "." & versionParts[1]
  else:
    cfg.version
  
  # Build appinfo.json
  var appinfo = %* {
    "uuid": cfg.uuid,
    "shortName": cfg.name,
    "longName": cfg.name,
    "companyName": "Nebble",
    "versionLabel": versionLabel,
    "versionCode": 1,
    "sdkVersion": "3",
    "targetPlatforms": cfg.platforms,
    "watchapp": {
      "watchface": isWatchface
    },
    "resources": {
      "media": []
    }
  }
  
  # Add capabilities if any
  if cfg.capabilities.len > 0:
    appinfo["capabilities"] = newJArray()
    for cap in cfg.capabilities:
      appinfo["capabilities"].add(%cap)
  
  # Add appKeys if any
  if not cfg.appKeys.isNil and cfg.appKeys.len > 0:
    appinfo["appKeys"] = cfg.appKeys
  
  writeFile("appinfo.json", appinfo.pretty)
  return true

proc copyNimCFiles*(cfg: NebbleConfig, platform: string): bool =
  ## Copy Nim-generated C files to the Pebble project structure
  let
    nimcacheDir = "nimcache"
    srcCDir = "src" / "c"
  
  # Create src/c directory
  createDir(srcCDir)
  
  # Copy all .c files from nimcache to src/c
  var filesCopied = 0
  for kind, path in walkDir(nimcacheDir):
    if kind == pcFile and path.endsWith(".c"):
      let destPath = srcCDir / extractFilename(path)
      copyFile(path, destPath)
      inc filesCopied
  
  # Copy nimbase.h from Nim installation
  # nimbase.h is not generated in nimcache, it's in the Nim lib directory
  # Try multiple locations
  var nimbaseCopied = false
  let nimbasePaths = [
    getHomeDir() / ".choosenim/toolchains" / ("nim-" & NimVersion) / "lib" / "nimbase.h",
    findExe("nim").parentDir().parentDir() / "lib" / "nimbase.h",
    "/usr/local/lib/nim/nimbase.h",
    "/usr/lib/nim/nimbase.h"
  ]
  
  for nimbasePath in nimbasePaths:
    if fileExists(nimbasePath):
      copyFile(nimbasePath, srcCDir / "nimbase.h")
      inc filesCopied
      nimbaseCopied = true
      break
  
  if not nimbaseCopied:
    echo "  ERROR: nimbase.h not found. Tried:"
    for path in nimbasePaths:
      echo "    - ", path
    return false
  
  echo "  Copied ", filesCopied, " files to src/c/"
  return true

proc runPebbleBuild*(platform: string): bool =
  ## Run pebble build command
  let cmd = "pebble build"
  
  echo "  Running: ", cmd
  let (output, exitCode) = execCmdEx(cmd)
  
  if exitCode != 0:
    echo "  Pebble build failed:"
    echo output
    return false
  
  # Show relevant output (success messages)
  for line in output.splitLines():
    if "Compiling" in line or "Linking" in line or "Building" in line or "Creating" in line:
      echo "  ", line
  
  return true

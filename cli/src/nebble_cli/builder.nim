## Build pipeline: Nim → C → Pebble

import std/[os, osproc, strutils, json, algorithm]
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
    "targetPlatforms": [platform],
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

proc generatePackageJson*(cfg: NebbleConfig, platform: string): bool =
  ## Generate package.json from nebble.json config (Modern SDK requirement)
  
  # Determine watchface or app
  let isWatchface = cfg.appType == "watchface"
  
  # Convert version to Major.Minor.Patch format
  # Pebble package.json requires semantic versioning
  let version = if cfg.version.split('.').len == 3: cfg.version
                elif cfg.version.split('.').len == 2: cfg.version & ".0"
                else: cfg.version & ".0.0"

  # Build messageKeys (under pebble object) as a JObject for explicit mapping
  let messageKeys = newJObject()
  if not cfg.appKeys.isNil and cfg.appKeys.len > 0:
    for key, val in cfg.appKeys:
      messageKeys[key] = val

  # Build package.json
  let jsExists = fileExists("src" / "js" / "pebble-js-app.js") or fileExists("src" / "pkjs" / "index.js")
  
  var packageJson = %* {
    "name": cfg.name,
    "version": version,
    "author": "Nebble",
    "private": true,
    "main": if jsExists: (if fileExists("src" / "js" / "pebble-js-app.js"): "src/js/pebble-js-app.js" else: "src/pkjs/index.js") else: "",
    "dependencies": {},
    "pebble": {
      "uuid": cfg.uuid,
      "displayName": cfg.name,
      "sdkVersion": "3",
      "targetPlatforms": [platform],
      "watchapp": {
        "watchface": isWatchface
      },
      "enableMultiJS": jsExists,
      "messageKeys": messageKeys,
      "resources": {
        "media": []
      }
    }
  }
  
  # Add capabilities if any
  if cfg.capabilities.len > 0:
    packageJson["pebble"]["capabilities"] = newJArray()
    for cap in cfg.capabilities:
      packageJson["pebble"]["capabilities"].add(%cap)
  
  writeFile("package.json", packageJson.pretty)
  return true

proc copyNimCFiles*(cfg: NebbleConfig, platform: string): bool =
  ## Copy Nim-generated C files to the Pebble project structure
  let
    nimcacheDir = "nimcache"
    srcCDir = "src" / "c"
  
  # Create src/c directory and clean it
  if dirExists(srcCDir):
    removeDir(srcCDir)
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
  var nimbasePaths: seq[string] = @[
    getHomeDir() / ".choosenim" / "toolchains" / ("nim-" & NimVersion) / "lib" / "nimbase.h",
    getHomeDir() / ".choosenim" / "toolchains" / ("nim-" & NimVersion.split("-")[0]) / "lib" / "nimbase.h",
    findExe("nim").parentDir().parentDir() / "lib" / "nimbase.h"
  ]
  
  # Platform-specific paths
  when defined(posix):
    nimbasePaths.add("/usr/local/lib/nim/nimbase.h")
    nimbasePaths.add("/usr/lib/nim/nimbase.h")
  
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

proc runPebbleBuild*(cfg: NebbleConfig, platform: string): bool =
  ## Run pebble build command
  let cmd = "pebble build"
  
  echo "  Running: ", cmd
  let (output, exitCode) = execCmdEx(cmd)
  
  if exitCode != 0:
    echo "  Pebble build failed:"
    echo output
    return false
  
  # Rename the output .pbw to include the platform name
  let pbwFile = "build" / (cfg.name & ".pbw")
  let platformPbwFile = "build" / (cfg.name & "_" & platform & ".pbw")
  if fileExists(pbwFile):
    moveFile(pbwFile, platformPbwFile)
  
  # Show relevant output (success messages)
  for line in output.splitLines():
    if "Compiling" in line or "Linking" in line or "Building" in line or "Creating" in line:
      echo "  ", line
  
  return true

proc sanitizeComment(s: string): string =
  ## Sanitize a string for use in a Nim comment.
  ## Removes newlines and other characters that could break comment syntax.
  result = s.multiReplace([
    ("\n", " "),
    ("\r", " "),
    ("##", "#"),  # Prevent comment injection
    ("*/", "* /") # Prevent block comment injection
  ])

proc isValidNimIdentifier(s: string): bool =
  ## Check if string is a valid Nim identifier.
  ## Must start with letter or underscore, followed by alphanumeric or underscore.
  if s.len == 0: return false
  let first = s[0]
  if not (first in {'a'..'z', 'A'..'Z', '_'}): return false
  for c in s:
    if not (c in {'a'..'z', 'A'..'Z', '0'..'9', '_'}): return false
  return true

proc isValidAppKeyName(s: string): bool =
  ## Check if app key name is valid (alphanumeric + underscore only).
  if s.len == 0 or s.len > 64: return false
  for c in s:
    if not (c in {'a'..'z', 'A'..'Z', '0'..'9', '_'}): return false
  return true

proc generateMessageKeys*(cfg: NebbleConfig): bool =
  ## Generate type-safe message keys from nebble.json appKeys
  ## Outputs src/gen/app_keys.nim
  
  if cfg.appKeys.isNil or cfg.appKeys.len == 0:
    echo "  No appKeys defined in nebble.json"
    return true
  
  # Create gen directory if needed
  let genDir = "src" / "gen"
  if not dirExists(genDir):
    createDir(genDir)
  
  # Generate enum definition
  var output = "## Auto-generated from nebble.json appKeys\n"
  output.add("## Do not edit manually - run `nebble gen-keys` to regenerate\n\n")
  output.add("type\n")
  output.add("  AppMessageKey* {.pure.} = enum\n")
  
  # Sort keys by value to maintain consistent order
  var keys: seq[tuple[name: string, value: int]]
  for key, val in cfg.appKeys:
    let keyStr = key
    # Validate key name doesn't contain malicious characters
    if not isValidAppKeyName(keyStr):
      echo "  Error: Invalid appKey name '", keyStr, "' - must be alphanumeric + underscore only"
      return false
    keys.add((keyStr, val.getInt()))
  
  keys.sort(proc(a, b: auto): int = cmp(a.value, b.value))
  
  for item in keys:
    # Convert key name to valid Nim identifier
    # e.g., "COMMAND" -> amkCommand, "DATA_POINT" -> amkDataPoint
    var nimName = "amk"
    var capitalizeNext = true
    for c in item.name:
      if c == '_':
        capitalizeNext = true
      else:
        if capitalizeNext:
          nimName.add(toUpperAscii(c))
          capitalizeNext = false
        else:
          nimName.add(toLowerAscii(c))
    
    # Validate generated identifier is valid Nim
    if not isValidNimIdentifier(nimName):
      echo "  Error: Generated identifier '", nimName, "' is not a valid Nim identifier"
      return false
    
    output.add("    ")
    output.add(nimName)
    output.add(" = ")
    output.add($item.value)
    output.add("  ## ")
    output.add(item.name.sanitizeComment)
    output.add("\n")
  
  writeFile(genDir / "app_keys.nim", output)
  echo "  Generated src/gen/app_keys.nim with ", keys.len, " keys"
  return true

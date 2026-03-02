## Build pipeline: Nim → C → Pebble

import std/[os, osproc, strutils, json, algorithm]
import config

proc findNebblePath(): string =
  ## Find the nebble library path using nimble or fallbacks
  # Try using nimble path command first
  let (nimbleOutput, nimbleExit) = execCmdEx("nimble path nebble")
  if nimbleExit == 0:
    # Use the first line if multiple paths are returned
    let lines = nimbleOutput.strip().splitLines()
    if lines.len > 0:
      let packageRoot = lines[0].strip()
      
      # Check if package has src/ subdirectory (development mode)
      let srcPath = packageRoot / "src"
      if dirExists(srcPath / "nebble") or fileExists(srcPath / "nebble.nim"):
        return srcPath
      
      # Check if package is flattened (installed via nimble)
      # nimble installs packages with files at root, not in src/
      if dirExists(packageRoot / "nebble"):
        return packageRoot
  
  # Fallback to common locations
  let possiblePaths = [
    "../../src",  # For examples/ directory
    "../src",      # For project one level up
    "src",         # For root nebble directory
    "..",          # Parent directory (for development)
  ]
  
  for path in possiblePaths:
    if dirExists(path / "nebble"):
      return path
  
  return ""

proc compileNimToC*(cfg: NebbleConfig, platform: string): bool =
  ## Compile Nim code to C for the specified platform
  # Use project name from directory if needed
  let projectName = cfg.name
  let sourcePath = "src" / (projectName & ".nim")
  let nimcacheDir = "nimcache"
  let platformDefine = "-d:pebble" & platform.capitalizeAscii()
  
  if not fileExists(sourcePath):
    echo "Error: Source file not found: ", sourcePath
    return false
  
  # Clean nimcache directory
  if dirExists(nimcacheDir):
    removeDir(nimcacheDir)
  createDir(nimcacheDir)
  
  # Find nebble library path
  let nebblePath = findNebblePath()
  
  # Compile Nim to C
  var cmd = "nim c --compileOnly " & platformDefine & " --nimcache:" & nimcacheDir
  if nebblePath != "":
    cmd &= " --path:\"" & nebblePath & "\""
  
  # Add current src directory to path so gen/ files can be imported
  cmd &= " --path:\"src\""
  cmd &= " " & sourcePath
  
  echo "  Running: ", cmd
  let (output, exitCode) = execCmdEx(cmd)
  
  if exitCode != 0:
    echo "  Nim compilation failed:"
    echo output
    return false
  
  return true

proc compileNimToJs*(cfg: NebbleConfig): bool =
  ## Compile Nim code to JS for the phone-side component
  ## Only runs if src/pkjs.nim exists
  let
    sourcePath = "src" / "pkjs.nim"
    destPath = "src" / "js" / "pebble-js-app.js"
  
  if not fileExists(sourcePath):
    # No JS component needed
    return true

  echo "  Compiling Nim to JS..."
  
  # Ensure destination directory exists
  createDir("src" / "js")
  
  # Find nebble library path
  let nebblePath = findNebblePath()

  # Compile Nim to JS
  var cmd = "nim js -d:release"
  if nebblePath != "":
    cmd &= " --path:\"" & nebblePath & "\""
  cmd &= " --out:\"" & destPath & "\" " & sourcePath
  
  echo "  Running: ", cmd
  let (output, exitCode) = execCmdEx(cmd)
  
  if exitCode != 0:
    echo "  Nim JS compilation failed:"
    echo output
    return false
  
  return true

proc generateResourceIds*(cfg: NebbleConfig): bool =
  ## Generate src/gen/resources.nim from package.json resource definitions
  
  var resourcesNim = "## Auto-generated resource IDs\n"
  resourcesNim.add("## Generated from package.json resources\n\n")
  
  # Read resources from package.json
  if fileExists("package.json"):
    let pkg = parseFile("package.json")
    if pkg.hasKey("pebble") and pkg["pebble"].hasKey("resources") and 
       pkg["pebble"]["resources"].hasKey("media"):
      for media in pkg["pebble"]["resources"]["media"]:
        let name = media{"name"}.getStr()
        let resType = media{"type"}.getStr()
        if name.len > 0 and (resType == "png" or resType == "font" or resType == "raw"):
          let resourceName = "RESOURCE_ID_" & name.toUpperAscii()
          resourcesNim.add("var " & resourceName & "* {.importc, nodecl.}: uint32\n")
  
  # Write resources.nim
  let genDir = "src" / "gen"
  if not dirExists(genDir): createDir(genDir)
  writeFile(genDir / "resources.nim", resourcesNim)
  return true

proc copyNimCFiles*(cfg: NebbleConfig, platform: string): bool =
  ## Copy Nim-generated C files to the Pebble project structure
  let
    nimcacheDir = "nimcache"
    srcCDir = "src" / "c" / platform
  
  # Create src/c/<platform> directory and clean it
  if dirExists(srcCDir):
    removeDir(srcCDir)
  createDir(srcCDir)
  
  # Resources are now manually defined in package.json
  # We just need to generate extern declarations for them
  var externs = ""
  
  # Read resources from package.json
  if fileExists("package.json"):
    let pkg = parseFile("package.json")
    if pkg.hasKey("pebble") and pkg["pebble"].hasKey("resources") and 
       pkg["pebble"]["resources"].hasKey("media"):
      for media in pkg["pebble"]["resources"]["media"]:
        let name = media{"name"}.getStr()
        let resType = media{"type"}.getStr()
        if name.len > 0 and (resType == "png" or resType == "font" or resType == "raw"):
          let resourceName = "RESOURCE_ID_" & name.toUpperAscii()
          externs.add("extern uint32_t " & resourceName & ";\n")

  # Copy all .c files from nimcache to src/c/<platform>
  var filesCopied = 0
  for kind, path in walkDir(nimcacheDir):
    if kind == pcFile and path.endsWith(".c"):
      let filename = extractFilename(path)
      let destPath = srcCDir / filename
      
      # If it's the main module, inject externs and stdint
      if filename.startsWith("@m" & cfg.name):
        let content = readFile(path)
        writeFile(destPath, "#include <stdint.h>\n" & externs & content)
      else:
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
  
  echo "  Copied ", filesCopied, " files to src/c/", platform, "/"
  return true

proc runPebbleBuild*(cfg: NebbleConfig): bool =
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
  ## Generate type-safe message keys from package.json messageKeys
  ## Outputs src/gen/app_keys.nim
  
  if cfg.messageKeys.isNil or cfg.messageKeys.len == 0:
    echo "  No messageKeys defined in package.json"
    return true
  
  # Create gen directory if needed
  let genDir = "src" / "gen"
  if not dirExists(genDir):
    createDir(genDir)
  
  # Generate enum definition
  var output = "## Auto-generated from package.json messageKeys\n"
  output.add("## Do not edit manually - run `nebble gen-keys` to regenerate\n\n")
  output.add("type\n")
  output.add("  AppMessageKey* {.pure.} = enum\n")
  
  # Sort keys by value to maintain consistent order
  var keys: seq[tuple[name: string, value: int]]
  for key, val in cfg.messageKeys:
    let keyStr = key
    # Validate key name doesn't contain malicious characters
    if not isValidAppKeyName(keyStr):
      echo "  Error: Invalid messageKey name '", keyStr, "' - must be alphanumeric + underscore only"
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

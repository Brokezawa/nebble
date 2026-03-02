## Nebble CLI Commands Implementation

import std/[os, strutils, osproc, json]
import config, templates, builder
import resources

const validPlatforms* = ["aplite", "basalt", "chalk", "diorite", "emery", "flint", "gabbro"]

proc validatePlatform*(platform: string): bool =
  ## Validate platform name
  platform.toLowerAscii in validPlatforms

proc cmdNew*(name: string, isWatchface: bool) =
  ## Create a new Nebble project
  echo "Creating new Pebble project: ", name
  
  # Validate project name
  if name.len == 0:
    echo "Error: Project name cannot be empty"
    quit(1)
  
  if dirExists(name):
    echo "Error: Directory '", name, "' already exists"
    quit(1)
  
  # Create directory structure
  createDir(name)
  createDir(name / "src")
  createDir(name / "resources")
  
  # Generate project files
  let appType = if isWatchface: "watchface" else: "app"
  
  # Create package.json config (standard Pebble SDK format)
  let packageJson = %* {
    "name": name,
    "version": "1.0.0",
    "author": "Nebble Developer",
    "private": true,
    "pebble": {
      "uuid": generateUuid(),
      "displayName": name,
      "sdkVersion": "3",
      "targetPlatforms": ["aplite", "basalt", "chalk", "diorite", "emery", "flint", "gabbro"],
      "watchapp": {
        "watchface": isWatchface
      },
      "resources": {
        "media": []
      }
    }
  }
  
  writeFile(name / "package.json", packageJson.pretty)
  
  # Create main source file
  let sourceCode = if isWatchface:
    getWatchfaceTemplate(name)
  else:
    getAppTemplate(name)
  
  writeFile(name / "src" / (name & ".nim"), sourceCode)
  
  # Create nim.cfg for cross-compilation
  writeFile(name / "nim.cfg", getNimCfg())
  
  # Create wscript for Pebble build system
  writeFile(name / "wscript", getWscript())
  
  # Create .gitignore
  writeFile(name / ".gitignore", """build/
nimcache/
.lock-waf*
*.pbw
src/c/
src/js/
src/gen/
appinfo.json
""")
  
  echo "✓ Created project structure"
  echo "✓ Generated ", name, ".nim (", appType, ")"
  echo "✓ Generated package.json"
  echo ""
  echo "Next steps:"
  echo "  cd ", name
  echo "  nebble build"
  echo "  nebble install --emulator basalt"

proc cmdBuild*(platform: string) =
  ## Build the Nebble project
  if not fileExists("package.json"):
    echo "Error: package.json not found. Run 'nebble new' to create a project."
    quit(1)
  
  # Load config from package.json
  let cfg = loadConfig()
  
  # Step 0: Generate message keys and resource IDs
  echo "Generating assets..."
  if not generateMessageKeys(cfg):
    echo "✗ Message keys generation failed"
    quit(1)
  echo "✓ Generated src/gen/app_keys.nim"
  
  if not generateResourceIds(cfg):
    echo "✗ Resource IDs generation failed"
    quit(1)
  echo "✓ Generated src/gen/resources.nim"

  # Determine platforms to build
  let platforms = if platform != "":
    if not validatePlatform(platform):
      echo "Error: Invalid platform '", platform, "'"
      echo "Valid platforms: ", validPlatforms.join(", ")
      quit(1)
    @[platform]
  else:
    cfg.platforms
  
  echo "Building for platforms: ", platforms.join(", ")
  echo ""
  
  # Step 1: Compile Nim to C for each platform
  for p in platforms:
    echo "═══ Preparing ", p, " ═══"
    
    # Compile Nim to C
    if not compileNimToC(cfg, p):
      echo "✗ Nim compilation failed for ", p
      quit(1)
    echo "✓ Nim → C compilation successful"
    
    # Copy Nim-generated C files to Pebble project
    if not copyNimCFiles(cfg, p):
      echo "✗ Failed to copy C files for ", p
      quit(1)
    echo "✓ Copied Nim-generated C files"
    echo ""

  # Step 2: Compile Nim to JS (if src/pkjs.nim exists)
  if not compileNimToJs(cfg):
    echo "✗ Nim JS compilation failed"
    quit(1)
  
  # Step 3: Filter package.json to only include requested platforms
  # Pebble SDK builds all platforms in targetPlatforms, so we need to modify package.json
  if platforms.len > 0 and platforms.len < cfg.platforms.len:
    let packageJsonPath = "package.json"
    var packageJson = parseFile(packageJsonPath)
    var filteredPlatforms = newJArray()
    for p in platforms:
      filteredPlatforms.add(%p)
    packageJson["pebble"]["targetPlatforms"] = filteredPlatforms
    writeFile(packageJsonPath, packageJson.pretty)
    echo "  Filtered package.json to platforms: ", platforms.join(", ")
  
  # Step 4: Run Pebble build
  echo "═══ Running Pebble Build ═══"
  if not runPebbleBuild(cfg):
    echo "✗ Pebble build failed"
    quit(1)
  
  # Restore original package.json if we modified it
  if platforms.len > 0 and platforms.len < cfg.platforms.len:
    let packageJsonPath = "package.json"
    var packageJson = parseFile(packageJsonPath)
    var allPlatforms = newJArray()
    for p in cfg.platforms:
      allPlatforms.add(%p)
    packageJson["pebble"]["targetPlatforms"] = allPlatforms
    writeFile(packageJsonPath, packageJson.pretty)
  echo "✓ Pebble build successful"
  
  echo "═══════════════════════════════"
  echo "✓ Build complete!"
  echo ""
  echo "Generated bundle:"
  let pbwFile = "build" / (cfg.name & ".pbw")
  if fileExists(pbwFile):
    echo "  ", pbwFile
  else:
    # Fallback to check if it's in the current dir (some SDK versions)
    let localPbw = cfg.name & ".pbw"
    if fileExists(localPbw):
      echo "  ", localPbw

proc cmdInstall*(platform: string, toPhone: bool, phoneIp: string, pbwPath: string = "") =
  ## Install to emulator or phone
  if not fileExists("package.json"):
    echo "Error: package.json not found"
    quit(1)
  
  let cfg = loadConfig()
  let defaultPbw = "build" / (cfg.name & ".pbw")
  
  if toPhone:
    # Install to phone
    if phoneIp == "":
      echo "Error: Phone IP required for --phone"
      quit(1)
      
    echo "Installing to phone ", phoneIp, "..."
    
    var cmd = "pebble install"
    if pbwPath != "":
      if not fileExists(pbwPath):
        echo "Error: PBW file not found: ", pbwPath
        quit(1)
      cmd.add(" " & pbwPath)
    elif fileExists(defaultPbw):
      cmd.add(" " & defaultPbw)
    
    cmd.add(" --phone " & phoneIp)
    
    echo "  Running: ", cmd
    let (output, exitCode) = execCmdEx(cmd)
    if exitCode != 0:
      echo "✗ Install failed"
      echo output
      quit(1)
    echo "✓ Installed to phone"
  else:
    # Install to emulator
    let targetPlatforms = if platform.toLowerAscii == "all":
      @validPlatforms
    else:
      let targetPlatform = if platform == "": "basalt" else: platform
      if not validatePlatform(targetPlatform):
        echo "Error: Invalid platform '", targetPlatform, "'"
        quit(1)
      @[targetPlatform]
    
    for p in targetPlatforms:
      echo "Installing to ", p, " emulator..."
      
      var cmd = "pebble install"
      if pbwPath != "":
        if not fileExists(pbwPath):
          echo "Error: PBW file not found: ", pbwPath
          quit(1)
        cmd.add(" " & pbwPath)
      elif fileExists(defaultPbw):
        cmd.add(" " & defaultPbw)
      
      cmd.add(" --emulator " & p)
      
      let (output, exitCode) = execCmdEx(cmd)
      if exitCode != 0:
        echo "✗ Install failed for ", p
        echo output
        if targetPlatforms.len == 1:
          quit(1)
      else:
        echo "✓ Installed to ", p, " emulator"
      
      if targetPlatforms.len > 1:
        # Give some time for emulator to start/settle before next install
        sleep(2000)

proc cmdLogs*(toPhone: bool, phoneIp: string, emulator: string) =
  ## View logs from emulator or phone
  var cmd = "pebble logs"
  
  if toPhone:
    if phoneIp == "":
      echo "Error: Phone IP required for --phone"
      quit(1)
    cmd.add(" --phone " & phoneIp)
    echo "Viewing logs from phone ", phoneIp, "..."
  else:
    cmd.add(" --emulator " & emulator)
    echo "Viewing logs from ", emulator, " emulator..."
  
  echo "  Running: ", cmd
  echo "  (Press Ctrl+C to stop)"
  echo ""
  
  # Use execCmd instead of execCmdEx for logs so it's interactive/streaming
  discard execCmd(cmd)

proc cmdKill*(force: bool) =
  ## Kill Pebble emulators
  echo "Killing Pebble emulators..."
  let cmd = if force: "pebble kill --force" else: "pebble kill"
  let (output, exitCode) = execCmdEx(cmd)
  if exitCode != 0:
    echo "✗ Failed to kill emulators"
    echo output
  else:
    echo "✓ Emulators killed"

proc cmdClean*() =
  ## Clean build artifacts
  echo "Cleaning build artifacts..."
  
  var cleaned = 0
  
  if dirExists("build"):
    removeDir("build")
    inc cleaned
    echo "✓ Removed build/"
  
  if dirExists("nimcache"):
    removeDir("nimcache")
    inc cleaned
    echo "✓ Removed nimcache/"
  
  # Find and remove .lock-waf* files
  for kind, path in walkDir("."):
    let filename = extractFilename(path)
    if kind == pcFile and filename.startsWith(".lock-waf"):
      removeFile(path)
      inc cleaned
      echo "✓ Removed ", path
  
  # Remove generated JS
  let genJs = "src" / "js" / "pebble-js-app.js"
  if fileExists(genJs):
    removeFile(genJs)
    inc cleaned
    echo "✓ Removed ", genJs
  
  # Remove generated C files
  let srcCDir = "src" / "c"
  if dirExists(srcCDir):
    removeDir(srcCDir)
    inc cleaned
    echo "✓ Removed ", srcCDir

  # Remove generated Nim keys
  let genNimDir = "src" / "gen"
  if dirExists(genNimDir):
    removeDir(genNimDir)
    inc cleaned
    echo "✓ Removed ", genNimDir
  
  if cleaned == 0:
    echo "Nothing to clean"
  else:
    echo ""
    echo "✓ Clean complete"

proc cmdSize*(platform: string) =
  ## Show binary size breakdown
  if not validatePlatform(platform):
    echo "Error: Invalid platform '", platform, "'"
    quit(1)
  
  if not fileExists("package.json"):
    echo "Error: package.json not found"
    quit(1)
  
  let cfg = loadConfig()
  let elfPath = "build" / platform / "pebble-app.elf"
  
  if not fileExists(elfPath):
    echo "Error: ", elfPath, " not found. Run 'nebble build' first."
    quit(1)
  
  echo "Binary size for ", platform, ":"
  echo ""
  
  # Run arm-none-eabi-size
  let cmd = "arm-none-eabi-size " & elfPath
  let (output, exitCode) = execCmdEx(cmd)
  
  if exitCode != 0:
    echo "Error: Could not run arm-none-eabi-size"
    echo "Make sure the ARM GCC toolchain is installed"
    quit(1)
  
  echo output
  
  # Calculate totals and percentages for Aplite (24KB RAM budget)
  if platform == "aplite":
    let lines = output.splitLines()
    if lines.len >= 2:
      let parts = lines[1].splitWhitespace()
      if parts.len >= 3:
        try:
          let text = parseInt(parts[0])
          let data = parseInt(parts[1])
          let bss = parseInt(parts[2])
          let total = text + data + bss
          
          const apliteRam = 24 * 1024  # 24 KB
          let percentUsed = (total.float / apliteRam.float) * 100.0
          let remaining = apliteRam - total
          
          echo ""
          echo "Aplite Memory Budget:"
          echo "  Total RAM: 24,576 bytes"
          echo "  Used:      ", total, " bytes (", percentUsed.formatFloat(ffDecimal, 1), "%)"
          echo "  Free:      ", remaining, " bytes"
          
          if total > apliteRam:
            echo ""
            echo "⚠ WARNING: Binary exceeds Aplite's 24KB RAM budget!"
        except ValueError:
          discard

proc cmdGenKeys*() =
  ## Generate type-safe message keys from package.json
  if not fileExists("package.json"):
    echo "Error: package.json not found. Run 'nebble new' to create a project."
    quit(1)
  
  let cfg = loadConfig()
  
  echo "Generating message keys from package.json..."
  
  if not generateMessageKeys(cfg):
    echo "✗ Failed to generate message keys"
    quit(1)
  
  echo ""
  echo "✓ Message keys generated successfully"
  echo ""
  echo "Usage:"
  echo "  import gen/app_keys"
  echo "  import nebble/comms/typed_message"
  echo ""
  echo "  # Send with type safety"
  echo "  send(amkCommand, 42'i32)"
  echo "  send(amkData, \"Hello\")"
  echo ""
  echo "  # Read with type safety"
  echo "  let cmd = readInt32(iter, amkCommand)"

proc cmdResources*(action: string, arg: string = "") =
  ## Manage project resources
  case action
  of "list":
    listResources()
  of "add":
    if arg.len == 0:
      echo "Usage: nebble resources add <path>"
      quit(1)
    if not addResource(arg): quit(1)
  of "validate":
    if validateResources(): echo "✓ Resources look good" else: echo "⚠ Resource validation failed"
  else:
    echo "Unknown resources action: ", action
    echo "Available: list, add, validate"

proc cmdDoctor*() =
  ## Diagnose development environment
  echo "Nebble Doctor - Environment checks"
  var issues = 0

  # Nim
  let (nimOut, nimCode) = execCmdEx("nim --version")
  if nimCode == 0:
    echo "✓ Nim: ", (if nimOut.splitLines().len > 0: nimOut.splitLines()[0].strip() else: nimOut.strip())
  else:
    echo "✗ Nim not found in PATH"
    inc issues

  # Pebble
  let (pebOut, pebCode) = execCmdEx("pebble --version")
  if pebCode == 0:
    echo "✓ Pebble SDK: ", (if pebOut.splitLines().len > 0: pebOut.splitLines()[0].strip() else: pebOut.strip())
  else:
    echo "✗ Pebble SDK not found (pebble CLI)"
    inc issues

  # ARM toolchain
  let (armOut, armCode) = execCmdEx("arm-none-eabi-gcc --version") 
  if armCode == 0:
    echo "✓ ARM toolchain: ", (if armOut.splitLines().len > 0: armOut.splitLines()[0].strip() else: armOut.strip())
  else:
    echo "✗ ARM GCC not found (arm-none-eabi-gcc)"
    inc issues

  # Project checks
  if fileExists("package.json"):
    echo "✓ package.json present"
  else:
    echo "⚠ package.json missing in current directory"
    inc issues

  if issues == 0:
    echo "\n✓ All checks passed"
  else:
    echo "\n⚠ Found ", issues, " issue(s)."

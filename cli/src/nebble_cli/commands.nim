## Nebble CLI Commands Implementation

import std/[os, strutils, osproc, json]
import config, templates, builder
import resources

const validPlatforms* = ["aplite", "basalt", "chalk", "diorite", "emery", "flint"]

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
  
  # Create nebble.json config
  let config = %* {
    "name": name,
    "type": appType,
    "version": "1.0.0",
    "uuid": generateUuid(),
    "platforms": ["aplite", "basalt", "chalk", "diorite", "emery", "flint"],
    "capabilities": [],
    "appKeys": {}
  }
  
  writeFile(name / "nebble.json", config.pretty)
  
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
  writeFile(name / ".gitignore", """
build/
nimcache/
.lock-waf*
*.pbw
""")
  
  echo "✓ Created project structure"
  echo "✓ Generated ", name, ".nim (", appType, ")"
  echo "✓ Generated nebble.json"
  echo ""
  echo "Next steps:"
  echo "  cd ", name
  echo "  nebble build"
  echo "  nebble install --emulator basalt"

proc cmdBuild*(platform: string) =
  ## Build the Nebble project
  if not fileExists("nebble.json"):
    echo "Error: nebble.json not found. Run 'nebble new' to create a project."
    quit(1)
  
  # Load config
  let cfg = loadConfig()
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
  
  # Build for each platform
  for p in platforms:
    echo "═══ Building for ", p, " ═══"
    
    # Step 1: Compile Nim to C
    if not compileNimToC(cfg, p):
      echo "✗ Nim compilation failed for ", p
      quit(1)
    echo "✓ Nim → C compilation successful"
    
    # Step 2: Generate appinfo.json
    if not generateAppInfo(cfg, p):
      echo "✗ appinfo.json generation failed"
      quit(1)
    echo "✓ Generated appinfo.json"
    
    # Step 3: Copy Nim-generated C files to Pebble project
    if not copyNimCFiles(cfg, p):
      echo "✗ Failed to copy C files"
      quit(1)
    echo "✓ Copied Nim-generated C files"
    
    # Step 4: Run Pebble build
    if not runPebbleBuild(p):
      echo "✗ Pebble build failed for ", p
      quit(1)
    echo "✓ Pebble build successful"
    echo ""
  
  echo "═══════════════════════════════"
  echo "✓ Build complete!"
  echo ""
  echo "Generated files:"
  for p in platforms:
    let pbwFile = "build" / (cfg.name & ".pbw")
    if fileExists(pbwFile):
      echo "  ", pbwFile, " (", p, ")"

proc cmdInstall*(platform: string, toPhone: bool, phoneIp: string) =
  ## Install to emulator or phone
  if not fileExists("nebble.json"):
    echo "Error: nebble.json not found"
    quit(1)
  
  let cfg = loadConfig()
  
  if toPhone:
    # Install to phone
    echo "Installing to phone", (if phoneIp != "": " " & phoneIp else: ""), "..."
    # Build command with proper escaping to prevent injection
    var args = @["install", "--phone"]
    if phoneIp != "":
      args.add(phoneIp)
    let (output, exitCode) = execCmdEx("pebble " & args.join(" "))
    if exitCode != 0:
      echo "✗ Install failed"
      echo output
      quit(1)
    echo "✓ Installed to phone"
  else:
    # Install to emulator
    if not validatePlatform(platform):
      echo "Error: Invalid platform '", platform, "'"
      quit(1)
    
    echo "Installing to ", platform, " emulator..."
    let cmd = "pebble install --emulator " & platform
    let (output, exitCode) = execCmdEx(cmd)
    if exitCode != 0:
      echo "✗ Install failed"
      echo output
      quit(1)
    echo "✓ Installed to ", platform, " emulator"

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
    if kind == pcFile and path.startsWith(".lock-waf"):
      removeFile(path)
      inc cleaned
      echo "✓ Removed ", path
  
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
  
  if not fileExists("nebble.json"):
    echo "Error: nebble.json not found"
    quit(1)
  
  let cfg = loadConfig()
  let elfPath = "build" / platform / cfg.name & ".elf"
  
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
  ## Generate type-safe message keys from nebble.json
  if not fileExists("nebble.json"):
    echo "Error: nebble.json not found. Run 'nebble new' to create a project."
    quit(1)
  
  let cfg = loadConfig()
  
  echo "Generating message keys from nebble.json..."
  
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
  if fileExists("nebble.json"):
    echo "✓ nebble.json present"
  else:
    echo "⚠ nebble.json missing in current directory"
    inc issues

  if issues == 0:
    echo "\n✓ All checks passed"
  else:
    echo "\n⚠ Found ", issues, " issue(s)."

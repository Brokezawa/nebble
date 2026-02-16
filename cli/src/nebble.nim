## Nebble CLI - Build tool for Pebble smartwatch apps in Nim
##
## Commands:
##   nebble new <name> [--watchface]  - Create new project
##   nebble build [--platform <p>]    - Build project
##   nebble install --emulator <p>    - Install to emulator
##   nebble clean                     - Clean build artifacts
##   nebble size [--platform <p>]     - Show binary size breakdown

import std/[os, strutils, tables, parseopt]
import nebble_cli/[commands, config, templates, builder]

const
  version = "0.2.0"
  helpText = """
Nebble - Pebble smartwatch app development in Nim

Usage:
  nebble new <name> [--watchface]     Create a new Pebble project
  nebble build [--platform <p>]       Build the project (default: all platforms)
  nebble install --emulator <p>       Install to emulator
  nebble install --phone <IP> [<pbw>] Install to phone (optionally specify IP and PBW file)
  nebble logs [--emulator <p>]        View logs from emulator
  nebble logs --phone <IP>            View logs from phone
  nebble kill [--force]               Kill all Pebble emulators
  nebble gen-keys                     Generate type-safe message keys from nebble.json
  nebble regen-ffi                    Regenerate Futhark FFI bindings (requires Futhark)
  nebble clean                        Remove build artifacts
  nebble size [--platform <p>]        Show binary size breakdown
  nebble help                         Show this help
  nebble version                      Show version
"""

proc showHelp() =
  echo helpText
  quit(0)

proc showVersion() =
  echo "nebble version ", version
  quit(0)

proc main() =
  var
    args = commandLineParams()
  
  if args.len == 0:
    showHelp()
  
  let command = args[0]
  
  case command
  of "help", "--help", "-h":
    showHelp()
  of "version", "--version", "-v":
    showVersion()
  of "new":
    if args.len < 2:
      echo "Error: Project name required"
      echo "Usage: nebble new <name> [--watchface]"
      quit(1)
    
    let projectName = args[1]
    var isWatchface = false
    
    for i in 2..<args.len:
      if args[i] == "--watchface":
        isWatchface = true
    
    cmdNew(projectName, isWatchface)
  
  of "build":
    var platform = ""
    for i in 1..<args.len:
      if args[i] == "--platform" and i + 1 < args.len:
        platform = args[i + 1]
        break
    
    cmdBuild(platform)
  
  of "install":
    var
      emulator = ""
      phoneIp = ""
      toPhone = false
      pbwPath = ""
    
    var i = 1
    while i < args.len:
      if args[i] == "--emulator" and i + 1 < args.len:
        emulator = args[i + 1]
        inc i, 2
      elif args[i] == "--phone":
        toPhone = true
        # Check if next arg is an IP address (not another flag)
        if i + 1 < args.len and not args[i + 1].startsWith("--"):
          phoneIp = args[i + 1]
          inc i, 2
          # Check if next arg is a PBW path
          if i < args.len and not args[i].startsWith("--"):
            pbwPath = args[i]
            inc i
        else:
          inc i
      else:
        inc i
    
    if emulator != "":
      cmdInstall(emulator, toPhone = false, phoneIp = "")
    elif toPhone:
      cmdInstall("", toPhone = true, phoneIp = phoneIp, pbwPath = pbwPath)
    else:
      echo "Error: Specify --emulator <platform> or --phone <IP> [<pbw>]"
      quit(1)
  
  of "logs":
    var
      emulator = "basalt" # Default emulator
      phoneIp = ""
      toPhone = false
    
    var i = 1
    while i < args.len:
      if args[i] == "--emulator":
        if i + 1 < args.len and not args[i+1].startsWith("--"):
          emulator = args[i + 1]
          inc i, 2
        else:
          # Use default if no platform specified
          inc i
      elif args[i] == "--phone":
        toPhone = true
        if i + 1 < args.len and not args[i + 1].startsWith("--"):
          phoneIp = args[i + 1]
          inc i, 2
        else:
          echo "Error: --phone requires an IP address"
          quit(1)
      else:
        inc i
    
    cmdLogs(toPhone, phoneIp, emulator)
  
  of "kill":
    var force = false
    for i in 1..<args.len:
      if args[i] == "--force":
        force = true
        break
    cmdKill(force)
  
  of "clean":
    cmdClean()
  
  of "size":
    var platform = "basalt"  # default
    for i in 1..<args.len:
      if args[i] == "--platform" and i + 1 < args.len:
        platform = args[i + 1]
        break
    
    cmdSize(platform)
  
  of "resources":
    var action = "list"
    if args.len > 1: action = args[1]
    var arg = ""
    if args.len > 2: arg = args[2]
    cmdResources(action, arg)
  
  of "doctor":
    cmdDoctor()
  
  of "gen-keys":
    cmdGenKeys()
  
  else:
    echo "Error: Unknown command '", command, "'"
    echo "Run 'nebble help' for usage information"
    quit(1)

when isMainModule:
  main()

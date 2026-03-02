## Configuration file handling for Nebble projects
## Parses package.json (Pebble SDK standard format)

import std/[json, os, random]

type
  NebbleConfig* = object
    name*: string           # Project name (from root)
    displayName*: string    # Display name (from pebble.displayName)
    appType*: string        # "watchface" or "app" (from pebble.watchapp.watchface)
    version*: string        # Version string
    uuid*: string           # App UUID
    platforms*: seq[string] # Target platforms
    capabilities*: seq[string] # App capabilities
    messageKeys*: JsonNode  # Message keys for AppMessage
    enableMultiJS*: bool    # Enable multiple JS files

proc loadConfig*(): NebbleConfig =
  ## Load package.json configuration file
  if not fileExists("package.json"):
    echo "Error: package.json not found"
    echo ""
    echo "Please create a package.json file for your project. Example:"
    echo "{"
    echo "  \"name\": \"my-app\","
    echo "  \"version\": \"1.0.0\","
    echo "  \"author\": \"Your Name\","
    echo "  \"pebble\": {"
    echo "    \"uuid\": \"<generate with 'nebble uuid'>\","
    echo "    \"displayName\": \"My App\","
    echo "    \"sdkVersion\": \"3\","
    echo "    \"targetPlatforms\": [\"basalt\", \"chalk\"],"
    echo "    \"watchapp\": {"
    echo "      \"watchface\": false"
    echo "    },"
    echo "    \"resources\": {"
    echo "      \"media\": []"
    echo "    }"
    echo "  }"
    echo "}"
    quit(1)
  
  let configJson = parseFile("package.json")
  
  # Root level fields
  result.name = configJson["name"].getStr()
  result.version = configJson["version"].getStr()
  
  # Pebble-specific configuration
  if configJson.hasKey("pebble"):
    let pebble = configJson["pebble"]
    
    result.uuid = pebble["uuid"].getStr()
    result.displayName = pebble{"displayName"}.getStr(result.name)
    result.enableMultiJS = pebble{"enableMultiJS"}.getBool(false)
    
    # Determine app type from watchface flag
    if pebble.hasKey("watchapp") and pebble["watchapp"].hasKey("watchface"):
      let isWatchface = pebble["watchapp"]["watchface"].getBool(false)
      result.appType = if isWatchface: "watchface" else: "app"
    else:
      result.appType = "app"  # Default to app
    
    # Target platforms
    result.platforms = @[]
    if pebble.hasKey("targetPlatforms"):
      for p in pebble["targetPlatforms"]:
        result.platforms.add(p.getStr())
    
    # Capabilities
    result.capabilities = @[]
    if pebble.hasKey("capabilities"):
      for c in pebble["capabilities"]:
        result.capabilities.add(c.getStr())
    
    # Message keys (previously appKeys)
    if pebble.hasKey("messageKeys"):
      result.messageKeys = pebble["messageKeys"]
    else:
      result.messageKeys = newJObject()
  else:
    echo "Error: package.json missing 'pebble' section"
    quit(1)

proc needsJavaScript*(cfg: NebbleConfig): bool =
  ## Check if the project has JavaScript capabilities
  ## Returns true if src/pkjs.nim exists
  fileExists("src" / "pkjs.nim")

proc generateUuid*(): string =
  ## Generate a random UUID for the project
  ## Format: xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx
  randomize()
  
  proc hexChar(): char =
    const hexChars = "0123456789abcdef"
    hexChars[rand(15)]
  
  proc hex4(): string =
    result = ""
    for i in 0..3:
      result.add(hexChar())
  
  result = hex4() & hex4() & "-" & hex4() & "-4" & hex4()[1..3] & "-" &
           (if rand(1) == 0: "8" else: "9") & hex4()[1..3] & "-" &
           hex4() & hex4() & hex4()

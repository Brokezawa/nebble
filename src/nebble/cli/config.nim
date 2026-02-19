## Configuration file handling for Nebble projects

import std/[json, os, random]

type
  NebbleConfig* = object
    name*: string
    appType*: string
    version*: string
    uuid*: string
    platforms*: seq[string]
    capabilities*: seq[string]
    appKeys*: JsonNode

proc loadConfig*(): NebbleConfig =
  ## Load nebble.json configuration file
  if not fileExists("nebble.json"):
    echo "Error: nebble.json not found"
    quit(1)
  
  let configJson = parseFile("nebble.json")
  
  result.name = configJson["name"].getStr()
  result.appType = configJson{"type"}.getStr("app")
  result.version = configJson["version"].getStr()
  result.uuid = configJson["uuid"].getStr()
  
  result.platforms = @[]
  for p in configJson["platforms"]:
    result.platforms.add(p.getStr())
  
  result.capabilities = @[]
  for c in configJson{"capabilities"}:
    result.capabilities.add(c.getStr())
  
  result.appKeys = configJson{"appKeys"}
  if result.appKeys.isNil:
    result.appKeys = newJObject()

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

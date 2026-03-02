## Resource management helpers for Nebble CLI

import std/[os, json]
import config

proc listResources*() =
  if not fileExists("package.json"):
    echo "Error: package.json not found"
    quit(1)
  let cfg = loadConfig()
  # For now, list entries under resources/ and messageKeys
  echo "Resources in project '", cfg.name, "':"
  if dirExists("resources"):
    for kind, path in walkDir("resources"):
      if kind == pcFile:
        echo "  - ", path
  else:
    echo "  (no resources directory)"
  if cfg.messageKeys.len > 0:
    echo "\nMessage Keys:" 
    for k, v in cfg.messageKeys:
      echo "  ", k, ": ", v

proc addResource*(srcPath: string, destName: string = ""): bool =
  if not fileExists(srcPath):
    echo "Error: Source resource not found: ", srcPath
    return false
  if not dirExists("resources"):
    createDir("resources")
  let base = if destName.len == 0: extractFilename(srcPath) else: destName
  let dest = "resources" / base
  try:
    copyFile(srcPath, dest)
    echo "Added resource: ", dest
    return true
  except OSError as e:
    echo "Error copying resource: ", e.msg
    return false

proc validateResources*(): bool =
  var ok = true
  if not fileExists("package.json"):
    echo "Error: package.json not found"
    return false
  let cfg = loadConfig()
  if cfg.messageKeys.len > 0:
    for k, v in cfg.messageKeys:
      # no-op: keys are logical, not physical
      discard
  if not dirExists("resources"):
    echo "Warning: resources/ directory missing"
    ok = false
  return ok

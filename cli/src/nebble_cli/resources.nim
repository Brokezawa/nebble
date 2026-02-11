## Resource management helpers for Nebble CLI

import std/[os, json, strutils, sequtils]
import config

proc listResources*() =
  if not fileExists("nebble.json"):
    echo "Error: nebble.json not found"
    quit(1)
  let cfg = loadConfig()
  # For now, list entries under resources/ and appKeys
  echo "Resources in project '", cfg.name, "':"
  if dirExists("resources"):
    for kind, path in walkDir("resources"):
      if kind == pcFile:
        echo "  - ", path
  else:
    echo "  (no resources directory)"
  if cfg.appKeys.len > 0:
    echo "\nApp Keys:" 
    for k, v in cfg.appKeys:
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
  if not fileExists("nebble.json"):
    echo "Error: nebble.json not found"
    return false
  let cfg = loadConfig()
  if cfg.appKeys.len > 0:
    for k, v in cfg.appKeys:
      # no-op: keys are logical, not physical
      discard
  if not dirExists("resources"):
    echo "Warning: resources/ directory missing"
    ok = false
  return ok

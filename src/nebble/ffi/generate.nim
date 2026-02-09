## Futhark binding generator for the Pebble SDK.
##
## Parses pebble.h via Futhark/opir/libclang on the HOST machine and
## generates Nim FFI bindings for a specific platform.
##
## Usage (one platform at a time):
##   nim r -d:futharkRebuild -d:platform=basalt src/nebble/ffi/generate.nim
##   nim r -d:futharkRebuild -d:platform=aplite src/nebble/ffi/generate.nim
##   ... etc for chalk, diorite, emery, flint
##
## Or generate all platforms:
##   for p in aplite basalt chalk diorite emery flint; do
##     nim r -d:futharkRebuild -d:opirRebuild -d:platform=$p src/nebble/ffi/generate.nim
##   done
##
## The generated output goes to src/nebble/ffi/generated/<platform>.nim
## and is committed to VCS so end users don't need Futhark/libclang.

import std/[os, strutils]
import futhark

const
  sdkBase = gorge("echo \"$HOME/Library/Application Support/Pebble SDK/SDKs/4.9.77/sdk-core/pebble\"").strip
  stubsDir = currentSourcePath.parentDir / "stubs"
  platform {.strdefine.} = "basalt"

static:
  doAssert platform in ["aplite", "basalt", "chalk", "diorite", "emery", "flint"],
    "Unknown platform '" & platform & "'. Use -d:platform=<name>"

const
  includeDir = sdkBase / platform / "include"
  outFile = currentSourcePath.parentDir / "generated" / platform & ".nim"

proc pebbleRenameCallback(name: string, kind: SymbolKind, partof: string,
                          overloading: var bool): string =
  ## Rename C identifiers that clash with Nim reserved words.
  let lower = name.toLowerAscii
  case lower
  of "type", "set", "from", "result", "iterator",
     "addr", "ptr", "ref", "var", "let", "const",
     "proc", "method", "object", "in", "out", "of",
     "is", "not", "and", "or", "xor", "div", "mod",
     "shl", "shr", "nil", "true", "false", "discard",
     "block", "break", "continue", "return", "yield",
     "import", "export", "include", "except", "finally",
     "raise", "try", "template", "macro", "mixin", "bind",
     "defer", "do", "func", "enum", "tuple", "array",
     "seq", "string", "when", "while", "for", "if",
     "else", "elif", "case", "end", "asm", "cast",
     "static", "interface", "converter", "concept":
    return name & "_f"
  else:
    return name

# Each platform has its own importc block because Futhark's macro DSL
# doesn't support runtime/conditional directives inside the block.

when platform == "aplite":
  importc:
    outputPath outFile
    path includeDir
    path stubsDir
    sysPath "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
    compilerArg "-std=c99"
    define PBL_PLATFORM_APLITE
    define PBL_BW
    define PBL_RECT
    define PBL_SDK_3
    define PBL_DISPLAY_WIDTH, 144
    define PBL_DISPLAY_HEIGHT, 168
    renameCallback pebbleRenameCallback
    "pebble.h"

elif platform == "basalt":
  importc:
    outputPath outFile
    path includeDir
    path stubsDir
    sysPath "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
    compilerArg "-std=c99"
    define PBL_PLATFORM_BASALT
    define PBL_COLOR
    define PBL_RECT
    define PBL_MICROPHONE
    define PBL_SMARTSTRAP
    define PBL_HEALTH
    define PBL_COMPASS
    define PBL_SDK_3
    define PBL_DISPLAY_WIDTH, 144
    define PBL_DISPLAY_HEIGHT, 168
    renameCallback pebbleRenameCallback
    "pebble.h"

elif platform == "chalk":
  importc:
    outputPath outFile
    path includeDir
    path stubsDir
    sysPath "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
    compilerArg "-std=c99"
    define PBL_PLATFORM_CHALK
    define PBL_COLOR
    define PBL_ROUND
    define PBL_MICROPHONE
    define PBL_SMARTSTRAP
    define PBL_HEALTH
    define PBL_COMPASS
    define PBL_SDK_3
    define PBL_DISPLAY_WIDTH, 180
    define PBL_DISPLAY_HEIGHT, 180
    renameCallback pebbleRenameCallback
    "pebble.h"

elif platform == "diorite":
  importc:
    outputPath outFile
    path includeDir
    path stubsDir
    sysPath "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
    compilerArg "-std=c99"
    define PBL_PLATFORM_DIORITE
    define PBL_BW
    define PBL_RECT
    define PBL_MICROPHONE
    define PBL_HEALTH
    define PBL_COMPASS
    define PBL_SDK_3
    define PBL_DISPLAY_WIDTH, 144
    define PBL_DISPLAY_HEIGHT, 168
    renameCallback pebbleRenameCallback
    "pebble.h"

elif platform == "emery":
  importc:
    outputPath outFile
    path includeDir
    path stubsDir
    sysPath "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
    compilerArg "-std=c99"
    define PBL_PLATFORM_EMERY
    define PBL_COLOR
    define PBL_RECT
    define PBL_MICROPHONE
    define PBL_SMARTSTRAP
    define PBL_SMARTSTRAP_POWER
    define PBL_HEALTH
    define PBL_COMPASS
    define PBL_SDK_3
    define PBL_DISPLAY_WIDTH, 200
    define PBL_DISPLAY_HEIGHT, 228
    renameCallback pebbleRenameCallback
    "pebble.h"

elif platform == "flint":
  importc:
    outputPath outFile
    path includeDir
    path stubsDir
    sysPath "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
    compilerArg "-std=c99"
    define PBL_PLATFORM_FLINT
    define PBL_BW
    define PBL_RECT
    define PBL_MICROPHONE
    define PBL_HEALTH
    define PBL_COMPASS
    define PBL_SDK_3
    define PBL_DISPLAY_WIDTH, 144
    define PBL_DISPLAY_HEIGHT, 168
    renameCallback pebbleRenameCallback
    "pebble.h"

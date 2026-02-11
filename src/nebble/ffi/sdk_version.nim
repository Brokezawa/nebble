## Pebble SDK Version Information
##
## This file tracks the SDK version used to generate FFI bindings.
## It is updated automatically when bindings are regenerated.

const
  ## Current Pebble SDK version
  PebbleSdkVersion* = "4.3.0"
  
  ## Date when bindings were last generated
  FutharkGenerationDate* = "2026-02-10"
  
  ## Futhark version used for generation
  FutharkVersion* = "0.1.0"
  
  ## List of supported platforms
  SupportedPlatforms* = [
    "aplite",
    "basalt", 
    "chalk",
    "diorite",
    "emery",
    "flint"
  ]

## Check if current SDK version matches tracked version
proc sdkVersionMatches*(version: string): bool =
  version == PebbleSdkVersion

## Get generation info as formatted string
proc generationInfo*(): string =
  result = "Pebble SDK " & PebbleSdkVersion & " (generated " & FutharkGenerationDate & ")"

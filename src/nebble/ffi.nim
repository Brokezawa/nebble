## Low-level FFI bindings for the Pebble SDK.
##
## This module selects the correct platform-specific bindings based on
## compile-time `-d:pebble<Platform>` flags and re-exports everything
## along with manual macro supplements.
##
## Usage:
##   import nebble/ffi
##
## Compile with one of:
##   -d:pebbleAplite
##   -d:pebbleBasalt    (default if none specified)
##   -d:pebbleChalk
##   -d:pebbleDiorite
##   -d:pebbleEmery
##   -d:pebbleFlint
##   -d:pebbleGabbro

# Platform capabilities
when defined(pebbleBasalt) or defined(pebbleChalk) or defined(pebbleEmery) or defined(pebbleGabbro):
  {.define: pebbleColor.}
else:
  discard

when defined(pebbleChalk) or defined(pebbleGabbro):
  {.define: pebbleRound.}
else:
  discard

when defined(pebbleAplite):
  include nebble/ffi/generated/aplite
elif defined(pebbleBasalt):
  include nebble/ffi/generated/basalt
elif defined(pebbleChalk):
  include nebble/ffi/generated/chalk
elif defined(pebbleDiorite):
  include nebble/ffi/generated/diorite
elif defined(pebbleEmery):
  include nebble/ffi/generated/emery
elif defined(pebbleFlint):
  include nebble/ffi/generated/flint
elif defined(pebbleGabbro):
  include nebble/ffi/generated/gabbro
else:
  # Default to basalt if no platform specified
  {.warning: "No Pebble platform specified, defaulting to basalt. Use -d:pebbleBasalt to suppress this warning.".}
  include nebble/ffi/generated/basalt

# Manual implementations of C macros that Futhark can't wrap
include nebble/ffi/macros

## Managed Resource Infrastructure for ARC Memory Safety
##
## This module provides the foundational types, templates, and macros for creating
## ARC-managed wrappers around Pebble C objects. These wrappers use Nim's
## destructor system (`=destroy`, `=copy`, `=sink`) to automatically manage
## object lifecycles, preventing memory leaks and double-frees.
##
## **Design Philosophy:**
## - Optional managed wrappers coexist with manual `ptr T` API
## - Zero runtime overhead when not used
## - Explicit opt-in via `*Handle` types
## - Unique ownership by default (prevents double-free)
## - Stack-aware and hierarchy-aware variants for complex lifecycles
##
## **Usage Example:**
##   import nebble/ffi/managed
##   import nebble/ui/text_layer_managed
##   
##   proc myApp() =
##     var layer = newTextLayerHandle(makeGRect(0, 50, 144, 40))
##     layer.text = "Hello"
##     # layer.destroy() called automatically when scope ends
##
## **References:**
## - Nim Destructors: https://nim-lang.org/docs/destructors.html
## - Raw Memory Patterns: https://ramanlabs.in/static/blog/raw_memory_management_patterns_in_nim_language.html
## - C Library Wrapping: https://peterme.net/wrapping-c-libraries-in-nim.html

import std/macros
import nebble/ffi

# ============================================================================
# Safety Level Configuration
# ============================================================================

when defined(nebbleManagedDebug):
  ## Enable runtime safety checks (assertions, logging)
  ## Define this flag for debugging: -d:nebbleManagedDebug
  const ManagedDebug* = true
else:
  const ManagedDebug* = false

when defined(nebbleManagedStrict):
  ## Enable strict mode (extra assertions, panic on misuse)
  ## Define this flag for strict checking: -d:nebbleManagedStrict
  const ManagedStrict* = true
else:
  const ManagedStrict* = false

# ============================================================================
# Core Template: DefineUniqueHandle
# ============================================================================

template DefineUniqueHandle*(Name: untyped, RawType: typedesc, 
                            createProc: untyped, destroyProc: untyped) =
  ## Define a unique ownership handle for a C resource.
  ##
  ## This template generates a complete managed type with:
  ## - Automatic destruction via `=destroy` hook
  ## - Move semantics (copying disabled with `{.error.}`)
  ## - Converters for C API compatibility
  ## - Nil safety checks
  ##
  ## **Parameters:**
  ## - `Name`: Base name for the handle type (e.g., `TextLayer` becomes `TextLayerHandle`)
  ## - `RawType`: The underlying C struct type (e.g., `TextLayer`)
  ## - `createProc`: The C constructor function (e.g., `text_layer_create`)
  ## - `destroyProc`: The C destructor function (e.g., `text_layer_destroy`)
  ##
  ## **Generated Types:**
  ## - `Name Handle`: The distinct handle type
  ## - Converters: `toPtr`, `toHandle` for seamless C interop
  ## - Lifetime hooks: `=destroy`, `=wasMoved`, `=copy` (error), `=sink`
  ##
  ## **Usage:**
  ##   DefineUniqueHandle(TextLayer, TextLayer, 
  ##                     text_layer_create, text_layer_destroy)
  ##
  ##   var h = newTextLayerHandle(frame)  # Creates handle
  ##   # ... use h ...
  ##   # h destroyed automatically when scope ends
  
  # Define the type first
  type `Name Handle`* = distinct ptr RawType
    ## Unique ownership handle for `RawType`.
    ## 
    ## **Memory Safety:** This handle has unique ownership of the underlying
    ## C resource. When the handle goes out of scope, `destroyProc` is called
    ## automatically. Copying is disabled to prevent double-free.
    ##
    ## **C Interop:** Use explicit cast to get the raw pointer for C API calls.
  
  # Define ALL hooks immediately after type (required by Nim)
  # Order matters: hooks must be defined before any usage
  
  proc `=destroy`*(h: var `Name Handle`) =
    ## Destructor - automatically called when handle goes out of scope.
    let p = cast[ptr RawType](h)
    when ManagedDebug:
      if p != nil:
        discard  # Could add logging here in debug mode
    if p != nil:
      destroyProc(p)
      var hp = cast[ptr ptr RawType](addr h)
      hp[] = nil  # Prevent double-free
  
  proc `=wasMoved`*(h: var `Name Handle`) =
    ## Mark handle as moved (sets to nil).
    var p = cast[ptr ptr RawType](addr h)
    p[] = nil
  
  proc `=copy`*(dest: var `Name Handle`, src: `Name Handle`) {.error.} =
    ## Copying is disabled - use move semantics.
    discard
  
  proc `=sink`*(dest: var `Name Handle`, src: `Name Handle`) =
    ## Move assignment - transfers ownership from src to dest.
    # Note: src is a sink parameter (passed by value but consumed)
    # We move the pointer from src to dest, and leave src as nil
    var destP = cast[ptr ptr RawType](addr dest)
    # First destroy any existing resource in dest
    if destP[] != nil:
      destroyProc(destP[])
    # Move pointer from src to dest
    let srcP = cast[ptr ptr RawType](unsafeAddr src)
    destP[] = srcP[]
    # Zero out src to prevent double-free
    srcP[] = nil
  
  # Converters (defined after hooks)
  converter toPtr*(h: `Name Handle`): ptr RawType =
    ## Convert handle to raw pointer for C API calls.
    cast[ptr RawType](h)
  
  # Utility functions
  proc isValid*(h: `Name Handle`): bool {.inline.} =
    ## Check if handle points to valid (non-nil) resource.
    cast[ptr RawType](h) != nil
  
  proc isNil*(h: `Name Handle`): bool {.inline.} =
    ## Check if handle is nil (convenience function).
    cast[ptr RawType](h) == nil
  
  proc reset*(h: var `Name Handle`) =
    ## Explicitly destroy resource and reset handle to nil.
    `=destroy`(h)
    `=wasMoved`(h)

# ============================================================================
# Debug Mode Checkers
# ============================================================================

when ManagedDebug or ManagedStrict:
  template checkValid*(h: typed) =
    ## Runtime check for valid handle (debug builds only).
    when ManagedDebug or ManagedStrict:
      when compiles(h.isValid):
        if not h.isValid:
          when ManagedStrict:
            raise newException(AssertionDefect, "Operation on invalid/moved handle")
else:
  template checkValid*(h: typed) =
    ## No-op in release builds
    discard

template moved*(h: typed): bool =
  ## Check if handle has been moved (nil).
  when compiles(h.isValid):
    not h.isValid
  else:
    false

# ============================================================================
# RAII Pattern Templates
# ============================================================================

template withResource*(createExpr: untyped, varName: untyped, body: untyped) =
  ## RAII-style resource management block.
  block:
    var varName = createExpr
    try:
      body
    finally:
      when compiles(varName.reset):
        varName.reset()

template deferDestroy*(varName: untyped, body: untyped) =
  ## Defer destruction until after body executes.
  block:
    try:
      body
    finally:
      when compiles(varName.reset):
        varName.reset()

# ============================================================================
# Service Subscription RAII
# ============================================================================

type ServiceSubscription* = object
  ## RAII wrapper for Pebble Event Service subscriptions.
  serviceName*: string
  isSubscribed*: bool

proc `=destroy`*(s: var ServiceSubscription) =
  ## Unsubscribe from service if still subscribed.
  if s.isSubscribed:
    case s.serviceName
    of "tick": 
      when declared(tick_timer_service_unsubscribe):
        tick_timer_service_unsubscribe()
    of "battery":
      when declared(battery_state_service_unsubscribe):
        battery_state_service_unsubscribe()
    of "accel":
      when declared(accel_data_service_unsubscribe):
        accel_data_service_unsubscribe()
    of "connection":
      when declared(bluetooth_connection_service_unsubscribe):
        bluetooth_connection_service_unsubscribe()
    of "compass":
      when declared(compass_service_unsubscribe):
        compass_service_unsubscribe()
    of "health":
      when declared(health_service_events_unsubscribe):
        discard health_service_events_unsubscribe()
    of "focus":
      when declared(app_focus_service_unsubscribe):
        app_focus_service_unsubscribe()
    else:
      discard
    s.isSubscribed = false

template withService*(serviceName: string, subscribeProc: untyped, body: untyped) =
  ## Subscribe to a service, execute body, then auto-unsubscribe.
  block:
    var sub = ServiceSubscription(serviceName: serviceName, isSubscribed: true)
    subscribeProc
    try:
      body
    finally:
      discard

# ============================================================================
# Export Section
# ============================================================================

## The managed infrastructure provides:
## - `DefineUniqueHandle`: Template for creating managed types
## - `ServiceSubscription`: RAII service subscription wrapper
## - `checkValid`, `moved`: Debug utilities
## - `withResource`, `withService`: RAII pattern templates

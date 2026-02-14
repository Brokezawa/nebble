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
##   import nebble/ui/text_layer
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
# Handle Ownership Model
# ============================================================================

type
  HandleOwnership* = enum
    ## Defines the ownership level of a managed handle.
    hoNone      ## Not initialized or has been moved
    hoOwned     ## Handle owns the resource; will call C destroy
    hoUnowned   ## Transient wrapper around a raw pointer; will NOT call C destroy
    hoParented  ## Resource is owned by a parent (e.g. Layer); will NOT call C destroy

# ============================================================================
# Core Template: DefineUniqueHandle
# ============================================================================

template DefineUniqueHandle*(Name: untyped, RawType: typedesc, 
                            createProc: untyped, destroyProc: untyped) =
  ## Define a unique ownership handle for a C resource.
  
  type `Name Handle`* = object
    ## Unique ownership handle for `RawType`.
    pRaw: ptr RawType
    ownership: HandleOwnership
    pParent: ptr Layer # Optional parent tracking for layers

  proc `=destroy`*(h: var `Name Handle`) =
    if h.pRaw != nil and h.ownership == hoOwned:
      destroyProc(h.pRaw)
    h.pRaw = nil
    h.ownership = hoNone
    h.pParent = nil

  proc `=wasMoved`*(h: var `Name Handle`) =
    h.pRaw = nil
    h.ownership = hoNone
    h.pParent = nil

  proc `=copy`*(dest: var `Name Handle`, src: `Name Handle`) {.error.} = discard

  proc `=sink`*(dest: var `Name Handle`, src: `Name Handle`) =
    `=destroy`(dest)
    dest.pRaw = src.pRaw
    dest.ownership = src.ownership
    dest.pParent = src.pParent
    var srcPtr = cast[ptr `Name Handle`](unsafeAddr src)
    srcPtr.pRaw = nil
    srcPtr.ownership = hoNone
    srcPtr.pParent = nil

  converter toPtr*(h: `Name Handle`): ptr RawType = h.pRaw

  converter toLayer*(h: `Name Handle`): ptr Layer = 
    cast[ptr Layer](h.pRaw)

  proc toHandle*(p: ptr RawType): `Name Handle` {.inline.} =
    ## Wrap raw pointer in handle (unowned).
    `Name Handle`(pRaw: p, ownership: hoUnowned, pParent: nil)

  proc wrapOwned*(p: ptr RawType): `Name Handle` {.inline.} =
    ## Wrap raw pointer in handle (owned).
    `Name Handle`(pRaw: p, ownership: hoOwned, pParent: nil)

  proc isValid*(h: `Name Handle`): bool {.inline.} = h.pRaw != nil
  proc isNil*(h: `Name Handle`): bool {.inline.} = h.pRaw == nil

  proc setParent*(h: var `Name Handle`, p: ptr Layer) {.inline.} =
    if p != nil:
      h.pParent = p
      if h.ownership == hoOwned:
        h.ownership = hoParented
    else:
      h.pParent = nil
      if h.ownership == hoParented:
        h.ownership = hoOwned

  proc reset*(h: var `Name Handle`) =
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

type
  ServiceType* = enum
    ## Event service types for RAII subscription management.
    stTick, stBattery, stAccel, stConnection, stCompass, stHealth, stFocus

  ServiceSubscription* = object
    ## RAII wrapper for Pebble Event Service subscriptions.
    serviceType*: ServiceType
    isSubscribed*: bool

proc `=destroy`*(s: var ServiceSubscription) =
  ## Unsubscribe from service if still subscribed.
  if s.isSubscribed:
    case s.serviceType
    of stTick: 
      when declared(tick_timer_service_unsubscribe):
        tick_timer_service_unsubscribe()
    of stBattery:
      when declared(battery_state_service_unsubscribe):
        battery_state_service_unsubscribe()
    of stAccel:
      when declared(accel_data_service_unsubscribe):
        accel_data_service_unsubscribe()
    of stConnection:
      when declared(bluetooth_connection_service_unsubscribe):
        bluetooth_connection_service_unsubscribe()
    of stCompass:
      when declared(compass_service_unsubscribe):
        compass_service_unsubscribe()
    of stHealth:
      when declared(health_service_events_unsubscribe):
        discard health_service_events_unsubscribe()
    of stFocus:
      when declared(app_focus_service_unsubscribe):
        app_focus_service_unsubscribe()
    s.isSubscribed = false

template withService*(serviceType: ServiceType, subscribeProc: untyped, body: untyped) =
  ## Subscribe to a service, execute body, then auto-unsubscribe.
  block:
    var sub = ServiceSubscription(serviceType: serviceType, isSubscribed: true)
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

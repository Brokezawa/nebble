## Generic Resource State Enumeration
##
## Provides a unified state enumeration for all managed resource types
## that have complex lifecycles (windows, animations, etc.)

type ResourceState* = enum
  ## Generic lifecycle states for managed resources.
  ##
  ## Used by WindowHandle, AnimationHandle, and other resources
  ## that require state tracking for safe destruction.
  
  rsCreated = 0      ## Resource created but not yet activated
  rsActive = 1       ## Resource is active (on stack, scheduled, running, etc.)
  rsInactive = 2     ## Resource was active but is now inactive (popped, unscheduled, completed)
  rsDestroyed = 3    ## Resource has been destroyed

## State transition helpers
template isCreated*(state: ResourceState): bool = state == rsCreated
template isActive*(state: ResourceState): bool = state == rsActive
template isInactive*(state: ResourceState): bool = state == rsInactive
template isDestroyed*(state: ResourceState): bool = state == rsDestroyed
template canDestroy*(state: ResourceState): bool = state in [rsCreated, rsInactive]

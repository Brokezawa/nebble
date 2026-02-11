## ARC-Managed Layer Handle (Hierarchy-Aware)
##
## Provides automatic memory management for Layer objects with parent-child
## relationship tracking to prevent double-free errors.
##
## **Key Challenge:** When a Layer is added to a parent, destroying the parent
## automatically destroys the child. This handle tracks parent relationships
## to avoid destroying children that have already been destroyed by their parent.
##
## **Usage Example:**
##   ```nim
##   import nebble/ui/layer_managed
##   
##   var parentLayer: LayerHandle
##   var childLayer: LayerHandle
##   
##   proc windowLoad(win: ptr Window) {.cdecl.} =
##     parentLayer = newLayerHandle(makeGRect(0, 0, 144, 168))
##     childLayer = newLayerHandle(makeGRect(10, 10, 124, 40))
##     
##     # Add child to parent - parent now owns child
##     parentLayer.addChild(childLayer)
##     
##     win.rootLayer.addChild(parentLayer.getLayer())
##   
##   proc windowUnload(win: ptr Window) {.cdecl.} =
##     # Only parentLayer is destroyed here
##     # childLayer was already destroyed when parent was destroyed
##     parentLayer = LayerHandle(nil)
##     childLayer = LayerHandle(nil)  # Safe - checks parent before destroy
##   ```

import nebble/ffi
import nebble/ffi/managed
import nebble/ui/layer

when false:
  discard layer

# ============================================================================
# Hierarchy-Aware Layer Handle
# ============================================================================

type LayerHandle* = object
  ## Managed handle for Layer with parent-child tracking.
  ## 
  ## When added to a parent via `addChild`, the child tracks its parent
  ## to avoid double-free when the parent destroys children.
  raw: ptr Layer
  parent: ptr Layer  ## nil if not added to parent, otherwise parent pointer

# ============================================================================
# ARC Lifetime Hooks
# ============================================================================

proc `=destroy`*(h: var LayerHandle) =
  ## Destructor - destroys layer only if it has no parent.
  ## 
  ## If the layer has a parent, the parent will destroy it, so we skip
  ## destruction here to avoid double-free.
  if h.raw != nil and h.parent == nil:
    layer_destroy(h.raw)
  h.raw = nil
  h.parent = nil

proc `=wasMoved`*(h: var LayerHandle) =
  ## Mark handle as moved.
  h.raw = nil
  h.parent = nil

proc `=copy`*(dest: var LayerHandle, src: LayerHandle) {.error.} =
  ## Copying disabled - use move semantics.
  discard

proc `=sink`*(dest: var LayerHandle, src: LayerHandle) =
  ## Move assignment - transfers ownership.
  # Note: src is a sink parameter (passed by value but consumed)
  # We move the data from src to dest, and leave src as nil
  `=destroy`(dest)
  dest.raw = src.raw
  dest.parent = src.parent
  # Zero out src via unsafeAddr since src is immutable
  var srcPtr = cast[ptr LayerHandle](unsafeAddr src)
  srcPtr.raw = nil
  srcPtr.parent = nil

# ============================================================================
# Converters
# ============================================================================

converter toPtr*(h: LayerHandle): ptr Layer =
  ## Convert handle to raw pointer for C API calls.
  h.raw

converter toHandle*(p: ptr Layer): LayerHandle =
  ## Wrap raw pointer in handle.
  ## Note: Created handle has no parent tracking. Use with care.
  LayerHandle(raw: p, parent: nil)

# ============================================================================
# Utility Functions
# ============================================================================

proc isValid*(h: LayerHandle): bool {.inline.} =
  ## Check if handle points to valid (non-nil) layer.
  h.raw != nil

proc hasParent*(h: LayerHandle): bool {.inline.} =
  ## Check if layer has a parent (was added to another layer).
  h.parent != nil

proc reset*(h: var LayerHandle) =
  ## Explicitly destroy layer (if no parent) and reset handle.
  `=destroy`(h)
  `=wasMoved`(h)

when ManagedDebug or ManagedStrict:
  proc checkValid*(h: LayerHandle) =
    ## Runtime check for valid handle (debug builds only).
    if not h.isValid:
      when ManagedStrict:
        raise newException(AssertionDefect, "Operation on invalid/moved LayerHandle")

# ============================================================================
# Constructors
# ============================================================================

proc newLayerHandle*(frame: GRect): LayerHandle {.inline.} =
  ## Create a new managed Layer.
  ##
  ## **Parameters:**
  ## - `frame`: The frame rectangle for the layer
  ##
  ## **Example:**
  ##   var layer = newLayerHandle(makeGRect(0, 0, 144, 168))
  result.raw = layer_create(frame)
  result.parent = nil

# ============================================================================
# Hierarchy Management
# ============================================================================

proc addChild*(parent: var LayerHandle, child: var LayerHandle) {.inline.} =
  ## Add child layer to parent. Parent takes ownership of child.
  ##
  ## **Important:** After calling this, the child should not be destroyed
  ## directly. Destroying the parent will automatically destroy the child.
  ##
  ## **Example:**
  ##   parentLayer.addChild(childLayer)
  ##   # childLayer will be destroyed when parentLayer is destroyed
  when ManagedDebug or ManagedStrict:
    parent.checkValid()
    child.checkValid()
  
  layer_add_child(parent.raw, child.raw)
  child.parent = parent.raw  # Track parent to prevent double-free

proc removeFromParent*(child: var LayerHandle) {.inline.} =
  ## Remove this layer from its parent.
  ##
  ## After removal, the layer becomes an orphan and must be destroyed
  ## explicitly or added to another parent.
  when ManagedDebug or ManagedStrict:
    child.checkValid()
  
  layer_remove_from_parent(child.raw)
  child.parent = nil  # No longer has a parent

proc setParent*(child: var LayerHandle, parentPtr: ptr Layer) {.inline.} =
  ## Internal helper to set the parent pointer on a child handle.
  ## Use this when a non-LayerHandle parent (e.g. ScrollLayer) owns the child.
  child.parent = parentPtr

proc removeChildLayers*(parent: var LayerHandle) {.inline.} =
  ## Remove all child layers from this parent.
  ##
  ## The children are NOT destroyed, just removed. They become orphans
  ## and must be managed separately.
  when ManagedDebug or ManagedStrict:
    parent.checkValid()
  
  layer_remove_child_layers(parent.raw)
  # Note: We don't track individual children, so their parent pointers
  # may be stale. This is a limitation - don't use handles for removed children.

# ============================================================================
# Frame and Bounds
# ============================================================================

proc frame*(h: LayerHandle): GRect {.inline.} =
  ## Get the layer's frame (position in parent coordinate system).
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_get_frame(h.raw)

proc `frame=`*(h: LayerHandle, value: GRect) {.inline.} =
  ## Set the layer's frame.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_set_frame(h.raw, value)

proc bounds*(h: LayerHandle): GRect {.inline.} =
  ## Get the layer's bounds (local coordinate system, origin at 0,0).
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_get_bounds(h.raw)

proc `bounds=`*(h: LayerHandle, value: GRect) {.inline.} =
  ## Set the layer's bounds.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_set_bounds(h.raw, value)

# ============================================================================
# Visibility and Appearance
# ============================================================================

proc hidden*(h: LayerHandle): bool {.inline.} =
  ## Check if layer is hidden.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_get_hidden(h.raw)

proc `hidden=`*(h: LayerHandle, value: bool) {.inline.} =
  ## Set layer visibility.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_set_hidden(h.raw, value)

proc clips*(h: LayerHandle): bool {.inline.} =
  ## Check if layer clips child drawing.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_get_clips(h.raw)

proc `clips=`*(h: LayerHandle, value: bool) {.inline.} =
  ## Set whether layer clips child drawing.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_set_clips(h.raw, value)

# ============================================================================
# Updates and Marking Dirty
# ============================================================================

proc markDirty*(h: LayerHandle) {.inline.} =
  ## Mark layer as dirty to request redraw.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_mark_dirty(h.raw)

# ============================================================================
# Window Association
# ============================================================================

proc getWindow*(h: LayerHandle): ptr Window {.inline.} =
  ## Get the window containing this layer.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_get_window(h.raw)

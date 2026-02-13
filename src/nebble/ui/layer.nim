## ARC-Managed Layer Handle (Hierarchy-Aware)
##
## Provides automatic memory management for Layer objects with parent-child
## relationship tracking to prevent double-free errors.
##
## **Key Challenge:** When a Layer is added to a parent, destroying the parent
## automatically destroys the child. This handle tracks parent relationships
## to avoid destroying children that have already been destroyed by their parent.

import nebble/ffi
import nebble/ffi/managed

export ffi.Layer, ffi.GRect, ffi.GPoint, ffi.GSize
export ffi.makeGRect, ffi.makeGPoint, ffi.makeGSize
export ffi.LayerUpdateProc

# ============================================================================
# Hierarchy-Aware Layer Handle
# ============================================================================

type LayerHandle* = object
  ## Managed handle for Layer with parent-child tracking.
  ## 
  ## When added to a parent via `addChild`, the child tracks its parent
  ## to avoid double-free when the parent destroys children.
  pRaw*: ptr Layer
  pParent*: ptr Layer  ## nil if not added to parent, otherwise parent pointer

# ============================================================================
# ARC Lifetime Hooks
# ============================================================================

proc `=destroy`*(h: var LayerHandle) =
  ## Destructor - destroys layer only if it has no parent.
  if h.pRaw != nil and h.pParent == nil:
    ffi.layer_destroy(h.pRaw)
  h.pRaw = nil
  h.pParent = nil

proc `=wasMoved`*(h: var LayerHandle) =
  ## Mark handle as moved.
  h.pRaw = nil
  h.pParent = nil

proc `=copy`*(dest: var LayerHandle, src: LayerHandle) {.error.} =
  ## Copying disabled - use move semantics.
  discard

proc `=sink`*(dest: var LayerHandle, src: LayerHandle) =
  ## Move assignment - transfers ownership.
  `=destroy`(dest)
  dest.pRaw = src.pRaw
  dest.pParent = src.pParent
  var srcPtr = cast[ptr LayerHandle](unsafeAddr src)
  srcPtr.pRaw = nil
  srcPtr.pParent = nil

# ============================================================================
# Converters
# ============================================================================

converter toPtr*(h: LayerHandle): ptr Layer =
  ## Convert handle to raw pointer for C API calls.
  h.pRaw

proc toHandle*(p: ptr Layer): LayerHandle {.inline.} =
  ## Wrap raw pointer in handle (unowned).
  LayerHandle(pRaw: p, pParent: cast[ptr Layer](1))

# ============================================================================
# Utility Functions
# ============================================================================

proc isValid*(h: LayerHandle): bool {.inline.} =
  ## Check if handle points to valid (non-nil) layer.
  h.pRaw != nil

proc hasParent*(h: LayerHandle): bool {.inline.} =
  ## Check if layer has a parent (was added to another layer).
  h.pParent != nil

proc reset*(h: var LayerHandle) =
  ## Explicitly destroy layer (if no parent) and reset handle.
  `=destroy`(h)
  `=wasMoved`(h)

when ManagedDebug or ManagedStrict:
  proc checkValid*(h: LayerHandle) =
    ## Runtime check for valid handle.
    if not h.isValid:
      when ManagedStrict:
        raise newException(AssertionDefect, "Operation on invalid/moved LayerHandle")

# ============================================================================
# Constructors
# ============================================================================

proc newLayerHandle*(frame: GRect): LayerHandle {.inline.} =
  ## Create a new managed Layer.
  result.pRaw = ffi.layer_create(frame)
  result.pParent = nil

proc newLayer*(frame: GRect): LayerHandle {.inline.} =
  ## Alias for `newLayerHandle`.
  result = newLayerHandle(frame)

proc newLayerWithData*(frame: GRect, dataSize: int): LayerHandle {.inline.} =
  ## Create a new managed Layer with custom data storage.
  result.pRaw = ffi.layer_create_with_data(frame, csize_t(dataSize))
  result.pParent = nil

# ============================================================================
# Hierarchy Management (Raw Pointers)
# ============================================================================

proc addChild*(parent: ptr Layer, child: ptr Layer) {.inline.} =
  ## Add a child layer to a parent layer (raw pointer version).
  ## Equivalent to C function `layer_add_child(parent, child)`.
  ffi.layer_add_child(parent, child)

proc removeFromParent*(child: ptr Layer) {.inline.} =
  ## Remove this layer from its parent (raw pointer version).
  ## Equivalent to C function `layer_remove_from_parent(child)`.
  ffi.layer_remove_from_parent(child)

proc removeChildLayers*(parent: ptr Layer) {.inline.} =
  ## Remove all child layers from this parent (raw pointer version).
  ## Equivalent to C function `layer_remove_child_layers(parent)`.
  ffi.layer_remove_child_layers(parent)

proc insertBelowSibling*(layerToInsert, sibling: ptr Layer) {.inline.} =
  ## Insert a layer below a sibling (raw pointer version).
  ## Equivalent to C function `layer_insert_below_sibling(...)`.
  ffi.layer_insert_below_sibling(layerToInsert, sibling)

proc insertAboveSibling*(layerToInsert, sibling: ptr Layer) {.inline.} =
  ## Insert a layer above a sibling (raw pointer version).
  ## Equivalent to C function `layer_insert_above_sibling(...)`.
  ffi.layer_insert_above_sibling(layerToInsert, sibling)

# ============================================================================
# Hierarchy Management (Managed Handles)
# ============================================================================

proc addChild*(parent: ptr Layer, child: var auto) {.inline.} =
  ## Add managed child layer to raw parent layer.
  when compiles(child.pRaw):
    if parent != nil and child.pRaw != nil:
      ffi.layer_add_child(parent, cast[ptr Layer](child.pRaw))
      when compiles(child.pParent):
        child.pParent = parent
  else:
    # Fallback for raw pointers
    ffi.layer_add_child(parent, child)

proc addChild*(parent: var LayerHandle, child: var auto) {.inline.} =
  ## Add child layer to parent. Parent takes ownership of child.
  when ManagedDebug or ManagedStrict:
    parent.checkValid()
  
  addChild(parent.pRaw, child)

proc removeFromParent*(child: var LayerHandle) {.inline.} =
  ## Remove this layer from its parent.
  ## After removal, the layer becomes an orphan and must be destroyed explicitly.
  when ManagedDebug or ManagedStrict:
    child.checkValid()
  
  ffi.layer_remove_from_parent(child.pRaw)
  child.pParent = nil  # No longer has a parent

proc setParent*(child: var LayerHandle, parentPtr: ptr Layer) {.inline.} =
  ## Internal helper to set the parent pointer on a child handle.
  child.pParent = parentPtr

proc removeChildLayers*(parent: var LayerHandle) {.inline.} =
  ## Remove all child layers from this parent.
  when ManagedDebug or ManagedStrict:
    parent.checkValid()
  ffi.layer_remove_child_layers(parent.pRaw)

proc insertBelowSibling*(h: var LayerHandle, sibling: LayerHandle) {.inline.} =
  ## Insert a layer below a sibling.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
    sibling.checkValid()
  ffi.layer_insert_below_sibling(h.pRaw, sibling.pRaw)
  # Attempt to track parent from sibling
  h.pParent = sibling.pParent

proc insertAboveSibling*(h: var LayerHandle, sibling: LayerHandle) {.inline.} =
  ## Insert a layer above a sibling.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
    sibling.checkValid()
  ffi.layer_insert_above_sibling(h.pRaw, sibling.pRaw)
  h.pParent = sibling.pParent

# ============================================================================
# Frame and Bounds
# ============================================================================

proc `frame=`*(h: var LayerHandle, value: GRect) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_set_frame(h.pRaw, value)

proc frame*(h: LayerHandle): GRect {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_get_frame(h.pRaw)

proc frame*(p: ptr Layer): GRect {.inline.} =
  ffi.layer_get_frame(p)

proc `frame=`*(p: ptr Layer, value: GRect) {.inline.} =
  ffi.layer_set_frame(p, value)

proc bounds*(h: LayerHandle): GRect {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_get_bounds(h.pRaw)

proc bounds*(p: ptr Layer): GRect {.inline.} =
  ffi.layer_get_bounds(p)

proc `bounds=`*(h: var LayerHandle, value: GRect) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_set_bounds(h.pRaw, value)

proc `bounds=`*(p: ptr Layer, value: GRect) {.inline.} =
  ffi.layer_set_bounds(p, value)

when declared(ffi.layer_get_unobstructed_bounds):
  proc unobstructedBounds*(h: LayerHandle): GRect {.inline.} =
    ## Get the unobstructed bounds.
    when ManagedDebug or ManagedStrict: h.checkValid()
    ffi.layer_get_unobstructed_bounds(h.pRaw)

# ============================================================================
# Visibility and Appearance
# ============================================================================

proc hidden*(h: LayerHandle): bool {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_get_hidden(h.pRaw)

proc `hidden=`*(h: var LayerHandle, value: bool) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_set_hidden(h.pRaw, value)

proc clips*(h: LayerHandle): bool {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_get_clips(h.pRaw)

proc `clips=`*(h: var LayerHandle, value: bool) {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_set_clips(h.pRaw, value)

# ============================================================================
# Update Proc & Data
# ============================================================================

proc `updateProc=`*(h: var LayerHandle, updateProc: LayerUpdateProc) {.inline.} =
  ## Set the layer's update proc.
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_set_update_proc(h.pRaw, updateProc)

proc markDirty*(h: LayerHandle) {.inline.} =
  ## Mark layer as dirty to request redraw.
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_mark_dirty(h.pRaw)

proc getData*(h: LayerHandle): pointer {.inline.} =
  ## Get the custom data pointer.
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_get_data(h.pRaw)

# ============================================================================
# Coordinate Conversion
# ============================================================================

proc convertPointToScreen*(h: LayerHandle, point: GPoint): GPoint {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_convert_point_to_screen(h.pRaw, point)

proc convertRectToScreen*(h: LayerHandle, rect: GRect): GRect {.inline.} =
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_convert_rect_to_screen(h.pRaw, rect)

# ============================================================================
# Window Association
# ============================================================================

proc getWindow*(h: LayerHandle): ptr Window {.inline.} =
  ## Get the window containing this layer.
  when ManagedDebug or ManagedStrict: h.checkValid()
  ffi.layer_get_window(h.pRaw)


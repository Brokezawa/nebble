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
  ownership*: HandleOwnership
  pParent*: ptr Layer  ## nil if not added to parent, otherwise parent pointer

# ============================================================================
# ARC Lifetime Hooks
# ============================================================================

proc `=destroy`*(h: var LayerHandle) =
  ## Destructor - destroys layer only if it has no parent.
  if h.pRaw != nil and h.ownership == hoOwned:
    ffi.layer_destroy(h.pRaw)
  h.pRaw = nil
  h.ownership = hoNone
  h.pParent = nil

proc `=wasMoved`*(h: var LayerHandle) =
  ## Mark handle as moved.
  h.pRaw = nil
  h.ownership = hoNone
  h.pParent = nil

proc `=copy`*(dest: var LayerHandle, src: LayerHandle) {.error.} =
  ## Copying disabled - use move semantics.
  discard

proc `=sink`*(dest: var LayerHandle, src: LayerHandle) =
  ## Move assignment - transfers ownership.
  `=destroy`(dest)
  dest.pRaw = src.pRaw
  dest.ownership = src.ownership
  dest.pParent = src.pParent
  var srcPtr = cast[ptr LayerHandle](addr src)
  srcPtr.pRaw = nil
  srcPtr.ownership = hoNone
  srcPtr.pParent = nil

# ============================================================================
# Converters
# ============================================================================

converter toPtr*(h: LayerHandle): ptr Layer =
  ## Convert handle to raw pointer for C API calls.
  h.pRaw

proc toHandle*(p: ptr Layer): LayerHandle {.inline.} =
  ## Wrap raw pointer in handle (unowned).
  LayerHandle(pRaw: p, ownership: hoUnowned, pParent: nil)

proc getLayer*(h: LayerHandle): ptr Layer {.inline.} =
  ## Get the underlying Layer pointer.
  h.pRaw

proc wrapOwned*(p: ptr Layer): LayerHandle {.inline.} =
  ## Wrap raw pointer in handle (owned).
  LayerHandle(pRaw: p, ownership: hoOwned, pParent: nil)

# ============================================================================
# Utility Functions
# ============================================================================

proc isValid*(h: LayerHandle): bool {.inline.} =
  ## Check if handle points to valid (non-nil) layer.
  h.pRaw != nil

proc hasParent*(h: LayerHandle): bool {.inline.} =
  ## Check if layer has a parent (was added to another layer).
  h.ownership == hoParented

proc setParent*(h: var LayerHandle, p: ptr Layer) {.inline.} =
  ## Internal helper to set the parent pointer on a child handle.
  if p != nil:
    h.pParent = p
    if h.ownership == hoOwned:
      h.ownership = hoParented
  else:
    h.pParent = nil
    if h.ownership == hoParented:
      h.ownership = hoOwned

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

proc newLayerHandle*(frame: GRect): LayerHandle =
  ## Create a new managed Layer.
  wrapOwned(ffi.layer_create(frame))

proc newLayer*(frame: GRect): LayerHandle =
  ## Alias for `newLayerHandle`.
  result = newLayerHandle(frame)

proc newLayerWithData*(frame: GRect, dataSize: int): LayerHandle =
  ## Create a new managed Layer with custom data storage.
  wrapOwned(ffi.layer_create_with_data(frame, csize_t(dataSize)))

# ============================================================================
# Hierarchy Management (Raw Pointers)
# ============================================================================

proc addChild*(parent: ptr Layer, child: ptr Layer) {.inline.} =
  ## Add a child layer to a parent layer (raw pointer version).
  ## Equivalent to C function `layer_add_child(parent, child)`.
  if parent == nil or child == nil: return
  ffi.layer_add_child(parent, child)

proc removeFromParent*(child: ptr Layer) {.inline.} =
  ## Remove this layer from its parent (raw pointer version).
  ## Equivalent to C function `layer_remove_from_parent(child)`.
  if child == nil: return
  ffi.layer_remove_from_parent(child)

proc removeChildLayers*(parent: ptr Layer) {.inline.} =
  ## Remove all child layers from this parent (raw pointer version).
  ## Equivalent to C function `layer_remove_child_layers(parent)`.
  if parent == nil: return
  ffi.layer_remove_child_layers(parent)

proc insertBelowSibling*(layerToInsert, sibling: ptr Layer) {.inline.} =
  ## Insert a layer below a sibling (raw pointer version).
  ## Equivalent to C function `layer_insert_below_sibling(...)`.
  if layerToInsert == nil or sibling == nil: return
  ffi.layer_insert_below_sibling(layerToInsert, sibling)

proc insertAboveSibling*(layerToInsert, sibling: ptr Layer) {.inline.} =
  ## Insert a layer above a sibling (raw pointer version).
  ## Equivalent to C function `layer_insert_above_sibling(...)`.
  if layerToInsert == nil or sibling == nil: return
  ffi.layer_insert_above_sibling(layerToInsert, sibling)

# ============================================================================
# Hierarchy Management (Managed Handles)
# ============================================================================

proc addChild*(parent: ptr Layer, child: var auto) {.inline.} =
  ## Add managed child layer to raw parent layer.
  when compiles(child.getLayer()):
    # Handle has getLayer() method (e.g., ScrollLayerHandle, TextLayerHandle)
    let cPtr = child.getLayer()
    if parent != nil and cPtr != nil:
      ffi.layer_add_child(parent, cPtr)
      when compiles(child.setParent):
        child.setParent(parent)
  elif compiles(child.pRaw):
    # Handle has pRaw field - cast to Layer pointer
    if parent != nil and child.pRaw != nil:
      ffi.layer_add_child(parent, cast[ptr Layer](child.pRaw))
      when compiles(child.setParent):
        child.setParent(parent)
  else:
    # Fallback for raw pointers
    if parent != nil and child != nil:
      ffi.layer_add_child(parent, child)

proc addChild*(parent: auto, child: var auto) {.inline.} =
  ## Add child layer to parent. Parent takes ownership of child.
  let pPtr = when parent is ptr Layer: parent
             elif compiles(parent.getLayer()): parent.getLayer()
             elif compiles(parent.pRaw): cast[ptr Layer](parent.pRaw)
             else: cast[ptr Layer](nil)
  if pPtr == nil: return
  addChild(pPtr, child)

proc removeFromParent*(child: var auto) {.inline.} =
  ## Remove this layer from its parent.
  ## After removal, the layer becomes an orphan and must be destroyed explicitly.
  let cPtr = when child is ptr Layer: child
             elif compiles(child.getLayer()): child.getLayer()
             elif compiles(child.pRaw): cast[ptr Layer](child.pRaw)
             else: cast[ptr Layer](nil)
  
  if cPtr == nil: return
  
  ffi.layer_remove_from_parent(cPtr)
  
  # Update ownership if it's a managed handle
  when compiles(child.setParent):
    child.setParent(nil)

proc removeChildLayers*(parent: auto) {.inline.} =
  ## Remove all child layers from this parent.
  let pPtr = when parent is ptr Layer: parent
             elif compiles(parent.getLayer()): parent.getLayer()
             elif compiles(parent.pRaw): cast[ptr Layer](parent.pRaw)
             else: cast[ptr Layer](nil)
  if pPtr == nil: return
  ffi.layer_remove_child_layers(pPtr)


proc insertBelowSibling*(h: var auto, sibling: var auto) {.inline.} =
  ## Insert a layer below a sibling.
  ## Supports both managed handles and raw pointers.
  let hPtr = when h is ptr Layer: h
             elif compiles(h.getLayer()): h.getLayer()
             else: cast[ptr Layer](nil)
             
  let sPtr = when sibling is ptr Layer: sibling
             elif compiles(sibling.getLayer()): sibling.getLayer()
             else: cast[ptr Layer](nil)

  if hPtr == nil or sPtr == nil: return

  # For handle logic, we need the parent tracking from the sibling handle
  let sParent = when compiles(sibling.pParent): sibling.pParent
                else: ffi.layer_get_parent(sPtr)

  if sParent == nil: return

  ffi.layer_insert_below_sibling(hPtr, sPtr)
  
  # Update ownership if h is a managed handle
  when compiles(h.setParent):
    h.setParent(sParent)

proc insertAboveSibling*(h: var auto, sibling: var auto) {.inline.} =
  ## Insert a layer above a sibling.
  ## Supports both managed handles and raw pointers.
  let hPtr = when h is ptr Layer: h
             elif compiles(h.getLayer()): h.getLayer()
             else: cast[ptr Layer](nil)
             
  let sPtr = when sibling is ptr Layer: sibling
             elif compiles(sibling.getLayer()): sibling.getLayer()
             else: cast[ptr Layer](nil)

  if hPtr == nil or sPtr == nil: return

  # For handle logic, we need the parent tracking from the sibling handle
  let sParent = when compiles(sibling.pParent): sibling.pParent
                else: ffi.layer_get_parent(sPtr)

  if sParent == nil: return

  ffi.layer_insert_above_sibling(hPtr, sPtr)
  
  # Update ownership if h is a managed handle
  when compiles(h.setParent):
    h.setParent(sParent)

# ============================================================================
# Frame and Bounds
# ============================================================================

proc `frame=`*(h: var LayerHandle, value: GRect) {.inline.} =
  if h.pRaw == nil: return
  ffi.layer_set_frame(h.pRaw, value)

proc frame*(h: LayerHandle): GRect {.inline.} =
  if h.pRaw == nil: return
  ffi.layer_get_frame(h.pRaw)

proc frame*(p: ptr Layer): GRect {.inline.} =
  if p == nil: return
  ffi.layer_get_frame(p)

proc `frame=`*(p: ptr Layer, value: GRect) {.inline.} =
  if p == nil: return
  ffi.layer_set_frame(p, value)

proc bounds*(h: LayerHandle): GRect {.inline.} =
  if h.pRaw == nil: return
  ffi.layer_get_bounds(h.pRaw)

proc bounds*(p: ptr Layer): GRect {.inline.} =
  if p == nil: return
  ffi.layer_get_bounds(p)

proc `bounds=`*(h: var LayerHandle, value: GRect) {.inline.} =
  if h.pRaw == nil: return
  ffi.layer_set_bounds(h.pRaw, value)

proc `bounds=`*(p: ptr Layer, value: GRect) {.inline.} =
  if p == nil: return
  ffi.layer_set_bounds(p, value)

when declared(ffi.layer_get_unobstructed_bounds):
  proc unobstructedBounds*(h: LayerHandle): GRect {.inline.} =
    ## Get the unobstructed bounds.
    if h.pRaw == nil: return
    ffi.layer_get_unobstructed_bounds(h.pRaw)

# ============================================================================
# Visibility and Appearance
# ============================================================================

proc hidden*(h: LayerHandle): bool {.inline.} =
  if h.pRaw == nil: return false
  ffi.layer_get_hidden(h.pRaw)

proc `hidden=`*(h: var LayerHandle, value: bool) {.inline.} =
  if h.pRaw == nil: return
  ffi.layer_set_hidden(h.pRaw, value)

proc clips*(h: LayerHandle): bool {.inline.} =
  if h.pRaw == nil: return false
  ffi.layer_get_clips(h.pRaw)

proc `clips=`*(h: var LayerHandle, value: bool) {.inline.} =
  if h.pRaw == nil: return
  ffi.layer_set_clips(h.pRaw, value)

# ============================================================================
# Update Proc & Data
# ============================================================================

proc `updateProc=`*(h: var LayerHandle, updateProc: LayerUpdateProc) {.inline.} =
  ## Set the layer's update proc.
  if h.pRaw == nil: return
  ffi.layer_set_update_proc(h.pRaw, updateProc)

proc markDirty*(h: LayerHandle) {.inline.} =
  ## Mark layer as dirty to request redraw.
  if h.pRaw == nil: return
  ffi.layer_mark_dirty(h.pRaw)

proc markDirty*(layer: ptr Layer) {.inline.} =
  ## Mark layer as dirty to request redraw (raw pointer version).
  if layer == nil: return
  ffi.layer_mark_dirty(layer)

proc getData*(h: LayerHandle): pointer {.inline.} =
  ## Get the custom data pointer.
  if h.pRaw == nil: return nil
  ffi.layer_get_data(h.pRaw)

# ============================================================================
# Coordinate Conversion
# ============================================================================

proc convertPointToScreen*(h: LayerHandle, point: GPoint): GPoint {.inline.} =
  if h.pRaw == nil: return
  ffi.layer_convert_point_to_screen(h.pRaw, point)

proc convertRectToScreen*(h: LayerHandle, rect: GRect): GRect {.inline.} =
  if h.pRaw == nil: return
  ffi.layer_convert_rect_to_screen(h.pRaw, rect)

# ============================================================================
# Window Association
# ============================================================================

proc getWindow*(h: LayerHandle): ptr Window {.inline.} =
  ## Get the window containing this layer.
  if h.pRaw == nil: return nil
  ffi.layer_get_window(h.pRaw)


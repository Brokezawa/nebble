## High-level idiomatic Nim API for Pebble layers (base layer type).
##
## Layers are the foundation of the Pebble UI system. All UI elements
## (TextLayer, BitmapLayer, etc.) are built on top of Layer.

import nebble/ffi
export ffi.Layer, ffi.GRect, ffi.GPoint, ffi.GSize
export ffi.makeGRect, ffi.makeGPoint, ffi.makeGSize

# ============================================================================
# Layer Constructor / Destructor
# ============================================================================

proc newLayer*(frame: GRect): ptr Layer {.inline.} =
  ## Create a new Layer with the specified frame.
  ## The caller is responsible for calling `destroy()` when done.
  ## Equivalent to C function `layer_create(frame)`.
  ffi.layer_create(frame)

proc newLayerWithData*(frame: GRect, dataSize: int): ptr Layer {.inline.} =
  ## Create a new Layer with custom data storage.
  ## Use `getData()` to retrieve the data pointer.
  ## Equivalent to C function `layer_create_with_data(frame, data_size)`.
  ffi.layer_create_with_data(frame, csize_t(dataSize))

proc destroy*(layer: ptr Layer) {.inline.} =
  ## Destroy a Layer and free its memory.
  ## Equivalent to C function `layer_destroy(layer)`.
  ffi.layer_destroy(layer)

# ============================================================================
# Layer Hierarchy
# ============================================================================

proc addChild*(parent: ptr Layer, child: ptr Layer) {.inline.} =
  ## Add a child layer to a parent layer.
  ## The parent retains the child - do not destroy until removing.
  ## Equivalent to C function `layer_add_child(parent, child)`.
  ffi.layer_add_child(parent, child)

proc removeFromParent*(child: ptr Layer) {.inline.} =
  ## Remove this layer from its parent.
  ## Equivalent to C function `layer_remove_from_parent(child)`.
  ffi.layer_remove_from_parent(child)

proc removeChildLayers*(parent: ptr Layer) {.inline.} =
  ## Remove all child layers from this parent.
  ## Equivalent to C function `layer_remove_child_layers(parent)`.
  ffi.layer_remove_child_layers(parent)

proc insertBelowSibling*(layerToInsert, sibling: ptr Layer) {.inline.} =
  ## Insert a layer below a sibling in the parent's child list.
  ## Equivalent to C function `layer_insert_below_sibling(...)`.
  ffi.layer_insert_below_sibling(layerToInsert, sibling)

proc insertAboveSibling*(layerToInsert, sibling: ptr Layer) {.inline.} =
  ## Insert a layer above a sibling in the parent's child list.
  ## Equivalent to C function `layer_insert_above_sibling(...)`.
  ffi.layer_insert_above_sibling(layerToInsert, sibling)

# ============================================================================
# Layer Properties
# ============================================================================

proc `frame=`*(layer: ptr Layer, frame: GRect) {.inline.} =
  ## Set the layer's frame (position + size in parent coordinates).
  ## Equivalent to C function `layer_set_frame(layer, frame)`.
  ffi.layer_set_frame(layer, frame)

proc frame*(layer: ptr Layer): GRect {.inline.} =
  ## Get the layer's frame.
  ## Equivalent to C function `layer_get_frame(layer)`.
  ffi.layer_get_frame(layer)

proc `bounds=`*(layer: ptr Layer, bounds: GRect) {.inline.} =
  ## Set the layer's bounds (drawing area in local coordinates).
  ## Equivalent to C function `layer_set_bounds(layer, bounds)`.
  ffi.layer_set_bounds(layer, bounds)

proc bounds*(layer: ptr Layer): GRect {.inline.} =
  ## Get the layer's bounds.
  ## Equivalent to C function `layer_get_bounds(layer)`.
  ffi.layer_get_bounds(layer)

when declared(layer_get_unobstructed_bounds):
  proc unobstructedBounds*(layer: ptr Layer): GRect {.inline.} =
    ## Get the unobstructed bounds (excluding system UI like status bar).
    ## Equivalent to C function `layer_get_unobstructed_bounds(layer)`.
    ## NOTE: Not available on Aplite.
    ffi.layer_get_unobstructed_bounds(layer)

proc `hidden=`*(layer: ptr Layer, hidden: bool) {.inline.} =
  ## Hide or show the layer.
  ## Equivalent to C function `layer_set_hidden(layer, hidden)`.
  ffi.layer_set_hidden(layer, hidden)

proc hidden*(layer: ptr Layer): bool {.inline.} =
  ## Check if the layer is hidden.
  ## Equivalent to C function `layer_get_hidden(layer)`.
  ffi.layer_get_hidden(layer)

proc `clips=`*(layer: ptr Layer, clips: bool) {.inline.} =
  ## Enable or disable clipping to bounds.
  ## Equivalent to C function `layer_set_clips(layer, clips)`.
  ffi.layer_set_clips(layer, clips)

proc clips*(layer: ptr Layer): bool {.inline.} =
  ## Check if clipping is enabled.
  ## Equivalent to C function `layer_get_clips(layer)`.
  ffi.layer_get_clips(layer)

# ============================================================================
# Layer Update Proc
# ============================================================================

proc `updateProc=`*(layer: ptr Layer, updateProc: LayerUpdateProc) {.inline.} =
  ## Set the layer's update proc (called to draw the layer).
  ## Equivalent to C function `layer_set_update_proc(layer, update_proc)`.
  ffi.layer_set_update_proc(layer, updateProc)

proc markDirty*(layer: ptr Layer) {.inline.} =
  ## Mark the layer as needing to be redrawn.
  ## Equivalent to C function `layer_mark_dirty(layer)`.
  ffi.layer_mark_dirty(layer)

# ============================================================================
# Layer Data
# ============================================================================

proc getData*(layer: ptr Layer): pointer {.inline.} =
  ## Get the custom data pointer (for layers created with `newLayerWithData`).
  ## Equivalent to C function `layer_get_data(layer)`.
  ffi.layer_get_data(layer)

# ============================================================================
# Coordinate Conversion
# ============================================================================

proc convertPointToScreen*(layer: ptr Layer, point: GPoint): GPoint {.inline.} =
  ## Convert a point from layer coordinates to screen coordinates.
  ## Equivalent to C function `layer_convert_point_to_screen(layer, point)`.
  ffi.layer_convert_point_to_screen(layer, point)

proc convertRectToScreen*(layer: ptr Layer, rect: GRect): GRect {.inline.} =
  ## Convert a rect from layer coordinates to screen coordinates.
  ## Equivalent to C function `layer_convert_rect_to_screen(layer, rect)`.
  ffi.layer_convert_rect_to_screen(layer, rect)

# ============================================================================
# Layer Window
# ============================================================================

proc getWindow*(layer: ptr Layer): ptr Window {.inline.} =
  ## Get the window that contains this layer.
  ## Equivalent to C function `layer_get_window(layer)`.
  ffi.layer_get_window(layer)

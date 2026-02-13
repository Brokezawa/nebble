## ARC-Managed SimpleMenuLayer Handle
import nebble/ffi
import nebble/ffi/managed

export ffi.SimpleMenuLayer, ffi.SimpleMenuSection, ffi.SimpleMenuItem

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(SimpleMenuLayer, SimpleMenuLayer,
                  simple_menu_layer_create, simple_menu_layer_destroy)

# ============================================================================
# Constructors
# ============================================================================

proc newSimpleMenuLayerHandle*(frame: GRect, window: ptr Window,
                             sections: ptr SimpleMenuSection,
                             numSections: int32, context: pointer): SimpleMenuLayerHandle {.inline.} =
  wrapOwned(ffi.simple_menu_layer_create(frame, window, sections, numSections, context))

proc newSimpleMenuLayer*(frame: GRect, window: ptr Window,
                        sections: ptr SimpleMenuSection,
                        numSections: int32, context: pointer): SimpleMenuLayerHandle {.inline.} =
  result = newSimpleMenuLayerHandle(frame, window, sections, numSections, context)

# ============================================================================
# Layer Access
# ============================================================================

proc getLayer*(h: SimpleMenuLayerHandle): ptr Layer {.inline.} =
  ffi.simple_menu_layer_get_layer(h.toPtr)

proc getLayer*(menuLayer: ptr SimpleMenuLayer): ptr Layer {.inline.} =
  ffi.simple_menu_layer_get_layer(menuLayer)

proc selectedIndex*(h: SimpleMenuLayerHandle): int32 {.inline.} =
  ffi.simple_menu_layer_get_selected_index(h.pRaw)

proc `selectedIndex=`*(h: var SimpleMenuLayerHandle, index: int32) {.inline.} =
  ffi.simple_menu_layer_set_selected_index(h.pRaw, index, true)

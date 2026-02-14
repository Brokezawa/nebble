## ARC-Managed MenuLayer Handle
import nebble/ffi
import nebble/ffi/managed

export ffi.MenuLayer, ffi.MenuLayerCallbacks, ffi.MenuIndex, ffi.MenuRowAlign

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(MenuLayer, MenuLayer,
                  menu_layer_create, menu_layer_destroy)

# ============================================================================
# Constructors
# ============================================================================

proc newMenuLayerHandle*(frame: GRect): MenuLayerHandle {.inline.} =
  wrapOwned(ffi.menu_layer_create(frame))

proc newMenuLayer*(frame: GRect): MenuLayerHandle {.inline.} =
  result = newMenuLayerHandle(frame)

# ============================================================================
# Layer Access
# ============================================================================

proc getLayer*(h: MenuLayerHandle): ptr Layer {.inline.} =
  if h.pRaw == nil: return nil
  ffi.menu_layer_get_layer(h.toPtr)

proc setClickConfigOntoWindow*(h: var MenuLayerHandle, window: ptr Window) {.inline.} =
  if h.pRaw == nil or window == nil: return
  ffi.menu_layer_set_click_config_onto_window(h.pRaw, window)

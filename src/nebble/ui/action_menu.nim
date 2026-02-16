import nebble/ffi
import nebble/ffi/managed

# Re-export FFI types
export ffi.ActionMenu, ffi.ActionMenuLevel, ffi.ActionMenuItem
export ffi.ActionMenuConfig, ffi.ActionMenuPerformActionCb, ffi.ActionMenuLevelDisplayMode, ffi.ActionMenuEachItemCb

# ============================================================================
# Action Menu Level Handle
# ============================================================================

type ActionMenuLevelHandle* = object
  ## Managed handle for ActionMenuLevel hierarchy.
  ## 
  ## **Ownership:** This handle owns the entire hierarchy starting from this level.
  ## If the menu is opened via `openActionMenu`, the OS takes ownership and this
  ## handle should be marked as consumed to avoid double-free.
  pRaw: ptr ActionMenuLevel
  ownership: HandleOwnership

proc `=destroy`*(h: var ActionMenuLevelHandle) =
  ## Destroy the hierarchy if it hasn't been consumed by the OS.
  if h.pRaw != nil and h.ownership == hoOwned:
    ffi.action_menu_hierarchy_destroy(h.pRaw, nil, nil)
  h.pRaw = nil
  h.ownership = hoNone

proc `=wasMoved`*(h: var ActionMenuLevelHandle) =
  h.pRaw = nil
  h.ownership = hoNone

proc `=copy`*(dest: var ActionMenuLevelHandle, src: ActionMenuLevelHandle) {.error.} = discard

proc `=sink`*(dest: var ActionMenuLevelHandle, src: ActionMenuLevelHandle) =
  `=destroy`(dest)
  dest.pRaw = src.pRaw
  dest.ownership = src.ownership
  var srcPtr = cast[ptr ActionMenuLevelHandle](unsafeAddr src)
  srcPtr.pRaw = nil
  srcPtr.ownership = hoNone

converter toPtr*(h: ActionMenuLevelHandle): ptr ActionMenuLevel = h.pRaw

proc isValid*(h: ActionMenuLevelHandle): bool {.inline.} = h.pRaw != nil

proc wrapOwned*(p: ptr ActionMenuLevel): ActionMenuLevelHandle {.inline.} =
  ## Wrap raw pointer in handle (owned).
  ActionMenuLevelHandle(pRaw: p, ownership: hoOwned)

proc toHandle*(p: ptr ActionMenuLevel): ActionMenuLevelHandle {.inline.} =
  ## Wrap raw pointer in handle (unowned).
  ActionMenuLevelHandle(pRaw: p, ownership: hoUnowned)

# ============================================================================
# Action Menu Handle
# ============================================================================

type ActionMenuHandle* = object
  ## Managed handle for the ActionMenu window itself.
  ## Note: ActionMenu is usually managed by the window stack once opened.
  pRaw: ptr ActionMenu
  ownership: HandleOwnership

proc `=destroy`*(h: var ActionMenuHandle) =
  ## Close the menu if we still own it.
  if h.pRaw != nil and h.ownership == hoOwned:
    ffi.action_menu_close(h.pRaw, true)
  h.pRaw = nil
  h.ownership = hoNone

proc `=wasMoved`*(h: var ActionMenuHandle) =
  h.pRaw = nil
  h.ownership = hoNone

proc `=copy`*(dest: var ActionMenuHandle, src: ActionMenuHandle) {.error.} = discard

proc `=sink`*(dest: var ActionMenuHandle, src: ActionMenuHandle) =
  `=destroy`(dest)
  dest.pRaw = src.pRaw
  dest.ownership = src.ownership
  var srcPtr = cast[ptr ActionMenuHandle](unsafeAddr src)
  srcPtr.pRaw = nil
  srcPtr.ownership = hoNone

converter toPtr*(h: ActionMenuHandle): ptr ActionMenu = h.pRaw

proc isValid*(h: ActionMenuHandle): bool {.inline.} = h.pRaw != nil

proc wrapOwned*(p: ptr ActionMenu): ActionMenuHandle {.inline.} =
  ActionMenuHandle(pRaw: p, ownership: hoOwned)

proc toHandle*(p: ptr ActionMenu): ActionMenuHandle {.inline.} =
  ActionMenuHandle(pRaw: p, ownership: hoUnowned)

# ============================================================================
# Action Menu Level (Hierarchy Construction)
# ============================================================================

proc newActionMenuLevelHandle*(maxItems: uint16): ActionMenuLevelHandle {.inline.} =
  ## Create a new managed ActionMenuLevel.
  wrapOwned(ffi.action_menu_level_create(maxItems))

proc newActionMenuLevel*(maxItems: uint16): ActionMenuLevelHandle {.inline.} =
  ## Alias for `newActionMenuLevelHandle`.
  result = newActionMenuLevelHandle(maxItems)

proc addAction*(h: ActionMenuLevelHandle, label: cstring,
                action: ActionMenuPerformActionCb, actionData: pointer = nil): ptr ActionMenuItem {.inline.} =
  ## Add an action item to the level.
  if h.pRaw == nil: return nil
  ffi.action_menu_level_add_action(h.pRaw, label, action, actionData)

proc addAction*(level: ptr ActionMenuLevel, label: cstring,
                action: ActionMenuPerformActionCb, actionData: pointer = nil): ptr ActionMenuItem {.inline.} =
  ## Add an action item to the level (raw pointer version).
  if level == nil: return nil
  ffi.action_menu_level_add_action(level, label, action, actionData)

proc addChild*(h: var ActionMenuLevelHandle, childLevel: var ActionMenuLevelHandle,
               label: cstring): ptr ActionMenuItem {.inline.} =
  ## Add a child level (submenu) to this level.
  ## Ownership of the childLevel is transferred to the parent hierarchy.
  if h.pRaw == nil or childLevel.pRaw == nil: return nil
  let res = ffi.action_menu_level_add_child(h.pRaw, childLevel.pRaw, label)
  if res != nil:
    childLevel.ownership = hoParented # Parent hierarchy now owns it
  return res

proc addChild*(level: ptr ActionMenuLevel, childLevel: ptr ActionMenuLevel,
               label: cstring): ptr ActionMenuItem {.inline.} =
  ## Add a child level (submenu) to this level (raw pointer version).
  if level == nil or childLevel == nil: return nil
  ffi.action_menu_level_add_child(level, childLevel, label)

proc setDisplayMode*(h: ActionMenuLevelHandle,
                     displayMode: ActionMenuLevelDisplayMode) {.inline.} =
  ## Set the display mode for this level (e.g. single row vs grid).
  if h.pRaw == nil: return
  ffi.action_menu_level_set_display_mode(h.pRaw, displayMode)

proc setDisplayMode*(level: ptr ActionMenuLevel,
                     displayMode: ActionMenuLevelDisplayMode) {.inline.} =
  ## Set the display mode for this level (raw pointer version).
  if level == nil: return
  ffi.action_menu_level_set_display_mode(level, displayMode)

# ============================================================================
# Action Menu (Window)
# ============================================================================

proc openActionMenu*(config: ptr ActionMenuConfig): ActionMenuHandle {.inline.} =
  ## Open the Action Menu.
  ## Note: The config.root_level must stay valid until the menu is closed.
  wrapOwned(ffi.action_menu_open(config))

proc open*(h: var ActionMenuLevelHandle, config: var ActionMenuConfig): ActionMenuHandle {.inline.} =
  ## Convenience helper to open a menu from a handle.
  ## Marks the level handle as parented (consumed by the ActionMenu).
  if h.pRaw == nil: return ActionMenuHandle(pRaw: nil, ownership: hoNone)
  config.root_level = h.pRaw
  h.ownership = hoParented
  wrapOwned(ffi.action_menu_open(addr config))

proc close*(h: var ActionMenuHandle, animated: bool = true) {.inline.} =
  ## Close the Action Menu.
  if h.pRaw == nil: return
  ffi.action_menu_close(h.pRaw, animated)
  h.pRaw = nil
  h.ownership = hoNone

proc close*(menu: ptr ActionMenu, animated: bool = true) {.inline.} =
  ## Close the Action Menu (raw pointer version).
  if menu == nil: return
  ffi.action_menu_close(menu, animated)

proc freeze*(h: ActionMenuHandle) {.inline.} =
  ## Freeze the Action Menu.
  if h.pRaw == nil: return
  ffi.action_menu_freeze(h.pRaw)

proc unfreeze*(h: ActionMenuHandle) {.inline.} =
  ## Unfreeze the Action Menu.
  if h.pRaw == nil: return
  ffi.action_menu_unfreeze(h.pRaw)

# ============================================================================
# Helpers
# ============================================================================

proc destroyHierarchy*(rootLevel: ptr ActionMenuLevel,
                       eachCb: ActionMenuEachItemCb = nil,
                       context: pointer = nil) {.inline.} =
  ## Destroy an ActionMenuLevel hierarchy (raw pointer version).
  if rootLevel == nil: return
  ffi.action_menu_hierarchy_destroy(rootLevel, eachCb, context)

proc getContext*(h: ActionMenuHandle): pointer {.inline.} =
  ## Get the context pointer associated with the Action Menu.
  if h.pRaw == nil: return nil
  ffi.action_menu_get_context(h.pRaw)

proc getRootLevel*(h: ActionMenuHandle): ptr ActionMenuLevel {.inline.} =
  ## Get the root level of the Action Menu.
  if h.pRaw == nil: return nil
  ffi.action_menu_get_root_level(h.pRaw)

proc setResultWindow*(h: ActionMenuHandle, window: ptr Window) {.inline.} =
  ## Set the window that should be focused after the Action Menu closes.
  if h.pRaw == nil: return
  ffi.action_menu_set_result_window(h.pRaw, window)

# ============================================================================
# Item Properties
# ============================================================================

proc getLabel*(item: ptr ActionMenuItem): cstring {.inline.} =
  ## Get the label of an ActionMenuItem.
  if item == nil: return nil
  ffi.action_menu_item_get_label(item)

proc getActionData*(item: ptr ActionMenuItem): pointer {.inline.} =
  ## Get the action data associated with an ActionMenuItem.
  if item == nil: return nil
  ffi.action_menu_item_get_action_data(item)


## High-level Nim wrapper for Pebble Action Menu API.
##
## Provides a UI for displaying a hierarchical menu of actions.
## Includes ARC-managed handles for ActionMenuLevel to prevent leaks
## if a menu is never opened.

import nebble/ffi

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
  raw: ptr ActionMenuLevel
  isConsumed: bool

proc `=destroy`*(h: var ActionMenuLevelHandle) =
  ## Destroy the hierarchy if it hasn't been consumed by the OS.
  if h.raw != nil and not h.isConsumed:
    ffi.action_menu_hierarchy_destroy(h.raw, nil, nil)
  h.raw = nil

proc `=wasMoved`*(h: var ActionMenuLevelHandle) =
  h.raw = nil
  h.isConsumed = false

proc `=copy`*(dest: var ActionMenuLevelHandle, src: ActionMenuLevelHandle) {.error.} = discard

proc `=sink`*(dest: var ActionMenuLevelHandle, src: ActionMenuLevelHandle) =
  `=destroy`(dest)
  dest.raw = src.raw
  dest.isConsumed = src.isConsumed
  var srcPtr = cast[ptr ActionMenuLevelHandle](unsafeAddr src)
  srcPtr.raw = nil
  srcPtr.isConsumed = false

converter toPtr*(h: ActionMenuLevelHandle): ptr ActionMenuLevel = h.raw

proc isValid*(h: ActionMenuLevelHandle): bool {.inline.} = h.raw != nil

# ============================================================================
# Action Menu Level (Hierarchy Construction)
# ============================================================================

proc newActionMenuLevelHandle*(maxItems: uint16): ActionMenuLevelHandle {.inline.} =
  ## Create a new managed ActionMenuLevel.
  result.raw = ffi.action_menu_level_create(maxItems)
  result.isConsumed = false

proc newActionMenuLevel*(maxItems: uint16): ActionMenuLevelHandle {.inline.} =
  ## Alias for `newActionMenuLevelHandle`.
  result = newActionMenuLevelHandle(maxItems)

proc addAction*(h: ActionMenuLevelHandle, label: cstring,
                action: ActionMenuPerformActionCb, actionData: pointer = nil): ptr ActionMenuItem {.inline.} =
  ## Add an action item to the level.
  ffi.action_menu_level_add_action(h.raw, label, action, actionData)

proc addAction*(level: ptr ActionMenuLevel, label: cstring,
                action: ActionMenuPerformActionCb, actionData: pointer = nil): ptr ActionMenuItem {.inline.} =
  ## Add an action item to the level (raw pointer version).
  ffi.action_menu_level_add_action(level, label, action, actionData)

proc addChild*(h: ActionMenuLevelHandle, childLevel: var ActionMenuLevelHandle,
               label: cstring): ptr ActionMenuItem {.inline.} =
  ## Add a child level (submenu) to this level.
  ## Ownership of the childLevel is transferred to the parent hierarchy.
  let res = ffi.action_menu_level_add_child(h.raw, childLevel.raw, label)
  childLevel.isConsumed = true # Parent now owns it
  return res

proc addChild*(level: ptr ActionMenuLevel, childLevel: ptr ActionMenuLevel,
               label: cstring): ptr ActionMenuItem {.inline.} =
  ## Add a child level (submenu) to this level (raw pointer version).
  ffi.action_menu_level_add_child(level, childLevel, label)

proc setDisplayMode*(h: ActionMenuLevelHandle,
                     displayMode: ActionMenuLevelDisplayMode) {.inline.} =
  ## Set the display mode for this level (e.g. single row vs grid).
  ffi.action_menu_level_set_display_mode(h.raw, displayMode)

proc setDisplayMode*(level: ptr ActionMenuLevel,
                     displayMode: ActionMenuLevelDisplayMode) {.inline.} =
  ## Set the display mode for this level (raw pointer version).
  ffi.action_menu_level_set_display_mode(level, displayMode)

# ============================================================================
# Action Menu (Window)
# ============================================================================

proc openActionMenu*(config: ptr ActionMenuConfig): ptr ActionMenu {.inline.} =
  ## Open the Action Menu.
  ## NOTE: If the config points to an ActionMenuLevelHandle, mark it as consumed!
  ffi.action_menu_open(config)

proc open*(h: var ActionMenuLevelHandle, config: var ActionMenuConfig): ptr ActionMenu {.inline.} =
  ## Convenience helper to open a menu from a handle.
  ## Marks the handle as consumed.
  config.root_level = h.raw
  h.isConsumed = true
  ffi.action_menu_open(addr config)

proc close*(menu: ptr ActionMenu, animated: bool = true) {.inline.} =
  ## Close the Action Menu.
  ffi.action_menu_close(menu, animated)

proc freeze*(menu: ptr ActionMenu) {.inline.} =
  ## Freeze the Action Menu.
  ffi.action_menu_freeze(menu)

proc unfreeze*(menu: ptr ActionMenu) {.inline.} =
  ## Unfreeze the Action Menu.
  ffi.action_menu_unfreeze(menu)

# ============================================================================
# Helpers
# ============================================================================

proc destroyHierarchy*(rootLevel: ptr ActionMenuLevel,
                       eachCb: ActionMenuEachItemCb = nil,
                       context: pointer = nil) {.inline.} =
  ## Destroy an ActionMenuLevel hierarchy (raw pointer version).
  ffi.action_menu_hierarchy_destroy(rootLevel, eachCb, context)

proc getContext*(menu: ptr ActionMenu): pointer {.inline.} =
  ## Get the context pointer associated with the Action Menu.
  ffi.action_menu_get_context(menu)

proc getRootLevel*(menu: ptr ActionMenu): ptr ActionMenuLevel {.inline.} =
  ## Get the root level of the Action Menu.
  ffi.action_menu_get_root_level(menu)

proc setResultWindow*(menu: ptr ActionMenu, window: ptr Window) {.inline.} =
  ## Set the window that should be focused after the Action Menu closes.
  ffi.action_menu_set_result_window(menu, window)

# ============================================================================
# Item Properties
# ============================================================================

proc getLabel*(item: ptr ActionMenuItem): cstring {.inline.} =
  ## Get the label of an ActionMenuItem.
  ffi.action_menu_item_get_label(item)

proc getActionData*(item: ptr ActionMenuItem): pointer {.inline.} =
  ## Get the action data associated with an ActionMenuItem.
  ffi.action_menu_item_get_action_data(item)

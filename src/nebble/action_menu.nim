## High-level Nim wrapper for Pebble Action Menu API.
##
## Provides a UI for displaying a hierarchical menu of actions.

import nebble/ffi

export ffi.ActionMenu, ffi.ActionMenuLevel, ffi.ActionMenuItem
export ffi.ActionMenuConfig, ffi.ActionMenuPerformActionCb, ffi.ActionMenuLevelDisplayMode, ffi.ActionMenuEachItemCb

# ============================================================================
# Action Menu Level (Hierarchy Construction)
# ============================================================================

proc newActionMenuLevel*(maxItems: uint16): ptr ActionMenuLevel {.inline.} =
  ## Create a new ActionMenuLevel.
  ## Equivalent to C function `action_menu_level_create(max_items)`.
  ffi.action_menu_level_create(maxItems)

proc addAction*(level: ptr ActionMenuLevel, label: cstring,
                action: ActionMenuPerformActionCb, actionData: pointer): ptr ActionMenuItem {.inline.} =
  ## Add an action item to the level.
  ## Equivalent to C function `action_menu_level_add_action(...)`.
  ffi.action_menu_level_add_action(level, label, action, actionData)

proc addChild*(level: ptr ActionMenuLevel, childLevel: ptr ActionMenuLevel,
               label: cstring): ptr ActionMenuItem {.inline.} =
  ## Add a child level (submenu) to this level.
  ## Equivalent to C function `action_menu_level_add_child(...)`.
  ffi.action_menu_level_add_child(level, childLevel, label)

proc setDisplayMode*(level: ptr ActionMenuLevel,
                     displayMode: ActionMenuLevelDisplayMode) {.inline.} =
  ## Set the display mode for this level (e.g. single row vs grid).
  ## Equivalent to C function `action_menu_level_set_display_mode(...)`.
  ffi.action_menu_level_set_display_mode(level, displayMode)

# ============================================================================
# Action Menu (Window)
# ============================================================================

proc openActionMenu*(config: ptr ActionMenuConfig): ptr ActionMenu {.inline.} =
  ## Open the Action Menu.
  ## Equivalent to C function `action_menu_open(config)`.
  ffi.action_menu_open(config)

proc close*(menu: ptr ActionMenu, animated: bool = true) {.inline.} =
  ## Close the Action Menu.
  ## Equivalent to C function `action_menu_close(menu, animated)`.
  ffi.action_menu_close(menu, animated)

proc freeze*(menu: ptr ActionMenu) {.inline.} =
  ## Freeze the Action Menu (e.g. while performing an async action).
  ## Equivalent to C function `action_menu_freeze(menu)`.
  ffi.action_menu_freeze(menu)

proc unfreeze*(menu: ptr ActionMenu) {.inline.} =
  ## Unfreeze the Action Menu.
  ## Equivalent to C function `action_menu_unfreeze(menu)`.
  ffi.action_menu_unfreeze(menu)

# ============================================================================
# Helpers
# ============================================================================

proc destroyHierarchy*(rootLevel: ptr ActionMenuLevel,
                       eachCb: ActionMenuEachItemCb = nil,
                       context: pointer = nil) {.inline.} =
  ## Destroy an ActionMenuLevel hierarchy.
  ## NOTE: Usually handled automatically by the system when the menu closes,
  ## but needed if you create a hierarchy but never open the menu.
  ## Equivalent to C function `action_menu_hierarchy_destroy(root, each_cb, context)`.
  ffi.action_menu_hierarchy_destroy(rootLevel, eachCb, context)

proc getContext*(menu: ptr ActionMenu): pointer {.inline.} =
  ## Get the context pointer associated with the Action Menu.
  ## Equivalent to C function `action_menu_get_context(menu)`.
  ffi.action_menu_get_context(menu)

proc getRootLevel*(menu: ptr ActionMenu): ptr ActionMenuLevel {.inline.} =
  ## Get the root level of the Action Menu.
  ## Equivalent to C function `action_menu_get_root_level(menu)`.
  ffi.action_menu_get_root_level(menu)

proc setResultWindow*(menu: ptr ActionMenu, window: ptr Window) {.inline.} =
  ## Set the window that should be focused after the Action Menu closes.
  ## Equivalent to C function `action_menu_set_result_window(menu, window)`.
  ffi.action_menu_set_result_window(menu, window)

# ============================================================================
# Item Properties
# ============================================================================

proc getLabel*(item: ptr ActionMenuItem): cstring {.inline.} =
  ## Get the label of an ActionMenuItem.
  ## Equivalent to C function `action_menu_item_get_label(item)`.
  ffi.action_menu_item_get_label(item)

proc getActionData*(item: ptr ActionMenuItem): pointer {.inline.} =
  ## Get the action data associated with an ActionMenuItem.
  ## Equivalent to C function `action_menu_item_get_action_data(item)`.
  ffi.action_menu_item_get_action_data(item)

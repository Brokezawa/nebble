## High-level Nim wrapper for Pebble Draw Command low-level manipulation API.
##
## Provides low-level access to individual draw commands within PDC images.
## Useful for programmatically modifying vector graphics at runtime.

import nebble/ffi

export ffi.GDrawCommand, ffi.GDrawCommandList, ffi.GDrawCommandType

# ============================================================================
# GDrawCommand Properties
# ============================================================================

proc commandType*(command: ptr GDrawCommand): GDrawCommandType {.inline.} =
  ## Get the type of a draw command (path, circle, etc.).
  ## Equivalent to C function `gdraw_command_get_type(command)`.
  result = ffi.gdraw_command_get_type(command)

proc `fillColor=`*(command: ptr GDrawCommand; color: GColor) {.inline.} =
  ## Set the fill color of a command.
  ## Equivalent to C function `gdraw_command_set_fill_color(command, color)`.
  ffi.gdraw_command_set_fill_color(command, color)

proc fillColor*(command: ptr GDrawCommand): GColor {.inline.} =
  ## Get the fill color of a command.
  ## Equivalent to C function `gdraw_command_get_fill_color(command)`.
  result = ffi.gdraw_command_get_fill_color(command)

proc `strokeColor=`*(command: ptr GDrawCommand; color: GColor) {.inline.} =
  ## Set the stroke (outline) color of a command.
  ## Equivalent to C function `gdraw_command_set_stroke_color(command, color)`.
  ffi.gdraw_command_set_stroke_color(command, color)

proc strokeColor*(command: ptr GDrawCommand): GColor {.inline.} =
  ## Get the stroke color of a command.
  ## Equivalent to C function `gdraw_command_get_stroke_color(command)`.
  result = ffi.gdraw_command_get_stroke_color(command)

proc `strokeWidth=`*(command: ptr GDrawCommand; width: uint8) {.inline.} =
  ## Set the stroke width of a command (0 for no stroke).
  ## Equivalent to C function `gdraw_command_set_stroke_width(command, width)`.
  ffi.gdraw_command_set_stroke_width(command, width)

proc strokeWidth*(command: ptr GDrawCommand): uint8 {.inline.} =
  ## Get the stroke width of a command.
  ## Equivalent to C function `gdraw_command_get_stroke_width(command)`.
  result = ffi.gdraw_command_get_stroke_width(command)

proc `hidden=`*(command: ptr GDrawCommand; hidden: bool) {.inline.} =
  ## Set whether a command is hidden (not drawn).
  ## Equivalent to C function `gdraw_command_set_hidden(command, hidden)`.
  ffi.gdraw_command_set_hidden(command, hidden)

proc hidden*(command: ptr GDrawCommand): bool {.inline.} =
  ## Check if a command is hidden.
  ## Equivalent to C function `gdraw_command_get_hidden(command)`.
  result = ffi.gdraw_command_get_hidden(command)

# ============================================================================
# Path/Polygon Commands
# ============================================================================

proc numPoints*(command: ptr GDrawCommand): uint16 {.inline.} =
  ## Get the number of points in a path/polygon command.
  ## Equivalent to C function `gdraw_command_get_num_points(command)`.
  result = ffi.gdraw_command_get_num_points(command)

proc setPoint*(command: ptr GDrawCommand; index: uint16; point: GPoint) {.inline.} =
  ## Set a point in a path/polygon command by index.
  ## Equivalent to C function `gdraw_command_set_point(command, index, point)`.
  ffi.gdraw_command_set_point(command, index, point)

proc getPoint*(command: ptr GDrawCommand; index: uint16): GPoint {.inline.} =
  ## Get a point from a path/polygon command by index.
  ## Equivalent to C function `gdraw_command_get_point(command, index)`.
  result = ffi.gdraw_command_get_point(command, index)

proc `pathOpen=`*(command: ptr GDrawCommand; open: bool) {.inline.} =
  ## Set whether a path is open (not closed) at the end.
  ## Equivalent to C function `gdraw_command_set_path_open(command, open)`.
  ffi.gdraw_command_set_path_open(command, open)

proc pathOpen*(command: ptr GDrawCommand): bool {.inline.} =
  ## Check if a path is open (not closed).
  ## Equivalent to C function `gdraw_command_get_path_open(command)`.
  result = ffi.gdraw_command_get_path_open(command)

# ============================================================================
# Circle Commands
# ============================================================================

proc `radius=`*(command: ptr GDrawCommand; radius: uint16) {.inline.} =
  ## Set the radius of a circle command.
  ## Equivalent to C function `gdraw_command_set_radius(command, radius)`.
  ffi.gdraw_command_set_radius(command, radius)

proc radius*(command: ptr GDrawCommand): uint16 {.inline.} =
  ## Get the radius of a circle command.
  ## Equivalent to C function `gdraw_command_get_radius(command)`.
  result = ffi.gdraw_command_get_radius(command)

# ============================================================================
# GDrawCommandList Operations
# ============================================================================

proc numCommands*(list: ptr GDrawCommandList): uint32 {.inline.} =
  ## Get the number of commands in a command list.
  ## Equivalent to C function `gdraw_command_list_get_num_commands(list)`.
  result = ffi.gdraw_command_list_get_num_commands(list)

proc getCommand*(list: ptr GDrawCommandList; index: uint16): ptr GDrawCommand {.inline.} =
  ## Get a command from the list by index.
  ## Equivalent to C function `gdraw_command_list_get_command(list, index)`.
  result = ffi.gdraw_command_list_get_command(list, index)

proc drawList*(ctx: ptr GContext; list: ptr GDrawCommandList) {.inline.} =
  ## Draw all commands in a list.
  ## Equivalent to C function `gdraw_command_list_draw(ctx, list)`.
  ffi.gdraw_command_list_draw(ctx, list)

# ============================================================================
# Command List Iteration
# ============================================================================

type
  CommandIterator* = proc(command: ptr GDrawCommand; index: uint32; context: pointer): bool {.cdecl.}
  ## Callback type for iterating over commands.
  ## Return true to continue iterating, false to stop.

proc iterate*(list: ptr GDrawCommandList; cb: CommandIterator; context: pointer) {.inline.} =
  ## Iterate over all commands in a list.
  ## The callback is called for each command until it returns false or all commands are processed.
  ##
  ## Usage:
  ##   proc onCommand(cmd: ptr GDrawCommand; idx: uint32; ctx: pointer): bool {.cdecl.} =
  ##     # Process command
  ##     return true  # Continue iterating
  ##   list.iterate(onCommand, nil)
  ##
  ## Equivalent to C function `gdraw_command_list_iterate(list, iterator, context)`.
  ffi.gdraw_command_list_iterate(list, cast[ffi.GDrawCommandListIteratorCb](cb), context)

# ============================================================================
# Nim-idiomatic Helpers
# ============================================================================

proc `[]`*(list: ptr GDrawCommandList; index: uint16): ptr GDrawCommand {.inline.} =
  ## Array-like access to commands in a list.
  ## Usage: `list[0]` gets the first command.
  result = getCommand(list, index)

iterator items*(list: ptr GDrawCommandList): ptr GDrawCommand =
  ## Iterate over all commands in a list using Nim's for-loop syntax.
  ## Usage:
  ##   for cmd in list:
  ##     # Process command
  let count = numCommands(list)
  var i: uint16 = 0
  while i.uint32 < count:
    yield getCommand(list, i)
    i += 1

proc setAllStrokeWidths*(list: ptr GDrawCommandList; width: uint8) {.inline.} =
  ## Set stroke width for all commands in a list.
  ## Convenience helper for batch modification.
  for cmd in list:
    cmd.strokeWidth = width

proc hideAll*(list: ptr GDrawCommandList) {.inline.} =
  ## Hide all commands in a list.
  ## Convenience helper for batch modification.
  for cmd in list:
    cmd.hidden = true

proc showAll*(list: ptr GDrawCommandList) {.inline.} =
  ## Show all commands in a list.
  ## Convenience helper for batch modification.
  for cmd in list:
    cmd.hidden = false

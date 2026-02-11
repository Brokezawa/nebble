## High-level Nim wrapper for Pebble Platform API.
##
## Provides platform conditional macros and display constants.

import nebble/ffi

# ============================================================================
# Platform Conditional Macros
# ============================================================================

template pblIfRectElse*[T](rectExpr, roundExpr: T): T =
  ## Platform conditional: returns rectExpr on rectangular watches,
  ## roundExpr on round watches.
  ## Equivalent to C macro `PBL_IF_RECT_ELSE(rect_expr, round_expr)`.
  when defined(pebbleRound):
    roundExpr
  else:
    rectExpr

template pblIfColorElse*[T](colorExpr, bwExpr: T): T =
  ## Platform conditional: returns colorExpr on color watches,
  ## bwExpr on black and white watches.
  ## Equivalent to C macro `PBL_IF_COLOR_ELSE(color_expr, bw_expr)`.
  when defined(pebbleColor):
    colorExpr
  else:
    bwExpr

template pblIfBwElse*[T](bwExpr, colorExpr: T): T =
  ## Platform conditional: returns bwExpr on black and white watches,
  ## colorExpr on color watches.
  ## Equivalent to C macro `PBL_IF_BW_ELSE(bw_expr, color_expr)`.
  when defined(pebbleColor):
    colorExpr
  else:
    bwExpr

template pblIfRoundElse*[T](roundExpr, rectExpr: T): T =
  ## Platform conditional: returns roundExpr on round watches,
  ## rectExpr on rectangular watches.
  ## Equivalent to C macro `PBL_IF_ROUND_ELSE(round_expr, rect_expr)`.
  when defined(pebbleRound):
    roundExpr
  else:
    rectExpr

# ============================================================================
# Display Constants
# ============================================================================

const
  PBLDisplayWidth* = when defined(pebbleRound): 180
                     elif defined(pebbleEmery): 200
                     else: 144
    ## Display width in pixels. 144 for Aplite/Basalt/Diorite/Flint,
    ## 180 for Chalk (round), 200 for Emery.

  PBLDisplayHeight* = when defined(pebbleRound): 180
                      elif defined(pebbleEmery): 228
                      else: 168
    ## Display height in pixels. 168 for Aplite/Basalt/Diorite/Flint,
    ## 180 for Chalk (round), 228 for Emery.

  ActionBarWidth* = 30
    ## Width of the action bar in pixels.

  StatusBarLayerHeight* = 16
    ## Height of the status bar layer in pixels.

# ============================================================================
# Color Fallback Helper
# ============================================================================

template colorFallback*(color, fallback: GColor): GColor =
  ## Returns `color` on color platforms, `fallback` on black and white.
  ## Equivalent to C macro pattern for platform-aware color selection.
  pblIfColorElse(color, fallback)

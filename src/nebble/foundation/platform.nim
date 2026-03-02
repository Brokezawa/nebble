## High-level Nim wrapper for Pebble Platform API.
##
## Provides platform conditional macros and display constants.

import nebble/ffi

# Platform Capability Detection
const
  isColor* = defined(pebbleBasalt) or defined(pebbleChalk) or defined(pebbleEmery) or defined(pebbleGabbro) or defined(pebbleColor)
  isRound* = defined(pebbleChalk) or defined(pebbleGabbro) or defined(pebbleRound)
  isEmery* = defined(pebbleEmery)
  isGabbro* = defined(pebbleGabbro)
  isHighResRect* = defined(pebbleEmery)
  isHighResRound* = defined(pebbleGabbro)
  isHighRes* = isEmery or isGabbro

# ============================================================================
# Platform Conditional Macros
# ============================================================================

template pblIfRectElse*[T](rectExpr, roundExpr: T): T =
  when isRound:
    roundExpr
  else:
    rectExpr

template pblIfColorElse*[T](colorExpr, bwExpr: T): T {.redefine.} =
  when isColor:
    colorExpr
  else:
    bwExpr

template pblIfBwElse*[T](bwExpr, colorExpr: T): T {.redefine.} =
  when isColor:
    colorExpr
  else:
    bwExpr

template pblIfRoundElse*[T](roundExpr, rectExpr: T): T {.redefine.} =
  when isRound:
    roundExpr
  else:
    rectExpr

template pblIfHealthElse*[T](healthExpr, elseExpr: T): T =
  when defined(pebbleAplite):
    elseExpr
  else:
    healthExpr

template pblIfMicrophoneElse*[T](micExpr, elseExpr: T): T =
  when defined(pebbleAplite):
    elseExpr
  else:
    micExpr

template pblIfSmartstrapElse*[T](smartstrapExpr, elseExpr: T): T =
  when defined(pebbleAplite) or defined(pebbleFlint):
    elseExpr
  else:
    smartstrapExpr

template pblIfHighResRectElse*[T](highResExpr, normalExpr: T): T =
  when isHighResRect:
    highResExpr
  else:
    normalExpr

template pblIfRoundOrHighResElse*[T](roundExpr, highResExpr, normalRectExpr: T): T =
  when isHighRes:
    highResExpr
  elif isRound:
    roundExpr
  else:
    normalRectExpr

# ============================================================================
# Display Constants
# ============================================================================

const
  PBLDisplayWidth* = when isGabbro: 260
                     elif isRound: 180
                     elif isEmery: 200
                     else: 144

  PBLDisplayHeight* = when isGabbro: 260
                      elif isRound: 180
                      elif isEmery: 228
                      else: 168

template colorFallback*(color, fallback: GColor): GColor =
  pblIfColorElse(color, fallback)

const
  ActionBarWidth* = when isGabbro: 50
                    elif isRound: 40
                    elif isEmery: 34
                    else: 30

  StatusBarLayerHeight* = when isGabbro: 30
                          elif isRound: 24
                          elif isEmery: 20
                          else: 16

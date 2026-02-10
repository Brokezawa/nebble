## High-level Nim wrapper for Pebble Content Indicator API.
##
## Provides visual indicators (arrows) showing that content is available
## in scrollable directions. Used with ScrollLayer to show users that
## more content is available above/below/left/right.

import nebble/ffi

export ffi.ContentIndicator, ffi.ContentIndicatorDirection, ffi.ContentIndicatorConfig

# ============================================================================
# Constructor & Destructor
# ============================================================================

proc newContentIndicator*(): ptr ContentIndicator {.inline.} =
  ## Create a new ContentIndicator.
  ## Returns nil on failure (out of memory).
  ## Equivalent to C function `content_indicator_create()`.
  ffi.content_indicator_create()

proc destroy*(indicator: ptr ContentIndicator) {.inline.} =
  ## Destroy a ContentIndicator and free its memory.
  ## Equivalent to C function `content_indicator_destroy(indicator)`.
  ffi.content_indicator_destroy(indicator)

# ============================================================================
# Direction Configuration
# ============================================================================

proc configureDirection*(indicator: ptr ContentIndicator;
                         direction: ContentIndicatorDirection;
                         config: ptr ContentIndicatorConfig): bool {.inline.} =
  ## Configure a direction with the given configuration.
  ## Returns true on success.
  ##
  ## The config struct should specify:
  ## - `layer` - The layer to display the indicator in
  ## - `colors.foreground` - Arrow color
  ## - `colors.background` - Background color
  ## - `alignment` - Where to position the indicator
  ## - `times_out` - Whether the indicator should fade out
  ##
  ## Equivalent to C function `content_indicator_configure_direction(...)`.
  result = ffi.content_indicator_configure_direction(indicator, direction, config)

# ============================================================================
# Content Availability
# ============================================================================

proc contentAvailable*(indicator: ptr ContentIndicator;
                       direction: ContentIndicatorDirection): bool {.inline.} =
  ## Check if content is marked as available in a direction.
  ## Returns true if the indicator should show for this direction.
  ## Equivalent to C function `content_indicator_get_content_available(...)`.
  result = ffi.content_indicator_get_content_available(indicator, direction)

proc setContentAvailable*(indicator: ptr ContentIndicator;
                          direction: ContentIndicatorDirection;
                          available: bool) {.inline.} =
  ## Manually set whether content is available in a direction.
  ## Set to true to show the indicator, false to hide it.
  ##
  ## Note: If using ScrollLayer integration, this may be automatically managed.
  ##
  ## Equivalent to C function `content_indicator_set_content_available(...)`.
  ffi.content_indicator_set_content_available(indicator, direction, available)

# ============================================================================
# Nim-idiomatic Helpers
# ============================================================================

proc makeConfig*(layer: ptr Layer;
                 foreground: GColor = GColorBlack;
                 background: GColor = GColorWhite;
                 alignment: GAlign = GAlignCenter;
                 timesOut: bool = true): ContentIndicatorConfig {.inline.} =
  ## Create a ContentIndicatorConfig with the specified settings.
  ## Convenience helper for configuring indicators.
  result.layer = layer
  result.colors.foreground = foreground
  result.colors.background = background
  result.alignment = alignment
  result.times_out = timesOut

proc configureUp*(indicator: ptr ContentIndicator;
                  layer: ptr Layer;
                  foreground: GColor = GColorBlack;
                  background: GColor = GColorWhite): bool {.inline.} =
  ## Configure the "up" direction indicator.
  ## Convenience helper for common configuration.
  let config = makeConfig(layer, foreground, background, GAlignTop, true)
  result = configureDirection(indicator, ContentIndicatorDirectionUp, addr config)

proc configureDown*(indicator: ptr ContentIndicator;
                   layer: ptr Layer;
                   foreground: GColor = GColorBlack;
                   background: GColor = GColorWhite): bool {.inline.} =
  ## Configure the "down" direction indicator.
  ## Convenience helper for common configuration.
  let config = makeConfig(layer, foreground, background, GAlignBottom, true)
  result = configureDirection(indicator, ContentIndicatorDirectionDown, addr config)



proc showUp*(indicator: ptr ContentIndicator) {.inline.} =
  ## Manually show the up indicator.
  setContentAvailable(indicator, ContentIndicatorDirectionUp, true)

proc hideUp*(indicator: ptr ContentIndicator) {.inline.} =
  ## Manually hide the up indicator.
  setContentAvailable(indicator, ContentIndicatorDirectionUp, false)

proc showDown*(indicator: ptr ContentIndicator) {.inline.} =
  ## Manually show the down indicator.
  setContentAvailable(indicator, ContentIndicatorDirectionDown, true)

proc hideDown*(indicator: ptr ContentIndicator) {.inline.} =
  ## Manually hide the down indicator.
  setContentAvailable(indicator, ContentIndicatorDirectionDown, false)

proc isUpVisible*(indicator: ptr ContentIndicator): bool {.inline.} =
  ## Check if the up indicator is currently visible.
  result = contentAvailable(indicator, ContentIndicatorDirectionUp)

proc isDownVisible*(indicator: ptr ContentIndicator): bool {.inline.} =
  ## Check if the down indicator is currently visible.
  result = contentAvailable(indicator, ContentIndicatorDirectionDown)

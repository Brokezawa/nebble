## High-level Nim wrapper for Pebble Content Indicator API.
##
## Provides visual indicators (arrows) showing that content is available
## in scrollable directions. Used with ScrollLayer to show users that
## more content is available above/below/left/right.

import nebble/ffi
import nebble/ffi/managed

export ffi.ContentIndicator, ffi.ContentIndicatorDirection, ffi.ContentIndicatorConfig

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(ContentIndicator, ContentIndicator,
                  content_indicator_create, content_indicator_destroy)

# ============================================================================
# Constructor
# ============================================================================

proc newContentIndicatorHandle*(): ContentIndicatorHandle {.inline.} =
  ## Create a new managed ContentIndicator.
  wrapOwned(ffi.content_indicator_create())

proc newContentIndicator*(): ContentIndicatorHandle {.inline.} =
  ## Alias for `newContentIndicatorHandle`.
  result = newContentIndicatorHandle()

# ============================================================================
# Direction Configuration
# ============================================================================

proc configureDirection*(h: ContentIndicatorHandle;
                         direction: ContentIndicatorDirection;
                         config: ptr ContentIndicatorConfig): bool {.inline.} =
  ## Configure a direction with the given configuration.
  if h.pRaw == nil: return false
  result = ffi.content_indicator_configure_direction(h.pRaw, direction, config)

# ============================================================================
# Content Availability
# ============================================================================

proc contentAvailable*(h: ContentIndicatorHandle;
                       direction: ContentIndicatorDirection): bool {.inline.} =
  ## Check if content is marked as available in a direction.
  if h.pRaw == nil: return false
  result = ffi.content_indicator_get_content_available(h.pRaw, direction)

proc setContentAvailable*(h: ContentIndicatorHandle;
                          direction: ContentIndicatorDirection;
                          available: bool) {.inline.} =
  ## Manually set whether content is available in a direction.
  if h.pRaw == nil: return
  ffi.content_indicator_set_content_available(h.pRaw, direction, available)

# ============================================================================
# Nim-idiomatic Helpers
# ============================================================================

proc makeConfig*(layer: ptr Layer;
                 foreground: GColor = GColorBlack;
                 background: GColor = GColorWhite;
                 alignment: GAlign = GAlignCenter;
                 timesOut: bool = true): ContentIndicatorConfig {.inline.} =
  ## Create a ContentIndicatorConfig with the specified settings.
  result.layer = layer
  result.colors.foreground = foreground
  result.colors.background = background
  result.alignment = alignment
  result.times_out = timesOut

proc configureUp*(h: ContentIndicatorHandle;
                  layer: ptr Layer;
                  foreground: GColor = GColorBlack;
                  background: GColor = GColorWhite): bool {.inline.} =
  ## Configure the "up" direction indicator.
  var config = makeConfig(layer, foreground, background, GAlignTop, true)
  result = h.configureDirection(ContentIndicatorDirectionUp, addr config)

proc configureDown*(h: ContentIndicatorHandle;
                    layer: ptr Layer;
                    foreground: GColor = GColorBlack;
                    background: GColor = GColorWhite): bool {.inline.} =
  ## Configure the "down" direction indicator.
  var config = makeConfig(layer, foreground, background, GAlignBottom, true)
  result = h.configureDirection(ContentIndicatorDirectionDown, addr config)

proc showUp*(h: ContentIndicatorHandle) {.inline.} =
  ## Manually show the up indicator.
  h.setContentAvailable(ContentIndicatorDirectionUp, true)

proc hideUp*(h: ContentIndicatorHandle) {.inline.} =
  ## Manually hide the up indicator.
  h.setContentAvailable(ContentIndicatorDirectionUp, false)

proc showDown*(h: ContentIndicatorHandle) {.inline.} =
  ## Manually show the down indicator.
  h.setContentAvailable(ContentIndicatorDirectionDown, true)

proc hideDown*(h: ContentIndicatorHandle) {.inline.} =
  ## Manually hide the down indicator.
  h.setContentAvailable(ContentIndicatorDirectionDown, false)

proc isUpVisible*(h: ContentIndicatorHandle): bool {.inline.} =
  ## Check if the up indicator is currently visible.
  result = h.contentAvailable(ContentIndicatorDirectionUp)

proc isDownVisible*(h: ContentIndicatorHandle): bool {.inline.} =
  ## Check if the down indicator is currently visible.
  result = h.contentAvailable(ContentIndicatorDirectionDown)


## High-level Nim wrapper for Pebble Content Indicator API.
##
## Provides visual indicators (arrows) showing that content is available
## in scrollable directions. Used with ScrollLayer to show users that
## more content is available above/below/left/right.
##
## **IMPORTANT**: The configuration structs passed to the SDK MUST persist
## for the entire lifetime of the ContentIndicator. Use global variables
## or heap-allocated memory for these structs.

import nebble/ffi
import nebble/ffi/managed

export ffi.ContentIndicator, ffi.ContentIndicatorDirection, ffi.ContentIndicatorConfig

# Re-export direction values for convenience
const
  ContentIndicatorDirectionUp* = ffi.ContentIndicatorDirectionUp
  ContentIndicatorDirectionDown* = ffi.ContentIndicatorDirectionDown

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
  ## The 'config' struct must persist for the lifetime of the indicator.
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

proc setupConfig*(config: var ContentIndicatorConfig;
                  layer: ptr Layer;
                  foreground: GColor = GColorBlack;
                  background: GColor = GColorWhite;
                  alignment: GAlign = GAlignCenter;
                  timesOut: bool = true) {.inline.} =
  ## Helper to populate a persistent config struct.
  config.layer = layer
  config.colors.foreground = foreground
  config.colors.background = background
  config.alignment = alignment
  config.times_out = timesOut

proc configure*(h: ContentIndicatorHandle;
                direction: ContentIndicatorDirection;
                config: var ContentIndicatorConfig;
                layer: ptr Layer;
                foreground: GColor = GColorBlack;
                background: GColor = GColorWhite;
                alignment: GAlign = GAlignCenter;
                timesOut: bool = true): bool {.inline.} =
  ## Populate a persistent config and apply it to the indicator.
  setupConfig(config, layer, foreground, background, alignment, timesOut)
  result = h.configureDirection(direction, addr config)

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

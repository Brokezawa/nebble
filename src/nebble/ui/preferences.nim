## High-level Nim wrapper for Pebble User Preferences API.
##
## Provides access to user preferences like quiet time and content size.

import nebble/ffi

export ffi.PreferredContentSize

# ============================================================================
# Quiet Time (Do Not Disturb)
# ============================================================================

when declared(ffi.quiet_time_is_active):
  proc quietTimeIsActive*(): bool {.inline.} =
    ## Check if Quiet Time (Do Not Disturb) is currently active.
    ## Returns true if the user has enabled quiet time.
    ## Equivalent to C function `quiet_time_is_active()`.
    result = ffi.quiet_time_is_active()

# ============================================================================
# Content Size Preferences
# ============================================================================

when declared(ffi.preferred_content_size):
  proc preferredContentSize*(): PreferredContentSize {.inline.} =
    ## Get the user's preferred content size setting.
    ## Returns Small, Medium, or Large based on user preference.
    ## Equivalent to C function `preferred_content_size()`.
    result = ffi.preferred_content_size()

when declared(ffi.preferred_result_display_duration):
  proc preferredResultDisplayDuration*(): uint32 {.inline.} =
    ## Get the user's preferred result display duration in milliseconds.
    ## Controls how long action results are shown.
    ## Equivalent to C function `preferred_result_display_duration()`.
    result = ffi.preferred_result_display_duration()

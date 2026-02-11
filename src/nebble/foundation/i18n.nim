## High-level Nim wrapper for Pebble Internationalization API.
##
## Provides locale information and string formatting for multiple languages.

import nebble/ffi

# ============================================================================
# Locale Information
# ============================================================================

when declared(ffi.i18n_get_system_locale):
  proc getSystemLocale*(): cstring {.inline.} =
    ## Get the system locale string (e.g., "en_US", "fr_FR").
    ## Equivalent to C function `i18n_get_system_locale()`.
    ## Returns null-terminated locale string.
    result = ffi.i18n_get_system_locale()

# ============================================================================
# String Resources
# ============================================================================

when declared(ffi.i18n_get_resource_locale):
  proc getResourceLocale*(): cstring {.inline.} =
    ## Get the locale for resource loading.
    ## Equivalent to C function `i18n_get_resource_locale()`.
    result = ffi.i18n_get_resource_locale()

when declared(ffi.i18n_set_resource_locale):
  proc setResourceLocale*(locale: cstring) {.inline.} =
    ## Set the locale for resource loading.
    ## Equivalent to C function `i18n_set_resource_locale(locale)`.
    ffi.i18n_set_resource_locale(locale)

# ============================================================================
# String Formatting
# ============================================================================

when declared(ffi.i18n_get_locale_standard_measurements):
  proc getLocaleStandardMeasurements*(): bool {.inline.} =
    ## Check if the current locale uses standard (metric) measurements.
    ## Returns false for imperial (US), true for metric.
    ## Equivalent to C function `i18n_get_locale_standard_measurements()`.
    result = ffi.i18n_get_locale_standard_measurements()

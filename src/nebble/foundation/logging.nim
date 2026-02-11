## High-level Nim wrapper for Pebble Logging API.
##
## Provides APP_LOG macros for debugging and log level definitions.
##
## Usage:
##   logError(cstring"Error: %d", errorCode)
##   logInfo(cstring"Hello, World!")

import nebble/ffi

export ffi.AppLogLevel

## Log levels (from pebble.h):
## - APP_LOG_LEVEL_ERROR = 1
## - APP_LOG_LEVEL_WARNING = 50
## - APP_LOG_LEVEL_INFO = 100
## - APP_LOG_LEVEL_DEBUG = 200
## - APP_LOG_LEVEL_DEBUG_VERBOSE = 255

template logError*(fmt: cstring, args: varargs[untyped]) =
  ## Log an error message.
  ## Equivalent to C: `APP_LOG(APP_LOG_LEVEL_ERROR, fmt, ...)`.
  ffi.APP_LOG(ffi.APP_LOG_LEVEL_ERROR.uint8, fmt, args)

template logWarning*(fmt: cstring, args: varargs[untyped]) =
  ## Log a warning message.
  ## Equivalent to C: `APP_LOG(APP_LOG_LEVEL_WARNING, fmt, ...)`.
  ffi.APP_LOG(ffi.APP_LOG_LEVEL_WARNING.uint8, fmt, args)

template logInfo*(fmt: cstring, args: varargs[untyped]) =
  ## Log an info message.
  ## Equivalent to C: `APP_LOG(APP_LOG_LEVEL_INFO, fmt, ...)`.
  ffi.APP_LOG(ffi.APP_LOG_LEVEL_INFO.uint8, fmt, args)

template logDebug*(fmt: cstring, args: varargs[untyped]) =
  ## Log a debug message.
  ## Equivalent to C: `APP_LOG(APP_LOG_LEVEL_DEBUG, fmt, ...)`.
  ffi.APP_LOG(ffi.APP_LOG_LEVEL_DEBUG.uint8, fmt, args)

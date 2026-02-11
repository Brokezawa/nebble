## High-level Nim wrapper for Pebble Accelerometer Service API.
##
## Provides access to accelerometer data, tap events, and shake detection.

import nebble/ffi

export ffi.AccelData, ffi.AccelDataHandler, ffi.AccelTapHandler
export ffi.AccelRawDataHandler, ffi.AccelSamplingRate, ffi.AccelAxisType

# ============================================================================
# Accelerometer Data Service
# ============================================================================

proc subscribe*(samplesPerUpdate: uint32, handler: AccelDataHandler) {.inline.} =
  ## Subscribe to accelerometer data updates.
  ## Equivalent to C function `accel_data_service_subscribe(samples_per_update, handler)`.
  ffi.accel_data_service_subscribe(samplesPerUpdate, handler)

proc unsubscribeData*() {.inline.} =
  ## Unsubscribe from accelerometer data updates.
  ## Equivalent to C function `accel_data_service_unsubscribe()`.
  ffi.accel_data_service_unsubscribe()

# ============================================================================
# Accelerometer Tap Service
# ============================================================================

proc subscribe*(handler: AccelTapHandler) {.inline.} =
  ## Subscribe to tap events.
  ## Equivalent to C function `accel_tap_service_subscribe(handler)`.
  ffi.accel_tap_service_subscribe(handler)

proc unsubscribeTap*() {.inline.} =
  ## Unsubscribe from tap events.
  ## Equivalent to C function `accel_tap_service_unsubscribe()`.
  ffi.accel_tap_service_unsubscribe()

# ============================================================================
# Accelerometer Configuration
# ============================================================================

proc peek*(data: ptr AccelData): cint {.inline.} =
  ## Get the current accelerometer data without subscribing.
  ## Equivalent to C function `accel_service_peek(data)`.
  ## Returns 0 on success, negative on error.
  ffi.accel_service_peek(data)

proc setSamplingRate*(rate: AccelSamplingRate): cint {.inline.} =
  ## Set the accelerometer sampling rate.
  ## Equivalent to C function `accel_service_set_sampling_rate(rate)`.
  ## Returns 0 on success, negative on error.
  ffi.accel_service_set_sampling_rate(rate)

proc setSamplesPerUpdate*(numSamples: uint32): cint {.inline.} =
  ## Set the number of samples per update.
  ## Equivalent to C function `accel_service_set_samples_per_update(num_samples)`.
  ## Returns 0 on success, negative on error.
  ffi.accel_service_set_samples_per_update(numSamples)

# ============================================================================
# Raw Data Service (Advanced)
# ============================================================================

when declared(ffi.accel_raw_data_service_subscribe):
  proc subscribe*(samplesPerUpdate: uint32, handler: AccelRawDataHandler) {.inline.} =
    ## Subscribe to raw accelerometer data (advanced).
    ## Equivalent to C function `accel_raw_data_service_subscribe(samples_per_update, handler)`.
    ffi.accel_raw_data_service_subscribe(samplesPerUpdate, handler)

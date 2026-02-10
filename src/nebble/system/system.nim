## High-level Nim wrapper for Pebble System API.
##
## Provides system utilities like sleep, heap info, and launch reasons.

import nebble/ffi

export ffi.AppLaunchReason, ffi.AppExitReason
export ffi.PreferredContentSize
export ffi.WatchInfoModel, ffi.WatchInfoColor, ffi.WatchInfoVersion
export ffi.BatteryChargeState, ffi.BatteryStateHandler
export ffi.BluetoothConnectionHandler
export ffi.VibePattern
export ffi.CompassHeadingData, ffi.CompassHeadingHandler, ffi.CompassHeading

# ============================================================================
# Sleep
# ============================================================================

proc sleep*(millis: int32) {.inline.} =
  ## Sleep for a specified number of milliseconds.
  ## Equivalent to C function `psleep(millis)`.
  ffi.psleep(millis.cint)

# ============================================================================
# Heap Memory
# ============================================================================

proc heapBytesFree*(): int {.inline.} =
  ## Get the amount of free heap memory in bytes.
  ## Equivalent to C function `heap_bytes_free()`.
  cast[int](ffi.heap_bytes_free())

proc heapBytesUsed*(): int {.inline.} =
  ## Get the amount of used heap memory in bytes.
  ## Equivalent to C function `heap_bytes_used()`.
  cast[int](ffi.heap_bytes_used())

when declared(ffi.memory_cache_flush):
  proc memoryCacheFlush*(start: pointer, size: int) {.inline.} =
    ## Flush the data cache for a specific memory range.
    ## Equivalent to C function `memory_cache_flush(start, size)`.
    ## NOTE: Not available on Aplite.
    ffi.memory_cache_flush(start, cast[csize_t](size))

# ============================================================================
# Launch & Exit
# ============================================================================

proc launchReason*(): AppLaunchReason {.inline.} =
  ## Get the reason the app was launched.
  ## Equivalent to C function `launch_reason()`.
  ffi.launch_reason()

proc launchArgs*(): uint32 {.inline.} =
  ## Get the launch arguments (e.g. from timeline or worker).
  ## Equivalent to C function `launch_get_args()`.
  ffi.launch_get_args()

when declared(ffi.exit_reason_set):
  proc setExitReason*(reason: AppExitReason) {.inline.} =
    ## Set the exit reason for the app.
    ## Equivalent to C function `exit_reason_set(reason)`.
    ## NOTE: Not available on Aplite.
    ffi.exit_reason_set(reason)

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
# Preferred Content Size
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

# ============================================================================
# Watch Info
# ============================================================================

proc watchModel*(): WatchInfoModel {.inline.} =
  ## Get the watch model (e.g. WatchModelBasalt, WatchModelChalk).
  ## Equivalent to C function `watch_info_get_model()`.
  result = ffi.watch_info_get_model()

proc watchColor*(): WatchInfoColor {.inline.} =
  ## Get the watch case color.
  ## Equivalent to C function `watch_info_get_color()`.
  result = ffi.watch_info_get_color()

proc watchFirmwareVersion*(): tuple[major: uint8; minor: uint8; patch: uint8] {.inline.} =
  ## Get the firmware version as a tuple (major, minor, patch).
  ## Equivalent to C function `watch_info_get_firmware_version()`.
  let version = ffi.watch_info_get_firmware_version()
  result = (version.major, version.minor, version.patch)

# ============================================================================
# Battery
# ============================================================================

proc chargeState*(): BatteryChargeState {.inline.} =
  ## Get the current battery charge state.
  ## Equivalent to C function `battery_state_service_peek()`.
  result = ffi.battery_state_service_peek()

proc chargePercent*(): uint8 {.inline.} =
  ## Get the battery charge percentage (0-100).
  ## Convenience helper extracting percentage from charge state.
  result = chargeState().charge_percent

proc isCharging*(): bool {.inline.} =
  ## Check if the watch is currently charging.
  ## Convenience helper checking charge state.
  result = chargeState().is_charging.bool

proc isPlugged*(): bool {.inline.} =
  ## Check if the watch is plugged in (on charger).
  ## Convenience helper checking charge state.
  result = chargeState().is_plugged.bool

when declared(ffi.battery_state_service_subscribe):
  proc batterySubscribe*(handler: BatteryStateHandler) {.inline.} =
    ## Subscribe to battery state change events.
    ## Equivalent to C function `battery_state_service_subscribe(handler)`.
    ffi.battery_state_service_subscribe(handler)

when declared(ffi.battery_state_service_unsubscribe):
  proc batteryUnsubscribe*() {.inline.} =
    ## Unsubscribe from battery state change events.
    ## Equivalent to C function `battery_state_service_unsubscribe()`.
    ffi.battery_state_service_unsubscribe()

# ============================================================================
# Bluetooth
# ============================================================================

proc bluetoothConnected*(): bool {.inline.} =
  ## Check if Bluetooth is currently connected to phone.
  ## Equivalent to C function `bluetooth_connection_service_peek()`.
  result = ffi.bluetooth_connection_service_peek()

when declared(ffi.bluetooth_connection_service_subscribe):
  proc bluetoothSubscribe*(handler: BluetoothConnectionHandler) {.inline.} =
    ## Subscribe to Bluetooth connection change events.
    ## Equivalent to C function `bluetooth_connection_service_subscribe(handler)`.
    ffi.bluetooth_connection_service_subscribe(handler)

when declared(ffi.bluetooth_connection_service_unsubscribe):
  proc bluetoothUnsubscribe*() {.inline.} =
    ## Unsubscribe from Bluetooth connection change events.
    ## Equivalent to C function `bluetooth_connection_service_unsubscribe()`.
    ffi.bluetooth_connection_service_unsubscribe()

# ============================================================================
# Vibes
# ============================================================================

proc vibesShortPulse*() {.inline.} =
  ## Trigger a short vibration pulse.
  ## Equivalent to C function `vibes_short_pulse()`.
  ffi.vibes_short_pulse()

proc vibesLongPulse*() {.inline.} =
  ## Trigger a long vibration pulse.
  ## Equivalent to C function `vibes_long_pulse()`.
  ffi.vibes_long_pulse()

proc vibesDoublePulse*() {.inline.} =
  ## Trigger a double vibration pulse.
  ## Equivalent to C function `vibes_double_pulse()`.
  ffi.vibes_double_pulse()

proc vibesEnqueueCustomPattern*(durations: ptr uint32; numSegments: uint32) {.inline.} =
  ## Enqueue a custom vibration pattern.
  ## `durations` is an array of segment durations in milliseconds.
  ## Odd indices are ON durations, even indices are OFF durations.
  ## Example: [100, 50, 100] means vibrate 100ms, pause 50ms, vibrate 100ms.
  ## Equivalent to C function `vibes_enqueue_custom_pattern()`.
  let pattern = VibePattern(
    durations: durations,
    num_segments: numSegments
  )
  ffi.vibes_enqueue_custom_pattern(pattern)

proc vibesCancel*() {.inline.} =
  ## Cancel any ongoing vibration.
  ## Equivalent to C function `vibes_cancel()`.
  ffi.vibes_cancel()

# ============================================================================
# Light (Backlight)
# ============================================================================

proc lightEnable*(enabled: bool) {.inline.} =
  ## Enable or disable the backlight.
  ## Equivalent to C function `light_enable(enabled)`.
  ffi.light_enable(enabled)

proc lightEnableInteraction*() {.inline.} =
  ## Enable backlight on button interaction.
  ## Equivalent to C function `light_enable_interaction()`.
  ffi.light_enable_interaction()

# ============================================================================
# Compass
# ============================================================================

when declared(ffi.compass_service_subscribe):
  proc compassSubscribe*(handler: CompassHeadingHandler) {.inline.} =
    ## Subscribe to compass heading updates.
    ## Equivalent to C function `compass_service_subscribe(handler)`.
    ffi.compass_service_subscribe(handler)

when declared(ffi.compass_service_unsubscribe):
  proc compassUnsubscribe*() {.inline.} =
    ## Unsubscribe from compass heading updates.
    ## Equivalent to C function `compass_service_unsubscribe()`.
    ffi.compass_service_unsubscribe()

when declared(ffi.compass_service_set_heading_filter):
  proc setHeadingFilter*(filter: CompassHeading) {.inline.} =
    ## Set the compass heading filter in degrees (0-360).
    ## Smaller values = more updates but less stable.
    ## Equivalent to C function `compass_service_set_heading_filter(filter)`.
    discard ffi.compass_service_set_heading_filter(filter)

when declared(ffi.compass_service_peek):
  proc peekHeading*(data: ptr CompassHeadingData): bool {.inline.} =
    ## Get the current compass heading.
    ## Returns true on success, false on error.
    ## Equivalent to C function `compass_service_peek(data)`.
    result = ffi.compass_service_peek(data) == 0


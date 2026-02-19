## comms_demo - Comprehensive Communications Demo
##
## Demonstrates:
## 1. AppMessage (Ping/Pong using typed_message)
## 2. Bluetooth Connection Status
## 3. Compass Heading
## 4. Heap-free string formatting

import nebble
import nebble/comms/typed_message
import nebble/comms/message
import gen/app_keys

var
  msgStr: FixedString[32]
  statusStr: FixedString[32]
  headingStr: FixedString[32]
  jsReady: bool = false

# Forward declarations of handlers
proc handshakeHandler(data: pointer) {.cdecl.}
proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}
proc connectionHandler(connected: bool) {.cdecl.}
proc compassHandler(data: CompassHeadingData) {.cdecl.}
proc inboxReceived(iter: ptr typed_message.DictionaryIterator, context: pointer) {.cdecl.}
proc inboxDropped(result: typed_message.AppMessageResult, context: pointer) {.cdecl.}
proc outboxSent(iter: ptr typed_message.DictionaryIterator, context: pointer) {.cdecl.}
proc outboxFailed(iter: ptr typed_message.DictionaryIterator, result: typed_message.AppMessageResult, context: pointer) {.cdecl.}

# = ===========================================================================
# Declarative App
# ============================================================================

nebbleApp:
  textLayer:
    id = statusLayer
    fullWidth = true
    y = 20
    h = 30
    alignment = GTextAlignmentCenter
    font = FONT_KEY_GOTHIC_18_BOLD

  textLayer:
    id = headingLayer
    fullWidth = true
    y = 60
    h = 30
    alignment = GTextAlignmentCenter
    text = "Calibrating..."

  textLayer:
    id = msgLayer
    fullWidth = true
    y = 100
    h = 40
    alignment = GTextAlignmentCenter
    text = "Waiting for JS..."

  clicks:
    BUTTON_ID_SELECT = selectClickHandler

  init:
    logInfo("Comms Demo Init")
    
    # 1. Connection Service
    connection.subscribe(connectionHandler)
    connectionHandler(connection.isConnected())
    
    # 2. Compass Service
    compass.subscribe(compassHandler)
    compass.setHeadingFilter(5) # 5 degree filter
    
    # 3. AppMessage (Register callbacks BEFORE opening)
    onInboxReceived(inboxReceived)
    onInboxDropped(inboxDropped)
    onOutboxSent(outboxSent)
    onOutboxFailed(outboxFailed)
    
    let res = typed_message.open(256, 256)
    if res == APP_MSG_OK():
      logInfo("AppMessage opened successfully")
      # Start robust handshake timer
      timer.once(1000, handshakeHandler)
    else:
      logInfo("AppMessage failed to open")

  deinit:
    connection.unsubscribe()
    compass.unsubscribe()
    typed_message.close()

# ============================================================================
# Handlers
# ============================================================================

proc handshakeHandler(data: pointer) {.cdecl.} =
  if jsReady: return
  
  logInfo("Handshake: Sending WatchReady...")
  # Use Result-based API - no addr needed
  let outbox = beginOutbox()
  if outbox.success:
    discard dictWriteInt(outbox.iter, AppMessageKey.amkWatchReady.uint32, 1)
    discard outboxSend()
  
  # Reschedule to try again in 1s
  timer.once(1000, handshakeHandler)

proc connectionHandler(connected: bool) {.cdecl.} =
  let state: cstring = if connected: "Connected" else: "Disconnected"
  statusStr.f("BT: ", state)
  statusLayer.text = statusStr.cstr
  if not connected:
    vibes.doublePulse()

proc compassHandler(data: CompassHeadingData) {.cdecl.} =
  # Only update if heading is valid
  if data.compass_status != CompassStatusDataInvalid():
    # Convert angle units to degrees
    let heading = (data.magnetic_heading.int64 * 360 div math.TRIG_MAX_ANGLE.int64).int32
    headingStr.f("Heading: ", heading)
    headingLayer.text = headingStr.cstr

proc inboxReceived(iter: ptr typed_message.DictionaryIterator, context: pointer) {.cdecl.} =
  # Handle messages from phone
  logInfo("Inbox received")
  
  # 1. Check for JSReady signal
  if message.find(iter, AppMessageKey.amkJSReady.uint32) != nil:
    jsReady = true
    msgStr.f("JS Ready! Press SELECT")
    msgLayer.text = msgStr.cstr
    vibes.shortPulse()
    return

  # 2. Handle "Pong" or other messages
  let msg = readCstring(iter, AppMessageKey.amkMsg)
  if msg != nil:
    # Use FixedString for logging to avoid heap
    var logMsg: FixedString[64]
    logMsg.f("Message data: ", msg)
    logInfo(logMsg.cstr)
    
    msgStr.f("Phone: ", msg)
    msgLayer.text = msgStr.cstr
    vibes.shortPulse()
  else:
    logInfo("Message field 'Msg' not found")

proc inboxDropped(result: typed_message.AppMessageResult, context: pointer) {.cdecl.} =
  logInfo("Inbox dropped")

proc outboxSent(iter: ptr typed_message.DictionaryIterator, context: pointer) {.cdecl.} =
  logInfo("Outbox sent successfully")
  msgLayer.text = "Ping sent!"

proc outboxFailed(iter: ptr typed_message.DictionaryIterator, result: typed_message.AppMessageResult, context: pointer) {.cdecl.} =
  var err: FixedString[32]
  err.f("Outbox failed: ", result.int32)
  logInfo(err.cstr)
  msgLayer.text = "Ping failed!"

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  # Send "Ping" to phone
  if not jsReady:
    msgLayer.text = "JS not ready yet"
    return

  logInfo("Select clicked, building outbox")
  # Use Result-based API - no addr needed
  let outbox = beginOutbox()
  if outbox.success:
    let dictRes = dictWriteCstring(outbox.iter, AppMessageKey.amkMsg.uint32, "Ping")
    if dictRes != DICT_OK():
      var err: FixedString[32]
      err.f("dictWrite error: ", dictRes.int32)
      logInfo(err.cstr)
    
    let res = outboxSend()
    if res == APP_MSG_OK():
      logInfo("outboxSend queued")
      msgLayer.text = "Sending..."
    else:
      var err: FixedString[32]
      err.f("outboxSend error: ", res.int32)
      logInfo(err.cstr)
      msgLayer.text = "Send Error!"
  else:
    logInfo("outboxBegin failed")

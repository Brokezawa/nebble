## comms_demo - Comprehensive Communications Demo
##
## Demonstrates:
## 1. AppMessage (Ping/Pong using typed_message)
## 2. Bluetooth Connection Status
## 3. Compass Heading
## 4. Heap-free string formatting

import nebble
import nebble/comms/typed_message
import gen/app_keys

var
  msgStr: FixedString[32]
  statusStr: FixedString[32]
  headingStr: FixedString[32]

# Forward declarations of handlers
proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.}
proc connectionHandler(connected: bool) {.cdecl.}
proc compassHandler(data: CompassHeadingData) {.cdecl.}
proc inboxReceived(iter: ptr typed_message.DictionaryIterator, context: pointer) {.cdecl.}

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
    text = "Press SELECT to Ping"

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
    
    # 3. AppMessage
    discard typed_message.open(typed_message.inboxSizeMaximum(), typed_message.outboxSizeMaximum())
    onInboxReceived(inboxReceived)

  deinit:
    connection.unsubscribe()
    compass.unsubscribe()
    typed_message.close()

# ============================================================================
# Handlers
# ============================================================================

proc connectionHandler(connected: bool) {.cdecl.} =
  let state: cstring = if connected: "Connected" else: "Disconnected"
  statusStr.f("BT: ", state)
  statusLayer.text = statusStr
  if not connected:
    vibes.doublePulse()

proc compassHandler(data: CompassHeadingData) {.cdecl.} =
  # Only update if heading is valid
  if data.compass_status != CompassStatusDataInvalid():
    # Convert angle units to degrees
    let heading = (data.magnetic_heading.int64 * 360 div math.TRIG_MAX_ANGLE.int64).int32
    headingStr.f("Heading: ", heading)
    headingLayer.text = headingStr

proc inboxReceived(iter: ptr typed_message.DictionaryIterator, context: pointer) {.cdecl.} =
  # Handle "Pong" from phone
  let msg = readCstring(iter, AppMessageKey.amkMsg)
  if msg != nil:
    msgStr.f("Phone: ", msg)
    msgLayer.text = msgStr
    vibes.shortPulse()

proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  # Send "Ping" to phone
  var iter: ptr typed_message.DictionaryIterator
  if outboxBegin(addr iter) == APP_MSG_OK:
    send(iter, AppMessageKey.amkMsg, "Ping")
    discard outboxSend()
    msgLayer.text = "Sending Ping..."

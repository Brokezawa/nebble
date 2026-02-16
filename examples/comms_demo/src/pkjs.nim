## Phone-side logic for comms_demo in Nim

import nebble/pkjs
import std/jsffi
import gen/app_keys

proc onReady(e: ReadyEvent) {.cdecl.} =
  echo "JS: ready event fired (Nim version)"
  try:
    # Correct API name: showSimpleNotificationOnPebble
    Pebble.showSimpleNotificationOnPebble("Nebble", "JS Component Ready (Nim)")
    
    # Send a test message to confirm JS is alive and ready
    echo "JS: Sending JSReady signal to watch..."
    let data = newJsObject()
    data[cstring"JSReady"] = 1.toJs()
    
    Pebble.sendAppMessage(data, proc() {.cdecl.} =
      echo "JS: Successfully sent JSReady to watch"
    , proc(err: JsObject) {.cdecl.} =
      echo "JS: Error sending JSReady"
    )
  except:
    let e = getCurrentException()
    echo "JS: Error in ready handler: ", e.msg

proc onMessage(e: AppMessageEvent) {.cdecl.} =
  echo "JS: Received message from watch"
  
  if e.payload.hasOwnProperty("WatchReady"):
    echo "JS: Received WatchReady, responding with JSReady..."
    let data = newJsObject()
    data[cstring"JSReady"] = 1.toJs()
    Pebble.sendAppMessage(data)
    return

  # Use named keys as defined in package.json messageKeys
  # In Nim JS, we can access properties like payload["Msg"]
  let msg = e.payload[cstring"Msg"].to(cstring)
  if msg == "Ping":
    echo "JS: Received Ping, sending Pong..."
    let outbox = newJsObject()
    outbox[cstring"Msg"] = cstring"Pong"
    
    Pebble.sendAppMessage(outbox, proc() {.cdecl.} =
      echo "JS: Successfully sent Pong back to watch"
    , proc(err: JsObject) {.cdecl.} =
      echo "JS: Error sending Pong"
    )

onReady(onReady)
onAppMessage(onMessage)

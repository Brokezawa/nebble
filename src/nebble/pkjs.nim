## Nim bindings for PebbleKit JS (PKJS).
## Allows writing phone-side logic in Nim and compiling to JavaScript.

import std/jsffi

type
  PebbleObject* = ref object of JsObject
  
  AppMessageEvent* = ref object of JsObject
    payload*: JsObject

  ReadyEvent* = ref object of JsObject

  AppMessageSuccessHandler* = proc() {.cdecl.}
  AppMessageErrorHandler* = proc(err: JsObject) {.cdecl.}

var Pebble* {.importjs: "Pebble".}: PebbleObject

# --- Pebble API ---

proc addEventListener*(p: PebbleObject, event: cstring, callback: proc(e: JsObject) {.cdecl.}) {.importcpp: "#.addEventListener(@)".}

proc sendAppMessage*(p: PebbleObject, data: JsObject) {.importcpp: "#.sendAppMessage(@)".}

proc sendAppMessage*(p: PebbleObject, data: JsObject, success: AppMessageSuccessHandler, failure: AppMessageErrorHandler) {.importcpp: "#.sendAppMessage(@)".}

proc showSimpleNotificationOnPebble*(p: PebbleObject, title, message: cstring) {.importcpp: "#.showSimpleNotificationOnPebble(@)".}

proc getTimelineToken*(p: PebbleObject, success: proc(token: cstring) {.cdecl.}, failure: proc(err: JsObject) {.cdecl.}) {.importcpp: "#.getTimelineToken(@)".}

proc timelineSubscribe*(p: PebbleObject, topic: cstring, success: proc() {.cdecl.}, failure: proc(err: JsObject) {.cdecl.}) {.importcpp: "#.timelineSubscribe(@)".}

proc timelineUnsubscribe*(p: PebbleObject, topic: cstring, success: proc() {.cdecl.}, failure: proc(err: JsObject) {.cdecl.}) {.importcpp: "#.timelineUnsubscribe(@)".}

proc getWatchToken*(p: PebbleObject): cstring {.importcpp: "#.getWatchToken()".}

proc getActiveWatchInfo*(p: PebbleObject): JsObject {.importcpp: "#.getActiveWatchInfo()".}

proc openURL*(p: PebbleObject, url: cstring) {.importcpp: "#.openURL(@)".}

proc appMessageDataToJSON*(p: PebbleObject, data: JsObject): JsObject {.importcpp: "#.appMessageDataToJSON(@)".}

# --- Helpers ---

template onReady*(callback: proc(e: ReadyEvent) {.cdecl.}) =
  ## Helper to subscribe to the "ready" event
  Pebble.addEventListener("ready", cast[proc(e: JsObject) {.cdecl.}](callback))

template onAppMessage*(callback: proc(e: AppMessageEvent) {.cdecl.}) =
  ## Helper to subscribe to the "appmessage" event
  Pebble.addEventListener("appmessage", cast[proc(e: JsObject) {.cdecl.}](callback))

template onShowConfiguration*(callback: proc(e: JsObject) {.cdecl.}) =
  ## Helper to subscribe to the "showConfiguration" event
  Pebble.addEventListener("showConfiguration", callback)

template onWebviewClosed*(callback: proc(e: JsObject) {.cdecl.}) =
  ## Helper to subscribe to the "webviewclosed" event
  Pebble.addEventListener("webviewclosed", callback)

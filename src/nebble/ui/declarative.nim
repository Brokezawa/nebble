## Declarative UI macros for Nebble
##
## Provides a DSL for defining Pebble UI with minimal boilerplate.
##
## Example watchface:
##   nebbleWatchface:
##     textLayer:
##       id = timeLayer
##       frame = (0, 52, 144, 48)
##       font = BITHAM_42_BOLD
##       alignment = GTextAlignmentCenter
##       color = GColorWhite
##     tickTimer:
##       unit = MINUTE_UNIT
##       handler = updateTime
##
## Example app:
##   nebbleApp:
##     window:
##       textLayer:
##         id = textLayer
##         frame = (0, 50, 144, 40)
##         text = "Hello World"
##       onClick: SELECT =
##         vibes.shortPulse()

import std/macros
import nebble/ffi

# ============================================================================
# Watchface Macro
# ============================================================================

macro nebbleWatchface*(body: untyped): untyped =
  ## Generate a complete watchface with tick timer support.
  ##
  ## DSL Keywords:
  ## - textLayer:    Define a TextLayer with properties
  ## - bitmapLayer:  Define a BitmapLayer with properties  
  ## - tickTimer:    Configure tick timer service
  ##
  ## Properties:
  ## - id:           Variable name for the layer (required for access)
  ## - frame:        (x, y, w, h) rectangle
  ## - bounds:       (w, h) size (auto-centered if frame not set)
  ## - font:         Font resource ID
  ## - text:         Initial text content
  ## - color:        Foreground/text color
  ## - bgColor:      Background color
  ## - alignment:    Text alignment
  ##
  ## Example:
  ##   nebbleWatchface:
  ##     textLayer:
  ##       id = timeLayer
  ##       frame = (0, 52, 144, 48)
  ##       font = BITHAM_42_BOLD
  ##     tickTimer:
  ##       unit = MINUTE_UNIT
  ##       handler = updateTime
  ##
  ##   proc updateTime(tm: ptr tm, units: TimeUnits) {.cdecl.} =
  ##     # Update timeLayer here
  
  result = newStmtList()
  
  var
    layerVars = newStmtList()      # var declarations
    layerInits = newStmtList()     # layer creation and setup
    layerAdds = newStmtList()      # adding to parent
    tickHandler: NimNode = nil     # tick timer handler
    tickUnit: NimNode = nil        # tick timer unit
    hasLayers = false
  
  # Parse the DSL body
  for stmt in body:
    if stmt.kind == nnkCall and stmt[0].kind == nnkIdent:
      let keyword = $stmt[0]
      
      case keyword
      of "textLayer", "bitmapLayer":
        hasLayers = true
        var 
          layerId: NimNode = nil
          frame: NimNode = nil
          bounds: NimNode = nil
          font: NimNode = nil
          text: NimNode = nil
          color: NimNode = nil
          bgColor: NimNode = nil
          alignment: NimNode = nil
        
        # Parse properties
        for prop in stmt[1]:
          if prop.kind == nnkAsgn and prop[0].kind == nnkIdent:
            let propName = $prop[0]
            let propVal = prop[1]
            
            case propName
            of "id": layerId = propVal
            of "frame": frame = propVal
            of "bounds": bounds = propVal
            of "font": font = propVal
            of "text": text = propVal
            of "color": color = propVal
            of "bgColor": bgColor = propVal
            of "alignment": alignment = propVal
        
        if layerId.isNil:
          error "Layer must have an 'id' property", stmt
        
        # Generate layer variable
        let layerType = if keyword == "textLayer": ident"TextLayer" else: ident"BitmapLayer"
        layerVars.add quote do:
          var `layerId`: ptr `layerType`
        
        # Generate layer initialization
        if keyword == "textLayer":
          # TextLayer creation
          if frame.isNil and bounds.isNil:
            error "TextLayer requires 'frame' or 'bounds' property", stmt
          
          let frameExpr = if frame.isNil:
            # Auto-center based on bounds
            quote do:
              let bounds = layer_get_bounds(window_get_root_layer(window))
              makeGRect((bounds.size.w - `bounds`[0]) div 2, 
                        (bounds.size.h - `bounds`[1]) div 2,
                        `bounds`[0], `bounds`[1])
          else:
            quote do:
              makeGRect(`frame`[0], `frame`[1], `frame`[2], `frame`[3])
          
          layerInits.add quote do:
            `layerId` = text_layer_create(`frameExpr`)
          
          if not font.isNil:
            layerInits.add quote do:
              text_layer_set_font(`layerId`, fonts_get_system_font(`font`))
          
          if not text.isNil:
            layerInits.add quote do:
              text_layer_set_text(`layerId`, `text`)
          
          if not color.isNil:
            layerInits.add quote do:
              text_layer_set_text_color(`layerId`, `color`)
          
          if not bgColor.isNil:
            layerInits.add quote do:
              text_layer_set_background_color(`layerId`, `bgColor`)
          
          if not alignment.isNil:
            layerInits.add quote do:
              text_layer_set_text_alignment(`layerId`, `alignment`)
          
          layerAdds.add quote do:
            layer_add_child(window_get_root_layer(window), text_layer_get_layer(`layerId`))
        
      of "tickTimer":
        # Parse tick timer configuration
        for prop in stmt[1]:
          if prop.kind == nnkAsgn and prop[0].kind == nnkIdent:
            let propName = $prop[0]
            let propVal = prop[1]
            
            case propName
            of "handler": tickHandler = propVal
            of "unit": tickUnit = propVal
        
    else:
      # Non-DSL statement, pass through
      result.add stmt
  
  # Generate the full watchface scaffold
  var windowLoadBody = newStmtList()
  windowLoadBody.add layerVars
  windowLoadBody.add layerInits
  windowLoadBody.add layerAdds
  
  var initBody = newStmtList()
  
  if not tickHandler.isNil and not tickUnit.isNil:
    initBody.add quote do:
      tick_timer_service_subscribe(`tickUnit`, `tickHandler`)
  
  var deinitBody = newStmtList()
  
  if not tickHandler.isNil:
    deinitBody.add quote do:
      tick_timer_service_unsubscribe()
  
  # Generate window unload to destroy layers
  var windowUnloadBody = newStmtList()
  for stmt in body:
    if stmt.kind == nnkCall and stmt[0].kind == nnkIdent:
      let keyword = $stmt[0]
      if keyword in ["textLayer", "bitmapLayer"]:
        for prop in stmt[1]:
          if prop.kind == nnkAsgn and $prop[0] == "id":
            let layerId = prop[1]
            if keyword == "textLayer":
              windowUnloadBody.add quote do:
                text_layer_destroy(`layerId`)
  
  # Build final output
  result.add quote do:
    var window: ptr Window
    
    proc windowLoad(win: ptr Window) {.cdecl.} =
      `windowLoadBody`
    
    proc windowUnload(win: ptr Window) {.cdecl.} =
      `windowUnloadBody`
    
    proc init() {.cdecl.} =
      window = window_create()
      window_set_window_handlers(window, WindowHandlers(
        load: windowLoad,
        unload: windowUnload
      ))
      window_stack_push(window, true)
      `initBody`
    
    proc deinit() {.cdecl.} =
      `deinitBody`
      window_destroy(window)
    
    proc main(): cint {.exportc, cdecl.} =
      init()
      app_event_loop()
      deinit()
      return 0

# ============================================================================
# Helper Templates
# ============================================================================

template layer*(id: untyped, body: untyped): untyped =
  ## Define a layer with the given ID.
  ## Used internally by DSL macros.
  discard

template withFont*(layer: ptr TextLayer, font: cstring): untyped =
  ## Set the font for a text layer.
  text_layer_set_font(layer, fonts_get_system_font(font))

template withText*(layer: ptr TextLayer, txt: cstring): untyped =
  ## Set the text for a text layer.
  text_layer_set_text(layer, txt)

template withColor*(layer: ptr TextLayer, col: GColor): untyped =
  ## Set the text color for a text layer.
  text_layer_set_text_color(layer, col)

template withBackgroundColor*(layer: ptr TextLayer, col: GColor): untyped =
  ## Set the background color for a text layer.
  text_layer_set_background_color(layer, col)

template withAlignment*(layer: ptr TextLayer, align: GTextAlignment): untyped =
  ## Set the text alignment for a text layer.
  text_layer_set_text_alignment(layer, align)

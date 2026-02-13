## Declarative UI macros for Nebble
##
## Provides a DSL for defining Pebble UI with minimal boilerplate.

import std/macros
import nebble/ffi
import nebble/ui/window
import nebble/ui/text_layer
import nebble/ui/bitmap_layer
import nebble/ui/status_bar
import nebble/ui/action_bar
import nebble/ui/rot_bitmap_layer
import nebble/ui/scroll_layer
import nebble/ui/menu_layer
import nebble/ui/simple_menu_layer
import nebble/ui/clicks
import nebble/ui/layer # for addChild
import nebble/graphics/fonts # for fonts_get_system_font

template nebbleWatchface*(body: untyped): untyped =
  ## Alias for `nebbleApp`.
  nebbleApp(body)

# ============================================================================
# App Scaffold Macro
# ============================================================================

macro nebbleApp*(body: untyped): untyped =
  ## Generate a complete watchapp or watchface with declarative UI.
  
  result = newStmtList()
  
  var
    globalVars = newStmtList()     # Module-level handle variables
    layerInits = newStmtList()     # layer creation and setup
    layerAdds = newStmtList()      # adding to parent
    layerCleanups = newStmtList()  # setting handles to nil in unload
    windowInits = newStmtList()    # window-specific setup
    dslInit = newStmtList()        # custom init block
    dslDeinit = newStmtList()      # custom deinit block
    
    tickHandler: NimNode = nil     # tick timer handler
    tickUnit: NimNode = nil        # tick timer unit
    
    clickHandlers = newStmtList()  # click configuration body
    hasClicks = false
    actionBarId: NimNode = nil     # Track if an action bar is used
    clickProviderName = ident("generatedClickConfigProvider")
  
  let windowVar = ident("pebbleWindow")
  let win = ident("win")
  
  # Generate window handle global
  globalVars.add quote do:
    var `windowVar`: WindowHandle
  
  # Parse the DSL body
  for stmt in body:
    if stmt.kind == nnkCall and stmt[0].kind == nnkIdent:
      let keyword = $stmt[0]
      
      case keyword
      of "window":
        for prop in stmt[1]:
          if prop.kind == nnkAsgn and prop[0].kind == nnkIdent:
            let propName = $prop[0]
            let propVal = prop[1]
            case propName
            of "backgroundColor":
              windowInits.add quote do:
                `windowVar`.backgroundColor = `propVal`
            else:
              error "Unknown window property: " & propName, prop

      of "init":
        for s in stmt[1]:
          dslInit.add s
      of "deinit":
        for s in stmt[1]:
          dslDeinit.add s

      of "textLayer", "bitmapLayer", "statusBarLayer", "actionBarLayer", "rotBitmapLayer", "scrollLayer", "menuLayer", "simpleMenuLayer", "layer":
        var 
          layerId: NimNode = nil
          parentVar: NimNode = nil
          frame: NimNode = nil
          bounds: NimNode = nil
          fullScreen: NimNode = nil
          fullWidth: NimNode = nil
          fullHeight: NimNode = nil
          xPos: NimNode = nil
          yPos: NimNode = nil
          widthVal: NimNode = nil
          heightVal: NimNode = nil
          font: NimNode = nil
          text: NimNode = nil
          color: NimNode = nil
          bgColor: NimNode = nil
          alignment: NimNode = nil
          bitmap: NimNode = nil
          sections: NimNode = nil
          numSections: NimNode = nil
        
        # Parse properties
        for prop in stmt[1]:
          if prop.kind == nnkAsgn and prop[0].kind == nnkIdent:
            let propName = $prop[0]
            let propVal = prop[1]
            
            case propName
            of "id": layerId = propVal
            of "parent": parentVar = propVal
            of "frame": frame = propVal
            of "bounds": bounds = propVal
            of "fullScreen": fullScreen = propVal
            of "fullWidth": fullWidth = propVal
            of "fullHeight": fullHeight = propVal
            of "x": xPos = propVal
            of "y": yPos = propVal
            of "w": widthVal = propVal
            of "h": heightVal = propVal
            of "font": font = propVal
            of "text": text = propVal
            of "color": color = propVal
            of "bgColor": bgColor = propVal
            of "alignment": alignment = propVal
            of "bitmap": bitmap = propVal
            of "sections": sections = propVal
            of "numSections": numSections = propVal
            else: discard 
        
        if layerId.isNil:
          error "Layer must have an 'id' property", stmt
        
        # Determine handle type
        let handleType = case keyword
          of "textLayer": ident"TextLayerHandle"
          of "bitmapLayer": ident"BitmapLayerHandle"
          of "statusBarLayer": ident"StatusBarLayerHandle"
          of "actionBarLayer": ident"ActionBarLayerHandle"
          of "rotBitmapLayer": ident"RotBitmapLayerHandle"
          of "scrollLayer": ident"ScrollLayerHandle"
          of "menuLayer": ident"MenuLayerHandle"
          of "simpleMenuLayer": ident"SimpleMenuLayerHandle"
          else: ident"LayerHandle"
        
        globalVars.add quote do:
          var `layerId`: `handleType`
        
        layerCleanups.add quote do:
          `layerId` = default(`handleType`)
        
        # Frame expression
        var frameExpr: NimNode
        
        let parentVarVal = if parentVar.isNil: quote do: cast[ptr Layer](nil) else: parentVar

        let parentLayerNode = if not parentVar.isNil:
                                quote do: `parentVarVal`.getLayer()
                              else:
                                quote do: `win`.rootLayer()

        if not fullScreen.isNil:
          frameExpr = quote do: 
            if `parentVarVal` != cast[ptr Layer](nil): `parentLayerNode`.bounds
            else: `win`.rootLayer().bounds
        else:
          let wNode = if not fullWidth.isNil:
                        quote do: 
                          (if `parentVarVal` != cast[ptr Layer](nil): `parentLayerNode`.bounds.size.w
                           else: `win`.rootLayer().bounds.size.w).int16
                      elif not widthVal.isNil:
                        quote do: `widthVal`.int16
                      elif not bounds.isNil:
                        quote do: `bounds`[0].int16
                      elif not frame.isNil:
                        quote do: `frame`[2].int16
                      else:
                        quote do: 0.int16

          let hNode = if not fullHeight.isNil:
                        quote do: 
                          (if `parentVarVal` != cast[ptr Layer](nil): `parentLayerNode`.bounds.size.h
                           else: `win`.rootLayer().bounds.size.h).int16
                      elif not heightVal.isNil:
                        quote do: `heightVal`.int16
                      elif not bounds.isNil:
                        quote do: `bounds`[1].int16
                      elif not frame.isNil:
                        quote do: `frame`[3].int16
                      else:
                        quote do: 0.int16

          let xNode = if not fullWidth.isNil:
                        quote do: 0.int16
                      elif not xPos.isNil:
                        if xPos.kind == nnkIdent and $xPos == "center":
                          quote do: (((if `parentVarVal` != cast[ptr Layer](nil): `parentLayerNode`.bounds.size.w
                                       else: `win`.rootLayer().bounds.size.w).int - `wNode`.int) div 2).int16
                        else:
                          quote do: `xPos`.int16
                      elif not bounds.isNil:
                        quote do: (((if `parentVarVal` != cast[ptr Layer](nil): `parentLayerNode`.bounds.size.w
                                     else: `win`.rootLayer().bounds.size.w).int - `wNode`.int) div 2).int16
                      elif not frame.isNil:
                        quote do: `frame`[0].int16
                      else:
                        quote do: 0.int16

          let yNode = if not fullHeight.isNil:
                        quote do: 0.int16
                      elif not yPos.isNil:
                        if yPos.kind == nnkIdent and $yPos == "center":
                          quote do: (((if `parentVarVal` != cast[ptr Layer](nil): `parentLayerNode`.bounds.size.h
                                       else: `win`.rootLayer().bounds.size.h).int - `hNode`.int) div 2).int16
                        else:
                          quote do: `yPos`.int16
                      elif not bounds.isNil:
                        quote do: (((if `parentVarVal` != cast[ptr Layer](nil): `parentLayerNode`.bounds.size.h
                                     else: `win`.rootLayer().bounds.size.h).int - `hNode`.int) div 2).int16
                      elif not frame.isNil:
                        quote do: `frame`[1].int16
                      else:
                        quote do: 0.int16

          if frame.isNil and bounds.isNil and fullScreen.isNil and fullWidth.isNil and 
             fullHeight.isNil and xPos.isNil and yPos.isNil and widthVal.isNil and heightVal.isNil:
            frameExpr = quote do: 
              (if `parentVarVal` != cast[ptr Layer](nil): `parentLayerNode`.bounds
               else: `win`.rootLayer().bounds)
          else:
            frameExpr = quote do: makeGRect(`xNode`, `yNode`, `wNode`, `hNode`)








        # Constructor and setup
        case keyword
        of "textLayer":
          layerInits.add quote do:
            `layerId` = newTextLayer(`frameExpr`)
          if not bgColor.isNil:
            layerInits.add quote do: `layerId`.backgroundColor = `bgColor`
          else:
            layerInits.add quote do: `layerId`.backgroundColor = GColorClear
          if not font.isNil:
            layerInits.add quote do: `layerId`.font = fonts_get_system_font(`font`)
          if not text.isNil:
            layerInits.add quote do: `layerId`.text = `text`
          if not color.isNil:
            layerInits.add quote do: `layerId`.textColor = `color`
          if not alignment.isNil:
            layerInits.add quote do: `layerId`.textAlignment = `alignment`
          
          layerAdds.add quote do:
            if `parentVarVal` != cast[ptr Layer](nil): `parentVarVal`.addChild(`layerId`)
            else: `win`.rootLayer().addChild(`layerId`)

        of "bitmapLayer":
          layerInits.add quote do:
            `layerId` = newBitmapLayer(`frameExpr`)
          if not bgColor.isNil:
            layerInits.add quote do: `layerId`.backgroundColor = `bgColor`
          else:
            layerInits.add quote do: `layerId`.backgroundColor = GColorClear
          if not bitmap.isNil:
            layerInits.add quote do: `layerId`.bitmap = `bitmap`
          if not alignment.isNil:
            layerInits.add quote do: `layerId`.alignment = `alignment`
          
          layerAdds.add quote do:
            if `parentVarVal` != cast[ptr Layer](nil): `parentVarVal`.addChild(`layerId`)
            else: `win`.rootLayer().addChild(`layerId`)

        of "statusBarLayer":
          layerInits.add quote do:
            `layerId` = newStatusBarLayer()
          if not color.isNil and not bgColor.isNil:
            layerInits.add quote do: `layerId`.setColors(`bgColor`, `color`)
          
          layerAdds.add quote do:
            if `parentVarVal` != cast[ptr Layer](nil): `parentVarVal`.addChild(`layerId`)
            else: `win`.rootLayer().addChild(`layerId`)

        of "actionBarLayer":
          actionBarId = layerId
          layerInits.add quote do:
            `layerId` = newActionBarLayer()
          if not bgColor.isNil:
            layerInits.add quote do: `layerId`.backgroundColor = `bgColor`
          windowInits.add quote do:
            `layerId`.addToWindow(`win`)

        of "rotBitmapLayer":
          if bitmap.isNil: error "rotBitmapLayer requires 'bitmap' property", stmt
          layerInits.add quote do:
            `layerId` = newRotBitmapLayer(`bitmap`)
          
          layerAdds.add quote do:
            if `parentVarVal` != cast[ptr Layer](nil): `parentVarVal`.addChild(`layerId`)
            else: `win`.rootLayer().addChild(`layerId`)

        of "scrollLayer":
          layerInits.add quote do:
            `layerId` = newScrollLayer(`frameExpr`)
          
          layerAdds.add quote do:
            if `parentVarVal` != cast[ptr Layer](nil): `parentVarVal`.addChild(`layerId`)
            else: `win`.rootLayer().addChild(`layerId`)

        of "menuLayer":
          layerInits.add quote do:
            `layerId` = newMenuLayer(`frameExpr`)
          
          layerAdds.add quote do:
            if `parentVarVal` != cast[ptr Layer](nil): `parentVarVal`.addChild(`layerId`)
            else: `win`.rootLayer().addChild(`layerId`)

        of "layer":
          layerInits.add quote do:
            `layerId` = newLayer(`frameExpr`)
          
          layerAdds.add quote do:
            if `parentVarVal` != cast[ptr Layer](nil): `parentVarVal`.addChild(`layerId`)
            else: `win`.rootLayer().addChild(`layerId`)

        of "simpleMenuLayer":
          if sections.isNil: error "simpleMenuLayer requires 'sections' property", stmt
          let nSec = if numSections.isNil: quote do: 1.int32 else: quote do: `numSections`.int32
          layerInits.add quote do:
            `layerId` = newSimpleMenuLayer(`frameExpr`, `win`, `sections`, `nSec`, nil)
          
          layerAdds.add quote do:
            if `parentVarVal` != cast[ptr Layer](nil): `parentVarVal`.addChild(`layerId`)
            else: `win`.rootLayer().addChild(`layerId`)

      of "tickTimer":
        for prop in stmt[1]:
          if prop.kind == nnkAsgn and prop[0].kind == nnkIdent:
            let propName = $prop[0]
            let propVal = prop[1]
            case propName
            of "handler": tickHandler = propVal
            of "unit": tickUnit = propVal
      
      of "clicks":
        hasClicks = true
        for prop in stmt[1]:
          if prop.kind == nnkAsgn: # Button = Handler
            let btn = prop[0]
            let handler = prop[1]
            clickHandlers.add quote do:
              onClick(`btn`, `handler`)
        
    else:
      # Non-DSL statement, pass through
      result.add stmt
  
  # Generate the full watchface scaffold
  var windowLoadBody = newStmtList()
  windowLoadBody.add layerInits
  windowLoadBody.add layerAdds
  windowLoadBody.add windowInits
  
  if hasClicks:
    if not actionBarId.isNil:
      windowLoadBody.add quote do: `actionBarId`.clickConfigProvider = `clickProviderName`
    else:
      windowLoadBody.add quote do: `win`.clickConfig = `clickProviderName`
  
  var initBody = newStmtList()
  if not tickHandler.isNil and not tickUnit.isNil:
    initBody.add quote do:
      tick_timer_service_subscribe(`tickUnit`, `tickHandler`)
  initBody.add dslInit
  
  var deinitBody = newStmtList()
  if not tickHandler.isNil:
    deinitBody.add quote do:
      tick_timer_service_unsubscribe()
  deinitBody.add dslDeinit
  
  # Generate window unload to destroy layers (via handles)
  var windowUnloadBody = newStmtList()
  windowUnloadBody.add layerCleanups
  
  # Click Provider Proc
  if hasClicks:
    result.add quote do:
      proc `clickProviderName`(ctx: pointer) {.cdecl.} =
        `clickHandlers`
  
  # Build final output
  result.add globalVars
  
  let pushStmt = quote do: `windowVar`.push()
 
  result.add quote do:
    proc windowLoad(`win`: ptr Window) {.cdecl.} =
      `windowLoadBody`
    
    proc windowUnload(`win`: ptr Window) {.cdecl.} =
      `windowUnloadBody`
    
    proc init() {.cdecl.} =
      `windowVar` = newWindow()
      `windowVar`.setHandlers(load=windowLoad, unload=windowUnload)
      `initBody`
      `pushStmt`
    
    proc deinit() {.cdecl.} =
      `deinitBody`
      if `windowVar`.pop():
        `windowVar` = default(WindowHandle)
    
    proc main(): cint {.exportc, cdecl.} =
      # Initialize Nim runtime
      proc NimMain() {.importc.}
      NimMain()
      
      init()
      app_event_loop()
      deinit()
      return 0

    # Stub for exit required by some Nim runtime features
    proc pebble_exit(code: cint) {.exportc: "_exit", cdecl.} = discard

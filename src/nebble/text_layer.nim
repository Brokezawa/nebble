## High-level idiomatic Nim API for Pebble text layers.
##
## TextLayer provides simple text rendering on screen with customizable
## font, color, alignment, and overflow modes.

import nebble/ffi

export ffi.TextLayer, ffi.GFont, ffi.GTextAlignment, ffi.GTextOverflowMode

# ============================================================================
# TextLayer Constructor / Destructor
# ============================================================================

proc newTextLayer*(frame: GRect; text: cstring = nil;
                   font: GFont = nil;
                   align: GTextAlignment = GTextAlignmentLeft): ptr TextLayer {.inline.} =
  ## Create a new TextLayer with optional common properties.
  ## The caller is responsible for calling `destroy()` when done.
  ## Equivalent to C function `text_layer_create(frame)` with optional property setters.
  ##
  ## Example:
  ##   newTextLayer(makeGRect(0, 0, 144, 40))  # Basic usage
  ##   newTextLayer(frame, "Hello", myFont, GTextAlignmentCenter)  # With properties
  result = ffi.text_layer_create(frame)
  if text != nil: ffi.text_layer_set_text(result, text)
  if font != nil: ffi.text_layer_set_font(result, font)
  ffi.text_layer_set_text_alignment(result, align)

proc destroy*(textLayer: ptr TextLayer) {.inline.} =
  ## Destroy a TextLayer and free its memory.
  ## Equivalent to C function `text_layer_destroy(text_layer)`.
  ffi.text_layer_destroy(textLayer)

# ============================================================================
# TextLayer <-> Layer Conversion
# ============================================================================

proc getLayer*(textLayer: ptr TextLayer): ptr Layer {.inline.} =
  ## Get the underlying Layer for adding to a parent.
  ## Equivalent to C function `text_layer_get_layer(text_layer)`.
  ffi.text_layer_get_layer(textLayer)

# ============================================================================
# TextLayer Properties
# ============================================================================

proc `text=`*(textLayer: ptr TextLayer, text: cstring) {.inline.} =
  ## Set the text content.
  ## The string must remain valid for the lifetime of the TextLayer
  ## (use a string literal or static buffer, not a temporary).
  ## Equivalent to C function `text_layer_set_text(text_layer, text)`.
  ffi.text_layer_set_text(textLayer, text)

proc text*(textLayer: ptr TextLayer): cstring {.inline.} =
  ## Get the current text content.
  ## Equivalent to C function `text_layer_get_text(text_layer)`.
  ffi.text_layer_get_text(textLayer)

proc `font=`*(textLayer: ptr TextLayer, font: GFont) {.inline.} =
  ## Set the font.
  ## Equivalent to C function `text_layer_set_font(text_layer, font)`.
  ffi.text_layer_set_font(textLayer, font)

proc `textAlignment=`*(textLayer: ptr TextLayer, alignment: GTextAlignment) {.inline.} =
  ## Set the text alignment (left, center, right).
  ## Equivalent to C function `text_layer_set_text_alignment(text_layer, alignment)`.
  ffi.text_layer_set_text_alignment(textLayer, alignment)

proc `backgroundColor=`*(textLayer: ptr TextLayer, color: GColor8) {.inline.} =
  ## Set the background color.
  ## Equivalent to C function `text_layer_set_background_color(text_layer, color)`.
  ffi.text_layer_set_background_color(textLayer, color)

proc `textColor=`*(textLayer: ptr TextLayer, color: GColor8) {.inline.} =
  ## Set the text color.
  ## Equivalent to C function `text_layer_set_text_color(text_layer, color)`.
  ffi.text_layer_set_text_color(textLayer, color)

proc `overflowMode=`*(textLayer: ptr TextLayer, mode: GTextOverflowMode) {.inline.} =
  ## Set the overflow mode (wordWrap, trailing ellipsis, fill).
  ## Equivalent to C function `text_layer_set_overflow_mode(text_layer, mode)`.
  ffi.text_layer_set_overflow_mode(textLayer, mode)

# ============================================================================
# TextLayer Size
# ============================================================================

proc contentSize*(textLayer: ptr TextLayer): GSize {.inline.} =
  ## Get the size of the rendered text content.
  ## Equivalent to C function `text_layer_get_content_size(text_layer)`.
  ffi.text_layer_get_content_size(textLayer)

proc `size=`*(textLayer: ptr TextLayer, maxSize: GSize) {.inline.} =
  ## Set the maximum size for text rendering.
  ## Equivalent to C function `text_layer_set_size(text_layer, max_size)`.
  ffi.text_layer_set_size(textLayer, maxSize)

# ============================================================================
# Static Text Buffer Management
# ============================================================================

template staticText*(layer: ptr TextLayer; bufVar: untyped; text: string) =
  ## Copy text into a static buffer and set it on the layer.
  ## Handles null-termination and length clamping automatically.
  ##
  ## **Before (5 lines, repeated ~20 times across examples):**
  ## ```nim
  ## let stepsText = "Steps: " & $steps
  ## for i in 0..<min(stepsText.len, 31):
  ##   stepsBuffer[i] = stepsText[i]
  ## stepsBuffer[min(stepsText.len, 31)] = '\0'
  ## text_layer_set_text(stepsLayer, cast[cstring](addr stepsBuffer[0]))
  ## ```
  ##
  ## **After (1 line):**
  ## ```nim
  ## stepsLayer.staticText(stepsBuffer, "Steps: " & $steps)
  ## ```
  ##
  ## The buffer variable must be a module-level `var array[N, char]`.
  ## Local buffers are not supported (they have stack lifetime).
  let src = text
  let maxLen = bufVar.len - 1
  let copyLen = min(src.len, maxLen)
  for i in 0..<copyLen:
    bufVar[i] = src[i]
  bufVar[copyLen] = '\0'
  ffi.text_layer_set_text(layer, cast[cstring](addr bufVar[0]))

# ============================================================================
# TextLayer Text Flow (for Pebble Time 2 platforms with larger displays)
# ============================================================================

when declared(text_layer_enable_screen_text_flow_and_paging):
  proc enableScreenTextFlowAndPaging*(textLayer: ptr TextLayer, inset: uint8) {.inline.} =
    ## Enable screen text flow and paging for long text.
    ## Equivalent to C function `text_layer_enable_screen_text_flow_and_paging(...)`.
    ffi.text_layer_enable_screen_text_flow_and_paging(textLayer, inset)

  proc restoreDefaultTextFlowAndPaging*(textLayer: ptr TextLayer) {.inline.} =
    ## Restore the default text flow and paging behavior.
    ## Equivalent to C function `text_layer_restore_default_text_flow_and_paging(...)`.
    ffi.text_layer_restore_default_text_flow_and_paging(textLayer)

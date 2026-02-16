## ARC-Managed TextLayer Handle
##
## Provides automatic memory management for TextLayer objects using Nim's ARC
## (Automatic Reference Counting) system.
##
## **Key Features:**
## - Automatic destruction when handle goes out of scope
## - Move semantics (no copying)
## - Property-style accessors for common operations
## - Compatible with manual `ptr TextLayer` API via converters
##
## **Usage Example:**
##   ```nim
##   import nebble/ui/text_layer
##   
##   var textLayer: TextLayerHandle  # Module-level persistence
##   
##   proc windowLoad(win: ptr Window) {.cdecl.} =
##     textLayer = newTextLayer(makeGRect(0, 50, 144, 40))
##     textLayer.text = "Hello World"
##     textLayer.font = BITHAM_42_BOLD
##     win.rootLayer.addChild(textLayer.getLayer())
##   
##   proc windowUnload(win: ptr Window) {.cdecl.} =
##     textLayer = TextLayerHandle(nil)  # Explicit destroy
##   ```
##
## **Memory Safety:**
## The handle has unique ownership of the TextLayer. When the handle is
## reassigned or goes out of scope, `text_layer_destroy` is called automatically.
## Copying is disabled to prevent double-free errors.

import nebble/ffi
import nebble/ffi/managed
import ../util/fixed_strings

# Re-export FFI types for compatibility/completeness
export ffi.TextLayer, ffi.GFont, ffi.GTextAlignment, ffi.GTextOverflowMode

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(TextLayer, TextLayer,
                  text_layer_create, text_layer_destroy)

# ============================================================================
# Constructors
# ============================================================================

proc newTextLayerHandle*(frame: GRect): TextLayerHandle =
  wrapOwned(ffi.text_layer_create(frame))

proc newTextLayer*(frame: GRect): TextLayerHandle =
  ## Alias for `newTextLayerHandle`.
  result = newTextLayerHandle(frame)

proc newTextLayerHandle*(frame: GRect; text: cstring;
                        font: GFont = nil;
                        align: GTextAlignment = GTextAlignmentLeft): TextLayerHandle =
  ## Create a new managed TextLayer with initial properties.
  ##
  ## **Parameters:**
  ## - `frame`: The frame rectangle
  ## - `text`: Initial text content (cstring, must remain valid)
  ## - `font`: Initial font (optional)
  ## - `align`: Text alignment (default: Left)
  ##
  ## **Example:**
  ##   var layer = newTextLayer(
  ##     makeGRect(0, 50, 144, 40),
  ##     "Hello World",
  ##     BITHAM_42_BOLD,
  ##     GTextAlignmentCenter
  ##   )
  result = wrapOwned(ffi.text_layer_create(frame))
  if text != nil: text_layer_set_text(result.toPtr, text)
  if font != nil: text_layer_set_font(result.toPtr, font)
  text_layer_set_text_alignment(result.toPtr, align)

proc newTextLayer*(frame: GRect; text: cstring;
                   font: GFont = nil;
                   align: GTextAlignment = GTextAlignmentLeft): TextLayerHandle =
  ## Alias for `newTextLayerHandle`.
  result = newTextLayerHandle(frame, text, font, align)

# ============================================================================
# Layer Access
# ============================================================================

proc getLayer*(h: TextLayerHandle): ptr Layer {.inline.} =
  ## Get the underlying Layer pointer for adding to parent.
  ##
  ## **Example:**
  ##   win.rootLayer.addChild(textLayer.getLayer())
  ##
  ## **Note:** The returned pointer is valid as long as the handle exists.
  ## Do not destroy the layer via the returned pointer.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  text_layer_get_layer(h.toPtr)

# ============================================================================
# Property Accessors
# ============================================================================

proc `text=`*(h: var TextLayerHandle, value: cstring) {.inline.} =
  if h.pRaw == nil: return
  text_layer_set_text(h.pRaw, value)

proc `text=`*(p: ptr TextLayer, value: cstring) {.inline.} =
  if p == nil: return
  text_layer_set_text(p, value)

template `text=`*[N](h: var TextLayerHandle, value: FixedString[N]) =
  ## Set text using a heap-free FixedString.
  if h.pRaw != nil:
    text_layer_set_text(h.pRaw, value.toCstring)

template `text=`*[N](p: ptr TextLayer, value: FixedString[N]) =
  ## Set text using a heap-free FixedString.
  if p != nil:
    text_layer_set_text(p, value.toCstring)

proc text*(h: TextLayerHandle): cstring {.inline.} =
  ## Get the current text content.
  if h.pRaw == nil: return nil
  text_layer_get_text(h.toPtr)

proc `font=`*(h: var TextLayerHandle, value: GFont) {.inline.} =
  if h.pRaw == nil: return
  text_layer_set_font(h.pRaw, value)

proc `font=`*(p: ptr TextLayer, value: GFont) {.inline.} =
  if p == nil: return
  text_layer_set_font(p, value)

proc `textAlignment=`*(h: var TextLayerHandle, value: GTextAlignment) {.inline.} =
  if h.pRaw == nil: return
  text_layer_set_text_alignment(h.pRaw, value)

proc `textAlignment=`*(p: ptr TextLayer, value: GTextAlignment) {.inline.} =
  if p == nil: return
  text_layer_set_text_alignment(p, value)

proc `textColor=`*(h: var TextLayerHandle, value: GColor8) {.inline.} =
  if h.pRaw == nil: return
  text_layer_set_text_color(h.pRaw, value)

proc `textColor=`*(p: ptr TextLayer, value: GColor8) {.inline.} =
  if p == nil: return
  text_layer_set_text_color(p, value)

proc `backgroundColor=`*(h: var TextLayerHandle, value: GColor8) {.inline.} =
  if h.pRaw == nil: return
  text_layer_set_background_color(h.pRaw, value)

proc `backgroundColor=`*(p: ptr TextLayer, value: GColor8) {.inline.} =
  if p == nil: return
  text_layer_set_background_color(p, value)

proc `overflowMode=`*(h: var TextLayerHandle, value: GTextOverflowMode) {.inline.} =
  ## Set the overflow mode (wordWrap, trailing ellipsis, fill).
  if h.pRaw == nil: return
  text_layer_set_overflow_mode(h.toPtr, value)

# ============================================================================
# Size and Content
# ============================================================================

proc contentSize*(h: TextLayerHandle): GSize {.inline.} =
  ## Get the size of the rendered text content.
  if h.pRaw == nil: return GSize(w: 0, h: 0)
  text_layer_get_content_size(h.toPtr)

proc `size=`*(h: var TextLayerHandle, value: GSize) {.inline.} =
  ## Set the maximum size for text rendering.
  if h.pRaw == nil: return
  text_layer_set_size(h.toPtr, value)

proc `frame=`*(h: var TextLayerHandle, value: GRect) {.inline.} =
  ## Set the layer frame (position and size).
  if h.pRaw == nil: return
  let layer = text_layer_get_layer(h.toPtr)
  layer_set_frame(layer, value)

proc frame*(h: TextLayerHandle): GRect {.inline.} =
  ## Get the layer frame.
  if h.pRaw == nil: return makeGRect(0, 0, 0, 0)
  let layer = text_layer_get_layer(h.toPtr)
  layer_get_frame(layer)

# = ===========================================================================
# Platform-Specific Features
# ============================================================================

when declared(text_layer_enable_screen_text_flow_and_paging):
  proc enableScreenTextFlowAndPaging*(h: var TextLayerHandle, inset: uint8) {.inline.} =
    ## Enable screen text flow and paging for long text.
    ## **Note:** Only available on Pebble Time 2 platforms.
    when ManagedDebug or ManagedStrict:
      h.checkValid()
    text_layer_enable_screen_text_flow_and_paging(h.toPtr, inset)
  
  proc restoreDefaultTextFlowAndPaging*(h: var TextLayerHandle) {.inline.} =
    ## Restore the default text flow and paging behavior.
    when ManagedDebug or ManagedStrict:
      h.checkValid()
    text_layer_restore_default_text_flow_and_paging(h.toPtr)

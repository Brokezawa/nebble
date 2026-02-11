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
##   import nebble/ui/text_layer_managed
##   
##   var textLayer: TextLayerHandle  # Module-level persistence
##   
##   proc windowLoad(win: ptr Window) {.cdecl.} =
##     textLayer = newTextLayerHandle(makeGRect(0, 50, 144, 40))
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
##
## **Comparison with Manual API:**
## | Manual API | Managed API |
## |------------|-------------|
## | `var layer: ptr TextLayer` | `var layer: TextLayerHandle` |
## | `layer = newTextLayer(frame)` | `layer = newTextLayerHandle(frame)` |
## | `layer.destroy()` (manual) | Auto-destroyed on scope exit |
## | Can copy ptr (dangerous) | Copy disabled (safe) |

import nebble/ffi
import nebble/ffi/managed
import nebble/ui/text_layer

# ============================================================================
# Define the Managed Handle
# ============================================================================

DefineUniqueHandle(TextLayer, TextLayer,
                  text_layer_create, text_layer_destroy)

# ============================================================================
# Constructors
# ============================================================================

proc newTextLayerHandle*(frame: GRect): TextLayerHandle {.inline.} =
  ## Create a new managed TextLayer.
  ##
  ## **Parameters:**
  ## - `frame`: The frame rectangle for the layer
  ##
  ## **Returns:**
  ## - A new `TextLayerHandle` with unique ownership of the TextLayer
  ##
  ## **Example:**
  ##   var layer = newTextLayerHandle(makeGRect(0, 50, 144, 40))
  ##
  ## **Memory Safety:** The returned handle owns the TextLayer. It will be
  ## automatically destroyed when the handle goes out of scope or is reassigned.
  result = TextLayerHandle(text_layer_create(frame))

proc newTextLayerHandle*(frame: GRect; text: cstring;
                        font: GFont = nil;
                        align: GTextAlignment = GTextAlignmentLeft): TextLayerHandle {.inline.} =
  ## Create a new managed TextLayer with initial properties.
  ##
  ## **Parameters:**
  ## - `frame`: The frame rectangle
  ## - `text`: Initial text content (cstring, must remain valid)
  ## - `font`: Initial font (optional)
  ## - `align`: Text alignment (default: Left)
  ##
  ## **Example:**
  ##   var layer = newTextLayerHandle(
  ##     makeGRect(0, 50, 144, 40),
  ##     "Hello World",
  ##     BITHAM_42_BOLD,
  ##     GTextAlignmentCenter
  ##   )
  result = TextLayerHandle(text_layer_create(frame))
  if text != nil: text_layer_set_text(result.toPtr, text)
  if font != nil: text_layer_set_font(result.toPtr, font)
  text_layer_set_text_alignment(result.toPtr, align)

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

proc `text=`*(h: TextLayerHandle, value: cstring) {.inline.} =
  ## Set the text content.
  ##
  ## **⚠️ Safety:** The cstring must remain valid for the lifetime of the
  ## TextLayer. Use string literals or static buffers. For dynamic text,
  ## use `staticText` template from `text_layer.nim`.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  text_layer_set_text(h.toPtr, value)

proc text*(h: TextLayerHandle): cstring {.inline.} =
  ## Get the current text content.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  text_layer_get_text(h.toPtr)

proc `font=`*(h: TextLayerHandle, value: GFont) {.inline.} =
  ## Set the font.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  text_layer_set_font(h.toPtr, value)

proc `textAlignment=`*(h: TextLayerHandle, value: GTextAlignment) {.inline.} =
  ## Set text alignment (left, center, right).
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  text_layer_set_text_alignment(h.toPtr, value)

proc `textColor=`*(h: TextLayerHandle, value: GColor8) {.inline.} =
  ## Set the text color.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  text_layer_set_text_color(h.toPtr, value)

proc `backgroundColor=`*(h: TextLayerHandle, value: GColor8) {.inline.} =
  ## Set the background color.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  text_layer_set_background_color(h.toPtr, value)

proc `overflowMode=`*(h: TextLayerHandle, value: GTextOverflowMode) {.inline.} =
  ## Set the overflow mode (wordWrap, trailing ellipsis, fill).
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  text_layer_set_overflow_mode(h.toPtr, value)

# ============================================================================
# Size and Content
# ============================================================================

proc contentSize*(h: TextLayerHandle): GSize {.inline.} =
  ## Get the size of the rendered text content.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  text_layer_get_content_size(h.toPtr)

proc `size=`*(h: TextLayerHandle, value: GSize) {.inline.} =
  ## Set the maximum size for text rendering.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  text_layer_set_size(h.toPtr, value)

proc `frame=`*(h: TextLayerHandle, value: GRect) {.inline.} =
  ## Set the layer frame (position and size).
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_set_frame(text_layer_get_layer(h.toPtr), value)

proc frame*(h: TextLayerHandle): GRect {.inline.} =
  ## Get the layer frame.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  layer_get_frame(text_layer_get_layer(h.toPtr))

# ============================================================================
# Static Text Helper
# ============================================================================

template staticText*(h: TextLayerHandle, bufVar: untyped, text: string) =
  ## Copy text into a static buffer and set it on the managed layer.
  ##
  ## This template works exactly like the one in `text_layer.nim`, but
  ## operates on a managed handle.
  ##
  ## **Usage:**
  ##   var buffer: array[32, char]
  ##   textLayer.staticText(buffer, "Steps: " & $stepCount)
  ##
  ## **Note:** `bufVar` must be a module-level `var array[N, char]`.
  ## Local buffers are not supported due to stack lifetime.
  when ManagedDebug or ManagedStrict:
    h.checkValid()
  let src = text
  let maxLen = bufVar.len - 1
  let copyLen = min(src.len, maxLen)
  for i in 0..<copyLen:
    bufVar[i] = src[i]
  bufVar[copyLen] = '\0'
  text_layer_set_text(h.toPtr, cast[cstring](addr bufVar[0]))

# ============================================================================
# Platform-Specific Features
# ============================================================================

when declared(text_layer_enable_screen_text_flow_and_paging):
  proc enableScreenTextFlowAndPaging*(h: TextLayerHandle, inset: uint8) {.inline.} =
    ## Enable screen text flow and paging for long text.
    ## **Note:** Only available on Pebble Time 2 platforms.
    when ManagedDebug or ManagedStrict:
      h.checkValid()
    text_layer_enable_screen_text_flow_and_paging(h.toPtr, inset)
  
  proc restoreDefaultTextFlowAndPaging*(h: TextLayerHandle) {.inline.} =
    ## Restore the default text flow and paging behavior.
    when ManagedDebug or ManagedStrict:
      h.checkValid()
    text_layer_restore_default_text_flow_and_paging(h.toPtr)

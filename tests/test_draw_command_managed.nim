## Compile-time smoke tests for draw-command managed wrappers
## Ensures the managed handle types compile and basic converters exist.

import nebble
import nebble/graphics/draw_command_image_managed
import nebble/graphics/draw_command_sequence_managed
import nebble/graphics/text_attributes_managed

proc runSmoke() =
  # Create nil handles and verify helpers compile
  var img: DrawCommandImageHandle = DrawCommandImageHandle(nil)
  var seq: DrawCommandSequenceHandle = DrawCommandSequenceHandle(nil)
  var ta: TextAttributesHandle = TextAttributesHandle(nil)

  # isNil/isValid compile
  assert img.isNil()
  assert seq.isNil()
  assert ta.isNil()

  # Converters to raw pointers compile
  let pimg: ptr GDrawCommandImage = img.toPtr
  let pseq: ptr GDrawCommandSequence = seq.toPtr
  let pta: ptr GTextAttributes = ta.toPtr
  discard pimg; discard pseq; discard pta

when isMainModule:
  runSmoke()

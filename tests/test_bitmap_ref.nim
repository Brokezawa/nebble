import std/[alloc, sequtils]
import nebble/graphics/bitmap_ref

proc test_write_read() =
  let size = makeGSize(16, 8)
  var b = newBlankBitmapRef(size, GBitmapFormat8Bit)
  assert b.isValid()
  let rowBytes = b.bytesPerRow
  let data = b.data
  assert data != nil
  # write pattern: each pixel = row index
  for y in 0 ..< size.h:
    for x in 0 ..< size.w:
      data[y*rowBytes + x] = uint8(y)

  # read back
  for y in 0 ..< size.h:
    for x in 0 ..< size.w:
      let v = data[y*rowBytes + x]
      assert v == uint8(y)

  # drop reference
  b = nil

proc test_parent_retention() =
  # parent should be retained while child exists
  var parent = newBlankBitmapRef(makeGSize(24,24), GBitmapFormat8Bit)
  var child = createSubBitmapRef(parent, makeGRect(0,0,8,8))
  assert child.isValid()
  # clear our external parent reference - child must keep underlying data alive
  parent = nil
  assert child.isValid()
  # now drop child - no crash in stubbed environment; success if we reach here
  child = nil

when isMainModule:
  test_write_read()
  test_parent_retention()
  echo "OK"

// Extended minimal stubs for Pebble SDK functions used by bitmap_ref
// These are intended for host-side smoke tests only. They implement a
// tiny in-process fake GBitmap that provides bounds, data pointer and
// basic palette support so Nim unit tests can run without the real
// Pebble SDK.

#include <stddef.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

// Geometry types (match pebble.h layout used by generated FFI)
typedef struct { int16_t x, y; } GPoint;
typedef struct { int16_t w, h; } GSize;
typedef struct { GPoint origin; GSize size; } GRect;

// Simple fake GColor
typedef struct { uint8_t argb; } GColor;

// Opaque GBitmap pointer in Pebble SDK. We'll allocate this struct and
// cast to the opaque pointer the Nim code expects.
typedef struct {
  GRect bounds;
  uint16_t bytes_per_row;
  uint8_t* data;
  int format;
  GColor* palette;
  int free_palette_on_destroy;
} FakeGBitmap;

// Helper to compute bytesPerRow for a format
static uint16_t compute_bpr(int format, int16_t width) {
  // Very small subset: 1-bit and 8-bit formats
  // Assume format==0 => 1-bit, format==1 => 8-bit (this maps well enough
  // for host stubs; Nim-side uses GBitmapFormat enums but only cares about
  // bytes-per-row in tests).
  if (format == 0) {
    return (width + 7) / 8;
  }
  // Default to 1 byte per pixel
  return (uint16_t)width;
}

// Create/destroy stubs for draw-command / text-attributes (noop)
void gdraw_command_image_destroy(void* img) { (void)img; }
void gdraw_command_sequence_destroy(void* seq) { (void)seq; }
void graphics_text_attributes_destroy(void* ta) { (void)ta; }

// GBitmap API stubs
void gbitmap_destroy(void* bitmap) {
  if (bitmap == NULL) return;
  FakeGBitmap* b = (FakeGBitmap*)bitmap;
  if (b->data) free(b->data);
  if (b->palette && b->free_palette_on_destroy) free(b->palette);
  free(b);
}

void* gbitmap_create_with_resource(uint32_t resource_id) {
  // For stubs, create a small default bitmap (32x32, 8-bit)
  FakeGBitmap* b = (FakeGBitmap*)malloc(sizeof(FakeGBitmap));
  b->bounds.origin.x = 0;
  b->bounds.origin.y = 0;
  b->bounds.size.w = 32;
  b->bounds.size.h = 32;
  b->format = 1;
  b->bytes_per_row = compute_bpr(b->format, b->bounds.size.w);
  b->data = (uint8_t*)malloc(b->bytes_per_row * b->bounds.size.h);
  memset(b->data, 0, b->bytes_per_row * b->bounds.size.h);
  b->palette = NULL;
  b->free_palette_on_destroy = 0;
  (void)resource_id;
  return b;
}

void* gbitmap_create_with_data(uint8_t* data) {
  // Wrap provided data in a fake bitmap; caller owns the data pointer
  FakeGBitmap* b = (FakeGBitmap*)malloc(sizeof(FakeGBitmap));
  b->bounds.origin.x = 0;
  b->bounds.origin.y = 0;
  b->bounds.size.w = 0;
  b->bounds.size.h = 0;
  b->format = 1;
  b->bytes_per_row = 0;
  b->data = data;
  b->palette = NULL;
  b->free_palette_on_destroy = 0;
  return b;
}

void* gbitmap_create_from_png_data(uint8_t* png_data, size_t png_data_size) {
  // Not implementing PNG decoding. Return a small empty bitmap.
  (void)png_data;
  (void)png_data_size;
  return gbitmap_create_with_resource(0);
}

void* gbitmap_create_as_sub_bitmap(void* base_bitmap, GRect sub_rect) {
  if (base_bitmap == NULL) return NULL;
  FakeGBitmap* base = (FakeGBitmap*)base_bitmap;
  FakeGBitmap* b = (FakeGBitmap*)malloc(sizeof(FakeGBitmap));
  // Share the same data pointer; do NOT allocate new pixel memory.
  b->bounds = sub_rect;
  b->format = base->format;
  b->bytes_per_row = base->bytes_per_row;
  b->data = base->data; // shared
  b->palette = base->palette;
  b->free_palette_on_destroy = 0;
  return b;
}

void* gbitmap_create_blank(GSize size, int format) {
  FakeGBitmap* b = (FakeGBitmap*)malloc(sizeof(FakeGBitmap));
  b->bounds.origin.x = 0;
  b->bounds.origin.y = 0;
  b->bounds.size = size;
  b->format = format;
  b->bytes_per_row = compute_bpr(format, size.w);
  b->data = (uint8_t*)malloc(b->bytes_per_row * size.h);
  memset(b->data, 0, b->bytes_per_row * size.h);
  b->palette = NULL;
  b->free_palette_on_destroy = 0;
  return b;
}

void* gbitmap_create_blank_with_palette(GSize size, int format, GColor* palette, int free_on_destroy) {
  FakeGBitmap* b = (FakeGBitmap*)malloc(sizeof(FakeGBitmap));
  b->bounds.origin.x = 0;
  b->bounds.origin.y = 0;
  b->bounds.size = size;
  b->format = format;
  b->bytes_per_row = compute_bpr(format, size.w);
  b->data = (uint8_t*)malloc(b->bytes_per_row * size.h);
  memset(b->data, 0, b->bytes_per_row * size.h);
  b->palette = palette;
  b->free_palette_on_destroy = free_on_destroy;
  return b;
}

GRect gbitmap_get_bounds(void* bitmap) {
  GRect r = {{0,0},{0,0}};
  if (bitmap == NULL) return r;
  FakeGBitmap* b = (FakeGBitmap*)bitmap;
  return b->bounds;
}

int gbitmap_get_format(void* bitmap) {
  if (bitmap == NULL) return 1;
  FakeGBitmap* b = (FakeGBitmap*)bitmap;
  return b->format;
}

uint16_t gbitmap_get_bytes_per_row(void* bitmap) {
  if (bitmap == NULL) return 0;
  FakeGBitmap* b = (FakeGBitmap*)bitmap;
  return b->bytes_per_row;
}

GColor* gbitmap_get_palette(void* bitmap) {
  if (bitmap == NULL) return NULL;
  FakeGBitmap* b = (FakeGBitmap*)bitmap;
  return b->palette;
}

void gbitmap_set_palette(void* bitmap, GColor* palette, int free_on_destroy) {
  if (bitmap == NULL) return;
  FakeGBitmap* b = (FakeGBitmap*)bitmap;
  b->palette = palette;
  b->free_palette_on_destroy = free_on_destroy;
}

uint8_t* gbitmap_get_data(void* bitmap) {
  if (bitmap == NULL) return NULL;
  FakeGBitmap* b = (FakeGBitmap*)bitmap;
  return b->data;
}

void gbitmap_set_data(void* bitmap, uint8_t* data, int format, uint16_t row_size_bytes, int free_on_destroy) {
  if (bitmap == NULL) return;
  FakeGBitmap* b = (FakeGBitmap*)bitmap;
  // If the previous data was allocated by the stub, free it.
  if (b->data) free(b->data);
  b->data = data;
  b->format = format;
  b->bytes_per_row = row_size_bytes;
  (void)free_on_destroy; // not tracked for now
}

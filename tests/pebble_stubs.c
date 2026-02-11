// Minimal stubs for Pebble SDK functions used by managed wrappers
// These are only for host-side smoke tests and do nothing.

#include <stddef.h>

void gdraw_command_image_destroy(void* img) { (void)img; }
void gdraw_command_sequence_destroy(void* seq) { (void)seq; }
void graphics_text_attributes_destroy(void* ta) { (void)ta; }

/**
 * Empty stub implementations for pebble.h functions
 * Allows host-side unit tests to link successfully
 * These functions are never actually called - the tests only verify
 * the pure Nim logic in macros.nim (geometry constructors, etc.)
 */

#include "pebble.h"
#include <stdlib.h>
#include <string.h>

// Window stubs
Window* window_create(void) { return NULL; }
void window_destroy(Window *window) {}
Layer* window_get_root_layer(const Window *window) { return NULL; }
void window_set_window_handlers(Window *window, WindowHandlers handlers) {}
void window_set_click_config_provider(Window *window, ClickConfigProvider provider) {}
void window_set_background_color(Window *window, GColor color) {}
void window_stack_push(Window *window, bool animated) {}
Window* window_stack_pop(bool animated) { return NULL; }
bool window_stack_remove(Window *window, bool animated) { return false; }

// Layer stubs
Layer* layer_create(GRect frame) { return NULL; }
void layer_destroy(Layer *layer) {}
GRect layer_get_bounds(const Layer *layer) { GRect r = {{0, 0}, {144, 168}}; return r; }
GRect layer_get_frame(const Layer *layer) { GRect r = {{0, 0}, {144, 168}}; return r; }
void layer_set_frame(Layer *layer, GRect frame) {}
void layer_add_child(Layer *parent, Layer *child) {}
void layer_remove_from_parent(Layer *layer) {}
void layer_set_hidden(Layer *layer, bool hidden) {}
void layer_set_update_proc(Layer *layer, LayerUpdateProc proc) {}
GRect layer_get_unobstructed_bounds(Layer *layer) { GRect r = {{0, 0}, {144, 168}}; return r; }

// TextLayer stubs
TextLayer* text_layer_create(GRect frame) { return NULL; }
void text_layer_destroy(TextLayer *text_layer) {}
Layer* text_layer_get_layer(const TextLayer *text_layer) { return NULL; }
void text_layer_set_text(TextLayer *text_layer, const char *text) {}
const char* text_layer_get_text(const TextLayer *text_layer) { return ""; }
void text_layer_set_text_alignment(TextLayer *text_layer, GTextAlignment alignment) {}
void text_layer_set_font(TextLayer *text_layer, GFont *font) {}
void text_layer_set_background_color(TextLayer *text_layer, GColor color) {}
void text_layer_set_text_color(TextLayer *text_layer, GColor color) {}

// BitmapLayer stubs
BitmapLayer* bitmap_layer_create(GRect frame) { return NULL; }
void bitmap_layer_destroy(BitmapLayer *bitmap_layer) {}
Layer* bitmap_layer_get_layer(const BitmapLayer *bitmap_layer) { return NULL; }
void bitmap_layer_set_bitmap(BitmapLayer *bitmap_layer, const GBitmap *bitmap) {}
void bitmap_layer_set_alignment(BitmapLayer *bitmap_layer, GAlign alignment) {}
void bitmap_layer_set_background_color(BitmapLayer *bitmap_layer, GColor color) {}

// ActionBarLayer stubs
ActionBarLayer* action_bar_layer_create(void) { return NULL; }
void action_bar_layer_destroy(ActionBarLayer *action_bar) {}
void action_bar_layer_add_to_window(ActionBarLayer *action_bar, Window *window) {}
void action_bar_layer_set_click_config_provider(ActionBarLayer *action_bar, ClickConfigProvider provider) {}

// Click subscription stubs
void window_single_click_subscribe(ButtonId button_id, ClickHandler handler) {}
void window_multi_click_subscribe(ButtonId button_id, uint8_t min_clicks, uint8_t max_clicks,
                                   uint16_t timeout, bool last_click_only, ClickHandler handler) {}
void window_long_click_subscribe(ButtonId button_id, uint16_t delay_ms, ClickHandler down_handler,
                                  ClickHandler up_handler) {}

// Font stubs
GFont* fonts_get_system_font(const char *font_key) { return NULL; }

// Graphics stubs
void graphics_draw_text(void *ctx, const char *text, GFont *font, GRect box,
                        uint8_t overflow_mode, GTextAlignment alignment, void *text_attributes) {}

// App lifecycle stubs
void app_event_loop(void) {}
void app_log(uint8_t log_level, const char *src_filename, int src_line_number, const char *fmt, ...) {}

// Tick timer stubs
void tick_timer_service_subscribe(TimeUnits tick_units, TickHandler handler) {}
void tick_timer_service_unsubscribe(void) {}

// Timer stubs
AppTimer* app_timer_register(uint32_t timeout_ms, AppTimerCallback callback, void *callback_data) { return NULL; }
void app_timer_cancel(AppTimer *timer_handle) {}
bool app_timer_reschedule(AppTimer *timer_handle, uint32_t new_timeout_ms) { return false; }

// Animation stubs
Animation* animation_clone(Animation *from) { return NULL; }
bool property_animation_from(PropertyAnimation *property_animation, void *value, size_t value_size, bool setter) { return false; }
bool property_animation_to(PropertyAnimation *property_animation, void *value, size_t value_size, bool setter) { return false; }
bool property_animation_subject(PropertyAnimation *property_animation, void **subject, bool setter) { return false; }

// Resource stubs
GBitmap* gbitmap_create_with_resource(ResHandle res_handle) { return NULL; }
void gbitmap_destroy(GBitmap *bitmap) {}

/**
 * Minimal mock pebble.h for host-side unit tests
 * Provides type definitions and function declarations so macros.nim compiles natively
 * Does NOT provide full SDK functionality - just enough for test_macros.nim to link
 */

#ifndef PEBBLE_H_MOCK
#define PEBBLE_H_MOCK

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include <time.h>

#ifdef __cplusplus
extern "C" {
#endif

// ============================================================================
// Geometry types
// ============================================================================

typedef struct GPoint {
  int16_t x;
  int16_t y;
} GPoint;

typedef struct GSize {
  int16_t w;
  int16_t h;
} GSize;

typedef struct GRect {
  GPoint origin;
  GSize size;
} GRect;

typedef struct GEdgeInsets {
  int16_t top;
  int16_t right;
  int16_t bottom;
  int16_t left;
} GEdgeInsets;

// ============================================================================
// Color types
// ============================================================================

typedef uint8_t GColor;
typedef uint8_t GColor8;

#define GColorBlack ((GColor8)0b11000000)
#define GColorWhite ((GColor8)0b11111111)
#define GColorClear ((GColor8)0b00000000)

// ============================================================================
// UUID type
// ============================================================================

typedef struct Uuid {
  uint8_t byte0;
  uint8_t byte1;
  uint8_t byte2;
  uint8_t byte3;
  uint8_t byte4;
  uint8_t byte5;
  uint8_t byte6;
  uint8_t byte7;
  uint8_t byte8;
  uint8_t byte9;
  uint8_t byte10;
  uint8_t byte11;
  uint8_t byte12;
  uint8_t byte13;
  uint8_t byte14;
  uint8_t byte15;
} Uuid;

// ============================================================================
// Menu types
// ============================================================================

typedef struct MenuIndex {
  uint16_t section;
  uint16_t row;
} MenuIndex;

// ============================================================================
// Text alignment enums
// ============================================================================

typedef enum GTextAlignment {
  GTextAlignmentLeft,
  GTextAlignmentCenter,
  GTextAlignmentRight
} GTextAlignment;

typedef enum GAlign {
  GAlignCenter,
  GAlignTop,
  GAlignTopLeft,
  GAlignTopRight,
  GAlignLeft,
  GAlignBottom,
  GAlignBottomLeft,
  GAlignBottomRight,
  GAlignRight
} GAlign;

// ============================================================================
// Button IDs
// ============================================================================

typedef enum ButtonId {
  BUTTON_ID_BACK = 0,
  BUTTON_ID_UP = 1,
  BUTTON_ID_SELECT = 2,
  BUTTON_ID_DOWN = 3,
  NUM_BUTTONS = 4
} ButtonId;

// ============================================================================
// Time units
// ============================================================================

typedef enum TimeUnits {
  SECOND_UNIT = 1,
  MINUTE_UNIT = 2,
  HOUR_UNIT = 4,
  DAY_UNIT = 8,
  MONTH_UNIT = 16,
  YEAR_UNIT = 32
} TimeUnits;

// ============================================================================
// Tuple types for AppMessage
// ============================================================================

typedef enum TupleType {
  TUPLE_BYTE_ARRAY = 0,
  TUPLE_CSTRING = 1,
  TUPLE_UINT = 2,
  TUPLE_INT = 3
} TupleType;

typedef struct Tuplet {
  TupleType type_f;  // 'type' is a reserved word in Nim
  uint32_t key;
  union {
    struct {
      uint8_t *data;
      uint16_t length;
    } bytes;
    struct {
      const char *data;
      uint16_t length;
    } cstring;
    struct {
      uint32_t storage;
      uint16_t width;
    } integer;
  } anon0;
} Tuplet;

// ============================================================================
// Opaque UI types (incomplete structs)
// ============================================================================

typedef struct Window Window;
typedef struct Layer Layer;
typedef struct TextLayer TextLayer;
typedef struct BitmapLayer BitmapLayer;
typedef struct ActionBarLayer ActionBarLayer;
typedef struct MenuLayer MenuLayer;
typedef struct ScrollLayer ScrollLayer;
typedef struct StatusBarLayer StatusBarLayer;
typedef struct GBitmap GBitmap;
typedef struct GFont GFont;
typedef struct Animation Animation;
typedef struct PropertyAnimation PropertyAnimation;
typedef struct AppTimer AppTimer;

// ============================================================================
// Callback types
// ============================================================================

typedef void* ClickRecognizerRef;
typedef void (*ClickHandler)(ClickRecognizerRef recognizer, void *context);
typedef void (*ClickConfigProvider)(void *context);
typedef void (*WindowHandler)(Window *window);
typedef void (*LayerUpdateProc)(Layer *layer, void *ctx);
typedef void (*TickHandler)(struct tm *tick_time, TimeUnits units_changed);
typedef void (*AnimationStartedHandler)(Animation *animation, void *context);
typedef void (*AnimationStoppedHandler)(Animation *animation, bool finished, void *context);
typedef void (*AppTimerCallback)(void *data);

// ============================================================================
// Window handlers struct
// ============================================================================

typedef struct WindowHandlers {
  WindowHandler load;
  WindowHandler unload;
  WindowHandler appear;
  WindowHandler disappear;
} WindowHandlers;

// ============================================================================
// Font key constants
// ============================================================================

#define FONT_KEY_GOTHIC_14 "GOTHIC_14"
#define FONT_KEY_GOTHIC_14_BOLD "GOTHIC_14_BOLD"
#define FONT_KEY_GOTHIC_18 "GOTHIC_18"
#define FONT_KEY_GOTHIC_18_BOLD "GOTHIC_18_BOLD"
#define FONT_KEY_GOTHIC_24 "GOTHIC_24"
#define FONT_KEY_GOTHIC_24_BOLD "GOTHIC_24_BOLD"
#define FONT_KEY_GOTHIC_28 "GOTHIC_28"
#define FONT_KEY_GOTHIC_28_BOLD "GOTHIC_28_BOLD"
#define FONT_KEY_BITHAM_30_BLACK "BITHAM_30_BLACK"
#define FONT_KEY_BITHAM_42_BOLD "BITHAM_42_BOLD"
#define FONT_KEY_BITHAM_42_LIGHT "BITHAM_42_LIGHT"
#define FONT_KEY_BITHAM_42_MEDIUM_NUMBERS "BITHAM_42_MEDIUM_NUMBERS"
#define FONT_KEY_BITHAM_34_MEDIUM_NUMBERS "BITHAM_34_MEDIUM_NUMBERS"
#define FONT_KEY_BITHAM_34_LIGHT_SUBSET "BITHAM_34_LIGHT_SUBSET"
#define FONT_KEY_BITHAM_18_LIGHT_SUBSET "BITHAM_18_LIGHT_SUBSET"
#define FONT_KEY_ROBOTO_CONDENSED_21 "ROBOTO_CONDENSED_21"
#define FONT_KEY_ROBOTO_BOLD_SUBSET_49 "ROBOTO_BOLD_SUBSET_49"
#define FONT_KEY_DROID_SERIF_28_BOLD "DROID_SERIF_28_BOLD"
#define FONT_KEY_LECO_20_BOLD_NUMBERS "LECO_20_BOLD_NUMBERS"
#define FONT_KEY_LECO_26_BOLD_NUMBERS_AM_PM "LECO_26_BOLD_NUMBERS_AM_PM"
#define FONT_KEY_LECO_32_BOLD_NUMBERS "LECO_32_BOLD_NUMBERS"
#define FONT_KEY_LECO_36_BOLD_NUMBERS "LECO_36_BOLD_NUMBERS"
#define FONT_KEY_LECO_38_BOLD_NUMBERS "LECO_38_BOLD_NUMBERS"
#define FONT_KEY_LECO_42_NUMBERS "LECO_42_NUMBERS"
#define FONT_KEY_LECO_28_LIGHT_NUMBERS "LECO_28_LIGHT_NUMBERS"

// ============================================================================
// Trig constants
// ============================================================================

#define TRIG_MAX_ANGLE 0x10000
#define TRIG_MAX_RATIO 0xffff

// ============================================================================
// Resource ID type
// ============================================================================

typedef uint32_t ResHandle;

// ============================================================================
// Stub function declarations (implementations in pebble_stubs.c)
// ============================================================================

// Window
Window* window_create(void);
void window_destroy(Window *window);
Layer* window_get_root_layer(const Window *window);
void window_set_window_handlers(Window *window, WindowHandlers handlers);
void window_set_click_config_provider(Window *window, ClickConfigProvider provider);
void window_set_background_color(Window *window, GColor color);
void window_stack_push(Window *window, bool animated);
Window* window_stack_pop(bool animated);
bool window_stack_remove(Window *window, bool animated);

// Layer
Layer* layer_create(GRect frame);
void layer_destroy(Layer *layer);
GRect layer_get_bounds(const Layer *layer);
GRect layer_get_frame(const Layer *layer);
void layer_set_frame(Layer *layer, GRect frame);
void layer_add_child(Layer *parent, Layer *child);
void layer_remove_from_parent(Layer *layer);
void layer_set_hidden(Layer *layer, bool hidden);
void layer_set_update_proc(Layer *layer, LayerUpdateProc proc);
GRect layer_get_unobstructed_bounds(Layer *layer);

// TextLayer
TextLayer* text_layer_create(GRect frame);
void text_layer_destroy(TextLayer *text_layer);
Layer* text_layer_get_layer(const TextLayer *text_layer);
void text_layer_set_text(TextLayer *text_layer, const char *text);
const char* text_layer_get_text(const TextLayer *text_layer);
void text_layer_set_text_alignment(TextLayer *text_layer, GTextAlignment alignment);
void text_layer_set_font(TextLayer *text_layer, GFont *font);
void text_layer_set_background_color(TextLayer *text_layer, GColor color);
void text_layer_set_text_color(TextLayer *text_layer, GColor color);

// BitmapLayer
BitmapLayer* bitmap_layer_create(GRect frame);
void bitmap_layer_destroy(BitmapLayer *bitmap_layer);
Layer* bitmap_layer_get_layer(const BitmapLayer *bitmap_layer);
void bitmap_layer_set_bitmap(BitmapLayer *bitmap_layer, const GBitmap *bitmap);
void bitmap_layer_set_alignment(BitmapLayer *bitmap_layer, GAlign alignment);
void bitmap_layer_set_background_color(BitmapLayer *bitmap_layer, GColor color);

// ActionBarLayer
ActionBarLayer* action_bar_layer_create(void);
void action_bar_layer_destroy(ActionBarLayer *action_bar);
void action_bar_layer_add_to_window(ActionBarLayer *action_bar, Window *window);
void action_bar_layer_set_click_config_provider(ActionBarLayer *action_bar, ClickConfigProvider provider);

// Click subscriptions
void window_single_click_subscribe(ButtonId button_id, ClickHandler handler);
void window_multi_click_subscribe(ButtonId button_id, uint8_t min_clicks, uint8_t max_clicks,
                                   uint16_t timeout, bool last_click_only, ClickHandler handler);
void window_long_click_subscribe(ButtonId button_id, uint16_t delay_ms, ClickHandler down_handler,
                                  ClickHandler up_handler);

// Fonts
GFont* fonts_get_system_font(const char *font_key);

// Graphics
void graphics_draw_text(void *ctx, const char *text, GFont *font, GRect box,
                        uint8_t overflow_mode, GTextAlignment alignment, void *text_attributes);

// App lifecycle
void app_event_loop(void);
void app_log(uint8_t log_level, const char *src_filename, int src_line_number, const char *fmt, ...);

// Tick timer
void tick_timer_service_subscribe(TimeUnits tick_units, TickHandler handler);
void tick_timer_service_unsubscribe(void);

// Timer
AppTimer* app_timer_register(uint32_t timeout_ms, AppTimerCallback callback, void *callback_data);
void app_timer_cancel(AppTimer *timer_handle);
bool app_timer_reschedule(AppTimer *timer_handle, uint32_t new_timeout_ms);

// Animation
Animation* animation_clone(Animation *from);
bool property_animation_from(PropertyAnimation *property_animation, void *value, size_t value_size, bool setter);
bool property_animation_to(PropertyAnimation *property_animation, void *value, size_t value_size, bool setter);
bool property_animation_subject(PropertyAnimation *property_animation, void **subject, bool setter);

// Resources
GBitmap* gbitmap_create_with_resource(ResHandle res_handle);
void gbitmap_destroy(GBitmap *bitmap);

#ifdef __cplusplus
}
#endif

#endif  // PEBBLE_H_MOCK

# Getting Started with Nebble

Nebble is a Nim wrapper library for Pebble smartwatch development. This guide will walk you through installation, creating your first app, and understanding the API structure.

## Prerequisites

### Required Software

1. **Nim compiler** (>= 2.2.0)
   ```bash
   # macOS (Homebrew)
   brew install nim
   
   # Linux
   curl https://nim-lang.org/choosenim/init.sh -sSf | sh
   
   # Verify installation
   nim --version
   ```

2. **Pebble SDK** (v4.x)
   ```bash
   # Install dependencies (macOS)
   brew install python@2 pipenv
   
   # Install Pebble SDK
   cd ~
   git clone https://github.com/pebble/pebble-tool.git
   cd pebble-tool
   pipenv install
   pipenv shell
   pebble sdk install latest
   
   # Verify installation
   pebble --version
   ```

3. **Pebble Emulator**
   
   Download from: https://github.com/pebble/pebble-tool/releases
   
   Or use hardware device connected via USB.

### Optional Tools

- **libclang** - Only needed if regenerating FFI bindings (not required for normal use)
- **Futhark** (>= 0.15.0) - Only needed if regenerating FFI bindings

## Installation

### Option 1: Using Nimble (Recommended)

```bash
nimble install nebble
```

### Option 2: From Source

```bash
git clone https://github.com/zawa-t/nebble.git
cd nebble
nimble install
```

### Verify Installation

```bash
# Check that nebble CLI is available
nebble --version

# Run tests
cd nebble
nimble test
```

## Your First App: Hello World

### Step 1: Create a New Project

```bash
# Create a new project called "my_first_app"
nebble new my_first_app
cd my_first_app
```

This generates:
```
my_first_app/
├── nebble.json         # Nebble project metadata
├── appinfo.json        # Pebble app metadata (name, UUID, resources)
├── nim.cfg             # Cross-compilation flags
├── wscript             # Waf build configuration
└── src/
    └── my_first_app.nim  # Your Nim source code
```

### Step 2: Write Your App Code

Open `src/my_first_app.nim` and replace with:

```nim
import nebble/ffi as ffi
from nebble/app import eventLoop
from nebble/window import nil

# Global state
var
  window: ptr ffi.Window
  textLayer: ptr ffi.TextLayer

# Window load callback
proc windowLoad(win: ptr ffi.Window) {.cdecl.} =
  let bounds = ffi.layer_get_bounds(ffi.window_get_root_layer(win))
  
  # Create text layer
  textLayer = ffi.text_layer_create(bounds)
  ffi.text_layer_set_text(textLayer, "Hello, Pebble!")
  ffi.text_layer_set_text_alignment(textLayer, ffi.GTextAlignmentCenter)
  
  # Add to window
  ffi.layer_add_child(
    ffi.window_get_root_layer(win),
    ffi.text_layer_get_layer(textLayer)
  )

# Window unload callback
proc windowUnload(win: ptr ffi.Window) {.cdecl.} =
  ffi.text_layer_destroy(textLayer)

# App initialization
proc init() {.cdecl.} =
  # Create window
  window = ffi.window_create()
  
  # Set window handlers
  ffi.window_set_window_handlers(window, ffi.WindowHandlers(
    load: windowLoad,
    unload: windowUnload
  ))
  
  # Push window to stack
  ffi.window_stack_push(window, true)

# App deinitialization
proc deinit() {.cdecl.} =
  ffi.window_destroy(window)

# Entry point
proc main() {.exportc, cdecl.} =
  init()
  eventLoop()
  deinit()
```

### Step 3: Build the App

```bash
nebble build
```

This:
1. Compiles Nim code to C (`nim c --compileOnly`)
2. Copies generated C files into Pebble project structure
3. Runs `pebble build` to create `.pbw` bundle

Output: `build/my_first_app.pbw`

### Step 4: Install and Run

#### On Emulator:

```bash
# Start emulator (in separate terminal)
pebble install --emulator basalt

# Or use nebble CLI
nebble install --emulator basalt
```

#### On Hardware Device:

```bash
# Connect Pebble via USB, enable developer mode
pebble install --phone <PHONE_IP>

# Or
nebble install --phone <PHONE_IP>
```

### Step 5: Test Your App

You should see "Hello, Pebble!" displayed in the center of the watch screen.

## Understanding the API Structure

Nebble has a **two-layer architecture**:

### Layer 1: Low-Level FFI Bindings (`nebble/ffi`)

- **Purpose:** Direct 1:1 mapping of Pebble C SDK
- **Naming:** Preserves C `snake_case` exactly
- **Usage:** `import nebble/ffi as ffi`
- **Examples:**
  - `ffi.window_create()` → C `window_create()`
  - `ffi.text_layer_set_text()` → C `text_layer_set_text()`
  - `ffi.GRect` → C `GRect`

**When to use:**
- Maximum control over Pebble SDK
- Performance-critical code
- Following C SDK examples directly

### Layer 2: High-Level Idiomatic API (`nebble/*`)

- **Purpose:** Nim-friendly wrappers with object-oriented patterns
- **Naming:** `camelCase` with type-safe wrappers
- **Usage:** `import nebble/window`, `import nebble/layer`
- **Examples:**
  - `newWindow()` → wraps `window_create()`
  - `layer.addChild()` → wraps `layer_add_child()`
  - Constructor templates like `makeGRect(x, y, w, h)`

**When to use:**
- More idiomatic Nim code
- Type safety and convenience
- Reduced boilerplate

**Note:** Currently, the high-level API is under development. Most examples use the FFI layer directly.

### Mixing Both Layers

You can mix both layers in the same file:

```nim
import nebble/ffi as ffi
from nebble/geometry import makeGRect, makeGPoint

# High-level constructor
let frame = makeGRect(0, 0, 144, 168)

# Low-level function call
let layer = ffi.text_layer_create(frame)
```

**Important:** Avoid ambiguous calls. If both layers export the same symbol, use explicit module prefix or import with alias.

## Common Patterns

### Pattern 1: Window Lifecycle

```nim
var window: ptr ffi.Window

proc windowLoad(win: ptr ffi.Window) {.cdecl.} =
  # Create and configure UI elements
  discard

proc windowUnload(win: ptr ffi.Window) {.cdecl.} =
  # Destroy UI elements
  discard

proc init() {.cdecl.} =
  window = ffi.window_create()
  ffi.window_set_window_handlers(window, ffi.WindowHandlers(
    load: windowLoad,
    unload: windowUnload
  ))
  ffi.window_stack_push(window, true)

proc deinit() {.cdecl.} =
  ffi.window_destroy(window)
```

**Key points:**
- All callbacks MUST have `{.cdecl.}` pragma
- Create UI in `windowLoad`, destroy in `windowUnload`
- Window is pushed to stack in `init`, destroyed in `deinit`

### Pattern 2: Text Layers with Dynamic Content

```nim
var
  textLayer: ptr ffi.TextLayer
  textBuffer: array[32, char]  # Module-scope buffer required!

proc updateText(value: int) =
  let text = "Count: " & $value
  
  # Copy to static buffer (TextLayer doesn't copy strings)
  for i in 0..<min(text.len, 31):
    textBuffer[i] = text[i]
  textBuffer[min(text.len, 31)] = '\0'
  
  ffi.text_layer_set_text(textLayer, cast[cstring](addr textBuffer[0]))
```

**Key points:**
- TextLayer does NOT copy strings, it stores the pointer
- Use module-scope `array[N, char]` buffer, not local variables
- Manually copy string contents and null-terminate

### Pattern 3: Click Handlers

```nim
proc selectClick(recognizer: ffi.ClickRecognizerRef; context: pointer) {.cdecl.} =
  # Handle SELECT button click
  discard

proc clickConfigProvider(context: pointer) {.cdecl.} =
  ffi.window_single_click_subscribe(ffi.BUTTON_ID_SELECT, selectClick)

proc init() {.cdecl.} =
  window = ffi.window_create()
  ffi.window_set_click_config_provider(window, clickConfigProvider)
  ffi.window_stack_push(window, true)
```

**Key points:**
- Click handlers must be `{.cdecl.}` procs
- Register handlers in `clickConfigProvider` callback
- Set provider with `window_set_click_config_provider`

### Pattern 4: Animations

```nim
var propAnim: ptr ffi.PropertyAnimation

proc animateMoveLayer(layer: ptr ffi.Layer) =
  let
    fromFrame = ffi.layer_get_frame(layer)
    toFrame = ffi.GRect(x: 50, y: 50, w: fromFrame.size.w, h: fromFrame.size.h)
  
  # Create property animation
  propAnim = ffi.property_animation_create_layer_frame(layer, nil, unsafeAddr toFrame)
  
  # Get Animation pointer
  let anim = ffi.property_animation_get_animation(propAnim)
  
  # Configure animation
  discard ffi.animation_set_duration(anim, 500)  # 500ms
  discard ffi.animation_set_curve(anim, ffi.AnimationCurveEaseInOut)
  
  # Start animation
  discard ffi.animation_schedule(anim)

proc cleanup() =
  if propAnim != nil:
    ffi.property_animation_destroy(propAnim)
```

**Key points:**
- Use `property_animation_create_layer_frame` for frame animations
- Get `ptr Animation` via `property_animation_get_animation()`
- Schedule with `animation_schedule()`, destroy when done

### Pattern 5: Services (Battery, Time, etc.)

```nim
import nebble/ffi as ffi

proc batteryHandler(charge: ffi.BatteryChargeState) {.cdecl.} =
  # charge.charge_percent is 0-100
  echo "Battery: ", charge.charge_percent, "%"

proc init() {.cdecl.} =
  # Subscribe to battery updates
  ffi.battery_state_service_subscribe(batteryHandler)
  
  # Get initial state
  let state = ffi.battery_state_service_peek()
  batteryHandler(state)

proc deinit() {.cdecl.} =
  ffi.battery_state_service_unsubscribe()
```

**Key points:**
- Subscribe to service in `init`, unsubscribe in `deinit`
- Use `_peek()` to get current state immediately
- Handler receives state struct as parameter

### Pattern 6: Persistent Storage

```nim
import nebble/ffi as ffi

const KEY_COUNT = 1  # Storage key

proc saveCount(count: int32) =
  discard ffi.persist_write_int(KEY_COUNT, count)

proc loadCount(): int32 =
  if ffi.persist_exists(KEY_COUNT):
    return ffi.persist_read_int(KEY_COUNT)
  else:
    return 0  # Default value

proc init() {.cdecl.} =
  var count = loadCount()
  # Use count...
  
  count += 1
  saveCount(count)
```

**Key points:**
- Always check `persist_exists()` before reading
- Use type-specific functions: `persist_write_int`, `persist_write_bool`, `persist_write_data`
- Keys are integers (typically use const for readability)

## Platform-Specific Features

Pebble has 6 hardware platforms with different capabilities:

| Feature     | aplite | basalt | chalk | diorite | emery | flint |
|-------------|--------|--------|-------|---------|-------|-------|
| Color       | No     | Yes    | Yes   | No      | Yes   | No    |
| Round       | No     | No     | Yes   | No      | No    | No    |
| Health      | Stub   | Yes    | Yes   | Yes     | Yes   | Yes   |
| Microphone  | No     | Yes    | Yes   | Yes     | Yes   | Yes   |
| Display     | 144×168| 144×168| 180×180| 144×168| 200×228| 144×168|

### Compile-Time Platform Checks

Use `when declared()` to check if a type/function exists:

```nim
# Color support
when declared(GColorClear):
  ffi.text_layer_set_background_color(layer, ffi.GColorClear)
else:
  ffi.text_layer_set_background_color(layer, ffi.GColorWhite)

# Health service
when declared(ffi.health_service_sum_today) and declared(ffi.HealthMetricStepCount):
  let steps = ffi.health_service_sum_today(ffi.HealthMetricStepCount)
else:
  let steps = 0  # Not available on Aplite
```

### Build Flags

Target specific platforms with `-d:pebble<Platform>`:

```bash
nebble build -d:pebbleAplite   # Build for Aplite (b&w, rectangular)
nebble build -d:pebbleBasalt   # Build for Basalt (color, rectangular) [default]
nebble build -d:pebbleChalk    # Build for Chalk (color, round)
```

## Project Configuration

### nebble.json

```json
{
  "name": "my_first_app",
  "version": "1.0.0",
  "author": "Your Name",
  "description": "My first Pebble app in Nim",
  "main": "src/my_first_app.nim"
}
```

### appinfo.json

```json
{
  "uuid": "12345678-1234-1234-1234-123456789012",
  "shortName": "MyApp",
  "longName": "My First App",
  "companyName": "Your Company",
  "versionLabel": "1.0.0",
  "sdkVersion": "3",
  "targetPlatforms": ["aplite", "basalt", "chalk", "diorite", "emery"],
  "watchapp": {
    "watchface": false
  },
  "resources": {
    "media": []
  }
}
```

**Key fields:**
- `uuid` - Unique identifier (generate with `uuidgen`)
- `shortName` - App name shown on watch
- `watchface` - Set to `true` for watchface apps
- `targetPlatforms` - List of supported platforms

### nim.cfg

Already configured by `nebble new`. Contains cross-compilation flags:

```nim
--os:any
--cpu:arm
--mm:arc
-d:useMalloc
--noMain
--compileOnly
-d:noSignalHandler
--threads:off
-d:danger
```

**Do not modify** unless you know what you're doing.

## Build Process Explained

When you run `nebble build`, the following happens:

1. **Nim Compilation** (`nim c --compileOnly`)
   - Compiles `.nim` files to C
   - Output: `nimcache/*.c` and `nimbase.h`

2. **File Organization**
   - Copies generated C files to `src/c/`
   - Preserves existing Pebble project structure

3. **Pebble Build** (`pebble build`)
   - Uses Waf build system
   - Compiles C code with ARM GCC
   - Links Pebble SDK libraries
   - Creates `.pbw` bundle in `build/`

4. **Output**
   - `build/<app_name>.pbw` - Installable Pebble app bundle

## Common Issues & Troubleshooting

### Issue 1: Emulator Crashes Persist After Code Fix

**Symptom:** App continues to crash even after fixing the code.

**Cause:** Emulator enters corrupted state after crashes.

**Solution:**
```bash
# Kill emulator completely
pkill -f pebble

# Rebuild and restart fresh emulator
nebble build && nebble clean
nebble install --emulator basalt
```

**Prevention:** Always kill and restart emulator after any crash.

### Issue 2: Ambiguous Function Call

**Error:** `Error: ambiguous call; multiple overloads match`

**Cause:** Both FFI and high-level API export the same symbol.

**Solution:** Import FFI with alias:
```nim
import nebble/ffi as ffi  # Use ffi.window_create()
```

### Issue 3: Text Disappears or Corrupts

**Symptom:** `text_layer_set_text()` shows garbage or empty string.

**Cause:** Passing pointer to local variable that goes out of scope.

**Solution:** Use module-scope buffer:
```nim
var textBuffer: array[32, char]  # Module scope, not local!

proc updateText(value: int) =
  let text = "Value: " & $value
  for i in 0..<min(text.len, 31):
    textBuffer[i] = text[i]
  textBuffer[min(text.len, 31)] = '\0'
  ffi.text_layer_set_text(layer, cast[cstring](addr textBuffer[0]))
```

### Issue 4: Callback Not Called

**Symptom:** Handler/callback never executes.

**Cause:** Missing `{.cdecl.}` pragma.

**Solution:** Add `{.cdecl.}` to ALL callbacks:
```nim
proc windowLoad(win: ptr ffi.Window) {.cdecl.} = ...
proc clickHandler(rec: ffi.ClickRecognizerRef; ctx: pointer) {.cdecl.} = ...
proc tickHandler(tm: ptr ffi.tm; units: ffi.TimeUnits) {.cdecl.} = ...
```

### Issue 5: Type Not Found (e.g., `GColorClear`)

**Symptom:** `Error: undeclared identifier: 'GColorClear'`

**Cause:** Type only exists on color platforms (not Aplite).

**Solution:** Guard with `when declared()`:
```nim
when declared(GColorClear):
  let color = ffi.GColorClear
else:
  let color = ffi.GColorWhite
```

### Issue 6: Build Fails with "undefined reference"

**Symptom:** Linker error during `pebble build`

**Cause:** Missing Pebble SDK function or incorrect `wscript` configuration.

**Solution:**
1. Ensure `wscript` includes `-w` flag:
   ```python
   ctx.env.CFLAGS = ['-w']  # Suppress warnings from Nim-generated C
   ```
2. Check that function exists in Pebble SDK version
3. Verify `nimbase.h` was copied to `src/c/`

## Next Steps

### Explore Example Apps

Nebble includes 10 example apps covering different features:

1. **hello_world** - Basic app structure, text layers, click handlers
2. **simple_clock** - Watchface with tick timer service
3. **menu_demo** - Menu layer with sections and callbacks
4. **animation_demo** - Property animations with different curves
5. **battery_status** - Battery service, status bar layer
6. **accelerometer_demo** - Accelerometer data, tap detection
7. **persist_demo** - Persistent storage (read/write)
8. **vibes_demo** - Vibration patterns (short, long, double)
9. **action_bar_demo** - Action bar with icon buttons
10. **health_demo** - Health service (steps, distance)

Run examples:
```bash
cd nebble/examples/hello_world
../../cli/bin/nebble build
../../cli/bin/nebble install --emulator basalt
```

### Read the Documentation

- **HTML API Docs:** `docs/html/nebble.html` (open in browser)
- **Migration Guide:** `MIGRATION.md` (C SDK → Nebble patterns)
- **Roadmap:** `ROADMAP.md` (project status and future plans)

### Join the Community

- **GitHub:** https://github.com/zawa-t/nebble
- **Issues:** https://github.com/zawa-t/nebble/issues
- **Discussions:** https://github.com/zawa-t/nebble/discussions

### Advanced Topics (Coming Soon)

- App messaging (phone ↔ watch communication)
- Custom fonts and images
- Advanced UI patterns (custom layers, graphics contexts)
- Performance optimization for Aplite (24 KB RAM)
- Watchface development patterns

## Additional Resources

### Pebble SDK Documentation

- **Official Docs:** https://developer.rebble.io/developer.pebble.com/docs/index.html
- **API Reference:** https://developer.rebble.io/developer.pebble.com/docs/c/index.html
- **Forums:** https://reddit.com/r/pebble

### Nim Language

- **Official Docs:** https://nim-lang.org/docs/manual.html
- **Tutorial:** https://nim-lang.org/docs/tut1.html
- **Forum:** https://forum.nim-lang.org

### Tools

- **Pebble Tool:** https://github.com/pebble/pebble-tool
- **Emulator:** https://github.com/pebble/pebble-tool/releases
- **Rebble Services:** https://rebble.io (for app store, voice, weather)

---

**Happy Pebble hacking with Nim!** 🎉

If you have questions or run into issues, please open an issue on GitHub.

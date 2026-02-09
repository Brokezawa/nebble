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
import nebble
import nebble/ffi # For constants

var textLayer: ptr TextLayer

# Window load handler
proc windowLoad(win: ptr Window) {.cdecl.} =
  let bounds = win.rootLayer.bounds
  
  # Create text layer
  textLayer = newTextLayer(makeGRect(0, 60, bounds.size.w, 40))
  textLayer.text = "Hello, Pebble!"
  textLayer.textAlignment = GTextAlignmentCenter
  
  # Add to window
  win.rootLayer.addChild(textLayer.getLayer())

# Window unload handler
proc windowUnload(win: ptr Window) {.cdecl.} =
  textLayer.destroy()

# Use the pebbleApp macro to generate main entry point and init/deinit logic
pebbleApp(
  load = windowLoad,
  unload = windowUnload
)
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
- **Usage:** `import nebble` (imports all high-level modules)
- **Examples:**
  - `newWindow()` → wraps `window_create()`
  - `layer.addChild()` → wraps `layer_add_child()`
  - `staticText` → template for safe string copying

**When to use:**
- More idiomatic Nim code
- Type safety and convenience
- Reduced boilerplate

### Mixing Both Layers

You can mix both layers in the same file:

```nim
import nebble
import nebble/ffi as ffi

# High-level constructor
let frame = makeGRect(0, 0, 144, 168)

# Low-level function call
let layer = ffi.text_layer_create(frame)
```

**Important:** Avoid ambiguous calls. If both layers export the same symbol, use explicit module prefix or import with alias.

## Common Patterns

### Pattern 1: Window Lifecycle

```nim
var window: ptr Window

proc windowLoad(win: ptr Window) {.cdecl.} =
  # Create and configure UI elements
  discard

proc windowUnload(win: ptr Window) {.cdecl.} =
  # Destroy UI elements
  discard

# Manual init (without pebbleApp macro):
proc init() =
  window = newWindow()
  window.setHandlers(load = windowLoad, unload = windowUnload)
  window.push(animated = true)

proc deinit() =
  window.destroy()
```

### Pattern 2: Text Layers with Dynamic Content

```nim
var
  textLayer: ptr TextLayer
  textBuffer: array[32, char]  # Module-scope buffer required!

proc updateText(value: int) =
  # Use staticText template to format and copy string safely
  textLayer.staticText(textBuffer, "Count: " & $value)
```

**Key points:**
- TextLayer does NOT copy strings, it stores the pointer
- Use module-scope `array[N, char]` buffer, not local variables
- `staticText` handles the copying and null-termination

### Pattern 3: Click Handlers

```nim
import nebble/ffi # For ButtonId

proc selectClick(rec: ClickRecognizerRef; ctx: pointer) {.cdecl.} =
  # Handle SELECT button click
  discard

proc clickConfig(ctx: pointer) {.cdecl.} =
  onClick(BUTTON_ID_SELECT, selectClick)

# In init or pebbleApp:
pebbleApp(
  # ... other handlers ...
  clickConfig = clickConfig
)
```

### Pattern 4: Animations

```nim
import nebble/ffi # For property_animation creation

var propAnim: ptr PropertyAnimation

proc animateMoveLayer(layer: ptr Layer) =
  let
    fromFrame = layer.frame
    toFrame = makeGRect(50, 50, fromFrame.size.w, fromFrame.size.h)
  
  # Create property animation (low-level)
  propAnim = ffi.property_animation_create_layer_frame(layer, nil, unsafeAddr toFrame)
  
  # Get Animation pointer (low-level)
  let anim = ffi.property_animation_get_animation(propAnim)
  
  # Configure animation (high-level)
  anim.duration = 500
  anim.curve = AnimationCurveEaseInOut
  
  # Start animation
  discard anim.schedule()

proc cleanup() =
  if propAnim != nil:
    ffi.property_animation_destroy(propAnim)
```

### Pattern 5: Services (Battery, Time, etc.)

```nim
proc batteryHandler(charge: BatteryChargeState) {.cdecl.} =
  echo "Battery: ", charge.charge_percent, "%"

proc init() =
  # Subscribe to battery updates
  battery.subscribe(batteryHandler)
  
  # Get initial state
  let state = battery.peek()
  batteryHandler(state)
```

### Pattern 6: Persistent Storage

```nim
const KEY_COUNT = 1  # Storage key

proc saveCount(count: int32) =
  discard storage.writeInt(KEY_COUNT, count)

proc loadCount(): int32 =
  if storage.exists(KEY_COUNT):
    return storage.readInt(KEY_COUNT)
  else:
    return 0  # Default value
```

## Platform-Specific Features

Pebble has 6 hardware platforms with different capabilities:

| Feature     | aplite | basalt | chalk | diorite | emery | flint |
|-------------|--------|--------|-------|---------|-------|-------|
| Color       | No     | Yes    | Yes   | No      | Yes   | No    |
| Round       | No     | No     | Yes   | No      | No    | No    |
| Health      | Stub   | Yes    | Yes   | Yes     | Yes   | Yes   |
| Microphone  | No     | Yes    | Yes   | Yes     | Yes   | Yes   |

### Compile-Time Platform Checks

Use `when declared()` to check if a type/function exists:

```nim
# Color support
when declared(GColorClear):
  textLayer.backgroundColor = GColorClear
else:
  textLayer.backgroundColor = GColorWhite

# Health service
when declared(health.sumToday) and declared(HealthMetricStepCount):
  let steps = health.sumToday(HealthMetricStepCount)
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

### nim.cfg

Already configured by `nebble new`. Contains cross-compilation flags. **Do not modify** unless you know what you're doing.

## Common Issues & Troubleshooting

### Issue 1: Emulator Crashes Persist After Code Fix

**Solution:** Kill emulator completely (`pkill -f pebble`), then clean rebuild and reinstall.

### Issue 2: Ambiguous Function Call

**Solution:** Import FFI with alias:
```nim
import nebble/ffi as ffi  # Use ffi.window_create()
```

### Issue 3: Text Disappears or Corrupts

**Solution:** Use module-scope buffer and `staticText` template.

### Issue 4: Callback Not Called

**Solution:** Add `{.cdecl.}` to ALL callbacks.

### Issue 5: Type Not Found (e.g., `GColorClear`)

**Solution:** Guard with `when declared()`.

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

---

**Happy Pebble hacking with Nim!** 🎉

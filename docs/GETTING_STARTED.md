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

Open `src/my_first_app.nim`. You'll see the modern **Declarative DSL** which eliminates almost all boilerplate:

```nim
import nebble

# Handlers
proc selectClickHandler(recognizer: ClickRecognizerRef; context: pointer) {.cdecl.} =
  vibes.shortPulse()

# Declarative UI and interaction
nebbleApp:
  textLayer:
    id = myLabel
    fullWidth = true
    y = center
    h = 40
    text = "Hello Nim!"
    alignment = GTextAlignmentCenter
    
  clicks:
    BUTTON_ID_SELECT = selectClickHandler
```

### Step 3: Build the App

```bash
nebble build
```

This:
1. Compiles Nim code to C (`nim c --compileOnly`)
2. CLI generates platform-specific `appinfo.json`
3. CLI copies generated C files into Pebble project structure
4. CLI runs `pebble build` to create `.pbw` bundles for all platforms

Output: `build/my_first_app_basalt.pbw`, etc.

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

You should see "Hello Nim!" displayed in the center of the watch screen. Press the SELECT button to feel a short pulse.

## Understanding the API Structure

Nebble has a **two-layer architecture**:

### Layer 1: Low-Level FFI Bindings (`nebble/ffi`)

- **Purpose:** Direct 1:1 mapping of Pebble C SDK
- **Naming:** Preserves C `snake_case` exactly
- **Usage:** `import nebble/ffi as ffi`

**When to use:**
- Maximum control over Pebble SDK
- Performance-critical code
- Following C SDK examples directly

### Layer 2: High-Level Idiomatic API (`nebble/*`)

- **Purpose:** Nim-friendly wrappers with object-oriented patterns and ARC memory management
- **Naming:** `camelCase` with type-safe wrappers (Managed Handles)
- **Usage:** `import nebble` (imports all high-level modules)

**When to use:**
- Most application logic
- Type safety and convenience
- Automatic memory management (no manual `.destroy()`)

## Common Patterns

### Pattern 1: Declarative UI (DSL)

The `nebbleWatchface` macro is the recommended way to build UIs. It handles window creation, layer management, and event subscription.

```nim
nebbleWatchface:
  window:
    backgroundColor = GColorBlack
  textLayer:
    id = myLabel
    frame = (0, 50, 144, 30)
    text = "Hello"
```

### Pattern 2: Managed Handles (Manual)

If you need more control, use Managed Handles (e.g., `TextLayerHandle`):

```nim
var label: TextLayerHandle
label = newTextLayer(makeGRect(0, 0, 144, 30))
label.text = "Managed"
# No destroy() needed!
```

### Pattern 3: Heap-Free Dynamic Text

```nim
var countStr: FixedString[32]
countStr.f("Count: ", value)
textLayer.text = countStr
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

Use `when declared()` or `defined()` to handle differences:

```nim
when defined(pebbleColor):
  textLayer.backgroundColor = GColorBlueMoon
else:
  textLayer.backgroundColor = GColorBlack
```

---

## Happy Pebble hacking with Nim! 🎉

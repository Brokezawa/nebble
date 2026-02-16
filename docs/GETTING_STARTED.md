# Getting Started with Nebble

Nebble is a Nim wrapper library for Pebble smartwatch development. This guide will walk you through installation, creating your first app, and understanding the API structure.

## Prerequisites

### 1. Nim Compiler (>= 2.2.0)

We strongly recommend installing Nim using **choosenim** to ensure you have the latest version and consistent environment for documentation generation.

- **Windows**: [Install Nim on Windows](https://nim-lang.org/install_windows.html)
- **macOS / Linux**:
  ```bash
  curl https://nim-lang.org/choosenim/init.sh -sSf | sh
  ```

After installation, verify with:
```bash
nim --version
```

### 2. Pebble SDK

To develop for Pebble, you need the Pebble SDK. Follow the instructions at **[RePebble SDK Installation Guide](https://developer.repebble.com/sdk/)** for your platform (Windows, macOS, or Linux).

Verify that the `pebble` command is in your PATH:
```bash
pebble --version
```

## Installation

### Option 1: Using Nimble (Recommended)

```bash
nimble install nebble
```

### Option 2: From Source

```bash
git clone https://github.com/Brokezawa/nebble.git
cd nebble
nimble install
```

### Build the CLI tool

Nebble includes a CLI tool to simplify the build process. To build and install it locally:

```bash
cd cli
nimble install_local
```

Verify the installation:
```bash
nebble version
```

## Your First App: Hello World

### Step 1: Create a New Project

```bash
# Create a new project called "my_first_app"
nebble new my_first_app
cd my_first_app
```

This generates the project structure:
```
my_first_app/
├── nebble.json         # Nebble project metadata
├── nim.cfg             # Cross-compilation flags
├── wscript             # Waf build configuration
└── src/
    ├── my_first_app.nim  # Your Nim watchapp source
    └── pkjs.nim          # Your Nim phone-side logic
```

*Note: `package.json` and phone-side JavaScript are generated automatically by Nebble during the build process.*

### Step 2: Write Your App Code

Open `src/my_first_app.nim`. Nebble provides a Declarative DSL to minimize boilerplate:

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

This command triggers the entire pipeline:
1. Nim compilation to C (for the watch).
2. Nim compilation to JS (for the phone component).
3. Generating the correct `package.json` metadata on the fly.
4. Invoking the Pebble build system.

### Step 4: Run in Emulator

Nebble provides aliases for common Pebble commands for consistency:

```bash
# Start emulator and install
nebble install --emulator basalt
```

*Note: `nebble install` is a wrapper around `pebble install`.*

## Cross-Platform Usage

Nebble works on Windows, macOS, and Linux. The CLI tool abstracts platform differences:

- **Windows**: Use PowerShell or Command Prompt. Ensure Python 2.7 and the ARM toolchain (provided by Pebble SDK) are correctly configured.
- **macOS/Linux**: Standard shell environments.

## API Structure

Nebble has a two-layer architecture:

1.  **Low-Level FFI (`nebble/ffi`)**: Direct 1:1 mapping of the C SDK.
2.  **High-Level API (`nebble`)**: Idiomatic Nim wrappers with ARC memory management (Handles).

Always prefer the High-Level API for application logic to benefit from automatic memory management and type safety.

### Full-Stack Development

Nebble is a **Full-Stack** framework. When you create a project, you get a `src/pkjs.nim` file. This is where you write your phone-side logic (Net requests, GPS, etc.) in Nim. It shares the same types and keys as your watch code. See the [Full-Stack Guide](NIM_PKJS.md) for details.

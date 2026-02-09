# Nebble CLI

Build tool for developing Pebble smartwatch apps in Nim.

## Installation

```bash
cd cli
nimble build
# Binary will be in cli/bin/nebble
# Or install globally:
cp bin/nebble ~/.nimble/bin/
```

## Quick Start

```bash
# Create a new Pebble app
nebble new my_app

# Create a watchface
nebble new my_clock --watchface

# Build the project
cd my_app
nebble build

# Install to emulator
nebble install --emulator basalt

# Check binary size (especially for Aplite)
nebble size --platform aplite

# Clean build artifacts
nebble clean
```

## Commands

### `nebble new <name> [--watchface]`

Create a new Pebble project with scaffolding and templates.

**Options:**
- `--watchface` - Create a watchface instead of an app

**Example:**
```bash
nebble new hello_world
nebble new my_clock --watchface
```

Creates:
- `nebble.json` - Project configuration
- `nim.cfg` - Nim cross-compilation config
- `wscript` - Pebble build system integration
- `src/<name>.nim` - Main source file
- `.gitignore` - Git ignore patterns

### `nebble build [--platform <p>]`

Build the project using the Nim→C→Pebble pipeline.

**Options:**
- `--platform <p>` - Build for specific platform (default: all platforms in nebble.json)

**Platforms:** aplite, basalt, chalk, diorite, emery, flint

**Example:**
```bash
nebble build                    # Build for all platforms
nebble build --platform basalt  # Build for Basalt only
```

**Build Steps:**
1. Compile Nim code to C with platform-specific defines
2. Generate `appinfo.json` from `nebble.json`
3. Copy generated C files to `src/c/`
4. Run `pebble build` to create `.pbw` bundle

### `nebble install --emulator <platform>`

Install to a Pebble emulator.

**Example:**
```bash
nebble install --emulator basalt
nebble install --emulator aplite
```

### `nebble install --phone`

Install to a connected phone via the Pebble SDK.

**Example:**
```bash
nebble install --phone
```

### `nebble clean`

Remove build artifacts (`build/`, `nimcache/`, `.lock-waf*`).

**Example:**
```bash
nebble clean
```

### `nebble size [--platform <p>]`

Show binary size breakdown using `arm-none-eabi-size`.

For Aplite builds, also shows RAM budget utilization (24KB limit).

**Example:**
```bash
nebble size --platform aplite
nebble size --platform basalt
```

### `nebble help`

Show help message with all commands and examples.

### `nebble version`

Show version information.

## Project Configuration

Projects use `nebble.json` for configuration:

```json
{
  "name": "my_app",
  "type": "app",
  "version": "1.0.0",
  "uuid": "12345678-1234-1234-1234-123456789abc",
  "platforms": ["aplite", "basalt", "chalk", "diorite", "emery", "flint"],
  "capabilities": [],
  "appKeys": {}
}
```

**Fields:**
- `name` - App name
- `type` - `"app"` or `"watchface"`
- `version` - Semantic version
- `uuid` - Unique app identifier (auto-generated)
- `platforms` - Target platforms
- `capabilities` - Pebble capabilities (e.g., `["location"]`)
- `appKeys` - AppMessage keys for phone communication

This is converted to `appinfo.json` at build time.

## Templates

### App Template

Basic app with button click handlers:

```nim
import nebble

var window: ptr Window
var textLayer: ptr TextLayer

# Click handlers for SELECT, UP, DOWN buttons
# Window lifecycle handlers (load/unload)
# Demonstrates idiomatic Nebble API
```

### Watchface Template

Digital clock with time and date:

```nim
import nebble

var window: ptr Window
var timeLayer, dateLayer: ptr TextLayer

# Updates every minute via tick timer
# 12h/24h format support
# Uses system fonts
```

## Development Workflow

```bash
# 1. Create project
nebble new my_app
cd my_app

# 2. Edit source code
vim src/my_app.nim

# 3. Build and test
nebble build --platform basalt
nebble install --emulator basalt

# 4. Check memory usage (for Aplite)
nebble size --platform aplite

# 5. Clean when needed
nebble clean
```

## Requirements

- Nim ≥ 2.2.0
- Pebble SDK (for `pebble build` and deployment)
- ARM GCC toolchain (bundled with Pebble SDK)
- nebble library package (parent directory)

## Architecture

- `cli/src/nebble.nim` - Main CLI entry point
- `cli/src/nebble_cli/commands.nim` - Command implementations
- `cli/src/nebble_cli/config.nim` - Config file handling
- `cli/src/nebble_cli/templates.nim` - Project templates
- `cli/src/nebble_cli/builder.nim` - Build pipeline

## License

MIT

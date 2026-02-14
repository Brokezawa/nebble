# Nebble CLI

The `nebble` command-line tool is the primary build and project management tool for Nebble development. It handles the Nim to C compilation pipeline, manages project resources, and integrates with the Pebble SDK.

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

# Build the project
cd my_app
nebble build

# Install to emulator
nebble install --emulator basalt
```

## Commands

### `nebble new <name> [--watchface]`
Create a new Pebble project with scaffolding and templates.
- `--watchface`: Create a watchface instead of an app.

### `nebble build [--platform <p>]`
Build the project using the Nim to C to Pebble pipeline.
- `--platform <p>`: Build for specific platform (aplite, basalt, chalk, diorite, emery, flint). Default: all platforms.

### `nebble install --emulator <platform> | --phone`
Install the built app to a Pebble emulator or a physical phone.
- `--emulator <p>`: Target emulator platform. Use "all" to install to all supported platforms.
- `--phone [<IP>]`: Install to phone (optionally specify IP).

### `nebble kill [--force]`
Kill all running Pebble emulators.
- `--force`: Use force if emulators are stuck.

### `nebble clean`
Remove all build artifacts (build/, nimcache/, etc.).

### `nebble size [--platform <p>]`
Show binary size breakdown and RAM utilization (critical for Aplite's 24KB limit).

### `nebble genkeys`
Generate type-safe Nim message keys from the `appKeys` defined in `nebble.json`.

### `nebble regen-ffi`
Regenerate Futhark FFI bindings (requires Futhark and libclang).

## Project Configuration

Nebble projects are configured via `nebble.json` in the project root. This file is automatically converted to `appinfo.json` during the build process.

```json
{
  "name": "my_app",
  "type": "app",
  "version": "1.0.0",
  "uuid": "...",
  "platforms": ["aplite", "basalt", "chalk", "diorite", "emery", "flint"],
  "capabilities": [],
  "appKeys": {
    "Data": 0,
    "Command": 1
  }
}
```

## Development Workflow

1. **New Project**: `nebble new my_face --watchface`
2. **Write Code**: Edit `src/my_face.nim`
3. **Build & Test**: `nebble build && nebble install --emulator all`
4. **Optimize**: `nebble size --platform aplite`

# Nebble CLI

The `nebble` command-line tool is the primary build and project management tool for Nebble development. It handles the Nim→C compilation pipeline, manages project resources, and integrates with the Pebble SDK.

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
Build the project using the Nim→C→Pebble pipeline.
- `--platform <p>`: Build for specific platform (aplite, basalt, chalk, diorite, emery, flint). Default: all platforms in `nebble.json`.

### `nebble install --emulator <platform> | --phone`
Install the built app to a Pebble emulator or a physical phone.
- `--emulator <p>`: Target emulator platform.
- `--phone`: Install to phone (requires Pebble SDK connection).

### `nebble clean`
Remove all build artifacts (`build/`, `nimcache/`, etc.).

### `nebble size [--platform <p>]`
Show binary size breakdown and RAM utilization (critical for Aplite's 24KB limit).

### `nebble resources <action> [arg]`
Manage project resources defined in `nebble.json`.
- `list`: List all resources.
- `add <path>`: Add a new resource from file path.
- `validate`: Check if all resource files exist.

### `nebble genkeys`
Generate type-safe Nim message keys from the `appKeys` defined in `nebble.json`.

### `nebble doctor`
Diagnose your development environment (checks for Nim, Pebble SDK, and ARM toolchain).

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
2. **Add Assets**: `nebble resources add resources/images/bg.png`
3. **Write Code**: Edit `src/my_face.nim`
4. **Build & Test**: `nebble build && nebble install --emulator basalt`
5. **Optimize**: `nebble size --platform aplite`

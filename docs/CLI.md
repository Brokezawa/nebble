# Nebble CLI

The `nebble` command-line tool is the primary build and project management tool for Nebble development. It handles the Nim to C compilation pipeline, manages project resources, and integrates with the Pebble SDK.

## Installation

The CLI is included when you install the Nebble package:

```bash
nimble install nebble
```

This will install both the library and the `nebble` CLI tool to your Nimble bin directory.

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
- `--platform <p>`: Build for specific platform (aplite, basalt, chalk, diorite, emery, flint, gabbro). Default: all platforms listed in `package.json`.
- Multiple `--platform` flags can be used to build for a subset of platforms.
- The build process generates a single unified `.pbw` bundle containing all specified platform binaries.

### `nebble install --emulator <platform> | --phone`
Install the built app to a Pebble emulator or a physical phone.
- `--emulator <p>`: Target emulator platform. Use "all" to install to all valid platforms.
- `--phone <IP> [<pbw>]`: Install to phone at specified IP. Optionally specify path to a custom `.pbw`.
- By default, it uses the unified `.pbw` bundle from the `build/` directory.

### `nebble kill [--force]`
Kill all running Pebble emulators.
- `--force`: Use force if emulators are stuck.

### `nebble clean`
Remove all build artifacts (build/, nimcache/, etc.).

### `nebble size [--platform <p>]`
Show binary size breakdown and RAM utilization (critical for Aplite's 24KB limit).

### `nebble gen-keys`
Generate type-safe Nim message keys from the `messageKeys` defined in `package.json`.

### `nebble regen-ffi`
Regenerate Futhark FFI bindings (requires Futhark and libclang).

## Project Configuration

Nebble projects are configured via `package.json` in the project root (the standard Pebble SDK format).

```json
{
  "name": "my_app",
  "version": "1.0.0",
  "author": "Your Name",
  "private": true,
  "pebble": {
    "uuid": "...",
    "displayName": "My App",
    "sdkVersion": "3",
    "targetPlatforms": ["aplite", "basalt", "chalk", "diorite", "emery", "flint", "gabbro"],
    "watchapp": {
      "watchface": false
    },
    "messageKeys": {
      "Data": 0,
      "Command": 1
    }
  }
}
```

## Development Workflow

1. **New Project**: `nebble new my_face --watchface`
2. **Write Code**: Edit `src/my_face.nim` (watch) and `src/pkjs.nim` (phone)
3. **Build & Test**: `nebble build && nebble install --emulator all`
4. **Optimize**: `nebble size --platform aplite`

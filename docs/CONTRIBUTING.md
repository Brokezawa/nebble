# Contributing to Nebble

Thank you for your interest in contributing to Nebble! This project aims to provide a robust, idiomatic Nim wrapper for the Pebble SDK.

## Getting Started

1.  **Fork the repository** on GitHub.
2.  **Clone your fork** locally.
3.  **Install dependencies**:
    - Nim (>= 2.2.0)
    - Pebble SDK (installed and in PATH)
    - `nimble install -d` (installs test dependencies)

## Development Workflow

We use the `nebble` CLI tool (which is built from this repo) to build and test examples.

1.  **Build the CLI**:
    ```bash
    cd cli
    nimble build
    # Add cli/bin to your PATH or use relative path
    ```

2.  **Run Tests**:
    ```bash
    nimble test
    ```
    This runs unit tests, compile-only tests for all platforms, and builds all example apps.

## Code Style

We follow standard Nim style conventions. Please read [AGENTS.md](../AGENTS.md) for detailed guidelines on:
- Imports
- Naming conventions
- Managed types (handles)
- FFI patterns

## Managed Types (ARC)

Nebble uses Nim's ARC memory management to wrap Pebble C resources.
- Always use `DefineUniqueHandle` template for new types where possible.
- Ensure destructors are safe (check for double-free).
- Use `{.inline.}` for wrappers to ensure zero overhead.

## Adding Features

1.  **Low-Level FFI**: If a Pebble API is missing, check `src/nebble/ffi/generated/`. If it's not there, you may need to regenerate bindings (see `nebble.nimble` `regenFfi` task).
2.  **High-Level Wrapper**: Add a module in `src/nebble/ui/`, `src/nebble/foundation/`, etc.
3.  **Documentation**: Add doc comments (`##`) to all exported procs.
4.  **Tests**: Add a test case in `tests/` or update an example app to demonstrate the feature.

## Pull Requests

- Keep PRs focused on a single feature or fix.
- Ensure `nimble test` passes.
- Update documentation if API changes.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

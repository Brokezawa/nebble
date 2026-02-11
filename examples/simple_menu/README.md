Simple Menu Example
===================

This is a minimal example demonstrating the managed `MenuLayer` wrapper
and callback handling.

Build (compile-only):

  nim c -d:pebbleBasalt --path:src --compileOnly examples/simple_menu/src/simple_menu.nim

Usage:

- The example uses `pebbleApp` to scaffold a simple window and register
  a managed `MenuLayer` with several callbacks (row drawing, header,
  separators, selection change, long click).
- You can build the example with the Nebble CLI later (`nebble build`) once
  the project is integrated into your app workflow.

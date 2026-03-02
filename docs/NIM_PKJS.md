# Nim Full-Stack Development (PebbleKit JS in Nim)

Nebble supports writing both the watchapp (C target) and the phone-side component (JavaScript target) entirely in Nim. This allows for seamless code sharing, type-safe communication, and a unified developer experience.

## Project Structure

When you create a new project with `nebble new`, the following files are generated:

*   `src/<app_name>.nim`: Main watchapp source (compiled to C).
*   `src/pkjs.nim`: Phone-side logic (compiled to JS via Nim's JavaScript backend).
*   `src/gen/app_keys.nim`: Shared message keys generated from `package.json`.

## Sharing Code

The most powerful feature of the full-stack approach is sharing enums and constants between the watch and phone.

### Message Keys

Nebble automatically generates `AppMessageKey` enums in `src/gen/app_keys.nim`. You can import this file in both your watch code and your `pkjs.nim` code.

**In `pkjs.nim`:**
```nim
import nebble/pkjs
import gen/app_keys

proc onMessage(e: AppMessageEvent) {.cdecl.} =
  # Check for a specific key using the shared enum
  if e.payload.hasOwnProperty("WatchReady"):
    let data = newJsObject()
    data[cstring"JSReady"] = 1.toJs()
    Pebble.sendAppMessage(data)
```

## API Reference (`nebble/pkjs`)

The `nebble/pkjs` module provides type-safe bindings for the PebbleKit JS environment.

### Events

*   `onReady(callback)`: Fires when the JS environment is initialized.
*   `onAppMessage(callback)`: Fires when a message is received from the watch.
*   `onShowConfiguration(callback)`: Fires when the user opens the app settings.
*   `onWebviewClosed(callback)`: Fires when the configuration webview is closed.

### Communication

*   `Pebble.sendAppMessage(data [, success, failure])`: Send a JSON object to the watch.
*   `Pebble.showSimpleNotificationOnPebble(title, message)`: Display a notification on the watch.

### System

*   `Pebble.getWatchToken()`: Get a unique token for the watch.
*   `Pebble.getActiveWatchInfo()`: Get information about the connected watch (model, language, etc.).
*   `Pebble.openURL(url)`: Open a URL in the phone's browser.

## Build Process

When you run `nebble build`, the CLI performs the following steps:

1.  Compiles `src/<app_name>.nim` to C for the watch.
2.  Compiles `src/pkjs.nim` to `src/js/pebble-js-app.js` using the Nim JS backend.
3.  Bundles everything into the final `.pbw` file.

Running `nebble clean` will remove the generated JavaScript file along with other build artifacts.

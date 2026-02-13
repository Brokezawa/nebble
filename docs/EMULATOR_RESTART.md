# Restarting Pebble Emulators

## Quick Commands

### Kill all emulators
```bash
pebble kill
```

### Kill all emulators forcefully (if stuck)
```bash
pebble kill --force
```

### Start a specific emulator fresh
After killing, simply run an install command:
```bash
pebble install --emulator basalt
pebble install --emulator chalk
pebble install --emulator aplite
pebble install --emulator diorite
pebble install --emulator emery
pebble install --emulator flint
```

## When to Restart Emulators

You should restart the emulators if:

1. **App crashes** - Emulator may become unstable
2. **Memory corruption** - Dangling pointers or invalid memory access
3. **Display glitches** - Text/graphics not rendering correctly
4. **Installation failures** - App won't install or install hangs
5. **Emulator becomes unresponsive** - Doesn't accept input
6. **After testing buggy code** - Especially code with pointer issues

## Full Emulator Reset Procedure

If emulators are severely broken:

```bash
# 1. Kill all emulators
pebble kill

# 2. Wait for cleanup
sleep 2

# 3. Reinstall your app (starts fresh emulator)
cd examples/simple_clock
pebble install --emulator basalt

# 4. If you want to test multiple platforms
pebble install --emulator chalk
pebble install --emulator aplite
```

## Real-World Example

After fixing the `simple_clock` bug that broke basalt and chalk:

```bash
# Kill broken emulators
pebble kill

# Reinstall fixed app - starts fresh emulators
cd examples/simple_clock
pebble install --emulator basalt  # ✓ Works now!
pebble install --emulator chalk   # ✓ Works now!
```

## Troubleshooting

If `pebble kill` doesn't work:

```bash
# Force kill with stronger signal
pebble kill --force

# Or manually kill processes on macOS
killall -9 qemu-system-arm
```

## See Also

- `nebble.nimble` - Test task definitions


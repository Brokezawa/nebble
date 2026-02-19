## menu_demo - An interactive menu demonstration in Nim
##
## Shows how to create a scrollable menu with multiple sections and item subtitles.

import nebble
import nebble/foundation/logging

# Menu items data (Pre-allocate)
var
  menuItems: array[4, SimpleMenuItem]
  menuSections: array[1, SimpleMenuSection]

# Declarative App
nebbleApp:
  simpleMenuLayer:
    id = myMenu
    fullScreen = true
    sections = addr menuSections[0]
    numSections = 1

  init:
    logInfo("Menu Demo Init")
    
    # Initialize data at runtime
    menuItems[0] = SimpleMenuItem(title: "Start Workout", subtitle: "Running")
    menuItems[1] = SimpleMenuItem(title: "View History", subtitle: "Last 7 days")
    menuItems[2] = SimpleMenuItem(title: "Settings", subtitle: "System")
    menuItems[3] = SimpleMenuItem(title: "About", subtitle: "Nebble v1.0")
    
    menuSections[0] = SimpleMenuSection(title: "Main Menu", items: addr menuItems[0], num_items: 4)
    
    var logStr: FixedString[32]
    logStr.f("Items: ", menuSections[0].num_items)
    logInfo(logStr.cstr)


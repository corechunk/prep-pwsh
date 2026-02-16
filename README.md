# My Personal Dive Into PowerShell (with WPF)

This project is my own exploration of **PowerShell scripting**, **modular script organization**, and **WPF GUI integration**.  
I plan to go as deep as I can, experimenting with:

- Organizing reusable scripts into modules and base utilities  
- Embedding XAML definitions in PowerShell  
- Concatenating scripts into a single runnable file (`script.ps1`)  
- Implementing event handlers and UI initialization  
- Building a mini “PowerShell bundler” to produce a complete, self-contained script

---

## Index / Documentation

- **[Diagram](./xtra/diagram)** – Visual representation of the build pipeline, showing how source files, XAML, and event handlers flow into the final `script.ps1`.  

---

## Structure

The project is organized to keep assets, modules, XAML UI, and core logic separate:

```
.
├── src/
│   ├── assets/
│   │   └── logo.jpg
│   ├── base/
│   │   ├── param.ps1
│   │   ├── base.ps1
│   │   └── pkgs.ps1
│   ├── xaml/
│   │   ├── *          # XAML files defining UI
│   ├── core/
│   │   ├── *          # Event handler scripts
│   ├── module1.ps1
│   ├── pre-main.ps1
│   └── main.ps1
├── compile.ps1         # Script to build/clean/rebuild
└── script.ps1          # Final runnable PowerShell script
```

---

## Usage

To build or rebuild the project, run:

```
./compile.ps1 rebuild
```
Then Run
```
./script.ps1
```

Or, to fetch and run the latest compiled script directly from GitHub:

```
irm https://raw.githubusercontent.com/corechunk/prep-pwsh/update/script.ps1 | iex
```

# Deep Dive Index (Clean File Version)
This is the index for the Deep Dive documentation series.

| Topic | Covered Controls / Concepts |
|-------|-----------------------------|
| 1. [window](./xtra/deepDive/01.window.md) | — |
| 2. [button](./xtra/deepDive/02.button.md) | — |
| 3. [Panels_&_Layout_System](./xtra/deepDive/03.Panels_&_Layout_System.md) | Layout fundamentals |
| 4. [Menu_ContextMenu_&_ToolBar_System](./xtra/deepDive/04.Menu_ContextMenu_&_ToolBar_System.md) | Menu, ContextMenu, ToolBar |
| 5. [Images_Icons_Media_&_Visual_Assets](./xtra/deepDive/05.Images_Icons_Media_&_Visual_Assets.md) | Images, Icons, Media |
| 6. [Custom_Title_Bar_Window_Chrome_&_Advanced_Window_Control](./xtra/deepDive/06.Custom_Title_Bar_Window_Chrome_&_Advanced_Window_Control.md) | Window Chrome, Advanced Control |
| 7. [Layout_Panels_Deep_Dive](./xtra/deepDive/07.Layout_Panels_Deep_Dive.md) | (Grid, StackPanel, DockPanel, WrapPanel, Canvas) |
| 8. [Advanced_Event_Handling](./xtra/deepDive/08.Advanced_Event_Handling.md) | (Control Events, Routed Events, Bubbling, Tunneling, Custom Events) |
| 9. [Styling_&_Templates](./xtra/deepDive/09.Styling_&_Templates.md) | (Backgrounds, Colors, Fonts, Images, Icons, Tooltips, Custom Styles) |
| 10. [Layouts_&_Advanced_Controls](./xtra/deepDive/10.Layouts_&_Advanced_Controls.md) | (StackPanel, DockPanel, WrapPanel, ScrollViewer, TabControl, TreeView, DataGrid) |
| 11. [Events_&_Interactivity](./xtra/deepDive/11.Events_&_Interactivity.md) | (Click, Mouse, Keyboard, Focus, Drag & Drop, Commands, RoutedEvents, Timers, Animation) |
| 12. [Styling_Templates_&_Themes](./xtra/deepDive/12.Styling_Templates_&_Themes.md) | (Brushes, Fonts, Borders, Gradient, Styles, ControlTemplates, DataTemplates) |
| 13. [Panels_Layouts_&_Containers](./xtra/deepDive/13.Panels_Layouts_&_Containers.md) | (StackPanel, Grid, DockPanel, WrapPanel, Canvas, ScrollViewer, TabControl, Expander, etc.) |
| 14. [Event_Handling_Commands_Data_Binding_MVVM_Patterns](./xtra/deepDive/14.Event_Handling_Commands_Data_Binding_MVVM_Patterns.md) | (Commands, Data Binding, MVVM) |
| 15. [Advanced_UI](./xtra/deepDive/15.Advanced_UI.md) | (Window Icon, Title Bar, Sliding Panels, Custom Menus) |

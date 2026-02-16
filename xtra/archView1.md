## Architectural View (Why This Exists)

This project follows a **manual build / bundling architecture**.

Instead of executing many PowerShell files dynamically at runtime, I intentionally
**compile multiple source files into a single runnable script (`script.ps1`)**.

This is not unique to PowerShell — the same idea exists in other ecosystems.

Examples from other ecosystems:

- :contentReference[oaicite:0]{index=0} bundles JavaScript modules into a single file
- :contentReference[oaicite:1]{index=1} performs ordered tree-based bundling
- :contentReference[oaicite:2]{index=2} orchestrates compilation steps into final artifacts

This project applies the **same architectural idea**, but manually, using PowerShell.

---

## What Is Being Built

The final output is:

- A **single PowerShell script**
- Containing:
  - Parameters
  - Assembly references (WPF)
  - Functions and utilities
  - Embedded XAML as variables
  - Event handlers
  - A single entry point

This makes the runtime simple:

- No dot-sourcing at execution time
- No dependency discovery at runtime
- One file = one execution unit

---

## Build-Time vs Run-Time Responsibility

A key architectural choice in this project is **shifting complexity to build-time**.

### Build-time (compile.ps1)

- Reads files from multiple directories
- Enforces execution order
- Embeds XAML into PowerShell variables
- Concatenates everything into `script.ps1`

### Run-time (script.ps1)

- Assumes everything already exists
- Only initializes UI and logic
- No file-system dependency on `src/`

This separation keeps runtime behavior predictable.

---

## Ordered Dependency Pipeline

The compilation pipeline is **intentionally linear**:

1. Parameters
2. Base utilities
3. Modules
4. XAML embedding
5. Event handlers
6. Entry point

This mirrors how real build systems work:  
dependencies are resolved **before** execution, not during it.

---

## Example: XAML Embedding (Compile-Time)

Instead of loading XAML at runtime:

```
[xml]$xaml_main = Get-Content "./src/xaml/main.xaml"
```

The build step converts XAML into embedded variables:

```
[xml]$xaml_main = @"
<Window>
  ...
</Window>
"@
```

At runtime, the UI is already present in memory.

This is equivalent to how assets are embedded in compiled binaries.

---

## Example: Event Handlers as a Build Stage

All event handler scripts:

```
src/core/*.ps1
```

are concatenated **before** `main.ps1` is added.

This guarantees:

- Handlers exist before UI initialization
- No accidental forward references
- Deterministic execution order

---

## Why Not Just Dot-Source Everything?

Dot-sourcing is flexible, but:

- It hides dependency order
- It depends on file-system layout at runtime
- It makes distribution harder

This project intentionally avoids that in favor of:

- Explicit ordering
- Single-file distribution
- Reproducible builds

---

## What This Project Is (and Is Not)

This project **is**:

- A personal deep dive into PowerShell + WPF
- An experiment in manual build systems
- A learning exercise in architecture and dependency control

This project **is not**:

- A framework
- A replacement for real build tools
- A promise of completeness

The goal is exploration and understanding — going as deep as possible.

---

## Summary

Architecturally, this project is best described as:

- A **manual bundler**
- A **build-time dependency resolver**
- A **single-artifact PowerShell application**

The same idea exists in many ecosystems — this is simply my PowerShell version of it.

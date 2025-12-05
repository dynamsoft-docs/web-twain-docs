---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Why Do I Get a "File is Damaged and Can’t Be Opened" Error When Using the Dynamic Web TWAIN on macOS?
keywords: Dynamic Web TWAIN, macos, Damaged
breadcrumbText: Why Do I Get a "File is Damaged and Can’t Be Opened" Error When Using the Dynamic Web TWAIN on macOS?
description: Why Do I Get a "File is Damaged and Can’t Be Opened" Error When Using the Dynamic Web TWAIN on macOS?
date: 2025-12-05 07:56:47 +0800
last_modified: 2025-12-05 07:56:47 +0800
---

# Why Do I Get a "File is Damaged and Can’t Be Opened" Error When Using the Dynamic Web TWAIN on macOS?

### Symptom

When attempt to use the scanner on macOS, an error message states “<xxx.ds> is damaged and can’t be opened”.

### Reason

This error arises from macOS Gatekeeper, a built-in security feature that blocks unsigned files. The driver lacks a valid Apple developer signature, so macOS tags it with a “quarantine” attribute and prevents execution.

The error may also show an old download date (e.g., “Safari downloaded this file on June xx, xxxx”) even if the file is new. This occurs because macOS retains the “quarantine” metadata when the file is transferred from:

- An old computer
- A USB drive
- A company server
- A backup (e.g., Time Machine restore)

### Resolution

This issue is not related to our product but stems from the unsigned driver.

- Temporary Fix: Click “OK” on the error dialog. The driver often works normally afterward, as macOS may relax enforcement after initial blocking.
- Permanent Fix (if error persists): Remove the “quarantine” attribute via Terminal:
    - Open Terminal (/Applications/Utilities).
    - Run this command (replace /path/to/driver with the actual file path, e.g., /Applications/YourDriver.app):
    ```bash
    sudo xattr -rd com.apple.quarantine /path/to/driver  
    ```

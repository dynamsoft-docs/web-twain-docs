---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Why Do I Get a "File is Damaged and Can’t Be Opened" Error When Using the Dynamic Web TWAIN on macOS?
keywords: Dynamic Web TWAIN, macos, Damaged, can't be opened
breadcrumbText: Why Do I Get a "File is Damaged and Can’t Be Opened" Error When Using the Dynamic Web TWAIN on macOS?
description: Why Do I Get a "File is Damaged and Can’t Be Opened" Error When Using the Dynamic Web TWAIN on macOS?
date: 2025-12-08 07:56:47 +0800
last_modified: 2025-12-08 07:56:47 +0800
---

# Why Do I Get a "File is Damaged and Can’t Be Opened" Error When Using the Dynamic Web TWAIN on macOS?

### Symptom

When attempt to use the scanner on macOS, an error message states “<xxx.ds> is damaged and can’t be opened”.

![ds-is-damaged](/assets/imgs/ds-is-damaged.png)

### Reason

This issue is caused by macOS Gatekeeper, a security feature that blocks applications that are unsigned or not notarized when the file carries a quarantine attribute. The file itself is not damaged but Gatekeeper prevents it from running.

The error message may also show an outdated download time, for example “Safari downloaded this file on `June 18, 2019`”, even on a new computer. This happens because macOS preserves the quarantine metadata when the file has been copied from sources such as:

- An old computer
- A USB drive
- A company server
- A backup (e.g., Time Machine restore)

### Resolution

This issue is not related to our product but stems from the unsigned driver.

- Temporary Fix: Click “OK” on the error dialog. The driver often works normally afterward.

- Permanent Fix (if error persists): Remove the “quarantine” attribute via Terminal:
    - Open Terminal (/Applications/Utilities).
    - Run this command:
    ```bash
    sudo xattr -rd com.apple.quarantine /Applications/{YourDriver}.app  
    ```

<div class="blockquote-warning"></div>
> Only disable checks for trusted files. Verify the driver’s source is safe before proceeding.
---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: File Dialog Closes Immediately on Linux
keywords: Dynamic Web TWAIN, Linux, LoadImageEx, File Dialog, GTK, libgtk2.0-0
breadcrumbText: File Dialog Closes Immediately on Linux
description: File Dialog Closes Immediately on Linux
date: 2026-07-06 10:14:50 +0000
last_modified: 2026-07-07 07:45:50 +0000
---

# File Dialog Closes Immediately on Linux

## Symptom

When calling the Load or Save related APIs on Linux, the native file selection dialog briefly appears and then immediately closes.

The operation fails, and the following message may be reported in the browser console:

```text
User cancelled the operation.
```

## Issue characteristics

- Only occurs on Linux
- Occurs when calling file load or save APIs, such as `LoadImageEx`, `SaveAsXXX`, `SaveAllAsXXX`, and `SaveSelectedImagesAsXXX`
- The native file dialog flashes briefly and then closes automatically
- The user is unable to select a file
- The browser console reports `User cancelled the operation`

## Reason

This issue is caused by a missing Linux system dependency.

Dynamic Web TWAIN relies on the GTK2 runtime library (`libgtk2.0-0`) to display the native file selection dialog on Linux. If this library is not installed, the dialog cannot be initialized correctly and is immediately closed by the operating system. Dynamic Web TWAIN therefore reports the operation as being cancelled by the user.

## Resolution

Install the GTK2 runtime library on the Linux machine:

**Debian-based distributions**

```bash
sudo apt install libgtk2.0-0
```

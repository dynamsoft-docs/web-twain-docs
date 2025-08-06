---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Why am I unable to load the TIFF file into Dynamic Web TWAIN?
keywords: Dynamic Web TWAIN, Error Troubleshooting, tiff
breadcrumbText: Why am I unable to load the TIFF file into Dynamic Web TWAIN?
description: Why am I unable to load the TIFF file into Dynamic Web TWAIN?
date: 2025-04-23 16:09:35 +0800
---

# Error Troubleshooting

## Why am I unable to load the TIFF file into Dynamic Web TWAIN?

### Symptom

When you attempt to import a TIFF file using Dynamic Web TWAIN, it will indicate that the file has been successfully loaded, but the image does not appear in the viewer.

### Cause

All versions prior to version 19.0 do not support importing 4-bit color images. If you encounter the issue mentioned above, your file may be using the deprecated JPEG compression standard.

### Resolution

Support for 4-bit TIFF format was added in version 19.1. Therefore, please update to version 19.1 to resolve this issue.

> If the resolution doesn't work for you, please [contact us](https://www.dynamsoft.com/company/contact/).

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What physical document scanners does the Dynamic Web TWAIN SDK support?
keywords: Dynamic Web TWAIN, Capture/ Image Source, physical, document, scanner, support
breadcrumbText: What physical document scanners does the Dynamic Web TWAIN SDK support?
description: What physical document scanners does the Dynamic Web TWAIN SDK support?
date: 2021-12-08 03:01:32 +0800
---

# Capture/Image Source

## What physical document scanners does the Dynamic Web TWAIN SDK support?

Dynamic Web TWAIN's main feature is interacting with imaging devices like scanners and cameras. Here is the list of supported document scanners.

1. TWAIN Scanners (for Windows)
2. ICA Scanners (for macOS)
3. SANE Scanners (for Linux)

You can learn more details about each type of device on <a href="{{site.getstarted}}Hardware.html" target="_blank">this page</a>.

TWAIN, ICA and SANE are free scanner driver specifications and they have been adopted by almost all the scanner manufacturers in the market. Network scanners are also supported as long as there is a TWAIN/ICA/SANE scanner driver available.

Therefore, Dynamic Web TWAIN SDK has great compatibilities with almost all scanners in the market. Note that ScanSnap is one known scanner model that is not TWAIN compliant. To verify if your scanner is compatible with our SDK, you can refer to [this article](/_articles/faq/verify-if-device-is-supported.md).


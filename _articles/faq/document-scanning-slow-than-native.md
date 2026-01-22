---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Document scanning via the Dynamic Web TWAIN SDK is slower than using the native scanner application. How can I speed it up?
keywords: Dynamic Web TWAIN, Capture/ Image Source, slow scan
breadcrumbText: Document scanning via the Dynamic Web TWAIN SDK is slower than using the native scanner application. How can I speed it up?
description: Document scanning via the Dynamic Web TWAIN SDK is slower than using the native scanner application. How can I speed it up?
date: 2021-12-08 03:01:32 +0800
last_modified: 2026-01-21 15:42:47 -08:00
---

# Capture/Image Source

## Document scanning via the Dynamic Web TWAIN SDK is slower than using the native scanner application. How can I speed it up?

First, confirm you are using the same scan settings (color mode, DPI, duplex, etc.) as the native app.

If settings match, look for extra work in your callbacks. Check code in `AcquireImage()` callbacks like [`OnPostTransfer`](/_articles/info/api/WebTwain_Acquire.md#onposttransfer){:target="_blank"} and [`OnPostAllTransfers`](/_articles/info/api/WebTwain_Acquire.md#onpostalltransfers){:target="_blank"}. If you must run per-page logic, prefer [`OnPostTransferAsync`](/_articles/info/api/WebTwain_Acquire.md#onposttransferasync){:target="_blank"} to avoid blocking the scan pipeline.

If the scanning performance issue persists, please <a href="mailto:support@dynamsoft.com">contact us</a>.

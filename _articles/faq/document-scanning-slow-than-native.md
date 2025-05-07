---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Document scanning via the Dynamic Web TWAIN SDK is slower than using the native scanner application. How can I speed it up?
keywords: Dynamic Web TWAIN, Capture/ Image Source, slow scan
breadcrumbText: Document scanning via the Dynamic Web TWAIN SDK is slower than using the native scanner application. How can I speed it up?
description: Document scanning via the Dynamic Web TWAIN SDK is slower than using the native scanner application. How can I speed it up?
---

# Capture/Image Source

## Document scanning via the Dynamic Web TWAIN SDK is slower than using the native scanner application. How can I speed it up?

Please first check if you use the same pre-scanning settings (e.g. color mode, resolution, etc.).

Assuming the pre-scanning settings are the same, please double check if there are any automatic actions after scanning pages. You may double check the call back functions of the [AcquireImage](/_articles/info/api/WebTwain_Acquire.md#acquireimage){:target="_blank"} function or check if you write any code in the [OnPostTransfer](/_articles/info/api/WebTwain_Acquire.md#onposttransfer){:target="_blank"} or [OnPostAllTransfers](/_articles/info/api/WebTwain_Acquire.md#onpostalltransfers){:target="_blank"} event. If you need to run some automatic actions  right after each page is scanned, it's recommended to use the [OnPostTransferAsync](/_articles/info/api/WebTwain_Acquire.md#onposttransferasync){:target="_blank"} event.

If the scanning performance issue persists, please <a href="mailto:support@dynamsoft.com">contact us</a>.

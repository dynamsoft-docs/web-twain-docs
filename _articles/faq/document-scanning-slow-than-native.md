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

Assuming the pre-scanning settings are the same, please double check if there are any automatic actions after scanning pages. You may double check the call back functions of the <a href="/web-twain/docs/info/api/WebTwain_Acquire.html#acquireimage" target="_blank">AcquireImage</a> function or check if you write any code in the <a href="/web-twain/docs/info/api/WebTwain_Acquire.html#onposttransfer" target="_blank">OnPostTransfer</a> or <a href="/web-twain/docs/info/api/WebTwain_Acquire.html#onpostalltransfers" target="_blank">OnPostAllTransfers</a> event. If you need to run some automatic actions  right after each page is scanned, it's recommendeded to use the <a href="/web-twain/docs/info/api/WebTwain_Acquire.html#onposttransferasync" target="_blank">OnPostTransferAsync</a> event.

If the scanning performance issue persists, please <a href="mailto:support@dynamsoft.com">contact us</a>.

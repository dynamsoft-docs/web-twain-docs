---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I hide webcam devices from the select source list?
keywords: Dynamic Web TWAIN, Capture/ Image Source, hide, webcam
breadcrumbText: Can I hide webcam devices from the select source list?
description: Can I hide webcam devices from the select source list?
date: 2021-12-08 03:01:32 +0000
last_modified: 2026-07-30 09:25:56 +0000
---

# Capture/Image Source

## Can I hide webcam devices from the select source list?

Many webcam devices may use WIA drivers. As explained in this article, WIA drivers can also be detected by the Dynamic Web TWAIN SDK. For devices accessed via TWAIN, you can check whether the source supports the `CAP_CAMERAPREVIEWUI` capability using [getCapabilities](/_articles/info/api/WebTwain_Acquire.md#getcapabilities){:target="_blank"} — sources that support it are typically cameras, so you can skip them from your source list.

Please note that you would need to call [OpenSource](/_articles/info/api/WebTwain_Acquire.md#opensource){:target="_blank"} API to open a source before you can query its capabilities. If there are any offline devices in the source name list, this process would be interrupted.

A simpler workaround that doesn't require opening each source is to exclude sources by detecting certain keywords in the source name list — e.g. excluding any source names containing 'camera' or 'webcam'. Please refer to this [FAQ](/_articles/faq/hide-offline-scanners-from-source-list.md){:target="_blank"} for more details.

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can the Dynamic Web TWAIN SDK automatically detect borders of the scanned document and crop it out?
keywords: Dynamic Web TWAIN, Capture/ Image Source, default source, automatically, detect border
breadcrumbText: Can the Dynamic Web TWAIN SDK automatically detect borders of the scanned document and crop it out?
description: Can the Dynamic Web TWAIN SDK automatically detect borders of the scanned document and crop it out?
date: 2021-12-08 03:01:32 +0800
last_modified: 2022-06-10 04:40:03 +0800
---

# Capture/Image Source

## Can the Dynamic Web TWAIN SDK automatically detect borders of the scanned document and crop it out?

Yes, Dynamic Web TWAIN SDK can automatically detect borders of the scanned document if it is supported by the device and its driver. You can check whether your device supports this capability from its user manual.

Please use [IfAutomaticBorderDetection](/_articles/info/api/WebTwain_Acquire.md#ifautomaticborderdetection){:target="_blank"} property to enable this functionality.

> Note: Once enabled, the data source (scanner) will automatically detect the borders of the document so that no extra margins are scanned.

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can the Dynamic Web TWAIN SDK automatically detect border of the scanned document and crop it out?
keywords: Dynamic Web TWAIN, Capture/ Image Source, default source, automatically, detect border
breadcrumbText: Can the Dynamic Web TWAIN SDK automatically detect border of the scanned document and crop it out?
description: Can the Dynamic Web TWAIN SDK automatically detect border of the scanned document and crop it out?
---

# Capture/ Image Source

## Can the Dynamic Web TWAIN SDK automatically detect border of the scanned document and crop it out?

Yes, Dynamic Web TWAIN SDK automatically detects border of the scanned documents if it is supported by the device and its driver support detecting the border automatically. You can find whether your device supports this capability from its user manual.

Please use <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html?ver=latest#ifautomaticborderdetection" target="_blank">IfAutomaticBorderDetection</a> property to enable this functionality.

> Note - Once enabled, the data source (scanner) will automatically detect the borders of the document so that no extra margins are scanned.

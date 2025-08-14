---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I set my document scanner to scan x pages instead of all pages from the automatic document feeder (ADF)?
keywords: Dynamic Web TWAIN, Capture/ Image Source, ADF, automatic document feeder
breadcrumbText: Can I set my document scanner to scan x pages instead of all pages from the automatic document feeder (ADF)?
description: Can I set my document scanner to scan x pages instead of all pages from the automatic document feeder (ADF)?
date: 2021-12-08 03:01:32 +0800
last_modified: 2022-10-21 14:05:54 +0800
---

# Capture/Image Source

## Can I set my document scanner to scan x number of pages instead of all pages from the automatic document feeder (ADF)?

Yes. You can use [XferCount](/_articles/info/api/WebTwain_Acquire.md#xfercount){:target="_blank"} to set the number of pages you'd like to scan from the feeder at a time. However, please note that the XferCount API is a hardware-dependent feature, so it only works properly if your scanner device supports it.

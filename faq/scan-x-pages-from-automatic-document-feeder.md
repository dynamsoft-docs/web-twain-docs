---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I set my document scanner to scan x pages instead of all pages from the automatic document feeder (ADF)?
keywords: Dynamic Web TWAIN, Capture/ Image Source, ADF, automatic document feeder
breadcrumbText: Can I set my document scanner to scan x pages instead of all pages from the automatic document feeder (ADF)?
description: Can I set my document scanner to scan x pages instead of all pages from the automatic document feeder (ADF)?
---

# Capture/ Image Source

## Can I set my document scanner to scan x pages instead of all pages from the automatic document feeder (ADF)?

Yes. You can use <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html?ver=latest#xfercount" target="_blank">XferCount</a> to set the number of pages you’d like to scan from the feeder at a time. However, please be aware that the XferCount API is a hardware-dependent feature, so it only works properly if your scanner device supports it.

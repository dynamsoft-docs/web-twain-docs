---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Is there a limit on the number of pages I can scan at a time? Where do you store them after scanning?
keywords: Dynamic Web TWAIN, Capture/ Image Source, limit on scanned pages
breadcrumbText: Is there a limit on the number of pages I can scan at a time? Where do you store them after scanning?
description: Is there a limit on the number of pages I can scan at a time? Where do you store them after scanning?
date: 2021-12-08 03:01:32 +0800
last_modified: 2026-01-21 14:32:41 -0800
---

# Capture/Image Source

## Is there a limit on the number of pages I can scan at a time? Where do you store them after scanning?

Dynamic Web TWAIN Desktop Service edition allows you to scan unlimited number of pages from a physical document scanner.
The Desktop Service edition can run in 32-bit and 64-bit and the data is stored raw in DIB format. Starting from version 15.0, 64-bit has been made the default option on a 64-bit OS and that means the available address space is large enough that you are unlikely to hit memory limits in normal scenarios. However, physical memory size is always finite, so a good practice is to store images to memory by default and temporarily cache some images to the local disk when the used memory size exceeds a specific value (e.g. 800MB).

Note the disk caching feature is turned on by default and you can change the setting by using the following APIs

- [IfAllowLocalCache](/_articles/info/api/WebTwain_Buffer.md#ifallowlocalcache){:target="_blank"}
- [BufferMemoryLimit](/_articles/info/api/WebTwain_Buffer.md#buffermemorylimit){:target="_blank"} (defaults to 800MB)

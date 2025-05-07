---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Is there a limit on the number of pages I can scan at a time? Where do you store them after scanning?
keywords: Dynamic Web TWAIN, Capture/ Image Source, limit on scanned pages
breadcrumbText: Is there a limit on the number of pages I can scan at a time? Where do you store them after scanning?
description: Is there a limit on the number of pages I can scan at a time? Where do you store them after scanning?
---

# Capture/Image Source

## Is there a limit on the number of pages I can scan at a time? Where do you store them after scanning?

Dynamic Web TWAIN Desktop Service edition allows you to scan unlimited number of pages from a physical document scanner.
The Desktop Service edition can run in 32-bit and 64-bit and the data is stored raw in DIB format. Starting from version 15.0, 64-bit has been made the default option on a 64-bit OS and that means there is no limitation on how much memory it can use. However, physical memory size is usually limited so a good practice is to store images to memory by default and temporarily cache some images to the local disk when the used memory size exceeds a specific value (e.g. 800MB).

Note the disk caching feature is turned on by default and you can change the setting by using the following APIs

- [IfAllowLocalCache](/_articles/info/api/WebTwain_Buffer.md#ifallowlocalcache){:target="_blank"}
- [BufferMemoryLimit](/_articles/info/api/WebTwain_Buffer.md#buffermemorylimit){:target="_blank"}

On the other hand, if you are using the WebAssembly edition of Dynamic Web TWAIN, you can only utilize up to 2 GB of memory as WebAssembly only supports 32-bit pointers at present. However, the WebAssembly edition is mainly for document capturing <strong>from webcams/mobile cameras</strong> so it is less likely one would scan hundreds of pages at a time. Also, all captured pages are saved in buffer in JPEG format which won't take much space.

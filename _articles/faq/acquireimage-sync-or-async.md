---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Is the AcquireImage() method synchronous or asynchronous?
keywords: Dynamic Web TWAIN, Capture/ Image Source, acquireImage synchronous, asynchronous
breadcrumbText: Is the AcquireImage() method synchronous or asynchronous?
description: Is the AcquireImage() method synchronous or asynchronous?
date: 2021-12-08 03:01:32 +0800
last_modified: 2022-06-10 04:40:03 +0800
---

# Capture/Image Source

## Is the AcquireImage() method synchronous or asynchronous?

[AcquireImage()](/_articles/info/api/WebTwain_Acquire.md#acquireimage){:target="_blank"} is an asynchronous method, regardless of whether it includes a callback function or not.
b
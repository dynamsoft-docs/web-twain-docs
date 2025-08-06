---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I trigger an automatic workflow right after document scanning or image importing?
keywords: Dynamic Web TWAIN, Capture/ Image Source, trigger, automatic workflow
breadcrumbText: How can I trigger an automatic workflow right after document scanning or image importing?
description: How can I trigger an automatic workflow right after document scanning or image importing?
date: 2021-12-08 03:01:32 +0800
---

# Capture/Image Source

## How can I trigger an automatic workflow right after document scanning or image importing?

There are many events available to help you build an automatic business workflow in your document scanning application.

If you scan papers from your physical document scanners, you can use the [OnPostTransfer](/_articles/info/api/WebTwain_Acquire.md#onposttransfer){:target="_blank"} or [OnPostTransferAsync](/_articles/info/api/WebTwain_Acquire.md#onposttransferasync){:target="_blank"} event to trigger actions right after each page is successfully scanned. You can use [OnPostAllTransfers](/_articles/info/api/WebTwain_Acquire.md#onpostalltransfers){:target="_blank"} if you need to trigger any actions once all pages are scanned successfully.

If you import images from your local disk, you can use the [OnPostLoad](/_articles/info/api/WebTwain_IO.md#onpostload){:target="_blank"} event which triggers right after each file is successfully loaded.

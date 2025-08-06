---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I load specific page numbers of a PDF file into the viewer?
keywords: Dynamic Web TWAIN, Addon, specific page, pdf
breadcrumbText: Can I load specific page numbers of a PDF file into the viewer?
description: Can I load specific page numbers of a PDF file into the viewer?
date: 2021-12-01 01:09:41 +0800
---

# Addon

## Can I load specific page numbers of a PDF file into the viewer?

Dynamic Web TWAIN does not provide a native method that supports loading specific page numbers of a PDF file. However, it can be done by following the steps below
- a. register the [OnPostLoad](/_articles/info/api/WebTwain_IO.md#onpostload){:target="_blank"} event which is triggered once the entire file has been loaded to the viewer
- b. In the event function, remove the unwanted pages (API [RemoveImage](/_articles/info/api/WebTwain_Buffer.md#removeimage){:target="_blank"})
- c. load the file to the viewer (e.g. API [LoadImage](/_articles/info/api/WebTwain_IO.md#loadimage){:target="_blank"})

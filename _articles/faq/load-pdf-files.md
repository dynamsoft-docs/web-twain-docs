---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I load PDF/A files into the Dynamic Web TWAIN SDK?
keywords: Dynamic Web TWAIN, Addon, load pdf/a
breadcrumbText: How can I load PDF/A files into the Dynamic Web TWAIN SDK?
description: How can I load PDF/A files into the Dynamic Web TWAIN SDK?
date: 2021-12-01 01:09:41 +0800
last_modified: 2022-10-21 14:05:54 +0800
---

# Addon

## How can I load PDF/A files into the Dynamic Web TWAIN SDK?

You can use the PDF Rasterizer add-on which supports reading PDF/A images.

If the PDF Rasterizer add-on is used, the file will automatically be rasterized when it's loaded to the viewer.

### When is PDF Rasterizer effective?

Once `PDFR` has been configured, it will automatically detect if a file needs to be rasterized and if so, it will convert it to an image(s) with the set resolution(if no resolution is set, the default is 200). This happens when you call any of the following methods

> `PDFR` also works when you drag and drop the file onto the viewer to load it

- [ `LoadImage()` ](/_articles/info/api/WebTwain_IO.md#loadimage)
- [ `LoadImageEx()` ](/_articles/info/api/WebTwain_IO.md#loadimageex)
- [ `LoadImageFromBase64Binary()` ](/_articles/info/api/WebTwain_IO.md#loadimagefrombase64binary)
- [ `LoadImageFromBinary()` ](/_articles/info/api/WebTwain_IO.md#loadimagefrombinary)
- [ `FTPDownload()` ](/_articles/info/api/WebTwain_IO.md#ftpdownload)
- [ `FTPDownloadEx()` ](/_articles/info/api/WebTwain_IO.md#ftpdownloadex)
- [ `HTTPDownload()` ](/_articles/info/api/WebTwain_IO.md#httpdownload)
- [ `HTTPDownloadEx()` ](/_articles/info/api/WebTwain_IO.md#httpdownloadex)
- [ `HTTPDownloadThroughPost()` ](/_articles/info/api/WebTwain_IO.md#httpdownloadthroughpost)
- [ `HTTPDownloadDirectly()` ](/_articles/info/api/WebTwain_IO.md#httpdownloaddirectly)

Dynamic Web TWAIN does not support the generation of PDF/A files.

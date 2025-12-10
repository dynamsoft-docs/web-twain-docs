---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I load PDF/A files into the Dynamic Web TWAIN SDK?
keywords: Dynamic Web TWAIN, Addon, load pdf/a
breadcrumbText: How can I load PDF/A files into the Dynamic Web TWAIN SDK?
description: How can I load PDF/A files into the Dynamic Web TWAIN SDK?
date: 2021-12-01 01:09:41 +0800
last_modified: 2025-12-10 15:53:54 +0800
---

# Addon

## How can I load PDF/A files into the Dynamic Web TWAIN SDK?

Dynamic Web TWAIN can load PDF/A files, but whether the PDF Rasterizer add-on is required depends on the content of the PDF/A file:

- If the PDF/A contains text or vector graphics, it must be rasterized, and therefore requires the PDF Rasterizer add-on.
- If the PDF/A contains only raster images, it can be loaded without the PDF Rasterizer.

You can programmatically check whether a file needs rasterization using [`IsRasterizationRequired()`](/_articles/info/api/Addon_PDF.html#israsterizationrequired):

```javascript
DWTObject.Addon.PDF.IsRasterizationRequired(path); // returns true or false
```

When enabled, the add-on automatically rasterizes PDF/A documents into images when they are loaded into the viewer.

> [!NOTE]
> **Looking for information about generating PDF/A files?**
> Starting from Dynamic Web TWAIN 19.3, PDF/A creation is supported.
> See: [How can I generate PDF/A files?](/_articles/faq/generate-pdf-files.md)


### When is PDF Rasterizer used?

Once the PDF Rasterizer (`PDFR`) is configured, it automatically rasterizes the file *only when needed*.
If rasterization is required, the PDF is converted into one or more images at the specified resolution (default **200 DPI**).

Rasterization may occur when using any of the following APIs (including drag-and-drop):

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

### Important Change in v19.3
Previous versions of Dynamic Web TWAIN did **not** support exporting PDF/A files.
As of **19.3**, you can now:
- Load PDF/A files (with or without the PDF Rasterizer, depending on content), and
- Generate PDF/A files.

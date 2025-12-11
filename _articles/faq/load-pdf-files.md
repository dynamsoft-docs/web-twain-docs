---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I load PDF/A files into the Dynamic Web TWAIN SDK?
keywords: Dynamic Web TWAIN, Addon, load pdf/a
breadcrumbText: How can I load PDF/A files into the Dynamic Web TWAIN SDK?
description: How can I load PDF/A files into the Dynamic Web TWAIN SDK?
date: 2021-12-01 01:09:41 +0800
last_modified: 2025-12-11 14:20:54 +0800
---

# Addon

## How can I load PDF/A files into the Dynamic Web TWAIN SDK?

Dynamic Web TWAIN can load PDF/A files. Whether you need the **[PDF Rasterizer Add-on (PDFR)](https://www.dynamsoft.com/web-twain/pdf-to-image-javascript/)** depends entirely on the contents of the PDF/A document:

- If the PDF/A contains **text or vector graphics**, rasterization is required → **PDFR license needed**.
- If the PDF/A contains **only raster images**, the file can be loaded **without** the PDFR add-on.

> [!NOTE]
> **Looking for information about generating PDF/A files?**
>
> Starting from Dynamic Web TWAIN 19.3, PDF/A creation is supported.
>
> See: [How can I generate PDF/A files?](/_articles/faq/generate-pdf-files.md)

### How to check whether rasterization is required

You can programmatically detect whether a given PDF/A file requires rasterization before loading it:

```javascript
DWTObject.Addon.PDF.IsRasterizationRequired(path); // returns true or false
```

If this method returns **`true`**, the SDK will need the PDFR to process the file.

### When rasterization actually happens

Dynamic Web TWAIN performs rasterization **only when necessary**. If [`IsRasterizationRequired()`](/_articles/info/api/Addon_PDF.md#israsterizationrequired) returns **`true`** and the PDF Rasterizer license is configured, the SDK automatically rasterizes the PDF into images using the reader settings you specify.

The rasterization behavior—including resolution (default **200 DPI**) and other rendering parameters—can be customized through [`SetReaderOptions()`](/_articles/info/api/Addon_PDF.md#setreaderoptions).


Rasterization may occur when using any of these APIs (including drag-and-drop):
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

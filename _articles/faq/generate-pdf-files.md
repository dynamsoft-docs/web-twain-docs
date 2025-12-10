---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I generate PDF/A files?
keywords: Dynamic Web TWAIN, Addon, separate, license
breadcrumbText: How can I generate PDF/A files?
description: How can I generate PDF/A files?
date: 2021-12-01 01:09:41 +0800
last_modified: 2025-12-10 16:43:15 +0800
---

# Addon

## How can I generate PDF/A files?

Dynamic Web TWAIN supports exporting documents as **PDF/A** starting from version **19.3**.
PDF/A is an archival format designed for long-term preservation. The following variants are supported:

### Supported PDF/A Versions

| PDF/A Variant |    Underlying PDF Version   |
|:-------------:|-----------------------------|
| `pdf/a-1b`    | **1.4** (default)           |
| `pdf/a-2b`    | **1.5** (default), 1.6, 1.7 |

### What’s the difference between PDF/A-1b and PDF/A-2b?
Although both variants ensure that documents can be reliably displayed in the future, they differ in terms of supported PDF features and compression options.
- PDF/A-1b
  - Uses the older PDF 1.4 specification.
  - **Does not support JPEG2000** or JBIG2 image compression.
  - Does not allow transparency.
  - May result in larger file sizes and more conversion restrictions.

- PDF/A-2b
  - Based on newer PDF versions (1.5–1.7).
  - Supports **JPEG2000**, JBIG2, transparency, and other modern PDF features.
  - Typically requires **fewer changes** to the source document.
  - Usually produces **smaller output** files.

**Recommendation:**
For most use cases, we recommend using **`pdf/a-2b`**.
It offers better compression support, fewer limitations, and higher compatibility with modern PDFs while still meeting archival requirements.

### Licensing Requirements
Dynamic Web TWAIN does not require any add-on license to **export** or generate PDF or PDF/A files. However, PDF Rasterizer add-on would be required when **loading** a PDF/PDF-A file that contains **text or vector graphics**.

You can programmatically check whether a file needs rasterization using [`IsRasterizationRequired()`](/_articles/info/api/Addon_PDF.md#israsterizationrequired):

```javascript
DWTObject.Addon.PDF.IsRasterizationRequired(path); // returns true or false
```

### Behavior and Defaults

- If you do not set `pdfaVersion`, the export uses standard PDF format (non-PDF/A).

- If you set `pdfaVersion` but forget to set `version`, or set a mismatched or incorrect PDF version, Dynamic Web TWAIN automatically falls back to a default PDF version:
  - `pdf/a-1b` → defaults to PDF `1.4`
  - `pdf/a-2b` → defaults to PDF `1.5`

### How to Export as PDF/A

Configure PDF output using [`Write.Setup()`](/_articles/info/api/Addon_PDF.md#writesetup) before calling any save function.

```javascript
DWTObject.Addon.PDF.Write.Setup({
    version: "1.5",          // [optional] 1.4 for "pdf/a-1b"; 1.5/1.6/1.7 for "pdf/a-2b"
    pdfaVersion: "pdf/a-2b"  // "pdf/a-1b" or "pdf/a-2b"
});
```

After configuring `pdfaVersion`, all APIs that output PDF files will automatically generate PDF/A-compliant PDFs. This includes, but is not limited to:

- **Save APIs** like: [`SaveAsPDF()`](/_articles/info/api/WebTwain_IO.md#saveaspdf), [`SaveSelectedImagesAsMultiPagePDF()`](/_articles/info/api/WebTwain_IO.md#saveselectedimagesasmultipagepdf), [`SaveAllAsPDF()`](/_articles/info/api/WebTwain_IO.md#saveallaspdf)

- **Conversion APIs** like: [`ConvertToBlob()`](/_articles/info/api/WebTwain_IO.md#converttoblob), [`ConvertToBase64()`](/_articles/info/api/WebTwain_IO.md#converttobase64)

- **Upload APIs** like: [`HTTPUpload()`](/_articles/info/api/WebTwain_IO.md#httpupload), [`FTPUpload()`](/_articles/info/api/WebTwain_IO.md#ftpupload), [`httpUploadBlob()`](/_articles/info/api/WebTwain_IO.md#httpuploadblob)

- **OCR Output APIs** like: [`SaveToPath()`](/_articles/info/api/Addon_OCR.md#savetopath), [`SaveAsBase64()`](/_articles/info/api/Addon_OCR.md#saveasbase64), [`SaveAsBlob()`](/_articles/info/api/Addon_OCR.md#saveasblob)
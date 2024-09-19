---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I import existing images or PDF documents using the Dynamic Web TWAIN SDK?
keywords: Dynamic Web TWAIN, Capture/ Image Source, import, exisiting images
breadcrumbText: Can I import existing images or PDF documents using the Dynamic Web TWAIN SDK?
description: Can I import existing images or PDF documents using the Dynamic Web TWAIN SDK?
permalink: /faq/import-existing-documents-or-images.html
---

# Capture/Image Source

## Can I import existing images or PDF documents using the Dynamic Web TWAIN SDK?

Yes, Dynamic Web TWAIN supports loading PNG, JPG, BMP, image-only PDF, and TIFF files. But if you need to support text-based PDF files, you also require the <a href="https://www.dynamsoft.com/web-twain/pdf-to-image-javascript/" target="_blank">PDF Rasterizer Addon</a>. See more <a href="{{site.indepth}}features/pdf.html#input" target="_blank">here</a>.

**Code snippet**

```javascript
var onSuccess = function() {
    console.log("Loaded a file successfully!");
};
var onFailure = function(errorCode, errorString) {
    console.log(errorString);
};
DWTObject.IfShowFileDialog = true;
// PDF Rasterizer Addon is used here to ensure text-based PDF support
DWTObject.Addon.PDF.SetReaderOptions({
    convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL,
    renderOptions:{
        renderAnnotations: true,
        resolution: 300,
    }
});

DWTObject.LoadImage();
```

---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Handle PDF
keywords: Dynamic Web TWAIN, Documentation, Handle PDF
breadcrumbText: Handle PDF
description: Dynamic Web TWAIN SDK Documentation Handle PDF Page
permalink: /extended-usage/pdf-processing.html
redirect_from:
    - /indepth/features/pdf.html
---

# Processing PDFs

PDFs are widely used in many and various industries, and presently are the only non-image file type that `Dynamic Web TWAIN` supports. In this next section, we will address all the input and output operations that allow the user to properly handle PDF files.

## Environment

* Supported on [Desktop]({{site.introduction}}system-requirements.html).

## Including the PDF addon 

To include the PDF addon, simply add a reference to the corresponding JavaScript file, included in the [resources folder]({{site.faq}}what-are-the-resources-files.html).

``` html
<script src="Resources/addon/dynamsoft.webtwain.addon.pdf.js"></script>
```

> If you are using the [dwt package](https://www.npmjs.com/package/dwt), the pdf addon is already included in the main JavaScript file ( `dynamsoft.webtwain.min.js` or `dynamsoft.webtwain.min.mjs` ) which means you can skip this step.

## Input

### Open an image-only PDF file

When loading in a PDF file, `Dynamic Web TWAIN` tries to extract images from that file, which is why the SDK can handle image-based PDF documents by default. 

### Open a searchable PDF file

However, most existing PDF files contain much more than just images. For image-and-text PDF files, we need to make use of the PDF Rasterizer (`PDFR` for short), the main component of the PDF addon.

> How PDFR works: As the name suggests, `PDFR` rasterizes a PDF file page by page much like a scanner. You set a resolution, and you get the resulting images in that resolution after the rasterization. 

The following code shows the basic usage

``` javascript
var onSuccess = function() {
    console.log("Loaded a file successfully!");
};
var onFailure = function(errorCode, errorString) {
    console.log(errorString);
};
DWTObject.IfShowFileDialog = true;
// PDF Addon is used here to ensure text-based PDF support
DWTObject.Addon.PDF.SetReaderOptions({
    convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL,
    renderOptions:{
        renderAnnotations: true;
    }
});
DWTObject.LoadImageEx("", Dynamsoft.DWT.EnumDWT_ImageType.IT_ALL, onSuccess, onFailure);
```

The method [ `SetReaderOptions()` ]({{site.info}}api/Addon_PDF.html#setreaderoptions) configures how a PDF will be rasterized when being loaded into Dynamic Web TWAIN.

#### Other methods

* [ `GetReaderOptions()` ]({{site.info}}api/Addon_PDF.html#getreaderoptions): This method returns the current [`ReaderOptions`]({{site.info}}/api/interfaces.html#readeroptions).

## Output as PDF

### Save images as image-based PDFs

`Dynamic Web TWAIN` can output one or multiple images in the buffer as image-based PDF file(s). This feature is built into the core module, and no addon is required as was covered in the [output]({{site.indepth}}features/output.html) section.

### PDF save settings

However, some advanced features are only possible with the help of the PDF addon. At present, that means configuring the resulting file(s) with the API [ `Write.Setup()` ]({{site.info}}api/Addon_PDF.html#writesetup) as shown below

``` javascript
DWTObject.Addon.PDF.Write.Setup({
    author: "Dynamsoft-Support-Team",
    compression: Dynamsoft.DWT.EnumDWT_PDFCompressionType.PDF_JP2000,
    pageType:Dynamsoft.DWT.EnumPDF_Page_A4,
    creator: "DWT",
    creationDate: "D:20200930",
    keyWords: "TWAIN, DWT, Dynamsoft",
    modifiedDate: "D:20200930",
    producer: "Dynamsoft Corporation",
    subject: "Demoing File",
    title: "Sample PDF Made by DWT",
    version: 1.5,
    quality: 80
});
DWTObject.IfShowFileDialog = true;
DWTObject.SaveAllAsPDF(' ', function() {}, function() {})
```

From version 18.5, `Dynamic Web TWAIN` supports the generation of encrypted PDF files. For example,

``` javascript
DWTObject.Addon.PDF.Write.Setup({
    author: "Dynamsoft-Support-Team",
    compression: Dynamsoft.DWT.EnumDWT_PDFCompressionType.PDF_JP2000,
    pageType:Dynamsoft.DWT.EnumPDF_Page_A4,
    creator: "DWT",
    creationDate: "D:20200930",
    keyWords: "TWAIN, DWT, Dynamsoft",
    modifiedDate: "D:20200930",
    producer: "Dynamsoft Corporation",
    subject: "Demoing File",
    title: "Sample PDF Made by DWT",
    version: 1.5,
    quality: 80,
    password: "dwtpassword"
});
DWTObject.IfShowFileDialog = true;
DWTObject.SaveAllAsPDF(' ', function() {}, function() {})
```

When you set a password prior to generating a PDF file, that password becomes necessary each time you attempt to open the file thereafter. The password does not restrict the usage permissions of the PDF. The encryption algorithm utilized is AES256, ensuring robust security measures.

Note: Only the core module license is required to use this method.

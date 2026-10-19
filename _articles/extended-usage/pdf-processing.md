---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Handle PDF
keywords: Dynamic Web TWAIN, Documentation, Handle PDF
breadcrumbText: Handle PDF
description: Dynamic Web TWAIN SDK Documentation Handle PDF Page
---

# Processing PDFs

In this next section, we will address all the input and output operations that allow the user to properly handle PDF files.

## Environment

* Supported on [Desktop](/_articles/introduction/system-requirements.md).

## Including the PDF addon 

To include the PDF addon, simply add a reference to the corresponding JavaScript file, included in the [resources folder](/_articles/faq/what-are-the-resources-files.md).

``` html
<script src="Resources/addon/dynamsoft.webtwain.addon.pdf.js"></script>
```

> If you are using the [dwt package](https://www.npmjs.com/package/dwt), the pdf addon is already included in the main JavaScript file ( `dynamsoft.webtwain.min.js` or `dynamsoft.webtwain.min.mjs` ) which means you can skip this step.

## Input

### Open an image-only PDF file

If the PDF file only has one image per page, it can load the file by extracting the images. Most of the PDF files are scanned documents.

### Open a PDF file with more than images

If the PDF file is not pure image, we need to make use of the PDF Rasterizer (`PDFR` for short) to render the PDF first.

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

The method [`SetReaderOptions()`](/_articles/info/api/Addon_PDF.md#setreaderoptions) configures how a PDF will be rasterized when being loaded into Dynamic Web TWAIN.

#### Other methods

* [`GetReaderOptions()`](/_articles/info/api/Addon_PDF.md#getreaderoptions): This method returns the current [`ReaderOptions`](/_articles/info/api/interfaces.md#readeroptions).

## Output as PDF

### Save images as image-based PDFs

`Dynamic Web TWAIN` can output one or multiple images in the buffer as image-based PDF file(s). This feature is built into the core module, and no addon is required as was covered in the [output](/_articles/general-usage/image-export/index.md) section.

### PDF save settings

However, some advanced features are only possible with the help of the PDF addon. At present, that means configuring the resulting file(s) with the API [ `Write.Setup()` ](/_articles/info/api/Addon_PDF.md#writesetup) as shown below

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

## Append Pages to a PDF

If you need to append a scanned document to a PDF file and keep the rest pages unmodified. You can use the following code to read a PDF file by setting the `preserveUnmodifiedOnSave` property to `true`.

```js
DWTObject.Addon.PDF.SetReaderOptions({
  convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL,
  preserveUnmodifiedOnSave: true, //only available for v19.0+
  renderOptions:{
    renderAnnotations: true //enable this to keep annotations
  }
});
```

Then, it will keep the unmodified pages in the PDF file instead of converting them to images when saving a new PDF file with the scanned documents.

## PDF/A

PDF/A is a version of PDF specialized for use in the archiving and long-term preservation of electronic documents. For example, it does not allow using external fonts, which will change the appearance if opening it on another device.

Starting from Web TWAIN v19.3, it can save PDF as PDF/A by specifying `pdfaVersion` in [`PDFWSettings`](/_articles/info/api/interfaces.md#pdfwsettings). The supported PDF/A standards are PDF/A-1b, PDF/A-2b and PDF/A-3b.

Here is the code to do this:

```js
DWTObject.Addon.PDF.Write.Setup({
    pdfaVersion:"pdf/a-1b"
});
DWTObject.IfShowFileDialog = true;
DWTObject.SaveAllAsPDF(' ', function() {}, function() {})
```


PDF/A-1b, PDF/A-2b and PDF/A-3b are basic conformance level standards. PDF/A-1b is based on PDF version 1.4, while PDF/A-2b and PDF/A-3b are based on PDF version 1.7.

| Feature | PDF/A-1b | PDF/A-2b | PDF/A-3b |
|---------|----------|----------|----------|
| Based on PDF version | 1.4 | 1.7 | 1.7 |
| JPEG 2000 image compression | - | ✓ | ✓ |
| Transparency effects and layers | - | ✓ | ✓ |
| Embedding OpenType fonts | - | ✓ | ✓ |
| PAdES digital signatures | - | ✓ | ✓ |
| Embedding PDF/A files | - | ✓ | ✓ |
| Embedding files of any format (e.g. XML) | - | - | ✓ |

PDF/A-3b has all the features of PDF/A-2b and additionally allows embedding files of any format (such as XML data) as attachments. It is recommended to use PDF/A-2b because of the support for more features than PDF/A-1b, and use PDF/A-3b only if you need to attach non-PDF files.

Related FAQ:

* [How can I generate PDF/A files?](/_articles/faq/generate-pdf-files.md)
* [How can I load PDF/A files into the Dynamic Web TWAIN SDK?](/_articles/faq/load-pdf-files.md)

## Licensing

Loading a PDF file that is not pure image requires the `PDF Rasterizer` license in addition to the core module license, because the PDF must be rasterized first. Other PDF operations, such as loading image-only PDFs or saving images as PDFs, only require the core module license.

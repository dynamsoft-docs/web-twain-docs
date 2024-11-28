---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Exporting Locally
keywords: Dynamic Web TWAIN, Documentation, save, output, export, web, download, local save, local, save to file, print
breadcrumbText: Exporting Locally
description: Dynamic Web TWAIN SDK Documentation Local Export
permalink: /general-usage/image-export/local-export.html
redirect_from: /indepth/features/output.html#save
---

# Exporting Locally

> Prerequisite: [DWT Initialization]({{site.general-usage}}initialization.html)<br/>
> Prerequisite: [Managing the Image Buffer]({{site.general-usage}}image-processing/buffer-management.html)

DWT offers several methods to save images from the `WebTwain` image buffer locally. This includes saving the images to files on the end user's file system, exporting from the image buffer to binary Blobs and Base64 strings, and also printing to connected printers.

## Saving Locally

The `WebTwain` image buffer can output images directly to disk, and supports `BMP` , `JPG` , `TIF` , `PNG` and `PDF` formats. Of note, `TIF` and `PDF` come with multi-image support. Learn more about supported file formats [here]({{site.getstarted}}filetype.html).

Each file format has its own file saving API, as shown here:

- [`SaveAsBMP()`]({{site.api}}WebTwain_IO.html#saveasbmp)
- [`SaveAsJPEG()`]({{site.api}}WebTwain_IO.html#saveasjpeg)
- [`SaveAsPDF()`]({{site.api}}WebTwain_IO.html#saveaspdf)
- [`SaveAsPNG()`]({{site.api}}WebTwain_IO.html#saveaspng)	
- [`SaveAsTIFF()`]({{site.api}}WebTwain_IO.html#saveastiff)
- [`SaveSelectedImagesAsMultiPagePDF()`]({{site.api}}WebTwain_IO.html#saveselectedimagesasmultipagepdf)
- [`SaveSelectedImagesAsMultiPageTIFF()`]({{site.api}}WebTwain_IO.html#saveselectedimagesasmultipagetiff)
- [`SaveAllAsPDF()`]({{site.api}}WebTwain_IO.html#saveallaspdf)
- [`SaveAllAsMultiPageTIFF()`]({{site.api}}WebTwain_IO.html#saveallasmultipagetiff)

Note that multi-page saving requires separate APIs from their single page counterparts.

## Exporting to Binary

The image buffer can export images as Blobs or Base64 strings, which are useful for processing images outside of DWT, whether for [custom image upload logic]({{site.general-usage}}image-export/server-upload.html), or other purposes within the web application.

### Exporting to Blob

[`ConvertToBlob()`]({{site.api}}WebTwain_IO.html#ConvertToBlob) converts selected images to a Blob, as demonstrated here:

``` javascript
DWTObject.ConvertToBlob(
    [0, 1, 2],
    Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
    function(result, indices, type) {
        console.log(result.size);
    },
    function(errorCode, errorString) {
        console.log(errorString);
    }
);
```

APIs used:

- [`ConvertToBlob()`]({{site.api}}WebTwain_IO.html#ConvertToBlob)
- [`Dynamsoft.DWT.EnumDWT_ImageType`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype)

Here, `ConvertToBlob()` takes a zero-indexed array of image indices (of the image buffer) which indicates the images it exports, and uses the [`Dynamsoft.DWT.EnumDWT_ImageType`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype) enum to specify the file format (in this case, single-page PDF). Just as when saving to files locally, use the dedicated multi-page enums when saving multi-page `PDF`s and `TIF`s.

The Blob accessible through the `result` argument of the success callback. 

### Exporting to Base64 String

Likewise, [`ConvertToBase64()`]({{site.api}}WebTwain_IO.html#converttobase64) outputs a Base64 string:

``` javascript
DWTObject.ConvertToBase64(
    [0, 1, 2],
    Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
    function(result, indices, type) {
        console.log(result.getData(0, result.getLength()));
    },
    function(errorCode, errorString) {
        console.log(errorString);
    }
);
```
APIs used:

- [`ConvertToBase64()`]({{site.api}}WebTwain_IO.html#converttobase64)
- [`Dynamsoft.DWT.EnumDWT_ImageType`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype)

The Base 64 string accessible through the `result` argument of the success callback. Note that this is a [Base64Result]({{site.api}}Interfaces.html#base64result) object.

## Print

Finally, DWT can also print directly to a printer through the [ `Print()` ]({{site.api}}WebTwain_IO.html#print) API. This API brings all images from the image buffer into the browser's print dialog. Alternatively, while running in Windows Service Mode, the API can also take an argument to use the Windows OS print dialog instead.
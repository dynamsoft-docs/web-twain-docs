---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Exporting Locally
keywords: Dynamic Web TWAIN, Documentation, save, output, export, web, download, local save, local, save to file, print
breadcrumbText: Exporting Locally
description: Dynamic Web TWAIN SDK Documentation Local Export
---

# Exporting Locally

> Prerequisite: [DWT Initialization](/_articles/general-usage/initialization.md)<br/>
> Prerequisite: [Managing the Image Buffer](/_articles/general-usage/image-processing/buffer-management.md)

DWT offers several methods to save images from the `WebTwain` image buffer locally. This includes saving the images to files on the end user's file system, exporting from the image buffer to binary Blobs and Base64 strings, and also printing to connected printers.

## Saving Locally

The `WebTwain` image buffer can output images directly to disk, and supports `BMP` , `JPG` , `TIF` , `PNG` and `PDF` formats. Of note, `TIF` and `PDF` come with multi-image support. Learn more about supported file formats [here]({{site.getstarted}}filetype.html).

Each file format has its own file saving API, as shown here:

- [`SaveAsBMP()`](/_articles/info/api/WebTwain_IO.md#saveasbmp)
- [`SaveAsJPEG()`](/_articles/info/api/WebTwain_IO.md#saveasjpeg)
- [`SaveAsPDF()`](/_articles/info/api/WebTwain_IO.md#saveaspdf)
- [`SaveAsPNG()`](/_articles/info/api/WebTwain_IO.md#saveaspng)	
- [`SaveAsTIFF()`](/_articles/info/api/WebTwain_IO.md#saveastiff)
- [`SaveSelectedImagesAsMultiPagePDF()`](/_articles/info/api/WebTwain_IO.md#saveselectedimagesasmultipagepdf)
- [`SaveSelectedImagesAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#saveselectedimagesasmultipagetiff)
- [`SaveAllAsPDF()`](/_articles/info/api/WebTwain_IO.md#saveallaspdf)
- [`SaveAllAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#saveallasmultipagetiff)

Note that multi-page saving requires separate APIs from their single page counterparts.

## Exporting to Binary

The image buffer can export images as Blobs or Base64 strings, which are useful for processing images outside of DWT, whether for [custom image upload logic](/_articles/general-usage/image-export/server-upload.md), or other purposes within the web application.

### Exporting to Blob

[`ConvertToBlob()`](/_articles/info/api/WebTwain_IO.md#ConvertToBlob) converts selected images to a Blob, as demonstrated here:

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

- [`ConvertToBlob()`](/_articles/info/api/WebTwain_IO.md#ConvertToBlob)
- [`Dynamsoft.DWT.EnumDWT_ImageType`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_imagetype)

Here, `ConvertToBlob()` takes a zero-indexed array of image indices (of the image buffer) which indicates the images it exports, and uses the [`Dynamsoft.DWT.EnumDWT_ImageType`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_imagetype) enum to specify the file format (in this case, single-page PDF). Just as when saving to files locally, use the dedicated multi-page enums when saving multi-page `PDF`s and `TIF`s.

The Blob accessible through the `result` argument of the success callback. 

### Exporting to Base64 String

Likewise, [`ConvertToBase64()`](/_articles/info/api/WebTwain_IO.md#converttobase64) outputs a Base64 string:

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

- [`ConvertToBase64()`](/_articles/info/api/WebTwain_IO.md#converttobase64)
- [`Dynamsoft.DWT.EnumDWT_ImageType`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_imagetype)

The Base 64 string accessible through the `result` argument of the success callback. Note that this is a [Base64Result](/_articles/info/api/interfaces.md#base64result) object.

## Print

Finally, DWT can also print directly to a printer through the [ `Print()` ](/_articles/info/api/WebTwain_IO.md#print) API. This API brings all images from the image buffer into the browser's print dialog. Alternatively, while running in Windows Service Mode, the API can also take an argument to use the Windows OS print dialog instead.
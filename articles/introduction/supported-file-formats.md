---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Supported File Formats
keywords: Dynamic Web TWAIN, Documentation, File Types, File Formats
breadcrumbText: Supported File Formats
description: Dynamic Web TWAIN SDK Documentation File Types Page
permalink: /introduction/supported-file-formats.html
---

# Supported File Formats

Dynamic Web TWAIN supports the following file types:

## BMP

**BMP** is an uncompressed image format. Such a file is huge because of the lack of compression. A lower limit on storage size for a n-bit-per-pixel bitmap, in bytes, can be calculated as:

``` 
size = width * height * n/8; // where height and width are given in pixels
```

For example, a US Letter sized paper scanned in 300 DPI and in colour has the size of (8.5 * 300) * (11 * 300) * 24 / 8 = 25, 245, 000 bytes which is close to 24 MB.

## JPEG

The **JPEG** format supports eight-bit grayscale images and 24-bit color images (eight bits each for red, green, and blue). Black & white image data which is 1-bit can not be saved in this format.

This format applies lossy compression to images, which can result in a significant reduction of the file size. Applications can determine the degree of compression to apply, and the amount of compression affects the visual quality of the result. `Dynamic Web TWAIN` uses the API [ `JPEGQuality` ]({{site.info}}api/WebTwain_IO.html#jpegquality) to control this.

> NOTE
>  
> The API `JPEGQuality` affects the degree of compression of the file as long as it uses the **JPEG** compression type. In other words, a TIFF file or a PDF file using **JPEG** compression will also be affected.

## TIFF

Compared with **BMP** and **JPEG** , the **TIFF** format is more like a container that holds image(s) and data in a single file. A TIFF file uses tags to describe the data it holds so that applications know how to read it. `Dynamic Web TWAIN` allows custom tags with the APIs  [ `ClearTiffCustomTag()` ]({{site.info}}api/WebTwain_IO.html#cleartiffcustomtag) and [ `SetTiffCustomTag()` ]({{site.info}}api/WebTwain_IO.html#settiffcustomtag).

**TIFF** also allows multiple images in the same file. `Dynamic Web TWAIN` controls this with the API [ `IfTiffMultiPage` ]({{site.info}}api/WebTwain_IO.html#iftiffmultipage).

## PNG

The **PNG** format supports lossless data compression. The same image may save bigger as a `.png` than a `.jpg` but it preserves all information.

## PDF

The **PDF** format is an advanced and popular file format that allows a variety of content. Because of the complexity of the format, it is impractical for a lightweight SDK such as `Dynamic Web TWAIN` to have full support for it. Instead, `Dynamic Web TWAIN` supports the format in two ways

* `Dynamic Web TWAIN` can read and write a pure-image-based **PDF** file; 
* `Dynamic Web TWAIN` can use its [PDF Rasterizer module]({{site.extended-usage}}pdf-processing.html) to rasterize almost any **PDF** file and convert its visible content into images so as to "read" it.

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I reduce the size of documents in PDF, TIFF or JPEG format?
keywords: Dynamic Web TWAIN, Document Saving, smallest size document
breadcrumbText: How can I reduce the size of documents in PDF, TIFF or JPEG format?
description: How can I reduce the size of documents in PDF, TIFF or JPEG format?
---

# Document Saving

## How can I reduce the size of documents in PDF, TIFF or JPEG format?

There are a few things that you can try to reduce the size of a resulting file

- Scan in grayscale or black & white instead of RGB;

- Convert the images to grayscale or black & white before the save or upload call. Read more [here](/_articles/general-usage/image-processing/index.md#working-with-pixels-and-bit-depth){:target="_blank"};

- Scan in a lower resolution;

- Convert the images to a lower resolution (DPI). Read more [here](/_articles/general-usage/image-processing/index.md#working-with-pixels-and-bit-depth){:target="_blank"};

- [Optional] If the resulting file is in the JPEG format (.jpg) or is a TIF or PDF that is encoded by the JPEG standard, you can set [JPEGQuality](/_articles/info/api/WebTwain_IO.md#jpegquality){:target="_blank"} to a lower value.

    - Save in PDF format (No PDF Rasterizer Addon license is required for this API),

    ```javascript
    DWTObject.Addon.PDF.Write.Setup({compression: Dynamsoft.DWT.EnumDWT_PDFCompressionType.PDF_JPEG, quality: 20});
    //or set DWTObject.Addon.PDF.Write.Setup({compression: 5, quality: 20}); which is equivalent.
    ```

    ```html
    <!--Note: if you are using this method, you need to include dynamsoft.webtwain.addon.pdf.js file into the program. For example:-->
    <script type="text/javascript" src="Resources/addon/dynamsoft.webtwain.addon.pdf.js"> </script>
    ```

    - Save in TIF format,

    ```javascript
    DWTObject.TIFFCompressionType = Dynamsoft.DWT.EnumDWT_TIFFCompressionType.TIFF_JPEG;
    //or set DWTObject.TIFFCompressionType = 7 which is equivalent.
    DWTObject.JPEGQuality = 20;
    ```

    - Save in JPEG format.

    ```javascript
    DWTObject.JPEGQuality = 20;
    ```
        
  **Note that black & white image cannot be saved in the JPEG format. To reduce the size, please convert the image to grayscale.**

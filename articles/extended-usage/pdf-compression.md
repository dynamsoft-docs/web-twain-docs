---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - PDF Compressor (Beta)
keywords: Dynamic Web TWAIN, Documentation, PDF Compressor
breadcrumbText: PDF Compressor (Beta)
description: Dynamic Web TWAIN SDK Documentation PDF Compressor
permalink: /extended-usage/pdf-compression.html
---

# PDF Compressor (Beta)

> Starting from version 18.3

PDF Compressor is a new PDF compression technology which may help reduce the resulting file size when saving images as a PDF file. This technology is based on Dynamsoft's proprietary color clustering algorithms. 
Color clustering uses operates using the RGB value of each pixel in the image to cluster similarly colored pixels.

> This feature is only available for color or gray-scale images and requires a PDF Compressor module license.

## How to achieve high-quality compression
### Select sharp simple images
For best file fidelity post compression, please images that have the following attributes:

- High contrast,
- Less color variety,
- Concentrated distribution of similar colors,
- With low complexity graphics,

### Things to keep in mind

- If the contrast between the text in the picture and the background is not high, and the weight of the text is not heavy, text may be incomplete or thin after compression.
- If the source image contains complex graphics, the quality of the resulting compressed graphics may deteriorate.

## Sample Demo

To preview this feature, please see <a href="https://demo.dynamsoft.com/Samples/dwt/PDF-Compressor/PDF-Compressor.html" target="_blank">this demo</a>. Please <a href="https://www.dynamsoft.com/company/customer-service/#contact" target="_blank">contact us</a> if you have any feedback or suggestions.

## How to enable this feature in your code

**Code snippet**

```typescript
DWTObject.Addon.PDF.Write.Setup({
  docCompressor: {
    enabled: true, //Enable PDF Compressor
  },
});
//Save PDF file to local disk
DWTObject.SaveAllAsPDF(
  "testmrc.pdf", //File Name
  function () {
    console.log("successful.");
  },
  function (errorCode, errorString) {
    console.log(errorString);
  }
);
```

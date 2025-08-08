---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Only 24-bit true color bmp and 8-bit gray-scaled images are supported for JPEG compression
keywords: Dynamic Web TWAIN, Error Troubleshooting, jpeg, 24-bit, 8-bit
breadcrumbText: Only 24-bit true color bmp and 8-bit gray-scaled images are supported for JPEG compression
description: Only 24-bit true color bmp and 8-bit gray-scaled images are supported for JPEG compression
date: 2020-12-10 16:11:49 +0800
last_modified: 2024-09-19 08:47:35 +0800
---

# Error Troubleshooting

## Only 24-bit true color bmp and 8-bit gray-scaled images are supported for JPEG compression

### Symptom

When you save or upload an image as a JPEG file, you may receive the error.

### Cause

You are saving a black and white image as a JPEG file but JPEG standard only allows the compression of grayscale and RGB images.

### Resolution

Make sure the pixel type of the image in the buffer is Gray or RGB. If it is not, you can either save it in another format or convert the image to grayscale using the method [ConvertToGrayScale()](/_articles/info/api/WebTwain_Edit.md#converttograyscale).

```javascript
if ( /*If save in JPEG*/ ) {

    //Check whether the current image is B&W
    //1 is B&W, 8 is Gray, 24 is RGB
    if (DWTObject.GetImageBitDepth(DWTObject.CurrentImageIndexInBuffer) == 1)
        //If so, convert the image to Gray
        DWTObject.ConvertToGrayScale(DWTObject.CurrentImageIndexInBuffer);
    //Save image in JPEG
    DWTObject.SaveAsJPEG("DynamicWebTWAIN.jpg", DWTObject.CurrentImageIndexInBuffer);

}
```

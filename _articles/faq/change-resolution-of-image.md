---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I change the resolution/DPI of an image in the viewer?
keywords: Dynamic Web TWAIN, Image Editing, change resolution
breadcrumbText: Can I change the resolution/DPI of an image in the viewer?
description: Can I change the resolution/DPI of an image in the viewer?
---

# Image Editing

## Can I change the resolution/DPI of an image in the viewer?

You can use the [Resolution](/_articles/info/api/WebTwain_Acquire.md#resolution){:target="_blank"} property to check the resolution while acquiring an image. To change the resolution/DPI in the viewer, you can use the following methods:

[DWTObject.SetDPI()](/_articles/info/api/WebTwain_Edit.md#setdpi){:target="_blank"} // Changes the DPI (dots per inch) of the specified image depending on the input resolution parameters

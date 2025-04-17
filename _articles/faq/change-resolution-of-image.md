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

You can use the <a href="/web-twain/docs/info/api/WebTwain_Acquire.html#resolution" target="_blank">Resolution</a> property to check the resolution while acquiring an image. To change the resolution/DPI in the viewer, you can use the following methods:

<a href="/web-twain/docs/info/api/WebTwain_Edit.html#setdpi" target="_blank">DWTObject.SetDPI()</a> // Changes the DPI (dots per inch) of the specified image depending on the input resolution parameters

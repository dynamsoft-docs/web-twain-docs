---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I print images from the viewer?
keywords: Dynamic Web TWAIN, Image Viewer, print
breadcrumbText: Can I print images from the viewer?
description: Can I print images from the viewer?
---

# Image Viewer

## Can I print images from the viewer?

Yes, you can print the images from the viewer by exporting all image data in the buffer to a new browser window and use the browser's default feature to print images. This can be achieved by using the <a href="/web-twain/docs/info/api/WebTwain_IO.html#print" target="_blank">Print</a> API.
Note: The Print API prints all the images on the viewer, you can use <a href="/web-twain/docs/info/api/WebTwain_IO.html#printex" target="_blank">PrintEx</a> to print only selected images.

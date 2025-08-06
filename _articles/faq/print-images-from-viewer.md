---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I print images from the viewer?
keywords: Dynamic Web TWAIN, Image Viewer, print
breadcrumbText: Can I print images from the viewer?
description: Can I print images from the viewer?
date: 2021-12-09 11:34:50 +0800
---

# Image Viewer

## Can I print images from the viewer?

Yes, you can print the images from the viewer by exporting all image data in the buffer to a new browser window and use the browser's default feature to print images. This can be achieved by using the [Print](/_articles/info/api/WebTwain_IO.md#print){:target="_blank"} API.
Note: The Print API prints all the images on the viewer, you can use [PrintEx](/_articles/info/api/WebTwain_IO.md#printex){:target="_blank"} to print only selected images.

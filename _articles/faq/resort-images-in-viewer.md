---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I reorder images in the viewer?
keywords: Dynamic Web TWAIN, Image Viewer, reorder images
breadcrumbText: How can I reorder images in the viewer?
description: How can I reorder images in the viewer?
---

# Image Viewer

## How can I reorder images in the viewer?

You can easily reorder the images in the viewer. You may drag and drop the images in the order you want them to appear. This process will trigger the inbuilt callback event <a href="/web-twain/docs/info/api/WebTwain_Buffer.html#onindexchangedragdropdone" target="_blank">OnIndexChangeDragDropDone</a>.
You can also reorder the images by using the method <a href="/web-twain/docs/info/api/WebTwain_Buffer.html#switchimage" target="_blank">SwitchImage(index1, index2)</a>.

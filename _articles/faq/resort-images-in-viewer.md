---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I reorder images in the viewer?
keywords: Dynamic Web TWAIN, Image Viewer, reorder images
breadcrumbText: How can I reorder images in the viewer?
description: How can I reorder images in the viewer?
date: 2021-12-09 11:34:50 +0800
last_modified: 2022-06-10 04:40:03 +0800
---

# Image Viewer

## How can I reorder images in the viewer?

You can easily reorder the images in the viewer. You may drag and drop the images in the order you want them to appear. This process will trigger the inbuilt callback event [OnIndexChangeDragDropDone](/_articles/info/api/WebTwain_Buffer.md#onindexchangedragdropdone){:target="_blank"}.
You can also reorder the images by using the method [SwitchImage(index1, index2)](/_articles/info/api/WebTwain_Buffer.md#switchimage){:target="_blank"}.

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I remove only the selected images?
keywords: Dynamic Web TWAIN, Image Editing, remove selected images, remove specific images
breadcrumbText: How can I remove only the selected images?
description: How can I remove only the selected images?
---

# Image Editing

## How can I remove only the selected images?

- You can remove the selected images by first selecting the images from the buffer by using the command -

<a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Buffer.html?ver=latest#selectimages" target="_blank">DWObject.SelectImages([0, 1, 2]);</a> // This command selects the first 3 images from the buffer, you can pass the indices of the images you want to select as the argument to this method.

- As the second step, invoke the remove command to delete the selected images.

<a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Buffer.html?ver=latest#removeallselectedimages" target="_blank">DWObject.RemoveAllSelectedImages();</a> // This command will remove all the images that were selected in first step.

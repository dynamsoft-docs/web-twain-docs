---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I save selected images instead of all images to my server or database?
keywords: Dynamic Web TWAIN, Document Saving, save selected images
breadcrumbText: How can I save selected images instead of all images to my server or database?
description: How can I save selected images instead of all images to my server or database?
---

# Document Saving

## How can I save selected images instead of all images to my server or database?

The API [SelectedImagesIndices](/_articles/info/api/WebTwain_Buffer.md#selectedimagesindices){:target="_blank"} returns the indices of the selected images.

You can pass those indices as a parameter to [HTTPUpload](/_articles/info/api/WebTwain_IO.md#httpupload){:target="_blank"} which uploads files to the server/database.

To upload all images in the buffer with HTTPUpload, you can use the API [SelectAllImages](/_articles/info/api/WebTwain_Buffer.md#selectallimages){:target="_blank"} which returns the indices of all images.

There are other HTTP upload APIs that can achieve the same. Please refer to this link: [Dynamic Web TWAIN API Reference - IO APIs](/_articles/info/api/WebTwain_IO.md#output){:target="_blank"}

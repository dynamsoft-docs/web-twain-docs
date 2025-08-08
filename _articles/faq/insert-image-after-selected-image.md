---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I insert an image after a selected image in the viewer?
keywords: Dynamic Web TWAIN, Image Viewer, insert after selected image, insert
breadcrumbText: How can I insert an image after a selected image in the viewer?
description: How can I insert an image after a selected image in the viewer?
date: 2021-12-09 11:34:50 +0800
last_modified: 2024-09-19 08:47:35 +0800
---

# Image Viewer

## How can I insert an image after a selected image in the viewer?

By default, when you scan or load images, they are appended to the end of the image array in buffer. However, in some business scenarios, the user may want to insert these new images to a specified index. Unfortunately, Dynamic Web Twain does not provide a native method for that. The following code snippet shows how this functionality can be implemented.

<strong>1. Insert when acquiring</strong>

```javascript
function acquireToIndex(index) {
  DWTObject.IfAppendImage = false;
  DWTObject.CurrentImageIndexInBuffer = index;
  DWTObject.RegisterEvent("OnPostTransfer", function () {
    DWTObject.CurrentImageIndexInBuffer++;
  });
  DWTObject.RegisterEvent("OnPostAllTransfers", function () {
    DWTObject.IfAppendImage = true;
  });
  DWTObject.AcquireImage();
}
```

<strong>2. Insert when loading</strong>

```javascript
function loadToIndex(index) {
  var oldCount = DWTObject.HowManyImagesInBuffer;
  DWTObject.RegisterEvent("OnPostLoad", function () {
    var newCount = DWTObject.HowManyImagesInBuffer;
    for (var j = 0; j < newCount - oldCount; j++)
      DWTObject.MoveImage(oldCount + j, index + j);
  });
  DWTObject.LoadImageEx("", 5);
}
```

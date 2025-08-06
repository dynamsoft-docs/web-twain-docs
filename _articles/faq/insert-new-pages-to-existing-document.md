---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I insert newly scanned pages to an existing document?
keywords: Dynamic Web TWAIN, Document Saving, insert new page to existing document
breadcrumbText: Can I insert newly scanned pages to an existing document?
description: Can I insert newly scanned pages to an existing document?
date: 2021-11-29 18:33:59 +0800
---

# Document Saving

## Can I insert newly scanned pages to an existing document?

By default, when you scan or load images, they are appended to the end of the image array in buffer. However, in some business scenarios, the user may want to insert these new images to a specified index.  

Unfortunately, Dynamic Web TWAIN does not provide a native method for that, but you can utilize the property [IfAppendImage](/_articles/info/api/WebTwain_Acquire.md#ifappendimage){:target="_blank"} to achieve it. You can load some images from your local disk first, and then acquire images from your device with IfAppendImage set to 'false'. 

The following code snippet shows how it can be done.

<strong>Insert when acquiring</strong>

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

<strong>Insert when loading</strong>

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

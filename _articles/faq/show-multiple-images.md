---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I show multiple images at a time?
keywords: Dynamic Web TWAIN, Image Viewer, show multiple images
breadcrumbText: How can I show multiple images at a time?
description: How can I show multiple images at a time?
---

# Image Viewer

## How can I show multiple images at a time?

You can use the [setViewMode](/_articles/info/api/WebTwain_Viewer.md#setviewmode){:target="_blank"} API to show multiple images at a time in the viewer.

Example:

```javascript
// display 6 images at a time in 2 columns and 3 rows
DWTObject.Viewer.setViewMode(2, 3);
```

![Show multiple images](/assets/imgs/show-multiple-Images.png)

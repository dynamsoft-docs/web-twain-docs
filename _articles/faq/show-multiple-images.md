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

You can use the <a href="/web-twain/docs/info/api/WebTwain_Viewer.html#setviewmode" target="_blank">setViewMode</a> API to show multiple images at a time in the viewer.

Example:

```javascript
// display 6 images at a time in 2 columns and 3 rows
DWTObject.Viewer.setViewMode(2, 3);
```

![Show multiple images]({{site.assets}}imgs/show-multiple-Images.png)

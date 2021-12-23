---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I disable drag and drop images in the viewer?
keywords: Dynamic Web TWAIN, Image Viewer, object defined
breadcrumbText: How can I disable drag and drop images in the viewer?
description: How can I disable drag and drop images in the viewer?
---

# Image Viewer

## How can I disable drag and drop images in the viewer?

You can leverage the inbuilt api - <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Viewer.html?ver=latest#acceptdrop" target="_blank">acceptDrop</a> to disable the load functionality of the dropped images in the viewer.

```javascript
DWObject.Viewer.acceptDrop = true;
```

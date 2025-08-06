---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I disable drag and drop images in the viewer?
keywords: Dynamic Web TWAIN, Image Viewer, object defined
breadcrumbText: How can I disable drag and drop images in the viewer?
description: How can I disable drag and drop images in the viewer?
date: 2021-12-09 11:34:50 +0800
---

# Image Viewer

## How can I disable drag and drop images in the viewer?

You can leverage the inbuilt API [acceptDrop](/_articles/info/api/WebTwain_Viewer.md#acceptdrop){:target="_blank"} to disable the load functionality of the dropped images in the viewer.

```javascript
DWTObject.Viewer.acceptDrop = false;
```

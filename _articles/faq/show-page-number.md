---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I show page number on each image?
keywords: Dynamic Web TWAIN, Image Viewer, show , page number
breadcrumbText: How can I show page number on each image?
description: How can I show page number on each image?
date: 2025-04-17 17:43:22 +0800
---

# Image Viewer

## How can I show page number on each image?

You can set the [showPageNumber](/_articles/info/api/WebTwain_Viewer.md#showpagenumber){:target="_blank"} API to true to show the page number. 

```javascript
DWTObject.Viewer.showPageNumber = true;
```

**Note**: When [setViewMode](/_articles/info/api/WebTwain_Viewer.md#setviewmode){:target="_blank"} is set to -1 by -1 or [singlePageMode](/_articles/info/api/WebTwain_Viewer.md#singlepagemode){:target="_blank"} is true then this api will not work.

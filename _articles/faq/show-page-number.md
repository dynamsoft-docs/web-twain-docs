---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I show page number on each image?
keywords: Dynamic Web TWAIN, Image Viewer, show , page number
breadcrumbText: How can I show page number on each image?
description: How can I show page number on each image?
date: 2025-04-17 17:43:22 +0000
last_modified: 2026-07-29 08:01:45 +0000
---

# Image Viewer

## How can I show page number on each image?

You could configure the `visibility` property to `true` with the [updatePageNumberStyle](/_articles/info/api/WebTwain_Viewer.md#updatepagenumberstyle){:target="_blank"} API to show the page number.

```javascript
DWTObject.Viewer.updatePageNumberStyle({ visibility: "visible" });
```

**Note**: When [setViewMode](/_articles/info/api/WebTwain_Viewer.md#setviewmode){:target="_blank"} is set to -1 by -1 or [singlePageMode](/_articles/info/api/WebTwain_Viewer.md#singlepagemode){:target="_blank"} is true then this api will not work.

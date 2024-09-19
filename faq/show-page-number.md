---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I show page number on each image?
keywords: Dynamic Web TWAIN, Image Viewer, show , page number
breadcrumbText: How can I show page number on each image?
description: How can I show page number on each image?
permalink: /faq/show-page-number.html
---

# Image Viewer

## How can I show page number on each image?

You can set the <a href="{{site.info}}api/WebTwain_Viewer.html#showpagenumber" target="_blank">showPageNumber</a> API to true to show the page number. 

```javascript
DWTObject.Viewer.showPageNumber = true;
```

**Note**: When <a href="{{site.info}}api/WebTwain_Viewer.html#setviewmode" target="_blank">setViewMode</a> is set to -1 by -1 or <a href="{{site.info}}api/WebTwain_Viewer.html#singlepagemode" target="_blank">singlePageMode</a> is true then this api will not work.

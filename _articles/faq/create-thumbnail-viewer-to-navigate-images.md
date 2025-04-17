---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I create a thumbnail viewer to view images?
keywords: Dynamic Web TWAIN, Image Viewer, navigate images, thumbnail viewer
breadcrumbText: How can I create a thumbnail viewer to view images?
description: How can I create a thumbnail viewer to view images?
---

# Image Viewer

## How can I create a thumbnail viewer to view images?

You can create a thumbnail viewer by using the API <a href="/web-twain/docs/info/api/WebTwain_Viewer.html#createthumbnailviewer" target="_blank">createThumbnailViewer()</a>. You can either use the default settings or customize the viewer as shown below:

```javascript
// Use default settings
var objThumbnailViewer = DWTObject.Viewer.createThumbnailViewer();
objThumbnailViewer.background = "rgb(0,0,255)";
objThumbnailViewer.show();

// Customize the thumbnail viewer
var thumbnailViewerSettings = {
  location: "left",
  size: "30%",
  columns: 1,
  rows: 3,
  scrollDirection: "vertical", // 'horizontal'
  pageMargin: 10,
  background: "rgb(255, 255, 255)",
  border: "",
  allowKeyboardControl: true,
  allowPageDragging: true,
  allowResizing: false,
  showPageNumber: false,
  pageBackground: "transparent",
  pageBorder: "1px solid rgb(238, 238, 238)",
  hoverBackground: "rgb(239, 246, 253)",
  hoverPageBorder: "1px solid rgb(238, 238, 238)",
  placeholderBackground: "rgb(251, 236, 136)",
  selectedPageBorder: "1px solid rgb(125,162,206)",
  selectedPageBackground: "rgb(199, 222, 252)",
};

var thumbnail = DWTObject.Viewer.createThumbnailViewer(thumbnailViewerSettings);
thumbnail.show();
```

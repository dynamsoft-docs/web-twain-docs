---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can the size of the image viewer auto resize when the browser window size changes?
keywords: Dynamic Web TWAIN, Image Viewer, auto resize
breadcrumbText: Can the size of the image viewer auto resize when the browser window size changes?
description: Can the size of the image viewer auto resize when the browser window size changes?
date: 2021-12-09 11:34:50 +0800
---

# Image Viewer

## Can the size of the image viewer auto resize when the browser window size changes?

<strong>Scenario</strong>
When using Dynamic Web TWAIN in different environments, it may be necessary to change the size of the viewer within the window automatically.

<strong>Steps</strong>
This can be done in two different ways

1. Set the viewer size when the page is opened based upon the size of the window
2. Change the viewer size when the window size is adjusted based on the new size of the window

<strong>For option 1:</strong>
You may change the container size based on the window size by setting the following in your javascript file (before any other Dynamsoft-related operations):

```javascript
Dynamsoft.DWT.Containers = [
  {
    ContainerId: "dwtcontrolContainer",
    Width: window.innerWidth,
    Height: window.innerHeight,
  },
];
```

and in dynamsoft.webtwain.config.js file set:

```javascript
Dynamsoft.DWT.Containers = [];
```

Note: window.innerWidth and window.innerHeight do not work in IE. You can replace it with document.documentElement.clientWidth and document.documentElement.clientHeight.

<strong>For option 2:</strong>

Write your own function to calculate the Container's width and height according to the browser's size. Then, assign the values to our API's Height & Width. Finally, use the event [resize](/_articles/info/api/WebTwain_Viewer.md#resize){:target="_blank"} to trigger the function.

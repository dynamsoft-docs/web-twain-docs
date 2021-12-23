---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can the size of the image viewer auto resize when the browser window size changes?
keywords: Dynamic Web TWAIN, Image Viewer, auto resize
breadcrumbText: Can the size of the image viewer auto resize when the browser window size changes?
description: Can the size of the image viewer auto resize when the browser window size changes?
---

# Image Viewer

## Can the size of the image viewer auto resize when the browser window size changes?

<strong>Scenario</strong>
When using Dynamic Web TWAIN in different environments it may be necessary to change the size of the viewer within the window automatically.

<strong>Steps</strong>
This can be done two different ways

1. Set the viewer size when the page is opened based upon the size of the window
2. Change the viewer size when the window size is adjusted based on the new size of the window

<strong>For option 1:</strong>
You may change the container size based on the window size by setting the following in your javascript file (before any other Dynamsoft-related operations):

```javascript
Dynamsoft.WebTwainEnv.Containers = [
  {
    ContainerId: "dwtcontrolContainer",
    Width: window.innerWidth,
    Height: window.innerHeight,
  },
];
```

and in dynamsoft.webtwain.config.js file set:

```javascript
Dynamsoft.WebTwainEnv.Containers = [];
```

Note: window.innerWidth and window.innerHeight do not work in IE. You can replace it with document.documentElement.clientWidth and document.documentElement.clientHeight.

<strong>For option 2:</strong>

Write your own function to calculate the Container's width and height according to the browser's size. Then assign the value to our APIs Height &Width. Finally use the event <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Viewer.html?ver=latest#resize" target="_blank">resize</a> to trigger the function.

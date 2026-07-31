---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can the size of the image viewer auto resize when the browser window size changes?
keywords: Dynamic Web TWAIN, Image Viewer, auto resize
breadcrumbText: Can the size of the image viewer auto resize when the browser window size changes?
description: Can the size of the image viewer auto resize when the browser window size changes?
date: 2021-12-09 11:34:50 +0000
last_modified: 2026-07-30 09:17:32 +0000
---

# Image Viewer

## Can the size of the image viewer auto resize when the browser window size changes?

### Scenario

When using Dynamic Web TWAIN in different environments, it may be necessary to change the size of the viewer within the window automatically.

### Solution

There are two parts to this:

1. Set the viewer's initial size based on the window size when the page loads.
2. Keep the viewer's size in sync as the window is resized afterward.

**1. Setting the initial size**

You can size the container based on the window size by setting the following in your JavaScript file (before any other Dynamsoft-related operations):

```javascript
Dynamsoft.DWT.Containers = [
  {
    ContainerId: "dwtcontrolContainer",
    Width: window.innerWidth,
    Height: window.innerHeight,
  },
];
```

and in `dynamsoft.webtwain.config.js`, set:

```javascript
Dynamsoft.DWT.Containers = [];
```

**2. Keeping the size in sync on resize**

There are two common approaches:

- Set the viewer's `width`/`height` to a percentage value so it fills its container proportionally, and let your container's own layout/CSS handle resizing:

    ```javascript
    DWTObject.Viewer.width = "100%";
    DWTObject.Viewer.height = "100%";
    ```

- If you need to calculate an absolute pixel size based on the browser window, listen for the browser's native `resize` event and update the viewer's `width`/`height` accordingly:

    ```javascript
    function updateSize() {
      DWTObject.Viewer.width = window.innerWidth * 0.5;
      DWTObject.Viewer.height = window.innerHeight * 0.8;
    }
    window.addEventListener('resize', updateSize);
    ```

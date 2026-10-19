---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I erase everything outside the selected area of an image?
keywords: Dynamic Web TWAIN, Image Editing, inverse selection, erase outside selection, keep selected area, erase
breadcrumbText: How can I erase everything outside the selected area of an image?
description: How can I erase everything outside the selected area of an image while keeping the original image size?
date: 2026-10-16 00:00:00 +0000
last_modified: 2026-10-16 00:00:00 +0000
---

# Image Editing

## How can I erase everything outside the selected area of an image?

Dynamic Web TWAIN does not have a built-in "inverse selection" API, but you can achieve the same result by combining the [`pageAreaSelected`](/_articles/info/api/WebTwain_Viewer.md#pageareaselected){:target="_blank"} event with the [`Erase()`](/_articles/info/api/WebTwain_Edit.md#erase){:target="_blank"} method.

The idea is to treat the area outside the selected rectangle as four rectangles (top, bottom, left and right) and erase each of them. The selected area stays as it is, everything else is filled with white, and the image keeps its original width and height.

> Note: If you want to remove the area outside the selection and shrink the image to the selected size, use [`Crop()`](/_articles/info/api/WebTwain_Edit.md#crop){:target="_blank"} instead.

```
 (0,0) ┌──────────────────────────────┐
       │           1. Top             │
       ├────────┬───────────┬─────────┤ y
       │ 3.Left │ Selected  │ 4.Right │
       │        │   area    │         │
       ├────────┴───────────┴─────────┤ y + height
       │          2. Bottom           │
       └──────────────────────────────┘ (imageWidth, imageHeight)
                x         x + width
```

**Example**

```html
<div id="dwtcontrolContainer"></div>
<button onclick="eraseOutsideSelection()">Erase Outside Selection</button>

<script type="text/javascript">
    let DWTObject;
    let selection = null; // { index, x, y, width, height }

    function Dynamsoft_OnReady() {
        DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");

        // Record the selected area when the user draws or moves a rectangle
        DWTObject.Viewer.on("pageAreaSelected", (index, rect) => {
            const area = rect[0];
            selection = {
                index: index,
                x: area.x,
                y: area.y,
                width: area.width,
                height: area.height,
            };
        });

        // Clear the record when the selection is removed
        DWTObject.Viewer.on("pageAreaUnselected", () => {
            selection = null;
        });
    }

    function eraseOutsideSelection() {
        if (!selection) {
            alert("Please select an area on the image first.");
            return;
        }

        const { index, x, y, width, height } = selection;
        const imgWidth = DWTObject.GetImageWidth(index);
        const imgHeight = DWTObject.GetImageHeight(index);

        // The four areas around the selection: [left, top, right, bottom]
        const areas = [
            [0, 0, imgWidth, y],                         // 1. Top
            [0, y + height, imgWidth, imgHeight],        // 2. Bottom
            [0, y, x, y + height],                       // 3. Left
            [x + width, y, imgWidth, y + height],        // 4. Right
        ];

        areas.forEach(([left, top, right, bottom]) => {
            // Skip empty areas, e.g. when the selection touches the image edge
            if (right > left && bottom > top) {
                DWTObject.Erase(index, left, top, right, bottom);
            }
        });
    }
</script>
```

> Note:
>
> - The coordinates returned by `pageAreaSelected` are based on the actual image pixels, so they can be passed to `Erase()` directly.
> - If the user draws multiple areas on one page, `rect` contains all of them. The example above only handles the first one (`rect[0]`).
> - The left and right areas only cover the height of the selection, so no part of the image is erased twice.

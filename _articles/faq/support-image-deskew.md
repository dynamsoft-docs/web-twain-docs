---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Do you support image deskew?
keywords: Dynamic Web TWAIN, Image Editing, image deskew
breadcrumbText: Do you support image deskew?
description: Do you support image deskew?
date: 2021-12-09 09:25:33 +0800
---

# Image Editing

## Do you support image deskew?

Generally, there are two ways to automatically deskew an image.

### Enable the capability of a scanner

> Applicable only to compatible <a href="{{site.getstarted}}hardware.html#twain-scanners" target="_blank">TWAIN scanners</a>

There is a standard TWAIN capability called `ICAP_AUTOMATICDESKEW` which, when enabled, does the deskewing of all scanned images automatically. If your scanner supports this capability, you can enable the functionality through `Dynamic Web TWAIN` using the API [IfAutomaticDeskew](/_articles/info/api/WebTwain_Acquire.md#ifautomaticdeskew){:target="_blank"}

``` javascript
DWTObject.OpenSource();
DWTObject.IfAutomaticDeskew = true;
```

### Use Dynamic Web TWAIN to deskew an image as it is scanned

> The function `deskew()` below is applicable to all platforms. The event [OnPostTransferAsync](/_articles/info/api/WebTwain_Acquire.md#onposttransferasync){:target="_blank"} is only triggered during scanning

``` javascript
function deskew(index) {
    DWTObject.GetSkewAngle(
        index,
        function(angle) {
            console.log("skew angle: " + angle);
            DWTObject.Rotate(index, angle, true,
                function() {
                    console.log("Successfully deskewed an image!");
                },
                function(errorCode, errorString) {
                    console.log(errorString);
                }
            );
        },
        function(errorCode, errorString) {
            console.log(errorString);
        }
    );
}
DWTObject.RegisterEvent("OnPostTransferAsync", function(info) {
    deskew(DWTObject.ImageIDToIndex(info.imageId));
});
```

---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Getting Started - Setting Scan Parameters
keywords: Dynamic Web TWAIN, Documentation, Hello World, upload, helloworld
breadcrumbText: Uploading documents
description: Dynamic Web TWAIN SDK Documentation - First Upload
permalink: /getstarted/scansettings.html
---

# Setting Scan Parameters

<div class='blockquote-note'></div>
> This article is part of our HelloWorld series. If you have not already reviewed HelloWorld, please start [here]({{site.getstarted}}helloworld.html)

There are various settings you can specify to control your scan parameters to ensure that your incoming images are all uniform. For this example, we will explore setting  the scan PixelType (also known as colourspace) to greyscale, and setting the scan resolution to 150DPI by adding scan parameters to `AcquireImage()` in the HelloWorld application.

## Disabling the Scanner's built in UI

Add `IfShowUI: false` to the JSON in `AcquireImageAsync()` in `AcquireImage()`.

```js
function AcquireImage() {
        if (DWObject) {
            DWObject.SelectSourceAsync()
            .then(function () {
                return DWObject.AcquireImageAsync({
                    IfShowUI: false,
                    IfDisableSourceAfterAcquire: true,
                });
            })
            .then(function (result) {
                console.log(result);
            })
            .catch(function (exp) {
                console.error(exp.message);
            })
            .finally(function () {
                DWObject.CloseSourceAsync().catch(function (e) {
                    console.error(e);
                });
            });
        }
    }
```

Newly introduced APIs and Properties:

- [`IfShowUI`]({{site.info}}api/WebTwain_Acquire.html#ifshowui){:target="_blank" rel="noreferrer noopener"}

**Why does the scanner UI have to be hidden?** 

Showing the scanner interface will cause the the scanner driver to override any scan settings you designate via JSON by the settings that are defined in the scanner UI. Hiding the UI also prevents users from overriding the desired scan settings.

## Add the scan parameters to the JSON

Add `PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY` and `Resolution:150` to your JSON.

```js
function AcquireImage() {
        if (DWObject) {
            DWObject.SelectSourceAsync()
            .then(function () {
                return DWObject.AcquireImageAsync({
                    IfShowUI: false,
                    IfDisableSourceAfterAcquire: true,
                    PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,
                    Resolution: 150,
                });
            })
            .then(function (result) {
                console.log(result);
            })
            .catch(function (exp) {
                console.error(exp.message);
            })
            .finally(function () {
                DWObject.CloseSourceAsync().catch(function (e) {
                    console.error(e);
                });
            });
        }
    }
```

Newly introduced APIs and Properties:

- [`PixelType`]({{site.info}}api/WebTwain_Acquire.html#pixeltype){:target="_blank" rel="noreferrer noopener"}
- [`Resolution`]({{site.info}}api/WebTwain_Acquire.html#resolution){:target="_blank" rel="noreferrer noopener"}

# Next step

- [Editing your images]({{site.getstarted}}editing.html)
- [Review HelloWorld]({{site.getstarted}}helloworld.html)
- [Review Uploading Documents]({{site.getstarted}}uploading.html)
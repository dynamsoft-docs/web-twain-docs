---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Getting Started - Editing Images
keywords: Dynamic Web TWAIN, Documentation, Hello World, editing, helloworld
breadcrumbText: Uploading documents
description: Dynamic Web TWAIN SDK Documentation - Editing Images
permalink: /getstarted/editing.html
---


# Editing Images

<div class='blockquote-note'></div>
> This article is part of our HelloWorld series. If you have not already reviewed HelloWorld, please start [here]({{site.getstarted}}helloworld.html)

DWT offers a number of ways to manipulate images before exporting the images to a file. These include but are not limited to rotation, cutting, and resizing. For this example, you will be rotating an image and converting it to grayscale.

<!-- For the quick guide on available APIs, please see [ImageEditing]({{site.indepth}}features/edit.html){:target="_blank" rel="noreferrer noopener"} -->

## Rotating images

### Create new buttons to rotate the image

```html
<input type="button" value="Rotate CW" onclick="RotateCW();" />
<input type="button" value="Rotate CCW" onclick="RotateCCW();" />
```

### Add functions to perform rotation on the current image

```js
function RotateCW(){
    DWObject.RotateRight(DWObject.CurrentImageIndexInBuffer);
}
function RotateCCW(){
    DWObject.RotateLeft(DWObject.CurrentImageIndexInBuffer);
}
```

Links to API Reference:

- [`RotateRight()`]({{site.info}}api/WebTwain_Edit.html#rotateright){:target="_blank" rel="noreferrer noopener"}
- [`RotateLeft()`]({{site.info}}api/WebTwain_Edit.html#rotateleft){:target="_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer){:target="_blank" rel="noreferrer noopener"}

### Test out the rotation

Using your new buttons, scan an image and use your new buttons to rotate the image.

## Converting image to grayscale

### Create a new button to convert the image to grayscale

```html
<input type="button" value="ConvertToGray" onclick="ConvertToGray();" />
```

### Add the function to do the colour conversion

```js
function ConvertToGray(){
    DWObject.ConvertToGrayScale(DWObject.CurrentImageIndexInBuffer);
}
```

Links to API Reference:

- [`ConvertToGrayScale()`]({{site.info}}api/WebTwain_Edit.html#converttograyscale){:target="_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer){:target="_blank" rel="noreferrer noopener"}


### Change the scan setting

In the previous step of the HelloWorld guide, you added `PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,` as a scan setting, to acquire a scan as grayscale. You will need change this to `PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB,` to ensure you get a colour image so you can see the colour conversion function in action.

```js
function AcquireImage() {
    if (DWObject) {
        DWObject.SelectSourceAsync()
        .then(function () {
            return DWObject.AcquireImageAsync({
                IfShowUI: false,
                IfDisableSourceAfterAcquire: true,
                PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB,  //Change this enumeration from GRAY to RGB
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

### Test out the colour conversion

![HelloWorldEditGrayscale1]({{site.assets}}imgs/HelloWorldEditGrayscale1.png)

![HelloWorldEditGrayscale2]({{site.assets}}imgs/HelloWorldEditGrayscale2.png)

<< Insert screenshots >>

## Review the completed code

```html
<html>

<head>
    <title>Hello World</title>
    <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
    <script src="Resources/dynamsoft.webtwain.config.js"></script>
</head>

<body>
    <input type="button" value="Scan" onclick="AcquireImage();" />
    <input type="button" value="Rotate CW" onclick="RotateCW();" />
    <input type="button" value="Rotate CCW" onclick="RotateCCW();" />
    <input type="button" value="ConvertToGray" onclick="ConvertToGray();" />

    <div id="dwtcontrolContainer"></div>

    <script type="text/javascript">
        var DWObject;

        function Dynamsoft_OnReady() {
            DWObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
        }

        function AcquireImage() {
            if (DWObject) {
                DWObject.SelectSourceAsync()
                .then(function () {
                    return DWObject.AcquireImageAsync({
                        IfShowUI: false,
                        IfDisableSourceAfterAcquire: true,
                        PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB,
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

    function RotateCW(){
        DWObject.RotateRight(DWObject.CurrentImageIndexInBuffer);
    }
    function RotateCCW(){
        DWObject.RotateLeft(DWObject.CurrentImageIndexInBuffer);
    }

    function ConvertToGray(){
        DWObject.ConvertToGrayScale(DWObject.CurrentImageIndexInBuffer);
    }
    </script>
</body>

</html>
```

Links to API Reference:

- [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync){:target="_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync){:target="_blank" rel="noreferrer noopener"}
- [`IfShowUI`]({{site.info}}api/WebTwain_Acquire.html#ifshowui){:target="_blank" rel="noreferrer noopener"}
- [`IfDisableSourceAfterAcquire`]({{site.info}}api/WebTwain_Acquire.html#ifdisablesourceafteracquire){:target="_blank" rel="noreferrer noopener"}
- [`PixelType`]({{site.info}}api/WebTwain_Acquire.html#pixeltype){:target="_blank" rel="noreferrer noopener"}
- [`Resolution`]({{site.info}}api/WebTwain_Acquire.html#resolution){:target="_blank" rel="noreferrer noopener"}
- [`CloseSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourceasync){:target="_blank" rel="noreferrer noopener"}
- [`ConvertToGrayScale()`]({{site.info}}api/WebTwain_Edit.html#converttograyscale){:target="_blank" rel="noreferrer noopener"}
- [`RotateRight()`]({{site.info}}api/WebTwain_Edit.html#rotateright){:target="_blank" rel="noreferrer noopener"}
- [`RotateLeft()`]({{site.info}}api/WebTwain_Edit.html#rotateleft){:target="_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer){:target="_blank" rel="noreferrer noopener"}

## Run the application

# Previous Article

# Next steps

Congratulations, you have completed the HelloWorld tutorial for DWT. << Insert what goes next >>

<!-- 
- [Customising your scan settings]({{site.getstarted}}scansettings.html)
- [Review HelloWorld]({{site.getstarted}}helloworld.html)
- [Review Uploading Documents]({{site.getstarted}}uploading.html) -->

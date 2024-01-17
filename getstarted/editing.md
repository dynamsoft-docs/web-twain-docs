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

DWT offers a number of ways to manipulate images before exporting the images to a file. These include but are not limited to rotation, cutting, and resizing. For this example, you will be converting an image to grayscale, and rotating the image.

<!-- For the quick guide on available APIs, please see [ImageEditing]({{site.indepth}}features/edit.html){:target="_blank" rel="noreferrer noopener"} -->

## Converting image to grayscale

### Add a ConvertToGray button in HTML
```html
<input type="button" value="ConvertToGray" onclick="ConvertToGray();" />
```

### Change the scan setting

In the previous step of the HelloWorld guide, you added `PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,` as a scan setting, to acquire a scan as grayscale. You will need change this to `PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB,` to ensure you get a colour image so you can see the colour conversion function in action.

```js
function AcquireImage() {
    if (DWObject) {
        DWObject.SelectSourceAsync()
            .then(() => DWObject.AcquireImageAsync({
                IfDisableSourceAfterAcquire: true,
                IfShowUI: false,
                PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB,
                Resolution: 150,
            }))
            .then(result => console.log(result))
            .catch(exp => console.error(exp.message))
            .finally(() => DWObject.CloseSourceAsync().catch(e => console.error(e)));
    }
}

```

Links to API Reference:

- [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync){:target="_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync){:target="_blank" rel="noreferrer noopener"}
- [`IfShowUI`]({{site.info}}api/WebTwain_Acquire.html#ifshowui){:target="_blank" rel="noreferrer noopener"}
- [`IfDisableSourceAfterAcquire`]({{site.info}}api/WebTwain_Acquire.html#ifdisablesourceafteracquire){:target="_blank" rel="noreferrer noopener"}
- [`PixelType`]({{site.info}}api/WebTwain_Acquire.html#pixeltype){:target="_blank" rel="noreferrer noopener"}
- [`Resolution`]({{site.info}}api/WebTwain_Acquire.html#resolution){:target="_blank" rel="noreferrer noopener"}
- [`CloseSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourceasync){:target="_blank" rel="noreferrer noopener"}

### Add the function to do the colour conversion

```js
function ConvertToGray(){
    DWObject.ConvertToGrayScale(DWObject.CurrentImageIndexInBuffer);
}
```

Links to API Reference:

- [`ConvertToGrayScale()`]({{site.info}}api/WebTwain_Edit.html#converttograyscale){:target="_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer){:target="_blank" rel="noreferrer noopener"}

## Rotating images

### Add Rotate buttons in HTML

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
    <input type="button" value="Upload" onclick="Upload();" />
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
                    .then(() => DWObject.AcquireImageAsync({ 
                        IfDisableSourceAfterAcquire: true,
                        IfShowUI: false,
                        PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB,
                        Resolution: 150,
                        }))
                    .then(result => console.log(result))
                    .catch(exp => console.error(exp.message))
                    .finally(() => DWObject.CloseSourceAsync().catch(e => console.error(e)));
            }
        }
        function Upload() {
            if (DWObject && DWObject.HowManyImagesInBuffer > 0) {
                var strUrl = "https://demo.dynamsoft.com/sample-uploads/";
                var aryIndex = [DWObject.CurrentImageIndexInBuffer];
                DWObject.HTTPUpload(strUrl, aryIndex, Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
                    Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary, "WebTWAINImage.png", onUploadSuccess, onUploadFailure);
            } else {
                alert("There is no image in buffer.");
            }
        }

        function onUploadSuccess() {
            alert('Upload successful');
        }

        function onUploadFailure(errorCode, errorString, sHttpResponse) {
            alert(sHttpResponse.length > 0 ? sHttpResponse : errorString);
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

### Open the application in your browser

![HelloWorldEditGrayscale1]({{site.assets}}imgs/HelloWorldEdit.png)

### Press the Scan button

Since the `PixelType` was changed to `TWPT_RGB`, the recieved image is in colour.

![HelloWorldEditGrayscale1]({{site.assets}}imgs/HelloWorldEditGrayscale1.png)

### Convert the image to grayscale


Click the ConvertToGray button and the image will change to grayscale:

![HelloWorldEditGrayscale2]({{site.assets}}imgs/HelloWorldEditGrayscale2.png)

### Rotate the image

Using the Rotate CW and Rotate CCW buttons, rotate the image.

<!-- The scan:

![HelloWorldEditRotate1]({{site.assets}}imgs/HelloWorldEditRotate1.png) -->

* Rotating the original converted grayscale image once using the RotateCW button:

![HelloWorldEditRotate2]({{site.assets}}imgs/HelloWorldEditRotate2.png)

* Rotating the original converted grayscale image once using the RotateCCW button:

![HelloWorldEditRotate3]({{site.assets}}imgs/HelloWorldEditRotate3.png)

# Previous Articles

If you would like to review any of the previous steps, you can review:
- Creating [HelloWorld]({{site.getstarted}}hellowworld.html)
- [Uploading images to the server]({{site.getstarted}}uploading.html)
- [Setting scan parameters]({{site.getstarted}}scansettings.html).

# Next steps

Congratulations, you have completed the HelloWorld tutorial for DWT.

<!-- << Insert what goes next >> -->

<!-- 
- [Customising your scan settings]({{site.getstarted}}scansettings.html)
- [Review HelloWorld]({{site.getstarted}}helloworld.html)
- [Review Uploading Documents]({{site.getstarted}}uploading.html) -->

---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK HelloWorld - Editing Images
keywords: Dynamic Web TWAIN, Documentation, Hello World, editing, helloworld
breadcrumbText: Uploading documents
description: Dynamic Web TWAIN SDK HelloWorld - Editing Images
permalink: /getstarted/editing.html
---


# Editing Images
<!-- 
<div class='blockquote-note'></div>
> This article is part of our HelloWorld series. If you have not already reviewed HelloWorld, please start [here]({{site.getstarted}}helloworld.html). -->

DWT offers a number of ways to manipulate images before exporting the images to a file. These include but are not limited to rotation, cutting, and resizing. For this example, you will be converting an image to black and white, and then rotating the image.

<!-- For the quick guide on available APIs, please see [ImageEditing]({{site.indepth}}features/edit.html){:target="_blank" rel="noreferrer noopener"} -->

## Converting image to black and white

### Add a ConvertToBW button in HTML
```html
<input type="button" value="ConvertToBW" onclick="ConvertToBW();" />
```

### Add the function to do the colour conversion

```js
function ConvertToBW(){
    DWObject.ConvertToBW(DWObject.CurrentImageIndexInBuffer);
}
```

Links to API Reference:

- [`ConvertToBW()`]({{site.info}}api/WebTwain_Edit.html#convertToBW){:target="_blank" rel="noreferrer noopener"}
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

## Review the code

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
    <input type="button" value="ConvertToBW" onclick="ConvertToBW();" />


    <div id="dwtcontrolContainer"></div>

    <script type="text/javascript">
        var DWObject;

        function Dynamsoft_OnReady() {
            DWObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
        }

        
        function AcquireImage() {
            if (DWObject) {
                DWObject.SelectSourceAsync().then(function () {
                    return DWObject.AcquireImageAsync({ 
                        IfCloseSourceAfterAcquire: true,
                        IfShowUI: false,
                        PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,
                        Resolution: 150,
                    });
                }).catch(function (exp) {
                    alert(exp.message);
                });
            }
        }
        function Upload() {
            if (DWObject && DWObject.HowManyImagesInBuffer > 0) {
                var strUrl = "https://demo.dynamsoft.com/sample-uploads/";
                var imgAry = [DWObject.CurrentImageIndexInBuffer];
                DWObject.HTTPUpload(strUrl, imgAry, Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
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

        function ConvertToBW(){
            DWObject.ConvertToBW(DWObject.CurrentImageIndexInBuffer);
        }
    </script>
</body>

</html>
```
<!-- 
Links to API Reference:

- [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync){:target="_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync){:target="_blank" rel="noreferrer noopener"}
- [`IfShowUI`]({{site.info}}api/WebTwain_Acquire.html#ifshowui){:target="_blank" rel="noreferrer noopener"}
- [`IfCloseSourceAfterAcquire`]({{site.info}}api/Device.html#deviceobjectacquireimage){:target="_blank" rel="noreferrer noopener"}
- [`PixelType`]({{site.info}}api/WebTwain_Acquire.html#pixeltype){:target="_blank" rel="noreferrer noopener"}
- [`Resolution`]({{site.info}}api/WebTwain_Acquire.html#resolution){:target="_blank" rel="noreferrer noopener"}
- [`CloseSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourceasync){:target="_blank" rel="noreferrer noopener"}
- [`ConvertToBW()`]({{site.info}}api/WebTwain_Edit.html#converttobw){:target="_blank" rel="noreferrer noopener"}
- [`RotateRight()`]({{site.info}}api/WebTwain_Edit.html#rotateright){:target="_blank" rel="noreferrer noopener"}
- [`RotateLeft()`]({{site.info}}api/WebTwain_Edit.html#rotateleft){:target="_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer){:target="_blank" rel="noreferrer noopener"} -->

## Run the application

### Open the application in your browser

![HelloWorldEdit]({{site.assets}}imgs/HelloWorldEdit.png)

### Press the Scan button

![HelloWorldEditBW1]({{site.assets}}imgs/HelloWorldEditBW1.png)

### Convert the image to black and white

Click the ConvertToBW button and the image will change to black and white:

![HelloWorldEditBW2]({{site.assets}}imgs/HelloWorldEditBW2.png)

### Rotate the image

Using the Rotate CW and Rotate CCW buttons, rotate the image.

* Rotating the converted image once using the RotateCW button:

![HelloWorldEditRotate2]({{site.assets}}imgs/HelloWorldEditRotateCW.png)

* Rotating the converted image once using the RotateCCW button:

![HelloWorldEditRotate3]({{site.assets}}imgs/HelloWorldEditRotateCCW.png)

# Previous Articles

If you would like to review any of the previous steps, you can review:
<!-- - [Initalizing the environment]({{site.getstarted}}initialize.html) -->
- [Scanning an image]({{site.getstarted}}scanning.html)
- [Uploading images to the server]({{site.getstarted}}uploading.html)
- [Setting scan parameters]({{site.getstarted}}scansettings.html)

# Next steps

Congratulations, you have completed the HelloWorld tutorial for DWT.

<!-- << Insert what goes next >> -->

<!-- 
- [Customising your scan settings]({{site.getstarted}}scansettings.html)
- [Review HelloWorld]({{site.getstarted}}helloworld.html)
- [Review Uploading Documents]({{site.getstarted}}uploading.html) -->

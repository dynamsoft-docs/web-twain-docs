---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK HelloWorld - Editing Images
keywords: Dynamic Web TWAIN, Documentation, Hello World, editing, helloworld
breadcrumbText: Uploading documents
description: Dynamic Web TWAIN SDK HelloWorld - Editing Images
---

# Editing Images

>[!TIP]
> Prerequisites: Hello World - Specifying Scan Settings

DWT offers a number of image manipulation features used after image acquisition and before uploading or exporting. These include but are not limited to rotation, cropping, and resizing. In this example, we will demonstrate image color mode conversion and image rotation in HelloWorld.

## Add Image Binarization

Add this line in the `HelloWorld.html` body to create a color mode conversion button:

```html
<input
    type="button"
    value="Convert to binary image"
    onclick="binarizeImage();"
/>
```

Then, define `binarizeImage()` in the `script` element:

```javascript
function binarizeImage() {
    DWTObject.ConvertToBW(DWTObject.CurrentImageIndexInBuffer);
}
```

APIs used:

- [`ConvertToBW()`](/_articles/info/api/WebTwain_Edit.md#convertToBW){:target="\_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`](/_articles/info/api/WebTwain_Buffer.md#currentimageindexinbuffer){:target="\_blank" rel="noreferrer noopener"}

## Add Image Rotation

Add two buttons for 90 degree clockwise and anti-clockwise image rotation:

```html
<input type="button" value="Rotate clockwise" onclick="rotateCW();" />
<input type="button" value="Rotate counter-clockwise" onclick="rotateCCW();" />
```

Define the rotation functions in the `script` element:

```javascript
function rotateCW() {
    DWTObject.RotateRight(DWTObject.CurrentImageIndexInBuffer);
}
function rotateCCW() {
    DWTObject.RotateLeft(DWTObject.CurrentImageIndexInBuffer);
}
```

APIs used:

- [`RotateRight()`](/_articles/info/api/WebTwain_Edit.md#rotateright){:target="\_blank" rel="noreferrer noopener"}
- [`RotateLeft()`](/_articles/info/api/WebTwain_Edit.md#rotateleft){:target="\_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`](/_articles/info/api/WebTwain_Buffer.md#currentimageindexinbuffer){:target="\_blank" rel="noreferrer noopener"}

## Review the Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
    </head>

    <body>
        <input type="button" value="Scan" onclick="AcquireImage();" />
        <input type="button" value="upload" onclick="upload();" />
        <div id="dwtcontrolContainer"></div>
        <input
            type="button"
            value="Convert to binary image"
            onclick="binarizeImage();"
        />
        <input type="button" value="Rotate clockwise" onclick="rotateCW();" />
        <input
            type="button"
            value="Rotate counter-clockwise"
            onclick="rotateCCW();"
        />

        <script type="text/javascript">
            var DWTObject;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
            });

            function AcquireImage() {
                if (DWTObject) {
                    DWTObject.SelectSourceAsync()
                        .then(function () {
                            return DWTObject.AcquireImageAsync({
                                IfCloseSourceAfterAcquire: true,
                                IfShowUI: false,
                                PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,
                                Resolution: 150,
                            });
                        })
                        .catch(function (exp) {
                            alert(exp.message);
                        });
                }
            }

            function upload() {
                if (DWTObject && DWTObject.HowManyImagesInBuffer > 0) {
                    var strUrl = "https://demo.dynamsoft.com/sample-uploads/";
                    var imgAry = [DWTObject.CurrentImageIndexInBuffer];
                    DWTObject.HTTPUpload(
                        strUrl,
                        imgAry,
                        Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
                        Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary,
                        "WebTWAINImage.png",
                        onUploadSuccess,
                        onUploadFailure
                    );
                } else {
                    alert("There is no image in buffer.");
                }
            }

            function onUploadSuccess() {
                alert("Upload successful");
            }

            function onUploadFailure(errorCode, errorString, sHttpResponse) {
                alert(sHttpResponse.length > 0 ? sHttpResponse : errorString);
            }

            function binarizeImage() {
                DWTObject.ConvertToBW(DWTObject.CurrentImageIndexInBuffer);
            }

            function rotateCW() {
                DWTObject.RotateRight(DWTObject.CurrentImageIndexInBuffer);
            }

            function rotateCCW() {
                DWTObject.RotateLeft(DWTObject.CurrentImageIndexInBuffer);
            }
        </script>
    </body>
</html>
```

<!--
Links to API Reference:

- [`SelectSourceAsync()`](/_articles/info/api/WebTwain_Acquire.md#selectsourceasync){:target="_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`](/_articles/info/api/WebTwain_Acquire.md#acquireimageasync){:target="_blank" rel="noreferrer noopener"}
- [`IfShowUI`](/_articles/info/api/WebTwain_Acquire.md#ifshowui){:target="_blank" rel="noreferrer noopener"}
- [`IfCloseSourceAfterAcquire`](/_articles/info/api/Device.md#deviceobjectacquireimage){:target="_blank" rel="noreferrer noopener"}
- [`PixelType`](/_articles/info/api/WebTwain_Acquire.md#pixeltype){:target="_blank" rel="noreferrer noopener"}
- [`Resolution`](/_articles/info/api/WebTwain_Acquire.md#resolution){:target="_blank" rel="noreferrer noopener"}
- [`CloseSourceAsync()`](/_articles/info/api/WebTwain_Acquire.md#closesourceasync){:target="_blank" rel="noreferrer noopener"}
- [`ConvertToBW()`](/_articles/info/api/WebTwain_Edit.md#converttobw){:target="_blank" rel="noreferrer noopener"}
- [`RotateRight()`](/_articles/info/api/WebTwain_Edit.md#rotateright){:target="_blank" rel="noreferrer noopener"}
- [`RotateLeft()`](/_articles/info/api/WebTwain_Edit.md#rotateleft){:target="_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`](/_articles/info/api/WebTwain_Buffer.md#currentimageindexinbuffer){:target="_blank" rel="noreferrer noopener"} -->

## Run the Application

### Open the application in your browser

![Initial state of the Hello World Edit sample](/assets/imgs/HelloWorldEdit.png)

### Press the Scan button

![Hello World Edit sample with an image scanned from the TWAIN Virtual Scanner](/assets/imgs/HelloWorldEditBW1.png)

### Convert the image to black and white

Click the ConvertToBW button and the image will change to black and white:

![Hello World Edit sample with previous image binarized](/assets/imgs/HelloWorldEditBW2.png)

### Rotate the image

Using the Rotate CW and Rotate CCW buttons, rotate the image.

- Rotating the converted image once using the rotateCW button:

![HelloWorldEditCW button](/assets/imgs/HelloWorldEditRotateCW.png)

- Rotating the converted image once using the rotateCCW button:

![Hello World Edit sample with previously binarized image rotated counter-clockwise](/assets/imgs/HelloWorldEditRotateCCW.png)

Congratulations, you have completed the Hello World tutorial for DWT!

# Previous Articles

If you would like to review any of the previous steps, you can review:

- [Scanning an image](/_articles/hello-world/scanning.md)
- [Uploading images to the server](/_articles/hello-world/uploading.md)
- [Setting scan parameters](/_articles/hello-world/scan-settings.md)

# Next Article

Now that you had a chance to look at what DWT can do, you can learn about how to use DWT in your web application in detail with our [general developer guide](/_articles/general-usage/index.md).

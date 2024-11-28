---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Basics - Editing Images
keywords: Dynamic Web TWAIN, Documentation, development, guide, development guide, basic, basic guide, image processing, editing, image editing, edit, image edit
breadcrumbText: Editing Images
description: Dynamic Web TWAIN SDK General Usage Guide - Image Editing
permalink: /general-usage/image-processing/image-editing.html
redirect_from: /indepth/features/edit.html

---

# Editing Images

> Prerequisite: [DWT Initialization]({{site.general-usage}}initialization.html)<br/>
> Prerequisite: [Managing the Image Buffer]({{site.general-usage}}image-processing/buffer-management.html)

DWT provides a wide range of common image editing features to modify scanned documents in web applications. The editing APIs are straight-forward for developers to implement rich editing features.

## Example - Rotating Images

We first demonstrate the use of our image rotation API, which allows users to rotate scanned images and immediately view the results in the `Viewer`. We also provide a list of other editing APIs which can be easily substituted into the sample shown below.

### Sample Code

```html
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
    </head>

    <body>
        <input type="button" value="Scan" onclick="AcquireImage();" /><br>

        <label for="degrees">Enter a rotation angle in degrees:</label><br>
        <input type="number" id="degrees" name="degrees" value="0"><br>
        <button onclick="rotateImage(degrees.value)">Rotate </button>

        <div id="dwtcontrolContainer"></div>

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
                            });
                        })
                        .catch(function (exp) {
                            alert(exp.message);
                        });
                }
            }

            function rotateImage(rotationDegrees) {
                DWTObject.Rotate(
                    DWTObject.CurrentImageIndexInBuffer, // Apply rotation to image in view
                    rotationDegrees,
                    true, // Keep the image the same size
                    function () { console.log('Successfully rotated an image');}, // Optional success callback
                    function (errorCode, errorString) { console.log(errorString) } // Optional failure callback
                )
            }
        </script>
    </body>
</html>
```

APIs used:

- [`Dynamsoft.DWT.RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`Dynamsoft.DWT.GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`Rotate()`]({{site.api}}WebTwain_Edit.html#rotate)
- [`CurrentImageIndexInBuffer`]({{site.api}}WebTwain_Buffer.html#currentimageindexinbuffer)

This sample rotates an image with the [`Rotate()`]({{site.api}}WebTwain_Edit.html#rotate) by the specified number of degrees. This can be applied to any scanned image given its index, but usually it is best to apply it to the image currently being viewed. We use the [`CurrentImageIndexInBuffer`]({{site.api}}WebTwain_Buffer.html#currentimageindexinbuffer) property to grab the index of the displayed image to rotate it in view of the user. We can also choose to preserve the size of the image by cutting off rotated edges as is done in the sample, or shrink the image during rotation to retain the edges. 

Note that the two callbacks are optional arguments.

## Example - Changing Interpolation Methods

Many DWT editing APIs can use different built-in image interpolation methods to suit different usage scenarios. To demonstrate these interpolation methods,we use the extended rotation API, which uses a specified interpolation method during the rotation. Use the following sample to see it in action:

```html
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
    </head>

    <body>
        <input type="button" value="Scan" onclick="AcquireImage();" /><br>

        <label for="degrees">Enter a rotation angle in degrees:</label><br>
        <input type="number" id="degrees" name="degrees" value="0"><br>

        <label for="interpolation">Choose an interpolation method:</label>
        <select id="interpolation" onchange="rotateImageExtended(event)">
            <option value="Dynamsoft.DWT.EnumDWT_InterpolationMethod.IM_NEARESTNEIGHBOUR">Nearest neighbor</option>
            <option value="Dynamsoft.DWT.EnumDWT_InterpolationMethod.IM_BILINEAR">Bilinear</option>
            <option value="Dynamsoft.DWT.EnumDWT_InterpolationMethod.IM_BICUBIC">Bicubic</option>
            <option value="Dynamsoft.DWT.EnumDWT_InterpolationMethod.IM_BESTQUALITY" selected>Best quality</option>
        </select>
        <button type="button" onclick="rotateImageExtended(document.getElementById('degrees').value, document.getElementById('interpolation').value)">Rotate image</button>

        <div id="dwtcontrolContainer"></div>

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
                            });
                        })
                        .catch(function (exp) {
                            alert(exp.message);
                        });
                }
            }

            function rotateImageExtended(rotationDegrees, interpolationMethod) {
                DWTObject.RotateEx(
                    DWTObject.CurrentImageIndexInBuffer,
                    rotationDegrees,
                    true,
                    interpolationMethod,
                    function () { console.log('Successfully rotated an image');},
                    function (errorCode, errorString) { console.log(errorString) }
                )
            }
        </script>
    </body>
</html>
```

APIs used:

- [`Dynamsoft.DWT.RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`Dynamsoft.DWT.GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`RotateEx()`]({{site.api}}WebTwain_Edit.html#rotateex)
- [`CurrentImageIndexInBuffer`]({{site.api}}WebTwain_Buffer.html#currentimageindexinbuffer)
- [`Dynamsoft.DWT.EnumDWT_InterpolationMethod`]({{site.api}}WebTwain_Buffer.html#currentimageindexinbuffer)

### Explanation

The function call is similar to the sample with the regular `Rotate()` API, just with an added parameter for the interpolation method. The interpolation method is defined by the [`Dynamsoft.DWT.EnumDWT_InterpolationMethod`]({{site.api}}WebTwain_Buffer.html#currentimageindexinbuffer) enumeration. Though [`RotateEx()`]({{site.api}}WebTwain_Edit.html#rotateex) can use the numeric directly, we recommend using the enumeration for legibility.

## Common Editing APIs

These four groups of commonly used editing features may be called in a similar fashion, as demonstrated above. They can all be optionally called with success and failure callbacks.

### Rotating Images

- `DWTObject.Rotate(imageIndex, degrees)`

Rotate an image at the specified image index in the image buffer using an interpolation method specified by `Dynamsoft.DWT.EnumDWT_InterpolationMethod`:

- `DWTObject.RotateEx(imageIndex, degrees, interpolationMethod)`

Rotate the specified image 90 degrees counterclockwise:

- `DWTObject.RotateLeft(imageIndex)`

Rotate the specified image 90 degrees clockwise:

- `DWTObject.RotateRight(imageIndex)`

Flip the specified image vertically:

- `DWTObject.Flip(imageIndex)`

Flip the specified image horizontally:

- `DWTObject.Mirror(imageIndex)`

### Cutting, Cropping, and Copying Images

- Crop a rectangular area from the specified image using outermost pixel coordinates:
`DWTObject.Crop(imageIndex, leftmost, topmost, rightmost, bottommost)`
- Copy the specified image to the system clipboard:
`DWTObject.CopyToClipboard(imageIndex)`
- Copy the specified image to the system clipboard and remove the image from the image buffer:
`DWTObject.CutToClipboard(imageIndex)`
- Crop a rectangular area from the specified image using outermost pixel coordinates, and send it to the clipboard of the operating system:
`DWTObject.CropToClipboard(imageIndex, leftmost, topmost, rightmost, bottommost)`
- Crop a rectangular area from the specified image using outermost pixel coordinates, and send it to the clipboard of the operating system. Then, remove the area from the image:
`DWTObject.CutFrameToClipboard(imageIndex, leftmost, topmost, rightmost, bottommost)`
- Remove a rectangular area from the specified image using outermost pixel coordinates:
`DWTObject.Erase(imageIndex, leftmost, topmost, rightmost, bottommost)`

### Resizing Images

- Scale the specified image to the given length and width (in pixel distances), using an interpolation method specified by `Dynamsoft.DWT.EnumDWT_InterpolationMethod`:
`DWTObject.ChangeImageSize(imageIndex, newWidth, newHeight, interpolationMethod)` 
- Scale the image to the given width in pixel distance (and retaining the height) by adding a margin or removing part of the image:
`DWTObject.SetImageWidth(imageIndex, newWidth)`

### Converting Image Resolution, Color mode, and Pixel Bit Depth

- Alter the bit depth of the specified image (bit depths are either 1, 4, 8, or 24). `highQuality` is a boolean quality toggle:
`DWTObject.ChangeBitDepth(imageIndex, bitDepth, highQuality)`
- Change the resolution of the specified image to the given DPI. `resample` is a boolean resampling toggle, and `Dynamsoft.DWT.EnumDWT_InterpolationMethod` determines the interpolation used:
`DWTObject.SetDPI(imageIndex, xResolution, yResolution, resample, interpolationMethod)`
- Convert the specified image to black-and-white:
`DWTObject.ConvertToBW(imageIndex)`
- Convert the specified image to grayscale
`DWTObject.ConvertToGrayScale(imageIndex)`
- Invert the colors of the specified image
`DWTObject.Invert(imageIndex)`
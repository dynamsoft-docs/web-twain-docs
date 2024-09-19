---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Basics - Managing the Image Buffer
keywords: Dynamic Web TWAIN, Documentation, development, guide, development guide, basic, basic guide, data management, data, buffer, management, document management
breadcrumbText: Managing the Image Buffer
description: Dynamic Web TWAIN SDK General Usage Guide - Managing the Image Buffer
permalink: /general-usage/image-processing/buffer-management.html
redirect_from:
    - /indepth/features/buffer.html
---

# Managing the Image Buffer

> Prerequisite: [DWT Initialization]({{site.general-usage}}initialization.html)

Images scanned by a `WebTwain` instance are stored inside the `WebTwain`'s image buffer, which stores images in memory in the `DIB` format. This guide explains commonly-used features to manipulate the data, from reordering pages, to retrieving metadata, and more.

<!--## Identifying Images (by index and UUID)-->

## Querying Buffer Status

The first step in managing the buffer is to examine its state. Images in the buffer can be identified both with its index (which may change over time), or by its image ID, which is immutable once an image enters the buffer. These buffer state querying APIs are typically used in conjunction with other buffer APIS, such as image reordering and image tagging, which we will come to discuss.

- [`DWTObject.HowManyImagesInBuffer`]({{site.api}}WebTwain_Buffer.html#howmanyimagesinbuffer) holds the number of images in the buffer of the `WebTwain` instance.

- [`MaxImagesInBuffer`]({{site.api}}WebTwain_Buffer.html#maximagesinbuffer) controls the maximum number of images allowed within the buffer. The default value is 32767.

- [`DWTObject.CurrentImageIndexInBuffer`]({{site.api}}WebTwain_Buffer.html#currentimageindexinbuffer) returns the index of the currently active image (which is also the one being displayed by the `Viewer`). This property can also be used to **set** the active image by setting it to a different index.

- [`IndexToImageID(imageIndex)`]({{site.api}}WebTwain_Buffer.html#indextoimageid) and [ `ImageIDToIndex(imageID)` ]({{site.api}}WebTwain_Buffer.html#imageidtoindex) can get the image ID (a string) of an image at a given position in the buffer index (a number), and vice versa.

- Images in the buffer also have an internal URL with which they can be referenced (in [desktop browsers only]({{site.getstarted}}platform.html#browsers-on-desktop-devices)). This comes in two flavors:
  - [`GetImageURL(imageIndex)`]({{site.api}}WebTwain_Buffer.html#getimageurl) retrieves the URL of the image at the specified index using the `https://` scheme. This is useful to display images outside the `WebTwain` `Viewer`.
  - [`GetImagePartURL(imageIndex)`]({{site.api}}WebTwain_Buffer.html#getimageparturl) retrieves the URL of the image at the specified index, but using the `dwt://` scheme, which can only be used by other DWT APIs.

- [`GetSkewAngle(imageIndex)`]({{site.api}}WebTwain_Buffer.html#getskewangle) estimates the skew angle of scanned documents in degrees. This can be used to de-skew scanned images, which may be useful for last minute touch-ups. (see image rotation in our [image editing guide]({{site.general-usage}}image-processing/image-editing.html#example---rotating-images))

- [`GetSkewAngleEx(imageIndex, leftmost, topmost, rightmost, bottommost)`]({{site.api}}WebTwain_Buffer.html#getskewangleex) calculates the skew angle of a rectangle (specified by its outermost pixel coordinates) within the image. This feature is only supported in [desktop browsers]({{site.getstarted}}platform.html#browsers-on-desktop-devices).

Some buffer management APIs work on images that have been "selected", for example, calculating the disk space required by selected images. The user may also select images through the `Viewer` interface, which also visually indicates selected images. The selection APIs are described below:

- [`SelectImages(indexArray)`]({{site.api}}WebTwain_Buffer.html#selectimages) selects images using an array of image indices. Note that there is no dedicated API for selecting a single image, so we use the form `SelectImages([singleImageIndex])` instead.

- [`SelectAllImages()`]({{site.api}}WebTwain_Buffer.html#selectallimages) selects all the images in the buffer.

- [`SelectedImagesIndices`]({{site.api}}WebTwain_Buffer.html#selectedimagesindices) is a read-only array containing the indices of the currently selected images.

## Reordering Images

The `WebTwain` instance provides a set of simple buffer reordering APIs to move images around. Note that users also have the option to click and drag images in the `Viewer` to reorder images as well. The following sample demonstrates moving images, switching images, and removing images in the buffer.

### Sample Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
    </head>

    <body>
        <input type="button" value="Scan" onclick="AcquireImage();" /><br>
        <input type="button" value="Move first image to third place" onclick="move1To3();" /><br>
        <input type="button" value="Swap first and third images" onclick="Swap1And3();" /><br>
        <input type="button" value="Delete the first image" onclick="DeleteFirstImage();" /><br>
        <input type="button" value="Delete all images" onclick="DeleteAllImages();" /><br>
        <input type="button" value="Delete the first three images" onclick="DeleteFirst3();" /><br>

        <div id="dwtcontrolContainer"></div>
        <script>
            let DWTObject;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
                DWTObject.Viewer.cursor = "pointer";
                DWTObject.Viewer.setViewMode(3, 3);
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

            function move1To3() {
                if (DWTObject && DWTObject.HowManyImagesInBuffer >= 3) {
                    DWTObject.MoveImage(0, 2);
                }
            }
            function Swap1And3() {
                if (DWTObject && DWTObject.HowManyImagesInBuffer >= 3) {
                    DWTObject.SwitchImage(0, 2);
                }
            }
            function DeleteFirstImage() {
                if (DWTObject && DWTObject.HowManyImagesInBuffer >= 1) {
                    DWTObject.RemoveImage(0);
                }
            }
            function DeleteAllImages() {
                if (DWTObject) {
                    DWTObject.RemoveAllImages();
                }
            }
            function DeleteFirst3() {
                if (DWTObject && DWTObject.HowManyImagesInBuffer >= 3) {
                    DWTObject.SelectImages([0, 1, 2]);
                    DWTObject.RemoveAllSelectedImages();
                }
            }
        </script>
    </body>
</html>
```

APIs used:

- [`Dynamsoft.DWT.RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`Dynamsoft.DWT.GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`cursor`]({{site.api}}WebTwain_Viewer.html#cursor)
- [`setViewMode()`]({{site.api}}WebTwain_Viewer.html#setviewmode)
- [`AcquireImageAsync()`]({{site.api}}WebTwain_Acquire.html#acquireimageasync)
- [`IfCloseSourceAfterAcquire`]({{site.api}}Device.html#deviceobjectacquireimage)
- [`MoveImage()`]({{site.api}}WebTwain_Buffer.html#moveimage)
- [`SwitchImage()`]({{site.api}}WebTwain_Buffer.html#switchimage)
- [`RemoveImage()`]({{site.api}}WebTwain_Buffer.html#removeimage)
- [`RemoveAllImages()`]({{site.api}}WebTwain_Buffer.html#removeallimages)
- [`HowManyImagesInBuffer`]({{site.api}}WebTwain_Buffer.html#howmanyimagesinbuffer)
- [`SelectImages()`]({{site.api}}WebTwain_Buffer.html#selectimages)
- [`RemoveAllSelectedImages()`]({{site.api}}WebTwain_Buffer.html#removeallselectedimages)

### Explanation

After scanning a few images using DWT, the user can use buttons to move images around within the buffer. These APIs identify images using their indices within the buffer (zero-indexed). These APIs return their success state upon completion, as they do not support success callbacks. Note that this sample wraps the API to check for the number of images within the buffer before attempting to move images. This prevents moving or selecting invalid indices.

For illustration purposes, we set the `Viewer` to show multiple images at a time, and changed the cursor shape for this sample.

## Tagging Images

DWT can tag images for custom grouping, sorting, and other data management tasks, using the [TagImages()]({{site.api}}WebTwain_Buffer.html#tagimages) API. Tags are strings associated with images for identification purposes. Images may have multiple tags as well.

### Setting Tags

For example, we may tag individual images with the "title" tag to identify title pages with [TagImages()]({{site.api}}WebTwain_Buffer.html#tagimages), like so:

```JS
DWTObject.TagImages([0, 1], "title");
```

This applies the tag to the first and second images in the buffer (zero-indexed). If image indices are not known ahead of time, it's also useful to apply the tag to the currently displayed image in the viewer, via the [`CurrentImageIndexInBuffer`]({{site.api}}WebTwain_Buffer.html#currentimageindexinbuffer) property. This allows the user to tag the image upon inspection.

```JS
DWTObject.TagImages([DWTObject.CurrentImageInBuffer], "title");
```

Rather than applying tags to existing images, it is possible to tag images as they enter the buffer via [SetDefaultTag()]({{site.api}}WebTwain_Buffer.html#setdefaulttag). By changing the default tag in reaction to application state, the web application can create rich image tagging logic:

```JS
DWTObject.SetDefaultTag("title");
```

Every image entering the buffer after this will automatically receive this tag.

### Organizing Images with Tags

Tags are only useful if they can be interacted with. Once images have been tagged, we can filter them by their tags. For example, a user may need to display only the title pages for preview purposes. Once title pages have been tagged (either as they were scanned or after the fact), we can use [FilterImagesByTag()]({{site.api}}WebTwain_Buffer.html#filterimagesbytag) to selectively display just the title pages:

```JS
DWTObject.FilterImagesByTag("title");
```

Once the user finishes with the preview, DWT can revert to displaying all images by clearing the filter with [ClearFilter()]({{site.api}}WebTwain_Buffer.html#clearfilter):

```JS
DWTObject.ClearFilter();
```

Be sure to visit our [buffer API reference]({{site.api}}WebTwain_Buffer.html) to learn more about various tagging features.

<!-- The following demonstrates using tags to sort images: -->

<!--
### Sample Code for demonstrating image tags

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
    </head>

    <body>
        <input type="button" value="Scan" onclick="AcquireImage();" />

        <label for="tagcurrentimage">Add a tag to the current image:</label><br>
        <input type="text" id="tagcurrentimage" name="tag"><br>
        <button onclick="tagCurrentImage(tagcurrentimage.value)">Add tag </button>

        <label for="untagcurrentimage">Remove the last tag from the current image:</label><br>
        <input type="text" id="untagcurrentimage" name="degrees"><br>
        <button onclick="rotateImage(degrees.value)">Add tag </button>

        <label for="tagfirstimage">Delete all images with this tag:</label><br>
        <input type="text" id="tagfirstimage" name="degrees"><br>
        <button onclick="rotateImage(degrees.value)">Delete</button>

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
        </script>
    </body>
</html>
```

APIs used:

-   [`RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
-   [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
-   [`SelectSourceAsync()`]({{site.api}}WebTwain_Acquire.html#selectsourceasync)
-   [`AcquireImageAsync()`]({{site.api}}WebTwain_Acquire.html#acquireimageasync)
-   [`IfCloseSourceAfterAcquire`]({{site.api}}Device.html#deviceobjectacquireimage)
-->

## Organizing Images with Documents

Documents are another way to organize images within the image buffer. We may create multiple documents to group images, but unlike tags, images can each only belong to one document. Documents also preserve image order. First, we create a document with [CreateDocument()]({{site.api}}WebTwain_Buffer.html#createdocument):

```JS
DWTObject.CreateDocument("documentName");
```

To add images into the document, we first open the document with [OpenDocument()]({{site.api}}WebTwain_Buffer.html#opendocument), and specifying the document by name:

```JS
DWTObject.OpenDocument("documentName");
```

Subsequently, all images entering the buffer will belong to this document. Only one document may be open at a time - opening another document would close the previously open one.

We may also move images after they have entered documents, for example, to copy images from one document to another with [CopyToDocumentAsync()]({{site.api}}WebTwain_Buffer.html#coppytodocumentasync):

```JS
DWTObject.CopyToDocumentAsync("sourceDocumentName", "destinationDocumentName", sourceIndices, targetIndex)
```

Which copies the selected images from `sourceDocumentName` with `sourceIndices` and moves them to the destination at the `targetIndex`. This API has a few overloads to specify targets and sources in different ways, refer to our [documentation]({{site.api}}WebTwain_Buffer.html#coppytodocumentasync) for more details.

DWT also provides other document-related APIs, check them out in our [buffer API reference]({{site.api}}WebTwain_Buffer.html).

## Querying Image Data

DWT provides APIs to quickly retrieve image metadata. The following retrieves data for an image at the specified buffer index:

* Pixel bit depth: [`GetImageBitDepth(imageIndex)`]({{site.api}}WebTwain_Buffer.html#getimagebitdepth)
* Image pixel height: [`GetImageHeight(imageIndex)`]({{site.api}}WebTwain_Buffer.html#getimageheight)
* Image pixel width: [`GetImageWidth(imageIndex)`]({{site.api}}WebTwain_Buffer.html#getimagewidth)
* Horizontal image resolution (in DPI): [`GetImageXResolution(imageIndex)`]({{site.api}}WebTwain_Buffer.html#getimagexresolution)
* Vertical image resolution (in DPI): [`GetImageYResolution(imageIndex)`]({{site.api}}WebTwain_Buffer.html#getimageyresolution)

Additionally, the following APIs used calculate image sizes are only supported by [desktop browsers]({{site.getstarted}}platform.html#browsers-on-desktop-devices):

* Calculate the number of bytes the image would take up when resized to the specified dimensions: [ `GetImageSize(imageIndex, width, height)` ]({{site.api}}WebTwain_Buffer.html#getimagesize)
* Calculate the number of bytes the image would take up upon conversion to a specific image format: [ `GetImageSizeWithSpecifiedType(imageIndex, imageType)` ]({{site.api}}WebTwain_Buffer.html#getimagesizewithspecifiedtype)
  * Refer to [Dynamsoft.DWT.EnumDWT_ImageType]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype) for image formats.
* Calculate the total number of bytes of all selected images given an expected file format: [ `GetSelectedImagesSize(imageType)` ]({{site.api}}WebTwain_Buffer.html#getselectedimagessize)
  * Refer to [Dynamsoft.DWT.EnumDWT_ImageType]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype) for image formats.
  * Images must first be selected by index via [SelectImages()]({{site.api}}WebTwain_Buffer.html#selectimages). There must be at least one image selected for a valid call to `GetImageSize()`.

## Detecting Blank Pages

The buffer also comes with a set of APIs specifically to detect blank pages:

- [`IsBlankImage(imageIndex)`]({{site.api}}WebTwain_Buffer.html#isblankimage) determines whether or not the given page is blank. This is relatively accurate.
- [`IsBlankImageExpress(imageIndex)`]({{site.api}}WebTwain_Buffer.html#isblankimageexpress) detects whether or not the given page is blank, but it trades worse accuracy for higher speed.
- [`IsBlankImageAsync(imageIndex, { minBlockHeight, maxBlockHeight })`]({{site.api}}WebTwain_Buffer.html#isblankimageasync) can optionally detect blank pages with a certain tolerance for markings within the specified size range.

> Tip: At times, blank page detection APIs will still fail to detect some pages as blank. We can loosen the detection tolerance by reading [`BlankImageCurrentStdDev`]({{site.api}}WebTwain_Buffer.html#blankimagecurrentstddev) to get the tolerance for the current image, then increasing the tolerance by setting a new value for the [`BlankImageMaxStdDev`]({{site.api}}WebTwain_Buffer.html#blankimagemaxstddev) property. Note that the first property is read-only for safety reasons.

## Using Buffer Event Callbacks

The image buffer provides event callbacks which can be used to customize buffer behavior. Listeners can be attached to these events via the `WebTwain` object's [RegisterEvent()]({{site.api}}WebTwain_Util.html#registerevent) API. Note that this is distinct from the global [RegisterEvent()]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent) which is called from `Dynamsoft.DWT`.

- [`OnBufferChanged`]({{site.api}}WebTwain_Buffer.html#onbufferchanged) triggers whenever the state of the buffer changes. The details on how the buffer changes are provided in [`BufferChangeInfo`]({{site.api}}Interfaces.html#bufferchangeinfo):

```JS
DWTObject.RegisterEvent('OnBufferChanged',
    function (bufferChangeInfo: BufferChangeInfo) {
    }
): boolean;
```

- [`OnBitmapChanged`]({{site.api}}WebTwain_Buffer.html#onbitmapchanged) triggers whenever image data changes. Specifically, when:
  - an image enters the buffer
  - an image is removed from the buffer
  - an image image in the buffer is edited

  <!-- Index change? -->

* [`OnTopImageInTheViewChanged`]({{site.api}}WebTwain_Buffer.html#ontopimageintheviewchanged) triggers when the first image visible in the `Viewer` changes. (The viewer may be configured to show more than one image at a time, see the [`Viewer` guide]({{site.general-usage}}viewer-configuration.html) for details).

```JS
DWTObject.RegisterEvent(
    'OnBitmapChanged',
    function(
        updatedIndices,
        operationType,
        currentIndex) {
            console.log(updatedIndices);
        }
    )
```

* [ `OnIndexChangeDragDropDone` ]({{site.api}}WebTwain_Buffer.html#onindexchangedragdropdone) triggers when the user reorders images by dragging them around using the `Viewer`.

These events are useful for enhancing and customizing the graphical user experience.

<!-- An event to fire when selection change -->
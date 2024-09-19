---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Edit
keywords: Dynamic Web TWAIN, Documentation, Edit
breadcrumbText: Edit
description: Dynamic Web TWAIN SDK Documentation Edit Page
permalink: /indepth/features/edit.html
---

# Edit

`Dynamic Web TWAIN` offers a variety of image editing features to help give you the final result you are looking for. In this section, we will explore those features and demonstrate how to use them.

> All the methods on this page can be found in our [API reference]({{site.info}}api/WebTwain_Edit.html).

## Edit options

### Rotating, Flipping, and Mirroring

`Dynamic Web TWAIN` provides methods to rotate an image right or left by 90 degrees or by the angle you specify as an input parameter. Here is an overview of the available rotate methods:

``` javascript
DWTObject.Rotate() // rotates the specified image by the specified angle (up to 360 degrees)
DWTObject.RotateEx() // similar to Rotate(), but uses the specified interpolation method to do the rotation
DWTObject.RotateLeft() // rotates the specified image 90 degrees counterclockwise
DWTObject.RotateRight() // rotates the specified image 90 degrees clockwise
DWTObject.Flip() // flips the specified image vertically
DWTObject.Mirror() // mirrors the specified image horizontally
```

### Cutting, Cropping, and Copying

`Dynamic Web TWAIN` can cut and copy images to the clipboard to be used later. It also has the ability to crop the image directly or save the cropped image to the clipboard. Here is an overview of the methods:

``` javascript
DWTObject.Crop() // Crops a rectangular area from the specified image using the specified coordinates
DWTObject.CropToClipboard() // Crops a rectangular area from the specified image using the input coordinates and saves to the clipboard 
DWTObject.CutFrameToClipboard() // Cuts a rectangular area from the specified image using the specified coordinates to the clipboard of the operating system
DWTObject.CutToClipboard() // Cuts the specified image to the clipboard of the operating system
DWTObject.CopyToClipboard() // Copies the specified image to the clipboard of the operating system
DWTObject.Erase() // Erases a rectangular area from the specified image using the input coordinates
```

Several of these methods require input coordinates to define the frame in question. `Dynamic Web TWAIN` provides a way to visually define those coordinates to make the process as easy for the user as possible. Check out [select an area]({{site.indepth}}features/viewer.html#select-an-area).

### Resizing an image

`Dynamic Web TWAIN` also gives you the ability to resize an image in the buffer. Here is the overview of the available methods:

``` javascript
DWTObject.ChangeImageSize() // changes the size of the specified image by altering the height and width
DWTObject.SetImageWidth() // Changes the width of the specified image by adding a margin or removing part of the image
```

### Working with pixels and bit depth

You can also change the colour and resolution of an image by altering its pixel type, bit depth, or DPI. `Dynamic Web TWAIN` offers a number of methods to achieve this:

``` javascript
DWTObject.ChangeBitDepth() // Changes the pixel type of the image by altering the bit depth
DWTObject.SetDPI() // Changes the DPI (dots per inch) of the specified image depending on the input resolution parameters
DWTObject.ConvertToBW() // Converts the specified image to a black-and-white image
DWTObject.ConvertToGrayScale() // Converts the specified image to a grayscale image
DWTObject.Invert() // Inverts the colour of the pixels on the specified image
```

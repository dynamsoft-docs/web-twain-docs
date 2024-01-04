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

DWT offers a number of ways to manipulation of images before saving the images. These include but are not limited to rotation, cutting, and resizing. For this example, we will be rotating an image and converting it to grayscale.

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

APIs used rotate images:

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

APIs and Properties used to change the colourspace: 

- [`ConvertToGrayScale()`]({{site.info}}api/WebTwain_Edit.html#converttograyscale){:target="_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer){:target="_blank" rel="noreferrer noopener"}


### Test out the colour conversion

The HelloWorld guide is using `PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,` as a scan setting, which means the scan will be acquired as grayscale. We will change this to `PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB,` to ensure you get a colour image so we can see the colour conversion function in action.

![HelloWorldEditGrayscale1]({{site.assets}}imgs/HelloWorldEditGrayscale1.png)

![HelloWorldEditGrayscale2]({{site.assets}}imgs/HelloWorldEditGrayscale2.png)

<< Insert screenshots >>

# Next steps

Congratulations, you have completed the HelloWorld tutorial for DWT. << Insert what goes next >>

<!-- 
- [Customising your scan settings]({{site.getstarted}}scansettings.html)
- [Review HelloWorld]({{site.getstarted}}helloworld.html)
- [Review Uploading Documents]({{site.getstarted}}uploading.html) -->

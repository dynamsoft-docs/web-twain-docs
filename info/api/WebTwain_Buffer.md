---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - Buffer APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, Buffer APIs
breadcrumbText: Buffer
description: Dynamic Web TWAIN SDK Documentation API Reference Buffer APIs Page
permalink: /info/api/WebTwain_Buffer.html
---

# {WebTwainObject} Buffer Manage

The properties and methods on this page live in the namespace {WebTwainObject}. {WebTwainObject} denotes the `WebTwain` instance. Learn about [how to create a web twain object]({{site.indepth}}features/initialize.html#creating-the-webtwain-instance).

**Methods**

|                                                 |
| :---------------------------------------------- | :------------------------------------------------------ | ------------------------------------------------------------------- | --------------------------------------------------- |
| [`ClearImageTags()`](#clearimagetags)           | [`RenameTag()`](#renametag)                             | [`RemoveTag()`](#removetag)                                         | [`GetTagList()`](#gettaglist)                       |
| [`FilterImagesByTag()`](#filterimagesbytag)     | [`ClearFilter()`](#clearfilter)                         | [`SetDefaultTag()`](#setdefaulttag)                                 | [`TagImages()`](#tagimages)                         |
| [`GetImageBitDepth()`](#getimagebitdepth)       | [`GetImageSize()`](#getimagesize)                       | [`GetImageSizeWithSpecifiedType()`](#getimagesizewithspecifiedtype) | [`GetSelectedImagesSize()`](#getselectedimagessize) |
| [`GetImageHeight()`](#getimageheight)           | [`GetImageWidth()`](#getimagewidth)                     | [`GetImagePartURL()`](#getimageparturl)                             | [`GetImageURL()`](#getimageurl)                     |
| [`GetImageXResolution()`](#getimagexresolution) | [`GetImageYResolution()`](#getimageyresolution)         | [`GetSkewAngle()`](#getskewangle)                                   | [`GetSkewAngleEx()`](#getskewangleex)               |
| [`ImageIDToIndex()`](#imageidtoindex)           | [`IndexToImageID()`](#indextoimageid)                   | [`IsBlankImage()`](#isblankimage)                                   | [`IsBlankImageExpress()`](#isblankimageexpress)     |
| [`SelectAllImages()`](#selectallimages)         | [`MoveImage()`](#moveimage)                             | [`SwitchImage()`](#switchimage)                                     | [`RemoveImage()`](#removeimage)                     |
| [`RemoveAllImages()`](#removeallimages)         | [`RemoveAllSelectedImages()`](#removeallselectedimages) | [`SelectImages()`](#selectimages)                                   | [`GetTagListByIndex()`](#gettaglistbyindex)         |
| [`CreateDocument()`](#createdocument)         | [`OpenDocument()`](#opendocument)         | [`GetCurrentDocumentName()`](#getcurrentdocumentname)         | [`RenameDocument()`](#renamedocument)         |
| [`RemoveDocument()`](#removedocument)         | [`GetDocumentInfoList()`](#getdocumentinfolist)         |


<!--* [GetImageBitDepthAsync()](#getimagebitdepthasync)-->

<!--* [RemoveAllImagesAsync()](#removeallimagesasync)-->

<!--* [RemoveAllSelectedImagesAsync()](#removeallselectedimagesasync)-->

**Properties**

|                                                           |
| :-------------------------------------------------------- | :------------------------------------------------ | --------------------------------------------- | ------------------------------------------------- |
| [`BlankImageCurrentStdDev`](#blankimagecurrentstddev)     | [`BlankImageMaxStdDev`](#blankimagemaxstddev)     | [`BlankImageThreshold`](#blankimagethreshold) | [`BufferMemoryLimit`](#buffermemorylimit)         |
| [`CurrentImageIndexInBuffer`](#currentimageindexinbuffer) | [`HowManyImagesInBuffer`](#howmanyimagesinbuffer) | [`IfAllowLocalCache`](#ifallowlocalcache)     | [`SelectedImagesIndices`](#selectedimagesindices) |
| [`MaxImagesInBuffer`](#maximagesinbuffer)                 |

**Events**

|                                       |
| :------------------------------------ | :------------------------------------ | --------------------------------------------------------- | ----------------------------------------------------------- |
| [`OnBufferChanged`](#onbufferchanged) | [`OnBitmapChanged`](#onbitmapchanged) | [`OnIndexChangeDragDropDone`](#onindexchangedragdropdone) | [`OnTopImageInTheViewChanged`](#ontopimageintheviewchanged) |

---

## IndexToImageID

Return the imageId of an image specified by the index.

**Syntax**

```typescript
IndexToImageID(index: number): number;
```

**Parameters**

`index`: The index of the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v15.0+</td>
<td align="center">v15.0+</td>
<td align="center">v15.0+</td>
<td align="center">v15.0+</td>
</tr>

</table>
</div>

---

## ImageIDToIndex

Return the index of an image specified by the imageId.

**Syntax**

```typescript
ImageIDToIndex(imageId: number): number;
```

**Parameters**

`imageId`: The imageId of the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v15.0+</td>
<td align="center">v15.0+</td>
<td align="center">v15.0+</td>
<td align="center">v15.0+</td>
</tr>

</table>
</div>

**Usage notes**

An `imageId` is unique and won't change as long as the Dynamsoft Service process is running. It's a better way to keep track of an image than the `index` which changes easily.

---

## RenameTag

Rename a tag.

**Syntax**

```typescript
RenameTag(oldName:string, newName:string): boolean;
```

**Parameters**

`oldName`: Specify the tag to change.

`newName`: Specify the new tag name.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
</tr>

</table>
</div>

---

## RemoveTag

Remove the specified tag from one or more images(if not specified, remove from all).

**Syntax**

```typescript
RemoveTag(tagName: string, indices?: number[]):boolean
```

**Parameters**

`tagName`: Specify the new tag name.

`indices`: Specify the index.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v17.0+</td>
<td align="center">v17.0+</td>
<td align="center">v17.0+</td>
<td align="center">v17.0+</td>
</tr>

</table>
</div>

**Usage Notes**

If the index is null, it will remove the tag you specified. If the index is not null, it will remove the specified tag on the image you selected.

---

## GetTagList

Return the status of all current tags.

**Syntax**

```typescript
GetTagList(): TagInfo[];

interface TagInfo {
    name: string;
    imageIds: number[];
}
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v17.0+</td>
<td align="center">v17.0+</td>
<td align="center">v17.0+</td>
<td align="center">v17.0+</td>
</tr>

</table>
</div>

---

## ClearImageTags

Remove all tags from the specified image.

**Syntax**

```typescript
ClearImageTags(index: number): boolean;
```

**Parameters**

`index`: Specify the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
</tr>

</table>
</div>

---

## FilterImagesByTag

Filter images by the specified tag.

**Syntax**

```typescript
FilterImagesByTag(tag: string): boolean;
```

**Parameters**

`tag`: The tag used as the filter. If nothing or an empty string is used, the filter is cleared.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
</tr>

</table>
</div>

---

## ClearFilter

Stop filtering images by tag. Return an array of UUID of images under the viewer.

**Syntax**

```typescript
ClearFilter(): number[];
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
</tr>

</table>
</div>

---

## SetDefaultTag

Set a default tag for newly incoming images.

**Syntax**

```typescript
SetDefaultTag(tag: string): boolean;
```

**Parameters**

`tag`: Specifies the tag.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
</tr>

</table>
</div>

---

## TagImages

Add a tag to specified images.

**Syntax**

```typescript
TagImages(indices: number[], tag: string): boolean;
```

**Parameters**

`indices`: Specifies images to be tagged.

`tag`: Specify the tag.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
<td align="center">v15.2+</td>
</tr>

</table>
</div>

---

## GetImageBitDepth

Return the pixel bit depth of the specified image.

**Syntax**

```typescript
GetImageBitDepth(index: number): number;
```

**Parameters**

`index`: Specify the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
</tr>

</table>
</div>

---

<!--

## GetImageBitDepthAsync

**Syntax**

``` typescript
/**
 * Return the pixel bit depth of the specified image.
 * @param index Specify the image.
 */
GetImageBitDepthAsync(index: number): Promise<number>;
```

--->

## GetImageHeight

Return the height (in pixels) of the specified image.

**Syntax**

```typescript
GetImageHeight(index: number): number;
```

**Parameters**

`index`: Specify the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
</tr>

</table>
</div>

---

## GetImageWidth

Return the width (in pixels) of the specified image.

**Syntax**

```typescript
GetImageWidth(index: number): number;
```

**Parameters**

`index`: Specify the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
<td align="center">v6.2+</td>
</tr>

</table>
</div>

---

## GetImageXResolution

Return the horizontal resolution of the specified image.

**Syntax**

```typescript
GetImageXResolution(index: number): number;
```

**Parameters**

`index`: Specify the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
</tr>

</table>
</div>

---

## GetImageYResolution

Return the vertical resolution of the specified image.

**Syntax**

```typescript
GetImageYResolution(index: number): number;
```

**Parameters**

`index`: Specify the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
</tr>

</table>
</div>

---

## GetSkewAngle

Return the skew angle of the specified image.

**Syntax**

```typescript
GetSkewAngle(
    index: number,
    successCallback?: (angle: number) => void,
    failureCallback?: (errorCode: number, errorString: string) => void
): number | void;
```

**Parameters**

`index`: Specify the image.

`successCallback`: A callback function that is executed if the request succeeds.
- `angle`: The skew angle.

`failureCallback`: A callback function that is executed if the request fails. 
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v9.0+</td>
<td align="center">v9.0+</td>
<td align="center">v9.0+</td>
<td align="center">v9.0+</td>
<td align="center">v9.0+</td>
</tr>

</table>
</div>

---

## GetSkewAngleEx

Return the skew angle of the specified rectangle on the specified image.

**Syntax**

```typescript
GetSkewAngleEx(
    index: number,
    left: number,
    top: number,
    right: number,
    bottom: number,
    successCallback?: (angle: number) => void,
    failureCallback?: (errorCode: number, errorString: string) => void
): number | void;
```

**Parameters**

`index`: Specify the image.

`left`: The x-coordinate of the upper-left corner of the rectangle.

`top`: The y-coordinate of the upper-left corner of the rectangle.

`right`: The x-coordinate of the lower-right corner of the rectangle.

`bottom`: The y-coordinate of the lower-right corner of the rectangle.

`successCallback`: A callback function that is executed if the request succeeds.
- `angle`: The skew angle.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v9.0+</td>
<td align="center">v9.0+</td>
<td align="center">v9.0+</td>
<td align="center">v9.0+</td>
<td align="center">v9.0+</td>
</tr>

</table>
</div>

**Usage notes**

After you get the skew angle of an image, you can rotate it with the method [Rotate]({{site.info}}api/WebTwain_Edit.html#rotate) to perform deskewing.

---

## GetImageSize

Calculate the size in bytes of the specified image assuming it's resized to the given dimensions.

**Syntax**

```typescript
GetImageSize(index: number, width: number, height: number): number;
```

**Parameters**

`index`: Specify the image.

`width`: Specify the width.

`height`: Specify the height.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## GetImageSizeWithSpecifiedType

Calculate the size in bytes of the specified image assuming an expected file type.

**Syntax**

```typescript
GetImageSizeWithSpecifiedType(index: number, type: Dynamsoft.DWT.EnumDWT_ImageType | number): number;
```

Enumerations：<a href="{{{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype" target="_blank">Dynamsoft.DWT.EnumDWT_ImageType</a>

**Parameters**

`index`: Specify the image.

`type`: Specify the expected file type.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## GetSelectedImagesSize

Calculate the size in bytes of all selected images assuming an expected file type.

**Syntax**

```typescript
GetSelectedImagesSize(type: Dynamsoft.DWT.EnumDWT_ImageType | number): number;
```

**Parameters**

`type`: Sepcify the expected file type.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
</tr>

</table>
</div>

**Usage notes**

If the calculation fails, -1 is returned.

---

## GetImagePartURL

Return the internal URL of the specified image.

**Syntax**

```typescript
GetImagePartURL(index: number, width?: number, height?: number): string;
```

**Parameters**

`index`: Specify the image.

`width`: The width of the image (>150 px).

`height`: The height of the image (>150 px).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v14.3.1+</td>
<td align="center">v13.0+</td>
<td align="center">v13.0+</td>
<td align="center">v13.0+</td>
<td align="center">v13.0+</td>
</tr>

</table>
</div>

**Usage notes**

The returned URL looks like this: 'dwt://dwt_trial_13000404/img?id=306159652&index=0&t=1502184632022'.

You get the original size (a, b) of the image in PNG format in Service Mode
- if either width or height is not set or
- if either width or height is set to -1 or
- if either width or height is larger than the original width or height

Otherwise, you get the image with the specified width (x) or height (y) while keeping the same aspect ratio:
if x/a < y/b, return the image (x, b\*x/a); if x/a > y/b, return the image (a\*y/b, y)

---

## GetImageURL

Return the direct URL of the specified image.

**Syntax**

```typescript
GetImageURL(index: number, width?: number, height?: number): string;
```

**Parameters**

`index`: Specify the image.

`width`: The width of the image (>150 px).

`height`: The height of the image (>150 px).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

The returned URL looks like this: "https://127.0.0.1:18623/dwt/dwt_17110818/img?id=795151779&index=1&t=1640936181588".

You get the original size (a, b) of the image in PNG format in Service Mode
- if either width or height is not set or
- if either width or height is set to -1 or
- if either width or height is larger than the original width or height

Otherwise, you get the image with the specified width (x) or height (y) while keeping the same aspect ratio:
if x/a < y/b, return the image (x, b\*x/a); if x/a > y/b, return the image (a\*y/b, y)

---

## SelectAllImages

Select all images and return the indices. Viewer will be scrolled to the last image.

**Syntax**

```typescript
SelectAllImages(): number[];
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v15.3+</td>
<td align="center">v15.3+</td>
<td align="center">v15.3+</td>
<td align="center">v15.3+</td>
</tr>

</table>
</div>

---

## SelectImages

Select the specified images.

**Syntax**

```typescript
SelectImages(indices: number[]): boolean;
```

**Parameters**

`indices`: Specify one or multiple images

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
</tr>

</table>
</div>

---

## MoveImage

Change the position of an image in the buffer.

**Syntax**

```typescript
MoveImage(from: number, to: number): boolean;
```

**Parameters**

`from`: Specify the original position by index.

`to`: Specify the target position by index.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

## SwitchImage

Exchange the positions of two images.

**Syntax**

```typescript
SwitchImage(index1: number, index2: number): boolean;
```

**Parameters**

`index1`: Specify the 1st image.

`index2`: Specify the 2nd image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

## RemoveImage

Remove the specified image.

**Syntax**

```typescript
RemoveImage(index: number): boolean;
```

**Parameters**

`index`: Specify the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<tr>
<td align="center">v4.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>
</tr>

</table>
</div>

---

## RemoveAllImages

Remove all images.

**Syntax**

```typescript
RemoveAllImages(): boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

<!--

## RemoveAllImagesAsync

**Syntax**

``` typescript
/**
 * Remove all images.
 */
RemoveAllImagesAsync(): Promise<boolean>;
```

--->

## RemoveAllSelectedImages

Remove all selected images.

**Syntax**

```typescript
RemoveAllSelectedImages(): boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

<!--

## RemoveAllSelectedImagesAsync

**Syntax**

``` typescript
/**
 * Remove all selected images.
 */
RemoveAllSelectedImagesAsync(): Promise<boolean>;
```

----->

## CurrentImageIndexInBuffer

Return the index of the current image in the buffer or set the image specified by index as the current image.

**Syntax**

```typescript
CurrentImageIndexInBuffer: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
</tr>

</table>
</div>

---

## HowManyImagesInBuffer

Return how many images are held in the buffer

**Syntax**

```typescript
readonly HowManyImagesInBuffer: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
</tr>

</table>
</div>

---

## MaxImagesInBuffer

Return or set how many images can be held in the buffer.

**Syntax**

```typescript
MaxImagesInBuffer: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
</tr>

</table>
</div>

**Usage notes**

When acquiring images and the number of images goes beyond the value set to `MaxImagesInBuffer`, new images will replace old images starting from the 1st one.

---

## SelectedImagesIndices

Return the indices of the selected images.

**Syntax**

```typescript
readonly SelectedImagesIndices: number[];
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
</tr>

</table>
</div>

---

## SelectionRectAspectRatio

Specify a aspect ratio to be used when selecting a rectangle on an image.

**Syntax**

```typescript
SelectionRectAspectRatio: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

## BlankImageCurrentStdDev

Return the deviation of the pixels in the current image.

**Syntax**

```typescript
readonly BlankImageCurrentStdDev: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
<td align="center">v8.0+</td>
</tr>

</table>
</div>


**Usage notes**

This property is only valid after `IsBlankImageExpress` or `IsBlankImage()` is called.

---

## BlankImageMaxStdDev

Return or set the maximum deviation of the pixels in an image which is used to determine whether the image is blank.

**Syntax**

```typescript
BlankImageMaxStdDev: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
</tr>

</table>
</div>

**Usage notes**

[0, 100] is the interval of allowed values, inclusive. 0 gives a single-color image. The default value is 1.

This property is only valid before `IsBlankImageExpress` is called.

---

## BlankImageThreshold

Returns or sets the dividing line between black and white.

**Syntax**

```typescript
BlankImageThreshold: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
</tr>

</table>
</div>

**Usage notes**

[0, 255] is the interval of allowed values, inclusive. The default value is 128.
This property is only valid before `IsBlankImageExpress` is called.

---

## BufferMemoryLimit

Return or set how much physical memory is allowed for storing images currently loaded in Dynamic Web TWAIN. Once the limit is reached, images will be cached on the hard disk.

**Syntax**

```typescript
BufferMemoryLimit: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.1+</td>
<td align="center">v10.1+</td>
<td align="center">v10.1+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

Set this property only when you have a very small physical memory (< 2GB) or a very big one (>4GB). The more memory is allowed, the better the performance will be.
The default value is set to 800 (MB), anything beyond 800MB gets compressed, encrypted and cached on the local disk.

All cached data is encrypted and can only be read by Dynamic Web TWAIN and it will be destroyed when it is no longer used.

---

## IsBlankImage

Check whether the specified image is blank.

**Syntax**

```typescript
IsBlankImage(index: number): boolean;
```

**Parameters**

`index`: Specify the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
</tr>

</table>
</div>

---

## IsBlankImageExpress

Check whether the specified image is blank.

**Syntax**

```typescript
IsBlankImageExpress(index: number): boolean;
```

**Parameters**

`index`: Specify the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
</tr>

</table>
</div>

**Usage notes**

`IsBlankImage` is more accurate than `IsBlankImageExpress` but it works slower.

`BlankImageCurrentStdDev` should be read after either `IsBlankImage()` or `IsBlankImageExpress`.

If you believe an image should be blank but `IsBlankImage()` or `IsBlankImageExpress` is returning `false`, you can read `BlankImageCurrentStdDev` for that image and then set a bigger value to `BlankImageMaxStdDev`.

Both `BlankImageCurrentStdDev` and `BlankImageMaxStdDev` range from 0 to 100.

If the image is not blank and it is not black and white, `IsBlankImage()` or `IsBlankImageExpress` may return `true`. In that case, you can increase the [BlankImageThreshold]({{site.info}}api/WebTwain_Buffer.html#blankimagethreshold) value so that the image is not detected as blank.

---

## IfAllowLocalCache

Return or set whether the feature of disk caching is enabled.

**Syntax**

```typescript
IfAllowLocalCache: boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

The default value of IfAllowLocalCache is true. When the property is true, you can scan as many images as you want as long as you have a big enough disk.  
The default threshold is set to 800 (MB), anything beyond 800MB gets compressed, encrypted and cached on the local disk.  
If necessary, you can set the threshold using `BufferMemoryLimit` for better performance.  
All cached data is encrypted and can only be read by Dynamic Web TWAIN and it will be destroyed when it is no longer used.

---

## OnBufferChanged

An enhanced callback triggered when a change occurs in the buffer.

**Syntax**

```typescript
RegisterEvent('OnBufferChanged',
    function (bufferChangeInfo: BufferChangeInfo) {}
): boolean;

interface BufferChangeInfo {
    /**
     * Action type includes 'add', 'remove', 'modify', 'shift' and 'filter'
     */
    action: string;
    /**
     * The image id (not the index) of the current page.
     */
    currentId: number;
    /**
     * All image ids.
     */
    imageIds: number[];
    /**
     * All selected image ids.
     */
    selectedIds: number[];
}
```

**Parameters**

`bufferChangeInfo`: Details about the buffer change.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v18.0+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
</tr>

</table>
</div>

**Usage notes**

Action types include

- `add`: New pages are added to the buffer.
- `remove`: The existing pages are removed.
- `modify`: The existing pages are modified.
- `shift`: The existing pages are reordered.
- `filter`: The existing pages are filtered by a tag.

---

## OnBitmapChanged

A built-in callback triggered when the current image in buffer is changed like flipped, cropped, rotated, etc. or a new image has been acquired.

**Syntax**

```typescript
RegisterEvent('OnBitmapChanged',
    function (
        indexString: number[],
        type: number,
        index: number
    ) {}
): boolean;
```

**Parameters**

`indexString`: Array of the changed index(indices).

`type`: Operation type.
   1 means new image(s) were added at the tail,
   2 means image(s) were inserted before the current index,
   3 means image(s) are deleted,
   4 means image(s) are modified,

`index`: Index of the current image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v8.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWObject.RegisterEvent(
  "OnBitmapChanged",
  function (strUpdatedIndex, operationType, sCurrentIndex) {
    console.log("Image " + sCurrentIndex + " has changed!");
  }
);
```

---

## OnTopImageInTheViewChanged

A built-in callback triggered when the top index currently displayed in the viewer changes.

**Syntax**

```typescript
RegisterEvent('OnTopImageInTheViewChanged',
    function (index: number) {}
): boolean;
```

**Parameters**

`index`: Index of the current image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.1+</td>
<td align="center">v10.1+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

This API does not work if the view mode of the viewer is set to -1 by -1.

---

## OnIndexChangeDragDropDone

A built-in callback triggered when images in the buffer are dragged to new positions.

**Syntax**

```typescript
RegisterEvent('OnIndexChangeDragDropDone',
    function (indexPairs: Pair[]) {}
): boolean;

Pair: [from: number, to: number];
```

**Parameters**

`indexPairs`: The list of index changes.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v15.0+</td>
<td align="center">v15.0+</td>
<td align="center">v15.0+</td>
<td align="center">v15.0+</td>
</tr>

</table>
</div>

---

## GetTagListByIndex

Return the tag(s) of a specified image.

**Syntax**

```typescript
GetTagListByIndex(index: number):string[]
```

**Parameters**

`index`: Index of the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWObject.GetTagListByIndex(0);
```

---

## CreateDocument

Create a document for the scanned image(s).

**Syntax**

```typescript
CreateDocument(documentName:string):boolean;
```

**Parameters**

`documentName`: Specify the document name.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
</tr>

</table>
</div>

**Example**

```javascript
//Save the scanned image(s) under 'Document1'.
DWObject.CreateDocument("Document1");
DWObject.OpenDocument("Document1"); //Need to call OpenDocument after CreateDocument.
DWObject.AcquireImage(successCallback, failureCallback);
function successCallback() {
  console.log("successful");
}
function failureCallback(errorCode, errorString) {
  alert(errorString);
}
```

---

## OpenDocument

Use the specified document for the scanned image(s)

**Syntax**

```typescript
OpenDocument(documentName:string):boolean;
```

**Parameters**

`documentName`: Specify the document name.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
</tr>

</table>
</div>

**Example**

```javascript
//Save the scanned image(s) under 'Document2'.
DWObject.CreateDocument("Document1");
DWObject.CreateDocument("Document2");
DWObject.CreateDocument("Document3");
DWObject.OpenDocument("Document2"); //Need to call OpenDocument after CreateDocument.
DWObject.AcquireImage(successCallback, failureCallback);
function successCallback() {
  console.log("successful");
}
function failureCallback(errorCode, errorString) {
  alert(errorString);
}
```

---

## GetCurrentDocumentName

Get the current document name. The default value is 'dynamsoft-default-document'. Scanned image(s) are saved in this document by default if no document name is created.

**Syntax**

```typescript
GetCurrentDocumentName():string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
</tr>

</table>
</div>

---

## RenameDocument

Rename a document.

**Syntax**

```typescript
RenameDocument(oldDocumentName:string, newDocumentName:string):boolean;
```

**Parameters**

`oldDocumentName`: Specify the old document name.

`newDocumentName`: Specify the new document name.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v17.3+</td>
<td align="center">v17.3+</td>
<td align="center">v17.3+</td>
<td align="center">v17.3+</td>
</tr>

</table>
</div>

---

## RemoveDocument

Delete the specified document.

**Syntax**

```typescript
RemoveDocument(documentName:string):boolean;
```

**Parameters**

`documentName`: Specify the document name.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
</tr>

</table>
</div>

---

## GetDocumentInfoList

Get the list of all documents and their information.

**Syntax**

```typescript
GetDocumentInfoList(): DocumentInfo[];
interface DocumentInfo {
   name: string;
   imageIds: number[];
}
```


**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
</tr>

</table>
</div>
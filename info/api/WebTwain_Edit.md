---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - Edit APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, Edit APIs
breadcrumbText: Edit
description: Dynamic Web TWAIN SDK Documentation API Reference Edit APIs Page
permalink: /info/api/WebTwain_Edit.html
---

# {WebTwainObject} Edit

The properties and methods on this page live in the namespace {WebTwainObject}. {WebTwainObject} denotes the `WebTwain` instance. Learn about [how to create a web twain object]({{site.indepth}}features/initialize.html#creating-the-webtwain-instance).

> All APIs on this page support Android Service from version 18.2.

**Methods**

|                                                 |
| :---------------------------------------------- | :-------------------------------------- | ----------------------------------------------- | --------------------------------------------------- |
| [`Crop()`](#crop)                               | [`CropToClipboard()`](#croptoclipboard) | [`CutFrameToClipboard()`](#cutframetoclipboard) | [`CutToClipboard()`](#cuttoclipboard)               |
| [`CopyToClipboard()`](#copytoclipboard)         | [`Erase()`](#erase)                     | [`Flip()`](#flip)                               | [`Mirror()`](#mirror)                               |
| [`Rotate()`](#rotate)                           | [`RotateEx()`](#rotateex)               | [`RotateLeft()`](#rotateleft)                   | [`RotateRight()`](#rotateright)                     |
| [`ChangeBitDepth()`](#changebitdepth)           | [`SetDPI()`](#setdpi)                   | [`ConvertToBW()`](#converttobw)                 | [`ConvertToGrayScale()`](#converttograyscale)       |
| [`ChangeImageSize()`](#changeimagesize)         | [`Invert()`](#invert)                   | [`SetImageWidth()`](#setimagewidth)             | [`ChangeBrightnessAsync()`](#changebrightnessasync) |
| [`ChangeContrastAsnyc()`](#changecontrastasnyc) |

<!--
* [Crop()](#crop)
* [CropToClipboard()](#croptoclipboard)
* [CutFrameToClipboard()](#cutframetoclipboard)
* [CutToClipboard()](#cuttoclipboard)
* [CopyToClipboard()](#copytoclipboard)
* [Erase()](#erase)
* [Flip()](#flip)

<!--* [FlipAsync()](#flipasync)

* [Mirror()](#mirror)

<!--* [MirrorAsync()](#mirrorasync)

* [Rotate()](#rotate)

<!--* [RotateAsync()](#rotate)

* [RotateEx()](#rotateex)
* [RotateLeft()](#rotateleft)

<!--* [RotateLeftAsync()](#rotateleft)

* [RotateRight()](#rotateright)

<!--* [RotateRightAsync()](#rotateright)

* [ChangeBitDepth()](#changebitdepth)
* [SetDPI()](#setdpi)
* [ConvertToBW()](#converttobw)
* [ConvertToGrayScale()](#converttograyscale)

<!--* [ConvertToGrayScaleAsync()](#converttograyscaleasync)
* [ChangeImageSize()](#changeimagesize)
* [Invert()](#invert)
* [SetImageWidth()](#setimagewidth) -->

**Properties**

|                                               |
| :-------------------------------------------- |
| [`BackgroundFillColor`](#backgroundfillcolor) |

## ChangeBitDepth()

Change the bit depth of the specified image.

**Syntax**

```javascript
ChangeBitDepth(
    index: number,
    bitDepth: number,
    highQuality: boolean,
): boolean;
```

**Parameters**

`index`: Specify the index of the image to be changed. The index is 0-based.

`bitDepth`: Specify the target bit depth.

`highQuality`: Whether to keep high quality. When it's true, it takes more time.

**Availability**
<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v10.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage notes**

The allowed bit depths are 1, 4, 8, 24.

---

## ChangeImageSize()

Change the size of the specified image.

**Syntax**

```javascript
ChangeImageSize(
    index: number,
    width: number,
    height: number,
    method: Dynamsoft.DWT.EnumDWT_InterpolationMethod | number
): boolean;

// Call this API asynchronously
ChangeImageSize(
    index: number,
    width: number,
    height: number,
    method: Dynamsoft.DWT.EnumDWT_InterpolationMethod | number,
    successCallback: () => void,
    failureCallback: (
        errorCode: number,
        errorString: string
    ) => void
): void;
```

**Parameters**
`index`: Specify  the index of the image to be changed. The index is 0-based.

`width`: Specify the new width.

`height`: Specify the new height.

`method`: Specify the algorithm for the change. Please refer to [EnumDWT_InterpolationMethod]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_interpolationmethod).

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
 * `errorCode`: The error code.
 * `errorString`: The error string.


**Availability**
<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

## SetDPI()

Change the DPI (dots per inch) of the specified image.

**Syntax**

```javascript
SetDPI(
    index: number,
    xResolution: number,
    yResolution: number,
    resample: boolean,
    method: Dynamsoft.DWT.EnumDWT_InterpolationMethod | number
): boolean;
```

**Parameters**

`index`: Specify the index of the image to be changed. The index is 0-based.

`xResolution`: Specify the horizontal DPI.

`yResolution`: Specify the vertical DPI.

`resample`: Whether to resample the image. When it is true, the image size will change.

`method`: Specify the algorithm for the change. Please refer to [EnumDWT_InterpolationMethod]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_interpolationmethod).


**Availability**
<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v8.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>


---

## ConvertToBW()

Convert the specified image to black & white.

**Syntax**

```javascript
ConvertToBW(
    index: number
): boolean;
```

**Parameters**

`index`: Specify the index of the image to be converted. The index is 0-based.

**Availability**
<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v15.3+ </td>
<td align="center">v15.3+ </td>
<td align="center">v15.3+ </td>
<td align="center">v15.3+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

## ConvertToGrayScale()

Convert the specified image to grayscale.

**Syntax**

```javascript
ConvertToGrayScale(
    index: number
): boolean;
```

**Parameters**

`index`: Specify the index of the image to be converted. The index is 0-based.

**Availability**
<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v10.0+</td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

<!--

## ConvertToGrayScaleAsync

**Syntax**

``` typescript
/**
 * Convert the specified image to grayscale.
 * @param index Specify the image.
 */
ConvertToGrayScaleAsync(
    index: number
): Promise<boolean>;
```

----->

## Invert()

Invert the colour of the pixels on the specified image.

**Syntax**

```typescript
Invert(
    index: number
): boolean;

// Call this API asynchronously
Invert(
    index: number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`index`: Specify the image.

`successCallback`: A callback function that is executed if the request succeeds.

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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported </td>
<td align="center">v15.3+ </td>
<td align="center">v15.3+ </td>
<td align="center">v15.3+ </td>
<td align="center">v15.3+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

## SetImageWidth()

Change the width of the specified image by adding a margin or removing part of the image.

**Syntax**

```typescript
SetImageWidth(
    index: number,
    width: number
): boolean;
```

**Parameters**

`index`: Specify the image.

`width`: Specify the new width.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v10.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

## Flip()

Flip the specified image.

**Syntax**

```typescript
Flip(
    index: number
): boolean;

// Call this API asynchronously
Flip(
    index: number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`index`: Specify the image.

 `successCallback`: A callback function that is executed if the request succeeds.

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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

<!--

## FlipAsync

**Syntax**

``` typescript
/**
 * Flip the specified image.
 * @param index Specify the image.
 */
FlipAsync(
    index: number
): Promise<boolean>;
```

--->

## Mirror()

Mirror the specified image.

**Syntax**

```typescript
Mirror(
    index: number
): boolean;

// Call this API asynchronously
Mirror(
    index: number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`index`: Specify the image.

`successCallback`: A callback function that is executed if the request succeeds.

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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

<!--

## MirrorAsync

**Syntax**

``` typescript
/**
 * Mirror the specified image.
 */
MirrorAsync(
    index: number
): Promise<boolean>;
```

--->

## RotateLeft()

Rotate the specified image 90 degrees counterclockwise.

**Syntax**

```typescript
RotateLeft(
    index: number
): boolean;

// Call this API asynchronously
RotateLeft(
    index: number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`index`: Specify the image.

`successCallback`: A callback function that is executed if the request succeeds.

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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>
---

<!--

## RotateLeftAsync

**Syntax**

``` typescript
/**
 * Rotate the specified image 90 degrees counterclockwise.
 * @param index Specify the image.
 */
RotateLeftAsync(
    index: number
): Promise<boolean>;
```

--->

## RotateRight()

Rotate the specified image 90 degrees clockwise.

**Syntax**

```typescript
RotateRight(
    index: number
): boolean;

// Call this API asynchronously
RotateRight(
    index: number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`index`: Specify the image.

`successCallback`: A callback function that is executed if the request succeeds.

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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

<!--

## RotateRightAsync

**Syntax**

``` typescript
/**
 * Rotate the specified image 90 degrees clockwise.
 */
RotateRightAsync(
    index: number
): Promise<boolean>;
```

--->

## Rotate()

Rotate the specified image by the specified angle.

**Syntax**

```typescript
Rotate(
    index: number,
    angle: number,
    keepSize: boolean
): boolean;

// Call this API asynchronously
Rotate(
    index: number,
    angle: number,
    keepSize: boolean,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`index`: Specify the image.

`angle`: Specify the angle.

`keepSize`: Whether to keep the original size.

`successCallback`: A callback function that is executed if the request succeeds.

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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

<!--

## RotateAsync

**Syntax**

``` typescript
/**
 * Rotate the specified image by the specified angle.
 * @param index Specify the image.
 * @param angle Specify the angle.
 * @param keepSize Whether to keep the original size.
 */
RotateAsync(
    index: number,
    angle: number,
    keepSize: boolean
): Promise<boolean>;
```

--->

## RotateEx()

Rotate the specified image by the specified angle.

**Syntax**

```typescript
RotateEx(
    index: number,
    angle: number,
    keepSize: boolean,
    method: Dynamsoft.DWT.EnumDWT_InterpolationMethod | number
): boolean;

// Call this API asynchronously
RotateEx(
    index: number,
    angle: number,
    keepSize: boolean,
    method: Dynamsoft.DWT.EnumDWT_InterpolationMethod | number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`index`: Specify the image.

`angle`: Specify the angle.

`keepSize`: Whether to keep the original size.

`method`: Specify the algorithm for the change. Please refer to [Dynamsoft.DWT.EnumDWT_InterpolationMethod]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_interpolationmethod).

`successCallback`: A callback function that is executed if the request succeeds.

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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v7.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

## Crop()

Crop the specified image using the specified coordinates.

**Syntax**

```typescript
Crop(
    index: number,
    left: number,
    top: number,
    right: number,
    bottom: number
): boolean;

// Call this API asynchronously
Crop(
    index: number,
    left: number,
    top: number,
    right: number,
    bottom: number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`index`: Specify the image.

`left`: Specify the rectangle (leftmost coordinate).

`top`: Specify the rectangle (topmost coordinate).

`right`: Specify the rectangle (rightmost coordinate).

`bottom`: Specify the rectangle (bottommost coordinate).

`successCallback`: A callback function that is executed if the request succeeds.

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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

## Erase()

Erase a rectangular area from the specified image.

**Syntax**

```typescript
Erase(
    index: number,
    left: number,
    top: number,
    right: number,
    bottom: number
): boolean;

// Call this API asynchronously
Erase(
    index: number,
    left: number,
    top: number,
    right: number,
    bottom: number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`index`: Specify the image.

`left`: Specify the rectangle (leftmost coordinate).

`top`: Specify the rectangle (topmost coordinate).

`right`: Specify the rectangle (rightmost coordinate).

`bottom`: Specify the rectangle (bottommost coordinate).

`successCallback`: A callback function that is executed if the request succeeds.

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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

## CopyToClipboard()

Copy the specified image to the clipboard of the operating system.

**Syntax**

```typescript
CopyToClipboard(index: number): boolean;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

<!--

## CopyToClipboardAsync

**Syntax**

``` typescript
/**
 * Copy the specified image to the clipboard of the operating system.
 * @param index Specify the image.
 */
CopyToClipboardAsync(index: number): Promise<boolean>;
```

--->

## CutToClipboard()

Cut the specified image to the clipboard of the operating system.

**Syntax**

```typescript
CutToClipboard(index: number): boolean;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

## CropToClipboard()

Crop a rectangular area from the specified image to the clipboard of the operating system.

**Syntax**

```typescript
CropToClipboard(
    index: number,
    left: number,
    top: number,
    right: number,
    bottom: number
): boolean;
```

**Parameters**

`index`: Specify the image.

`left`: Specify the rectangle (leftmost coordinate).

`top`: Specify the rectangle (topmost coordinate).

`right`: Specify the rectangle (rightmost coordinate).

`bottom`: Specify the rectangle (bottommost coordinate).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

## CutFrameToClipboard()

Cut a rectangular area from the specified image to the clipboard of the operating system.

**Syntax**

```typescript
CutFrameToClipboard(
    index: number,
    left: number,
    top: number,
    right: number,
    bottom: number
): boolean;
```

**Parameters**

`index`: Specify the image.

`left`: Specify the rectangle (leftmost coordinate).

`top`: Specify the rectangle (topmost coordinate).

`right`: Specify the rectangle (rightmost coordinate).

`bottom`: Specify the rectangle (bottommost coordinate).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>


**Usage notes**

The empty area resulted from the crop/erase/cut will be filled with the colour set with [`BackgroundFillColor`](#backgroundfillcolor).

---

## BackgroundFillColor

Return or set the fill colour for the empty area on an image that has been cut/cropped/erased.

**Syntax**

```typescript
BackgroundFillColor: number;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage notes**

By default the colour is white (0xffffff). The byte-ordering of the 24-bit RGB value is **RRGGBB**. RR represents red, GG represents green and BB represents blue.

---

## ChangeBrightnessAsync()

Change the image brightness.

**Syntax**

```typescript
ChangeBrightnessAsync(
    index: number, 
    value: number
): Promise<boolean>;
```

**Parameters**

`index`: Specify the index of image in buffer.

`value`: Specify the brightness. Allowed values [-1000~1000]. Negative value means decrease the brightness.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

## ChangeContrastAsnyc()

Change the image contrast.

**Syntax**

```typescript
ChangeContrastAsnyc(
    index: number, 
    value: number
): Promise<boolean>;
```

**Parameters**

`index`: Specify the index of image in buffer.

`value`: Specify the contrast. Allowed values [-1000~1000]. Negative value means decrease the contrast.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

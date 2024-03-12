---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - Webcam Addon APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, Webcam Addon APIs
breadcrumbText: Webcam Addon
description: Dynamic Web TWAIN SDK Documentation API Reference Webcam Addon APIs Page
permalink: /info/api/Addon_Webcam.html
---

# `{WebTwainObject}.Addon.Webcam`

> {WebTwainObject} denotes the `WebTwain` instance.

**Methods**

|                                                         |
| :------------------------------------------------------ | :-------------------------------------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| [`CaptureImage()`](#captureimage)                       | [`OpenSource()`](#opensource)                                 | [`CloseSource()`](#closesource)                                 | [`GetCameraControlPropertySetting()`](#getcameracontrolpropertysetting) |
| [`GetCameraControlPropertyMoreSetting()`](#getcameracontrolpropertymoresetting) | [`GetVideoPropertySetting()`](#getvideopropertysetting) | [`GetVideoPropertyMoreSetting()`](#getvideopropertymoresetting) | [`SetCameraControlPropertySetting()`](#setcameracontrolpropertysetting) |
| [`SetVideoPropertySetting()`](#setvideopropertysetting)                         | [`GetFrameRate()`](#getframerate)                       | [`SetFrameRate()`](#setframerate)                               | [`GetMediaType()`](#getmediatype)                                       |
| [`SetMediaType()`](#setmediatype)                                               | [`GetResolution()`](#getresolution)                     | [`SetResolution()`](#setresolution)                             | [`GetFramePartURL()`](#getframeparturl)                                 |
| [`GetFrameURL()`](#getframeurl)                                                 | [`GetSourceList()`](#getsourcelist)                     | [`SelectSource()`](#selectsource)                               | [`PauseVideo()`](#pausevideo)                                           |
| [`PlayVideo()`](#playvideo)                                                     | [`SetVideoRotateMode()`](#setvideorotatemode)           | [`StopVideo()`](#stopvideo)                                     |

## CaptureImage()

Capture an image from the current camera.

**Syntax**

```typescript
CaptureImage(
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error String

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
<td align="center">v10.2+ </td>
<td align="center">v10.2+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## GetSourceList()

Return a list of all available cameras.

**Syntax**

```typescript
GetSourceList(): string[];
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
<td align="center">v10.2+ </td>
<td align="center">v10.2+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## SelectSource()

Select a camera to use.

**Syntax**

```typescript
SelectSource(name: string): boolean;
```

**Parameters**

`name`: Specify the camera.

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
<td align="center">v10.2+ </td>
<td align="center">v10.2+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## CloseSource()

Close the current camera.

**Syntax**

```typescript
CloseSource(): boolean;
```

**Usage notes**

When you close the camera, the video stream will stop at the last frame.

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
<td align="center">v10.2+ </td>
<td align="center">v10.2+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## PlayVideo()

Start to play the video stream from the current camera.

**Syntax**

```typescript
PlayVideo(
    DWObject: WebTwain,
    quality: number,
    frameDidShow?: function () {}
): boolean;
```

**Parameters**

`DWObject`: Specify a WebTwain instance to show the video.

`quality`: Specify the quality of the video.

`frameDidShow`: A callback function that is triggered after each video frame is shown.

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## PauseVideo()

Pause the video.

**Syntax**

```typescript
PauseVideo(): boolean;
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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## StopVideo()

Stop the video.

**Syntax**

```typescript
StopVideo(): boolean;
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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

**Usage notes**

When you capture a frame, it's always the actual latest frame from the camera even if you have paused the video.

When you close the camera, the video stream will stop at the last frame.

---

## GetCameraControlPropertySetting()

Return information about the specified camera property. Please refer to [`CameraControlProperty`]({{site.info}}/api/interfaces.html#cameracontrolproperty).

**Syntax**

```typescript
GetCameraControlPropertySetting(
    property: Dynamsoft.DWT.EnumDWT_CameraControlProperty | number
): CameraControlProperty;
```

**Parameters**

`property`: Specify the property. Please refer to [EnumDWT_CameraControlProperty]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_cameracontrolproperty).

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## GetCameraControlPropertyMoreSetting()

Return detailed information about the specified camera property. Please refer to [`CameraControlPropertyExtra`]({{site.info}}/api/interfaces.html#cameracontrolpropertyextra).

**Syntax**

```typescript
GetCameraControlPropertyMoreSetting(
    property: Dynamsoft.DWT.EnumDWT_CameraControlProperty | number
): CameraControlPropertyExtra;
```

**Parameters**

`property`: Specify the property. Please refer to [EnumDWT_CameraControlProperty]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_cameracontrolproperty).

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## SetCameraControlPropertySetting()

Set the specified camera property.

**Syntax**

```typescript
SetCameraControlPropertySetting(
    property: Dynamsoft.DWT.EnumDWT_CameraControlProperty | number,
    value: number,
    auto: boolean
): boolean;
```

**Parameters**

`property`: Specify the property. Please refer to [EnumDWT_CameraControlProperty]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_cameracontrolproperty).

`value`: Specify the value.

`auto`: Specify whether the propery should change automatically.

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## GetVideoPropertySetting()

Return information about the specified video property. Please refer to [`VideoControlProperty`]({{site.info}}/api/interfaces.html#videocontrolproperty).

**Syntax**

```typescript
GetVideoPropertySetting(
    property: Dynamsoft.DWT.EnumDWT_VideoProperty | number
): VideoControlProperty;
```

**Parameters**

`property`: Specify the property. Please refer to [EnumDWT_VideoProperty]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_videoproperty).

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## GetVideoPropertyMoreSetting()

Return detailed information about the specified video property. Please refer to [`VideoControlPropertyExtra`]({{site.info}}/api/interfaces.html#videocontrolpropertyextra).

**Syntax**

```typescript
GetVideoPropertyMoreSetting(
    property: Dynamsoft.DWT.EnumDWT_VideoProperty | number
): VideoControlPropertyExtra;
```

**Parameters**

`property`: Specify the property. Please refer to [EnumDWT_VideoProperty]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_videoproperty).

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## SetVideoPropertySetting()

Set the specified video property.

**Syntax**

```typescript
SetVideoPropertySetting(
    property: Dynamsoft.DWT.EnumDWT_VideoProperty | number,
    value: number,
    auto: boolean
): boolean;
```

**Parameters**

`property`: Specify the property. Please refer to [EnumDWT_VideoProperty]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_videoproperty).

`value`: Specify the value.

`auto`: Specify whether the propery should change automatically.

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## GetFrameRate()

Return the frame rates supported by the current camera. Please refer to [`FrameRate`]({{site.info}}/api/interfaces.html#framerate).

**Syntax**

```typescript
GetFrameRate(): FrameRate;
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
<td align="center">not supported </td>
<td align="center">v14.3.1+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## GetMediaType()

Return the media types supported by the current camera. Please refer to [`MediaType`]({{site.info}}/api/interfaces.html#mediatype).

**Syntax**

```typescript
GetMediaType(): MediaType;
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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## GetResolution()

Return the resolutions supported by the current camera. Please refer to [`Resolution`]({{site.info}}/api/interfaces.html#resolution).

**Syntax**

```typescript
GetResolution(): Resolution;
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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## SetFrameRate()

Set the frame rate.

**Syntax**

```typescript
SetFrameRate(rate: number): boolean;
```

**Parameters**

`rate`: Specify the frame rate.

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## SetMediaType()

Set the media type.

**Syntax**

```typescript
SetMediaType(type: string): boolean;
```

**Parameters**

`type`: Sepcify the media type.

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## SetResolution()

Set the resolution.

**Syntax**

```typescript
SetResolution(resolution: string): boolean;
```

**Parameters**

`resolution`: Specify the resolution.

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

**Example**

```javascript
DWObject.Addon.Webcam.SetResolution("640 x 480");
```

---

## SetVideoRotateMode()

Rotate the video.

**Syntax**

```typescript
SetVideoRotateMode(
    mode: Dynamsoft.DWT.EnumDWT_VideoRotateMode | number
): boolean;
```

**Parameters**

`mode`: Specify the rotate mode. Please refer to [EnumDWT_VideoRotateMode]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_videorotatemode).

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## GetFrameURL()

Return the URL (http(s)://) for the latest frame.

**Syntax**

```typescript
GetFrameURL(): string;
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
<td align="center">not supported </td>
<td align="center">v14.3.1+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## GetFramePartURL()

Return the internal URL (dwt://) for the latest frame.

**Syntax**

```typescript
GetFramePartURL(): string;
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
<td align="center">v14.3.1+ </td>
<td align="center">v14.3.1+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

**Usage notes**

`GetFrameURL()` returns a public URL that can be used to access the frame directly by any applicatoin capable of HTTP requests that runs on the same machine. For example: `https://127.0.0.1:18623/dwt/dwt_16000428/img?id=853407158&index=-1&width=-1&height=-1&webcam=80&t=1590481406860`.

`GetFramePartURL()` returns an internal URL that only Dynamsoft libraries such as the Barcode Reader add-on can read. For example: `dwt://dwt_16000428/img?id=853407158&index=-1&width=-1&height=-1&webcam=80&t=1590481403659`.
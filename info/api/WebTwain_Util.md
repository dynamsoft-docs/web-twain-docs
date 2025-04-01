---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - Utility APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, Utility APIs
breadcrumbText: Utility
description: Dynamic Web TWAIN SDK Documentation API Reference Utility APIs Page
permalink: /info/api/WebTwain_Util.html
---

# {WebTwainObject} Util

The properties and methods on this page live in the namespace {WebTwainObject}. {WebTwainObject} denotes the `WebTwain` instance. Learn about [how to create a web twain object]({{site.indepth}}features/initialize.html#creating-the-webtwain-instance).

**Methods**


| [`RegisterEvent()`](#registerevent) | [`UnregisterEvent()`](#unregisterevent) | [`GenerateURLForUploadData()`](#generateurlforuploaddata) |

**Properties**


| [`ErrorCode`](#errorcode)  | [`ErrorCause`](#errorcause)             | [`ErrorString`](#errorstring) | [`LogLevel`](#loglevel)       | [`Manufacturer`](#manufacturer) |
| [`ProductFamily`](#productfamily)     | [`ProductName`](#productname) | [`VersionInfo`](#versioninfo) |


---

## RegisterEvent()

Specify an event listener for the specified built-in event.

**Syntax**

```typescript
RegisterEvent(name: string, callback: (...arg: any[]) => void): boolean;
```

**Parameters**

`name`: Specify the event.

`callback`: The event listener.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage notes**

There can only be one listener for each built-in event. If you call `RegisterEvent` on the same event again, the new callback will replace the old one.

---

## UnregisterEvent()

Remove an event listener from the specified built-in event.

**Syntax**

```typescript
UnregisterEvent(name: string, callback?: (...arg: any[]) => void): boolean;
```

**Parameters**

`name`: Specify the event.

`callback`: The event listener.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

---

## GenerateURLForUploadData()

Generate a URL to be used by a [FileUpoader]({{site.info}}api/Dynamsoft_FileUploader.html) instance to fetch the data to upload.

**Syntax**

```typescript
GenerateURLForUploadData(
    indices: number[],
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    successCallback: (
        resultURL: string,
        indices: number[],
        type: Dynamsoft.DWT.EnumDWT_ImageType | number
    ) => void,
    failureCallback: (
        errorCode: number,
        errorString: string
    ) => void
): void;
```

**Parameters**

`indices`: Specify the images to upload.

`type`: Specify the file type. Please refer to [`EnumDWT_ImageType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`successCallback`: A callback function that is executed if the request succeeds.
- `resultURL`: The generated URL.
- `indices`: The indices of the images.
- `type`: The file type. Please refer to [`EnumDWT_ImageType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v14.0+ </td>
<td align="center">v15.1+ </td>
<td align="center">v15.1+ </td>
<td align="center">v15.1+ </td>
</tr>

</table>
</div>

**Example**

```javascript
var dsUploadManager;
Dynamsoft.FileUploader.Init(
  "",
  function (obj) {
    dsUploadManager = obj;
  },
  function () {}
);
DWTObject.GenerateURLForUploadData(
  [0, 1],
  EnumDWT_ImageType.IT_PDF,
  function (resultURL, newIndices, enumImageType) {
    var serverUrl = "https://yoursite/yourserverurl.aspx";
    var jobtemp = dsUploadManager.CreateJob();
    jobtemp.ServerUrl = serverUrl;
    jobtemp.SourceValue.Add(resultURL, "uploadedFile.pdf");
    dsUploadManager.Run(jobtemp);
  },
  function (
    erroCode,
    errorString
  ) {}
);
```

---

## ErrorCode

Return the error code.

**Syntax**

```typescript
readonly ErrorCode: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage notes**

The [`ErrorCode`]({{site.info}}api/WebTwain_Util.html#errorcode) and [`ErrorString`]({{site.info}}api/WebTwain_Util.html#errorstring) always reflect the result of the last API call. So make sure you read them in time.

---

## ErrorCause

Return the error cause from the operating system.

**Syntax**

```typescript
readonly ErrorCause: null | {code: number, message: string};
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v19.0+ </td>
<td align="center">v19.0+ </td>
<td align="center">v19.0+ </td>
<td align="center">v19.0+ </td>
</tr>

</table>
</div>

---

## ErrorString

Return the error string.

**Syntax**

```typescript
readonly ErrorString: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage notes**

The [`ErrorCode`]({{site.info}}api/WebTwain_Util.html#errorcode) and [`ErrorString`]({{site.info}}api/WebTwain_Util.html#errorstring) always reflect the result of the last API call. So make sure you read them in time.

---

## LogLevel

Return or set the log level for debugging.

**Syntax**

```typescript
LogLevel: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage notes**

The logs for the Dynamic Web TWAIN library are saved in the directory:
  - Windows `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {versionnumber}\log`(version 18.5.1 and earlier `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{versionnumber}\log`) or `C:\Users\{UserName}\AppData\Roaming\Dynamsoft\Dynamic Web TWAIN Service\log`(version 18.5.1 and earlier `C:\Users\{UserName}\AppData\Roaming\Dynamsoft\DynamsoftService\log`)
  - macOS, `Go > Applications > Dynamsoft > Dynamic Web TWAIN Service {versionnumber} > log`(version 18.5.1 and earlier `Go > Applications > Dynamsoft > DynamsoftServicex64_{versionnumber} > {installed version No.} > log`)
  - Linux:  `/opt/dynamsoft/Dynamic Web TWAIN Service {versionnumber}/log`(version 18.5.1 and earlier `/opt/dynamsoft/DynamsoftService/log`)

By default, `LogLevel` is 0 and nothing is recorded. When it is set to 1, all debugging information is recorded. This setting in your application will apply to all machines. Please set it back to 0 if you don't need to record log as it will slow down the speed.

---

## Manufacturer

Manufacturer in the identity string of the Dynamic Web TWAIN library.

**Syntax**

```typescript
readonly Manufacturer: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage notes**

[`Manufacturer`]({{site.info}}api/WebTwain_Util.html#manufacturer), [`ProductFamily`]({{site.info}}api/WebTwain_Util.html#productfamily), [`ProductName`]({{site.info}}api/WebTwain_Util.html#productname) and [`VersionInfo`]({{site.info}}api/WebTwain_Util.html#versioninfo) together form the identity string of the Dynamic Web TWAIN library.

---

## ProductFamily

ProductFamily in the identity string of the Dynamic Web TWAIN library.

**Syntax**

```typescript
readonly ProductFamily: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage notes**

[`Manufacturer`]({{site.info}}api/WebTwain_Util.html#manufacturer), [`ProductFamily`]({{site.info}}api/WebTwain_Util.html#productfamily), [`ProductName`]({{site.info}}api/WebTwain_Util.html#productname) and [`VersionInfo`]({{site.info}}api/WebTwain_Util.html#versioninfo) together form the identity string of the Dynamic Web TWAIN library.

---

## ProductName

ProductName in the identity string of the Dynamic Web TWAIN library.

**Syntax**

```typescript
readonly ProductName: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage notes**

[`Manufacturer`]({{site.info}}api/WebTwain_Util.html#manufacturer), [`ProductFamily`]({{site.info}}api/WebTwain_Util.html#productfamily), [`ProductName`]({{site.info}}api/WebTwain_Util.html#productname) and [`VersionInfo`]({{site.info}}api/WebTwain_Util.html#versioninfo) together form the identity string of the Dynamic Web TWAIN library.

---

## VersionInfo

VersionInfo in the identity string of the Dynamic Web TWAIN library.

**Syntax**

```typescript
readonly VersionInfo: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage notes**

[`Manufacturer`]({{site.info}}api/WebTwain_Util.html#manufacturer), [`ProductFamily`]({{site.info}}api/WebTwain_Util.html#productfamily), [`ProductName`]({{site.info}}api/WebTwain_Util.html#productname) and [`VersionInfo`]({{site.info}}api/WebTwain_Util.html#versioninfo) together form the identity string of the Dynamic Web TWAIN library.



<div class="multi-panel-switching-end"></div>
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

<div class="multi-panel-switching-prefix"></div>

- [Desktop Service](#desktop) 
- [Android Service](#android) 

<div class="multi-panel-start"></div>

**Methods**

|                                                                        |
| :--------------------------------------------------------------------- | :------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| [`isUsingActiveX()`](#isusingactivex) |[`RegisterEvent()`](#registerevent) | [`UnregisterEvent()`](#unregisterevent)                   | [`SetLanguage()`](#setlanguage)     |
| [`GenerateURLForUploadData()`](#generateurlforuploaddata) |

**Properties**

|                                       |
| :------------------------------------ | :---------------------------- | ----------------------------- | ------------------------------- |
| [`ErrorCode`](#errorcode)             | [`ErrorString`](#errorstring) | [`LogLevel`](#loglevel)       | [`Manufacturer`](#manufacturer) |
| [`ProductFamily`](#productfamily)     | [`ProductName`](#productname) | [`VersionInfo`](#versioninfo) |

<div class="multi-panel-end">

</div><div class="multi-panel-start"></div>

>The Android Service Edition only supports a subset of the APIs available in the Desktop Service Edition. For the APIs that are compatible with both editions, the usage remains the same. To learn how to use the APIs, please refer to the documentation for the Desktop Service Edition.

**Methods**

|                                                                        |
| :--------------------------------------------------------------------- | :------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| [`isUsingActiveX()`](#isusingactivex) |[`RegisterEvent()`](#registerevent) | [`UnregisterEvent()`](#unregisterevent)|
|[`GenerateURLForUploadData()`](#generateurlforuploaddata)|

**Properties**

|                                       |
| :------------------------------------ | :---------------------------- | ----------------------------- | ------------------------------- |
| [`ErrorCode`](#errorcode)             | [`ErrorString`](#errorstring) | [`LogLevel`](#loglevel)       | [`Manufacturer`](#manufacturer) |
| [`ProductFamily`](#productfamily)     | [`ProductName`](#productname) | [`VersionInfo`](#versioninfo) |

<div class="multi-panel-end"></div>

---

## isUsingActiveX

Return whether the WebTwain object is running the ActiveX edition.

**Syntax**

```typescript
isUsingActiveX(): boolean;
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
<td align="center">all versions </td>
<td align="center">all versions </td>
<td align="center">all versions </td>
<td align="center">all versions </td>
<td align="center">all versions </td>
</tr>

</table>
</div>

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
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v9.2+ </td>
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
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v9.2+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

---

## SetLanguage()

Set the language for the authorization dialogs.

**Syntax**

```typescript
SetLanguage(
    language: Dynamsoft.DWT.EnumDWT_Language | number
): boolean;
```

**Parameters**

`language`: Specify the language. Please refer to [`EnumDWT_Language`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_language).

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
<td align="center">v13.0+ </td>
<td align="center">v13.0+ </td>
<td align="center">v13.0+ </td>
<td align="center">v13.0+ </td>
</tr>

</table>
</div>

**Usage notes**

The language set with this method is only for the built-in security dialogs which show up when the user tries to access a scanner, a camera or a local file.

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
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported </td>
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
DWObject.GenerateURLForUploadData(
  [0, 1],
  EnumDWT_ImageType.IT_PDF,
  function (resultURL) {
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
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v1.0+ </td>
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
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v1.0+ </td>
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
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v6.3+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage notes**

The logs for the Dynamic Web TWAIN library are saved in the directory:
  - Windows `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_17\log` or `C:\Users\{UserName}\AppData\Roaming\Dynamsoft\DynamsoftService\log`
  - macOS, `Go > Applications > Dynamsoft > DynamsoftServicex64_17 > {installed version No.} > log`
  - Linux, `/opt/dynamsoft/DynamsoftService/log`

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
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v1.0+ </td>
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
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v1.0+ </td>
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
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v1.0+ </td>
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
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v1.0+ </td>
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
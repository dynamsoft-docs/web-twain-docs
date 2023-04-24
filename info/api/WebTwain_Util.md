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

|                                                                        |
| :--------------------------------------------------------------------- | :------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| [`RegisterEvent()`]({{site.info}}api/WebTwain_Util.html#registerevent) | [`UnregisterEvent()`]({{site.info}}api/WebTwain_Util.html#unregisterevent)                   | [`SetLanguage()`]({{site.info}}api/WebTwain_Util.html#setlanguage)     |
| [`GenerateURLForUploadData()`]({{site.info}}api/WebTwain_Util.html#generateurlforuploaddata) |

**Properties**

|                                       |
| :------------------------------------ | :---------------------------- | ----------------------------- | ------------------------------- |
| [`ErrorCode`](#errorcode)             | [`ErrorString`](#errorstring) | [`LogLevel`](#loglevel)       | [`Manufacturer`](#manufacturer) |
| [`ProductFamily`](#productfamily)     | [`ProductName`](#productname) | [`VersionInfo`](#versioninfo) |

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
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## RegisterEvent

Specify an event listener for the specified built-in event.

**Syntax**

```typescript
RegisterEvent(name: string, callback: () => void): boolean;
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

## UnregisterEvent

Remove an event listener from the specified built-in event.

**Syntax**

```typescript
UnregisterEvent(name: string, callback: () => void): boolean;
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

## SetLanguage

Set the language for the authorization dialogs.

**Syntax**

```typescript
SetLanguage(
    language: Dynamsoft.DWT.EnumDWT_Language | number
): boolean;
```
Enumerations：<a href="{{{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_language" target="_blank">Dynamsoft.DWT.EnumDWT_Language</a>
 
**Parameters**

`language`: Specify the language. Please refer to [EnumDWT_Language]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_language)

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

## GenerateURLForUploadData

Generate a URL to be used by a FileUpoader instance to fetch the data to upload.

**Syntax**

```typescript
/**
 * 
 * @param indices Specify the images to upload.
 * @param type Specify the file type.
 * @param successCallback A callback function that is executed if the request succeeds.
 * @param failureCallback A callback function that is executed if the request fails.
 * @argument resultURL The generated URL.
 * @argument indices The indices of the images.
 * @argument type The file type.
 */
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

`type`: Specify the file type. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`successCallback`: A callback function that is executed if the request succeeds.
- `resultURL`: The generated URL.
- `indices`: The indices of the images.
- `type`: The file type. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

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

The `ErrorCode` and `ErrorString` always reflect the result of the last API call. So make sure you read them in time.

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

The `ErrorCode` and `ErrorString` always reflect the result of the last API call. So make sure you read them in time.

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

The logs for the Dynamic Web TWAIN library are saved in the directory `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_17\log\`. By default, `LogLevel` is 0 and nothing is recorded. When it is set to 1, all debugging information is recorded. This setting in your application will apply to all machines. Please set it back to 0 if you don't need to record log as it will slow down the speed.

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

`Manufacturer` , `ProductFamily` , `ProductName` and `VersionInfo` together form the identity string of the Dynamic Web TWAIN library.

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

`Manufacturer` , `ProductFamily` , `ProductName` and `VersionInfo` together form the identity string of the Dynamic Web TWAIN library.

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

`Manufacturer` , `ProductFamily` , `ProductName` and `VersionInfo` together form the identity string of the Dynamic Web TWAIN library.

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

`Manufacturer` , `ProductFamily` , `ProductName` and `VersionInfo` together form the identity string of the Dynamic Web TWAIN library.
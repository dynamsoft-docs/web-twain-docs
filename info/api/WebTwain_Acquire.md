---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - Acquire APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, Acquire APIs
breadcrumbText: Acquire
description: Dynamic Web TWAIN SDK Documentation API Reference Acquire APIs Page
permalink: /info/api/WebTwain_Acquire.html
---


# {WebTwainObject} Scan

> The properties and methods on this page live in the namespace {WebTwainObject}. {WebTwainObject} denotes the `WebTwain` instance. Learn more about creating `WebTwain` instances [here]({{site.general-usage}}initialization.html).

<div class="multi-panel-switching-prefix"></div>

- [Desktop Service](#desktop) 
- [Android Service](#android) 

<div class="multi-panel-start"></div>

**1. The following APIs are compatible with TWAIN, ICA, and SANE (Windows, macOS and Linux)** 

**Methods**

|                                                   |                                                 |                                                           |                                             |
| ------------------------------------------------- | ----------------------------------------------- | --------------------------------------------------------- | ------------------------------------------- |
| [`GetSourceNameItems()`](#getsourcenameitems)     | [`GetSourceNames()`](#getsourcenames)           | [`GetSourceNamesAsync()`](#getsourcenamesasync)           | [`SelectSource()`](#selectsource)           |
| [`SelectSourceAsync()`](#selectsourceasync)       | [`SelectSourceByIndex()`](#selectsourcebyindex) | [`SelectSourceByIndexAsync()`](#selectsourcebyindexasync) | [`OpenSource()`](#opensource)               |
| [`OpenSourceAsync()`](#opensourceasync)           | [`EnableSourceUI()`](#enablesourceui)           | [`EnableSource()`](#enablesource)                         | [`AcquireImage()`](#acquireimage)           |
| [`AcquireImageAsync()`](#acquireimageasync)       | [`startScan()`](#startscan)                     | [`DisableSource()`](#disablesource)                       | [`CloseSource()`](#closesource)             |
| [`CloseSourceAsync()`](#closesourceasync)         | [`CloseWorkingProcess()`](#closeworkingprocess) | [`GetDevicesAsync()`](#getdevicesasync)                   | [`SelectDeviceAsync()`](#selectdeviceasync) |
| [`SetOpenSourceTimeout()`](#setopensourcetimeout) |

**Properties**

|                                           |                                                              |                                       |                                       |
| ----------------------------------------- | ------------------------------------------------------------ | ------------------------------------- | ------------------------------------- |
| [`CurrentSourceName`](#currentsourcename) | [`IfDisableSourceAfterAcquire`](#ifdisablesourceafteracquire) | [`IfDuplexEnabled`](#ifduplexenabled) | [`IfFeederEnabled`](#iffeederenabled) |
| [`PageSize`](#pagesize)                   | [`PixelType`](#pixeltype)                                    | [`Resolution`](#resolution)           | [`SourceCount`](#sourcecount)         |

**Events**

|                                             |                                     |                                               |                                           |
| ------------------------------------------- | ----------------------------------- | --------------------------------------------- | ----------------------------------------- |
| [`OnPostAllTransfers`](#onpostalltransfers) | [`OnPostTransfer`](#onposttransfer) | [`OnPostTransferAsync`](#onposttransferasync) | [`OnPreAllTransfers`](#onprealltransfers) |
| [`OnPreTransfer`](#onpretransfer)           |                                     |                                               |                                           |



**2. The following APIs are compatible with TWAIN and ICA** 

**Methods**

|                                         |                                         |
| --------------------------------------- | --------------------------------------- |
| [`getCapabilities()`](#getcapabilities) | [`setCapabilities()`](#setcapabilities) |

**3. The following APIs are compatible with TWAIN (mostly Windows, but also possibly macOS)** 

**Methods**

|                                             |                                                       |                                                             |                                                         |
| ------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------- |
| [`OpenSourceManager()`](#opensourcemanager) | [`OpenSourceManagerAsync()`](#opensourcemanagerasync) | [`CloseSourceManager()`](#closesourcemanager)               | [`CloseSourceManagerAsync()`](#closesourcemanagerasync) |
| [`GetCustomDSData()`](#getcustomdsdata)     | [`GetCustomDSDataEx()`](#getcustomdsdataex)           | [`CancelAllPendingTransfers()`](#cancelallpendingtransfers) | [`FeedPage()`](#feedpage)                               |
| [`ResetImageLayout()`](#resetimagelayout)   | [`RewindPage()`](#rewindpage)                         | [`SetCustomDSData()`](#setcustomdsdata)                     | [`SetCustomDSDataEx()`](#setcustomdsdataex)             |
| [`SetFileXferInfo()`](#setfilexferinfo)     | [`SetImageLayout()`](#setimagelayout)                 |                                |                                                         |


**Properties**

|                                                     |                                                             |                                                     |                                                           |
| --------------------------------------------------- | ----------------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------------- |
| [`BitDepth`](#bitdepth)                             | [`Brightness`](#brightness)                                 | [`Contrast`](#contrast)                             | [`DataSourceStatus`](#datasourcestatus)                   |
| [`DefaultSourceName`](#defaultsourcename)           | [`Duplex`](#duplex)                                         | [`IfAutoBright`](#ifautobright)                     | [`IfAutoDiscardBlankpages`](#ifautodiscardblankpages)     |
| [`IfAutoFeed`](#ifautofeed)                         | [`IfAutomaticBorderDetection`](#ifautomaticborderdetection) | [`IfAutomaticDeskew`](#ifautomaticdeskew)           | [`IfAutoScan`](#ifautoscan)                               |
| [`IfFeederLoaded`](#iffeederloaded)                 | [`IfPaperDetectable`](#ifpaperdetectable)                   | [`IfShowIndicator`](#ifshowindicator)               | [`IfShowUI`](#ifshowui)                                   |
| [`IfUIControllable`](#ifuicontrollable)             | [`IfUseTwainDSM`](#ifusetwaindsm)                           | [`ImageCaptureDriverType`](#imagecapturedrivertype) | [`ImageLayoutDocumentNumber`](#imagelayoutdocumentnumber) |
| [`ImageLayoutFrameBottom`](#imagelayoutframebottom) | [`ImageLayoutFrameLeft`](#imagelayoutframeleft)             | [`ImageLayoutFrameNumber`](#imagelayoutframenumber) | [`ImageLayoutFrameRight`](#imagelayoutframeright)         |
| [`ImageLayoutFrameTop`](#imagelayoutframetop)       | [`ImageLayoutPageNumber`](#imagelayoutpagenumber)           | [`ImagePixelType`](#imagepixeltype)                 | [`MagData`](#magdata)                                     |
| [`MagType`](#magtype)                               | [`PendingXfers`](#pendingxfers)                             | [`PixelFlavor`](#pixelflavor)                       | [`TransferMode`](#transfermode)                           |
| [`Unit`](#unit)                                     | [`XferCount`](#xfercount)                                   | [`IfAppendImage`](#ifappendimage)                   |                                                           |

**Events**

|                                       |
| ------------------------------------- |
| [`OnSourceUIClose`](#onsourceuiclose) |

<div class="multi-panel-end">

</div><div class="multi-panel-start"></div>

>Note: The Android Service Edition only supports a subset of the APIs available in the Desktop Service Edition. For the APIs that are compatible with both editions, the usage remains the same. To learn how to use the APIs, please refer to the documentation for the Desktop Service Edition.

**Methods**

|                                             |                                           |                                         |                                             |
| ------------------------------------------- | ----------------------------------------- | --------------------------------------- | ------------------------------------------- |
| [`SelectSourceAsync()`](#selectsourceasync) | [`CloseSourceAsync()`](#closesourceasync) | [`GetDevicesAsync()`](#getdevicesasync) | [`SelectDeviceAsync()`](#selectdeviceasync) |
| [`AcquireImageAsync()`](#acquireimageasync) | [`getCapabilities()`](#getcapabilities)   | [`setCapabilities()`](#setcapabilities) |                                             |


**Events**

|                                       |
| ------------------------------------- |
| [`OnPostTransferAsync`](#onposttransferasync)  |

<div class="multi-panel-end"></div>


---

## AcquireImage()

Request a scan, then store to the image buffer of the WebTwain instance upon completion of the scan.
<!--Possibly some other descriptions, no need to add for now-->
By default, the scans are displayed from the `dwtcontrolContainer` container.

**Syntax**

```typescript
AcquireImage(): void;

AcquireImage(
  deviceConfiguration: DeviceConfiguration
): void;

AcquireImage(
  successCallBack: () => void,
  failureCallBack: (
    errorCode: number,
    errorString: string) => void
): void;

AcquireImage(
  deviceConfiguration: DeviceConfiguration,
  successCallBack: () => void,
  failureCallBack: (
      deviceConfiguration: DeviceConfiguration,
      errorCode: number,
      errorString: string) => void
): void;
```

**Parameters**

`deviceConfiguration`: Configuration for the acquisition. Please refer to [`DeviceConfiguration`]({{site.info}}api/Interfaces.html#DeviceConfiguration).

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
</tr>

<tr>
<td align="center">v1.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

> The example code shows 4 ways to use the API `AcquireImage()`

```javascript
var deviceConfiguration = {
  IfShowUI: false,
  PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB,
  Resolution: 300,
  IfFeederEnabled: true,
  IfDuplexEnabled: false,
  IfDisableSourceAfterAcquire: true,
  IfGetImageInfo: true,
  IfGetExtImageInfo: true,
  extendedImageInfoQueryLevel: 0,
  IfCloseSourceAfterAcquire: true,
};

function successCallback() {
  DWTObject.CloseSource();
  console.log("successful");
}

function failureCallback(errorCode, errorString) {
  DWTObject.CloseSource();
  alert(errorString);
}

function AcquireImage1() {
  DWTObject.SelectSource(function () {
    DWTObject.OpenSource();
    DWTObject.IfShowUI = false;
    DWTObject.PixelType = Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB;
    DWTObject.Resolution = 300;
    DWTObject.IfFeederEnabled = true;
    DWTObject.IfDuplexEnabled = false;
    DWTObject.IfDisableSourceAfterAcquire = true;
    DWTObject.AcquireImage();
  }, failureCallback);
}

function AcquireImage2() {
  DWTObject.SelectSource(function () {
    DWTObject.OpenSource();
    DWTObject.AcquireImage(deviceConfiguration);
  }, failureCallback);
}

function AcquireImage3() {
  DWTObject.SelectSource(function () {
    DWTObject.OpenSource();
    DWTObject.IfShowUI = false;
    DWTObject.PixelType = Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB;
    DWTObject.Resolution = 300;
    DWTObject.IfFeederEnabled = true;
    DWTObject.IfDuplexEnabled = false;
    DWTObject.IfDisableSourceAfterAcquire = true;
    DWTObject.AcquireImage(successCallback, failureCallback);
  }, failureCallback);
}

function AcquireImage4() {
  DWTObject.SelectSource(function () {
    DWTObject.OpenSource();
    DWTObject.AcquireImage(
      deviceConfiguration,
      successCallback,
      failureCallback
    );
  }, failureCallback);
}
```

---

## CloseSource()

Close the data source (a TWAIN/ICA/SANE device, which in most cases is a scanner) to free it to be used by other applications.

**Syntax**

```typescript
CloseSource(): boolean;
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
<td align="center">v1.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
// Close the scanner source in the success/failure callback after all images are acquired. In this case, the source can be freed and used by others.
DWTObject.OpenSource();
DWTObject.AcquireImage(successCallback,failureCallback);

function successCallback() {
  console.log("successful");
  DWTObject.CloseSource();
}

function failureCallback(errorCode, errorString) {
  alert(errorString);
  DWTObject.CloseSource();
}
```

---

## CloseSourceAsync()

Close the data source (a TWAIN/ICA/SANE device, which in most cases is a scanner) to free it to be used by other applications.

**Syntax**

```typescript
CloseSourceAsync(): Promise<boolean>;
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
<td align="center">v18.0+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

---

## DisableSource()

Disable the data source (a TWAIN/ICA/SANE device, which in most cases is a scanner) to stop the acquisition process. This also closes the data source's user interface, if it is displayed.

**Syntax**

```typescript
DisableSource(): boolean;
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
<td align="center">v1.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

After calling `DisableSource()`, the data source remains open, and you can continue to acquire images by calling [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage) or [`EnableSource()`]({{site.info}}api/WebTwain_Acquire.html#enablesource).

---

## EnableSource()

Enable the data source to start the acquisition process.

**Syntax**

```typescript
EnableSource(): boolean;
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
<td align="center">v1.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

The method is equivalent to `AcquireImage()` without parameters.

---

## EnableSourceUI()

Display the TWAIN source's built-in user interface.

**Syntax**

```typescript
EnableSourceUI(
    successCallBack: () => void,
    failureCallBack: (errorCode: number, errorString: string) => void
): boolean;
```

**Parameters**

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
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
</tr>

</table>
</div>

**Usage notes**

This method enables the user to manipulate the scan settings without actually starting a scan. It only works if the source supports the capability `CAP_ENABLEDSUIONLY`. You can call [`GetCustomDSDataEx()`](#getcustomdsdataex) to save the settings in the callback `successCallBack`. You can then call [`SetCustomDSDataEx()`](#setcustomdsdataex) at a later time to apply these settings before starting a scan.

---

## OpenSource()

Load a data source to prepare it for image acquisition.

**Syntax**

```typescript
OpenSource(): boolean;
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
<td align="center">v1.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.GetSourceNames(); // for example ['PaperStream IP fi-7300NX Net', 'TWAIN2 FreeImage Software Scanner']
DWTObject.SelectSourceByIndex(0); // choose scanner with the name "PaperStream IP fi-7300NX Net"
DWTObject.OpenSource();
DWTObject.AcquireImage(successCallback, failureCallback);

function successCallback() {
  DWTObject.CloseSource();
  console.log("successful");
}

function failureCallback(errorCode, errorString) {
  DWTObject.CloseSource();
  alert(errorString);
}
```

---

## OpenSourceAsync()

Load a data source to prepare it for image acquisition.

**Syntax**

```typescript
OpenSourceAsync(): Promise<boolean>;
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
<td align="center">v18.0+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
</tr>

</table>
</div>

---

## GetSourceNames()

Return all available data sources (scanners, etc.), and optionally all detailed information about them.

**Syntax**

```typescript
GetSourceNames(bIncludeDetails?: boolean): string[] | SourceDetails[];
```

**Parameters**

`bIncludeDetails`: Whether to return more details about the data sources or just their names.

**Arguments**

`SourceDetails`: Please refer to [`SourceDetails`]({{site.info}}api/Interfaces.html#sourcedetails).

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

**Example**

```javascript
DWTObject.GetSourceNames(); // return a list of scanner sources such as ['PaperStream IP fi-7300NX Net', 'TWAIN2 FreeImage Software Scanner']
```

---

## GetSourceNamesAsync()

Return all available data sources (scanners, etc.) and optionally all detailed information about them.

**Syntax**

```typescript
GetSourceNamesAsync(bIncludeDetails: boolean): Promise<string[] | ISourceDetails[]>;
```

**Parameters**

`bIncludeDetails`: Whether to return more details about the data sources or just their names.

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
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
</tr>

</table>
</div>

---

## SelectSource()

Bring up the Source Selection User Interface (UI) for the user to choose a data source.

**Syntax**

```typescript
SelectSource(): boolean | string;

// Call this API asynchronously to avoid blocking the browser's main thread 
SelectSource(
    successCallBack: () => void,
    failureCallBack: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

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
</tr>

<tr>
<td align="center">v1.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

**Usage notes**

- We recommend calling this API asynchronously by passing arguments to `successCallback` and `failureCallback`.
- **Windows only**: you can call this API without arguments, in which case it runs synchronously and returns a boolean value.

**Example**

```javascript
DWTObject.SelectSource(
  function () {
    DWTObject.OpenSource();
    DWTObject.AcquireImage(successCallback, failureCallback);
  },
  function (errorCode, errorString) {
    console.log(errorString);
  }
);

function successCallback() {
  DWTObject.CloseSource();
  console.log("successful");
}

function failureCallback(errorCode, errorString) {
  DWTObject.CloseSource();
  console.log(errorString);
}

```

---

## SelectSourceAsync()

Bring up the Source Selection User Interface (UI) for the user to choose a data source.

**Syntax**

```typescript
SelectSourceAsync(deviceType?: Dynamsoft.DWT.EnumDWT_DeviceType | number): Promise<number>;
```

**Parameters**

`deviceType`: Specify the device type of scanners. Please refer to [`EnumDWT_DeviceType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_devicetype).

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
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.SelectSourceAsync()
  .then(function (sourceIndex) {
    console.log(sourceIndex);
    return DWTObject.AcquireImageAsync({
      IfCloseSourceAfterAcquire: true,
    });
  })
  .catch(function (e) {
    console.log(e);
  });
```

---

## SelectSourceByIndex()

Select a data source by its index.

**Syntax**

```typescript
SelectSourceByIndex(index: number): boolean;
```

**Parameters**

`index`: The index of the data source.

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
<td align="center">v1.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.GetSourceNames(); // for example ['PaperStream IP fi-7300NX Net', 'TWAIN2 FreeImage Software Scanner']
DWTObject.SelectSourceByIndex(0); // choose scanner with the name "PaperStream IP fi-7300NX Net"
DWTObject.OpenSource();
DWTObject.AcquireImage(successCallback, failureCallback);

function successCallback() {
  DWTObject.CloseSource();
  console.log("successful");
}

function failureCallback(errorCode, errorString) {
  DWTObject.CloseSource();
  console.log(errorString);
}
```

---

## SelectSourceByIndexAsync()

Select a data source by its index.

**Syntax**

```typescript
SelectSourceByIndexAsync(index: number): Promise<boolean>;
```

**Parameters**

`index`: The index of the data source.

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
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.SelectSourceByIndexAsync(0)
  .then(() => {
    return DWTObject.OpenSourceAsync();
  })
  .then(() => {
    return DWTObject.AcquireImageAsync({
      IfCloseSourceAfterAcquire: true,
    });
  });
```

---

## SetOpenSourceTimeout()

Set a timer which stops the data source opening process once it expires.

**Syntax**

```typescript
SetOpenSourceTimeout(duration: number): boolean;
```

**Parameters**

`duration`: Set the duration of the timer (in milliseconds).

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
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.SelectSource(function () {
  DWTObject.SetOpenSourceTimeout(3000); // stop the opening process if the source cannot be opened within 3000 ms.
  DWTObject.OpenSource();
  DWTObject.AcquireImage();
});
```

---

## startScan()

Start the acquisition by passing all settings at once.

**Syntax**

```typescript
startScan(scanSetup: ScanSetup): Promise<ScanSetup>;
```

**Parameters**

`scanSetup`: Configuration for the acquisition. Please refer to [`ScanSetup`]({{site.info}}api/Interfaces.html#scansetup).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows/TWAIN)</td>
<td align="center">H5(Windows/WIA)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(macOS/eSCL)</td>
<td align="center">H5(Linux/SANE)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v15.0+</td>
<td align="center">v18.5+</td>
<td align="center">v15.1+</td>
<td align="center">v15.1+</td>
<td align="center">v18.5+</td>
<td align="center">v15.1+</td>
</tr>

</table>
</div>

**Sample**

<a href="https://demo.dynamsoft.com/Samples/dwt/Make-use-of-the-API-startScan/index.html" target="_blank">Make use of the API startScan </a>

---

## CancelAllPendingTransfers()

Cancel all pending transfers.

**Syntax**

```typescript
CancelAllPendingTransfers(): boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

This method is only valid in the events [`OnPreAllTransfers`](#onprealltransfers), [`OnPreTransfer`](#onpretransfer) and [`OnPostTransfer`](#onposttransfer).

---

## CloseSourceManager()

Close and unload the Data Source Manager.

**Syntax**

```typescript
CloseSourceManager(): boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.CloseSourceManager();
```

---

## CloseSourceManagerAsync()

Close and unload the Data Source Manager.

**Syntax**

```typescript
CloseSourceManagerAsync(): Promise<boolean>;
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
<td align="center">v18.0+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
</tr>

</table>
</div>

---

## CloseWorkingProcess()

Close the scanning process to release resources on the machine.

**Syntax**

```typescript
CloseWorkingProcess(): boolean;
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
<td align="center">v11.2+</td>
<td align="center">v11.2+</td>
<td align="center">v11.2+</td>
<td align="center">v11.2+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

In the HTML5 edition, Dynamic Web TWAIN uses a separate process to communicate with the scanners. When not scanning, you can choose to close this process to free up resources on the end user's machine. (CPU, memory, etc.)

---

## FeedPage()

Eject the current page and begin scanning the next page in the document feeder.

**Syntax**

```typescript
FeedPage(): boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Use this method after calling [`OpenSource()`](#opensource), and make sure [`IfFeederEnabled`](#iffeederenabled) is `true` .

---

## GetCustomDSData()

Get the custom data source data and save the data to a specified file.

**Syntax**

```typescript
GetCustomDSData(fileName: string): boolean;
```

**Parameters**

`fileName`: The path of the file to save the data source data to.

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
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Typically, the data source data file is set by the method [`SetCustomDSData()`](#setcustomdsdata).

**Example**

```javascript
// Please note, the API only works for TWAIN driver.
DWTObject.GetCustomDSData("C:\\Users\\UserName\\Desktop\\ProfileName");
```

---

## GetCustomDSDataEx()

Get custom DS data and return it in a base64 string.

**Syntax**

```typescript
GetCustomDSDataEx(): string;
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
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Typically, the data source data file is set by the method [`SetCustomDSDataEx()`](#setcustomdsdataex).

**Example**

```javascript
// Please note, the API only works for TWAIN driver.
DWTObject.GetCustomDSDataEx(); // Return a base64 string
```

---

## GetSourceNameItems()

Get the name of a data source by its index in the data source manager source list.

**Syntax**

```typescript
GetSourceNameItems(index: number): string;
```

**Parameters**

`index`: The index of the data source.

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
<td align="center">v7.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.GetSourceNames(); // [scanner 1, scanner 2, scanner 3...]
DWTObject.GetSourceNameItems(0); // return the name of scanner 1
```

---

## OpenSourceManager()

Load and open the data source manager.

**Syntax**

```typescript
OpenSourceManager(): boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

If application identification needs to be set, it should be set before calling this API.

**Example**

```javascript
DWTObject.OpenSourceManager(); 
```

---

## OpenSourceManagerAsync()

Load and open the data source manager.

**Syntax**

```typescript
OpenSourceManagerAsync(): Promise<boolean>;
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
<td align="center">v18.0+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
<td align="center">v16.1+</td>
</tr>

</table>
</div>

**Usage notes**

If application identification needs to be set, it should be set before calling this API.

---

## ResetImageLayout()

Reset the image layout in the data source.

**Syntax**

```typescript
ResetImageLayout(): boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

You can use [`SetImageLayout()`](#setimagelayout) to set the image layout manually.

---

## RewindPage()

If called while the `{IfFeederEnabled}` property is true, the data source will return the current page to the input area, and return the last page from the output area into the acquisition area.

**Syntax**

```typescript
RewindPage(): boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Use this API after calling [`OpenSource()`](#opensource), and make sure [`IfFeederEnabled`](#iffeederenabled) is `true` .

---

## SetCustomDSData()

Set custom data source data to be used for scanning. The data is stored in a file which may be regarded as a scanning profile.

**Syntax**

```typescript
SetCustomDSData(fileName: string): boolean;
```

**Parameters**

`fileName`: The path  of the file.

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
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Typically, the data source data file is created by the method [`GetCustomDSData()`](#getcustomdsdata).

**Example**

```javascript
// Please note, the API only works for TWAIN driver.
DWTObject.SetCustomDSData("C:\\Users\\UserName\\Desktop\\ProfileName");
```

---

## SetCustomDSDataEx()

Set custom data source data to be used for scanning. The input format is a base64 string.

**Syntax**

```typescript
SetCustomDSDataEx(dsDataString: string): boolean;
```

**Parameters**

`dsDataString`: The string that contains custom data source data.

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
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Typically the data source data string is created by the method [`GetCustomDSDataEx()`](#getcustomdsdataex)

```javascript
// Please note, the API only works for TWAIN driver.
DWTObject.SetCustomDSData("the base64 string of your profile");
```

---

## SetFileXferInfo()

Set the file transfer information to be used in File Transfer mode.

**Syntax**

```typescript
SetFileXferInfo(
    fileName: string,
    fileFormat: Dynamsoft.DWT.EnumDWT_FileFormat | number
): boolean;
```

**Parameters**

`fileName`: The path to transfer the file to.

`fileFormat`: The format of the file.

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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v17.0+</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Make sure the format you set is supported by the data source.

Example argument for the parameter `fileName`

- "C:\\webtwain.jpg": The next scanned image will be compressed as a JPEG file named `webtwain` and transferred to "C:\\".
- "C:\\webtwain" + <> + ".jpg": The scanned images will result in "C:\\webtwain1.jpg", "C:\\webtwain2.jpg", "C:\\webtwain3.jpg", etc.
- "C:\\webtwain" + <%06d> + ".jpg": The scanned images will result in "C:\\webtwain000001.jpg", "C:\\webtwain000002.jpg", "C:\\webtwain000003.jpg", etc.

Available file formats are defined in [`Dynamsoft.DWT.EnumDWT_FileFormat`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_fileformat).

**Example**

```javascript
DWTObject.OpenSource();
DWTObject.TransferMode = Dynamsoft.DWT.EnumDWT_TransferMode.TWSX_FILE;
if (DWTObject.TransferMode === Dynamsoft.DWT.EnumDWT_TransferMode.TWSX_FILE) {
    if (
        DWTObject.SetFileXferInfo(
            "C:\\Temp\\WebTWAIN<%06d>.bmp",
            Dynamsoft.DWT.EnumDWT_FileFormat.TWFF_BMP
        )
    ) {
          DWTObject.IfShowUI = true;
          DWTObject.AcquireImage(successCallback, failureCallback);
    }
}

function successCallback() {
  DWTObject.CloseSource();
  console.log("successful");
}

function failureCallback(errorCode, errorString) {
  DWTObject.CloseSource();
  console.log(errorString);
}
```

---

## SetImageLayout()

Set the image layout rectangle for the current data source by specifying the rectangle's left, top, right, and bottom sides, respectively. The image layout rectangle defines a frame of the data source's scanning area to be acquired.

**Syntax**

```typescript
SetImageLayout(
    left: number,
    top: number,
    right: number,
    bottom: number
): boolean;
```

**Parameters**

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
</tr>

<tr>
<td align="center">v5.2+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

The arguments set to the parameters `left` , `top` , `right` , `bottom` are expressed in the measurement unit defined by the [`Unit`](#unit) property, which is `inches` by default.

This API is device-dependent. If a data source does not support customizing the scan area, this method might not work correctly.

Since there are several ways to negotiate the scan area, it becomes confusing when deciding what should take precedence.

The TWAIN Working Group has suggested the following behavior:

- Setting the frame with `SetImageLayout()` shall be equivalent to setting the frame with [`CapGetFrameBottom()`](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameBottom), [`CapGetFrameLeft()`](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameLeft), [`CapGetFrameRight()`](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameRight), [`CapGetFrameTop()`](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameTop) and the property [PageSize](#pagesize) shall return `TWSS_NONE` (0).
- If the current frame is set from negotiating the capability `ICAP_FRAMES` with the method [CapSetFrame()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapSetFrame), the property [PageSize](#pagesize) shall return `TWSS_NONE` (0) and the image layout shall reflect the same frame with the properties [ImageLayoutFrameBottom](#imagelayoutframebottom), [ImageLayoutFrameLeft](#imagelayoutframeleft), [ImageLayoutFrameRight](#imagelayoutframeright) and [ImageLayoutFrameTop](#imagelayoutframetop).
- If the current fixed frame is set by the property [PageSize](#pagesize), the same dimensions shall be reflected in the APIs [CapGetFrameBottom()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameBottom), [CapGetFrameLeft()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameLeft), [CapGetFrameRight()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameRight), [CapGetFrameTop()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameTop) as well as [ImageLayoutFrameBottom](#imagelayoutframebottom), [ImageLayoutFrameLeft](#imagelayoutframeleft), [ImageLayoutFrameRight](#imagelayoutframeright) and [ImageLayoutFrameTop](#imagelayoutframetop). Note, however, the orientation (in other words, whether it's in the portrait mole or landscape mode) also plays a role in the order of the values.

**Example**

```javascript
DWTObject.SelectSource();
DWTObject.OpenSource();
DWTObject.IfShowUI = false;
DWTObject.Unit = Dynamsoft.DWT.EnumDWT_UnitType.TWUN_PIXELS;
DWTObject.SetImageLayout(50, 50, 100, 100);
DWTObject.AcquireImage(successCallback, failureCallback);

function successCallback() {
  DWTObject.CloseSource();
  console.log("successful");
}

function failureCallback(errorCode, errorString) {
  DWTObject.CloseSource();
  console.log(errorString);
}
```

---

## BitDepth

Return or set the pixel bit depth for the current color mode (defined by [`PixelType`]({{site.info}}api/WebTwain_Acquire.html#pixeltype)).

**Syntax**

```typescript
BitDepth: number;
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
<td align="center">v3.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Set this property after [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource) and before [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage) for the desired bit depth to take effect upon calling [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage).

The default bit depth is 1 for `TWPT_BW` , 8 for `TWPT_GRAY` and 24 for `TWPT_RGB` .

---

## IfAppendImage

Return or set whether newly acquired images are inserted or appended to the image buffer.

**Syntax**

```typescript
IfAppendImage: boolean;
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
<td align="center">v5.1+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

The value of this property defaults to `true`, meaning that the newly acquired image will be appended to the last image in the buffer.

If it's set to `false` , the images will be inserted before the current image. Note that by design, the current image is always the previously acquired image. This means that the images acquired after setting `IfAppendImage` to `false` will be displayed/retained in reverse order.

Read this [article]({{site.faq}}insert-new-pages-to-existing-document.html#can-i-insert-newly-scanned-pages-to-an-existing-document) learn how to insert new images to a specified index in the image buffer.

---

## IfDisableSourceAfterAcquire

Return or set whether or not to disable the scanner (i.e., the image source) after acquiring all images. When this property is set to `true` and the scanning UI is open, this setting simultaneously closes the scanning UI when disabling the image source.

**Syntax**

```javascript
IfDisableSourceAfterAcquire: boolean;
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
<td align="center">v3.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.OpenSource();
DWTObject.IfDisableSourceAfterAcquire = true; // Close the scanner UI after images acquired.
DWTObject.IfShowUI = true;
DWTObject.AcquireImage(successCallback,failureCallback);

function successCallback() {
    DWTObject.CloseSource();
}

function failureCallback(errorCode, errorString) {
    DWTObject.CloseSource();
}
```

---

## IfDuplexEnabled

Return or set whether or not to enable duplex scanning (scanning both sides of the paper).

**Syntax**

```typescript
IfDuplexEnabled: boolean;
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
<td align="center">v3.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

Set this property after calling [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource) and before calling [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage) for the setting to take effect upon calling [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage).

Not all scanners support duplex scanning. To confirm, check the user manual of the device or check the value of [`Duplex`]({{site.info}}api/WebTwain_Acquire.html#duplex) after calling [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource).

**Example**

```javascript
DWTObject.OpenSource();

if (DWTObject.Duplex != 0) { // Note: DWTObject.Duplex doesn't support Linux.
    DWTObject.IfDuplexEnabled = true;
}

DWTObject.AcquireImage(successCallback, failureCallback);

function successCallback() {
  DWTObject.CloseSource();
  console.log("successful");
}

function failureCallback(errorCode, errorString) {
  DWTObject.CloseSource();
  console.log(errorString);
}
```

---

## IfFeederEnabled

Return or set whether or not a data source's Automatic Document Feeder (ADF) is enabled for scanning.

**Syntax**

```typescript
IfFeederEnabled: boolean;
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
<td align="center">v3.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

Set this property after [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource) and before [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage) for the setting to take effect upon calling [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage).

If the property is set to `true`, the data source attempt to acquire images from the document feeder first. Otherwise, if the data source does not have a document feeder, the data source will use the flatbed.

**Example**

```javascript
DWTObject.OpenSource();
DWTObject.IfFeederEnabled = true;
DWTObject.AcquireImage(successCallback, failureCallback);

function successCallback() {
  DWTObject.CloseSource();
  console.log("successful");
}

function failureCallback(errorCode, errorString) {
  DWTObject.CloseSource();
  console.log(errorString);
}
```

---

## IfShowUI

Return or set whether or not the data source displays the user interface when scanning.

**Syntax**

```typescript
IfShowUI: boolean;
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
<td align="center">v3.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

when the property is set to `true`, the data source displays its user interface when [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage) is called. Otherwise, the scan starts immediately without displaying the UI.

It is recommended to use this API after [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource) is called.

**Example**

```javascript
DWTObject.OpenSource();
DWTObject.IfShowUI = true; // display the scanner UI before acquiring image
DWTObject.AcquireImage(successCallback, failureCallback);

function successCallback() {
  DWTObject.CloseSource();
  console.log("successful");
}

function failureCallback(errorCode, errorString) {
  DWTObject.CloseSource();
  console.log(errorString);
}
```

---

## ImageCaptureDriverType

Return or set the driver type, which determines the type of sources to use.

**Syntax**

```typescript
ImageCaptureDriverType: Dynamsoft.DWT.EnumDWT_Driver | number;
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
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Set this property immediately after initializing the SDK, or after calling [`CloseSourceManager()`]({{site.info}}api/WebTwain_Acquire.html#closesourcemanager) and [`OpenSourceManager()`]({{site.info}}api/WebTwain_Acquire.html#opensourcemanager).

The allowed values for `EnumDWT_Driver` are

| Label             | Value | Description                                                                         |
| :---------------- | :---- | :---------------------------------------------------------------------------------- |
| TWAIN             | 0     | Use data sources that conforms to the TWAIN protocol **(Default value on Windows)** |
| ICA               | 3     | Use data sources that conforms to the Image Capture Architecture                    |
| SANE              | 3     | Use data sources that conforms to the SANE API **(Default value on Linux)**         |
| TWAIN_AND_ICA     | 4     | Use both TWAIN and ICA data sources **(Default value on MacOS)**                    |
| TWAIN_AND_TWAIN64 | 4     | Use both 32bit and 64bit TWAIN drivers                                              |
| TWAIN64           | 5     | Use 64bit TWAIN sources                                                             |

---

## PageSize

Return or set the page size that the data source uses to acquire images.

**Syntax**

```typescript
PageSize: Dynamsoft.DWT.EnumDWT_CapSupportedSizes | number;
```

**Parameters**

`PageSize`: Please refer to [`EnumDWT_CapSupportedSizes`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_capsupportedsizes)

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
<td align="center">v3.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Set this property after [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource) and before [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage) for the setting to take effect upon calling [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage).

---

## PixelType

Return or set the pixel type used when acquiring images.

**Syntax**

```typescript
PixelType: Dynamsoft.DWT.EnumDWT_PixelType | number;
```

Please refer to [`EnumDWT_PixelType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_pixeltype).

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
<td align="center">v3.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

Set this property after [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource) and before [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage) for the setting to take effect upon calling [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage).

---

## Resolution

Return or set the resolution used when acquiring images.

**Syntax**

```typescript
Resolution: number;
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
<td align="center">v3.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

Set this property after [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource) and before [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage) for the setting to take effect upon calling [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage).

---

## SourceCount

Return the number of data sources available on the local system.

**Syntax**

```typescript
readonly SourceCount: number;
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
<td align="center">v1.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

## BlankImageThreshold

Return or set the blank image detection threshold. Higher values are lenient (higher likelihood of detecting blank pages), and lower values are stringent (lower likelihood of detecting blank pages).

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

`BlankImageThreshold` ranges from 0 to 255, and is 128 by default. This property only takes effect when [`PixelType`]({{site.info}}api/WebTwain_Acquire.html#pixeltype) is set to `TWPT_BW` . The bigger the value is, the more likely it is for an image to be classified as blank.

---

## Brightness

Return or set the brightness value used for scanning by the data source.

**Syntax**

```typescript
Brightness: number;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

Set this property after [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource) and before [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage) for the setting to take effect upon calling [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage).

Typically, the value range is -1000 ~ 1000 where -1000 indicates the darkest and 1000 the brightest.

---

## Contrast

Return or set the contrast value used for scanning by the data source.

**Syntax**

```typescript
Contrast: number;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

Set this property after [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource) and before [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage) for the setting to take effect upon calling [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage).

Typically, the value range is -1000 ~ 1000, where -1000 indicates the lowest contrast and 1000 the highest contrast.

---

## CurrentSourceName

Return the device name of the current data source.

**Syntax**

```typescript
readonly CurrentSourceName: string;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

If no source is currently selected, this property returns "".

---

## DataSourceStatus

Return the data source status code.

**Syntax**

```typescript
DataSourceStatus: number;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

| Value | Description                          |
| :---- | :----------------------------------- |
| 0     | The data source is closed.           |
| 1     | The data source is opened.           |
| 2     | The data source is enabled.          |
| 3     | The data source is acquiring images. |

---

## DefaultSourceName

Return the name of the last used source.

**Syntax**

```typescript
DefaultSourceName: string;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">v17.0+</td>
</tr>

</table>
</div>

---

## Duplex

Indicate if the data source supports 1-pass duplex scanning, 2-pass duplex scanning, or does not support duplex scanning at all.

**Syntax**

```typescript
readonly Duplex: Dynamsoft.DWT.EnumDWT_DUPLEX | number;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

| Label            | Value | Description             |
| :--------------- | :---- | :---------------------- |
| TWDX_NONE        | 0     | duplex is not supported |
| TWDX_1PASSDUPLEX | 1     | 1-pass duplex           |
| TWDX_2PASSDUPLEX | 2     | 2-pass duplex           |

1-pass means the paper gets scanned on both sides at the same time. 2-pass means the paper passes the light bar twice to get both sides scanned separately.

This property is not supported on Linux.

---

## IfAutoBright

Return or set whether or not to enable the data source's auto-brightness feature.

**Syntax**

```typescript
IfAutoBright: boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

---

## IfAutoDiscardBlankpages

Return or set whether or not the data source automatically discards blank images during scanning.

**Syntax**

```typescript
IfAutoDiscardBlankpages: boolean;
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
<td align="center">v7.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

This property works only if the device and its driver support discarding blank pages. You can find whether your device supports this capability from the device's user manual.

Alternatively, the Dynamic Web TWAIN library can also detect blank images after they are transferred.

---

## IfAutoFeed

Return or set whether or not to enable the data source's automatic document feeding feature.

**Syntax**

```typescript
IfAutoFeed: boolean;
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
<td align="center">v7.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

If set to `true` , the data source will automatically feed the next page from the document feeder as soon as the previous page is scanned.

---

## IfAutomaticBorderDetection

Return or set whether or not to enable the data source's automatic border detection feature.

**Syntax**

```typescript
IfAutomaticBorderDetection: boolean;
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
<td align="center">v7.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

The property works only if the device and its driver support automatic border detection. You can check for device capability support in the device's user manual.

Once enabled, the data source (scanner) automatically detects the borders of the document so as to not scan extra margins.

---

## IfAutomaticDeskew

Return or set whether or not to enable the data source's automatic skew correction feature.

**Syntax**

```typescript
IfAutomaticDeskew: boolean;
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
<td align="center">v7.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

The property works only if the device and its driver supports automatic de-skewing. You can check for device capability support in the device's user manual.

---

## IfAutoScan

Return or set whether or not to enable the data source's automatic document scanning feature.

**Syntax**

```typescript
IfAutoScan: boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

This property is only valid when [`IfFeederEnabled`]({{site.info}}api/WebTwain_Acquire.html#iffeederenabled) is set to `true` .

The fundamental assumption behind this property is that the device can capture the number of images indicated by the property [`XferCount`]({{site.info}}api/WebTwain_Acquire.html#xfercount) without waiting for the Application to request the image transfers. This is only possible if the device has internal buffers capable of caching the images it captures.

---

## IfFeederLoaded

Return whether or not there are documents loaded in the data source's feeder.

**Syntax**

```typescript
readonly IfFeederLoaded: boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

This property is only valid when [`IfFeederEnabled`]({{site.info}}api/WebTwain_Acquire.html#iffeederenabled) and [`IfPaperDetectable`]({{site.info}}api/WebTwain_Acquire.html#ifpaperdetectable) are `true`.

---

## IfPaperDetectable

Return whether or not the Source has a paper sensor that can detect pages on the ADF or flatbed.

**Syntax**

```typescript
readonly IfPaperDetectable: boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Check this property after calling [`OpenSource()`](#opensource).

---

## IfShowIndicator

Return or set whether or not the data source displays a progress indicator during acquisition and transfer.

**Syntax**

```typescript
IfShowIndicator: boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

This property works only when `IfShowUI` is set to `false`.

The indicator will only be hidden when **both** [`IfShowUI`](#ifshowui) and [`IfShowIndicator`](#ifshowindicator) are `false` .

---

## IfUIControllable

Return whether or not the data source supports acquisitions with the UI (User Interface) disabled.

**Syntax**

```typescript
readonly IfUIControllable: boolean;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Check this property after calling [`OpenSource()`](#opensource).

---

## IfUseTwainDSM

Return or set whether or not to use the new TWAIN DSM (Data Source Manager) for acquisitions. The new TWAIN DSM is a DLL called `TWAINDSM.dll` while the default/old DSM is called `twain_32.dll`.

**Syntax**

```typescript
IfUseTwainDSM: boolean;
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
<td align="center">v6.2+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

This property should be set before calling or setting any TWAIN-related methods or properties.

---

## ImageLayoutFrameBottom

Return the value of the bottom edge of the current image frame, with distance measured in `Unit` (defaults to inches).

**Syntax**

```typescript
readonly ImageLayoutFrameBottom: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## ImageLayoutFrameLeft

Return the value of the left edge of the current image frame, with distance measured in `Unit` (defaults to inches).

**Syntax**

```typescript
readonly ImageLayoutFrameLeft: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## ImageLayoutFrameNumber

Return the frame number of the current image.

**Syntax**

```typescript
readonly ImageLayoutFrameNumber: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

**Usage Notes**

Usually a chronological index of the acquired frames, these frames are related to one another in some way. Usually, they were acquired from the same page. The source assigns these values. The initial value is 1. The value resets upon acquiring a new image.

`ImageLayoutFrameNumber` property, along with other properties about the current image information, is valid only in the [`OnPreTransfer`]({{site.info}}api/WebTwain_Acquire.html#onpretransfer) and [`OnPostTransfer`]({{site.info}}api/WebTwain_Acquire.html#onposttransfer) events.
The frame information here only applies to the current frame. To get information about all frames to be transferred in an acquire session, please use capability negotiation. In this case, the capability is `ICAP_FRAMES` (4372).

---

## ImageLayoutFrameRight

Return the value of the right edge of the current image frame, with distance measured in `Unit` (defaults to inches).

**Syntax**

```typescript
readonly ImageLayoutFrameRight: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## ImageLayoutFrameTop

Return the value of the top edge of the current image frame, with distance measured in `Unit` (defaults to inches).

**Syntax**

```typescript
readonly ImageLayoutFrameTop: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## ImageLayoutDocumentNumber

Return the document number of the current image.

**Syntax**

```typescript
readonly ImageLayoutDocumentNumber: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## ImageLayoutPageNumber

Return the page number of the current image.

**Syntax**

```typescript
readonly ImageLayoutPageNumber: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## ImageBitsPerPixel

Return the bit depth of the current image.

**Syntax**

```typescript
readonly ImageBitsPerPixel: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## ImageLength

Return the length of the current image.

**Syntax**

```typescript
readonly ImageLength: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## ImageWidth

Return the width of the current image.

**Syntax**

```typescript
readonly ImageWidth: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## ImageXResolution

Return the horizontal resolution of the current image.

**Syntax**

```typescript
readonly ImageXResolution: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## ImageYResolution

Return the vertical resolution of the current image.

**Syntax**

```typescript
readonly ImageYResolution: number;
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
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
<td align="center">all versions</td>
</tr>

</table>
</div>

---

## ImagePixelType

Return the pixel type of the current image.

**Syntax**

```typescript
readonly ImagePixelType: Dynamsoft.DWT.EnumDWT_PixelType | number;
```

Please refer to [`EnumDWT_PixelType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_pixeltype).

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

## MagData

Return magnetic data if the data source supports magnetic data recognition.

**Syntax**

```typescript
readonly MagData: string;
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

---

## MagType

Return the type of the magnetic data if the data source supports magnetic data recognition.

**Syntax**

```typescript
readonly MagType: Dynamsoft.DWT.EnumDWT_MagType | number;
```

Please refer to [`EnumDWT_MagType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_magtype).

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

The values returned by these APIs are expressed in the measurement unit defined by the [`Unit`](#unit) property, which is `inches` by default.

These APIs are only valid in the callbacks for the events [`OnPreTransfer`](#onpretransfer) and [`OnPostTransfer`](#onposttransfer).

[`MagData`](#magdata) and [`MagType`](#magtype) are device-dependent. Check the user manual of the device to see if magnetic data recognition is supported.

---

## PendingXfers

Return the number of transfers the data source is ready to supply upon demand.

**Syntax**

```typescript
readonly PendingXfers: number;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

This property is only valid in the event [`OnPostTransfer`](#onposttransfer).

The data source returns -1 if it is not sure how many transfers are pending. This normally occurs when the ADF (Automatic Document Feeder) is used.

---

## PixelFlavor

Return or set the pixel flavor used for acquiring images.

**Syntax**

```typescript
PixelFlavor: number;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Available values:

- 0: Chocolate. Zero pixel represents darkest shade
- 1: Vanilla. Zero pixel represents lightest shade.

---

## TransferMode

Return or set the data source's transfer mode.

**Syntax**

```typescript
TransferMode: Dynamsoft.DWT.EnumDWT_TransferMode | number;
```

Please refer to [`EnumDWT_TransferMode`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_transfermode).

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
<td align="center">v10.0+</td>
<td align="center">not supported</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Allowed values are

- `TWSX_NATIVE | 0`: The default mode - this mode transfers the whole image in a single memory block.
- `TWSX_FILE | 1`: Transfer the image to a specified file on the disk directly. This mode is ideal when transferring large images that may encounter memory limits with Native mode. Check out [`SetFileXferInfo`](#setfilexferinfo) for more information.
- `TWSX_MEMORY | 2`: Transfer the image in multiple memory blocks. This mode is ideal for transferring very large images or a large number of images quickly.

`TWSX_NATIVE` and `TWSX_MEMORY` are required by all TWAIN data sources while `TWSX_FILE` is not. Therefore, make sure the data source supports `TWSX_FILE` before you use it.

| Supported values   | Windows(TWAIN) | Windows(WIA) | macOS(TWAIN) | macOS(ICA) | Linux(SANE) |
| ------------------ | -------------- | ------------ | ------------ | ---------- | ----------- |
| `TWSX_NATIVE`      | ✔              | ✖            | ✖            | ✔          | ✔           |
| `TWSX_MEMORY`      | ✔              | ✔            | ✔            | ✖          | ✖           |
| `TWSX_FILE`        | ✔              | ✔            | ✖            | ✔          | ✖           |

---

## Unit

Return or set the unit of measurement for all quantities. This setting only applies to TWAIN/ICA (hardware) -related operations.

**Syntax**

```typescript
Unit: Dynamsoft.DWT.EnumDWT_UnitType | number;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Allowed values are

| Label            | Value | Description     |
| :--------------- | :---- | :-------------- |
| TWUN_INCHES      | 0     | inches(Default) |
| TWUN_CENTIMETERS | 1     | centimeters     |
| TWUN_PICAS       | 2     | picas           |
| TWUN_POINTS      | 3     | points          |
| TWUN_TWIPS       | 4     | twips           |
| TWUN_PIXELS      | 5     | pixels          |
| TWUN_MILLIMETERS | 6     | millimeters     |

---

## XferCount

Return or set the number of images the web application is willing to accept for each scan.

**Syntax**

```typescript
XferCount: number;
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

Allowed values are between -1 and 215, where -1 indicate multiple images.

---

## OnPostAllTransfers

This event triggers when all page(s) have been scanned and transferred.

**Syntax**

```typescript
RegisterEvent("OnPostAllTransfers", function () {});
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

This event triggers after all pages in the document feeder have been scanned and transferred. This event is convenient for uploading the images, detecting barcodes, discarding blank pages, etc.

**Example**

```javascript
DWTObject.RegisterEvent("OnPostAllTransfers", function () {
  console.log("All images are transferred.");
});
```

---

## OnPostTransfer

This event triggers after each page has been scanned and transferred.

**Syntax**

```typescript
RegisterEvent("OnPostTransfer", function () {});
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
<td align="center">v1.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.RegisterEvent("OnPostTransfer", function () {
  console.log("An image has been scanned");
});
```

---

## OnPostTransferAsync

This event triggers after each page has been scanned and transferred. This is the asynchronous counterpart to the synchronous event [`OnPostTransfer`](#onposttransfer).

**Syntax**

```typescript
RegisterEvent("OnPostTransferAsync", function (outputInfo: OutputInfo) {});
```

**Parameters**

`outputInfo`: Detailed information about the image that just got transferred. Please refer to [`OutputInfo`]({{site.info}}api/Interfaces.html#outputinfo).

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
<td align="center">v15.0+</td>
<td align="center">v15.1+</td>
<td align="center">v15.1+</td>
<td align="center">v15.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>


**Example**

```javascript
DWTObject.RegisterEvent("OnPostTransferAsync", function (outputInfo) {
  console.log("The image ID is " + outputInfo.imageId);
});
```

---

## OnPreAllTransfers

This event triggers when all images are scanned and ready to be transferred.

**Syntax**

```typescript
RegisterEvent("OnPreAllTransfers", function () {});
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

Multiple transfers may occur in two cases:

- Multiple images are scanned through the ADF(Auto Document Feeder)
- Multiple frames are scanned on one single page

Multiple transfers trigger the [`OnPreTransfer`](#onpretransfer) event multiple times but only triggers `OnPreAllTransfers` once.

In the callback function of this event, you can call [`CancelAllPendingTransfers()`](#cancelallpendingtransfers) to cancel all transfers.

---

## OnPreTransfer

This event triggers when a page has been scanned and is ready to be transferred.

**Syntax**

```typescript
RegisterEvent('OnPreTransfer',function(){...});
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
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

In the callback function of this event, you can:

- Check [`PendingXFERs`](#pendingxfers) for the number of pending transfers.
- Get information about the transferred image, such as [`ImageLayoutDocumentNumber`](#imagelayoutdocumentnumber), [`ImageLayoutFrameLeft`](#imagelayoutframeleft), [`ImageLayoutFrameTop`](#imagelayoutframetop), [`ImageLayoutFrameRight`](#imagelayoutframeright), [`ImageLayoutFrameBottom`](#imagelayoutframebottom), [`ImageLayoutPageNumber`](#imagelayoutpagenumber), [`ImageLayoutFrameNumber`](#imagelayoutframenumber), etc.
- Call [`CancelAllPendingTransfers()`](#cancelallpendingtransfers) to cancel the rest of the transfers.

---

## OnSourceUIClose

This event triggers when the user interface of the data source is closed manually by the user.

**Syntax**

```typescript
RegisterEvent("OnSourceUIClose", function () {});
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
<td align="center">v8.0.1+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

---

## getCapabilities()

Get detailed information about specified or all capabilities of the current data source.

**Syntax**

```typescript
getCapabilities(
    capabilities: Dynamsoft.DWT.EnumDWT_Cap[] | number[],
    successCallback: (capabilityDetails: CapabilityDetails[]) => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void; 

getCapabilities(
    successCallback: (capabilityDetails: CapabilityDetails[]) => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`capabilities`: Specifies the capabilities to query. Please refer to [`Dynamsoft.DWT.EnumDWT_Cap`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_cap).

`successCallback`: A callback function that is executed if the request succeeds.
- `capabilityDetails`: Detailed information about the specified capabilities. Please refer to [`CapabilityDetails`]({{site.info}}api/Interfaces.html#capabilitydetails).

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>
<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows/TWAIN)</td>
<td align="center">H5(Windows/WIA)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(macOS/eSCL)</td>
<td align="center">H5(Linux/SANE)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v16.0+</td>
<td align="center">v18.2+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v18.2+</td>
<td align="center">v16.0+</td>
<td align="center">v18.2+</td>
</tr>
</table>
</div>

---

## setCapabilities()

Set the value of one or more capabilities.

**Syntax**

```typescript
setCapabilities(
    capabilities: Capabilities,
    successCallback: (capabilities: Capabilities) => void,
    failureCallback: (capabilities: Capabilities) => void
): boolean;
```

**Parameters**

`capabilities`: An object that contains capability values to be set.

`successCallback`: A callback function that is executed if the request succeeds.
- `capabilities`: The capabilities to set.

`failureCallback`: A callback function that is executed if the request fails.
- `capabilities`: The capabilities to set.

Please refer to [`Capabilities`]({{site.info}}api/Interfaces.html#capabilities).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows/TWAIN)</td>
<td align="center">H5(Windows/WIA)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(macOS/eSCL)</td>
<td align="center">H5(Linux/SANE)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v16.0+</td>
<td align="center">v18.2+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v18.2+</td>
<td align="center">v16.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage notes**

For simplicity, Dynamsoft designed the API with a simplified parameter `Capabilities` which only requires the minimum information to set a capability: a number to specify the capability and a value to set the capability to. DWT takes care of container type setting, value type setting as well as data validation, all behind the scene.

Take note of the **overall** `exception` parameter and the **individual** `exception` parameter for each capability. If the overall parameter is set to `fail`, the setting aborts upon encountering the first exception raised while setting any of the capabilities. If the overall parameter is set to `fail`, the API carries on setting the next capability upon encountering a exception setting a previous capability.

The individual `exception` argument is optional but takes precedence if set. In other words, you can set the overall `exception` to `ignore` and then set the individual one to `fail` for critical capabilities. This way, you get notified if these critical capabilities fail to be set, and ignore failing to set less important capabilities.

**Example**

```javascript
DWTObject.SelectSourceByIndex(0);
DWTObject.IfShowUI = false;
DWTObject.OpenSource();
DWTObject.setCapabilities(
  {
    exception: "ignore",
    capabilities: [
      {
        capability: Dynamsoft.DWT.EnumDWT_Cap.ICAP_CONTRAST, // your own capability
        curValue: 500, // your own curValue
      },
      {
        capability: Dynamsoft.DWT.EnumDWT_Cap.CAP_PRINTERSTRING, // your own capability
        curValue: "abc", // your own curValue
        exception: "fail",
      },
      {
        capability: Dynamsoft.DWT.EnumDWT_Cap.ICAP_PIXELTYPE, // your own capability
        curValue: 0, // your own curValue
      },
    ],
  },
  function (successData) {
    DWTObject.AcquireImage(
      function () {
        DWTObject.CloseSource();
      },
      function () {
        DWTObject.CloseSource();
        console.log(DWTObject.ErrorString);
      }
    );
  },
  function (errorData) {
    console.error(errorData);
    DWTObject.AcquireImage(
      function () {
        DWTObject.CloseSource();
      },
      function () {
        DWTObject.CloseSource();
        console.log(DWTObject.ErrorString);
      }
    );
  }
);
```
---

## GetDevicesAsync()

Return all available devices (scanners, eSCL scanners, etc.). Optionally, only return devices of a specified type.

**Syntax**

```typescript
GetDevicesAsync(deviceType?: Dynamsoft.DWT.EnumDWT_DeviceType | number, refresh?:boolean): Promise<Device[]>;
```

**Parameters**

`deviceType`: The device type. Please refer to [`EnumDWT_DeviceType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_devicetype).

`refresh`: Default value is `false`.

**Arguments**

`Device`: Please refer to [`Device`]({{site.info}}api/Interfaces.html#device).

**Example**

```javascript
DWTObject.GetDevicesAsync().then((deviceList)=>{
  return DWTObject.SelectDeviceAsync(deviceList[0])  //Select the first device
}).then(()=>{
    return DWTObject.AcquireImageAsync({
      IfCloseSourceAfterAcquire: true,
    }) 
}).catch((e)=>{
    console.error(e)
})
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows/TWAIN)</td>
<td align="center">H5(Windows/WIA)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(macOS/eSCL)</td>
<td align="center">H5(Linux/SANE)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

---

## SelectDeviceAsync()

Select the device to be used for scanning.

**Syntax**

```typescript
SelectDeviceAsync(device: Device): Promise< boolean>;
```

**Example**

```javascript
DWTObject.GetDevicesAsync().then((deviceList)=>{
  return DWTObject.SelectDeviceAsync(deviceList[0])  //Select the first device
}).then(()=>{
    return DWTObject.AcquireImageAsync({
      IfCloseSourceAfterAcquire: true,
    }) 
}).catch((e)=>{
    console.error(e)
})
```

**Parameters**

`device`: the device object. Please refer to [`Device`]({{site.info}}api/Interfaces.html#device).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows/TWAIN)</td>
<td align="center">H5(Windows/WIA)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(macOS/eSCL)</td>
<td align="center">H5(Linux/SANE)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

---

## AcquireImageAsync()

Request a scan, then store to the image buffer of the WebTwain instance upon completion of the scan.
<!--Possibly some other descriptions, no need to add for now-->
By default, the scans are displayed from the `dwtcontrolContainer` container.

**Syntax**

```typescript
AcquireImageAsync(deviceConfiguration?: DeviceConfiguration): Promise< boolean>;
```

**Parameters**

`deviceConfiguration`: The device configuration. Please refer to [`DeviceConfiguration`]({{site.info}}api/Interfaces.html#DeviceConfiguration).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows/TWAIN)</td>
<td align="center">H5(Windows/WIA)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(macOS/eSCL)</td>
<td align="center">H5(Linux/SANE)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.GetDevicesAsync().then((deviceList)=>{
  return DWTObject.SelectDeviceAsync(deviceList[0])  //Select the first device
}).then(()=>{
    return DWTObject.AcquireImageAsync({
      IfCloseSourceAfterAcquire: true,
    }) 
}).catch((e)=>{
    console.error(e)
})
```


<div class="multi-panel-switching-end"></div>

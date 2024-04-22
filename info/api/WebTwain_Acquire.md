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

> The properties and methods on this page live in the namespace {WebTwainObject}. {WebTwainObject} denotes the `WebTwain` instance. Learn about [how to create a web twain object]({{site.indepth}}features/initialize.html#creating-the-webtwain-instance).

<div class="multi-panel-switching-prefix"></div>

- [Desktop Service](#desktop) 
- [Android Service](#android) 

<div class="multi-panel-start"></div>

**1. The following APIs are compatible with TWAIN, ICA, SANE (Windows, macOS and Linux)** 

**Methods**

|                                                   |
| :------------------------------------------------ | :------------------------------------------ | ----------------------------------------------- | --------------------------------------------------------- |
| [`GetSourceNameItems()`](#getsourcenameitems)     | [`GetSourceNames()`](#getsourcenames)       | [`GetSourceNamesAsync()`](#getsourcenamesasync) | [`SelectSource()`](#selectsource)                 |
| [`SelectSourceAsync()`](#selectsourceasync) | [`SelectSourceByIndex()`](#selectsourcebyindex) | [`SelectSourceByIndexAsync()`](#selectsourcebyindexasync) | [`SetOpenSourceTimeout()`](#setopensourcetimeout) |
| [`OpenSource()`](#opensource)               | [`OpenSourceAsync()`](#opensourceasync)         | [`EnableSourceUI()`](#enablesourceui)                     | [`EnableSource()`](#enablesource)                 |
| [`AcquireImage()`](#acquireimage)           | [`startScan()`](#startscan)                     | [`DisableSource()`](#disablesource)                       | [`CloseSource()`](#closesource)                   |
| [`CloseSourceAsync()`](#closesourceasync)   | [`CloseWorkingProcess()`](#closeworkingprocess) | [`GetDevicesAsync()`](#getdevicesasync)   | [`SelectDeviceAsync()`](#selectdeviceasync)                   |
| [`AcquireImageAsync()`](#acquireimageasync)   |

**Properties**

|                                           |
| :---------------------------------------- | :------------------------------------------------------------ | ------------------------------------- | ------------------------------------- |
| [`CurrentSourceName`](#currentsourcename) | [`IfDisableSourceAfterAcquire`](#ifdisablesourceafteracquire) | [`IfDuplexEnabled`](#ifduplexenabled) | [`IfFeederEnabled`](#iffeederenabled) |
| [`PageSize`](#pagesize)                   | [`PixelType`](#pixeltype)                                     | [`Resolution`](#resolution)           | [`SourceCount`](#sourcecount)         |

**Events**

|                                             |
| :------------------------------------------ | :---------------------------------- | --------------------------------------------- |
| [`OnPostAllTransfers`](#onpostalltransfers) | [`OnPostTransfer`](#onposttransfer) | [`OnPostTransferAsync`](#onposttransferasync) |
| [`OnPreAllTransfers`](#onprealltransfers)   | [`OnPreTransfer`](#onpretransfer)   |

**2. The following APIs are compatible with TWAIN and ICA** 

**Methods**

|                                         |
| :-------------------------------------- | :-------------------------------------- |
| [`getCapabilities()`](#getcapabilities) | [`setCapabilities()`](#setcapabilities) |

**3. The following APIs are compatible with TWAIN (mostly Windows, but could also be macOS)** 

**Methods**

|                                                                                   |
| :-------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| [`OpenSourceManager()`](#opensourcemanager) | [`OpenSourceManagerAsync()`](#opensourcemanagerasync) | [`CloseSourceManager()`](#closesourcemanager)               | [`CloseSourceManagerAsync()`](#closesourcemanagerasync) |
| [`GetCustomDSData()`](#getcustomdsdata)     | [`GetCustomDSDataEx()`](#getcustomdsdataex)           | [`CancelAllPendingTransfers()`](#cancelallpendingtransfers) | [`FeedPage()`](#feedpage)                               |
| [`ResetImageLayout()`](#resetimagelayout)   | [`RewindPage()`](#rewindpage)                         | [`SetCustomDSData()`](#setcustomdsdata)                     | [`SetCustomDSDataEx()`](#setcustomdsdataex)             |
| [`SetFileXferInfo()`](#setfilexferinfo)     | [`SetImageLayout()`](#setimagelayout)                 |

**Properties**

|                                                     |
| :-------------------------------------------------- | :---------------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------------- |
| [`BitDepth`](#bitdepth)                             | [`Brightness`](#brightness)                                 | [`Contrast`](#contrast)                             | [`DataSourceStatus`](#datasourcestatus)                   |
| [`DefaultSourceName`](#defaultsourcename)           | [`Duplex`](#duplex)                                         | [`IfAutoBright`](#ifautobright)                     | [`IfAutoDiscardBlankpages`](#ifautodiscardblankpages)     |
| [`IfAutoFeed`](#ifautofeed)                         | [`IfAutomaticBorderDetection`](#ifautomaticborderdetection) | [`IfAutomaticDeskew`](#ifautomaticdeskew)           | [`IfAutoScan`](#ifautoscan)                               |
| [`IfFeederLoaded`](#iffeederloaded)                 | [`IfPaperDetectable`](#ifpaperdetectable)                   | [`IfShowIndicator`](#ifshowindicator)               | [`IfShowUI`](#ifshowui)                                   |
| [`IfUIControllable`](#ifuicontrollable)             | [`IfUseTwainDSM`](#ifusetwaindsm)                           | [`ImageCaptureDriverType`](#imagecapturedrivertype) | [`ImageLayoutDocumentNumber`](#imagelayoutdocumentnumber) |
| [`ImageLayoutFrameBottom`](#imagelayoutframebottom) | [`ImageLayoutFrameLeft`](#imagelayoutframeleft)             | [`ImageLayoutFrameNumber`](#imagelayoutframenumber) | [`ImageLayoutFrameRight`](#imagelayoutframeright)         |
| [`ImageLayoutFrameTop`](#imagelayoutframetop)       | [`ImageLayoutPageNumber`](#imagelayoutpagenumber)           | [`ImagePixelType`](#imagepixeltype)                 | [`MagData`](#magdata)                                     |
| [`MagType`](#magtype)                               | [`PendingXfers`](#pendingxfers)                             | [`PixelFlavor`](#pixelflavor)                       | [`TransferMode`](#transfermode)                           |
| [`Unit`](#unit)                                     | [`XferCount`](#xfercount)                                   |[`IfAppendImage`](#ifappendimage) |

**Events**

|                                       |
| :------------------------------------ |
| [`OnSourceUIClose`](#onsourceuiclose) |

<div class="multi-panel-end">

</div><div class="multi-panel-start"></div>

>The Android Service Edition only supports a subset of the APIs available in the Desktop Service Edition. For the APIs that are compatible with both editions, the usage remains the same. To learn how to use the APIs, please refer to the documentation for the Desktop Service Edition.

**Methods**

|                                                     |
| :-------------------------------------------------- | :---------------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------------- |
| [`SelectSourceAsync()`](#selectsourceasync)  | [`CloseSourceAsync()`](#closesourceasync)  | [`GetDevicesAsync()`](#getdevicesasync)   | [`SelectDeviceAsync()`](#selectdeviceasync)                   |
| [`AcquireImageAsync()`](#acquireimageasync)   |[`getCapabilities()`](#getcapabilities) | [`setCapabilities()`](#setcapabilities) |

**Events**

|                                       |
| :------------------------------------ |
| [`OnPostTransferAsync`](#onposttransferasync)  |

<div class="multi-panel-end"></div>


---

## AcquireImage

Start image acquisition.

**Syntax**

```typescript
AcquireImage(
    deviceConfiguration?: DeviceConfiguration,
    successCallBack?: () => void,
    failureCallBack?: (deviceConfiguration?: DeviceConfiguration, errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`deviceConfiguration`: Configuration for the acquisition. Please refer to [DeviceConfiguration]({{site.info}}api/Interfaces.html#DeviceConfiguration).

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

**Usage notes**

`extendedImageInfoQueryLevel` is 0 by default which means the following information will be retrieved (if available):

| Label                  | Value  |
| :--------------------- | :----- |
| TWEI_BARCODEX          | 0x1200 |
| TWEI_BARCODEY          | 0x1201 |
| TWEI_BARCODETEXT       | 0x1202 |
| TWEI_BARCODETYPE       | 0x1203 |
| TWEI_ENDORSEDTEXT      | 0x1213 |
| TWEI_BARCODECONFIDENCE | 0x121A |
| TWEI_BARCODEROTATION   | 0x121B |
| TWEI_BARCODETEXTLENGTH | 0x121C |
| TWEI_BOOKNAME          | 0x1238 |
| TWEI_CHAPTERNUMBER     | 0x1239 |
| TWEI_DOCUMENTNUMBER    | 0x123A |
| TWEI_PAGENUMBER        | 0x123B |
| TWEI_CAMERA            | 0x123C |
| TWEI_FRAMENUMBER       | 0x123D |
| TWEI_FRAME             | 0x123E |
| TWEI_PIXELFLAVOR       | 0x123F |
| TWEI_MAGDATA           | 0x1243 |
| TWEI_MAGTYPE           | 0x1244 |
| TWEI_PAGESIDE          | 0x1245 |

If it's set to 1, the following will also be retrieved (if available):

| Label                      | Value  |
| :------------------------- | :----- |
| TWEI_DESHADETOP            | 0x1204 |
| TWEI_DESHADELEFT           | 0x1205 |
| TWEI_DESHADEHEIGHT         | 0x1206 |
| TWEI_DESHADEWIDTH          | 0x1207 |
| TWEI_DESHADESIZE           | 0x1208 |
| TWEI_SPECKLESREMOVED       | 0x1209 |
| TWEI_HORZLINEXCOORD        | 0x120A |
| TWEI_HORZLINEYCOORD        | 0x120B |
| TWEI_HORZLINELENGTH        | 0x120C |
| TWEI_HORZLINETHICKNESS     | 0x120D |
| TWEI_VERTLINEXCOORD        | 0x120E |
| TWEI_VERTLINEYCOORD        | 0x120F |
| TWEI_VERTLINELENGTH        | 0x1210 |
| TWEI_VERTLINETHICKNESS     | 0x1211 |
| TWEI_PATCHCODE             | 0x1212 |
| TWEI_FORMCONFIDENCE        | 0x1214 |
| TWEI_FORMTEMPLATEMATCH     | 0x1215 |
| TWEI_FORMTEMPLATEPAGEMATCH | 0x1216 |
| TWEI_FORMHORZDOCOFFSET     | 0x1217 |
| TWEI_FORMVERTDOCOFFSET     | 0x1218 |
| TWEI_BARCODECOUNT          | 0x1219 |
| TWEI_DESHADECOUNT          | 0x121D |
| TWEI_DESHADEBLACKCOUNTOLD  | 0x121E |
| TWEI_DESHADEBLACKCOUNTNEW  | 0x121F |
| TWEI_DESHADEBLACKRLMIN     | 0x1220 |
| TWEI_DESHADEBLACKRLMAX     | 0x1221 |
| TWEI_DESHADEWHITECOUNTOLD  | 0x1222 |
| TWEI_DESHADEWHITECOUNTNEW  | 0x1223 |
| TWEI_DESHADEWHITERLMIN     | 0x1224 |
| TWEI_DESHADEWHITERLAVE     | 0x1225 |
| TWEI_DESHADEWHITERLMAX     | 0x1226 |
| TWEI_BLACKSPECKLESREMOVED  | 0x1227 |
| TWEI_WHITESPECKLESREMOVED  | 0x1228 |
| TWEI_HORZLINECOUNT         | 0x1229 |
| TWEI_VERTLINECOUNT         | 0x122A |
| TWEI_DESKEWSTATUS          | 0x122B |
| TWEI_SKEWORIGINALANGLE     | 0x122C |
| TWEI_SKEWFINALANGLE        | 0x122D |
| TWEI_SKEWCONFIDENCE        | 0x122E |
| TWEI_SKEWWINDOWX1          | 0x122F |
| TWEI_SKEWWINDOWY1          | 0x1230 |
| TWEI_SKEWWINDOWX2          | 0x1231 |
| TWEI_SKEWWINDOWY2          | 0x1232 |
| TWEI_SKEWWINDOWX3          | 0x1233 |
| TWEI_SKEWWINDOWY3          | 0x1234 |
| TWEI_SKEWWINDOWX4          | 0x1235 |
| TWEI_SKEWWINDOWY4          | 0x1236 |
| TWEI_ICCPROFILE            | 0x1240 |
| TWEI_LASTSEGMENT           | 0x1241 |
| TWEI_SEGMENTNUMBER         | 0x1242 |
| TWEI_FILESYSTEMSOURCE      | 0x1246 |
| TWEI_IMAGEMERGED           | 0x1247 |
| TWEI_MAGDATALENGTH         | 0x1248 |
| TWEI_PAPERCOUNT            | 0x1249 |
| TWEI_PRINTERTEXT           | 0x124A |

If it's set to 2, then besides what's mentioned in the two tables above, the Dynamic Web TWAIN library will also try to query the scanner for its own custom extended image info.

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
};

function successCallback() {
  console.log("successful");
}

function failureCallback(errorCode, errorString) {
  alert(errorString);
}

function AcquireImage1() {
  DWObject.SelectSource(function () {
    DWObject.OpenSource();
    DWObject.IfShowUI = false;
    DWObject.PixelType = Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB;
    DWObject.Resolution = 300;
    DWObject.IfFeederEnabled = true;
    DWObject.IfDuplexEnabled = false;
    DWObject.IfDisableSourceAfterAcquire = true;
    DWObject.AcquireImage();
  }, failureCallback);
}

function AcquireImage2() {
  DWObject.SelectSource(function () {
    DWObject.OpenSource();
    DWObject.AcquireImage(deviceConfiguration);
  }, failureCallback);
}

function AcquireImage3() {
  DWObject.SelectSource(function () {
    DWObject.OpenSource();
    DWObject.IfShowUI = false;
    DWObject.PixelType = Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB;
    DWObject.Resolution = 300;
    DWObject.IfFeederEnabled = true;
    DWObject.IfDuplexEnabled = false;
    DWObject.IfDisableSourceAfterAcquire = true;
    DWObject.AcquireImage(successCallback, failureCallback);
  }, failureCallback);
}

function AcquireImage4() {
  DWObject.SelectSource(function () {
    DWObject.OpenSource();
    DWObject.AcquireImage(
      deviceConfiguration,
      successCallback,
      failureCallback
    );
  }, failureCallback);
}
```

---

## CloseSource

Close the data source (a TWAIN/ICA/SANE device which in most cases is a scanner) to free it to be used by other applications.

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
DWObject.OpenSource();
DWObject.AcquireImage(successCallback,failureCallback);

function successCallback() {
  console.log("successful");
  DWObject.CloseSource();
}

function failureCallback(errorCode, errorString) {
  alert(errorString);
  DWObject.CloseSource();
}
```

---

## CloseSourceAsync

Close the data source (a TWAIN/ICA/SANE device which in most cases is a scanner) to free it to be used by other applications.

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

## DisableSource

Disable the data source (a TWAIN/ICA/SANE device which in most cases is a scanner) to stop the acquiring process. If the data source's user interface is displayed, it will be closed.

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

After `DisableSource()` is called, the Source is still open and you can continue to acquire images by calling `AcquireImage()` or `EnableSource()` .

---

## EnableSource

Enable the data source to start the acquiring process.

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

## EnableSourceUI

Display the TWAIN source's built-in user interface.

**Syntax**

```typescript
EnableSourceUI(
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
<td align="center">not supported</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
</tr>

</table>
</div>

**Usage notes**

This method enables the user to manipulate the settings for scanning but not start an actual scan. It only works if the source supports the capability `CAP_ENABLEDSUIONLY` . User can call [GetCustomDSDataEx()](#getcustomdsdataex) to save the settings in the callback `successCallBack` and later call [SetCustomDSDataEx()](#setcustomdsdataex) to apply the settings before starting a scan.

---

## OpenSource

Load a data source to get it ready to acquire images.

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
DWObject.GetSourceNames(); // for example ['PaperStream IP fi-7300NX Net', 'TWAIN2 FreeImage Software Scanner']
DWObject.SelectSourceByIndex(0); // choose scanner with the name "PaperStream IP fi-7300NX Net"
DWObject.OpenSource();
DWObject.AcquireImage();
```

---

## OpenSourceAsync

Load a data source to get it ready to acquire images.

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

## GetSourceNames

Return all available data sources (scanners, etc.) and optionally all detailed information about them.

**Syntax**

```typescript
GetSourceNames(bIncludeDetails?: boolean): string[] | SourceDetails[];
```

**Parameters**

`bIncludeDetails`: Whether to return more details about the data sources or just their names.

**Arguments**

`SourceDetails`: Please refer to [SourceDetails]({{site.info}}api/Interfaces.html#sourcedetails).

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
DWObject.GetSourceNames(); // return a list of scanner sources such as ['PaperStream IP fi-7300NX Net', 'TWAIN2 FreeImage Software Scanner']
```

---

## GetSourceNamesAsync

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

## SelectSource

Bring up the Source Selection User Interface (UI) for the user to choose a data source.

**Syntax**

```typescript
SelectSource(
    successCallBack?: () => void,
    failureCallBack?: (errorCode: number, errorString: string) => void
): boolean | string;
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

- It's recommended to use this API asynchronously by pass arguments to the parameters `successCallback` and `failureCallback`.
- On `Windows` and `Windows` only, you can call this method with no arguments so that it runs synchronously and return a boolean value.

**Example**

```javascript
DWObject.SelectSource(
  function () {
    DWObject.OpenSource();
    DWObject.AcquireImage();
  },
  function (errorCode, errorString) {
    console.log(errorString);
  }
);
```

---

## SelectSourceAsync

Bring up the Source Selection User Interface (UI) for the user to choose a data source.

**Syntax**

```typescript
SelectSourceAsync(deviceType?: Dynamsoft.DWT.EnumDWT_DeviceType | number): Promise<number>;
```

**Parameters**

`deviceType`: Specify the device type of scanners. Please refer to [EnumDWT_DeviceType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_devicetype).

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
DWObject.SelectSourceAsync()
  .then(function (sourceIndex) {
    console.log(sourceIndex);
    return DWObject.AcquireImageAsync();
  })
  .catch(function (e) {
    console.log(e);
  });
```

---

## SelectSourceByIndex

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
DWObject.GetSourceNames(); // for example ['PaperStream IP fi-7300NX Net', 'TWAIN2 FreeImage Software Scanner']
DWObject.SelectSourceByIndex(0); // choose scanner with the name "PaperStream IP fi-7300NX Net"
DWObject.OpenSource();
DWObject.AcquireImage();
```

---

## SelectSourceByIndexAsync

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
DWObject.SelectSourceByIndexAsync(0)
  .then(() => {
    return DWObject.OpenSourceAsync();
  })
  .then(() => {
    return DWObject.AcquireImageAsync();
  });
```

---

## SetOpenSourceTimeout

Sets a timer which stops the data source opening process once it expires.

**Syntax**

```typescript
SetOpenSourceTimeout(duration: number): boolean;
```

**Parameters**

`duration`: Define the duration of the timer (in milliseconds).

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
DWObject.SelectSource(function () {
  DWObject.SetOpenSourceTimeout(3000); // stop the opening process if the source cannot be opened within 3000 ms.
  DWObject.OpenSource();
  DWObject.AcquireImage();
});
```

---

## startScan

Start the acquisition by passing all settings at once.

**Syntax**

```typescript
startScan(scanSetup: ScanSetup): Promise<IScanSetup>;
```

**Parameters**

`scanSetup`: Configuration for the acquisition. Please refer to [ScanSetup]({{site.info}}api/Interfaces.html#scansetup).

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
<td align="center">v15.1+</td>
<td align="center">v15.1+</td>
<td align="center">v15.1+</td>
</tr>

</table>
</div>

**Sample**

<a href="https://demo.dynamsoft.com/Samples/dwt/Make-use-of-the-API-startScan/index.html" target="_blank">Make use of the API startScan </a>

---

## CancelAllPendingTransfers

Cancels all pending transfers.

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

This method is only valid in the events [OnPreAllTransfers](#onprealltransfers), [OnPreTransfer](#onpretransfer) and [OnPostTransfer](#onposttransfer).

---

## CloseSourceManager

Closes and unloads Data Source Manager.

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
DWObject.CloseSourceManager();
```

---

## CloseSourceManagerAsync

Closes and unloads Data Source Manager.

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

## CloseWorkingProcess

Closes the scanning process to release resources on the machine.

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

In the HTML5 edition, Dynamic Web TWAIN uses a separate process to communicate with the scanners. When it's not scanning, you can choose to close this process to release the resources (CPU, memory, etc.) used on the machine.

---

## FeedPage

Ejects the current page and begins scanning the next page in the document feeder.

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

Use this method after [OpenSource()](#opensource) is called and make sure [IfFeederEnabled](#iffeederenabled) is `true` .

---

## GetCustomDSData

Get the custom data source data and saves the data in a specified file.

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

Typically, the data source data file is set by the method [SetCustomDSData()](#setcustomdsdata).

**Example**

```javascript
// Please note, the API only works for TWAIN driver.
DWObject.GetCustomDSData("C:\\Users\\UserName\\Desktop\\ProfileName");
```

---

## GetCustomDSDataEx

Gets custom DS data and returns it in a base64 string.

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

Typically, the data source data file is set by the method [SetCustomDSDataEx()](#setcustomdsdataex).

**Example**

```javascript
// Please note, the API only works for TWAIN driver.
DWObject.GetCustomDSDataEx(); // Return a base64 string
```

---

## GetSourceNameItems

Get the name of a data source by its index in data source manager source list.

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
DWObject.GetSourceNames(); // [scanner 1, scanner 2, scanner 3...]
DWObject.GetSourceNameItems(0); // return the name of scanner 1
```

---

## OpenSourceManager

Load and open data source manager.

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

If application identification needs to be set, it should be set before this API.

**Example**

```javascript
DWObject.OpenSourceManager(); 
```

---

## OpenSourceManagerAsync

Load and open data source manager.

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

If application identification needs to be set, it should be set before this API.

---

## ResetImageLayout

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

To set the image layout manually, you can use [SetImageLayout()](#setimagelayout)

---

## RewindPage

If called while {IfFeederEnabled} property is true, the data source will return the current page to the input area and return the last page from the output area into the acquisition area.

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

Use this method after [OpenSource()](#opensource) method and make sure [IfFeederEnabled](#iffeederenabled) is `true` .

---

## SetCustomDSData

Sets custom data source data to be used for scanning, the data is stored in a file which can be regarded as a scanning profile.

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

Typically, the data source data file is created by the method [GetCustomDSData()](#getcustomdsdata).

**Example**

```javascript
// Please note, the API only works for TWAIN driver.
DWObject.SetCustomDSData("C:\\Users\\UserName\\Desktop\\ProfileName");
```

---

## SetCustomDSDataEx

Set custom data source data to be used for scanning, the input is a base64 string.

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

Typically the data source data string is created by the method [GetCustomDSDataEx()](#getcustomdsdataex)

```javascript
// Please note, the API only works for TWAIN driver.
DWObject.SetCustomDSData("the base64 string of your profile");
```

---

## SetFileXferInfo

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

Check out the available formats [Dynamsoft.DWT.EnumDWT_FileFormat]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_fileformat).

**Example**

```javascript
DWObject.OpenSource();
DWObject.TransferMode = Dynamsoft.DWT.EnumDWT_TransferMode.TWSX_FILE;
if (DWObject.TransferMode === Dynamsoft.DWT.EnumDWT_TransferMode.TWSX_FILE) {
    if (
        DWObject.SetFileXferInfo(
            "C:\\Temp\\WebTWAIN<%06d>.bmp",
            Dynamsoft.DWT.EnumDWT_FileFormat.TWFF_BMP
        )
    ) {
          DWObject.IfShowUI = true;
          DWObject.AcquireImage();
    }
}
```

---

## SetImageLayout

Set the left, top, right, and bottom sides of the image layout rectangle for the current data source. The image layout rectangle defines a frame of the data source's scanning area to be acquired.

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

The arguments set to the parameters `left` , `top` , `right` , `bottom` are based on the value of the `Unit` property which is `inches` by default.

This API is device-dependent. If a data source doesn't support the customization of the scan area, this method might not work correctly.

Since there are several ways to negotiate the scan area, it becomes confusing when deciding what should take precedence.

The TWAIN Working Group has suggested the following behavior

- If the current frame is set by `SetImageLayout` . The same frame shall be what you get with the APIs [CapGetFrameBottom()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameBottom), [CapGetFrameLeft()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameLeft), [CapGetFrameRight()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameRight), [CapGetFrameTop()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameTop) and the property [PageSize](#pagesize) shall return `TWSS_NONE` (0).
- If the current frame is set from negotiating the capability `ICAP_FRAMES` with the method [CapSetFrame()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapSetFrame), the property [PageSize](#pagesize) shall return `TWSS_NONE` (0) and the image layout shall reflect the same frame with the properties [ImageLayoutFrameBottom](#imagelayoutframebottom), [ImageLayoutFrameLeft](#imagelayoutframeleft), [ImageLayoutFrameRight](#imagelayoutframeright) and [ImageLayoutFrameTop](#imagelayoutframetop).
- If the current fixed frame is set by the property [PageSize](#pagesize), the same dimensions shall be reflected in the APIs [CapGetFrameBottom()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameBottom), [CapGetFrameLeft()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameLeft), [CapGetFrameRight()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameRight), [CapGetFrameTop()](https://www.dynamsoft.com/docs/dwt15.3.1/API/Capability-Negotiation.html#CapGetFrameTop) as well as [ImageLayoutFrameBottom](#imagelayoutframebottom), [ImageLayoutFrameLeft](#imagelayoutframeleft), [ImageLayoutFrameRight](#imagelayoutframeright) and [ImageLayoutFrameTop](#imagelayoutframetop). Note, however, the orientation (in other words, whether it's in the portrait mole or landscape mode) also plays a role in the order of the values.

**Example**

```javascript
DWObject.SelectSource();
DWObject.OpenSource();
DWObject.IfShowUI = false;
DWObject.Unit = Dynamsoft.DWT.EnumDWT_UnitType.TWUN_PIXELS;
DWObject.SetImageLayout(50, 50, 100, 100);
DWObject.AcquireImage();
```

---

## BitDepth

Return or set the pixel bit depth for the current value of `PixelType` .

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

Set this property after `OpenSource()` and before `AcquireImage()` .

By default, the bit depth is 1 for `TWPT_BW` , 8 for `TWPT_GRAY` and 24 for `TWPT_RGB` .

---

## IfAppendImage

Return or set whether newly acquired images are inserted or appended.

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

The value of this property defaults to `true` , which means that the newly acquired image will be appended to the last image in the buffer.

If it's set to `false` , the images will be inserted before the current image. The important thing to note is that, by design, the current image is always the last acquired one which means that the images acquired after setting `IfAppendImage` to `false` will be displayed / retained in the reverse order.

Here is an [article]({{site.faq}}insert-new-pages-to-existing-document.html#can-i-insert-newly-scanned-pages-to-an-existing-document) to demonstrate how to insert new images to a specified index.

---

## IfDisableSourceAfterAcquire

Return or set whether to close the built-in User Interface after all images have been acquired.

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

**Usage notes**

This property only makes sense when `IfShowUI` is set to `true` .

**Example**

```javascript
DWObject.OpenSource();
DWObject.IfDisableSourceAfterAcquire = true; // Close the scanner UI after images acquired.
DWObject.IfShowUI = true;
DWObject.AcquireImage(successCallback,failureCallback);

function successCallback() {
    DWObject.CloseSource();
}

function failureCallback(errorCode, errorString) {
    DWObject.CloseSource();
}
```

---

## IfDuplexEnabled

Return or set whether to enable duplex scanning (in other words, whether to scan both sides of the paper).

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

Set this property after `OpenSource()` and before `AcquireImage()` .

Not all scanners support duplex scanning. To confirm, check the user manual of the device or check the value of `Duplex` after `OpenSource()` .

**Example**

```javascript
DWObject.OpenSource();

if (DWObject.Duplex != 0) { // Note: DWObject.Duplex doesn't support Linux.
    DWObject.IfDuplexEnabled = true;
}

DWObject.AcquireImage();
```

---

## IfFeederEnabled

Return or set whether a data source's Automatic Document Feeder (ADF) is enabled for scanning.

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

Set this property after `OpenSource()` and before `AcquireImage()` .

If the property is set to `true` , the data source will try acquiring images from the document feeder first. If the data source doesn't have a document feeder, the flatbed will be used.

**Example**

```javascript
DWObject.OpenSource();
DWObject.IfFeederEnabled = true;
DWObject.AcquireImage();
```

---

## IfShowUI

Return or set whether the data source displays the user interface when scanning.

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

If the property is set to `true` , the data source will display its user interface when `AcquireImage()` is called. Otherwise, the UI will not be displayed and the scan will start immediately.

It's recommended to use this API after `OpenSource()` is called.

**Example**

```javascript
DWObject.OpenSource();
DWObject.IfShowUI = true; // display the scanner UI before acquiring image
DWObject.AcquireImage();
```

---

## ImageCaptureDriverType

Return or set the driver type which determines the type of sources to use.

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

Set this property right after the SDK is initialized or after calling `CloseSourceManager()` and `OpenSourceManager()` .

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

Return or set the page size the data source uses to acquire images.

**Syntax**

```typescript
PageSize: Dynamsoft.DWT.EnumDWT_CapSupportedSizes | number;
```

**Parameters**

`PageSize`: Please refer to [EnumDWT_CapSupportedSizes]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_capsupportedsizes)

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

Set this property after `OpenSource()` and before `AcquireImage()`.

---

## PixelType

Return or set the pixel type used when acquiring images.

**Syntax**

```typescript
PixelType: Dynamsoft.DWT.EnumDWT_PixelType | number;
```

**Parameters**

`PixelType`: Please refer to [EnumDWT_PixelType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_pixeltype)

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

Set this property after `OpenSource()` and before `AcquireImage()`.

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

Set this property after `OpenSource()` and before `AcquireImage()`.

---

## SourceCount

Returns how many data sources are available on the local system.

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

Retrun or set the dividing line between black and white.

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

`BlankImageThreshold` ranges from 0 to 255 and is 128 by default, it's only effective when [ `PixelType` ] is set to `TWPT_BW` . The bigger the value is, the more likely an image may be regarded as blank.

---

## Brightness

Return or set the brightness to be used for scanning by the data source.

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

Set this property after `OpenSource()` and before `AcquireImage()` .

Typically, the value range is -1000 ~ 1000 where -1000 indicates the darkest and 1000 the brightest.

---

## Contrast

Return or set Contrast to be used for scanning by the data source.

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

Set this property after `OpenSource()` and before `AcquireImage()` .

Typically, the value range is -1000 ~ 1000 where -1000 indicates the darkest and 1000 the brightest.

---

## CurrentSourceName

Return the device name of current source.

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

Return a value that indicates the data source status.

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
<td align="center">not supported</td>
</tr>

</table>
</div>

---

## Duplex

Return whether the source supports duplex. If yes, it further returns the level of duplex the data source supports.

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

This property does not support Linux.

---

## IfAutoBright

Return or set whether to enable the data source's auto-brightness feature.

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

Return or set whether the data source (the scanner) discards blank images during scanning automatically.

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

The property works only if the device and its driver supports discarding blank pages. You can find whether your device supports this capbility from its user manual.

Alternatively, the Dynamic Web TWAIN library can also detect blank images after they are transferred.

---

## IfAutoFeed

Return or set whether to enable the data source's automatic document feeding process.

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

Return or set whether to enable the data source's automatic border detection feature.

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

The property works only if the device and its driver support detecting the border automatically. You can find whether your device supports this capbility from its user manual.

Once enabled, the data source (scanner) will automatically detect the borders of the document so that no extra margins are scanned.

---

## IfAutomaticDeskew

Return or set whether to enable the data source's automatic skew correction feature.

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

The property works only if the device and its driver supports automatical deskewing. You can find whether your device supports this capbility from its user manual.

---

## IfAutoScan

Return or set whether to enable the data source's automatic document scanning process.

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

This property is only valid when [IfFeederEnabled](#iffeederenabled) is set to `true` .

The fundamental assumption behind this property is that the device may be able to capture the number of images indicated by the property [XferCount](#xfercount) without waiting for the Application to request the image transfers. This is only possible if the device has internal buffers capable of caching the images it captures.

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

This property is only valid when [IfFeederEnabled](#iffeederenabled) and [IfPaperDetectable](#ifpaperdetectable) are `true` .

---

## IfPaperDetectable

Return whether the Source has a paper sensor that can detect pages on the ADF or Flatbed.

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

Check this property after [OpenSource()](#opensource) is called.

---

## IfShowIndicator

Return or set whether the data source displays a progress indicator during acquisition and transfer.

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

This property works only when IfShowUI is set to `false` .

The indicator will only be hidden if you set both [IfShowUI](#ifshowui) and [IfShowIndicator](#ifshowindicator) to `false` .

---

## IfUIControllable

Return whether the data source supports acquisitions with the UI (User Interface) disabled.

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

Check this property after [OpenSource()](#opensource) is called.

---

## IfUseTwainDSM

Return or set whether the new TWAIN DSM (data source Manager) is used for acquisitions. The new TWAIN DSM is a DLL called 'TWAINDSM.dll' while the default or old DSM is called 'twain_32.dll'.

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

This property should be set before any TWAIN related methods or properties are called or set.

---

## ImageLayoutFrameBottom

Return the value of the bottom edge of the current image frame (in Unit).

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

Return the value of the left edge of the current image frame (in Unit).

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

## ImageLayoutFrameRight

Return the value of the right edge of the current image frame (in Unit).

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

Return the value of the top edge of the current image frame (in Unit).

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

Return the data of the magnetic data if the data source supports magnetic data recognition.

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

The numbers returned by these APIs are based on the value of the [Unit](#unit) property which by default means "inches".

These APIs are only valid in the callbacks for the events [OnPreTransfer](#onpretransfer) and [OnPostTransfer](#onposttransfer).

`MagData` and `MagType` are device-dependent. Check the user manual of the device to see if magnetic data recognition is supported.

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

This property is only valid in the event [OnPostTransfer](#onposttransfer).

The data source returns -1 if it is not sure how many transfers are pending which normally occurs when the ADF (Automatic Document Feeder) is used.

---

## PixelFlavor

Return or set the pixel flavor to be used for acquiring images.

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

- TWSX_NATIVE | 0: The default mode. In this mode, the whole image is transfered in a single memory block.
- TWSX_FILE | 1: In this mode, the image is transfered to a specified file on the disk directly. This mode is ideal when transferring large images that might encounter memory limitations with Native mode. Check out [SetFileXferInfo](#setfilexferinfo) for more information.
- TWSX_MEMORY | 2: In this mode, the image is transferred in multiple memory blocks. It's ideal for transferring very large images or a large number of images in a short time.

TWSX_NATIVE and TWSX_MEMORY are required by all TWAIN data sources while TWSX_FILE is not. Therefore, make sure the data source supports TWSX_FILE before you use it.

---

## Unit

Return or set the unit of measure for all quantities. Note that this setting is only effective for TWAIN/ICA (hardware) related operations.

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

Return and set the number of images your application is willing to accept for each scan job.

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

Allowed values are between -1 and 215 where -1 indicate multiple images.

---

## OnPostAllTransfers

This event is triggered when all page(s) have been scanned and transferred.

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

This event fires after all pages in the document feeder have been scanned and transferred. This is a good place to upload the images, detect barcodes, discard blank pages, etc.

**Example**

```javascript
DWObject.RegisterEvent("OnPostAllTransfers", function () {
  console.log("All images are transferred.");
});
```

---

## OnPostTransfer

This event is triggered after each page has been scanned and transferred.

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
DWObject.RegisterEvent("OnPostTransfer", function () {
  console.log("An image has been scanned");
});
```

---

## OnPostTransferAsync

This event is triggered after each page has been scanned and transferred. This is the asynchronous counterpart to the synchronous event {OnPostTransfer}.

**Syntax**

```typescript
RegisterEvent("OnPostTransferAsync", function (outputInfo: OutputInfo) {});
```

**Parameters**

`outputInfo`: Detailed information about the image that just got transferred. Please refer to [OutputInfo]({{site.info}}api/Interfaces.html#outputinfo).

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
DWObject.RegisterEvent("OnPostTransferAsync", function (outputInfo) {
  console.log("The image ID is " + outputInfo.imageId);
});
```

---

## OnPreAllTransfers

This event is triggered when all images are scanned and ready to be transferred.

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

Multiple transfers may occur in two cases

- Multiple images are scanned through the ADF(Auto Document Feeder)
- Multiple frames are scanned on one single page

In such cases, the event `OnPreTransfer` is triggered multiple times but `OnPreAllTransfers` is triggerred only once.

In the callback function of this event, you can call `CancelAllPendingTransfers()` to cancel all the transfers.

---

## OnPreTransfer

This event is triggered when a page has been scanned and is ready to be transferred.

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

In the callback function of this event, you can

- Check `PendingXFERs` for the number of pending transfers.
- Check the information about the transferred image including `ImageLayoutDocumentNumber` , `ImageLayoutFrameLeft` , `ImageLayoutFrameTop` , `ImageLayoutFrameRight` , `ImageLayoutFrameBottom` , `ImageLayoutPageNumber` , `ImageLayoutFrameNumber` , etc.
- Call `CancelAllPendingTransfers()` to cancel all the rest of the transfers.

---

## OnSourceUIClose

This event is triggered when the user interface of the data source is closed manually by the user.

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

## getCapabilities

Gets detailed information about all capabilities of the current data source.

**Syntax**

```typescript
getCapabilities(
    successCallback: (capabilityDetails: CapabilityDetails[]) => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`successCallback`: A callback function that is executed if the request succeeds.
- `capabilityDetails`: Detailed information about the specified capabilities. Please refer to [CapabilityDetails]({{site.info}}api/Interfaces.html#capabilitydetails).

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
<td align="center">not supported</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

---

## setCapabilities

Sets up one or multiple capabilities in one call.

**Syntax**

```typescript
setCapabilities(
    capabilities: Capabilities,
    successCallback: (capabilities: Capabilities) => void,
    failureCallback: (capabilities: Capabilities) => void
): void;
```

**Parameters**

`capabilities`: An object that describes how to set capabilities.

`successCallback`: A callback function that is executed if the request succeeds.
- `capabilities`: The capabilities to set.

`failureCallback`: A callback function that is executed if the request fails.
- `capabilities`: The capabilities to set.

Please refer to [Capabilities]({{site.info}}api/Interfaces.html#capabilities).

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
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage notes**

To make things easier, Dynamsoft designed the API with a simplified parameter `Capabilities` which only requires the minimum information for setting a capability: a number to specify the capability and the value to set to it. Underneath, Dynamsoft takes care of container type setting, value type setting as well as data validation.

Pay attention to the argument you set to the overall parameter `exception` and the individual parameter `exception` for each capability. If the overall parameter is set to `fail` , the setting will abort as soon as an exception is raised while setting any of the capabilities. Otherwise, `ignore` means to carry on setting the next capability even when the previous one failed. Aside from the overall parameter, the individual `exception` is optional but takes precedence if set. In other words, you can set the overall `exception` to `ignore` and then set the individual one to `fail` for the capabilities which you think are important. This way, you get notified if these important capabilities failed to be set while other less-important ones are ignored when setting them failed.

**Example**

```javascript
DWObject.SelectSourceByIndex(0);
DWObject.IfShowUI = false;
DWObject.OpenSource();
DWObject.setCapabilities(
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
    DWObject.AcquireImage(
      function () {},
      function () {
        console.log(DWObject.ErrorString);
      }
    );
  },
  function (errorData) {
    console.error(errorData);
    DWObject.AcquireImage(
      function () {},
      function () {
        console.log(DWObject.ErrorString);
      }
    );
  }
);
```
---

## GetDevicesAsync

Return all available devices (scanners, eSCL scanners, etc.) for the device type (if specified)

**Syntax**

```typescript
GetDevicesAsync(deviceType?: Dynamsoft.DWT.EnumDWT_DeviceType | number, refresh?:boolean): Promise<Device[]>;
```

**Parameters**

`deviceType`: The device type. Please refere to [EnumDWT_DeviceType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_devicetype)


`refresh`: Default value is **false**

**Arguments**

`Device`: Please refer to [Device]({{site.info}}api/Interfaces.html#device).

**Example**

```javascript
DWObject.GetDevicesAsync().then((deviceList)=>{
  return DWObject.SelectDeviceAsync(deviceList[0])  //Select the first device
}).then(()=>{
    return DWObject.AcquireImageAsync({}) 
}).catch((e)=>{
    console.error(e)
})
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
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

---

## SelectDeviceAsync

Select the device to use for scanning

**Syntax**

```typescript
SelectDeviceAsync(device: Device): Promise< boolean>;
```

**Example**

```javascript
DWObject.GetDevicesAsync().then((deviceList)=>{
  return DWObject.SelectDeviceAsync(deviceList[0])  //Select the first device
}).then(()=>{
    return DWObject.AcquireImageAsync({}) 
}).catch((e)=>{
    console.error(e)
})
```

**Parameters**

`device`: the device object. Please refer to [Device]({{site.info}}api/Interfaces.html#device).

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
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

---

## AcquireImageAsync

Scan documents into another DWObject control. eSCL is not supported.

**Syntax**

```typescript
AcquireImageAsync(deviceConfiguration?: DeviceConfiguration): Promise< boolean>;
```

**Parameters**

`deviceConfiguration`: The device configuration. Please refer to [DeviceConfiguration]({{site.info}}api/Interfaces.html#DeviceConfiguration).

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
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWObject.GetDevicesAsync().then((deviceList)=>{
  return DWObject.SelectDeviceAsync(deviceList[0])  //Select the first device
}).then(()=>{
    return DWObject.AcquireImageAsync({}) 
}).catch((e)=>{
    console.error(e)
})
```


<div class="multi-panel-switching-end"></div>

---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN API Reference - Device APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, Device APIs
breadcrumbText: Device
description: Dynamic Web TWAIN SDK Documentation API Reference Device APIs Page
permalink: /info/api/Device.html
---

# {DeviceObject} Scan

> The properties and methods on this page live in the namespace {DeviceObject}.

``` typescript
interface Device  {
    /**
     * The real name of the device.
     */
    readonly name: string;
    /**
     * The displayed name of the device.
     */
    readonly displayName: string;
    readonly deviceType: Dynamsoft.EnumDWT_DeviceType;
    readonly serviceInfo?: ServiceInfo;
    readonly deviceInfo?: any;
    acquireImage(deviceConfiguration: DeviceConfiguration | null, sendTo: WebTwain): Promise< boolean>;
}
``` 

**Methods**


| [`DeviceObject.acquireImage()`](#deviceobject.acquireimage)   |

---

## DeviceObject.acquireImage()

Scan documents into another DWTObject control. Supports eSCL scanners and all other scanners with limited capabilities.

**Syntax**

```typescript
acquireImage(deviceConfiguration: DeviceConfiguration | null, sendTo: WebTwain): Promise< boolean>;

interface DeviceConfiguration {
    IfShowUI?: boolean; //Whether to show the built-in User Interface from the device vendor
    PixelType?: Dynamsoft.DWT.EnumDWT_PixelType | number | string; //Whether to scan in color, grey or black & white
    Resolution?: number; //Measured by dots per pixel (DPI)
    IfFeederEnabled?: boolean; //Whether to use the document feeder or the flatbed of the device
    IfDuplexEnabled?: boolean; //Whether to scan one side or both sides
    IfDisableSourceAfterAcquire?: boolean; //Whether to close the built-in User Interface after aquisition. Only valid when {IfShowUI} is true.
    IfGetImageInfo?: boolean; //Whether to retrieve information about the image after it's transferred.
    IfGetExtImageInfo?: boolean; //Whether to retrieve extended information about the image after it's transferred.
    extendedImageInfoQueryLevel?: Dynamsoft.DWT.EnumDWT_ExtImageInfo | number; //How much extended information is retrieved. Only valid when {IfGetExtImageInfo} is true.
    SelectSourceByIndex?: number; //Specify a source by its index.
    IfCloseSourceAfterAcquire?: boolean; //Whether to close the data source after aquisition. Default: false.
}
```

**Parameters**

`deviceConfiguration`: The device configuration

`sendTo`: The DWTObject control to scan into

**Availability**
<div class="availability">
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
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.GetDevicesAsync().then((deviceList)=>{
  return deviceList[0].acquireImage({},DWTObject)  
}).then((result)=>{
    console.log(result)
}).catch((e)=>{
    console.error(e)
})
```
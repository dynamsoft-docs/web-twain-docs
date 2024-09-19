---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I support WIA scanner drivers in my application?
keywords: Dynamic Web TWAIN, Capture/ Image Source, WIA
breadcrumbText: How can I support WIA scanner drivers in my application?
description: How can I support WIA scanner drivers in my application?
permalink: /faq/support-wia-scanner-drivers.html
---

# Capture/Image Source

## How can I support WIA scanner drivers in my application?

Prior to Dynamic Web TWAIN version 18.2, WIA drivers are not supported and TWAIN drivers are recommended. Please refer to <a href="{{site.faq}}difference-between-Twain-and-wia.html" target="_blank">this article</a> for the differences between WIA and TWAIN drivers.

As of Dynamic Web TWAIN version 18.2, we officially support WIA 2.0. By comparison, `WIA` can only control a very limited set of general capabilities of the device, while `TWAIN` can control all standard and even custom capabilities of the device. In addition, `WIA` has only two transfer modes (Memory, File), while `TWAIN` has three (Native, Memory, File).

Since Dynamic Web TWAIN v18.0, we introduced a new set of scanner related APIs.
To compatible with both TWAIN and WIA 2.0, 
- If your application is already using the new set of APIs below, no application change is required.
- If not, replace the old APIs with the matching new APIs.

| New APIs (supports WIA) | Old APIs |
|:-|:-|
| [GetDeviceAsync()](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html#getdevicesasync) | [GetSourceNames()](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html#getsourcenames), [GetSourceNamesAsync()](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html#getsourcenamesasync)|
| [SelectDeviceAsync()](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html#selectdeviceasync) | [SelectSourceByIndex()](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html#selectsourcebyindex), [SelectSourceByIndexAsync()](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html#selectsourcebyindexasync) |
| [SelectSourceAsync()](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html#selectsourceasync) | [SelectSource()](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html#selectsource) |
| [AcquireImageAsync()](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html#acquireimageasync) | [AcquireImage()](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html#acquireimage) |

### Example Code

```javascript
DWTObject.GetDevicesAsync(Dynamsoft.DWT.EnumDWT_DeviceType.TWAINSCANNER|Dynamsoft.DWT.EnumDWT_DeviceType.WIASCANNER).then((deviceList)=>{
  return DWTObject.SelectDeviceAsync(deviceList[0])  //Select the first device
}).then(()=>{
    return DWTObject.AcquireImageAsync({}) 
}).catch((e)=>{
    console.error(e)
})
```

### Difference between the WIASCANNER and WIATWAINSCANNER DeviceType
To support the WIA protocol in v18.2+, we added a new Enumaration `WIASCANNER` to [Dynamsoft.DWT.EnumDWT_DeviceType](https://www.dynamsoft.com/web-twain/docs/info/api/Dynamsoft_Enum.html?ver=latest&&cVer=true#dynamsoftdwtenumdwt_devicetype) . The enumaration named `WIATWAINSCANNER` represents WIA sources mapped through the TWAIN protocol after packaging by Microsoft. It was used in previous versions of Dynamic Web TWAIN and it will continue to be supported.

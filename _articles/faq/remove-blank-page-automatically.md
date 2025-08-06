---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can the Dynamic Web TWAIN SDK automatically remove blank pages during the document scanning process?
keywords: Dynamic Web TWAIN, Capture/ Image Source, detect, discard blank pages
breadcrumbText: Can the Dynamic Web TWAIN SDK automatically remove blank pages during the document scanning process?
description: Can the Dynamic Web TWAIN SDK automatically remove blank pages during the document scanning process?
date: 2021-07-14 18:58:25 +0800
---

# Capture/Image Source

## Can the Dynamic Web TWAIN SDK automatically remove blank pages during the document scanning process?

### Method One

If the TWAIN driver of your device supports discarding blank pages, you can use the driver's built-in feature.

1. You can set the [ `IfShowUI` ](/_articles/info/api/WebTwain_Acquire.md#ifshowui) property to true to display the User Interface (UI) of the source and you can check the option there (It normally reads 'discard blank'.).
2. If you don't want to show the user interface of the source, you can set [ `IfAutoDiscardBlankpages` ](/_articles/info/api/WebTwain_Acquire.md#ifautodiscardblankpages) to true or negotiate the ICAP_AUTODISCARDBLANKPAGES capability to discard blank pages automatically. Please NOTE that this property or capability only works if the scanner itself supports the feature (on the hardware level).

```javascript
DWTObject.SelectSource();
DWTObject.OpenSource;
DWTObject.IfShowUI = false;
//*Use the property
DWTObject.IfAutoDiscardBlankpages = true;
//*Use capability negotiation
DWTObject.Capability = Dynamsoft.DWT.EnumDWT_Cap.ICAP_AUTODISCARDBLANKPAGES;
DWTObject.CapType = Dynamsoft.DWT.EnumDWT_CapType.TWON_ONEVALUE;
DWTObject.CapValue = -1; //Auto
if (DWTObject.CapSet) {
  alert("Successful!");
}
DWTObject.AcquireImage();
```

### Method Two

If the scanner itself doesn't support discarding blank pages, you can also use the [ `IsBlankImageExpress` ](/_articles/info/api/WebTwain_Buffer.md#isblankimageexpress) method to do this as a workaround. To detect and discard blank pages automatically, you can do it in the [ `OnPostTransfer` ](/_articles/info/api/WebTwain_Acquire.md#onposttransfer) event which fires after each transfer.

```javascript
function DWTObject_OnPostTransfer() {
  DWTObject.BlankImageMaxStdDev = 20;
  if (DWTObject.IsBlankImageExpress(DWTObject.CurrentImageIndexInBuffer)) {
    DWTObject.RemoveImage(DWTObject.CurrentImageIndexInBuffer);
  }
}
```

NOTE: In many cases, the scanned blank image may come with some noises which would affect the result returned by IsBlankImageExpress. To improve the result, you may adjust the value of the [ `BlankImageMaxStdDev` ](/_articles/info/api/WebTwain_Buffer.md#blankimagemaxstddev) property. The default value is 1 (0 means single-color image). Thus, by increasing the value a little bit (e.g. to 20), noises on images are ignored so a blank image can be detected faster.

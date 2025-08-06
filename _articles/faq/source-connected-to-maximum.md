---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Source is connected to the maximum supported number of applications
keywords: Dynamic Web TWAIN, Error Troubleshooting
breadcrumbText: Source is connected to the maximum supported number of applications
description: Source is connected to the maximum supported number of applications
date: 2021-12-03 23:26:46 +0800
---

# Error Troubleshooting

## Source is connected to the maximum supported number of applications

### Symptom

When you try to acquire images, you may get this error.

### Cause

The problem may occur when the source is **not** disabled completely after a transfer ends or is used by other applications.

### Resolution

- Check whether another application is using the source. If yes, close it and try again.
- Set [IfDisableSourceAfterAcquire](/_articles/info/api/WebTwain_Acquire.md#ifdisablesourceafteracquire) to `true` and use [CloseSource()](/_articles/info/api/WebTwain_Acquire.md#closesource) to make sure that the source is closed after a scanning session.

```javascript
function btnScan_onclick() {
  DWTObject.RegisterEvent("OnPostAllTransfers", function () {
    DWTObject.CloseSource();
  });
  DWTObject.SelectSource();
  DWTObject.CloseSource(); //close source before open
  DWTObject.OpenSource();
  DWTObject.IfDisableSourceAfterAcquire = true; //close the scanner UI after acquiring
  DWTObject.AcquireImage();
}
```

- Reboot your device.

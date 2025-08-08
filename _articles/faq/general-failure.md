---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: General failure
keywords: Dynamic Web TWAIN, Documentation, ErrorList
breadcrumbText: General failure
description: General failure
date: 2020-12-10 16:11:49 +0800
last_modified: 2024-09-19 08:47:35 +0800
---

# ErrorList

## General failure

- Symptom

When scanning an image with Dynamic Web TWAIN, you may receive the error message "General failure" in the ErrorString property.

- Cause

The problem occurs when the source (scanner) is _not_ disabled completely after a scanning session or the source is currently unavailable.

- Resolution

You can reset the existing connections of the source by calling [CloseSource](/_articles/info/api/WebTwain_Acquire.md#closesource){:target="_blank"} & [CloseSourceManager](/_articles/info/api/WebTwain_Acquire.md#closesourcemanager){:target="_blank"} to close the sources existing connections before calling [SelectSource](/_articles/info/api/WebTwain_Acquire.md#selectsource){:target="_blank"}.

```javascript
function AcquireImage() {
  DWTObject.CloseSource();
  DWTObject.CloseSourceManager();
  DWTObject.SelectSource();
  DWTObject.OpenSource();
  DWTObject.AcquireImage();
}
```

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can the Dynamic Web TWAIN SDK detect whether papers exist on the flatbed?
keywords: Dynamic Web TWAIN, Capture/ Image Source, detect paper, flatbed
breadcrumbText: Can the Dynamic Web TWAIN SDK detect whether papers exist on the flatbed?
description: Can the Dynamic Web TWAIN SDK detect whether papers exist on the flatbed?
date: 2021-12-08 03:01:32 +0800
last_modified: 2024-09-19 08:47:35 +0800
---

# Capture/Image Source

## Can the Dynamic Web TWAIN SDK detect whether papers exist on the flatbed?

Yes. You can use [IfFeederLoaded](/_articles/info/api/WebTwain_Acquire.md#iffeederloaded){:target="_blank"} API to inspect whether papers are loaded in the feeder of your current scanner. Before calling this API, please use [IfPaperDetectable](/_articles/info/api/WebTwain_Acquire.md#ifpaperdetectable){:target="_blank"} to inspect whether your current scanner hardware has a sensor to detect papers.

Code Example:

```javascript
DWTObject.SelectSource();
DWTObject.OpenSource();
if(DWTObject.IfPaperDetectable)
  if(DWTObject.IfFeederLoaded)
    DWTObject.AcquireImage();
  else
    alert("There is no paper in the feeder.");
...
...
```

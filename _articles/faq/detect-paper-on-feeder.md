---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can the Dynamic Web TWAIN SDK detect whether papers exist in the feeder?
keywords: Dynamic Web TWAIN, Capture/ Image Source, detect paper, feeder, ADF
breadcrumbText: Can the Dynamic Web TWAIN SDK detect whether papers exist in the feeder?
description: Can the Dynamic Web TWAIN SDK detect whether papers exist in the feeder?
date: 2021-12-08 03:01:32 +0000
last_modified: 2026-07-30 10:01:04 +0000
---

# Capture/Image Source

## Can the Dynamic Web TWAIN SDK detect whether papers exist in the feeder?

Yes. You can use [IfFeederLoaded](/_articles/info/api/WebTwain_Acquire.md#iffeederloaded){:target="_blank"} API to inspect whether papers are loaded in the feeder of your current scanner. Before calling this API, please use [IfPaperDetectable](/_articles/info/api/WebTwain_Acquire.md#ifpaperdetectable){:target="_blank"} to inspect whether your current scanner hardware has a sensor to detect papers.

Code Example:

```javascript
DWTObject.SelectSource();
DWTObject.OpenSource();
DWTObject.IfFeederEnabled = true;
if(DWTObject.IfPaperDetectable)
  if(DWTObject.IfFeederLoaded)
    DWTObject.AcquireImage();
  else
    alert("There is no paper in the feeder.");
...
...
```

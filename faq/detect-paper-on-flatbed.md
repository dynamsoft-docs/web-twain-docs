---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can the Dynamic Web TWAIN SDK detect whether papers exist on the flatbed?
keywords: Dynamic Web TWAIN, Capture/ Image Source, detect paper, flatbed
breadcrumbText: Can the Dynamic Web TWAIN SDK detect whether papers exist on the flatbed?
description: Can the Dynamic Web TWAIN SDK detect whether papers exist on the flatbed?
permalink: /faq/detect-paper-on-flatbed.html
---

# Capture/Image Source

## Can the Dynamic Web TWAIN SDK detect whether papers exist on the flatbed?

Yes. You can use <a href="{{site.info}}api/WebTwain_Acquire.html#iffeederloaded" target="_blank">IfFeederLoaded</a> API to inspect whether papers are loaded in the feeder of your current scanner. Before calling this API, please use <a href="{{site.info}}api/WebTwain_Acquire.html#ifpaperdetectable" target="_blank">IfPaperDetectable</a> to inspect whether your current scanner hardware has a sensor to detect papers.

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

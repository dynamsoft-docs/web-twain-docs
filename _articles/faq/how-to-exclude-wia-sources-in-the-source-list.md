---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK FAQs Develop How to Exclude WIA Sources in the Source List
keywords: Dynamic Web TWAIN, Documentation, Develop
breadcrumbText: How To Exclude WIA Sources in the Source List
description: Dynamic Web TWAIN SDK Documentation FAQs How to Exclude WIA Sources in the Source List
date: 2022-09-15 03:22:48 +0800
---

# Develop

## How to exclude WIA sources in the source list?

> Applicable to Windows only

There are two ways to achieve this:

* Set [IfUseTwainDSM](/_articles/info/api/WebTwain_Acquire.md#ifusetwaindsm) to `true`

``` javascript
DWTObject.IfUseTwainDSM = true;
```

* Filter sources before listing them

``` javascript
var sources = DWTObject.GetSourceNames();
sources = sources.filter(source => !source.toLowerCase().includes('wia'));
```

If you are still having issues with a device, please feel free to [contact us](https://www.dynamsoft.com/company/contact/) via email, live chat, or phone call.

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I configure all scanned images to conform to a specific size standard (e.g., A4)?
keywords: Dynamic Web TWAIN, Image Editing, page size, A4
breadcrumbText: How can I configure all scanned images to conform to a specific size standard (e.g., A4)?
description: How can I configure all scanned images to conform to a specific size standard (e.g., A4)?
permalink: /faq/set-page-size.html
---

# Image Editing

## How can I configure all scanned images to conform to a specific size standard (e.g., A4)?

Simply, you can use <a href="{{site.info}}api/WebTwain_Acquire.html#pagesize" target="_blank">PageSize</a> to set the page size to be used when acquiring images.
Or you can leverage the negotiation capabilities functionality by following the steps mentioned below.

1. ask for the supported sizes of your device.
```javascript
DWTObject.getCapabilities(
  function (result) {
    for (var i = 0; i < result.length; i++) {
      if (
        result[i].capability.value ===
        Dynamsoft.DWT.EnumDWT_Cap.ICAP_SUPPORTEDSIZES
      )
        sizes = result[i].values;
    }
    console.log(sizes);
  },
  function (error) {
    console.log(error);
  }
);
```

2. set the page size to a size standard as needed.
```javascript
DWTObject.setCapabilities(
  {
    exception: "ignore",
    capabilities: [
      {
        capability: Dynamsoft.DWT.EnumDWT_Cap.ICAP_SUPPORTEDSIZES,
        curValue: 1, // 1 means 'A4' in our case
        exception: "fail",
      },
    ],
  },
  function (result) {
    console.log(result);
  },
  function (error) {
    console.log(error);
  }
);
```

A list of the values of various supported sizes can be found <a href="{{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_capsupportedsizes" target="_blank">here</a>. You can use the value for the curValue property.

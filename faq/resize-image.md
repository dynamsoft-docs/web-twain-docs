---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I resize all images to meet a certain size standard, e.g., A4 size?
keywords: Dynamic Web TWAIN, Image Editing, resize image, A4
breadcrumbText: How can I resize all images to meet a certain size standard, e.g., A4 size?
description: How can I resize all images to meet a certain size standard, e.g., A4 size?
---

# Image Editing

## How can I resize all images to meet a certain size standard, e.g., A4 size?

Simply, you can use <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Acquire.html?ver=latest#pagesize" target="_blank">PageSize</a> to set the page size to be used when acquiring images.
Or you can leverage the negotiation capabilities functionality by following the steps mentioned below.

1. ask for the supported sizes of your device.

```javascript
DWObject.getCapabilities(
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
DWObject.setCapabilities(
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

List of the value of various supported sizes can be found <a href="https://www.dynamsoft.com/web-twain/docs/info/api/Dynamsoft_Enum.html?ver=latest#dynamsoftdwtenumdwt_capsupportedsizes" target="_blank">here</a> to be used in the curValue property.

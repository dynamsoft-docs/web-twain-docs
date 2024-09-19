---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I get a list of supported resolution/DPI values from the document scanner?
keywords: Dynamic Web TWAIN, Capture/ Image Source, supported resolution, DPI
breadcrumbText: How can I get a list of supported resolution/DPI values from the document scanner?
description: How can I get a list of supported resolution/DPI values from the document scanner?
permalink: /faq/list-supported-resolution-DPI.html
---

# Capture/Image Source

## How can I get a list of supported resolution/DPI values from the document scanner?

You can use capability negotiation to get all the resolutions supported by the scanner.

Steps:

- Step-1: Use <a href="{{site.info}}api/WebTwain_Acquire.html#getcapabilities" target="_blank">getCapabilities</a> to get all capabilities of the current data source,

```javascript
DWTObject.OpenSource();
DWTObject.getCapabilities(
  function () {
    console.log(arguments);
  },
  function (error) {
    console.log(error);
  }
);
```

and then find the capability corresponding to the resolution. Normally, it is called ICAP_XRESOLUTION.

![Capability Resolution]({{site.assets}}imgs/capability-resolution.png)

- Step-2: Call the following code to get all the resolutions supported by the scanner.

```javascript
DWTObject.OpenSource();
DWTObject.getCapabilities(
  function (result) {
    for (var i = 0; i < result.length; i++) {
      if (result[i].capability.value === Dynamsoft.DWT.EnumDWT_Cap.ICAP_XRESOLUTION) {
        if (result[i].conType.label === 'TWON_ENUMERATION') { // If the capability's Vaule Type is Enumeration
            dpi = result[i].values;
            console.log(dpi); // The list of supported resolution.
        } else if (result[i].conType.label === 'TWON_RANGE') { // If the capability's Vaule Type is Range
            max = result[i].maxValue;
            min = result[i].minValue;
            step = result[i].stepSize;

            console.log("maxValue: " + max); // The maximum value for the resolution.
            console.log("minValue: " + min); // The minimum value for the resolution.
            console.log("stepSize: " + step); // The step size for the resolution.
        } else {
            console.log("Please contact Dynamsoft for help.");
        }
      }
    }   
  },
  function (error) {
    console.log(error);
  }
);
```

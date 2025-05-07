---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I use a custom capability of my scanner hardware when there is no direct API to set it?
keywords: Dynamic Web TWAIN, Capture/ Image Source, custom capability
breadcrumbText: How can I use a custom capability of my scanner hardware when there is no direct API to set it?
description: How can I use a custom capability of my scanner hardware when there is no direct API to set it?
---

# Capture/Image Source

## How can I use a custom capability of my scanner hardware when there is no direct API to set it?

You can use Capability Negotiation to set it. Capability Negotiation is the way a TWAIN application communicates with a TWAIN source. This is how Dynamic Web TWAIN communicates with a scanner. The process looks something like this:

- [Dynamic Web TWAIN] Are you capable of \*\*\*?
- [Scanner] Yes, and here is what I can do…
- [Dynamic Web TWAIN] Great, here is what I want done…
- [Scanner] Consider it done

The steps are:

1. Use [getCapabilities](/_articles/info/api/WebTwain_Acquire.md#getcapabilities){:target="_blank"} to find the capability you want to set.

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

- Alternatively, you can install the [TWAIN Sample App](http://www.dynamsoft.com/download/support/twainapp.win32.installer.msi) to check the capabilities available and their values.

2. Use [setCapabilities](/_articles/info/api/WebTwain_Acquire.md#setcapabilities){:target="_blank"} to set the capability.

```javascript
DWTObject.setCapabilities(
  {
    exception: "ignore",
    capabilities: [
      {
        capability: Dynamsoft.DWT.EnumDWT_Cap.ICAP_CONTRAST,
        curValue: 500, // set the contrast to 500
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

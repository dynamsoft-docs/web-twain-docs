---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: The loading bar keeps spinning when capture the image with iPhone.
keywords: Dynamic Web TWAIN, Error Troubleshooting, wasm, iphone
breadcrumbText: The loading bar keeps spinning when capture the image with iPhone.
description: The loading bar keeps spinning when capture the image with iPhone.
date: 2023-05-22 14:37:58 +0800
---

# Error Troubleshooting

## The loading bar keeps spinning when capturing images with iPhone.

### Symptom

iOS 16.4 was released on March 27th, 2023. In this version, all browsers on iOS have begun to support `OffscreenCanvas`. Unfortunately, Apple's implementation of the API is still incomplete and is missing an important feature: "webgl context". Please see the MDN docs on [OffscreenCanvas](https://developer.mozilla.org/en-US/docs/Web/API/OffscreenCanvas) for more details.

### Cause

`OffscreenCanvas` is utilized in all versions of the Dynamic Web TWAIN Mobile Web Capture Edition. After you upgrade your iOS to v16.4, the loading bar will keep spinning when you try to capture an image. Note that the Service Edition is not affected by this issue.

### Resolution

Add the following lines of code to disable the API.

```javascript
if (Dynamsoft.navInfoSync.biPhone || Dynamsoft.navInfoSync.biPad) {
    window.OffscreenCanvas = null
}
```

**Or** download the patch version:

- For NPM project, please upgrade your dwt package to `v17.3.4` or `v18.0.2`.

- For Non-NPM application, please download the new camera.js file below and replace the old file with new one under `Resource/addon` directory.
    - [v17.3 camera.js file](https://tst.dynamsoft.com/public/DWT_FIX/v17.3/OffscreenCanvas/dynamsoft.webtwain.addon.camera.zip)
    - [v18.0 camera.js file](https://tst.dynamsoft.com/public/DWT_FIX/v18.0/OffscreenCanvas/dynamsoft.webtwain.addon.camera.zip)

> If the resolution doesn't work for you, please [contact us](https://www.dynamsoft.com/company/contact/).
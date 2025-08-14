---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How to test if your scanner supports ICA scanning on Mac OS
keywords: Dynamic Web TWAIN, Capture/ Image Source, verify scanner, compatible, ICA
breadcrumbText: How to test if your scanner supports ICA scanning on Mac OS
description: How to test if your scanner supports ICA scanning on Mac OS
date: 2021-07-14 18:55:57 +0800
last_modified: 2022-12-22 09:32:48 +0800
---

# Capture/Image Source

## How to test if your scanner supports ICA scanning on Mac OS?

![Hardware-Scanners-Cameras-2](/assets/imgs/Hardware-Scanners-Cameras-2.png)

`ICA Scanners` refer to image scanners that have drivers designed in accordance with the [ImageCaptureCore Framework](https://developer.apple.com/documentation/imagecapturecore).

### Facts about ICA

- ICA is a framework from Apple designed to "Browse for media devices and control them programmatically from your app."

- ICA is supported on macOS X.

### Is my Scanner ICA Compliant?

There are 3 ways to verify whether your scanner is ICA compliant.

- [Recommended & Easiest] Take advantage of our official demo page

  - Open the [demo page](https://demo.dynamsoft.com/dwt/online_demo_scan.aspx) on [macOS]({{site.getstarted}}platform.html#browsers-on-macos)

  > If you haven't installed Dynamic Web TWAIN, a dialog will show up for you to download and install it.

  - Make sure the scanner driver shows up in the scanner list.

![Hardware-Scanners-Cameras-5](/assets/imgs/Hardware-Scanners-Cameras-5.png)

- Try scanning to make sure it works correctly without any errors

* [Recommended] Try the scanner with the ImageCapture app on macOS.

  - Find the Image Capture application

![Hardware-Scanners-Cameras-12.png](/assets/imgs/Hardware-Scanners-Cameras-12.png)

- Open the application

![Hardware-Scanners-Cameras-13.png](/assets/imgs/Hardware-Scanners-Cameras-13.png)

- Acquire an image and see how it works

![Hardware-Scanners-Cameras-14.png](/assets/imgs/Hardware-Scanners-Cameras-14.png)

For more info, please check out the [official guide](https://support.apple.com/en-ca/guide/image-capture/imgcp1004/mac).

- Check out the [official list](https://support.apple.com/en-us/HT201465) of supported ICA scanners on MacOS.

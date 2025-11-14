---
layout: default-layout
needAutoGenerateSidebar: true
title: Imaging Hardware
keywords: Dynamic Web TWAIN, Documentation, TWAIN, ICA, SANE, DirectShow, Webcam, MediaDevices Hardware
breadcrumbText: Imaging Hardware
description: Dynamic Web TWAIN supports image capture from TWAIN Scanners, ICA Scanners, SANE Scanners, DirectShow Cameras, and MediaDevices Cameras.
---

# Imaging Hardware 

Dynamic Web TWAIN's main feature is interacting with imaging devices like scanners and cameras via different APIs like TWAIN, ICA, SANE and DirectShow. As long as the scanners are supported by these APIs, Dynamic Web TWAIN can use them.

In this section, we'll look at these APIs.

## TWAIN

![Hardware-Scanners-Cameras-1](/assets/imgs/Hardware-Scanners-Cameras-1.png)

* TWAIN is an application programming interface (API) and communication protocol that regulate communication between software and digital imaging devices, such as image scanners and digital cameras. 

* TWAIN is supported on Microsoft Windows, Linux, and macOS X. However, based on our experience and the experience of many customers, TWAIN only works well on Windows. On Linux, [SANE](#sane) is the better and preferred alternative; on macOS, [ICA](#ica) is the better and preferred alternative.

* TWAIN is actively maintained by the non-profit [TWAIN Working Group](https://www.twain.org/). Members of the group consist of scanner vendors and imaging software vendors, including FUJITSU, Panasonic, Epson, HP, ExactCODE, LEADTOOLS, and of course, Dynamsoft.

* TWAIN is [the most commonly used protocol](https://www.twain.org/why-twain/) for image capturing and processing. Almost all scanners on the market come with a TWAIN driver and are supported by TWAIN applications like `Dynamic Web TWAIN`.

See more: [How to use TWACKER to check if your device is TWAIN Compliant?](/_articles/faq/how-to-use-TWACKER-to-check-if-your-device-is-TWAIN-Compliant.md){:target="_blank"}

## ICA

![Hardware-Scanners-Cameras-2](/assets/imgs/Hardware-Scanners-Cameras-2.png)

* ICA is a framework ([ImageCaptureCore Framework](https://developer.apple.com/documentation/imagecapturecore)) from Apple designed to "Browse for media devices and control them programmatically from your app."

* ICA is supported on macOS X.

See more: [How to test if your scanner supports ICA scanning on Mac OS?](/_articles/faq/how-to-test-if-your-scanner-supports-ICA-scanning-on-Mac-OS.md){:target="_blank"} 

## SANE

![Hardware-Scanners-Cameras-3](/assets/imgs/Hardware-Scanners-Cameras-3.png)

* [SANE](http://www.sane-project.org/) stands for "Scanner Access Now Easy" and is an application programming interface (API) that provides standardized access to any raster image scanner hardware.

* SANE is supported on multiple Linux distributions.

* As of version 16.1.1, `Dynamic Web TWAIN` supports SANE v1.0.25.

* You can find the list of supported devices [here](https://www.sane-project.org/sane-supported-devices.html).

See more: [How to test if your device is SANE compliant?](/_articles/faq/how-to-test-if-your-device-is-SANE-compliant.md){:target="_blank"} 

## DirectShow

![Hardware-Scanners-Cameras-4](/assets/imgs/Hardware-Scanners-Cameras-4.png)

Cameras can be accessed via the [Microsoft DirectShow architecture](https://docs.microsoft.com/en-us/windows/win32/directshow/introduction-to-directshow). These cameras are either built into desktops / laptops or connected via USB.

See more: [Is my Camera DirectShow Compliant?](/_articles/faq/how-to-test-if-your-camera-is-DirectShow-compliant.md){:target="_blank"}  
---
layout: default-layout
needAutoGenerateSidebar: true
title: Imaging Hardware
keywords: Dynamic Web TWAIN, Documentation, TWAIN, ICA, SANE, DirectShow, Webcam, MediaDevices Hardware
breadcrumbText: Imaging Hardware
description: Dynamic Web TWAIN supports image capture from TWAIN Scanners, ICA Scanners, SANE Scanners, DirectShow Cameras, and MediaDevices Cameras.
---

# Imaging Hardware 

Dynamic Web TWAIN's main feature is interacting with imaging devices like scanners and cameras. In this section, we'll look at the supported devices.

- [Imaging Hardware](#imaging-hardware)
  - [TWAIN Scanners](#twain-scanners)
    - [Facts about TWAIN](#facts-about-twain)
  - [ICA Scanners](#ica-scanners)
    - [Facts about ICA](#facts-about-ica)
  - [SANE Scanners](#sane-scanners)
    - [Facts about SANE](#facts-about-sane)
  - [DirectShow Cameras](#directshow-cameras)

## TWAIN Scanners

![Hardware-Scanners-Cameras-1]({{site.assets}}imgs/Hardware-Scanners-Cameras-1.png)

`TWAIN Scanners` refer to image scanners and document scanners that have drivers following the TWAIN standard.

### Facts about TWAIN

* TWAIN is an application programming interface (API) and communication protocol that regulate communication between software and digital imaging devices, such as image scanners and digital cameras. 

* TWAIN is supported on Microsoft Windows, Linux, and macOS X. However, based on our experience and the experience of many customers, TWAIN only works well on Windows. On Linux, [SANE](#sane-scanners) is the better and preferred alternative; on macOS, [ICA](#ica-scanners) is the better and preferred alternative.

* TWAIN is actively maintained by the non-profit [TWAIN Working Group](https://www.twain.org/). Members of the group consist of scanner vendors and imaging software vendors, including FUJITSU, Panasonic, Epson, HP, ExactCODE, LEADTOOLS, and of course, Dynamsoft.

* TWAIN is [the most commonly used protocol](https://www.twain.org/why-twain/) for image capturing and processing. Almost all scanners on the market come with a TWAIN driver and are supported by TWAIN applications like `Dynamic Web TWAIN`.

See more: <a href="/web-twain/docs/faq/how-to-use-TWACKER-to-check-if-your-device-is-TWAIN-Compliant.html" target="_blank">How to use TWACKER to check if your device is TWAIN Compliant?</a>

## ICA Scanners

![Hardware-Scanners-Cameras-2]({{site.assets}}imgs/Hardware-Scanners-Cameras-2.png)

`ICA Scanners` refer to image scanners that have drivers designed in accordance with the [ImageCaptureCore Framework](https://developer.apple.com/documentation/imagecapturecore).

### Facts about ICA

* ICA is a framework from Apple designed to "Browse for media devices and control them programmatically from your app."

* ICA is supported on macOS X.

See more: <a href="/web-twain/docs/faq/how-to-test-if-your-scanner-supports-ICA-scanning-on-Mac-OS.html" target="_blank">How to test if your scanner supports ICA scanning on Mac OS?</a> 

## SANE Scanners

![Hardware-Scanners-Cameras-3]({{site.assets}}imgs/Hardware-Scanners-Cameras-3.png)

`SANE Scanners` refer to image scanners that have drivers designed in accordance with the [SANE API](http://www.sane-project.org/).

### Facts about SANE

* SANE stands for "Scanner Access Now Easy" and is an application programming interface (API) that provides standardized access to any raster image scanner hardware.

* SANE is supported on multiple Linux distributions.

* As of version 16.1.1, `Dynamic Web TWAIN` supports SANE v1.0.25.

See more: <a href="/web-twain/docs/faq/how-to-test-if-your-device-is-SANE-compliant.html" target="_blank">How to test if your device is SANE compliant?</a> 

## DirectShow Cameras

![Hardware-Scanners-Cameras-4]({{site.assets}}imgs/Hardware-Scanners-Cameras-4.png)

`DirectShow Cameras` refer to the cameras which can be accessed via the [Microsoft DirectShow architecture](https://docs.microsoft.com/en-us/windows/win32/directshow/introduction-to-directshow). These cameras are either built into desktops / laptops or connected via USB.

See more: <a href="/web-twain/docs/faq/how-to-test-if-your-camera-is-DirectShow-compliant.html" target="_blank">Is my Camera DirectShow Compliant?</a>  
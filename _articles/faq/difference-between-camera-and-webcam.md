---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What is the difference between WebTwain.Addon.Camera and WebTwain.Addon.Webcam?
keywords: Dynamic Web TWAIN, Addon, camera, webcam
breadcrumbText: What is the difference between WebTwain.Addon.Camera and WebTwain.Addon.Webcam?
description: What is the difference between WebTwain.Addon.Camera and WebTwain.Addon.Webcam?
date: 2021-12-01 01:09:41 +0800
---

# Addon

## What is the difference between WebTwain.Addon.Camera and WebTwain.Addon.Webcam?

`WebTwain.Addon.Camera` supports mobile camera, whereas `WebTwain.Addon.Webcam` supports web cameras in mainstream desktop browsers.

Please note that the Camera module requires a secure connection as only a secure site can make use of the camera on mobile devices. If you use this feature, you need to enable HTTPS on the server. For how to enable HTTPS, please check out the manual of your webserver.

For some advanced features, you may also need <a href="{{site.getstarted}}platform.html#wasm-browsers" target="_blank">WASM browser</a>.

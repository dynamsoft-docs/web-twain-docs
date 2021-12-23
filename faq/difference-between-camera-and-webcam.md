---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What is the difference between WebTwain.Addon.Camera and WebTwain.Addon.Webcam?
keywords: Dynamic Web TWAIN, Addon, camera, webcam
breadcrumbText: What is the difference between WebTwain.Addon.Camera and WebTwain.Addon.Webcam?
description: What is the difference between WebTwain.Addon.Camera and WebTwain.Addon.Webcam?
---

# Addon

## What is the difference between WebTwain.Addon.Camera and WebTwain.Addon.Webcam?

`WebTwain.Addon.Camera` supports mobile camera, whereas `WebTwain.Addon.Webcam` supports web cameras in mainstream desktop browsers.

Note that the Camera module requires a secure connection. The reason is that on mobile devices, the mobile camera is used for image capturing and only a secure site can make use of the camera. If you use this feature, you need to enable HTTPS on the server. For how to enable HTTPS, please check out the manual of your webserver.

For some advanced features, you may also need <a href="https://www.dynamsoft.com/web-twain/docs/getstarted/platform.html?ver=latest#wasm-browsers" target="_blank">WASM browser</a>.

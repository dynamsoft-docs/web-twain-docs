---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What are the differences between TWAIN and WIA?
keywords: Dynamic Web TWAIN, Capture/ Image Source, twain, wia, difference
breadcrumbText: What are the differences between TWAIN and WIA?
description: What are the differences between TWAIN and WIA?
date: 2021-07-14 18:55:57 +0800
---

# Capture/Image Source

## What are the differences between TWAIN and WIA drivers?

TWAIN is the most widely used protocol for physical document scanners. Almost all scanners in the market come with a TWAIN driver and are supported by TWAIN applications like the Dynamic Web TWAIN SDK.

`WIA` stands for <a href="https://docs.microsoft.com/en-us/windows/win32/wia/-wia-startpage" target="_blank">Windows Image Acquisition</a>, which is a Microsoft driver model for capturing digital images from various devices, such as scanners, cameras and other imaging devices. The WIA protocol is built-in and supported by Windows OS, so no extra driver installation is required. WIA offers standardized hardware compatibility and a stable driver environment, making it easier to integrate imaging capabilities into web scanning applications. 

Prior to Dynamic Web TWAIN version 18.2, WIA drivers are not officially supported. But `WIA` devices can be used by `TWAIN` applications like `Dynamic Web TWAIN` through a `TWAIN compatibility layer`. This means `WIA` is not supported natively; therefore, when a device supports both `TWAIN` and `WIA`, `TWAIN` is the better option.

As of Dynamic Web TWAIN version 18.2, we officially support WIA 2.0 drivers. To make sure your web application works with WIA scanner drivers, please refer to the article: [How do I support WIA scanner drivers in my application?](/_articles/faq/support-wia-scanner-drivers.md){:target="_blank"}




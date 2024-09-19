---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I hide the Dynamsoft image viewer and use my own image viewer?
keywords: Dynamic Web TWAIN, Image Viewer, hide, use custom image viewer
breadcrumbText: Can I hide the Dynamsoft image viewer and use my own image viewer?
description: Can I hide the Dynamsoft image viewer and use my own image viewer?
permalink: /faq/hide-image-viewer.html
---

# Image Viewer

## Can I hide the Dynamsoft image viewer and use my own image viewer?

If you want to use your own viewer, you can use [`Dynamsoft.DWT.CreateDWTObjectEx()`]({{site.extended-usage}}advanced-initialization.html#creating-headless-webtwain-instances) to create a `WebTwain` instance that does not come with a viewer. You can also unbind and destroy the viewer of an existing `WebTwain` instance with the [`unbind()`]({{site.api}}WebTwain_Viewer.html#unbind) API.
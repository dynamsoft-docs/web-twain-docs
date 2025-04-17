---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I hide the Dynamsoft image viewer and use my own image viewer?
keywords: Dynamic Web TWAIN, Image Viewer, hide, use custom image viewer
breadcrumbText: Can I hide the Dynamsoft image viewer and use my own image viewer?
description: Can I hide the Dynamsoft image viewer and use my own image viewer?
---

# Image Viewer

## Can I hide the Dynamsoft image viewer and use my own image viewer?

If you want to use your own viewer, you can use [`Dynamsoft.DWT.CreateDWTObjectEx()`](/_articles/extended-usage/advanced-initialization.md#creating-headless-webtwain-instances) to create a `WebTwain` instance that does not come with a viewer. You can also unbind and destroy the viewer of an existing `WebTwain` instance with the [`unbind()`](/_articles/info/api/WebTwain_Viewer.md#unbind) API.

<div class="blockquote-important"></div>
> Prior to using CreateDWTObjectEx(), please disable the [AutoLoad](/_articles/info/api/Dynamsoft_WebTwainEnv.md#autoload) feature. Additionally, avoid calling any [Load](/_articles/info/api/Dynamsoft_WebTwainEnv.md#load) methods either before or after using CreateDWTObjectEx(). This ensures proper functionality and prevents potential conflicts during the initialization.
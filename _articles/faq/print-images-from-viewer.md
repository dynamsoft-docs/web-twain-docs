---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I print images from the viewer?
keywords: Dynamic Web TWAIN, Image Viewer, print
breadcrumbText: Can I print images from the viewer?
description: Can I print images from the viewer?
date: 2021-12-09 11:34:50 +0000
last_modified: 2026-07-29 08:01:45 +0000
---

# Image Viewer

## Can I print images from the viewer?

Yes. Use the [PrintEx](/_articles/info/api/WebTwain_IO.md#printex){:target="_blank"} API and pass the indices of the images you want to print (for example, call `SelectAllImages()` and pass `SelectedImagesIndices` to print all images).

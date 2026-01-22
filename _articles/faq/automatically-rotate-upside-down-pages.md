---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can the Dynamic Web TWAIN SDK automatically rotate upside-down pages during the document scanning process?
keywords: Dynamic Web TWAIN, Capture/ Image Source, automatically rotate pages
breadcrumbText: Can the Dynamic Web TWAIN SDK automatically rotate upside-down pages during the document scanning process?
description: Can the Dynamic Web TWAIN SDK automatically rotate upside-down pages during the document scanning process?
date: 2021-12-08 03:01:32 +0800
last_modified: 2026-01-21 14:51:06 -08:00
---

# Capture/Image Source

## Can the Dynamic Web TWAIN SDK automatically rotate upside-down pages during the document scanning process?

Dynamic Web TWAIN does not auto-rotate pages by default, but you can rotate images in code using the API covered in [this example](/_articles/general-usage/image-processing/image-editing.md#example---rotating-images){:target="_blank"}.

If you have the OCR Add-on (v19.3+), you can call [`DetectPageOrientation()`](/_articles/info/api/Addon_OCR.md#detectpageorientation){:target="_blank"} to detect the page orientation from recognized text and use that result to decide how to rotate.

Some scanners also offer an AutoDeskew/AutoRotate capability that runs on the device. If your scanner supports it, enable that option (see [our de-skew guidance](/_articles/faq/support-image-deskew.md) for scanner-side setup); otherwise, use the rotation API noted above based on your own detection logic.

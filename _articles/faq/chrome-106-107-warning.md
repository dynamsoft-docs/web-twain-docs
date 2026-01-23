---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Warning message - Canvas2D Warning
keywords: Dynamic Web TWAIN, Error Troubleshooting, Canvas2D, Warning
breadcrumbText: Warning message - Canvas2D Warning
description: Canvas2D Warning
date: 2022-10-13 18:34:42 +0800
last_modified: 2026-01-21 14:54:50 -08:00
---

# Error Troubleshooting

## Warning message - Canvas2D: Multiple readback operations using getImageData are faster with the willReadFrequently attribute set to true.

> Archived: This warning was fixed in Dynamic Web TWAIN 18.0. The steps below are only for projects pinned to versions prior to 18.0.

### Symptom

When you are using Chrome 107(developer version) & 106 (official version) or any version above these, you could encounter a warning in console:

```shell
Canvas2D: Multiple readback operations using getImageData are faster with the willReadFrequently attribute set to true. See: https://html.spec.whatwg.org/multipage/canvas.html#concept-canvas-will-read-frequently
```

### Cause

Based on Google developer guide, the setting for attribute `willReadFrequently` in `getContext("2d")` has to be `true` if you are using Chrome 107(developer version) & 106 (official version) or higher, otherwise it will show this warning message.


### Solution

Step 1. Navigate to '<strong>../Resources/dynamsoft.webtwain.initiate.js</strong>' replace all `getContext("2d")` to `getContext("2d",{willReadFrequently:true})`


Step 2. Navigate to '<strong>../Resources/src/dynamsoft.viewer.js</strong>' replace all `getContext("2d")` to `getContext("2d",{willReadFrequently:true})`

### Status

Fixed in Dynamic Web TWAIN 18.0+. No action is needed on supported versions.

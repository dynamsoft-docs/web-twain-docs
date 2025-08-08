---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Sequence error
keywords: Dynamic Web TWAIN, Error Troubleshooting, sequence
breadcrumbText: Sequence error
description: Sequence error
date: 2021-12-03 23:26:46 +0800
last_modified: 2022-06-02 15:30:49 +0800
---

# Error Troubleshooting

## Sequence error

### Symptom

When you fail to acquire images from your scanner, you may get this error.

### Cause

This problem occurs when the correct order of operations is not followed for the TWAIN sequence.

### Resolution

Check if you followed the acquisition sequence to get images from your device. For example, some methods and properties, like the [PixelType](/_articles/info/api/WebTwain_Acquire.md#pixeltype) property, can only be used after calling the [OpenSource()](/_articles/info/api/WebTwain_Acquire.md#opensource) method. Please check the TWAIN State Transition Diagram below for more information

![TWAIN State Transition](/assets/imgs/TWAIN-State-Transition.png)

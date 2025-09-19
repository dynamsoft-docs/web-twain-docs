---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What is the difference between Camera.play and Camera.showVideo?
keywords: Dynamic Web TWAIN, Addon, webassembly, webcam capture
breadcrumbText: What is the difference between Camera.play and Camera.showVideo?
description: What is the difference between Camera.play and Camera.showVideo?
date: 2021-12-01 01:09:41 +0800
last_modified: 2025-09-19 10:12:03 +0800
---

# Addon

## What is the difference between Camera.play and Camera.showVideo?

> **The Camera Add-on has been removed since Dynamic Web TWAIN [18.1](_articles/info/schedule/deprecated.md#181).** An alternative replacement for this module is [Mobile Document Scanner](https://www.dynamsoft.com/use-cases/mobile-document-scanner/).

`Camera.showVideo` is a built-in feature to handle camera capturing, prospective adjusting, etc. It supports two available modes: document and picture.

`Camera.play` is a more specific API for starting streaming video from the current camera.

Note that these two APIs cannot be mixed with each other.

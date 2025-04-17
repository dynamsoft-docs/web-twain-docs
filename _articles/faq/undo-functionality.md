---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Is there an undo functionality?
keywords: Dynamic Web TWAIN, Image Editing, undo
breadcrumbText: Is there an undo functionality?
description: Is there an undo functionality?
---

# Image Editing

## Is there an undo functionality?

No, we don't have an undo functionality for editing an image because it may not be easy to achieve step-by-step undo with our SDK. However, we offer a restore changes functionality inside of an image editor before saving any changes that were made. But our advice would be to save the image/images first before editing, and then if you want to revert, you can simply load the previously saved version.

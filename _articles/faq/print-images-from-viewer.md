---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I print images from the viewer?
keywords: Dynamic Web TWAIN, Image Viewer, print
breadcrumbText: Can I print images from the viewer?
description: Can I print images from the viewer?
date: 2021-12-09 11:34:50 +0000
last_modified: 2026-07-29 05:33:17 +0000
---

# Image Viewer

## Can I print images from the viewer?

Yes, you can print the images from the viewer by exporting the image data in the buffer to a new browser window and use the browser's default feature to print images. This can be achieved by using the [PrintEx](/_articles/info/api/WebTwain_IO.md#printex){:target="_blank"} API, passing the indices of all the images in the buffer to print all of them, or just the selected ones to print a subset.
Note: [Print](/_articles/info/api/WebTwain_IO.md#print){:target="_blank"} is an older API that also prints all images on the viewer, but it has been deprecated as of release 19.3 in favor of `PrintEx`.

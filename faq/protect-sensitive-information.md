---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I protect sensitive information of an image from being seen?
keywords: Dynamic Web TWAIN, Image Viewer, object defined
breadcrumbText: Can I protect sensitive information of an image from being seen?
description: Can I protect sensitive information of an image from being seen?
permalink: /faq/protect-sensitive-information.html
---

# Image Viewer

## Can I protect sensitive information of an image from being seen?

If you need to modify an image by concealing certain areas permanently, you can use the <a href="{{site.info}}api/WebTwain_Edit.html#erase" target="_blank">erase()</a> method. This method is particularly useful when the requirement involves replacing a rectangular region within the image with a solid white block.

On the other hand, if you prefer a customizable and removable layer to temporarily conceal particular content, our newly developed Annotation feature is just what you need. For comprehensive details about this feature, please click on the following link: <a href="{{site.faq}}dwt-with-annotation.html">How can I add annotations to an image and then save/upload it?</a>
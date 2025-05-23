---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: When do I need PDF Rasterizer Addon? Can I load existing PDF files into the Dynamic Web TWAIN SDK without the PDF Rasterizer addon?
keywords: Dynamic Web TWAIN, Addon, pdf rasterizer
breadcrumbText: When do I need PDF Rasterizer Addon? Can I load existing PDF files into the Dynamic Web TWAIN SDK without the PDF Rasterizer addon?
description: When do I need PDF Rasterizer Addon? Can I load existing PDF files into the Dynamic Web TWAIN SDK without the PDF Rasterizer addon?
---

# Addon

## When do I need PDF Rasterizer Addon? Can I load existing PDF files into the Dynamic Web TWAIN SDK without the PDF Rasterizer addon?

Third-party generated PDF files may house multiple images, text, or annotations in a single PDF page. As these elements must be rendered within the Dynamic Web TWAIN, it will utilize the PDF rasterizer addon.

When importing a PDF file generated by Dynamic Web TWAIN, or if each page of a third-party PDF holds nothing but a single, unadulterated image, there's no need for the PDF rasterizer addon.

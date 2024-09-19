---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Dynamic Web TWAIN SDK Features - Exporting Images
keywords: Dynamic Web TWAIN, Documentation, upload, output, web, server, web server, server upload, export, binary export, download, local save, local, save to file, print
breadcrumbText: Exporting Images
description: Dynamic Web TWAIN SDK Image Export Documentation
permalink: /general-usage/image-export/index.html
redirect_from:
    - /indepth/features/output.html
---

# Exporting Images

> Prerequisite: [DWT Initialization]({{site.general-usage}}initialization.html)
> Prerequisite: [Managing the Image Buffer]({{site.general-usage}}image-processing/buffer-management.html)

DWT provides a variety of simple methods to export data both externally (uploading to the server) and locally (i.e. within the web application to expose to other web components). DWT provides built-in APIs to support uploading scanned (and otherwise imported) images to the server via both `HTTP` and `FTP`. Locally, DWT can save images to the end user's file system in a many supported file formats. Read on for explanations and examples.

## Table of Contents

- [Uploading to the Web Server]({{site.general-usage}}image-export/server-upload.html)
- [Exporting Locally]({{site.general-usage}}image-export/local-export.html)
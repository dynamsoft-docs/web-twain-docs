---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Document Scanning SDK | Dynamic Web TWAIN Documentation
keywords: Dynamic Web TWAIN, TWAIN, About, Documentation
breadcrumbText: Dynamic Web TWAIN Intro
description: Dynamic Web TWAIN SDK Documentation. This will help you integrate document scanning into your app, no matter whether you are building a workflow from scratch or optimizing an existing workflow.
---

# Introduction

**Dynamsoft Dynamic Web TWAIN** (DWT) is a software development kit (SDK) that enables users to scan documents from a **web environment** via APIs like TWAIN, WIA, ICA, SANE and eSCL. DWT handles the whole data flow, from image acquisition at the scanner, to displaying and editing scanned images in the browser, and finally uploading to the server. To see it in action, please visit its [online demo](https://demo.dynamsoft.com/web-twain/).

## Quick Start

* [Hello World](/_articles/hello-world/index.md) demo that demonstrates how to enable basic scanning, viewing, and uploading functionality in a web application.
* [General usage](/_articles/general-usage/index.md) and [extended usage](/_articles/extended-usage/index.md) guides for you to quickly start making use of both basic and advanced features of DWT.

## Key Features

1. Platform support: Broad compatibility with browsers, operating systems, and image sources
2. Image acquisition:
    - Connect to scanners from web browser with industry standard protocols
    - Communicate with scanners using a background service ([The Dynamic Web TWAIN Service](/_articles/faq/what-does-dynamsoft-service-do-on-end-user-machine.md)) with flexible configurations
3. Image upload:
    - Upload over HTTP, HTTPS (HTTP + TLS), and FTP
    - Optionally upload large files through background service
4. Document management:
    - Configurable document viewer for scanned images
    - Visual editor for reordering, marking up, cropping images, etc.
5. Secure data handling:
    - Encrypted data pipeline <!-- is data encrypted in in motion and at rest? -->
    - Cache sanitization even upon unexpected shutdown of SDK
6. PDF annotation with [Dynamsoft Document Viewer](https://www.dynamsoft.com/document-viewer/docs/introduction/index.html) ([demo](https://demo.dynamsoft.com/web-twain/annotate-scan))


## Add-Ons

DWT add-ons provide additional features:

* [Webcam add-on](/_articles/info/api/Addon_Webcam.md) to access cameras in the browser.
* [Barcode Reader add-on](/_articles/info/api/Addon_BarcodeReader.md) to read barcodes in documents.
* [PDF Rasterizer add-on](/_articles/info/api/Addon_PDF.md) to load external PDFs.
* [OCR add-on](/_articles/info/api/Addon_OCR.md) to extract text, correct document orientation and create searchable PDFs.

## Requirements

You can find supported systems, browsers, and hardware in the following pages:

* [System requirements](/_articles/introduction/system-requirements.md)
* [Hardware requirements](/_articles/introduction/imaging-hardware.md)

In addition, [local network access permission](https://www.dynamsoft.com/web-twain/docs/faq/chromium-142-local-network-access-issue.html) and [HTTPS](https://www.dynamsoft.com/web-twain/docs/faq/http-insecure-websites-in-chromium-browser.html) are also required by latest browsers.

## API Reference

See [API reference](/_articles/info/api/index.md) where you can find more comprehensive descriptions of our product.

## RESTful API

Dynamic Web TWAIN also provides [RESTful API](https://www.dynamsoft.com/web-twain/restfulapi/) to access scanners using various programming languages. You can check out the [samples](https://www.dynamsoft.com/web-twain/docs/extended-usage/restful-api.html) and [APIs](https://www.dynamsoft.com/web-twain/docs/info/api/restful.html) to learn more.

## Scan with Camera

If you need to scan documents using your camera, with features like automatic border detection and cropping, try our other product: [Mobile Document Scanner](https://www.dynamsoft.com/use-cases/mobile-document-scanner/).

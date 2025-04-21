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

**Dynamsoft Dynamic Web TWAIN** (DWT) is a software development kit (SDK) that enables users to scan and upload documents from a **web environment**. DWT handles the whole data flow, from image acquisition at the scanner, to displaying and editing scanned images in the browser, and finally uploading to the server.

Here we provide a series of usage guides, so that you can quickly start making use of both basic and advanced features of DWT with just a few lines of code - see our [general usage](/_articles/extended-usage/index.md) guides for more. You can also use our [Hello World](/_articles/hello-world/index.md) demo that demonstrates how to enable basic scanning, viewing, and uploading functionality in a web application.

DWT add-ons provide additional features such as scanning using a webcam video feed, document barcode reading, and PDF rasterization. <!-- You can learn more about add-ons and licensing [here](../add-ons/). -->

Starting in DWT version 19, we drastically improved DWT platform support with the addition of a suite of RESTful APIs, which brings DWT's powerful scanning functionalities to not just web clients, but to native desktop/mobile applications and background services in any language. Click here for [sample implementations of the Dynamic Web TWAIN RESTful API](/_articles/extended-usage/restful-api.md) as well as the full [RESTful API reference](/_articles/info/api/restful.md).

We also have an<!-- [knowledge base](../knowledge-base/) --> [API reference](/_articles/info/api/index.md) where you can find more comprehensive descriptions of our product.

## Key Features

1. Platform support:
    - Broad compatibility with browsers, operating systems, and image sources
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

## [System Requirements](/_articles/introduction/system-requirements.md)

DWT supports most major operating systems, browsers, and printers using standard drivers. Learn more about hardware requirements [here](/_articles/introduction/imaging-hardware.md). Other environments not officially listed may still support DWT, but Dynamsoft does not officially support these environments as they are not tested. If you have questions about unofficially supported environments, please contact our [support team](/_articles/about/getsupport.md) for more information.

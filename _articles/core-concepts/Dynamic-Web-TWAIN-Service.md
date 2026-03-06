---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN Core Concepts - Dynamic Web TWAIN Service
keywords: Dynamic Web TWAIN, Documentation, Plugin, Service, Concept
breadcrumbText: TWAIN
description: This page gives a general introduction to Dynamic Web TWAIN Service, which makes it possible to access imaging devices in the browser.
---

# Dynamic Web TWAIN Service

Dynamic Web TWAIN Service (previously known as Dynamsoft Service prior to version 19) is a local service installed on end-user devices to make it possible to access imaging devices in the browser. It also provides other functions like image processing, caching, barcode reading, OCR and system function calls.

![architecture](/assets/imgs/core-concepts//local-scan-architecture.svg)

To use Dynamic Web TWAIN in the browser, you have to install the service beforehand.

## Other Ways of Accessing Scanners in the Browser

Previously, technologies like ActiveX for Internet Explorer and NPAPI plugins for older versions of Chrome allowed scanner access directly in the browser. However, these technologies are now deprecated. Modern browsers lack built-in APIs for document scanning. While Chrome offers an experimental WebUSB API, it has limited functionality. Therefore, using a local service is currently the most viable solution.

## Related Articles

* [Setting up Dynamic Web TWAIN Service](/_articles/extended-usage/dynamsoft-service-configuration.md)
* [FAQs Related to Dynamic Web TWAIN Service](/_articles/faq/index.md#project-deployment-and-end-user-installation)
* [End-User Guide](/_articles/end-user/index.md)



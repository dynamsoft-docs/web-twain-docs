---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN Core Concepts - Dynamic Web TWAIN Service
keywords: Dynamic Web TWAIN, Documentation, Plugin, Service, Concept
breadcrumbText: TWAIN
description: This page gives a general introduction to Dynamic Web TWAIN Service, which makes it possible to access imaging devices in the browser.
---

# Dynamic Web TWAIN Service

Dynamic Web TWAIN Service (previously known as Dynamsoft Service before v19) is a local service installed on end user devices to make it possible to access imaging devices in the browser. It also provides other functions like image processing, cache, barcode reading, OCR and system functions calling, etc.

![architecture](/assets/imgs/core-concepts//local-scan-architecture.svg)

To use Dynamic Web TWAIN in the browser, you have to install the service beforehand.

## Other Ways of Accessing Scanners in the Browser

There are ActiveX for Internet Explorer and NPAPI Plugin for old versions of Chrome, which allow accessing scanners in the browser. But they are all deprecated. Modern browsers do not have APIs for document scanning. Chrome does provide a Web USB API, but it is still experimental and has limited functions. So currently, using a local service is the most viable option. 

## Related Articles

* [Setting up Dynamic Web TWAIN Service](/_articles/extended-usage/dynamsoft-service-configuration.md)
* [FAQs Related to Dynamic Web TWAIN Service](/_articles/faq/index.md#project-deployment-and-end-user-installation)
* [End-User Guide](/_articles/end-user/index.md)



---
layout: default-layout
needAutoGenerateSidebar: true
title: Using the RESTful API
keywords: Dynamic Web TWAIN, extended guide, advanced, RESTful API, REST, REST service, RESTful service, webtwain, Dynamic Web TWAIN Service, RESTful integration
breadcrumbText: RESTful API
description: RESTful API
---

# Using the RESTful API

By default, Dynamic Web TWAIN consists of the Dynamic Web TWAIN Service installed and running on a system, connected to a web application which integrates the Dynamic Web TWAIN SDK. To use DWT to access scanners on other platforms and using other programming languages, you can use the [DWT Service RESTful API](/_articles/info/api/restful.md). This allows desktop, mobile, and server-side applications to access the DWT Service installed on the scanner host (local or server) in a simple, stateless, and standardized manner.

The RESTful API simply returns scanned documents as streams of image files to the client, and **does not use the DWT Viewer**. This is because **the RESTful API functions entirely using the DWT Service**, and is viewer-agnostic. You may choose to feed the scanned images to any viewer, including a DWT Viewer in your application that you instantiate separately, if desired.

Here is a collection of tutorials on creating sample applications that use the DWT RESTful API in various platforms and languages.

- [.NET](https://github.com/Dynamsoft/Dynamic-Web-TWAIN-REST-dotnet)
- [Node.js](https://www.dynamsoft.com/codepool/rest-api-node-document-scanning.html)
- [Flutter](https://www.dynamsoft.com/codepool/flutter-twain-scanner-digitize-document.html)
- [Java](https://www.dynamsoft.com/codepool/java-twain-document-scanning.html)
- [Python](https://www.dynamsoft.com/codepool/python-twain-wia-sane-document-scanner.html)

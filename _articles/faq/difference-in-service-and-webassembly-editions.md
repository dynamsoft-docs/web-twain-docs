---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What's the difference between the Desktop Service Edition and WebAssembly Edition?
keywords: Dynamic Web TWAIN, Licensing and Purchase, difference, service, webassembly
breadcrumbText: What's the difference between the Desktop Service Edition and WebAssembly Edition?
description: What's the difference between the Desktop Service Edition and WebAssembly Edition?
---

# Licensing and Purchase

## What's the difference between the Desktop Service Edition and WebAssembly Edition?

Desktop Service Edition means Dynamic Web TWAIN operates through the <a href="/web-twain/docs/extended-usage/dynamsoft-service-configuration.html" target="_blank">Dynamsoft Service</a> which is a quiet, background system service that handles the communication between connected physical document scanners and the browser client.

WebAssembly Edition means Dynamic Web TWAIN operates completely within the browser with the help of Web Worker and WebAssembly. No additional installation is required for each end user.

In short, if you need to support document scanning from USB/network document scanners, you would need to use the Desktop Service edition. Otherwise, if you are looking to capture document from webcams or mobile cameras, you may use the WebAssembly edition.

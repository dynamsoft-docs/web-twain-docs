---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Uncaught ReferenceError - DVS is not defined
keywords: Dynamic Web TWAIN, Error Troubleshooting, DVS
breadcrumbText: Uncaught ReferenceError - DVS is not defined
description: Uncaught ReferenceError - DVS is not defined
permalink: /faq/DVS-is-not-defined.html
---

# Error Troubleshooting

## Uncaught ReferenceError - DVS is not defined

You may see this error if the Dynamic Web TWAIN resources are deployed in a custom manner. The error is thrown when one or more resources cannot be loaded when trying to load the Dynamic Web TWAIN environment.

Please make sure the path to Resources folder is defined correctly and that you can find `\*.viewer.js` under the `{ResourcesPath}/src` folder. If `viewer.js` does not exist in the target directory, please verify that the Dynamic Web TWAIN resources are deployed correctly and all files have been deployed.

Please refer to  <a href="{{site.indepth}}deployment/server.html" target="_blank">Dynamic Web TWAIN Deployment - Server Deployment</a> for more details on server deployment

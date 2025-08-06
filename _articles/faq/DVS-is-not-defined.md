---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Uncaught ReferenceError - DVS is not defined
keywords: Dynamic Web TWAIN, Error Troubleshooting, DVS
breadcrumbText: Uncaught ReferenceError - DVS is not defined
description: Uncaught ReferenceError - DVS is not defined
date: 2021-12-03 23:26:46 +0800
---

# Error Troubleshooting

## Uncaught ReferenceError - DVS is not defined

You may see this error if the Dynamic Web TWAIN resources are deployed in a custom manner. The error is thrown when one or more resources cannot be loaded when trying to load the Dynamic Web TWAIN environment.

Please make sure the path to Resources folder is defined correctly and that you can find `\*.viewer.js` under the `{ResourcesPath}/src` folder. If `viewer.js` does not exist in the target directory, please verify that the Dynamic Web TWAIN resources are deployed correctly and all files have been deployed.

Please refer to  [Dynamic Web TWAIN Deployment - Server Deployment](/_articles/general-usage/server-deployment.md){:target="_blank"} for more details on server deployment

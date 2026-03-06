---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN Core Concepts - Resource Files
keywords: Dynamic Web TWAIN, Documentation, Resource Files, Concept
breadcrumbText: TWAIN
description: This page gives a general introduction to Dynamic Web TWAIN's resource files.
---

# Resource Files

Resources files are the files your web application needs to use.

There are two formats of resources files.

Format 1 is for the traditional vanilla JavaScript development. You can find the files in the [SDK installer](https://www.dynamsoft.com/web-twain/downloads/) or official samples' zip files.

```
Resources
│  dynamsoft.webtwain.config.js
│  dynamsoft.webtwain.initiate.js
│  dynamsoft.webtwain.install.js
│  Readme.txt
│
├─addon
│      dynamsoft.upload.js
│      dynamsoft.webtwain.addon.barcodereader.js
│      dynamsoft.webtwain.addon.pdf.js
│      dynamsoft.webtwain.addon.webcam.js
│
├─dist
│      DynamicWebTWAINServiceSetup-arm64.deb
│      DynamicWebTWAINServiceSetup.deb
│      DynamicWebTWAINServiceSetup.msi
│      DynamicWebTWAINServiceSetup.pkg
│      DynamicWebTWAINServiceSetup.rpm
│      LICENSE
│
└─src
        dynamsoft.lts.js
        dynamsoft.webtwain.css
        dynamsoft.webtwain.viewer.css
        dynamsoft.webtwain.viewer.js
```

Format 2 is for usage with package managers and frameworks or CDN references. You can obtain the files via `npm install dwt`.

```
dwt
│  dwt-openapi.yaml
│  legal.txt
│  LICENSE.txt
│  package.json
│  README.md
│
└─dist
    │  dynamsoft.webtwain.min.js
    │  dynamsoft.webtwain.min.mjs
    │
    ├─dist
    │      DynamicWebTWAINServiceSetup-arm64.deb
    │      DynamicWebTWAINServiceSetup.deb
    │      DynamicWebTWAINServiceSetup.msi
    │      DynamicWebTWAINServiceSetup.pkg
    │      DynamicWebTWAINServiceSetup.rpm
    │      LICENSE
    │
    ├─src
    │      dynamsoft.lts.js
    │      dynamsoft.webtwain.css
    │      dynamsoft.webtwain.viewer.css
    │      dynamsoft.webtwain.viewer.js
    │
    └─types
            Addon.BarcodeReader.d.ts
            Addon.OCR.d.ts
            Addon.OCRKit.d.ts
            Addon.OCRPro.d.ts
            Addon.PDF.d.ts
            Addon.Webcam.d.ts
            Dynamsoft.d.ts
            Dynamsoft.Enum.d.ts
            Dynamsoft.FileUploader.d.ts
            index.d.ts
            RemoteScan.d.ts
            RemoteScan.Viewer.d.ts
            tsconfig.json
            tslint.json
            WebTwain.Acquire.d.ts
            WebTwain.Buffer.d.ts
            WebTwain.d.ts
            WebTwain.Edit.d.ts
            WebTwain.IO.d.ts
            WebTwain.Util.d.ts
            WebTwain.Viewer.d.ts
```

For more detailed information on these files, please refer to the following articles:

* [Loading Library Resources](/_articles/general-usage/resource-loading.md)
* [What are the Resources files? ](/_articles/faq/what-are-the-resources-files.md)


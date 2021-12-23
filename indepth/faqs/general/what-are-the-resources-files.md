---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What are the Resources files? 
keywords: Dynamic Web TWAIN, Documentation, General
breadcrumbText: What Are The Resources Files
description: What are the Resources files? 
---

# General

## What are the Resources files? 

Resources files help you include Dynamic Web TWAIN in your application. The following shows the purpose of these files.

> *Resources* is the default name of the folder that contain these files. It can be changed. For example, in the [Dynamic Web TWAIN package](https://github.com/dynamsoft-dwt/web-twain-package), it's called *dist*.

### Default files

* dynamsoft.webtwain.config.js

> This file is used to make basic configuration of the Dynamic Web TWAIN library. It's where you enter the product key for the product and to change the initial viewer size, etc.

* dynamsoft.webtwain.initiate.js

> This file is the core of the Dynamic Web TWAIN library. 

* dynamsoft.webtwain.install.js

> This file is used to configure the dialogs which are shown when the Dynamic Web TWAIN library is not installed or needs to be upgraded. This file is already referenced inside the dynamsoft.webtwain.initiate.js

* Readme.txt
* addon
  + dynamsoft.upload.js

  > This file contains the functionalities of the Dynamsoft Upload Module. 

  + dynamsoft.webtwain.addon.camera.js

  > This file contains the functionalities of the Camera addon. 

  + dynamsoft.webtwain.addon.ocr.js

  > This file contains the functionalities of the OCR Basic addon. It's not included by default, contact [Dynamsoft Support]({{site.about}}Getsupport.html) to get it.

  + dynamsoft.webtwain.addon.ocrpro.js

  > This file contains the functionalities of the OCR Professional addon. It's not included by default, contact [Dynamsoft Support]({{site.about}}Getsupport.html) to get it.

  + dynamsoft.webtwain.addon.pdf.js

  > This file contains the functionalities of the PDF Rasterizer addon. 

  + dynamsoft.webtwain.addon.webcam.js

  > This file contains the functionalities of the Webcam addon. 

  + dynamsoft.webtwain.addon.barcodereader.js

  > This file contains the functionalities of the Barcode addon. 

  + dbrjs

  > These files are meant for the barcode reader addon under [WASM mode]({{site.indepth}}initialize.html#wasm-mode).

    - dbr.js
    - dbr-7.4.0.1.full.wasm
    - dbr-7.4.0.1.full.wasm.js
    - dbr-7.4.0.1.worker.js
* dist

  > Under this directory are the installers for the Dynamsoft Service which needs to be manually installed on each client machine that uses the Dynamic Web TWAIN library as a service.

    - DynamsoftServiceSetup.deb

    > For Linux (Debian)

    - DynamsoftServiceSetup.rpm

    > For Linux (Redhat)

    - DynamsoftServiceSetup.msi

    > For Windows

    - DynamsoftServiceSetup.pkg

    > For macOS

    - LICENSE
  + src

  > These files contain the following functionalities for the [WASM-mode]({{site.indepth}}features/initialize.html#wasm-mode)
  > - image input & output
  > - decode & encode
  > - PDF read & write
  > - Viewer & UI

    - dynamsoft.imageio.js
    - dynamsoft.imageio_wasm-<version number>.js
    - dynamsoft.imagecore-<version number>.wasm
    - dynamsoft.imageio-<version number>.wasm
    - dynamsoft.imageProc-<version number>.wasm
    - dynamsoft.pdfReader-<version number>.wasm
    - dynamsoft.pdfWriter-<version number>.wasm
    - dynamsoft.viewer.css
    - dynamsoft.viewer.js
    - dynamsoft.webtwain.css

### Other Resources files

The following two files are present in the [Dynamic Web TWAIN package](https://github.com/dynamsoft-dwt/web-twain-package).

* dynamsoft.webtwain.min.js

> This is an all-in-one JavaScript file that consists of the files dynamsoft.webtwain.initiate.js , dynamsoft.webtwain.config.js , dynamsoft.webtwain.install.js as well as all the add-on JavaScript files. If you include this file in the application, you no longer need to include these constituent files separately.

* dynamsoft.webtwain.min.mjs

> This file is like dynamsoft.webtwain.min.js but is built by the ECMAScript 6 (ES6) standard. It's used by applications (Angular, React, Vue, etc.) that import the `Dynamic Web TWAIN` package as a module.

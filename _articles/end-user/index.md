---
layout: default-layout
needAutoGenerateSidebar: true
needGenerateH3Content: true
noTitleIndex: true
title: End-User Guide - Dynamic Web TWAIN SDK Documentation
keywords: Dynamic Web TWAIN, Documentation, End User
breadcrumbText: End-User Guide
description: This article will guide the end users of your web app to use Dynamic Web TWAIN for document scanning.
date: 2026-02-02 13:43:40 +0800
last_modified: 2026-02-02 13:43:40 +0800
---


# End-User Guide

This article aims at guiding you, an end-user of your company's web app, to scan documents using Dynamic Web TWAIN.

## Install Service

When you visit your company's web app and want to scan for the first time, you may be prompted to install Dynamic Web TWAIN if your IT does not have it installed. Please download the service installer and install it on your device. It is needed to communicate between the scanners and the web app.

Service Installation Dialog:

![service installation dialog](/assets/imgs/install-dialog.png)

If you still see the dialog after installation, try enabling [access to apps on your device](#allow-access-to-local-apps) and checking the [list of possible reasons](/_articles/faq/service-prompting-to-install-repeatedly.md).

## Allow Access to Local Apps

In latest browsers, you may need to grant access to apps on your device to make proper scanning.

When it is asking for permission, please click "Allow".

![permission dialog](/assets/imgs/end-user/permission-dialog.jpg)

If you accidentally block the access, you can reset it as shown in the following dialog.

![site settings](/assets/imgs/end-user/site-settings.jpg)<a id="site-settings"></a>

The UI may vary according to different browsers and browser versions. The following shows the different UIs. Edge, Chrome and other Chromium-based browsers have similar designs, so only Chrome is listed here.

Chrome 145+<a id="chrome145"></a>:

1. Permission asking dialog:

   ![permission dialog chrome 145](/assets/imgs/end-user/chrome-145-permission-dialog.jpg)
   
2. Site settings:

   ![site settings dialog chrome 145](/assets/imgs/end-user/chrome-145-permission-dialog.jpg)

Chrome 142-144<a id="chrome142"></a>:

1. Permission asking dialog:

   ![permission dialog](/assets/imgs/end-user/permission-dialog.jpg)
   
2. Site settings:

   ![site settings](/assets/imgs/end-user/site-settings.jpg)

FireFox Nightly<a id="firefox"></a>:

1. Permission asking dialog:

   ![site settings](/assets/imgs/end-user/firefox-permission-dialog.jpg)

2. Site settings:

   ![site settings](/assets/imgs/end-user/firefox-site-settings.jpg)


## Perform Scanning

Now, visit your app and try to scan documents. Here, we are using Dynamsoft's [online demo](https://demo.dynamsoft.com/web-twain/) for illustration.

![web demo](/assets/imgs/end-user/web-demo.jpg)

If it does not detect any scanners, make sure that you have installed the driver. You can find the driver from scanner manufacturer's support site.

Canon's Driver Download Site:

![canon driver](/assets/imgs/end-user/canon-driver-download-site.jpg)

## Others

If you do not have the permission to make the changes, please contact your IT for help.

More resources:

* [Configuring the Dynamic Web TWAIN Service](/_articles/extended-usage/dynamsoft-service-configuration.md)
* [What does the Dynamic Web TWAIN Service do on the end-user machine?](/_articles/faq/what-does-dynamsoft-service-do-on-end-user-machine.md)
* [I have installed the Dynamic Web TWAIN Service on an end-user machine but still got asked to install it repeatedly. Why?](/_articles/faq/service-prompting-to-install-repeatedly.md)
* [How to uninstall Dynamic Web TWAIN Service?](/_articles/faq/how-to-uninstall-dynamsoft-service.md)




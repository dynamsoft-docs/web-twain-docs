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

This article aims at guiding you, an end user of your company's web app, to scan documents using Dynamic Web TWAIN.

## Install Service

When you visit your company's web app and want to scan for the first time, you may be prompted to install Dynamic Web TWAIN if your IT does not have it installed. Please download the service installer and install it on your device. It is needed to communicate between the scanners and the web app.

Service Installation Dialog:

![service installation dialog](/assets/imgs/install-dialog.png)

If you still see the dialog after installation, try enabling [access to apps on your device](#allow-access-to-local-apps) and checking the [list of possible reasons](/_articles/faq/service-prompting-to-install-repeatedly.md).

## Allow Access to Local Apps

In latest browsers, you may need to grant access to apps on your device to make proper scanning.

When it is asking for permission, please click "**Allow**".

![permission dialog](/assets/imgs/end-user/chrome-142-permission-dialog.jpg){: id="permission-dialog"}

If you accidentally block the access, you can reset it as shown in the following dialog.

![site settings](/assets/imgs/end-user/chrome-142-site-settings.jpg){: id="site-settings"}

The UI may vary according to different browsers and browser versions. The following shows the different UIs.

<div class="multi-panel-switching-prefix"></div>

- Chrome 145+
- Chrome 142-144
- Edge 145+
- Edge 142-144
- FireFox

<div class="multi-panel-start"></div>

1. Permission asking dialog:

   ![permission dialog chrome 145](/assets/imgs/end-user/chrome-145-permission-dialog.jpg)
   
2. Site settings:

   ![site settings dialog chrome 145](/assets/imgs/end-user/chrome-145-site-settings.jpg)

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

1. Permission asking dialog:

   ![permission dialog](/assets/imgs/end-user/chrome-142-permission-dialog.jpg)
   
2. Site settings:

   ![site settings](/assets/imgs/end-user/chrome-142-site-settings.jpg)

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

1. Permission asking dialog:

   ![permission dialog](/assets/imgs/end-user/edge-145-permission-dialog.jpg)
   
2. Site settings:

   ![site settings](/assets/imgs/end-user/edge-145-site-settings.jpg)

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

1. Permission asking dialog:

   ![permission dialog](/assets/imgs/end-user/edge-142-permission-dialog.jpg)
   
2. Site settings:

   ![site settings](/assets/imgs/end-user/edge-142-site-settings.jpg)

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

1. Permission asking dialog:

   ![permission dialog](/assets/imgs/end-user/firefox-permission-dialog.jpg)

2. Site settings:

   ![site settings](/assets/imgs/end-user/firefox-site-settings.jpg)

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>


## Perform Scanning

Now, visit your app and try to scan documents. Here, we are using Dynamsoft's [online demo](https://demo.dynamsoft.com/web-twain/) for illustration.

![web demo](/assets/imgs/end-user/web-demo.jpg)

If it does not detect any scanners, make sure that you have installed the driver. You can find the driver from the scanner manufacturer's support site.

Canon's Driver Download Site (e.g.):

![canon driver](/assets/imgs/end-user/canon-driver-download-site.jpg)

## Others

If you do not have the permission to make the changes, please contact your IT for help.

More resources:

* [Configuring the Dynamic Web TWAIN Service](/_articles/extended-usage/dynamsoft-service-configuration.md)
* [What does the Dynamic Web TWAIN Service do on the end-user machine?](/_articles/faq/what-does-dynamsoft-service-do-on-end-user-machine.md)
* [I have installed the Dynamic Web TWAIN Service on an end-user machine but still got asked to install it repeatedly. Why?](/_articles/faq/service-prompting-to-install-repeatedly.md)
* [How to uninstall Dynamic Web TWAIN Service?](/_articles/faq/how-to-uninstall-dynamsoft-service.md)


<script>
function updateImageBasedOnBrowser(){
    const urlParams = new URLSearchParams(window.location.search);
    const browser = urlParams.get("browser");
    const browserVersion = urlParams.get("browserversion");
    const permissionDialog = document.getElementById('permission-dialog');
    const siteSettingsDialog = document.getElementById("site-settings");
    if (urlParams) {
      if (browser === "chrome") {
        if (browserVersion >= 145) {
          permissionDialog.src = "/web-twain/docs/assets/imgs/end-user/chrome-145-permission-dialog.jpg";
          siteSettingsDialog.src = "/web-twain/docs/assets/imgs/end-user/chrome-145-site-settings.jpg";
        }else{
          permissionDialog.src = "/web-twain/docs/assets/imgs/end-user/chrome-142-permission-dialog.jpg";
          siteSettingsDialog.src = "/web-twain/docs/assets/imgs/end-user/chrome-142-site-settings.jpg";
        }
      }else if (browser === "firefox") {
          permissionDialog.src = "/web-twain/docs/assets/imgs/end-user/firefox-permission-dialog.jpg";
          siteSettingsDialog.src = "/web-twain/docs/assets/imgs/end-user/firefox-site-settings.jpg";
      }else if (browser === "edge" ) {
        if (browserVersion >= 145) {
          permissionDialog.src = "/web-twain/docs/assets/imgs/end-user/edge-145-permission-dialog.jpg";
          siteSettingsDialog.src = "/web-twain/docs/assets/imgs/end-user/edge-145-site-settings.jpg";
        }else{
          permissionDialog.src = "/web-twain/docs/assets/imgs/end-user/edge-142-permission-dialog.jpg";
          siteSettingsDialog.src = "/web-twain/docs/assets/imgs/end-user/edge-142-site-settings.jpg";
        }
      }
    }
}
updateImageBasedOnBrowser();
</script>

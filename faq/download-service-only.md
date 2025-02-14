---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Where can I download the Dynamsoft Service installers only?
keywords: Dynamic Web TWAIN, Installation, Dynamsoft Service, installer
breadcrumbText: Where can I download the Dynamsoft Service installers only?
description: Where can I download the Dynamsoft Service installers only?
permalink: /faq/download-service-only.html
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# Where can I download the Dynamsoft Service installers only?

Typically, we recommend that developers retrieve the Dynamsoft Service Installers from the downloaded SDK package. This approach guarantees that the version of the Dynamsoft Service installed by the user aligns with the current version of the SDK libraries. 

Let's use Windows as an illustration. After installing the SDK package, you can locate all the Dynamsoft Service installers for various operating systems in the directory "C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN SDK 18.5.1\Resources\dist".[[Download the SDK](https://www.dynamsoft.com/web-twain/downloads/)]

However, considering that more and more enterprise users are using the Dynamic Web TWAIN SDK, it would be a hassle for end users to obtain the Dynamsoft Service installer by downloading the SDK if they are unable to acquire the installers from the developer for some reasons. Therefore, you can use the following strategy to download the desired Service installers.

**Step 1:**
Visit the CDN site: [https://www.unpkg.com/browse/dwt/dist/dist/](https://www.unpkg.com/browse/dwt/dist/dist/).

**Step 2:**
For Windows users, please choose ".msi" installer
For Mac users, please choose ".pkg" installer
For Linux users, please choose ".rpm" or ".deb" installer accordingly

![download_installer]({{site.assets}}imgs/download_msi_from_cdn.png)

**Step 3:**
Click on the "View Raw" button, it will start to download the installer.
![download_raw]({{site.assets}}imgs/download_view_raw.png)

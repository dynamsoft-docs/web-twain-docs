---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What resources of the SDK should be included in my web application?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, resources
breadcrumbText: What resources of the SDK should be included in my web application?
description: What resources of the SDK should be included in my web application?
date: 2021-12-11 06:47:21 +0800
last_modified: 2022-10-14 14:05:08 +0800
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# What resources of the SDK should be included in my web application?

You can include all the files under the Resources folder, but not all are required.

Under the `\addon` folder, you do not need the files for add-ons which are not used by your web application.

Under the `\dist` folder, you can include the installers required per your OS requirements.

Under the `\src` folder, you do not need the wasm files if you are not using camera functionalities.

For more information, please check [Loading the Resource Files](/_articles/general-usage/initialization.md#loading-the-core-js-files){:target="_blank"}.

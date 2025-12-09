---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Are admin privileges required to install the end-user component?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, admin privileges, install
breadcrumbText: Are admin privileges required to install the end-user component?
description: Are admin privileges required to install the end-user component?
date: 2025-01-15 14:58:40 +0800
last_modified: 2025-01-15 14:58:40 +0800
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# Are admin privileges required to install the end-user component?

<div class="multi-panel-switching-prefix"></div>

- [v19.0+](#19plus)
- [Versions below 19.0](#19min)

<div class="multi-panel-start"></div>

Yes, the Dynamic Web TWAIN Service installer is a `.msi` file which requires administrator privileges to install as the install target is `C:\Program Files (x86)`. Once the Dynamic Web TWAIN Service is installed with admin privileges, every user on that machine can has access to the Dynamic Web TWAIN Service. 

If your organization does not allow end users to have admin privileges, you can contact [Dynamsoft Support](/_articles/about/getsupport.md) to get a special "User Installer" that does not require admin privileges.

The "User Installer", will install to the user's `C:\Users\{UserName}\AppData\Roaming\` folder. Please be aware that only one user per machine is able to have the service installed via this method. The service cannot be installed to multiple user profiles, and only the user that installs the Services in this manner will have access to the Dynamic Web TWAIN Service.

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

Yes, the Dynamsoft Service installer is a `.msi` file which requires administrator privileges to install as the install target is `C:\Windows\SysWOW64\`. Once the Dynamsoft Service is installed with admin privileges, every user on that machine can has access to the Dynamsoft Service. 

If your organization does not allow end users to have admin privileges, you can contact [Dynamsoft Support](/_articles/about/getsupport.md) to get a special "User Installer" that does not require admin privileges.

The "User Installer", will install to the user's `C:\Users\{UserName}\AppData\Roaming\` folder. Please be aware that only one user per machine is able to have the service installed via this method. The service cannot be installed to multiple user profiles, and only the user that installs the Services in this manner will have access to the Dynamsoft Service.

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>
---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Are admin privileges required to install the end-user component?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, admin privileges, install
breadcrumbText: Are admin privileges required to install the end-user component?
description: Are admin privileges required to install the end-user component?
date: 2025-01-15 14:58:40 +0000
last_modified: 2026-08-19 05:32:50 +0000
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# Are admin privileges required to install the end-user component?

<div class="multi-panel-switching-prefix"></div>

- [v19.0+](#19plus)
- [Versions below 19.0](#19min)

<div class="multi-panel-start"></div>

Yes, the Dynamic Web TWAIN Service installer is a `.msi` file which requires administrator privileges to install as the install target is `C:\Program Files (x86)`. Once the Dynamic Web TWAIN Service is installed with admin privileges, every user on that machine has access to the Dynamic Web TWAIN Service.

If your organization does not allow end users to have administrator privileges, you can use the **User Installer** instead, which does not require administrator privileges and installs to the user's `C:\Users\{UserName}\AppData\Roaming\` folder.

To get the User Installer:

1. Go to the [Dynamic Web TWAIN releases page](https://github.com/Dynamsoft/Dynamic-Web-TWAIN/releases) on GitHub.
2. Find the release matching your SDK major version. We recommend using the latest minor/patch version within that major version.
3. In the **Assets** section, download `DynamicWebTWAINServiceUserSetup.msi`.

> [!NOTE]
> User Installers are backwards compatible within the same major version. For example, if your project uses Dynamic Web TWAIN v19.0-19.3, you can also use the User Installer from v19.4. Using the latest User Installer available within your major version is recommended, as it includes the latest fixes and improvements.
>
> Known issue: for v19.0-19.3, only one user per machine can have the service installed via the User Installer - the service cannot be installed to multiple user profiles, and only the user who installed it will have access. This is fixed as of v19.4, so if your project targets v19.0-19.3, installing the [latest User Installer](https://github.com/Dynamsoft/Dynamic-Web-TWAIN/releases) from v19.4 or later is recommended.

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

Yes, the Dynamsoft Service installer is a `.msi` file which requires administrator privileges to install as the install target is `C:\Windows\SysWOW64\`. Once the Dynamsoft Service is installed with admin privileges, every user on that machine has access to the Dynamsoft Service.

If your organization does not allow end users to have administrator privileges, please contact [Dynamsoft Support](https://www.dynamsoft.com/contact/) for assistance obtaining a User Installer for your version.

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>
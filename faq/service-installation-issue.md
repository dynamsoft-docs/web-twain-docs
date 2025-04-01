---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN Service installation and uninstallation issue
keywords: Dynamic Web TWAIN, Dynamic Web TWAIN Service, installation, uninstallation
breadcrumbText: Dynamic Web TWAIN Service installation and uninstallation issue
description: Dynamic Web TWAIN Service installation and uninstallation issue
permalink: /faq/service-installation-issue.html
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# Dynamic Web TWAIN Service installation and uninstallation issue


### Symptom

The old version of Dynamic Web TWAIN Service (also called "Dynamsoft Service") cannot be uninstalled successfully through the Control Panel, and the new version of Dynamic Web TWAIN Service cannot be successfully installed by double-clicking, or the following error message appears during installation.

![service installation-1]({{site.assets}}imgs/service-installation-1.png)

### Cause

The current user account does not match the user account under C:\Users\{account}

In the screenshot below, the current user is owen_thinkpad_t480s, but in 'Command Prompt', the corresponding folder under the C:\Users is ThinkPad.

![service installation-2]({{site.assets}}imgs/service-installation-2.png)

When installing by double-clicking DynamsoftServiceSetup.msi (from v19.0+, use DynamicWebTWAINServiceSetup.msi) or uninstalling via Control Panel, Dynamic Web TWAIN takes the current user's Temp directory:
C:\Users\owen_thinkpad_t480s\AppData\Local\Temp, because this path can't be found, the installation/uninstallation failed.

### Resolution

Run 'Command Prompt' as administrator, go to C:\WINDOWS\system32, then execute the following line to uninstall it:

``` shell
wmic product where name="Dynamsoft Service" call uninstall /nointeractive

//from v19.0+
wmic product where name="Dynamic Web TWAIN Service" call uninstall /nointeractive
```

![How-to-uninstall-the-Dynamsoft-Service-without MSI-installer.png]({{site.assets}}imgs/How-to-uninstall-the-Dynamsoft-Service-without MSI-installer.png)

and then run the following command to install Dynamic Web TWAIN Service.

``` shell
msiexec  /i  "/path/to/DynamsoftServiceSetup.msi"   /qn

//from v19.0+
msiexec  /i  "/path/to/DynamicWebTWAINServiceSetup.msi"   /qn
```

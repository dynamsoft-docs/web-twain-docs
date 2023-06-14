---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Dynamsoft Service installation and uninstallation issue
keywords: Dynamic Web TWAIN, Dynamsoft Service, installation, uninstallation
breadcrumbText: Dynamsoft Service installation and uninstallation issue
description: Dynamsoft Service installation and uninstallation issue
permalink: /faq/service-installation-issue.html
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# Dynamsoft Service installation and uninstallation issue


### Symptom

The old version of Dynamsoft Service cannot be uninstalled successfully through the Control Panel, and the new version of Dynamsoft Service cannot be successfully installed by double-clicking, or the following error message appears during installation.

![service installation-1]({{site.assets}}imgs/service-installation-1.png)

### Cause

The current user account does not match the user account under C:\Users\{account}

In the screenshot below, the current user is owen_thinkpad_t480s, but in 'Command Prompt', the corresponding folder under the C:\Users is ThinkPad.

![service installation-2]({{site.assets}}imgs/service-installation-2.png)

When installing by double-clicking DynamsoftServiceSetup.msi or uninstalling via Control Panel, Dynamic Web TWAIN takes the current user's Temp directory:
C:\Users\owen_thinkpad_t480s\AppData\Local\Temp, because this path can't be found, the installation/uninstallation failed.

### Resolution

Run 'Command Prompt' as administrator, go to C:\WINDOWS\system32, then execute the following line to uninstall it:

``` shell
wmic product where name="Dynamsoft Service" call uninstall /nointeractive
```

![How-to-uninstall-the-Dynamsoft-Service-without MSI-installer.png]({{site.assets}}imgs/How-to-uninstall-the-Dynamsoft-Service-without MSI-installer.png)

and then run the following command to install Dynamosft Service.

``` shell
msiexec  /i  "/path/to/DynamsoftServiceSetup.msi"   /qn
```

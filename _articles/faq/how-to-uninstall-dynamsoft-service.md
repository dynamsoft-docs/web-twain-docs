---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How to uninstall Dynamic Web TWAIN Service?
keywords: Dynamic Web TWAIN, Dynamic Web TWAIN Service, uninstall, silently
breadcrumbText: How to uninstall Dynamic Web TWAIN Service?
description: How to uninstall Dynamic Web TWAIN Service?
date: 2021-07-14 18:58:25 +0800
last_modified: 2022-10-14 14:05:08 +0800
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# How to uninstall Dynamic Web TWAIN Service?

<div class="multi-panel-switching-prefix"></div>

- [v19.0+](#19plus)
- [Versions below 19.0](#19min)

<div class="multi-panel-start"></div>

### On Windows

1. 
* Remove Dynamic Web TWAIN Service through Control Panel, if you see anything named along the lines of "Dynamsoft " or "Dynamic Web TWAIN ", remove them as well
* Remove the folder `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}`

2. 
Run 'Command Prompt' as **administrator**, go to C:\WINDOWS\system32, then execute the following line (Not applicable if you installed Dynamic Web TWAIN Service through personal installer):

``` shell
wmic product where name="Dynamic Web TWAIN Service" call uninstall /nointeractive
```

### On macOS

* Run the file `Uninstall.pkg` . The file can be found in `Go > Applications > Dynamsoft > Dynamic Web TWAIN Service {version number}`
* Remove the folder `Go > Applications > Dynamsoft > Dynamic Web TWAIN Service {version number}`

### On Linux

* Run the file `uninstall.sh` . The file can be found in `opt/dynamsoft/Dynamic Web TWAIN Service {version number}`
* Remove the folder `opt/dynamsoft/Dynamic Web TWAIN Service {version number}`

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

### On Windows

1. 
* Remove Dynamsoft Service through Control Panel, if you see anything named along the lines of "Dynamsoft " or "Dynamic Web TWAIN ", remove them as well
* Remove the folders `C:\Windows\SysWOW64\Dynamsoft\DynamsoftService` and `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{version number}`

2. 
Run 'Command Prompt' as **administrator**, go to C:\WINDOWS\system32, then execute the following line (Not applicable if you installed Dynamsoft Service through personal installer):

``` shell
wmic product where name="Dynamsoft Service" call uninstall /nointeractive
```

![How-to-uninstall-the-Dynamsoft-Service-without MSI-installer.png](/assets/imgs/How-to-uninstall-the-Dynamsoft-Service-without MSI-installer.png)

### On macOS

* Run the file `Uninstall.pkg` . The file can be found in `Go > Applications > Dynamsoft > DynamsoftService > {installed version No.}`
* Remove the folder `Go > Applications > Dynamsoft > DynamsoftService > {installed version No.}`

### On Linux

* Run the file `uninstall.sh` . The file can be found in `opt/dynamsoft/DynamsoftService`
* Remove the folder `opt/dynamsoft/DynamsoftService`

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>
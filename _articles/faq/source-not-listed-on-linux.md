---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Scanner source is listed on XSane application but not on my web application on Linux machines
keywords: Dynamic Web TWAIN, Dynamic Web TWAIN Service, installation, uninstallation
breadcrumbText: Scanner source is listed on XSane application but not on my web application on Linux machines
description: Scanner source is listed on XSane application but not on my web application on Linux machines
date: 2022-04-14 02:51:15 +0800
last_modified: 2022-10-21 14:05:54 +0800
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# Scanner source is listed on XSane application but not on my web application on Linux machines


### Symptom

On Linux machines, the scanner can be accessed using the XSane application and it can successfully scan. But the scanner does not show on the web application integrated with Dynamic Web TWAIN even after the Dynamic Web TWAIN Service (also called "Dynamsoft Service") is installed.

### Cause

Dynamic Web TWAIN Service is not installed correctly.

### Resolution

<div class="multi-panel-switching-prefix"></div>

- [v19.0+](#19plus)
- [Versions below 19.0](#19min)

<div class="multi-panel-start"></div>

Please follow the steps below to reinstall Dynamic Web TWAIN Service:

1. Run the following commands
``` shell
su
usermod -aG wheel XXX ps:XXX is current username
```

2. Restart the terminal under current user

3. Run the following command
``` shell
sudo rpm -i DynamicWebTWAINServiceSetup.rpm
OR
sudo dpkg -i DynamicWebTWAINServiceSetup.deb
```

If the above does not resolve the issue, please follow the troubleshooting steps below.

1. Run the command below and check whether the process (DynamsoftScanningMgr) has started.
``` shell
ps aux | grep dynamsoft
```
2. Does the below command list out the source?
``` shell
bash /opt/dynamsoft/DynamicWebTWAINService/DynamsoftScanning list
```
3. Please check the logs here: /var/log/syslog

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

Please follow the steps below to reinstall Dynamsoft Service:

1. Run the following commands
``` shell
su
usermod -aG wheel XXX ps:XXX is current username
```

2. Restart the terminal under current user

3. Run the following command
``` shell
sudo rpm -i DynamsoftServiceSetup.rpm
OR
sudo dpkg -i DynamsoftServiceSetup.deb
```

If the above does not resolve the issue, please follow the troubleshooting steps below.

1. Run the command below and check whether the process (DynamsoftScanningMgr) has started.
``` shell
ps aux | grep dynamsoft
```
2. Does the below command list out the source?
``` shell
bash /opt/dynamsoft/DynamsoftService/DynamsoftScanning list
```
3. Please check the logs here: /var/log/syslog

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>

For further support, please email support@dynamsoft.com and include any screenshots and logs collected.

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I use Dynamic Web TWAIN SDK in a Citrix environment?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, citrix
breadcrumbText: How can I use Dynamic Web TWAIN in a Citrix environment?
description: How can I use Dynamic Web TWAIN in a Citrix environment?
date: 2021-12-14 00:10:42 +0800
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# How can I use Dynamic Web TWAIN in a Citrix environment?

If too many end-users access the same scanning application using the same communication port, it can slow down server response and increase wait time.

To optimize user experience within the Citrix environment, Dynamsoft offers **enhanced mode** which distributes end-users among different ports. For more information, please check here: <a href="https://www.dynamsoft.com/blog/insights/document-scanning-within-citrix/" target="_blank">Optimized Document Scanning Within Citrix Remote Desktop</a>

**Note**: enabling enhanced mode requires license key modifications. Please contact our [support team](/_articles/about/getsupport.md) to use enhanced mode functionalities.

To configure the enhanced mode, please follow the steps below:

<div class="multi-panel-switching-prefix"></div>

- [v19.0+](#19plus)
- [Versions below 19.0](#19min)

<div class="multi-panel-start"></div>

1. Stop Dynamic Web TWAIN Service
2. Set EnableEnhancedMode=TRUE in DSConfiguration.ini which is under `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}`
3. Set Dynamsoft.DWT.IfCheckDCP=true in dynamsoft.webtwain.config.js 
4. Restart Dynamic Web TWAIN Service

***In this case, initializing the DWT object dynamically is not supported.***

<strong>How to check if Enhanced mode is running</strong>

1. user_config.ini which is under `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}` will list the ports that each user is listening on.
2. In Network, the DWT port included in the request URL should be 17000 and so on, not 18622 anymore

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

1. Stop Dynamsoft Service
2. Set EnableEnhancedMode=TRUE in DSConfiguration.ini which is under `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{version number}`
3. Set Dynamsoft.DWT.IfCheckDCP=true in dynamsoft.webtwain.config.js 
4. Restart Dynamsoft Service

***In this case, initializing the DWT object dynamically is not supported.***

<strong>How to check if Enhanced mode is running</strong>

1. user_config.ini which is under `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{version number}` will list the ports that each user is listening on.
2. In Network, the DWT port included in the request URL should be 17000 and so on, not 18622 anymore

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>
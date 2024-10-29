---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I use Dynamic Web TWAIN SDK in a Citrix environment?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, citrix
breadcrumbText: How can I use Dynamic Web TWAIN in a Citrix environment?
description: How can I use Dynamic Web TWAIN in a Citrix environment?
permalink: /faq/use-dwt-in-citrix-env.html
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# How can I use Dynamic Web TWAIN in a Citrix environment?

If too many end-users access the same scanning application using the same communication port, it can slow down server response and increase wait time.

To optimize user experience within the Citrix environment, Dynamsoft offers **enhanced mode** which distributes end-users among different ports. For more information, please check here: <a href="https://www.dynamsoft.com/blog/insights/document-scanning-within-citrix/" target="_blank">Optimized Document Scanning Within Citrix Remote Desktop</a>

**Note**: enabling enhanced mode requires license key modifications. Please contact our [support team]({{site.about}}getsupport.html) to use enhanced mode functionalities.

To configure the enhanced mode, please follow the steps below:

1. Stop Dynamsoft Service
2. Set EnableEnhancedMode=TRUE in DSConfiguration.ini which is under `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_17`
3. Set Dynamsoft.DWT.IfCheckDCP=true in dynamsoft.webtwain.config.js 
4. Restart Dynamsoft Service

***In this case, initializing the DWT object dynamically is not supported.***

<strong>How to check if Enhanced mode is running</strong>

1. user_config.ini which is under `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_17` will list the ports that each user is listening on.
2. In Network, the DWT port included in the request URL should be 17000 and so on, not 18622 anymore

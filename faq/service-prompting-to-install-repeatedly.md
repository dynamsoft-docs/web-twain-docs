---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: I have installed the Dynamsoft Service on an end-user machine but still got asked to install it repeatedly. Why?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, install, repeatedly
breadcrumbText: I have installed the Dynamsoft Service on an end-user machine but still got asked to install it repeatedly. Why?
description: I have installed the Dynamsoft Service on an end-user machine but still got asked to install it repeatedly. Why?
---

# Project Deployment and End-user Installation

## I have installed the Dynamsoft Service on an end-user machine but still got asked to install it repeatedly. Why?

#### There are a few possible causes

1. The Dynamsoft Service is not installed properly.

2. The Dynamsoft Service is installed correctly but not started.

3. The requests sent to the Service are redirected because you are using a proxy server on IE.

4. The service's listening ports are blocked by another software, like anti-virus software.

5. The service is blocked by plugins you have installed in the browser. (e.g. NoScript)

6. If you are accessing an HTTPS site on a Linux machine.

7. If you are visiting a public HTTP website with Dynamic Web TWAIN SDK integrated via Chrome v94+ (or any Chromium v94+ based browsers)

#### The respective fixes are listed below

1. Check the path `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_17` or `C:\Users\{UserName}\AppData\Roaming\Dynamsoft\DynamsoftService` and make sure you have <a href="{{site.indepth}}deployment/service.html#related-files-and-folders" target="_blank">the correct files</a>.

2. Check `Local Services` and make sure Dynamsoft Service is listed and Running.

3. On IE, go to `Internet Options` --> `Security` tab, select `Local Intranet`, then click `Sites`, uncheck 'Include all sites that bypass the proxy server'
   ![why-is-the-browser-prompting-me-to-install-dynamsoft-service-repeatedly-1]({{site.assets}}imgs/why-is-the-browser-prompting-me-to-install-dynamsoft-service-repeatedly-1.png)
   ![why-is-the-browser-prompting-me-to-install-dynamsoft-service-repeatedly-2]({{site.assets}}imgs/why-is-the-browser-prompting-me-to-install-dynamsoft-service-repeatedly-2.png)

4. Check your anti-virus software or any other software that can block local ports and make sure the ports 18622, 18623, 18625 and 18626 are not blocked.

5. Disable all the plugins in the browser, refresh and try again.

6. On your Linux client machine, visit https://127.0.0.1:18626 and https://127.0.0.1:18623 separately in Chrome and FireFox, manually add both certificates to the exception lists.

7. See the solution <a href="https://www.dynamsoft.com/web-twain/docs/faq/http-insecure-websites-in-chromium-browser.html?ver=latest" target="_blank">here</a>

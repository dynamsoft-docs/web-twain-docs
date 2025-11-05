---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: I have installed the Dynamic Web TWAIN Service on an end-user machine but still got asked to install it repeatedly. Why?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, install, repeatedly
breadcrumbText: I have installed the Dynamic Web TWAIN Service on an end-user machine but still got asked to install it repeatedly. Why?
description: I have installed the Dynamic Web TWAIN Service on an end-user machine but still got asked to install it repeatedly. Why?
date: 2021-12-11 06:47:21 +0800
last_modified: 2025-11-04 13:39:41 +0800
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# I have installed the Dynamic Web TWAIN Service on an end-user machine but still got asked to install it repeatedly. Why?

#### There are a few possible causes

> [!NOTE]
> "Local network access permission is not granted" is a **newly developing issue**

1. The local network access permission is not granted (required starting Chromium 142).

2. The Dynamic Web TWAIN Service (previously called "Dynamsoft Service") is not installed properly.

3. The Dynamic Web TWAIN Service is installed correctly but not started.

4. The requests sent to the Service are redirected because you are using a proxy server on IE.

5. The service's listening ports are blocked by another software, like anti-virus software.

6. The service is blocked by extensions or plugins you have installed in the browser. (e.g. NoScript, M*Modal Fluency Direct Web Connector)

7. You are accessing an HTTPS site on a Linux machine.

8. You are visiting a public HTTP website with Dynamic Web TWAIN SDK integrated via Chrome v94+ (or any Chromium v94+ based browsers)

9. You have added `Access-Control-Allow-Origin` setting in the `DSConfiguration.ini` file, but the request originates from a different domain and you didn't set [`IfCheckCORS`](/_articles/extended-usage/dynamsoft-service-configuration.md#access-control-allow-origin).

#### The respective fixes are listed below

1.  See [Chromium local network access issue](/_articles/faq/chromium-142-local-network-access-issue.md) for details and corrective actions.

2. Check the service's [installation folder](/_articles/extended-usage/dynamsoft-service-configuration.md#installation-folder) and make sure you have [the correct files](/_articles/extended-usage/dynamsoft-service-configuration.md#related-files-and-folders){:target="_blank"}.

3. Check `Local Services` and make sure the Dynamic Web TWAIN Service is listed and Running.

4. On IE, go to `Internet Options` --> `Security` tab, select `Local Intranet`, then click `Sites`, uncheck 'Include all sites that bypass the proxy server'  
   ![why-is-the-browser-prompting-me-to-install-dynamsoft-service-repeatedly-1](/assets/imgs/why-is-the-browser-prompting-me-to-install-dynamsoft-service-repeatedly-1.png)
   ![why-is-the-browser-prompting-me-to-install-dynamsoft-service-repeatedly-2](/assets/imgs/why-is-the-browser-prompting-me-to-install-dynamsoft-service-repeatedly-2.png)

5. Check your anti-virus software or any other software that can block local ports and make sure the ports 18622, 18623, 18625 and 18626 are not blocked.

6. Disable all the extensions or plugins in the browser, refresh and try again.

7. On your Linux client machine, visit https://127.0.0.1:18626 and https://127.0.0.1:18623 separately in Chrome and FireFox, manually add both certificates to the exception lists.

8. See the solution [here](/_articles/faq/http-insecure-websites-in-chromium-browser.md){:target="_blank"}

9. Set [`IfCheckCORS`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#ifcheckcors) to `true` in `dynamsoft.webtwain.config.js` file.


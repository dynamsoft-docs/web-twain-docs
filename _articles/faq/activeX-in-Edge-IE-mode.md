---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How to run Dynamic Web TWAIN ActiveX in Microsoft Edge Internet Explorer (IE) mode
keywords: Dynamic Web TWAIN, ActiveX, Internet Explorer mode, IE mode
breadcrumbText: How to run Dynamic Web TWAIN ActiveX in Microsoft Edge Internet Explorer (IE) mode
description: How to run Dynamic Web TWAIN ActiveX in Microsoft Edge Internet Explorer (IE) mode
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# How to run Dynamic Web TWAIN ActiveX in Microsoft Edge Internet Explorer (IE) mode

Microsoft is <a href="https://www.microsoft.com/en-us/edge/business/ie-mode" target="_blank">retiring Internet Explorer 11</a> on June 15, 2022. To support Dynamic Web TWAIN ActiveX, please configure IE mode in Edge following the steps below. For better browser compatibility, we strongly recommend <a href="/web-twain/docs/indepth/development/activex.html#move-away-from-activex" target="_blank">updating your web application with our HTML5 edition</a>.

### Step by step instructions to configure Microsoft Edge IE mode

1. Update Edge Default Browser settings per the screenshot:

    ![IE Mode 1]({{site.assets}}imgs/ieMode-1.png)

2. Download and install <a href="https://www.microsoft.com/en-us/download/details.aspx?id=49974" target="_blank">Enterprise Mode Site List Manager</a> to <a href="https://docs.microsoft.com/en-us/internet-explorer/ie11-deploy-guide/add-single-sites-to-enterprise-mode-site-list-using-the-version-2-enterprise-mode-tool" target="_blank">add</a> and <a href="https://docs.microsoft.com/en-us/internet-explorer/ie11-deploy-guide/export-your-enterprise-mode-site-list-from-the-enterprise-mode-site-list-manager" target="_blank">export</a> a site list to a XML file.

    ![IE Mode 2]({{site.assets}}imgs/ieMode-2.png)       

3. <a href="https://docs.microsoft.com/en-us/internet-explorer/ie11-deploy-guide/turn-on-enterprise-mode-and-use-a-site-list" target="_blank">Turn on Enterprise Mode using Group Policy</a>

4. Run the following command to force the update of the group policy
``` shell
`gpupdate /force`
```

5. Go to edge://compat/iediagnostic to open the Microsoft Edge Compatibility tab. Check under the Group policy settings to make sure the policy is applied.

6. Run your web application.

7. You can debug the content of an IE mode tab by using IEChooser to open <a href="https://docs.microsoft.com/en-us/microsoft-edge/devtools-guide-chromium/ie-mode/" target="_blank">Internet Explorer DevTools</a>: Open the Windows Run dialog box and enter "%systemroot%\system32\f12\IEChooser.exe".

For more details, please visit Microsoft's documentation: <a href="https://docs.microsoft.com/en-us/deployedge/edge-ie-mode" target="_blank">What is Internet Explorer (IE) mode?</a>

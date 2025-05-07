---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Development - About ActiveX
keywords: Dynamic Web TWAIN, Documentation, Development, About ActiveX
breadcrumbText: About ActiveX
description: Dynamic Web TWAIN SDK Documentation About ActiveX Page
---

# About ActiveX

<span style="background-color:#f9f2f4; color:#c7254e">April 21, 2022: Microsoft is retiring Internet Explorer 11 on June 15, 2022. To support Dynamic Web TWAIN ActiveX, please refer to [this article](/_articles/docs/faq/activeX-in-Edge-IE-mode.md){:target="_blank"} to configure IE mode in Edge.</span>

**ActiveX** is a software framework created by Microsoft widely used in Internet Explorer (IE). However, Microsoft has announced plans to end support for older browsers completely and has now deprecated this technology.

## Dynamic Web TWAIN & ActiveX

Although `Dynamic Web TWAIN` is built upon modern technologies like `WebSocket` , `HTML5` , `WebAssembly` , it was born as one of many ActiveX controls in 2003. The ActiveX edition of `Dynamic Web TWAIN` continued to dominate for 11 years. ActiveX is still part of `Dynamic Web TWAIN` though only used by a small number of customers who want to stick with IE 8 or 9.

## The Future of ActiveX

Microsoft officially announced the end of support for IE 10 and older on `January 12th, 2016` . While IE 11 continues to be supported on Windows 7, 8.1, and 10, Microsoft is gradually deprecating it too.

That said, since many enterprise applications still and will continue to rely on IE 11 for some time yet, the browser will continue receiving security updates and technical support for the lifecycle of the version of Windows on which it is installed. Windows 10 is among these versions of Windows on which IE 11 is installed, and there is no evidence that Microsoft will release a newer version of Windows soon. Therefore, it is safe to assume that IE 11 will continue to exist for quite some time. Read more [here](https://docs.microsoft.com/en-us/lifecycle/faq/internet-explorer-microsoft-edge).

The fate of the ActiveX framework depends on the fate of IE 11. As long as IE 11 is still hanging around, ActiveX will continue to be supported.

## The Future of ActiveX Edition in Dynamic Web TWAIN

Dynamsoft has a substantial customer base and their benefits are our biggest concern. While most of our customers have opted to use the modern browsers like Chrome, Firefox or Safari, a few of them must use IE 8 or 9 of which most cases are imitated by IE 11. In these cases, only the ActiveX edition of `Dynamic Web TWAIN` can be used. Dynamsoft has kept its support of the ActiveX edition as part of the Windows edition until now and will continue to do so as long as IE continues to be supported by Microsoft.

Simultaneously, the ActiveX edition of `Dynamic Web TWAIN` will also be slowly phased out by Dynamsoft, just like IE by Microsoft. On the one hand, IE is reaching its end of life. On the other hand, outdated technologies are incompatible with updated Web standards, which hinders `Dynamic Web TWAIN` development.

If you check our [release notes](/_articles/info/schedule/Stable.md), you can find that most of our development has been done to the HTML5-based editions of `Dynamic Web TWAIN` . For ActiveX, the strategy is as follows:

* It'll continue to be a part of the Windows edition
* No new features will be added
* If a major bug is found, Dynamsoft will fix it
* If there is a major feature conflict between two editions, the preference is to upgrade the ActiveX version or tag its behavior as deprecated

We encourage customers who are still using the ActiveX edition of `Dynamic Web TWAIN` to consider moving to another edition as soon as possible.

## Move away from ActiveX

If your organization or the end users of your application have decided to abandon the obsolete IE browser and switch to modern browsers like Chrome, Firefox, Edge, etc. You might need to consider moving away from the ActiveX. See below on how to proceed.

### You only have an ActiveX License

In this case, you will need to purchase a new license to use the alternative edition which is the HTML5 edition. If you are using version 12.3.1 and above, you can get an HTML5 edition license for that same version, then just replacing the ActiveX license with the new license would work. Of course, we suggest that you also upgrade to use the latest edition of the SDK to keep up-to-date with the latest improvements. If you decide to upgrade, you may need to modify your code a bit. Contact [Dynamsoft Support](/_articles/about/getsupport.md) if you need help.

If you are using a version older than 12.3.1, an upgrade will be inevitable. Contact [Dynamsoft Support](/_articles/about/getsupport.md) for more information.

### You already have a non-ActiveX license

In this case, if your application already works on non-IE browsers, you can just let your users know that they can make the switch at any time. If your application only uses the ActiveX now, you can test the application in the modern browsers and see if it works (make sure you have the correct license in place). Contact [Dynamsoft Support](/_articles/about/getsupport.md) if you need help.

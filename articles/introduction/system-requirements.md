---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Dynamic Web TWAIN SDK System Requirements
keywords: Dynamic Web TWAIN, Documentation, Platform
breadcrumbText: System Requirements
description: Dynamic Web TWAIN SDK Documentation Platform Page
permalink: /introduction/system-requirements.html
redirect_from:
    - /getstarted/platform.html
---

# System Requirements

## Supported Systems and Browsers

Dynamic Web TWAIN is designed to be cross-platform, thus, it works in all major browsers across all major operating systems, including Windows, macOS, Linux. 

[See the list of supported systems and browsers >](https://www.dynamsoft.com/web-twain/features/)

## ActiveX Browsers

ActiveX browsers refers to Internet Explorer 9 ~ 11. They are not included in the above lists. By default, IE 10 ~ 11 runs in HTML5 mode. Setting the global API `Dynamsoft.DWT.IfUseActiveXForIE10Plus` to true can turn ActiveX mode on in IE 10 ~ 11.

Please refer to <a href="{{site.indepth}}development/activex.html" target="_blank">Dynamic Web TWAIN & ActiveX</a> for more information.

## Other Operating Systems

There could be some other systems which are also supported but not listed above. Dynamsoft doesn't recommend the use of such systems as they are not officially tested. If you need to use Dynamic Web TWAIN on a system not mentioned above, please first contact [Dynamsoft Support]({{site.about}}getsupport.html) to get more information.

## Other Browsers

There are many different browsers on the market which may not have been listed above. However, these browsers most likely use the same browser engines that one of the listed browsers use. For example, on desktop Opera uses [ `Blink` ](https://en.wikipedia.org/wiki/Blink_(web_engine)) just like Chrome. These browsers probably work too. If you plan to use any of the browsers that are not listed above, you should

- Make sure it works by testing our [demo page](https://demo.dynamsoft.com/dwt/online_demo_scan.aspx)

- Do thorough tests before going into production

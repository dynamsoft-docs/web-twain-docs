---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I set scanning settings without using the default scanner's UI? What pre-scanning settings do you support?
keywords: Dynamic Web TWAIN, Capture/ Image Source, scan settings
breadcrumbText: Can I set scanning settings without using the default scanner's UI? What pre-scanning settings do you support?
description: Can I set scanning settings without using the default scanner's UI? What pre-scanning settings do you support?
---

# Capture/Image Source

## Can I set scanning settings without using the default scanner's UI? What pre-scanning settings do you support?

Yes, you can set the scanner settings without using the default scanner's UI. By setting <a href="/web-twain/docs/info/api/WebTwain_Acquire.html#ifshowui" target="_blank">IfShowUI</a> to false, the default scanner's UI is hidden.

Then, you can instead set multiple settings by passing the configuration settings to acquire image api. Please refer to <a href="/web-twain/docs/info/api/WebTwain_Acquire.html#acquireimage" target="_blank">this API instruction page</a> for more details.

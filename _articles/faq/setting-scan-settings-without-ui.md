---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I set scanning settings without using the default scanner's UI? What pre-scanning settings do you support?
keywords: Dynamic Web TWAIN, Capture/ Image Source, scan settings
breadcrumbText: Can I set scanning settings without using the default scanner's UI? What pre-scanning settings do you support?
description: Can I set scanning settings without using the default scanner's UI? What pre-scanning settings do you support?
date: 2021-12-08 03:01:32 +0800
---

# Capture/Image Source

## Can I set scanning settings without using the default scanner's UI? What pre-scanning settings do you support?

Yes, you can set the scanner settings without using the default scanner's UI. By setting [IfShowUI](/_articles/info/api/WebTwain_Acquire.md#ifshowui){:target="_blank"} to false, the default scanner's UI is hidden.

Then, you can instead set multiple settings by passing the configuration settings to acquire image api. Please refer to [this API instruction page](/_articles/info/api/WebTwain_Acquire.md#acquireimage){:target="_blank"} for more details.

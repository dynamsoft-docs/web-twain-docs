---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I hide webcam devices from the select source list?
keywords: Dynamic Web TWAIN, Capture/ Image Source, hide, webcam
breadcrumbText: Can I hide webcam devices from the select source list?
description: Can I hide webcam devices from the select source list?
date: 2021-12-08 03:01:32 +0800
last_modified: 2022-06-10 04:40:03 +0800
---

# Capture/Image Source

## Can I hide webcam devices from the select source list?

Many webcam devices may use WIA drivers. As explained in this article, WIA drivers can also be detected by the Dynamic Web TWAIN SDK. If you need to exclude webcam/camera devices, you can try using [GetDeviceType](/_articles/info/api/WebTwain_Acquire.md#getdevicetype){:target="_blank"} API to verify if a source is a scanner or not. If not, you can skip it from your source list.

Please note that you would need to call [OpenSource](/_articles/info/api/WebTwain_Acquire.md#opensource){:target="_blank"} API to open a source before you can inspect its device type. If there are any offline devices in the source name list, this process would be interrupted.

Another workaround is to exclude some sources by detecting certain keywords from the source name list. E.g. you can try to exclude any source names with 'camera' or 'webcam'. Please refer to this [FAQ](/_articles/faq/hide-offline-scanners-from-source-list.md){:target="_blank"} for more details.

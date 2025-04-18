---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I hide webcam devices from the select source list?
keywords: Dynamic Web TWAIN, Capture/ Image Source, hide, webcam
breadcrumbText: Can I hide webcam devices from the select source list?
description: Can I hide webcam devices from the select source list?
---

# Capture/Image Source

## Can I hide webcam devices from the select source list?

Many webcam devices may use WIA drivers. As explained in this article, WIA drivers can also be detected by the Dynamic Web TWAIN SDK. If you need to exclude webcam/camera devices, you can try using <a href="/web-twain/docs/info/api/WebTwain_Acquire.html#getdevicetype" target="_blank">GetDeviceType</a> API to verify if a source is a scanner or not. If not, you can skip it from your source list.

Please note that you would need to call <a href="/web-twain/docs/info/api/WebTwain_Acquire.html#opensource" target="_blank">OpenSource</a> API to open a source before you can inspect its device type. If there are any offline devices in the source name list, this process would be interrupted.

Another workaround is to exclude some sources by detecting certain keywords from the source name list. E.g. you can try to exclude any source names with 'camera' or 'webcam'. Please refer to this <a href="/web-twain/docs/faq/hide-offline-scanners-from-source-list.html" target="_blank">FAQ</a> for more details.

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I hide offline scanner devices from the select source list?
keywords: Dynamic Web TWAIN, Capture/ Image Source, hide offline scanners, source list
breadcrumbText: Can I hide offline scanner devices from the select source list?
description: Can I hide offline scanner devices from the select source list?
date: 2021-12-08 03:01:32 +0800
---

# Capture/Image Source

## Can I hide offline scanner devices from the select source list?

Generally, the modern scanner drivers have the functionality to auto-hide themselves if they are not connected. If your scanner doesn't hide itself when it is offline, unfortunately, there is no good way to automatically remove this offline device from showing on the source list.

If your requirement is to hide some specific devices (e.g. hide all Epson scanners) from the source list, this could be achieved by using the below example:

```javascript
var sources = DWTObject.GetSourceNames();
for (var i = 0; i < sources.length; i++) {
  if (sources[i].toLowerCase().indexOf("epson") != -1) {
    sources.splice(i, 1);
  }
}
```

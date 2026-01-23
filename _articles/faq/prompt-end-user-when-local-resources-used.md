---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I prompt the end-user when the Dynamic Web TWAIN SDK attempts to visit any local resources (scanner, camera, or disk drive)?
keywords: Dynamic Web TWAIN, Security, end user, prompt
breadcrumbText: Can I prompt the end-user when the Dynamic Web TWAIN SDK attempts to visit any local resources (scanner, camera, or disk drive)?
description: Can I prompt the end-user when the Dynamic Web TWAIN SDK attempts to visit any local resources (scanner, camera, or disk drive)?
date: 2021-11-29 18:33:59 +0800
last_modified: 2022-06-02 15:30:49 +0800
---

# Security

## Can I prompt the end-user when the Dynamic Web TWAIN SDK attempts to visit any local resources (scanner, camera, or disk drive)?

Yes, Dynamic Web TWAIN supports authorization for accessing local files, scanners, or webcams.

1. Stop the Dynamic Web TWAIN Service.
2. Add the following three lines to the file `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}\DSConfiguration.ini` (for versions below 19.0, the path is `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{version number}\DSConfiguration.ini`):
```javascript
EnableScannerAccessAuth=TRUE
EnableFileAccessAuth=TRUE
EnableWebcamAccessAuth=TRUE
```
3. Restart the Dynamic Web TWAIN Service.
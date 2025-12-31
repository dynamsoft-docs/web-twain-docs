---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Safari 26.2 Regression Causing Dynamic Web TWAIN v19.3 Auto-Reconnect Failure on macOS
keywords: Dynamic Web TWAIN, macos, Auto-Reconnect, 19.3, Safari
breadcrumbText: Safari 26.2 Regression Causing Dynamic Web TWAIN v19.3 Auto-Reconnect Failure on macOS
description: Safari 26.2 Regression Causing Dynamic Web TWAIN v19.3 Auto-Reconnect Failure on macOS
date: 2025-12-31 13:18:47 +0800
last_modified: 2025-12-31 13:18:47 +0800
---

# Safari 26.2 Regression Causing Dynamic Web TWAIN v19.3 Auto-Reconnect Failure on macOS

### Symptom

After upgrading to Safari 26.2 on macOS, a compatibility issue was observed with Dynamic Web TWAIN v19.3.

When a site installs or updates the Dynamic Web TWAIN v19.3 Service for the first time, the automatic connection and reconnect mechanism fails. A browser refresh is required to restore normal behavior.

### Issue characteristics

- Only occurs in Safari 26.2
- Does not occur in Safari 26.1 or earlier versions
- Does not occur in Dynamic Web TWAIN versions prior to 19.3

### Reason

Dynamic Web TWAIN 19.3 introduced a new configuration in reconnect requests: `targetAddressSpace: "loopback"`, following the Chrome Local Network Access documentation to explicitly indicate that the request targets the loopback address (127.0.0.1).

In Safari 26.1 and earlier, this configuration is ignored and requests are sent normally.

In Safari 26.2, `fetch` throws a `TypeError` when this configuration is present, causing the request to fail before being sent. As a result, `reconnect` cannot be implemented even though the Dynamsoft Service is installed and running.

### Update

The WebKit team has identified this issue as a regression in Safari 26.2 and has already fixed it. The fix will be included in an upcoming Safari release.
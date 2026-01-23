---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error Message - Source has nothing to capture
keywords: Dynamic Web TWAIN, Error Message
breadcrumbText: Error Message - Source has nothing to capture
description: Error Message - Source has nothing to capture
date: 2022-10-12 16:32:41 +0800
last_modified: 2026-01-22 13:19:23 -08:00
---

# Error Troubleshooting

## Error Message - Source has nothing to capture

### Symptom

On Linux, calling `ErrorCode`/`ErrorString` after a scan could return code 1029 with “Source has nothing to capture,” even though scanning completed successfully.

### Solution

The message was cosmetic only. It was fixed in Dynamic Web TWAIN 18.0. On 18.0 or later, no action is required. If you are on an earlier version and see 1029 despite a successful scan, you can ignore it or upgrade to 18.0+ to remove the message.

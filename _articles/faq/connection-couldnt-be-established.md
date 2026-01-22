---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: A connection with the server could not be established
keywords: Dynamic Web TWAIN, Error Troubleshooting, connection not established
breadcrumbText: A connection with the server could not be established
description: A connection with the server could not be established
date: 2020-12-10 16:11:49 +0800
last_modified: 2026-01-21 15:26:16 -08:00
---

# Error Troubleshooting

## A connection with the server could not be established

### Symptom

When attempting to upload images to your web server, the upload fails and you see this error message.

### Cause

This usually means the client cannot reach the server.

### Resolution

- Verify the HTTP port in your code matches the server’s listening port. Set it with [`HTTPPort`](/_articles/info/api/WebTwain_IO.md#httpport).
- Confirm the server address is reachable (ping it from a client machine). Use either the machine name or IP with `HTTPUpload`.

> Note:
> Both the machine name and the IP address of the server can be used for the [`HTTPUpload`](/_articles/info/api/WebTwain_IO.md#httpupload) method.

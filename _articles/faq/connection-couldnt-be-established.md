---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: A connection with the server could not be established
keywords: Dynamic Web TWAIN, Error Troubleshooting, connection not established
breadcrumbText: A connection with the server could not be established
description: A connection with the server could not be established
---

# Error Troubleshooting

## A connection with the server could not be established

### Symptom

When attempting to upload images web server the upload fails and you receive the error message.

### Cause

The problem may occur when a connection with the server is not available.

### Resolution

- Check if the HTTP port you set in your code coincides with the port number you set on your web server. You can use the [HTTPPort](/_articles/info/api/WebTwain_IO.md#httpport) property to set the port number.
- Make sure the address of the server is available. To check this, you can ping the address from a client machine.

> Note:
> Both the machine name and the IP address of the server can be used for the HTTPUpload method.

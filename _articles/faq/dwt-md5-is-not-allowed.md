---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Request header field dwt-md5 is not allowed by Access-Control-Allow-Headers in preflight response
keywords: Dynamic Web TWAIN, Error Troubleshooting, dwt-md5, Access-Control-Allow-Headers
breadcrumbText: Request header field dwt-md5 is not allowed by Access-Control-Allow-Headers in preflight response
description: Request header field dwt-md5 is not allowed by Access-Control-Allow-Headers in preflight response
date: 2021-12-03 23:26:46 +0800
last_modified: 2026-01-21 15:58:00 -08:00
---

# Error Troubleshooting

## Request header field dwt-md5 is not allowed by Access-Control-Allow-Headers in preflight response

### Symptom

When uploading images, the request fails with this CORS error.

### Cause

`dwt-md5` is a built-in header Dynamic Web TWAIN uses to validate upload integrity. Because it’s non-standard, browsers send a preflight OPTIONS request to confirm the header is allowed. If your server doesn’t allow it, the upload fails.

### Solution

Allow the `dwt-md5` header in your server’s CORS configuration. For IIS, add:

```xml
<system.webServer>
    <httpProtocol>
        <customHeaders>
            <add name="Access-Control-Allow-Origin" value="*" />
            <add name="Access-Control-Allow-Methods" value="OPTIONS, POST, GET, PUT" />
            <add name="Access-Control-Allow-Headers" value="x-requested-with, dwt-md5" />
            <add name="Access-Control-Allow-Credentials" value="true" />
        </customHeaders>
    </httpProtocol>
</system.webServer>
```

> Note
>
> After updating the server configuration file, you'll need to restart the server (i.e. IIS).

Check out more info [here](https://fetch.spec.whatwg.org/#http-cors-protocol)

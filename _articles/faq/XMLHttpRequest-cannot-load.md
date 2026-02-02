---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: XMLHttpRequest cannot load XXX
keywords: Dynamic Web TWAIN, Error Troubleshooting, XMLHttpRequest
breadcrumbText: XMLHttpRequest cannot load XXX
description: XMLHttpRequest cannot load XXX
date: 2021-12-03 23:26:46 +0800
last_modified: 2026-01-23 06:35:12 -08:00
---

# Error Troubleshooting

## XMLHttpRequest cannot load XXX

### Symptom

You get the error

```shell
XMLHttpRequest cannot load xxxxx. No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://xxxxxxx' is therefore not allowed access.
```

### Cause

You are uploading or downloading to/from a web server which is in a different domain than your current website and that web server doesn't allow accessing from a different domain.

### Solution

Try uploading to the same domain or update the server-side configuration to allow cross-domain requests. If you are using IIS, you can refer to the following configuration.

```xml
<system.webServer>
    <httpProtocol>
            <customHeaders>
            <add name="Access-Control-Allow-Origin" value="*" />
            <add name="Access-Control-Allow-Methods" value="OPTIONS, POST, GET, PUT" />
            <add name="Access-Control-Allow-Headers" value="x-requested-with" />
            <add name="Access-Control-Allow-Credentials" value="true" />
        </customHeaders>
    </httpProtocol>
</system.webServer>
```

> Note
>
> After updating the server configuration file, you'll need to restart the server (i.e. IIS).
>
> If you are downloading a file, you might need to clear the browser cache because a cached file will not be requested again from the server, thus still no 'Access-Control-Allow-Origin' header will be presented.
>
> If you need to send cookies/credentials (e.g., Windows Authentication), enable credentials via code:
>
> ```javascript
> DWTObject.HTTPRequestswithCredentials = true; // adds withCredentials:true on upload requests
> ```

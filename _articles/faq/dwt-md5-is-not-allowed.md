---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Request header field dwt-md5 is not allowed by Access-Control-Allow-Headers in preflight response
keywords: Dynamic Web TWAIN, Error Troubleshooting, dwt-md5, Access-Control-Allow-Headers
breadcrumbText: Request header field dwt-md5 is not allowed by Access-Control-Allow-Headers in preflight response
description: Request header field dwt-md5 is not allowed by Access-Control-Allow-Headers in preflight response
date: 2021-12-03 23:26:46 +0800
---

# Error Troubleshooting

## Request header field dwt-md5 is not allowed by Access-Control-Allow-Headers in preflight response

### Symptom

When you fail to upload images, you may get this error

### Cause

`dwt-md5` is a default built-in header in `Dynamic Web TWAIN` . It is used for each uploading process to test the integrity of data. Since this is not a standard header, the browser will send an OPTIONS preflight request before the original request is sent to verify that this header is allowed. If not, the browser will return the above error.

### Solution

Update your server-side configuration file as per your environment. If you are using IIS, you can refer to the following configuration.

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

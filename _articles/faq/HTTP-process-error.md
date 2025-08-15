---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: HTTP process error
keywords: Dynamic Web TWAIN, Error Troubleshooting, HTTP process
breadcrumbText: HTTP process error
description: HTTP process error
date: 2021-12-03 23:26:46 +0800
last_modified: 2025-08-14 14:09:35 +0800
---

# Error Troubleshooting

## HTTP process error

### Symptom

When attempting to upload images using any of the HTTPUpload\*\*\* methods the upload fails and you receive this error.

### Cause

1. The write permission is not granted to the specified directory on the web server.
2. The action page is incorrect or returns something from the web server.
3. The port specified for uploading is incorrect.
4. The size of the images you are trying to upload is larger than the maximum allowed size set by the server.

### Solution

1. Make sure the users who are uploading have permission to write images to the specified directory on the web server. (For example, give "Write" permission to the Authenticated Users.)
2. Check the response string returned from the HTTP server to determine the cause of the HTTP process error. You can get this string by using the [HTTPPostResponseString](/_articles/info/api/WebTwain_IO.md#httppostresponsestring) property.
3. Set the port to the correct one using [HTTPPort](/_articles/info/api/WebTwain_IO.md#httpport). We recommend you get the Port and Server values this way:

    ```javascript
    var strHTTPServer = location.hostname;
    DWTObject.HTTPPort = location.port == "" ? 80 : location.port;
    ```

    - If you have set [IfSSL](/_articles/info/api/WebTwain_IO.md#ifssl) to true, you must set a secure port for the HTTPPort property. For example,

    ```javascript
    DWTObject.IfSSL = true;
    DWTObject.HTTPPort = 443;
    ```

    > For example: If the URL for the scan page is "http://localhost:3253/....", you should set the port to 3253.

4. Check the server-side configuration

    - Please reset the maximum transferable data size. If you are using `ASP.NET` , you can change the value in the following line in the `Web.Config` file.

    ```xml
    <httpRuntime maxRequestLength="1000000"/> // In kilobytes
    ```

    This line may also be required

    ```xml
    <requestLimits maxAllowedContentLength="300000000" /> // In bytes
    ```

    The following is an example config file

    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <configuration>
        <system.web>
            <httpRuntime executionTimeout="3000"  maxRequestLength="102400"/>
            <compilation debug="true" />
        </system.web>
        <system.webServer>
            <security>
                <requestFiltering>
                    <requestLimits maxAllowedContentLength="300000000" />
                </requestFiltering>
            </security>
        </system.webServer>
    </configuration>
    ```

    If you are using `PHP` , you can change the value in the following lines in the `php.ini` file and `web.config` file:

    - **php.ini**

    ```shell
    file_uploads = On            ; Enable file uploads
    upload_max_filesize = 50M    ; Max single file size for uploads
    post_max_size = 60M          ; Max size for POST data (includes all fields and files)
    max_execution_time = 300     ; Max script execution time (in seconds)
    ```

    - **web.config**

    ```xml
    <system.webServer>
        <security>
            <requestFiltering>
                <requestLimits maxAllowedContentLength="52428800" /><!-- 50MB -->
            </requestFiltering>
        </security>
    </system.webServer>
    ```


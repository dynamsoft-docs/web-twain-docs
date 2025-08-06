---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: The handle is in the wrong state for the requested operation
keywords: Dynamic Web TWAIN, Error Troubleshooting
breadcrumbText: The handle is in the wrong state for the requested operation
description: The handle is in the wrong state for the requested operation
date: 2021-03-02 14:43:01 +0800
---

# Error Troubleshooting

## The handle is in the wrong state for the requested operation

### Symptom

When you upload images in Dynamic Web TWAIN's buffer, you may receive the following error messages returned by the ErrorString property:

![Requested-Operation](/assets/imgs/Requested-Operation.png)

### Cause

1. The size of the images you are going to upload goes beyond the maximum transferable data size which is defined by the server.
2. The port number of the HTTP server is not defined in your code.
3. The server name is invalid.

### Solution

1. Please reset the maximum transferable data size:

    If you are using IIS 6:

    1. Start -> Run , type "cmd"
    2. Go to "C:\Inetpub\AdminScripts" by typing: cd C:\Inetpub\AdminScripts
    3. To view the max request entity allowed:
   cscript adsutil.vbs get w3svc/AspMaxRequestEntityAllowed

    If you are using IIS:

    1. Start -> Run , type "InetMgr" to open IIS 7 Manager
    2. {Your WebSite}->Feature View->ASP->Limit Properties
    3. Set "Maximum Requesting Entity Body Limit" to a bigger value like "1000000"
    To set the max request entity allowed property:
    cscript adsutil.vbs set w3svc/AspMaxRequestEntityAllowed 1000000 (You can change the value by yourself.)

    If you are using ASP.NET, you can change the value at the following line in the "Web.Config" file.

    ```javascript
    <httpRuntime maxRequestLength="1000000" />
    //You can change the value by yourself.
    ```

    If you are using PHP, you can change the value at the following line in the php.ini file.
    ```javascript
    upload_max_filesize = 2M (You can change the value by yourself.)
    ```
    
2. Please set the port number of the HTTP server in your code. You can use the [HTTPPort](/_articles/info/api/WebTwain_IO.md#httpport) property to set the port number. Click here for more information about this property.

3. The problem may occur when you use "localhost" as the server name in the HTTP Upload method, when actually, you specified the address of your server using an IP address. In this case, please modify the server name to an available IP address in your code and then try again.

    ![Default-Web-Site-Properties](/assets/imgs/Default-Web-Site-Properties.png)

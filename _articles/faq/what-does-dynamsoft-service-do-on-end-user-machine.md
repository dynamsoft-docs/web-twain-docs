---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What does the Dynamic Web TWAIN Service do on the end-user machine?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, Dynamic Web TWAIN Service
breadcrumbText: What does the Dynamic Web TWAIN Service do on the end-user machine?
description: What does the Dynamic Web TWAIN Service do on the end-user machine?
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# What does the Dynamic Web TWAIN Service do on the end-user machine?

Dynamic Web TWAIN Service (also called "Dynamsoft Service") is required for the Desktop Service Edition of Dynamic Web TWAIN. It's a background system service that handles the communication between connected physical devices and the browser, as well as image processing, encoding, decoding, etc.

<div class="multi-panel-switching-prefix"></div>

- [v19.0+](#19plus)
- [Versions below 19.0](#19min)

<div class="multi-panel-start"></div>

## Three processes

By default, there are three Dynamic Web TWAIN Service processes running which use the same file `DynamicWebTWAINService.exe` but initiated with different arguments:

- The **main process** starts without any argument as follows:

  ``` cmd
  C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}\DynamicWebTWAINService.exe
  ```

- Then there is a **monitor process** which is meant to monitor the main process and automatically start it in case it crashes. The monitor process starts like this:

  ``` cmd
  C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}\DynamicWebTWAINService.exe -asmonitor XXX
  ```

- The last always-running process is meant to **support the SSL certificate specifically for the Firefox browser**:

  ``` cmd
  C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}\DynamicWebTWAINService.exe -certCheck XXX
  ```

> Note: you may find another process named 'Dynamsoft Scanning New Module', which is a scan module. This process will start when you access an application integrated with Dynamic Web TWAIN, and will automatically stop when you close the application. 

> * On Windows, the service runs under the Local System account
> * On macOS, the service runs under the current user account
> * On Linux, the service runs under the root account 


## Files and folders in the service directory

There are multiple files and folders in the service directory. Taking Windows service (located at `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}`) as an example, the content is as follows:

### For the Service

* `\cache\` : Data cached on the disk. Check out [Disk Caching](/_articles/extended-usage/buffer-caching.md#disk-caching){:target="_blank"}.
* `\cert\` : The certificates used for SSL connection. Check out [How to change the certificates](/_articles/faq/change-dynamsoft-service-certificate.md){:target="_blank"}.
* `\dump\` : Dump files in case the service crashes.
* `\log\` : Log files for debugging purposes.
* `\upload\` : Temporary location for image data to be uploaded by the file uploader.
* `DSConfiguration.ini` : Service configuration file.
* `DWASManager_19000318.dll` : The service manager. The name of the file may vary among different versions.
* `DynamicWebTWAINService.exe` : The service.
* `service.ini` : Define service name.
* `user_config.ini` : User configuration file.
* `welcome.htm` : The home page for the service (present when you visit http://127.0.0.1:18625)

### Components

These files are named with their version number. The following uses v19.0 as an example.

* Core scanning module
  + `dwt_19.0.0.0318.dll`
  + `DSSCN2.exe`
  + `DSSCN2x64.exe`
  + `TWAINDSM.dll`
  + `TWAINDSMx64.dll`
* Barcode Reader Addon
  + `\x64\DynamsoftBarcodeReaderx64_9.6.dll`
  + `dbrx64_9.6.2.0318.dll`
* PDF Addon & Imaging features
  + `\x64\DynamsoftCorex64.dll`
  + `\x64\DynamsoftImageProcessingx64.dll`
  + `\x64\ImageProcessx64.dll`
* Webcam Addon
  + `DynamicWebcamx64_15.0.0.0625.dll`
* File Uploader
  + `UploadModule_1.9.0.0318.dll`

### Supporting files

* `favicon.ico` : The favicon.
* `legal.txt` : Legal notice.
* `libcurl.dll` : The file transfer library.
* For OpenSSL
  + `libssl-3-x64.dll`
* `port.lock`


## HTTP Requests and Responses
Dynamic Web TWAIN Service sets up a local HTTP service that accepts requests from JavaScript code running in the browser and performs operations accordingly. The following are a few examples.

> NOTE
>
> These requests are handled by the JavaScript client of the library. Please do not try to make similar requests in your own code without consulting [Dynamsoft Support](/_articles/about/getsupport.md).

#### Perform image removal

- Request

```
https://127.0.0.1:18623/f/RemoveAllImages?753350643
```

- Response in case of success

```json
{
  "id": "414778098",
  "method": "RemoveAllImages",
  "result": [true],
  "cmdId": ""
}
```

#### Return an image

- Request

```
https://127.0.0.1:18623/dwt/dwt_16100728/img?id=414778098&index=5&width=585&height=513&ticks=1603162807999
```

- Response in case of success

  The image data.

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

## Three processes

By default, there are three Dynamsoft Service processes running which use the same file `DynamsoftService.exe` but initiated with different arguments:

- The **main process** starts without any argument as follows:

  ``` cmd
  C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64\DynamsoftService.exe
  ```

- Then there is a **monitor process** which is meant to monitor the main process and automatically start it in case it crashes. The monitor process starts like this:

  ``` cmd
  C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{version number}\DynamsoftService.exe -asmonitor XXX
  ```

- The last always-running process is meant to **support the SSL certificate specifically for the Firefox browser**:

  ``` cmd
  C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{version number}\DynamsoftService.exe -certCheck XXX
  ```

> Note: you may find another process named 'Dynamsoft Scanning New Module', which is a scan module. This process will start when you access an application integrated with Dynamic Web TWAIN, and will automatically stop when you close the application. 

> * On Windows, the service runs under the Local System account
> * On macOS, the service runs under the current user account
> * On Linux, the service runs under the root account 


## Files and folders in the service directory

There are multiple files and folders in the service directory. Taking Windows service (located at `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_16`) as an example, the content is as follows:

### For the Service

* `\cache\` : Data cached on the disk. Check out [Disk Caching](/_articles/extended-usage/buffer-caching.md#disk-caching){:target="_blank"}.
* `\cert\` : The certificates used for SSL connection. Check out [How to change the certificates](/_articles/faq/change-dynamsoft-service-certificate.md){:target="_blank"}.
* `\dump\` : Dump files in case the service crashes.
* `\log\` : Log files for debugging purposes.
* `\upload\` : Temporary location for image data to be uploaded by the file uploader.
* `DSConfiguration.ini` : Service configuration file.
* `DWASManager_16000428.dll` : The service manager. The name of the file may vary among different versions.
* `DynamsoftService.exe` : The service.
* `DynamicSocket.dll` : For socket connections.
* `service.ini` : Define service name.
* `user_config.ini` : User configuration file.
* `welcome.htm` : The home page for the service (present when you visit http://127.0.0.1:18625)

### Components

These files are named with their version number. The following uses v16.1.1 as an example.

* Core scanning module
  + `dwt_16.1.0.0728.dll`
  + `DSSCN2.exe`
  + `DSSCN2x64.exe`
  + `TWAINDSM.dll`
  + `TWAINDSMx64.dll`
* Barcode Reader Addon
  + `\x64\`
  + `\x86\`
  + `dbr_7.4.0.0428.dll`
  + `dbrx64_7.4.0.0428.dll`
* PDF Addon
  + `DynamicPdfCore_11.0.0.0428.dll`
  + `DynamicPdfCorex64_11.0.0.0428.dll`
  + `DynamicPdfR_11.0.0.0428.dll` (for the PDF Rasterizer)
  + `DynamicPdfRx64_11.0.0.0428.dll` (for the PDF Rasterizer)
* Webcam Addon
  + `DynamicWebcam_15.0.0.0625.dll`
  + `DynamicWebcamx64_15.0.0.0625.dll`
* File Uploader
  + `UploadModule_1.6.0.0428.dll`
* Imaging features
  + `DynamicImage.dll`
  + `DynamicImagex64.dll`

### Supporting files

* `favicon.ico` : The favicon.
* `legal.txt` : Legal notice.
* `libcurl.dll` : The file transfer library.
* For OpenSSL
  + `libeay32.dll`
  + `ssleay32.dll`
* `port.lock`


## HTTP Requests and Responses
Dynamsoft Service sets up a local HTTP service that accepts requests from JavaScript code running in the browser and performs operations accordingly. The following are a few examples.

> NOTE
>
> These requests are handled by the JavaScript client of the library. Please do not try to make similar requests in your own code without consulting [Dynamsoft Support](/_articles/about/getsupport.md).

#### Return availability

- Request

```
https://127.0.0.1:18623/fa/VersionInfo?ts=1603161807908
```

- Response in case of success

```json
{
  "id": "1",
  "method": "VersionInfo",
  "result": ["16, 1, 0, 0728", "", "64"],
  "cmdId": ""
}
```

#### Perform image removal

- Request

```
https://127.0.0.1:18623/f/RemoveAllImages?753350643
```

- Response in case of success

```json
{
  "id": "414778098",
  "method": "RemoveAllImages",
  "result": [true],
  "cmdId": ""
}
```

#### Return an image

- Request

```
https://127.0.0.1:18623/dwt/dwt_16100728/img?id=414778098&index=5&width=585&height=513&ticks=1603162807999
```

- Response in case of success

  The image data.

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>

For more information, please refer to [Dynamic Web TWAIN Deployment - Dynamic Web TWAIN Service](/_articles/extended-usage/dynamsoft-service-configuration.md){:target="_blank"}.

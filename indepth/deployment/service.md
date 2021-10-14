---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Dynamic Web TWAIN Deployment - Dynamsoft Service
keywords: Dynamic Web TWAIN, Documentation, Deployment, Dynamsoft Service
breadcrumbText: Dynamsoft Service
description: Dynamic Web TWAIN SDK Documentation Dynamsoft Service Page
---

# Dynamsoft Service 

> This article is meant exclusively for the <a href="{{site.indepth}}features/initialize.html#desktop-service-edition" target="_blank">Service mode</a> of Dynamic Web TWAIN.

## What is Dynamsoft Service

Dynamsoft Service is the core piece of Dynamic Web TWAIN when running in <a href="{{site.indepth}}features/initialize.html#desktop-service-edition" target="_blank">Service mode</a>. It handles the communication between hardware (scanner, webcam, etc.) and browser, manages the image buffer, and coordinates data between different modules. 

### IP and ports

The Dynamsoft Service uses `localhost` and `18622` `18625` ports for HTTP connection and `18623` `18626` ports for HTTPS connection.  
These ports can be configured in the `DSConfiguration.ini` file located in:
`C:\Windows\SysWOW64\Dynamsoft\DynamsoftService(DynamsoftServicex64)\DSConfiguration.ini` (Windows)

> NOTE:

> * On Windows, the service runs under the Local System account
> * On macOS, the service runs under the current user account
> * On Linux, the service runs under the root account 

### Three processes

By default, there are three Dynamsoft Service processes running which use the same file `DynamsoftService.exe` but initiated with different arguments:

- The **main process** starts without any argument as follows:

  ``` cmd
  C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64\DynamsoftService.exe
  ```

- Then there is a **monitor process** which is meant to monitor the main process and automatically start it in case it crashes. The monitor process starts like this:

  ``` cmd
  C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64\DynamsoftService.exe -asmonitor Global\Dynamsoft_1.5.0_352325843_stop_service_event   Global\Dynamsoft_1.5.0_352325828_certcheck_event
  ```

- The last always-running process is meant to **support the SSL certificate specifically for the Firefox browser**:

  ``` cmd
  "-scan" "\\.\pipe\dynamsoftscan_15.0_70056_60" "0" "Global\ss352604281_61_70056" "0" "C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64\dwt_trial_15.0.0.0625.dll"
  ```

> Note: you may find another process named 'Dynamsoft Scanning New Module', which is a scan module. This process will start when you access an application integrated with Dynamic Web TWAIN, and will automatically stop when you close the application. 
  
## Installation of Dynamsoft Service

On a desktop, when a new user accesses a web page using Dynamic Web TWAIN SDK for the first time, he will be prompted to install the Dynamsoft Service. This is a built-in behaviour of the library. The prompt will display the download link. Once the installer is downloaded, the installation process will take just a few seconds.

The prompt comes up when you try to [create a WebTwain instance](#creating-the-webtwain-instance) in Service mode.

![Initialization]({{site.assets}}imgs/Initialization-1.png)

On **Windows and macOS**, the users can double click the downloaded installer to install the SDK. 

On **Linux**, the users can run one of the following commands to install it:

- Debian / Ubuntu

  ```bash 
  sudo dpkg -i DynamsoftServiceSetup.deb
  ```

- Fedora

  ```bash 
  sudo rpm -ivh DynamsoftServiceSetup.rpm
  ```

Once the installation is done, the users can click 'Reconnect to the service' or refresh the page to start using Dynamic Web TWAIN.

### Msg: Dynamsoft service is not installed / Dynamic Web TWAIN is not installed

If Dynamsoft Service is not installed, users might receive the error 'The Dynamic Web TWAIN module is not installed' when accessing an application that uses Dynamic Web TWAIN. 

If you see repeat prompt on installing the service, please check out <a href="{{site.indepth}}faqs/distribution/why-is-the-browser-prompting-me-to-install-dynamsoft-service-repeatedly.html" target="_blank">Why is the browser prompting me to install Dynamsoft Service repeatedly?</a>

## Files and folders in the service directory

There are multiple files and folders in the service directory. Taking Windows service (located at `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_16`) as an example, the content is as follows:

### For the Service

* `\cache\` : Data cached on the disk. Check out <a href="{{site.indepth}}features/buffer.html#disk-caching" target="_blank">Disk Caching</a>.
* `\cert\` : The certificates used for SSL connection. Check out <a href="{{site.indepth}}faqs/develop/how-to-change-the-certificate-of-the-dynamsoft-service.html" target="_blank">How to change the certificates</a>.
* `\dump\` : Dump files in case the service crashes.
* `\log\` : Log files for debugging purposes.
* `\upload\` : Temporary location for image data to be uploaded by the file uploader.
* `DSConfiguration.ini` : Service configuration file. Check out <a href="{{site.indepth}}faqs/develop/how-to-set-the-configuration-of-the-dynamsoft-service.html" target="_blank">How to configure the service</a>.
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
* OCR Basic
  + `\DynamicOCR\`
  + `DynamicOCR_10.0.0.0618.dll`
  + `DynamicOCRx64_10.0.0.0618.dll`
* OCR Professional
  + `\OCRProResource\`
  + `DynamicOCRPro_1.2.0.0806.dll`
  + `DynamicOCRProx64_1.2.0.0806.dll`
  + `ocrp.lic`
  + `OCRPro.lic`
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



## Related Resources:

* <a href="{{site.indepth}}faqs/develop/how-to-uninstall-dynamic-web-twain.html" target="_blank">How to uninstall Dynamsoft Service?</a>
* <a href="{{site.indepth}}faqs/develop/what-does-dynamsoft-service-do.html" target="_blank">What does Dynamsoft Service do?</a>
* <a href="{{site.indepth}}faqs/develop/how-to-install-dynamic-web-twain.html" target="_blank">How to install Dynamic Web TWAIN?</a>
* <a href="{{site.indepth}}faqs/distribution/why-is-the-browser-prompting-me-to-install-dynamsoft-service-repeatedly.html" target="_blank">Why is the browser prompting me to install Dynamsoft Service repeatedly?</a>

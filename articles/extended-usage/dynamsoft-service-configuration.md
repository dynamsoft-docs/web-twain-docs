---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Dynamic Web TWAIN SDK Deployment - Dynamsoft Service
keywords: Dynamic Web TWAIN, Documentation, Deployment, Dynamsoft Service
breadcrumbText: Dynamsoft Service
description: Dynamic Web TWAIN SDK Documentation Dynamsoft Service Page
permalink: /extended-usage/dynamsoft-service-configuration.html
redirect_from: /indepth/deployment/service.html
---

# Configuring the Dynamsoft Service

> This article is meant exclusively for the Desktop Service Edition of Dynamic Web TWAIN.

The Dynamsoft Service is the core piece of Dynamic Web TWAIN when running in Service mode. It handles the communication between hardware (scanner, webcam, etc.) and browser, manages the image buffer, and coordinates data between different modules.

### IP and ports

The Dynamsoft Service uses `localhost` and `18622` `18625` ports for HTTP connection and `18623` `18626` ports for HTTPS connection.  
These ports can be configured in the `DSConfiguration.ini` file located in:
  - Windows: `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{versionnumber}`
  - macOS: `Go > Applications > Dynamsoft > DynamsoftServicex64_{versionnumber} > {installed version No.}`
  - Linux: `/opt/dynamsoft/DynamsoftService`

### Access-Control-Allow-Origin

For security purposes, you may want the Dynamsoft Service to only respond to requests from specified origins. Starting from Dynamic Web TWAIN version 18.5, this can be achieved by adding `Access-Control-Allow-Origin` in the `DSConfiguration.ini` file.

By default, the `Access-Control-Allow-Origin` setting is not configured in the ini file. This means that the Dynamsoft Service can respond to requests from any origin.

You can set multiple origins by using commas as the separator, and `http://` or `https://` needs to be specified before each origin. If there is a port for the origin, please remember to specify it. If not specified, the default port is 80.

No origin:

```bash
Access-Control-Allow-Origin=*
```

Single origin:

```bash
Access-Control-Allow-Origin=http://192.168.8.212
```

Multiple origins:

```bash
Access-Control-Allow-Origin=http://192.168.8.212, http://192.168.8.126:8033, https://www.dynamsoft.com
```

![Access-Control-Allow-Origin]({{site.assets}}imgs/Access-Control-Allow-Origin.png)

After configuring the origins in the `DSConfiguration.ini` file, please set [`IfCheckCORS`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#ifcheckcors) to `true` in `dynamsoft.webtwain.config.js`. 

When a request comes from a different origin, a CORS error message will be displayed, both in a pop-up and in the console.

  ![CORS-error-popup]({{site.assets}}imgs/CORS-error-popup.png)

  ![CORS-error-console]({{site.assets}}imgs/CORS-error-console.png)

## Installation of Dynamsoft Service

On a desktop, when a new user accesses a web page using Dynamic Web TWAIN SDK for the first time, he will be prompted to install the Dynamsoft Service. This is a built-in behaviour of the library. The prompt will display the download link. Once the installer is downloaded, the installation process will take just a few seconds.

The prompt comes up when you try to [create a WebTwain instance]({{site.indepth}}features/initialize.html#creating-the-webtwain-instance) in Service mode.

![Initialization]({{site.assets}}imgs/Initialization-1.png)

On **Windows and macOS**, double click the downloaded installer to install the service. 

On **Linux**, instead of double clicking, the downloaded installer needs to be run using one of the following commands:

- Debian / Ubuntu

  ```bash 
  sudo dpkg -i DynamsoftServiceSetup.deb
  ```

- Fedora

  ```bash 
  sudo rpm -ivh DynamsoftServiceSetup.rpm
  ```

Once the installation is done, the users can click the orange sentence 'click here to verify completion' or refresh the page to start using Dynamic Web TWAIN.

![Initialization]({{site.assets}}imgs/Initialization-2.png)

### Msg: Dynamsoft service is not installed / Dynamic Web TWAIN is not installed

If Dynamsoft Service is not installed, users may receive the error 'The Dynamic Web TWAIN module is not installed' when accessing an application that uses Dynamic Web TWAIN. 

## Related Resources:

* <a href="{{site.faq}}what-does-dynamsoft-service-do-on-end-user-machine.html" target="_blank">What does Dynamsoft Service do?</a>
* <a href="{{site.faq}}service-prompting-to-install-repeatedly.html" target="_blank">I have installed the Dynamsoft Service on an end-user machine but still got asked to install it repeatedly. Why?</a>
* <a href="{{site.faq}}how-to-uninstall-dynamsoft-service.html" target="_blank">How to uninstall Dynamsoft Service?</a>
* <a href="{{site.faq}}can-i-install-dynamsoft-service-silently.html" target="_blank">Can I install Dynamsoft Service silently?</a>

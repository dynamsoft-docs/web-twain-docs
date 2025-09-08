---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Dynamic Web TWAIN SDK Deployment - Dynamic Web TWAIN Service
keywords: Dynamic Web TWAIN, Documentation, Deployment, Dynamic Web TWAIN Service
breadcrumbText: Dynamic Web TWAIN Service
description: Dynamic Web TWAIN SDK Documentation Dynamic Web TWAIN Service Page
---

# Configuring the Dynamic Web TWAIN Service

The Dynamic Web TWAIN Service is the core piece of Dynamic Web TWAIN. It handles the communication between hardware (scanner, webcam, etc.) and browser, manages the image buffer, and coordinates data between different modules.


## Installation of Dynamic Web TWAIN Service

On a desktop, when a new user accesses a web page using Dynamic Web TWAIN SDK for the first time, he will be prompted to install the Dynamic Web TWAIN Service. This is a built-in behavior of the library. The prompt will display the download link. Once the installer is downloaded, the installation process will take just a few seconds.

The prompt comes up when you try to [create a WebTwain instance](/_articles/extended-usage/advanced-initialization.md#instantiating-webtwain-without-onwebtwainready).

![Initialization](/assets/imgs/Initialization-1.png)

On **Windows and macOS**, double click the downloaded installer to install the service. 

On **Linux**, instead of double clicking, the downloaded installer needs to be run using one of the following commands:

- Debian / Ubuntu

  ```bash 
  sudo dpkg -i DynamicWebTWAINServiceSetup.deb
  ```

- Fedora

  ```bash 
  sudo rpm -ivh DynamicWebTWAINServiceSetup.rpm
  ```

Once the installation is done, the users can click the orange sentence 'click here to verify completion' or refresh the page to start using Dynamic Web TWAIN.

![Initialization](/assets/imgs/Initialization-2.png)

## Installation Folder

The service is installed in the following folders on different platforms by default.

- Windows:
  - version 19.0 and later: `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {versionnumber}`
  - version 18.5.1 and earlier: `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{versionnumber}`)
- macOS: 
  - version 19.2 and later: `/Users/{username}/Applications/Dynamsoft/Dynamic Web TWAIN Service {versionnumber}`
  - version 19.0-19.1: `/Applications/Dynamsoft/Dynamic Web TWAIN Service {versionnumber}`
  - version 18.5.1 and earlier: `/Applications/Dynamsoft/DynamsoftServicex64_{versionnumber}/{installed version No.}`)
- Linux: 
  - version 19.0 and later:  `/opt/dynamsoft/Dynamic Web TWAIN Service {versionnumber}`
  - version 18.5.1 and earlier: `/opt/dynamsoft/DynamsoftService`
  
There are some files and folders you may pay attention to:

* `log`: the folder where the logs are kept.
* `DSConfiguration.ini`: the service's configuration file.
* `storage`: the folder used by [`createLocalStorage()`](/_articles/info/api/WebTwain_IO.md#createlocalstorage).

## IP and ports

The Dynamic Web TWAIN Service uses `localhost` and `18622` `18625` ports for HTTP connection and `18623` `18626` ports for HTTPS connection.  

These ports can be configured in the `DSConfiguration.ini` file located in the service's installatin folder.


## Access-Control-Allow-Origin

For security purposes, you may want the Dynamic Web TWAIN Service to only respond to requests from specified origins. Starting from Dynamic Web TWAIN version 18.5, this can be achieved by adding `Access-Control-Allow-Origin` in the `DSConfiguration.ini` file.

By default, the `Access-Control-Allow-Origin` setting is not configured in the ini file. This means that the Dynamic Web TWAIN Service can respond to requests from any origin.

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

![Access-Control-Allow-Origin](/assets/imgs/Access-Control-Allow-Origin.png)

After configuring the origins in the `DSConfiguration.ini` file, please set [`IfCheckCORS`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#ifcheckcors) to `true` in `dynamsoft.webtwain.config.js`. 

When a request comes from a different origin, a CORS error message will be displayed, both in a pop-up and in the console.

  ![CORS-error-popup](/assets/imgs/CORS-error-popup.png)

  ![CORS-error-console](/assets/imgs/CORS-error-console.png)


## Web Setup

The service provides a web page to know its status and make basic configurations. You can access it through <http://127.0.0.1:18625>.

For security reasons, the web setup is disabled by default. You can add the following line to `DSConfiguration.ini` to enable it.

```
EnableWebSetup=TRUE
```

Screenshots:

* Default:

   ![home](/assets/imgs/service-web-setup/home.jpg)

* External Access Tab:

   ![external access setup](/assets/imgs/service-web-setup/external-access-setup.jpg)

On the left of the page, you can check the service's status and update the [`LogLevel`](/_articles/info/api/WebTwain_Util.md#loglevel).

On the right of the page, you can configure the service through the local access tab and the external access tab.

In the local access tab, you can update the SSL certificate for domains bound to `127.0.0.1`.

In the external access tab, you can update the following settings:

1. Host: configure an external IP so that it can be accessed by other devices.
2. Firewall exception: add exception rules to the firewall to avoid the traffic being blocked by the firewall (only for Windows).
3. Domain: bind a domain to the IP of your service and configure its SSL certificate.
4. Bonjour service: enable Bonjour service to allow service discovery in local networks. It is needed for the [Remote Scan solution](https://www.dynamsoft.com/remote-scan/docs/introduction/).


## Msg: Dynamic Web TWAIN Service is not installed / Dynamic Web TWAIN is not installed

If Dynamic Web TWAIN Service is not installed, users may receive the error 'The Dynamic Web TWAIN module is not installed' when accessing an application that uses Dynamic Web TWAIN. 

## Msg: Dynamic Web TWAIN Service installed on your device is outdated

If the service is installed but you are using a new version of the JavaScript library, you may encounter this message. You need to install a new version of the service or downgrade the JavaScript library.

## Related Resources:

* [What does Dynamic Web TWAIN Service do?](/_articles/faq/what-does-dynamsoft-service-do-on-end-user-machine.md){:target="_blank"}
* [I have installed the Dynamic Web TWAIN Service on an end-user machine but still got asked to install it repeatedly. Why?](/_articles/faq/service-prompting-to-install-repeatedly.md){:target="_blank"}
* [How to uninstall Dynamic Web TWAIN Service?](/_articles/faq/how-to-uninstall-dynamsoft-service.md){:target="_blank"}
* [Can I install Dynamic Web TWAIN Service silently?](/_articles/faq/can-i-install-dynamsoft-service-silently.md){:target="_blank"}

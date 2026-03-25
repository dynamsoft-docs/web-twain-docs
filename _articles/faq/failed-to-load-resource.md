---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error Message - Failed to load resource
keywords: Dynamic Web TWAIN, Error Message, Failed to load resource, CERT INVALID
breadcrumbText: Error Message - Failed to load resource
description: Error Message - Failed to load resource
date: 2021-12-01 17:04:03 +0800
last_modified: 2026-03-25 12:48:00 -0700
---

# Error Troubleshooting

## Error Message - Failed to load resource: net::ERR_CERT_DATE_INVALID

### Symptom 

You get an error message that says **"Failed to load resource: net::ERR_CERT_DATE_INVALID https://local.dynamsoft.com:18623/f/VersionInfo?ts=XXXXXXXXXXXX"**. And the browser keeps asking to install the Dynamic Web TWAIN Service (previously called "Dynamsoft Service"). 

### Cause 

By default, "127.0.0.1" is used for service connection. "127.0.0.1" uses a self-signed SSL certificate without an expiry date. It is installed to your system so that the browser can trust it. If your environment requires high level security, self-signed certificates may not be accepted. Moreover, it is not easy to install the self-signed certificate for systems like Chrome OS.

In this case, we provide a domain, "local.dynamsoft.com", which points to "127.0.0.1". It has a VeriSign’ed certificate that has an expiry date. The most recent expired "local.dynamsoft.com" certificate expired on <font color=red>2025 November 20th</font>, and the latest certificate will expire on <font color=red>2026 November 21st</font>.

> ___Please note:___ _all official certificates issued by 3rd party come with an expiry date - generally one year. This means that each year the certificate will need to be updated if local.dynamsoft.com is used._


### Resolution

- **No High Level Security Requirement**:
  Set back to self-signed certificate "127.0.0.1" by comment the line `Dynamsoft.WebTwainEnv.Host = "local.dynamsoft.com"` or `Dynamsoft.DWT.Host="local.dynamsoft.com"` out. No need to worry about the expiry date of the certificate anymore.

- **High Level Security Requirement (<font color=red>Please note: you need to replace the certificate annually due to expiration</font>)**

  If you have to use "local.dynamsoft.com", the following methods can be taken:

  - Method 1. Use the following links to download and install the Dynamic Web TWAIN Service Installer.
    > Note: Dynamic Web TWAIN Service installers are backward-compatible within the same major version. Please identify the major SDK version you are using first, then download the corresponding installer (for example, 19.x SDK uses v19 installers, 18.x SDK uses v18 installers). If you are unsure about your SDK version, follow [How do I know which SDK version I am using?](/_articles/faq/find-SDK-version.md).

    <div class="multi-panel-switching-prefix"></div>

    - Windows
    - macOS
    - Linux

    <div class="multi-panel-start"></div>

    > Choose between Admin (requires admin privileges) or Personal (for individual users).
    - Version 19
      - [Windows Installer (Admin)](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.3.2/DynamicWebTWAINServiceSetup.msi)
      - [Windows Installer (Personal)](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.3.2/DynamicWebTWAINServiceSetup.exe)
    - Version 18
      - [Windows Installer (Admin)](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.4/DynamsoftServiceSetup.msi)
      - [Windows Installer (Personal)](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.4/DynamsoftServiceSetup.exe)

    <div class="multi-panel-end"></div>

    <div class="multi-panel-start"></div>

    > Use the installer matching your SDK version.
    - [macOS Installer v19](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.3.2/DynamicWebTWAINServiceSetup.pkg)
    - [macOS Installer v18](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.4/DynamsoftServiceSetup.pkg)

    <div class="multi-panel-end"></div>

    <div class="multi-panel-start"></div>

    > Select the installer format based on your distribution type.
    - RPM Packages (Red Hat, Fedora, CentOS, etc.)
      - [Linux RPM Installer v19](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.3.2/DynamicWebTWAINServiceSetup.rpm)
      - [Linux RPM Installer v18](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.4/DynamsoftServiceSetup.rpm)
    - DEB Packages (Ubuntu, Debian, etc.)
      - [Linux DEB Installer v19](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.3.2/DynamicWebTWAINServiceSetup.deb)
      - [Linux DEB Installer v18](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.4/DynamsoftServiceSetup.deb)
    - ARM64 Architecture
      - [Linux ARM64 DEB Installer v19](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.3.2/DynamicWebTWAINServiceSetup-arm64.deb)
      - [Linux ARM64 DEB Installer v18](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.4/DynamsoftServiceSetup-arm64.deb)
    - MIPS Architecture
      - [Linux MIPS DEB Installer v19](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.3.2/DynamicWebTWAINServiceSetup-mips64el.deb)
      - [Linux MIPS DEB Installer v18](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.4/DynamsoftServiceSetup-mips64el.deb)

    <div class="multi-panel-end"></div>

    <div class="multi-panel-switching-end"></div>

  - Method 2. Click <a href="https://demo.dynamsoft.com/DWT/Resources/dist/cert.zip" target="_blank">here</a> to download the new certificate and use the new server.pem.ldsc & server_key.pem.ldsc to replace the old one in the `cert` folder under the service's [installation folder](/_articles/extended-usage/dynamsoft-service-configuration.md#installation-folder). Then restart Dynamic Web TWAIN Service.

  - Method 3. [Contact Dynamsoft](/_articles/about/getsupport.md){:target="_blank"} for a new service installer for client-side. Please specify the exact service version build number found from the version your client currently has installed.

  - Method 4. You can also generate the certificate by yourself. Check out this [post](/_articles/faq/change-dynamsoft-service-certificate.md).

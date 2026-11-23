---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error Message - Failed to load resource
keywords: Dynamic Web TWAIN, Error Message, Failed to load resource, CERT INVALID
breadcrumbText: Error Message - Failed to load resource
description: Error Message - Failed to load resource
date: 2021-12-01 17:04:03 +0000
last_modified: 2026-11-23 00:00:00 +0000
---

# Error Troubleshooting

## Error Message - Failed to load resource: net::ERR_CERT_DATE_INVALID

### Symptom 

You get an error message that says **"Failed to load resource: net::ERR_CERT_DATE_INVALID https://local.dynamsoft.com:18623/f/VersionInfo?ts=XXXXXXXXXXXX"**. And the browser keeps asking to install the Dynamic Web TWAIN Service (previously called "Dynamsoft Service"). 

### Cause 

By default, "127.0.0.1" is used for service connection. "127.0.0.1" uses a self-signed SSL certificate without an expiry date. It is installed to your system so that the browser can trust it. If your environment requires high level security, self-signed certificates may not be accepted. Moreover, it is not easy to install the self-signed certificate for systems like Chrome OS.

In this case, we provide a domain, "local.dynamsoft.com", which points to "127.0.0.1". It has a VeriSign’ed certificate that has an expiry date. The most recent expired "local.dynamsoft.com" certificate expired on <font color=red>2026 November 21st</font>, and the latest certificate will expire on <font color=red>2027 May 6th</font>.

> [!NOTE]
> All official third-party certificates come with an expiry date. If `local.dynamsoft.com` is used, the certificate needs to be updated before it expires.


### Resolution

- **No High Level Security Requirement**:
  Set back to self-signed certificate "127.0.0.1" by comment the line `Dynamsoft.WebTwainEnv.Host = "local.dynamsoft.com"` or `Dynamsoft.DWT.Host="local.dynamsoft.com"` out. No need to worry about the expiry date of the certificate anymore.

- **High Level Security Requirement**

  > [!WARNING]
  > If you use `local.dynamsoft.com`, replace the certificate before its expiry date.

  If you have to use "local.dynamsoft.com", the following methods can be taken:

  - Method 1. Use the following links to download and install the Dynamic Web TWAIN Service Installer.
    > [!IMPORTANT]
    > The v19.5 installers below are backward-compatible with Dynamic Web TWAIN 18.x, so use them whether your application uses a 19.x or 18.x SDK. See [Service Backward Compatibility](/_articles/faq/service-backward-compatibility.md) for details. If you are unsure about your SDK version, follow [How do I know which SDK version I am using?](/_articles/faq/find-SDK-version.md).

    <div class="multi-panel-switching-prefix"></div>

    - Windows
    - macOS
    - Linux

    <div class="multi-panel-start"></div>

    > Choose between Admin (requires admin privileges) or Personal (for individual users).
    - [Windows Installer (Admin)](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.5/DynamicWebTWAINServiceSetup.msi)
    - [Windows Installer (Personal)](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.5/DynamicWebTWAINServiceUserSetup.msi)

    <div class="multi-panel-end"></div>

    <div class="multi-panel-start"></div>

    - [macOS Installer](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.5/DynamicWebTWAINServiceSetup.pkg)

    <div class="multi-panel-end"></div>

    <div class="multi-panel-start"></div>

    > Select the installer format based on your distribution type.
    - [Linux RPM Installer](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.5/DynamicWebTWAINServiceSetup.rpm) (Red Hat, Fedora, CentOS, etc.)
    - [Linux DEB Installer](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.5/DynamicWebTWAINServiceSetup.deb) (Ubuntu, Debian, etc.)
    - [Linux ARM64 DEB Installer](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.5/DynamicWebTWAINServiceSetup-arm64.deb)
    - [Linux MIPS DEB Installer](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.5/DynamicWebTWAINServiceSetup-mips64el.deb)

    <div class="multi-panel-end"></div>

    <div class="multi-panel-switching-end"></div>

  - Method 2. Click <a href="https://demo.dynamsoft.com/DWT/Resources/dist/cert.zip" target="_blank">here</a> to download the new certificate and use the new server.pem.ldsc & server_key.pem.ldsc to replace the old one in the `cert` folder under the service's [installation folder](/_articles/extended-usage/dynamsoft-service-configuration.md#installation-folder). Then restart Dynamic Web TWAIN Service.

  - Method 3. [Contact Dynamsoft](/_articles/about/getsupport.md){:target="_blank"} for a new service installer for client-side. Please specify the exact service version build number found from the version your client currently has installed.

  - Method 4. You can also generate the certificate by yourself. Check out this [post](/_articles/faq/change-dynamsoft-service-certificate.md).

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error Message - Failed to load resource
keywords: Dynamic Web TWAIN, Error Message, Failed to load resource, CERT INVALID
breadcrumbText: Error Message - Failed to load resource
description: Error Message - Failed to load resource
date: 2021-12-01 17:04:03 +0800
last_modified: 2025-11-05 15:23:24 +0800
---

# Error Troubleshooting

## Error Message - Failed to load resource: net::ERR_CERT_DATE_INVALID

### Symptom 

You get an error message that says **"Failed to load resource: net::ERR_CERT_DATE_INVALID https://local.dynamsoft.com:18623/f/VersionInfo?ts=XXXXXXXXXXXX"**. And the browser keeps asking to install the Dynamic Web TWAIN Service (previously called "Dynamsoft Service"). 

### Cause 

By default, "127.0.0.1" is used for service connection. "127.0.0.1" uses a self-signed SSL certificate without an expiry date. It is installed to your system so that the browser can trust it. If your environment requires high level security, self-signed certificates may not be accepted. Moreover, it is not easy to install the self-signed certificate for systems like Chrome OS.

In this case, we provide a domain, "local.dynamsoft.com", which points to "127.0.0.1". It has a VeriSign’ed certificate that has an expiry date. The most recent expired "local.dynamsoft.com" certificate expired on <font color=red>2025 November 20th</font>, and the latest certificate will expire on <font color=red>2026 November 21st</font>.

> ___Please note:___ _all official certificates issued by 3rd party come with an expiry date - generally one year. This means that each year the certificate will need to be updated if local.dynamsoft.com is used._

<!-- 2. Your own domain certificate expired. -->

<!-- In this case, if you are trying to access an application that integrates a version of Dynamic Web TWAIN V15.3 ~ V17.2.5, you will get the error. Because the old "local.dynamsoft.com" certificate expired on <font color=red>January 9th, 2023</font>.  -->

### Resolution

- **No High Level Security Requirement**:
  Set back to self-signed certificate "127.0.0.1" by comment the line `Dynamsoft.WebTwainEnv.Host = "local.dynamsoft.com"` or `Dynamsoft.DWT.Host="local.dynamsoft.com"` out. No need to worry about the expiry date of the certificate anymore.

- **High Level Security Requirement (<font color=red>Please note: you need to replace the certificate annually due to expiration</font>)**

  If you have to use "local.dynamsoft.com", the following methods can be taken:

  - Method 1.Use the following links to download and install the new Dynamic Web TWAIN Service Installer.
    - For Windows
        > Choose between Admin (requires admin privileges) or Personal (for individual users).
        - Version 19.2
            - [Windows Installer (Admin)](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.2/DynamicWebTWAINServiceSetup.msi)
            - [Windows Installer (Personal)](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.2/DynamicWebTWAINServiceSetup.exe)
        - Version 18
            - [Windows Installer (Admin)](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.2/DynamsoftServiceSetup.msi)
            - [Windows Installer (Personal)](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.2/DynamsoftServiceSetup.exe)
    - For macOS
        > Use the installer matching your SDK version.
        - [macOS Installer v19.2](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.2/DynamicWebTWAINServiceSetup.pkg)
        - [macOS Installer v18](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.2/DynamsoftServiceSetup.pkg)
    - For Linux
        > Select the installer format based on your distribution type.
        - RPM Packages (Red Hat, Fedora, CentOS, etc.)
            - [Linux RPM Installer v19.2](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.2/DynamicWebTWAINServiceSetup.rpm)
            - [Linux RPM Installer v18](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.2/DynamsoftServiceSetup.rpm)
         - DEB Packages (Ubuntu, Debian, etc.)
            - [Linux DEB Installer v19.2](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.2/DynamicWebTWAINServiceSetup.deb)
            - [Linux DEB Installer v18](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.2/DynamsoftServiceSetup.deb)
         - ARM64 Architecture
            - [Linux ARM64 DEB Installer v19.2](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.2/DynamicWebTWAINServiceSetup-arm64.deb)
            - [Linux ARM64 DEB Installer v18](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.2/DynamsoftServiceSetup-arm64.deb)
         - MIPS Architecture
            - [Linux MIPS DEB Installer v19.2](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/19.2/DynamicWebTWAINServiceSetup-mips64el.deb)
            - [Linux MIPS DEB Installer v18](https://download2.dynamsoft.com/Demo/DWT/Resources/dist/18.5.2/DynamsoftServiceSetup-mips64el.deb)

  - Method 2. Click <a href="https://demo.dynamsoft.com/DWT/Resources/dist/cert.zip" target="_blank">here</a> to download the new certificate and use the new server.pem.ldsc & server_key.pem.ldsc to replace the old one in the `cert` folder under the service's [installation folder](/_articles/extended-usage/dynamsoft-service-configuration.md#installation-folder). Then restart Dynamic Web TWAIN Service.

  - Method 3. [Contact Dynamsoft](/_articles/about/getsupport.md){:target="_blank"} for a new service installer for client-side. Please specify the exact service version build number found from the version your client currently has installed.

  - Method 4. You can also generate the certificate by yourself. Check out this [post](/_articles/faq/change-dynamsoft-service-certificate.md).

<!--

        - Method 4 (**<u>Convenience but not recommend</u>**). For v17.2 or higher versions, you can use the new API [UpdateCert](/_articles/info/api/Dynamsoft_WebTwainEnv.md#updatecert){:target="_blank"} to automatically update the client side certificate before it expires. **Please go to dynamsoft.webtwain.install.js file in the Resource Folder and search the keyword "OnSSLCertInfo"**, add the following lines of code:
            ```javascript
            Dynamsoft.OnSSLCertInfo = function (sslExpiredDate) {
                if ((sslExpiredDate - new Date()) / 86400000 < 15) { // Automatically updates 15 days before expiration
                    Dynamsoft.DWT.UpdateCert(
                        "https://demo.dynamsoft.com/DWT/Resources/dist/cert.zip", //You may use your own URL to where the new certificate is placed.
                        function () {
                            //Success callback
                        },
                        function (errorCode, errorString) {
                            console.log(errorString);
                        }
                    );
                }
            };
            ```
            ***Please be aware that the download may not work properly in all environments due to your company's security policy.***


 1) Go to service directory, and find _DSConfiguration.ini_.  
<ul>
   <li>Windows: C:\Windows\SysWOW64\Dynamsoft\DynamsoftService or C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_(version)</li>   
   <li>macOS: Go > Applications > Dynamsoft > DynamsoftService > {installed version No.}</li>   
   <li>Linux: opt/dynamsoft/DynamsoftService</li>
</ul>   
   
 then add the following code lines in DSConfiguration.ini  

```javascript
//if you prefer to use your own valid certificate, change the local.dynamsoftwebtwain.com to your own address. As well as cert_name and key_name. 
[local.dynamsoftwebtwain.com]  
cert_name=server.pem.ldsc       
key_name=server_key.pem.ldsc  
```

 2) Click <a href="https://tst.dynamsoft.com/public/download/dwt/newcert/newcert.zip" target="_blank">here</a> to download the new certificate and use the new server.pem.ldsc & server_key.pem.ldsc to replace the old one under [cert](/_articles/extended-usage/dynamsoft-service-configuration.md#for-the-service){:target="_blank"} folder.

If you use your own certificate, put your own cert and key under the cert folder. 

Note: the new certificate from Dynamsoft will expire on September 23th, 2022. This means you will need to update the certificate again after this certificate expires.
<br>

 3) Call the following line in Resources/dynamsoft.webtwain.config.js to use the new certificate. 
   ```javascript 
  // V15.3~16.2 uses
  Dynamsoft.WebTwainEnv.Host = 'local.dynamsoftwebtwain.com';
 
  // V17.0+ uses
  Dynamsoft.DWT.Host = 'local.dynamsoftwebtwain.com';
   ```
-->

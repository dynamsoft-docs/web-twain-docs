---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error Message - Failed to load resource
keywords: Dynamic Web TWAIN, Error Message, Failed to load resource, CERT INVALID
breadcrumbText: Error Message - Failed to load resource
description: Error Message - Failed to load resource
---

# Error Troubleshooting

## Error Message - Failed to load resource: net::ERR_CERT_DATE_INVALID

### Symptom 

You get an error message that says **"Failed to load resource: net::ERR_CERT_DATE_INVALID https://local.dynamsoft.com:18623/f/VersionInfo?ts=XXXXXXXXXXXX"**. And the browser keeps asking to install the Dynamic Web TWAIN Service (also called "Dynamsoft Service"). 

### Cause 

By default, “127.0.0.1” is used for service connection. "127.0.0.1" uses a self-signed certificate because it is an internal IP address, if your environment requires high level security, self-signed certificates may not be accepted. Moreover, Android OS or Chrome OS does not accept connection between browsers and Dynamic Web TWAIN Service via "127.0.0.1".


In the case that you have used our expired certificate - local.dynamsoft.com, you will need to update to the latest VeriSign’ed certificate. The most recent expired "local.dynamsoft.com" certificate expired on <font color=red>2024 November 19th</font>, and the latest certificate will expire on <font color=red>2025 November 20th</font>.

> ___Please note:___ _all official certificates issued by 3rd party come with an expiry date - generally one year. This means that each year the certificate will need to be updated if local.dynamsoft.com is used._

<!-- 2. Your own domain certificate expired. -->

<!-- In this case, if you are trying to access an application that integrates a version of Dynamic Web TWAIN V15.3 ~ V17.2.5, you will get the error. Because the old "local.dynamsoft.com" certificate expired on <font color=red>January 9th, 2023</font>.  -->

### Resolution

- **No High Level Security Requirement**:
  Set back to self-signed certificate "127.0.0.1" by comment the line `Dynamsoft.WebTwainEnv.Host = "local.dynamsoft.com"` or `Dynamsoft.DWT.Host="local.dynamsoft.com"` out. No need to worry about the expiry date of the certificate anymore.

- **High Level Security Requirement (<font color=red>Please note: you need to replace the certificate annually due to expiration</font>)**

  1. (**<u>Recommended</u>**) Revert back to the self-signed certificate for "127.0.0.1". Dynamsoft understands the importance of [information security](https://www.dynamsoft.com/Products/Dynamsoft_Security_Whitepaper.pdf) and are committed to remaining one of the most security-compliant companies in the industry. Starting from April 9,2021, Dynamsoft becomes ISO 27001 certified. Although a self-sign certificate is being used all connections are limited to the device itself (127.0.0.1) which ensures security in most cases.

  2. If you have to use "local.dynamsoft.com", the following methods can be taken:
        - Method 1 (**<u>Recommended</u>**). Take advantage of the new feature -- **Remote Scan** which released in v18.0. With Remote Scan, you can limit the number of Dynamic Web TWAIN Service Installations to a minimum. For more details, please refer to [What is Remote Scan](https://www.dynamsoft.com/remote-scan/docs/introduction/).
        
        - Method 2. If you must fix the issue on a few client machines immediately, manually update the following cert files on the client-side machine. Click <a href="https://tst.dynamsoft.com/public/download/dwt/newcert/local.dynamsoft.com/newcert.zip" target="_blank">here</a> to download the new certificate and use the new server.pem.ldsc & server_key.pem.ldsc to replace the old one under **`C:\Windows\SysWOW64\Dynamsoft\DynamsoftService(DynamsoftServicex64_{version number})\cert`** (from v19.0+, the path is `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}\cert`). Then restart Dynamic Web TWAIN Service.
            > Note: the new certificate from Dynamsoft will expire on <font color=red>December 8th, 2023</font>. This means you must update the certificate again after this certificate expires.

        - Method 3. [Contact Dynamsoft](/_articles/about/getsupport.md){:target="_blank"} for a new MSI for client-side. Please specify the exact service version build number found from the version your client currently has installed.

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

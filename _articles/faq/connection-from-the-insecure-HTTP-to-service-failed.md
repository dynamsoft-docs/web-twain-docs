---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error Message - The connection from the insecure (HTTP) web page to the local 'Dynamsoft Service' failed
keywords: Dynamic Web TWAIN, Error Message, connection failed, Dynamsoft Service, HTTP
breadcrumbText: Error Message - The connection from the insecure (HTTP) web page to the local 'Dynamsoft Service' failed
description: Error Message - The connection from the insecure (HTTP) web page to the local 'Dynamsoft Service' failed
---

# Error Troubleshooting

## Error Message - The connection from the insecure (HTTP) web page to the local 'Dynamsoft Service' failed

### Symptom 

On Windows 7 x86, Win7 64 Enterprise (or any older Windows OS), you get an error message that says **"The connection from the insecure (HTTP) web page to the local 'Dynamsoft Service' failed. To fix the issue, please update your website to HTTPS or refer to [this article](/_articles/docs/faq/http-insecure-websites-in-chromium-browser.md){:target="_blank"} for other workarounds"** even if you are accessing a secure (HTTPs) web page.

And refresh the web page does not work. 

### Cause 

This issue is only limited on Windows 7, likely the cause is due to TLS 1.2 is not enabled on Windows 7 by default (this protocol is enabled by default on Windows 8 and higher versions), which leads to GoDaddy Cert can't be recognized.

### Resolution 

There are 2 resolutions to fix this issue.

**Resolution 1:** Install <a href="http://support.microsoft.com/help/976932" target="_blank">Service Pack 1 for Windows 7 or Windows Server 2008 R2</a>. See more details <a href="https://support.microsoft.com/en-us/topic/update-to-enable-tls-1-1-and-tls-1-2-as-default-secure-protocols-in-winhttp-in-windows-c4bd73d2-31d7-761e-0178-11268bb10392" target="_blank">here</a>.

**Resolution 2:** Update Godaddy Cert
  - Click <a href="https://tst.dynamsoft.com/libs/dwt/17.2.1/GodaddyCert.zip" target="_blank">here</a> to download the certs. 
  - Run `Certmgr.msc` to open Certificate Manager Tool  
  ![connection-from-HTTP-to-service-failed-1](/assets/imgs/connection-from-HTTP-to-service-failed-1.png)
  - Import `godaddy Trusted Root Cert.cer` to Trusted Root Certification Authorities.
  - Import `godaddy Intermediate Cert.cer` to Intermediate Certificate Authorities.  
  ![connection-from-HTTP-to-service-failed-2](/assets/imgs/connection-from-HTTP-to-service-failed-2.png)


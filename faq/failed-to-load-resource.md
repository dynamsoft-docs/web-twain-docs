---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error Message - Failed to load resource
keywords: Dynamic Web TWAIN, Error Meaasge, Failed to load resource, CERT INVALID
breadcrumbText: Error Message - Failed to load resource
description: Error Message - Failed to load resource
---

# Error Troubleshooting

## Error Message - Failed to load resource: net::ERR_CERT_DATE_INVALID

### Symptom 

You get an error message that says **"Failed to load resource: net::ERR_CERT_DATE_INVALID https://local.dynamsoft.com:18623/f/VersionInfo?ts=XXXXXXXXXXXX"**. And the browser keeps asking to install the Dynamsoft Service. 

### Cause 

By default, we use "127.0.0.1" for service connection. However, you may use our "local.dynamsoft.com" certificate by setting **Dynamsoft.WebTwainEnv.Host = "local.dynamsoft.com"** or **Dynamsoft.DWT.Host="local.dynamsoft.com"**. 

Ref: <a href="{{site.faq}}how-come-would-you-need-local.dynamsoft.com.html" target="_blank">How come would you need local.dynamsoft.com instead of 127.0.0.1?</a>

In this case, if you are trying to access an application that integrates a version of Dynamic Web TWAIN V15.3 ~ V17.1.1, you will get the error. Because "local.dynamsoft.com" certificate has expired on <font color=red>November 20th, 2021</font>. 

Now, we purchased a new certificate for local.dyanmsoft.com, valid till <font color=red>January 9th, 2023</font>. 

### Resolution 

- For v17.1.1 or older versions, choose one of the following approaches 
<ol>
     <li> <a href="https://www.dynamsoft.com/web-twain/docs/about/getsupport.html" target="_blank">Contact Dynamsoft</a> for a new MSI for client-side.</li>
     <li>Upgrade to V17.2+ which comes with a valid certificate </li>
     <li> If you must fix the issue on a few client machines immediately, can try manually update the following cert files on the client-side machine. 
          Click <a href="https://tst.dynamsoft.com/public/download/dwt/newcert/local.dynamsoft.com/newcert.zip" target="_blank">here</a> to download the new certificate and use the new server.pem.ldsc & server_key.pem.ldsc to replace the old one under <a href="https://www.dynamsoft.com/web-twain/docs/indepth/deployment/service.html?ver=latest#for-the-service" target="_blank">cert</a> folder. </li>

           Note: the new certificate from Dynamsoft will expire on January 9th, 2023. This means you will need to update the certificate again after this certificate expires.
 </ol>

- For v17.2 or higher versions, use the new API UpdateCert to automatic update the client side certificate




<!--

 1) Go to service directory, and find _DSConfiguration.ini_.  
<ul>
   <li>Windows: C:\Windows\SysWOW64\Dynamsoft\DynamsoftService or C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_(version)</li>   
   <li>macOS: Go > Applications > Dynamsoft > DynamsoftService > {installed version No.}</li>   
   <li>Linux: opt/dynamsoft/DynamsoftService</li>
</ul>   
   
 then add the following code lines in DSConfiguration.ini  

```javascript
//if you perfer to use your own valid certificate, change the local.dynamsoftwebtwain.com to your own address. As well as cert_name and key_name. 
[local.dynamsoftwebtwain.com]  
cert_name=server.pem.ldsc       
key_name=server_key.pem.ldsc  
```

 2) Click <a href="https://tst.dynamsoft.com/public/download/dwt/newcert/newcert.zip" target="_blank">here</a> to download the new certificate and use the new server.pem.ldsc & server_key.pem.ldsc to replace the old one under <a href="https://www.dynamsoft.com/web-twain/docs/indepth/deployment/service.html?ver=latest#for-the-service" target="_blank">cert</a> folder.

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

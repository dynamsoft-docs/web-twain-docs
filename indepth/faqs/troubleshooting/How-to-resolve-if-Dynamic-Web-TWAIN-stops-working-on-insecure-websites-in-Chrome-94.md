---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How to resolve Dynamic Web TWAIN doesn't work on insecure public websites in Chrome v94 
keywords: Dynamic Web TWAIN, Troubleshooting, Chrome 94 issue, HTTP website, Edge 94 issue, 
breadcrumbText: How to resolve if Dynamic Web TWAIN doesn't work on insecure public websites in Chrome v94 
description: How to resolve if Dynamic Web TWAIN doesn't work on insecure public websites in Chrome v94 
---

# Troubleshooting

## Dynamic Web TWAIN doesn't work on insecure public websites in Chrome v94 

### Symptom

Visiting a public HTTP website with Dynamic Web TWAIN SDK integrated via Chrome v94, you may get prompted to download and install the Dynamsoft Service repeatedly.
The same issue is also seen in Microsoft Edge 94.0.992.31 - as it uses the same Chromium version 94 as the latest Chrome browser.

In the browser console, you may see the following **error message**

```javascript
Access to XMLHttpRequest at 'http://127.0.0.1:****' from origin 'http://yourwebsiteURL' has been blocked by CORS policy: 
The request client is not a secure context and the resource is in more-private address space `local`.
```

However, the same issue doesn't exist in Chrome v93 and earlier version or other web browsers like Firefox, Internet Explorer and Safari.

### Reason

Google introduced a new security feature from Chrome v94 to block any requests to private networks from insecure public websites. More detail can be found at [https://developer.chrome.com/blog/private-network-access-update/](https://developer.chrome.com/blog/private-network-access-update/)


Dynamic Web TWAIN utilizes a local service - called 'Dynamsoft Service' to support document scanning from physical scanners. Therefore, your web scan page would need to make requests to localhost or 127.0.0.1 to communicate with the local service. However, if your website is hosted under HTTP, by using or upgrading to Chrome v94, the connection from your insecure public website to the private network (i.e., localhost/127.0.0.1) is blocked.

If the web page couldn't connect to the Dynamsoft Service successfully, its default behavior is to prompt the dialog to install the service. That's why your end users would see the dialog appearing repeatedly.

### Resolution  


#### Update your public website from HTTP to HTTPS
As suggested by Google, the ultimate solution is to update your website from HTTP to HTTPS.  
Once you update your website to HTTPS, please note that you also need to set [IfSSL](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html?ver=latest#ifssl) to 'true' and specify the secure port number for SSL connection via the [HTTPPort](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html?ver=latest#httpport) API before calling the HTTP upload method of the SDK.  

#### Workarounds if you need to keep HTTP for some time

If you need time to update your website, you may try one of the following workarounds:

1) Registering for [Google's deprecation trials](https://developer.chrome.com/blog/origin-trials/#deprecation-trials), which will allow developers to request a time extension.   
During the trial period, your insecure public website will not be affected by the security upgrade until [Chrome 102](https://chromiumdash.appspot.com/schedule) - to be released by March 31, 2022.  

2) If you have administrative control over your end users, you can re-enable the deprecated feature using either of the following policies:  
  [InsecurePrivateNetworkRequestsAllowed](https://chromeenterprise.google/policies/#InsecurePrivateNetworkRequestsAllowed)  
  [InsecurePrivateNetworkRequestsAllowedForUrls](https://chromeenterprise.google/policies/#InsecurePrivateNetworkRequestsAllowedForUrls)  
  For more details about managing policies for your users, see refer to google's [help center article](https://support.google.com/chrome/a/answer/9037717).  

3) There is also a Chrome setting available to disable the block.  
See the steps below  
Step 1: visit chrome://flags/#block-insecure-private-network-requests  
Step 2: set 'Block insecure private network requests' to Disabled  
![activating-the-WebTwain-instance-1]({{site.assets}}imgs/block-insecure-private-network-request.png)

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I still use Dynamic Web TWAIN on non-HTTPS (insecure HTTP) sites with Chrome?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, Chrome 94 issue, HTTP website, Edge 94 issue, insecure
breadcrumbText: Can I still use Dynamic Web TWAIN on non-HTTPS (insecure HTTP) sites with Chrome?
description: Can I still use Dynamic Web TWAIN on non-HTTPS (insecure HTTP) sites with Chrome?
date: 2021-09-24 07:56:47 +0800
last_modified: 2026-02-11 10:55:00 -0500
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# Can I still use Dynamic Web TWAIN on non-HTTPS (insecure HTTP) sites with Chrome?

### Symptom

When users access a public HTTP website that uses the Dynamic Web TWAIN SDK in Chromium-based browsers (for example, Chrome and Edge), they may repeatedly see prompts to install the Dynamic Web TWAIN Service (Dynamsoft Service).

In the browser console, you may see the following **error message**

```javascript
Access to XMLHttpRequest at 'http://127.0.0.1:****' from origin 'http://yourwebsiteURL' has been blocked by CORS policy:
The request client is not a secure context and the resource is in more-private address space `local`.
```

This behavior is primarily tied to Chromium security enforcement and may vary by browser and version.

### Reason

This is caused by browser security policy changes, not by a bug in Dynamic Web TWAIN itself.

Starting from Chrome 94, Chromium introduced stronger Private Network Access restrictions that block requests from insecure public origins (HTTP) to more private addresses such as `localhost` / `127.0.0.1`. More detail can be found at [https://developer.chrome.com/blog/private-network-access-update/](https://developer.chrome.com/blog/private-network-access-update/)

Dynamic Web TWAIN uses a local service to communicate with physical scanners, so your web page must call `localhost` or `127.0.0.1`. When the page itself is served over HTTP, modern Chromium security rules can block that communication path.

When the page cannot connect to the local service, the SDK may trigger the service installation prompt repeatedly, which is the symptom users see.

### Resolution

The long-term direction from browser vendors is stricter security on insecure origins.  
Any HTTP workaround should be treated as temporary and may be removed in future browser releases.

#### Update your public website from HTTP to HTTPS

As suggested by Google and Chromium security guidance, the only durable solution is to migrate your public website from HTTP to HTTPS.  
Once you update your website to HTTPS, please note that you also need to set [IfSSL](/_articles/info/api/WebTwain_IO.md#ifssl) to 'true' and specify the secure port number for SSL connection via the [HTTPPort](/_articles/info/api/WebTwain_IO.md#httpport) API before calling the HTTP upload method of the SDK.

\*_If you are using an older version of Dynamic Web TWAIN (v12.3 or earlier), you need to upgrade your SDK to newer version, please contact <support@dynamsoft.com> for further assistance._

#### Workarounds if you need to keep HTTP for some time

If you need limited transition time before migrating to HTTPS, you may try one of the following temporary workarounds:

1. [Current / temporary] In current Chrome versions, you can try the `unsafely-treat-insecure-origin-as-secure` flag as a temporary workaround for specific HTTP origins.
   Step 1: visit chrome://flags/#unsafely-treat-insecure-origin-as-secure  
   Step 2: in "Insecure origins treated as secure", add your HTTP website origin (for example: `http://yourwebsiteURL`)  
   Step 3: relaunch Chrome  
   > Note: This is a temporary workaround for testing or controlled environments, and this flag may also be deprecated and removed in future Chrome versions. For policy background on insecure origins and powerful features, see Chromium's proposal: [Deprecating Powerful Features on Insecure Origins](https://www.chromium.org/Home/chromium-security/deprecating-powerful-features-on-insecure-origins/).

2. [Archived: Chrome 92-136] If you have administrative control over your end users, older Chrome versions supported re-enabling the deprecated behavior through the following enterprise policies:  
   [InsecurePrivateNetworkRequestsAllowed](https://chromeenterprise.google/policies/#InsecurePrivateNetworkRequestsAllowed)  
   [InsecurePrivateNetworkRequestsAllowedForUrls](https://chromeenterprise.google/policies/#InsecurePrivateNetworkRequestsAllowedForUrls)  
   For more details about managing policies for your users, see Google's [help center article](https://support.google.com/chrome/a/answer/9037717).  
   > Note: These policy-based workarounds are archived for older Chrome versions only. They were removed beginning with Chrome 137.

3. [Archived: Prior to Chrome 117] In older Chrome versions, end users could disable this block through a browser flag.
   Step 1: visit chrome://flags/#block-insecure-private-network-requests  
   Step 2: set "Block insecure private network requests" to `Disabled`  
   ![block-insecure-private-network-request](/assets/imgs/block-insecure-private-network-request.png)  
   > Note: This workaround is archived for older Chrome versions only. The [`block-insecure-private-network-requests`](https://developer.chrome.com/blog/private-network-access-update) flag was removed beginning with Chrome 117.

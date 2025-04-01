---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How to resolve Dynamic Web TWAIN SDK issue in Chrome 101?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, Chrome 101, Private Network Access, preflight request
breadcrumbText: How to resolve Dynamic Web TWAIN issue in Chrome 101?
description: How to resolve Dynamic Web TWAIN issue in Chrome 101?
permalink: /faq/private-network-access-in-chrome101.html
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# Dynamic Web TWAIN issue in Chrome 101

**Latest Update from Google:**

(REF: <a href="https://developer.chrome.com/blog/private-network-access-preflight/" target="_blank">https://developer.chrome.com/blog/private-network-access-preflight/</a>)

<span style="background-color:#f9f2f4; color:#c7254e">September 27, 2022: Google has stated that the pre-flight changes will not occur sooner than Chrome version 109, which according to <a href="https://chromiumdash.appspot.com/schedule" target="_blank">Google's release calendar</a>, is scheduled for early 2023.</span>

<span style="background-color:#f9f2f4; color:#c7254e">July 7, 2022: Google has updated the timeline for this preflight request feature. The experiment is scheduled again for Chrome 104 and may be released in Chrome 107 at the earliest. Please refer to Google's feature updates <a href="https://chromestatus.com/feature/5436853517811712" target="_blank">here</a>.</span>

<span style="background-color:#f9f2f4; color:#c7254e">March 7, 2022: The experiment in Chrome 98 was rolled back due to stability and compatibility issues discovered in the rollout to Chrome stable. These issues will be fixed before the experiment is tried again, no earlier than in Chrome 101. Learn more in the blink-dev@chromium.org Intent to Ship email thread for more details.</span>

### Symptom

 In Chrome 101 at the earliest, when visiting a website that has Dynamic Web TWAIN SDK v17.2 or older integrated into the application, you may see the following **error message** in the browser console. For the end users of your website, they may be prompted repeatedly to download and install the Dynamic Web TWAIN Service (also called "Dynamsoft Service").

NOTE that the same issue will also occur in any browser based on **Chromium 101+**, such as Microsoft Edge 101.

```
Access to XMLHttpRequest at 'https://local.dynamsoft.com:****' from origin 'https://yourwebsiteURL' has been blocked by CORS policy: 
Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Private-Network' header was present in the preflight response 
for this private network request targeting the `local` address space.
```

In Chrome 98, you may have already noticed the following **warning/error message** in the browser console, but it is not expected to cause any immediate issues. Per Google's message below, Chrome 101 is expected to be released in April 2022.

```
A site requested a resource from a network that it could only access because of its users' privileged network position. 
These requests expose devices and servers to the internet, increasing the risk of a cross-site request forgery (CSRF) attack, and/or information leakage.

To mitigate these risks, Chrome will require non-public subresources to opt-into being accessed with a preflight request and will start blocking them in Chrome 101 (April 2022).
```

### Cause

As a part of the Private Network Access (PNA) specification, Chrome is deprecating direct access to private network endpoints from public websites. In Chrome 101 at the earliest, Chrome will enforce explicit permission from private network endpoints before requests from public websites can be allowed. According to Google, "this will begin only if and when compatibility data indicates that the change is safe enough and we've outreached directly when necessary." More details can be found at <a href="https://developer.chrome.com/blog/private-network-access-preflight/" target="_blank">https://developer.chrome.com/blog/private-network-access-preflight/</a>.

Dynamic Web TWAIN utilizes a local service named 'Dynamic Web TWAIN Service' to support document scanning from physical scanners. Your web scanning page needs to make requests to localhost or 127.0.0.1 to communicate with the local service. In Chrome 101, the connection from your public website to the private network (i.e. localhost/127.0.0.1) will be blocked.

### Resolution

To avoid this potential issue, you can apply one of the following solutions:

1. <a href="{{site.indepth}}development/upgrade.html" target="_blank">Upgrade</a> Dynamic Web TWAIN SDK to **version 17.2.1** or later

   In version 17.2.1, we have made changes to handle preflight requests on our end to resolve the issue. You can test the latest version with our <a href="https://www.dynamsoft.com/web-twain/downloads/" target="_blank">free trial</a> and when you are ready to upgrade, please contact <a href="mailto:sales@dynamsoft.com" target="_blank">sales@dynamsoft.com</a> to request the upgrade.

   Please note that once upgraded, the Dynamic Web TWAIN Service on all client machines also need to be updated. You may consider <a href="{{site.faq}}can-i-install-dynamsoft-service-silently.html#can-i-install-dynamsoft-service-silently" target="_blank">installing Dynamic Web TWAIN Service silently</a>.

2. Disable Private Network Access checks using enterprise policies

   If you have administrative control over your users, you can disable Private Network Access checks using either of the following policies:

   <a href="https://chromeenterprise.google/policies/#InsecurePrivateNetworkRequestsAllowed" target="_blank">InsecurePrivateNetworkRequestsAllowed</a> 
   <a href="https://chromeenterprise.google/policies/#InsecurePrivateNetworkRequestsAllowedForUrls" target="_blank">InsecurePrivateNetworkRequestsAllowedForUrls</a> 

   For more details about managing policies for your users, please refer to Google's <a href="https://support.google.com/chrome/a/answer/9037717" target="_blank">help center article</a>.

### If you need more time to implement the solution

   Register for <a href="https://developer.chrome.com/blog/origin-trials/#deprecation-trials" target="_blank">Google's deprecation trials</a> to request a time extension so your website will not be affected during the trial period which will last for at least 6 months.


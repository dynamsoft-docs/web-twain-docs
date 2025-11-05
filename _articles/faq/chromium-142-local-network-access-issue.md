---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error message - Permission was denied for this request to access the unknown address space
keywords: Dynamic Web TWAIN, Error Troubleshooting, CORS, unknown address space, Chromium, 142
breadcrumbText: Error message - Permission was denied for this request to access the unknown address space
description: CORS unknown address space
date: 2025-11-04 17:21:42 +0800
last_modified: 2025-11-04 17:21:42 +0800
---

# Error Troubleshooting

> [!IMPORTANT]
> This is a newly developing issue, and as such the information in this article may change over time.

## Error message - CORS Errors caused by local network access permissions when using Chromium 142 and later

### Symptom

When using **Chromium-based browsers version 142 or later** (released on October 28th, 2025), including Chrome, Edge, Brave, and Opera, the Dynamsoft Web TWAIN Service may fail to function properly:

- Phenomenon 1: the browser prompts users to download the service installer even though it is already installed.

![DWT_installer.png](/assets/imgs/DWT_installer.png)

- Phenomenon 2: the initialization succeeds, but scanning or loading images results in blank images.

Open the browser console (press F12, then go to the Console tab), you should see the following error message:

```shell
Access to fetch at 'https://127.0.0.1:18623/fa/VersionInfo?ts=1761893667670' from origin 'https://your-domain.com' has been blocked by CORS policy: Permission was denied for this request to access the `unknown` address space.
```

### Cause

In Chromium 142 Google introduced a new [Local Network Access security policy](https://chromestatus.com/feature/5152728072060928). Requests from web pages to local addresses such as 127.0.0.1 or localhost get blocked unless explicit permission is granted.

This affects the Dynamic Web TWAIN Service which relies on local services for communication.

### Resolution

***1. To Manually Correct This in Chrome***

- Navigate to your Dynamic Web TWAIN web interface

- Click the lock icon (or settings icon) next to your site URL in the browser’s address bar.
- Ensure that **Local Network Access** is enabled.

![local-network.png](/assets/imgs/local-network.png)

> [!NOTE]
> If you're unable to restore functionality after enabling 'Local Network Access,' please contact [Dynamsoft](https://www.dynamsoft.com/contact/).

***2. (For Administrators) To Apply This Setting Across an Enterprise***

Enterprise administrators can deploy a Chrome and/or Edge policy to set the "Local Network Access" setting to "Allow" for your website.

Please refer to: 
* [Chrome Enterprise Policy List & Management Documentation](https://chromeenterprise.google/policies/#LocalNetworkAccessAllowedForUrls)
* [Microsoft Edge Browser Policy Documentation](https://learn.microsoft.com/en-us/deployedge/microsoft-edge-browser-policies/localnetworkaccessallowedforurls)

***3. (For Developers) To Manually Check the Permission on Local Network Access***

You can check the permission programmatically:

```javascript
let status = await navigator.permissions.query({ name: "local-network-access" });
console.log(status.state);
```

If the permission is not granted, prompt users to manually enable it (Chrome settings → Privacy and security → Site settings → Local network access).

> [!WARNING]
> If Dynamic Web TWAIN is running in an iframe, ensure the iframe element includes the following attribute:

```html
<iframe src="..." allow="local-network-access *"></iframe>
```


### Planning

Dynamsoft plans to add a feature that automatically detects local service connectivity and permission status. If the connection is blocked, users will be prompted with a message and directed to this FAQ page.

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

### Overview

Starting in **Chromium-based browsers v142+** (released Oct 28, 2025)—including Chrome, Edge, Brave, and Opera—Dynamsoft Web TWAIN Service may not work as expected due to new local-network security rules.

### Symptoms

You may experience one or more of the following:

1. **Service installer repeatedly prompted**
The browser prompts you to download/install the service even though it is already installed.

![DWT_installer.png](/assets/imgs/DWT_installer.png)

2. **Initialization succeeds, but scan/load shows blank images**
The browser console (F12 → Console) shows a CORS rejection similar to:

```shell
Access to fetch at 'https://127.0.0.1:18623/fa/VersionInfo?ts=1761893667670' from origin 'https://your-domain.com' has been blocked by CORS policy: Permission was denied for this request to access the `unknown` address space.
```

### Root Cause

Chromium 142 introduces a new [Local Network Access security policy](https://chromestatus.com/feature/5152728072060928) requirement. 
Requests from web pages to loopback addresses such as `localhost` / `127.0.0.1` are blocked unless the user (or an admin policy) explicitly grants access.

Because Dynamic Web TWAIN communicates with a local service, these restrictions can prevent normal operation.

### Resolution

***1. To Manually Correct This in Chrome***

- Navigate to your Dynamic Web TWAIN page.
- Click the lock/settings icon in the browser address bar.
- Ensure that **Local Network Access** is enabled.

![local-network.png](/assets/imgs/local-network.png)

> [!NOTE]
> If you're unable to restore functionality after enabling 'Local Network Access,' please contact [Dynamsoft](https://www.dynamsoft.com/contact/).

***2. (For Admins) To Apply This Setting Across an Enterprise***

Enterprise administrators can deploy a Chrome and/or Edge policy to set the "Local Network Access" setting to "Allow" for your website.

Please refer to: 
* [Chrome Enterprise Policy List & Management Documentation](https://chromeenterprise.google/policies/#LocalNetworkAccessAllowedForUrls)
* [Microsoft Edge Browser Policy Documentation](https://learn.microsoft.com/en-us/deployedge/microsoft-edge-browser-policies/localnetworkaccessallowedforurls)

***3. Developer Notes***

**a) Check Permission Programmatically**

```javascript
let status = await navigator.permissions.query({ name: "local-network-access" });
console.log(status.state);
```

If not granted, guide users to:
Chrome → Settings → Privacy and Security → Site Settings → Local network access

**b) If Running Inside an `iframe`**

> [!IMPORTANT]
> If your site is embedded in an iframe, you MUST explicitly allow local-network access.

Please explicitly allow `local-network-access` in the attributes of the iframe:
```html
<iframe src="..." allow="local-network-access *"></iframe>
```

### Roadmap

Dynamsoft plans to add a feature that automatically detects local service connectivity and permission status. If the connection is blocked, users will be prompted with a message and directed to this FAQ page.

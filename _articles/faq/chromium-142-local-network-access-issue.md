---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error message - Permission was denied for this request to access the unknown address space
keywords: Dynamic Web TWAIN, Error Troubleshooting, CORS, unknown address space, Chromium, 142
breadcrumbText: Error message - Permission was denied for this request to access the unknown address space
description: CORS unknown address space
date: 2025-11-04 17:21:42 +0800
last_modified: 2025-11-06 15:06:00 +0800
---

# Error Troubleshooting

> [!IMPORTANT]
> This is a newly developing issue, and as such the information in this article may change over time.

## Error message - CORS Errors caused by local network access permissions when using Chromium 142 and later

### Overview

Starting in **Chromium-based browsers v142+** (released Oct 28, 2025)—including Chrome, Edge, Brave, and Opera—Dynamsoft Web TWAIN Service may not work as expected due to new local-network security rules.

### Symptoms

You may experience one or more of the following:

#### **1) Browser repeatedly prompts to download the service**
The browser asks the user to download/install the Dynamsoft Web TWAIN Service even though it is already installed.

![DWT_installer.png](/assets/imgs/DWT_installer.png)

#### **2) Initialization succeeds, but scanning / loading returns blank**
Initialization appears successful, but scanned or loaded images are blank.

The browser console (F12 → Console) may show a CORS denial similar to:

```shell
Access to fetch at 'https://127.0.0.1:18623/fa/VersionInfo?ts=1761893667670'
from origin 'https://your-domain.com' has been blocked by CORS policy:
Permission was denied for this request to access the `unknown` address space.
```

---

#### Version-Specific Behavior
The observed behavior depends on Chromium browser version and Dynamic Web TWAIN (DWT) version:

| Browser Version   | DWT Version      | Resulting Symptom           |
|-------------------|------------------|-----------------------------|
| Chromium 142      | < 18.5.0         | Download Prompt             |
| Chromium 142      | ≥ 18.5.0         | Blank Images after Scanning |
| Chromium 144+ (*) | Any              | Download Prompt             |

> (*) **Chromium 144 has not been officially released.**  
> Behavior is based on pre-release testing and may change once the final release becomes available.

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

**a) If Running Inside an `iframe`**

> [!IMPORTANT]
> If Dynamic Web TWAIN is running inside an iframe from a different origin (cross-origin), you must explicitly grant local-network access in the iframe.
> If the iframe is same-origin, no additional configuration is required.

To enable access, specify the `allow` attribute.
For security reasons, it is recommended to allow only the necessary origin rather than using a wildcard.

```html
<!-- Recommended: restrict to specific origin -->
<iframe src="..." allow="local-network-access your-domain.com"></iframe>

<!-- Not recommended: wildcard -->
<!-- <iframe src="..." allow="local-network-access *"></iframe> -->
```

**b) (Optional Enhancement) Permission Check for Improved UX**

You can optionally query Local Network Access permission at runtime.
This isn’t required, but implementing a check can help you proactively notify users and provide clearer guidance if permission is missing.
```javascript
// Before initializing Dynamsoft WebTWAIN (DWT), you can remind users
// that Chrome may ask for Local Network Access permission.
(async () => {
  try {
    const result = await navigator.permissions.query({ name: "local-network-access" });
    console.log(`LNA permission state: ${result.state}`);
 
    const state = result.state; // 'denied', 'prompt', 'granted'
 
    if (state === "denied") {
      const currentSite = encodeURIComponent(window.location.origin);
      const settingsUrl = `chrome://settings/content/siteDetails?site=${currentSite}`;
      console.log(`Local network access is currently denied.\n\nPlease go to:\n${settingsUrl}\nand enable 'Local network access' permission for this site.`);
      // Optionally show a UI guide or help link here.
    } else if (state === "prompt") {
      alert("To connect with the local scanning service, Chrome will ask for 'Local network access' permission.\n\nPlease click 'Allow' when prompted.");
      // Proceed to init DWT after this message. 
      // e.g., Dynamsoft.DWT.Load() or CreateDWTObjectEx or your init DWT function
    } else if (state === "granted") {
      console.log("Local network access already granted.");
      // Initialize DWT or proceed directly.
      // e.g., Dynamsoft.DWT.Load() or CreateDWTObjectEx or your init DWT function
    } else {
      console.log("Unexpected LNA state:", state);
    }
 
  } catch (e) {
    console.log("This browser does not support Chromium LNA Permissions API yet.");
    // Fallback: directly initialize DWT
    // Dynamsoft.DWT.Load() or CreateDWTObjectEx or your init DWT function
  }
})();
```
If the permission is not granted, consider displaying a user-friendly message directing them to:

> Chrome → Settings → Privacy and Security → Site Settings → Local network access

This approach provides a more polished user experience, especially during onboarding or troubleshooting.

### Roadmap

Dynamsoft plans to add a feature that automatically detects local service connectivity and permission status. If the connection is blocked, users will be prompted with a message and directed to this FAQ page.

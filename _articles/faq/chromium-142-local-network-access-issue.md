---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error message - Permission was denied for this request to access the unknown address space
keywords: Dynamic Web TWAIN, Error Troubleshooting, CORS, unknown address space, Chromium, 142
breadcrumbText: Error message - Permission was denied for this request to access the unknown address space
description: CORS unknown address space
date: 2025-11-04 17:21:42 +0800
last_modified: 2025-12-17 16:00:00 +0800
---

# Error Troubleshooting

> [!IMPORTANT]
> This is a newly developing issue, and as such the information in this article may change over time.

## Error message - CORS Errors caused by local network access permissions when using Chromium 142 and later

### Overview

Starting in **Chromium-based browsers v142+** (released Oct 28, 2025)—including Chrome, Edge, Brave, and Opera—Dynamsoft Web TWAIN Service may not work as expected due to new **Local Network Access (LNA)** restrictions that limit requests **from public network locations to private and loopback network locations**.

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

This error occurs because the web page is loaded from a public network origin (for example, `https://your-domain.com`) and is attempting to connect to a loopback network location (`127.0.0.1`), which Chrome now treats as a protected local network request.

---

#### Version-Specific Behavior

The observed behavior depends on Chromium browser version and Dynamic Web TWAIN (DWT) version:

| Browser Version   | DWT Version      | Resulting Symptom           |
|-------------------|------------------|-----------------------------|
| Chromium 142      | < 18.5.0         | Download Prompt             |
| Chromium 142      | ≥ 18.5.0         | Blank Images after Scanning |
| Chromium 145+ (*) | Any              | Download Prompt             |

> (*) **Chromium 145, which can also block websocket, has not been officially released.**  
> Behavior is based on pre-release testing and may change once the final release becomes available.
> Edge 143 and Firefox Nightly will have local network permission control as well.

### Root Cause

Chromium 142 introduces and enforces a new [Local Network Access (LNA)](https://chromestatus.com/feature/5152728072060928) security model that restricts requests **from public network locations to private and loopback network locations**, requiring explicit user permission.

> [!NOTE]
> For background and design rationale, see Chrome’s Developer Blog: [New permission prompt for Local Network Access](https://developer.chrome.com/blog/local-network-access).

Under this model, **requests originating from a public network location** (such as a publicly hosted website) **to private or loopback network locations** (including localhost and 127.0.0.1) are blocked by default unless the user explicitly grants permission.

Dynamic Web TWAIN relies on a locally installed service that listens on a loopback address. When a web application hosted on a public domain attempts to communicate with this service, Chrome categorizes the request as a **public-to-local** network request, which now requires explicit user consent.

### Resolution

> [!WARNING]
> The steps outlined below **do not “fix” or bypass this restriction**, nor can Dynamic Web TWAIN override it programmatically. They simply ensure that the browser’s required permission is correctly granted so the local Dynamic Web TWAIN service is allowed to communicate with your application.

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

### Product Improvements Related to Local Network Access

Dynamic Web TWAIN v19.3 introduces **user-experience enhancements** to better surface local service connectivity and permission issues.

These changes **do not alter or bypass Chromium’s security model**. Their purpose is to make permission-related failures easier to identify and understand, and to guide users to the appropriate browser settings when access is blocked.

The key improvements include:

* **Explicit detection of blocked local network access** \
When the browser blocks communication with the local service, a clear dialog is displayed explaining the cause and directing users to this FAQ.

   ![prompt blocked](/assets/imgs/local-network-access/prompt-blocked.jpg)

* **Clearer messaging during service installation** \
A notice is added to the service installation dialog to inform users that a connection failure may be caused either by the service not being installed or by local network access being denied, as these two cases cannot be reliably distinguished.

   ![prompt blocked](/assets/imgs/local-network-access/service-installation-dialog.png)

    Clicking “Guide” opens the permission guidance dialog shown above.

These improvements are **available starting with Dynamic Web TWAIN v19.3**.

For older versions, a supplemental JavaScript file can be provided upon request by contacting [Dynamsoft Support](mailto:support@dynamsoft.com).

> [!NOTE]
> This file improves user guidance only and does not change the underlying browser permission requirements.

## Other Causes of Failure to Connect to the Service

There are other causes of service not being connected. You can find them in [another FAQ](/_articles/faq/service-prompting-to-install-repeatedly.md).

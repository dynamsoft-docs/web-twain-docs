---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error message - Permission was denied for this request to access the unknown address space
keywords: Dynamic Web TWAIN, Error Troubleshooting, CORS, unknown address space, Chromium, 142
breadcrumbText: Error message - Permission was denied for this request to access the unknown address space
description: CORS unknown address space
date: 2025-11-04 17:21:42 +0800
last_modified: 2026-02-12 10:20:00 -0800
---

# Error Troubleshooting

> [!IMPORTANT]
> This is an evolving browser behavior. Details in this article may change as Chromium updates Local Network Access.

## Error message - CORS errors caused by local network access permissions in Chromium 142 and later

### Overview

Local Network Access (LNA) is a browser security model that has been enforced in Chromium-based browsers since version 142 (released October 28, 2025), including Chrome, Edge, Brave, and Opera. It blocks web apps from reaching local or loopback targets unless the user explicitly grants permission, which can affect Dynamic Web TWAIN Service behavior.

These restrictions limit requests from **public network locations** to **local or loopback locations** unless the required site permission is granted.

Starting in **Chrome 145**, the site-setting label changed from one local network access permission  to two:

- `loopback-network` shown as **Apps on device**
- `local-network` shown as **Local Network**

Dynamic Web TWAIN Service communicates with `localhost` / `127.0.0.1`, so **Apps on device** (`loopback-network`) is the key permission for most deployments.

When your page first requests local access, Chromium will show an LNA permission prompt.  
This FAQ and the symptoms below apply when users dismiss this prompt or click **Block**.

![LNA prompt](/assets/imgs/local-network-access/LNA-prompt.png)

### Symptoms

If the initial LNA prompt is dismissed or blocked, you may experience one or more of the following:

#### **1) Browser repeatedly prompts to download the service**
The browser asks the user to download/install the Dynamic Web TWAIN Service even though it is already installed.

![DWT_installer.png](/assets/imgs/DWT_installer.png)

#### **2) Initialization succeeds, but scanning / loading returns blank**
Initialization appears successful, but scanned or loaded images are blank.

The browser console (`F12` -> `Console`) may show a CORS denial similar to:

```shell
Access to fetch at 'https://127.0.0.1:18623/fa/VersionInfo?ts=1761893667670'
from origin 'https://your-domain.com' has been blocked by CORS policy:
Permission was denied for this request to access the `unknown` address space.
```

This happens because a page on a public origin (for example, `https://your-domain.com`) is trying to access a loopback address (`127.0.0.1`), which Chromium now treats as a protected local-network request.

---

#### Version-Specific Behavior

Observed behavior depends on Chromium version and Dynamic Web TWAIN (DWT) version:

| Browser Version  | DWT Version | Resulting Symptom           |
|------------------|-------------|-----------------------------|
| Chromium 142+ | < 18.5.0    | Download Prompt             |
| Chromium 142+ | >= 18.5.0, < 19.3   | Blank Images after Scanning |
| Chromium 142+ | >= 19.3   | Permission Prompt |
| Chromium future version blocking WebSocket(*) | Any   | Download Prompt |

> [!NOTE]
> (*) Blocking WebSocket requests is on Chromium's roadmap, and may be enforced in a future release.  
> Other browsers are also introducing local network permission controls.

### Root Cause

Chromium 142 introduced [Local Network Access (LNA)](https://chromestatus.com/feature/5152728072060928), which restricts requests from public network locations to local/loopback network locations unless permission is granted.

> [!NOTE]
> For background and design rationale, see Chrome's developer blog: [New permission prompt for Local Network Access](https://developer.chrome.com/blog/local-network-access).

Under this model, requests from a public origin (a publicly hosted site) to local or loopback targets (including `localhost` and `127.0.0.1`) can be blocked by default.

Dynamic Web TWAIN relies on a locally installed service that listens on a loopback address. If browser permission is not granted, communication with that local service fails.

### Resolution

> [!WARNING]
> This is driven by browser security policy decisions. Dynamic Web TWAIN cannot bypass these restrictions programmatically.
> Browser behavior will continue evolving, and temporary workarounds may be removed in future versions. You should plan your deployment and UX flow around current browser permission requirements.

***1. To manually correct this in Chrome***

- Navigate to your Dynamic Web TWAIN page.
- Click the lock/settings icon in the browser address bar.
- In **Chrome 142-144**, ensure **Local Network Access** (`local-network-access`) is `Allow`.
- In **Chrome 145+**, check:
  - **Apps on device** (`loopback-network`) is `Allow` (required for `localhost` / `127.0.0.1`)
  - **Local Network** (`local-network`) is `Allow` only if your app also needs private-network device access

![local-network.png](/assets/imgs/local-network-access/local-network.png)

> [!NOTE]
> Chrome updates permission popup UI frequently. Starting with Dynamic Web TWAIN **v19.3.1**, static screenshots were removed from built-in popups.
> For the latest browser-specific screenshots, see:
> [https://dynamsoft.github.io/Dynamic-Web-TWAIN/local-network-access.html](https://dynamsoft.github.io/Dynamic-Web-TWAIN/local-network-access.html)

***2. (For Admins) Apply this setting across an enterprise***

Enterprise administrators can deploy Chrome and/or Edge policies to set local-network permission to `Allow` for your website.

Please refer to:
- [Chrome Enterprise Policy List and Management Documentation](https://chromeenterprise.google/policies/#LocalNetworkAccessAllowedForUrls)
- [Microsoft Edge Browser Policy Documentation](https://learn.microsoft.com/en-us/deployedge/microsoft-edge-browser-policies/localnetworkaccessallowedforurls)

***3. Developer Notes***

**a) If running inside an `iframe`**

> [!IMPORTANT]
> If Dynamic Web TWAIN runs inside a cross-origin iframe, `loopback-network` permissions must be explicitly allowed in the iframe `allow` attribute.
> If the iframe is same-origin, no additional iframe permission configuration is required.

For Chrome 145+, use `loopback-network` (and `local-network` only if needed). For older versions, include `local-network-access`.

```html
<!-- Recommended: explicitly list only required origins and permissions -->
<iframe
  src="..."
  allow="loopback-network https://your-domain.com; local-network https://your-domain.com; local-network-access https://your-domain.com">
</iframe>

<!-- Not recommended: wildcard -->
<!-- <iframe src="..." allow="loopback-network *; local-network *; local-network-access *"></iframe> -->
```

**b) (Optional enhancement) Permission check for improved UX**

You can optionally query LNA permissions at runtime. This is not required, but it can help you guide users before initialization fails.

```javascript
// Helper: query the first supported permission name from a list.
async function queryFirstSupportedPermission(names) {
  for (const name of names) {
    try {
      const result = await navigator.permissions.query({ name });
      return { name, state: result.state };
    } catch (_) {
      // Not supported in this browser version.
    }
  }
  return null;
}

(async () => {
  // Chrome 145+: loopback-network; Chrome 142-144: local-network-access.
  const loopbackPerm = await queryFirstSupportedPermission([
    "loopback-network",
    "local-network-access"
  ]);

  if (!loopbackPerm) {
    console.log("This browser does not expose the Local Network permission API.");
    // Fallback: initialize DWT directly.
    return;
  }

  console.log(`Loopback permission (${loopbackPerm.name}): ${loopbackPerm.state}`);

  if (loopbackPerm.state === "denied") {
    const currentSite = encodeURIComponent(window.location.origin);
    const settingsUrl = `chrome://settings/content/siteDetails?site=${currentSite}`;
    console.log(
      "Local network permission is denied.\n" +
      `Open: ${settingsUrl}\n` +
      "Then allow Local Network for this site."
    );
    return;
  }

  if (loopbackPerm.state === "prompt") {
    alert(
      "To connect with the local scanning service, Chrome may ask for Local Network permission. " +
      "Please click Allow when prompted."
    );
  }

  // Proceed with DWT initialization.
  // e.g., Dynamsoft.DWT.Load() or CreateDWTObjectEx(...)
})();
```

If permission is not granted, direct users to:

> Chrome -> Settings -> Privacy and security -> Site settings -> Local Network / Apps on device

### Product Improvements Related to Local Network Access

Starting from v19.3, Dynamic Web TWAIN now includes UX enhancements to better surface local-service connectivity and permission issues.

These changes do not alter or bypass Chromium's security model. They make permission-related failures easier to identify and guide users to the correct browser settings.

The key improvements include:

- **Explicit detection of blocked local network access**  
  When the browser blocks communication with the local service, a clear dialog explains the cause and directs users to this FAQ.

  ![prompt blocked](/assets/imgs/local-network-access/prompt-blocked.png)

  *Dialog 1 - Permission Guidance*

- **Clearer messaging during service installation**  
  The service installation dialog explains that connection failure may be caused either by missing service installation or denied local-network permission.

  ![dialog installation](/assets/imgs/local-network-access/service-installation-dialog.png)

  *Dialog 2 - Service Installation*

- **Latest popup screenshots hosted externally (v19.3.1+)**  
  Because Chromium updates native permission popups frequently, static popup screenshots were removed from this FAQ in v19.3.1.
  Use this page for the latest screenshots:
  [https://dynamsoft.github.io/Dynamic-Web-TWAIN/local-network-access.html](https://dynamsoft.github.io/Dynamic-Web-TWAIN/local-network-access.html)

These improvements are available starting with Dynamic Web TWAIN v19.3.

For older versions, a supplemental JavaScript file can be provided on request by contacting [Dynamsoft Support](mailto:support@dynamsoft.com).

> [!NOTE]
> This supplemental JavaScript file improves user guidance only and does not change browser permission requirements.

## Other Causes of Failure to Connect to the Service

There are other causes of service connection failure. See [another FAQ](/_articles/faq/service-prompting-to-install-repeatedly.md).

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error message - Permission was denied for this request to access the unknown address space
keywords: Dynamic Web TWAIN, Error Troubleshooting, CORS, unknown address space, chrome, 142
breadcrumbText: Error message - Permission was denied for this request to access the unknown address space
description: CORS unknown address space
date: 2025-11-04 17:21:42 +0800
last_modified: 2025-11-04 17:21:42 +0800
---

# Error Troubleshooting

> [!IMPORTANT]
> This is a newly developing issue, and as such the information in this article may change over time.

## Error message - Access to fetch at `https://127.0.0.1:18623` or `http://127.0.0.1:18622` has been blocked by CORS policy: Permission was denied for this request to access the unknown address space.

### Symptom

When using browsers based on Chromium version 142 (released on October 28th, 2025) or later (including but not limited to Edge, Brave, and Opera), the Dynamsoft Web TWAIN Service installation cannot be detected, prompting the Dynamsoft Web TWAIN Service installation modal. Installing the service does not fix the issue.

You may also encounter the following error message in the browser console:

```shell
Access to fetch at 'https://127.0.0.1:18623/fa/VersionInfo?ts=1761893667670' from origin 'https://your-domain.com' has been blocked by CORS policy: Permission was denied for this request to access the `unknown` address space.
```

### Cause

In Chromium 142 Google introduced a new Local Network Access security policy. Requests from web pages hosted within iframes to local addresses such as 127.0.0.1 or localhost get blocked unless explicit permission is granted.

This affects the Dynamic Web TWAIN Service which relies on local services for communication.

### Solution

<div class="multi-panel-switching-prefix"></div>

- [Quick Solution for End Users](#Quick Solutions for End Users)
- [Solutions for Developers](#Solutions for Developers)

<div class="multi-panel-start"></div>

**Enable Local Network Access**

Make sure your website has Local Network Access enabled.

![local-network.png](/assets/imgs/local-network.png)

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

**Option 1:**

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

**Option 2: (For Enterprise Users)**

Enterprise administrators can allow specified URLs to access local resources through Chrome’s Enterprise Policy configuration.
Refer to: [Chrome Enterprise Policy List & Management | Documentation](https://chromeenterprise.google/policies/)

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>

### Planning

Dynamsoft plans to add a feature that automatically detects local service connectivity and permission status. If the connection is blocked, users will be prompted with a message and directed to this FAQ page.

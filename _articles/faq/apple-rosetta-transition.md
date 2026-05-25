---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
needGenerateH3Content: true
title: macOS Rosetta Discontinuation and Dynamic Web TWAIN Service
keywords: Dynamic Web TWAIN Service, Rosetta, macOS
breadcrumbText: macOS Rosetta Discontinuation and Dynamic Web TWAIN Service
description: macOS Rosetta Discontinuation and Dynamic Web TWAIN Service
date: 2026-05-22 17:21:42 +0800
last_modified: 2026-05-22 10:20:00 -0800
---

# Error Troubleshooting

## macOS Rosetta Discontinuation and Dynamic Web TWAIN Service

### Overview

Apple has announced that Rosetta support for Intel-based applications will be phased out in future macOS releases. Rosetta will remain fully available through macOS 27. Starting with macOS 28, Intel-only applications will no longer be supported.

Starting with macOS 26.4, users may also see system notifications warning that Intel-based applications will not be supported in future macOS versions.

![system notification from macOS](/assets/imgs/Intel-based-service.jpg)

### What is Apple’s timeline?

| macOS Version | Expected Availability | Rosetta Status |
|---|---|---|
| macOS 26.4+ | Already released | System notifications appear for Intel-only apps |
| macOS 27 | September 2026 | Rosetta remains fully functional — last version to support it |
| macOS 28 | 2027 | Intel-only apps will no longer run on Apple Silicon Macs |

For the official Apple announcement, see: [Using Intel-based apps on a Mac with Apple silicon — Apple Support](https://support.apple.com/en-us/102527)

### Does Dynamic Web TWAIN Service still work on macOS?

Yes. The current version of Dynamic Web TWAIN Service continues to function normally on supported macOS versions, including macOS 26 and macOS 27.

### What is Dynamsoft doing to address this?

Dynamsoft is actively developing a Universal Binary version of Dynamic Web TWAIN Service with native Apple Silicon support.

This enhancement is currently planned for the **Dynamic Web TWAIN 19.4 release (ETA: June 2026)**, with the goal of ensuring full compatibility before the general availability of macOS 27.

### I'm on Dynamic Web TWAIN v18.x. Do I need to upgrade my SDK to v19.4+?

Not necessarily. The v19.4 service installer includes the **DWT 18.6 service module**, which is **backward compatible with DWT 18.x**. This means you can install the v19.4 Dynamic Web TWAIN Service on end-user machines to get Apple Silicon native support while continuing to use your existing v18.x SDK integration.

You do not need to change your application code or upgrade your JavaScript SDK to v19 just to resolve the Rosetta notification.

### Do end-user need to take any action now?

No immediate action is required. Customers can continue using the current version normally and are encouraged to upgrade to the future Universal Binary release once available.

### How do I deploy the updated service to end users?

The deployment process is the same as the current service. Once v19.4 is released, download the updated macOS service installer and distribute it to your end users. If you use silent installation or enterprise deployment methods, the process remains the same — only the installer binary changes.

For details on deployment options, see: [How to deploy the end-user components to all users](/_articles/faq/deploy-to-all-users.md)

### Do I need to renew my license or maintenance to get the update?

- **Active annual license or maintenance plan**: You are entitled to upgrade to v19.4 at no additional cost. Download and deploy the updated service installer when it becomes available.
- **Perpetual license without active maintenance**: You will need to renew your maintenance plan to access the v19.4 release. Please contact [Dynamsoft Sales](https://www.dynamsoft.com/company/contact/) to discuss renewal options.

### Does this affect Intel-based Macs?

No. Intel-based Macs run Intel binaries natively without Rosetta. The current service installer continues to work on Intel-based Macs regardless of macOS version.

> Note: Apple has announced that macOS 26 is the last macOS release to support Intel-based Mac hardware.
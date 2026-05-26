---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
needGenerateH3Content: true
title: Apple Rosetta Transition and Dynamic Web TWAIN Service on macOS
keywords: Dynamic Web TWAIN Service, Rosetta, macOS, Apple Silicon, Universal Binary, Intel, arm64
breadcrumbText: Apple Rosetta Transition and Dynamic Web TWAIN Service on macOS
description: Apple is phasing out Rosetta for Intel apps on Apple Silicon Macs. Learn how this affects the Dynamic Web TWAIN Service and what steps to take.
date: 2026-05-22 17:21:42 +0000
last_modified: 2026-05-22 10:20:00 -0800
---

# Error Troubleshooting

## Apple Rosetta Transition and Dynamic Web TWAIN Service on macOS

### Overview

Apple is phasing out [Rosetta](https://support.apple.com/en-us/102527), the translation layer that allows Intel-based applications to run on Apple Silicon Macs. Starting with **macOS 26.4**, users may see a system notification when launching apps that rely on Rosetta. Intel-only apps will continue to function through **macOS 27**, with support ending in **macOS 28**.

The **Dynamic Web TWAIN Service** — the native macOS component installed on end-user machines — currently ships as an Intel binary. This means users on Apple Silicon Macs running macOS 26.4 or later may see an Apple notification about the service. **The service continues to work normally** — the notification is informational only.

Dynamsoft is releasing a **Universal Binary** version of the service in **Dynamic Web TWAIN v19.4**, targeted for **June 2026**, well ahead of the macOS 28 deadline.

### What is Apple's timeline?

| macOS Version | Expected Availability | Rosetta Status |
|---|---|---|
| macOS 26.4+ | Already released | System notifications appear for Intel-only apps |
| macOS 27 | September 2026 | Rosetta remains fully functional — last version to support it |
| macOS 28 | 2027 | Intel-only apps will no longer run on Apple Silicon Macs |

For the official Apple announcement, see: [Using Intel-based apps on a Mac with Apple silicon — Apple Support](https://support.apple.com/en-us/102527)

### I see an Apple notification saying the Dynamsoft Service needs to be updated. Is it broken?

No. The notification is an informational warning from macOS — it does not mean the Dynamic Web TWAIN Service is broken or will stop working. The service continues to function normally on macOS 26.4 and macOS 27.

![system notification from macOS](/assets/imgs/Intel-based-service.jpg)

The notification appears because the current service installer is an Intel binary running through Rosetta on Apple Silicon Macs. Once you upgrade to a version that includes the Universal Binary service (v19.4+), the notification will no longer appear.

### What is Dynamsoft doing to address this?

Dynamsoft is releasing a **Universal Binary** version of the Dynamic Web TWAIN Service with native Apple Silicon support. This means the service will run natively on both Apple Silicon and Intel-based Macs, eliminating the Rosetta dependency and the macOS notification.

This enhancement is planned for the **Dynamic Web TWAIN v19.4 release (ETA: June 2026)**, ahead of the macOS 27 general availability (September 2026) and well ahead of the macOS 28 hard cutoff.

### Which component is affected?

Only the **Dynamic Web TWAIN Service** (the native macOS installer/daemon) is affected. The JavaScript SDK itself runs in the browser and is not impacted by the Rosetta transition.

### I'm on Dynamic Web TWAIN v18.x. Do I need to upgrade my SDK to v19?

Not necessarily. The v19.4 service installer includes the **DWT 18.6 service module**, which is **backward compatible with DWT 18.x**. This means you can install the v19.4 Dynamsoft Service on end-user machines to get Apple Silicon native support while continuing to use your existing v18.x SDK integration.

You do not need to change your application code or upgrade your JavaScript SDK to v19 just to resolve the Rosetta notification.

### Do I need to renew my license or maintenance to get the update?

- **Active annual license or maintenance plan**: You are entitled to upgrade to v19.4 at no additional cost. Download and deploy the updated service installer when it becomes available.
- **Perpetual license without active maintenance**: You will need to renew your maintenance plan to access the v19.4 release. Please contact [Dynamsoft Sales](https://www.dynamsoft.com/company/contact/) to discuss renewal options.

### What is the actual deadline? Do I need to act now?

There is no immediate urgency, but we recommend planning your upgrade now:

1. **Now (macOS 26.4+)**: Users on Apple Silicon Macs may see an Apple notification. The service works fine — the notification is informational.
2. **June 2026 (DWT v19.4 release)**: Universal Binary service available. Deploying this eliminates the notification.
3. **September 2026 (macOS 27 GA)**: Rosetta still fully supported. No functionality impact.
4. **2027 (macOS 28)**: Intel-only apps stop working on Apple Silicon Macs. You **must** have the Universal Binary service deployed before this point.

We recommend upgrading to v19.4 promptly after release to eliminate the Apple notification and ensure a smooth experience for your end users.

### Does this affect Intel-based Macs?

No. Intel-based Macs run Intel binaries natively without Rosetta. The current service installer continues to work on Intel-based Macs regardless of macOS version.

> Note: Apple has announced that macOS 26 is the last macOS release to support Intel-based Mac hardware.

### How do I deploy the updated service to end users?

The deployment process is the same as the current service. Once v19.4 is released, download the updated macOS service installer and distribute it to your end users. If you use silent installation or enterprise deployment methods, the process remains the same — only the installer binary changes.

For details on deployment options, see: [How to deploy the end-user components to all users](/_articles/faq/deploy-to-all-users.md)

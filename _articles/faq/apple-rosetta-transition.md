---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
needGenerateH3Content: true
title: Apple Rosetta Transition and Dynamic Web TWAIN Service on macOS
keywords: Dynamic Web TWAIN Service, Rosetta, macOS
breadcrumbText: Apple Rosetta Transition and Dynamic Web TWAIN Service on macOS
description: Apple Rosetta Transition and Dynamic Web TWAIN Service on macOS
date: 2026-05-22 17:21:42 +0800
last_modified: 2026-05-22 10:20:00 -0800
---

# Error Troubleshooting

## Apple Rosetta Transition and Dynamic Web TWAIN Service on macOS

### Overview

Apple has announced that Rosetta support for Intel-based applications will be phased out in future macOS releases. Rosetta will remain fully available through macOS 27. Starting with macOS 28, Intel-only applications will no longer be supported.

Starting with macOS 26.4, users may also see system notifications warning that Intel-based applications will not be supported in future macOS versions.

![system notification from macOS](/assets/imgs/Intel-based-service.jpg)

### What is Apple’s timeline?

| macOS Version | Status |
|---|---|
| macOS 26.4+ | Rosetta warning notifications appear |
| macOS 27 | Rosetta remains fully supported |
| macOS 28 | Intel-only applications will no longer be supported |

More details:  
https://support.apple.com/en-us/102527

### Does Dynamic Web TWAIN Service still work on macOS?

Yes. The current version of Dynamic Web TWAIN Service continues to function normally on supported macOS versions, including macOS 26 and macOS 27.

### Do end-user need to take any action now?

No immediate action is required. Customers can continue using the current version normally and are encouraged to upgrade to the future Universal Binary release once available.

### What is Dynamsoft doing to address this?

Dynamsoft is actively developing a Universal Binary version of Dynamic Web TWAIN Service with native Apple Silicon support.

This enhancement is currently planned for the **Dynamic Web TWAIN 19.4 release (ETA: June 2026)**, with the goal of ensuring full compatibility before the general availability of macOS 27.

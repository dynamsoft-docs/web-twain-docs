---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Will a client machine take an additional license seat if its operating system is reinstalled?
keywords: Dynamic Web TWAIN, Licensing and Purchase, operating system reinstalled
breadcrumbText: Will a client machine take an additional license seat if its operating system is reinstalled?
description: Will a client machine take an additional license seat if its operating system is reinstalled?
date: 2021-12-04 02:34:30 +0800
last_modified: 2022-06-02 15:30:49 +0800
---

# Licensing and Purchase

## Will a client machine take an additional license seat if its operating system is reinstalled?

Yes, When a client device is licensed, a random UUID is issued to the client device. Reinstalling the device OS would erase the UUID, so if the device accesses the SDK feature again, it will take a new UUID – i.e. a new license seat will be taken.

However, if an UUID has no usage of the SDK for consecutive 90 days, the license seat taken by the UUID will be automatically released. Furthermore, our Per-Client-Device license allows you to overuse up to an additional 10% of the purchased device quota, which helps relieve minor misuse or device reinstallation. For example, if you purchase a license for 100 client devices, you can actually license 110 devices.

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How to use TWACKER to check if your device is TWAIN Compliant
keywords: Dynamic Web TWAIN, Capture/ Image Source, verify scanner, compatible, TWACKER, TWAIN Compliant
breadcrumbText: How to use TWACKER to check if your device is TWAIN Compliant
description: How to use TWACKER to check if your device is TWAIN Compliant
---

# Capture/Image Source

## How to use TWACKER to check if your device is TWAIN Compliant?

- [Recommended] Use the tool called `Twacker` which is developed by the [TWAIN Working Group](https://www.twain.org/)

  - Download and install

    > Please download the version of TWACKER that matches your driver architecture, not your operating system architecture. In most cases, this will be 32-bit.

    - [32-bit](https://download.dynamsoft.com/tool/Twack_32.msi)
    - [64-bit](https://download.dynamsoft.com/tool/Twack_64.msi)

  - Open the program

![Hardware-Scanners-Cameras-6]({{site.assets}}imgs/Hardware-Scanners-Cameras-6.png)

- Select your device

![Hardware-Scanners-Cameras-7]({{site.assets}}imgs/Hardware-Scanners-Cameras-7.png)

> If your device is not listed, please check if the driver is installed. Or, try running `Twacker` as admin to see if it shows up.

- Choose the settings and click the Acquire to start scanning

![Hardware-Scanners-Cameras-8]({{site.assets}}imgs/Hardware-Scanners-Cameras-8.png)

> If scanning is successful without any errors, then your device should be TWAIN compliant. You can also try other commands to see how it works. If your scanner doesn't work with `TWACKER` , please check your scanner model online and make sure you have installed the (latest) TWAIN driver from its manufacturer.

![Hardware-Scanners-Cameras-9]({{site.assets}}imgs/Hardware-Scanners-Cameras-9.png)

- Refer to the official [twain-certified-drivers](https://resource.twain.org/twain-certified-drivers/).

> This list is maintained by hardware vendors and may be incomplete. In this case, try the two ways above instead.

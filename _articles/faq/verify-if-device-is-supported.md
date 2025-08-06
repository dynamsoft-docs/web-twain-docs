---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I verify if my physical document scanner works with the Dynamic Web TWAIN SDK?
keywords: Dynamic Web TWAIN, Capture/ Image Source, verify scanner, compatible
breadcrumbText: How can I verify if my physical document scanner works with the Dynamic Web TWAIN SDK?
description: How can I verify if my physical document scanner works with the Dynamic Web TWAIN SDK?
date: 2021-12-08 03:01:32 +0800
---

# Capture/Image Source

## How can I verify if my physical document scanner works with the Dynamic Web TWAIN SDK?

Dynamsoft supports the following types of scanners

- TWAIN Scanners (for Windows)
- ICA Scanners (for macOS)
- SANE Scanners (for Linux)

There are two ways to check if a physical document scanner is compatible:

<strong>1) Verify via Dynamsoft's Online Demo</strong>

The fastest and most convenient way is to check using our <a href="https://demo.dynamsoft.com/web-twain/" target="_blank">online demo</a>, which is built based on the Dynamic Web TWAIN SDK. If your scanner shows in the source list and can scan documents properly, it means it works well with our SDK.

![source check using demo](/assets/imgs/source-check-using-demo.png)

<strong>2) Use Native Program to Verify</strong>

### For Windows

Use the tool called Twacker which is developed by the <a href="https://www.twain.org/" target="_blank">TWAIN Working Group</a> to verify if a scanner is TWAIN compatible on a Windows machine.

1. Download and install
   (Note: Please download the version of TWACKER that matches your driver architecture, not your operating system architecture. In most cases, it would be 32-bit.)
   - <a href="https://download.dynamsoft.com/tool/Twack_32.msi" target="_blank">32-bit</a>
   - <a href="https://download.dynamsoft.com/tool/Twack_64.msi" target="_blank">64-bit</a>
2. Open the program
3. Select your device from File -> Select Source...
   (Note: If your device is not listed, please check if the driver is installed. Or, try running Twacker as admin to see if it shows up.)
4. Try scanning a document via Acquire...

![source check using Twacker](/assets/imgs/source-check-using-twacker.png)

If scanning is successful without any errors, then your device should be TWAIN compliant. You can also try other commands to see how it works. If your scanner doesn't work with TWACKER, please check your scanner model online and make sure you have installed the (latest) TWAIN driver from its manufacturer.

### For macOS

Use the ImageCapture app (provided by Apple Inc.) to verify if a scanner is ICA compatible on a macOS machine.

1. Find the Image Capture application

   ![source check using mac](/assets/imgs/source-check-using-mac.png)

2. Open the application
3. Acquire an image and see how it works

   ![source check using mac 2](/assets/imgs/source-check-using-mac-2.png)

For more info, please check out the <a href="https://support.apple.com/en-ca/guide/image-capture/imgcp1004/mac" target="_blank">official guide</a>.

### For Linux

Use the XSane app to verify if a scanner is SANE compatible on a Linux machine.
Please check out the <a href="http://www.fifi.org/doc/xsane/html/sane-xsane-doc.html" target="_blank">official guide</a> and <a href="/assets/docs/Scanning_with_XSane.pdf" target="_blank">this document</a> for more detail.

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Why are my images coming out distorted in MacOS Sonoma?
keywords: Dynamic Web TWAIN, MacOS, Sonoma, Colour, Grayscale, Greyscale, distorted
breadcrumbText: Why are my images coming out distorted in MacOS Sonoma?
description: Why are my images coming out distorted in MacOS Sonoma?
date: 2023-10-14 02:40:37 +0800
---

# MacOS Sonoma issue identified

## Symptoms

The user may see distorted, duplicated, or ghost copies of the image when acquiring the scan on MacOS while using Dynamic Web TWAIN 18.4 or below.

## Background

ICA are the drivers that are put out by the manufacturers to specifically work with the [ImageCaptureCore](https://developer.apple.com/documentation/imagecapturecore) specification on the Mac platform. Generally, the ICA drivers are bundled with MacOS and are updated with MacOS updates. Some manufacturers will make ICA drivers available for their scanners through their own support portals. 

It has been discovered that with the release of MacOS Sonoma (MacOS 14.0), Dynamic Web TWAIN may behave unexpectedly when acquiring images using ICA drivers. We have investigated and it seems that there was a change in how ICA drivers respond to Dynamic Web TWAIN commands. Based on this information, it would be recommended to avoid upgrading to Sonoma, if possible. However, Dynamsoft understands that many end users will automatically upgrade and therefore adjustments to Dynamic Web TWAIN must be made.

## Solution

1) The recommended solution is to download and install the TWAIN driver from the scanner manufacturer, and use the TWAIN driver.

2) Dynamsoft understands that not all manufacturers provide TWAIN drivers for MacOS. Therefore, Dynamsoft has released Dynamic Web TWAIN 18.4.1 which includes an updated Dynamic Web TWAIN Service (also called "Dynamsoft Service") for MacOS that should help alleviate the issue. Please upgrade to Dynamic Web TWAIN 18.4.1 to utilize this updated Dynamic Web TWAIN Service.
---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Document Scanning SDK | Dynamic Web TWAIN Documentation
keywords: Dynamic Web TWAIN, TWAIN, About, Documentation
breadcrumbText: Dynamic Web TWAIN Intro
description: Dynamic Web TWAIN SDK Documentation. This will help you integrate document scanning into your app, no matter whether you are building a workflow from scratch or optimizing an existing workflow.
permalink: /introduction/index.html
---

<!-- Preamble
Explain how we achieve highest hardware compatibility
Customize or ajust to fit specific devices
Explain how we achieve Cross-Platform Cross-Browser Compatibility
The design of a browser-independent service which is made available on different operating systems
Localhost, LAN host or remote host usage of the service
Clarify the intention of the built-in viewer
A way to interact with document images and call upon the service for simple document management
Illustrate the reason for the image management features
Simple image editing / decoding /encoding /uploading allows for a business solution to be created without involving another vendor's product
Lastly, present extendable capabilities
Dynamsoft offers other image processing modules that can be integrated to offer more capabilities such as barcode reading, text recognition and more


- Give introduction on purpose and functions of product
  - Key point 1: Utilize physical scanners in browsers for document acquisition
  - Key point 2: Built-in viewer & simple document management
  - Clarify the intention of the built-in viewer
- Adherence to industry standards
- Customizable for specific devices
- Quick overview on platform support and web framework support
- Broad hardware compatibility, cross-platform, cross-browser
- Justify inclusion of image viewer image management features
  - Bundle commonly used tools together within same SDK
- Pros of Dynamsoft Service
  - Allows for easy cross platform capabilities, flexible usage of network scanners
  - Local host, over LAN, or remote connection to web app
  - Carry out some background processing outside of the web application for higher performance
- Synergize with other Dynamsoft products (link) -->

# Introduction

**Dynamsoft Dynamic Web TWAIN** (DWT) is a software development kit (SDK) that enables users to scan and upload documents from a **web environment**. DWT handles the whole data flow, from image acquisition at the scanner, to displaying and editing scanned images in the browser, and finally uploading to the server.

Here we provide a series of usage guides, so that you can quickly start making use of both basic and advanced features of DWT with just a few lines of code - see our [general usage]({{site.general-usage}}index.html) and [extended usage]({{site.extended-usage}}index.html) guides for more. You can also use our [Hello World]({{site.hello-world}}index.html) demo that demonstrates how to enable basic scanning, viewing, and uploading functionality in a web application.

DWT add-ons provide additional features such as scanning using a webcam video feed, document barcode reading, and PDF rasterization. <!-- You can learn more about add-ons and licensing [here](../add-ons/). -->

We also have an<!-- [knowledge base](../knowledge-base/) --> [API reference]({{site.api}}index.html) where you can find more comprehensive descriptions of our product.

## Key Features

1. Platform support:
    - Broad compatibility with browsers, operating systems, and image sources
2. Image acquisition:
    - Connect to scanners from web browser with industry standard protocols
    - Communicate with scanners using a background service ([The Dynamsoft Service]({{site.faq}}what-does-dynamsoft-service-do-on-end-user-machine.html)) with flexible configurations
3. Image upload:
    - Upload over HTTP, HTTPS (HTTP + TLS), and FTP
    - Optionally upload large files through background service
4. Document management:
    - Configurable document viewer for scanned images
    - Visual editor for reordering, marking up, cropping images, etc.
5. Secure data handling:
    - Encrypted data pipeline <!-- is data encrypted in in motion and at rest? -->
    - Cache sanitization even upon unexpected shutdown of SDK

## [System Requirements]({{site.introduction}}system-requirements.html)
DWT supports most major operating systems, browsers, and printers using standard drivers. Learn more about hardware requirements [here]({{site.introduction}}imaging-hardware.html). Other environments not officially listed may still support DWT, but Dynamsoft does not officially support these environments as they are not tested. If you have questions about unofficially supported environments, please contact our [support team]({{site.about}}getsupport.html) for more information.


<!--
| **Supported Operating Systems**                 | **Supported Browsers**                                                      | **Supported Image Source Drivers**  | **Supported Web Frameworks**  |
| ------------------------------------------------ | ---------------------------------------------------------------------------- | ------------------------------------ | ------------------------------ |
| - Windows <br> - Linux<br> - MacOS<br> - Android | - Firefox<br>- Chrome<br>- Safari<br>- Microsoft Edge<br>- Internet Explorer | - TWAIN<br>- ICA<br>- SANE<br>- eSCL | - Angular<br> - React<br>- Vue<br> - etc. |

<br/>
<link rel="stylesheet" href="https://www.dynamsoft.com/webres/wwwroot/css/dwt/features.css" />
<div class="dwt-features">
    <main>
        <table class="support-table mt80">
            <thead>
                <tr>
                    <th>Supported Client-Side OS</th>
                    <th>Technology</th>
                    <th colspan="4" class="hide-md hide-sm">Supported Client-Side Browsers</th>
                    <th class="show-md show-sm">Supported Client-Side Browsers</th>
                    <th>Supported Frameworks</th>
                    <th>
                        Supported Server-Side OS
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <p class="f16">Windows 7 or later; <br> 32-bit and 64-bit</p>
                    </td>
                    <td>
                        <ul class="tags">
                            <li><p>eSCL</p></li>
                            <li><p>TWAIN</p></li>
                            <li><p>WIA</p></li>
                        </ul>
                        <p>HTML5 & ActiveX;</p>
                    </td>
                    <td class="show-md show-sm">
                        <p>Firefox v68+</p>
                        <p>Chrome v68+</p>
                        <p>IE 9+</p>
                        <p>Microsoft Edge</p>
                    </td>
                    <td class="hide-md hide-sm">
                        <i class="firefox"></i>
                        <p>Firefox v68+</p>
                    </td>
                    <td class="hide-md hide-sm">
                        <i class="chrome"></i>
                        <p>Chrome v68+</p>
                    </td>
                    <td class="hide-md hide-sm">
                        <i class="ie"></i>
                        <p>IE 9+</p>
                    </td>
                    <td class="hide-md hide-sm">
                        <i class="edge"></i>
                        <p>Microsoft Edge</p>
                    </td>
                    <td rowspan="5" style="border: 1px solid #707070;vertical-align: top;border-right: 0;">
                        <p>Works with all common JavaScript frameworks, like <a href="https://github.com/dynamsoft-dwt/vue-document-scan-load-readBarcode" target="_blank" class="orangeLink">Vue.js</a>, <a href="https://github.com/Dynamsoft/web-twain-angular-cli-application" target="_blank" class="orangeLink">Angular</a>, <a href="https://github.com/Dynamsoft/web-twain-react-advanced" target="_blank" class="orangeLink">React</a>, as well as Vanilla (plain) JavaScript</p>
                        <p>
                            <i class="vue"></i>
                            <i class="angular"></i>
                            <i class="react"></i>
                        </p>
                    </td>
                    <td rowspan="5" style="border: 1px solid #707070;vertical-align:top;">
                        <p>All, including</p>
                        <p>
                            <i class="windows"></i>
                            <i class="linux"></i>
                            <i class="macos"></i>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p class="f16">
                            x86-64, ARM64 <br>
                            <a class="orangeLink" href="https://www.dynamsoft.com/web-twain/features/scan-documents-mac-browsers/">Mac</a> OS X 10.6.8+
                        </p>
                    </td>
                    <td>
                        <p class="detail">
                            </p><ul class="tags">
                                <li><p>eSCL</p></li>
                                <li><p>TWAIN</p></li>
                                <li><p>ICA</p></li>
                            </ul>
                            HTML5;
                        <p></p>
                    </td>
                    <td class="show-md show-sm">
                        <p>Firefox v68+</p>
                        <p>Chrome v68+</p>
                        <p>Safari v7+</p>
                    </td>
                    <td class="hide-md hide-sm">
                        <i class="firefox"></i>
                        <p>Firefox v68+</p>
                    </td>
                    <td class="hide-md hide-sm">
                        <i class="chrome"></i>
                        <p>Chrome v68+</p>
                    </td>
                    <td class="hide-md hide-sm">
                        <i class="safari"></i>
                        <p>Safari v7+</p>
                    </td>
                    <td class="hide-md hide-sm"></td>
                </tr>
                <tr>
                    <td>
                        <p class="f16">
                            <a class="orangeLink" href="https://www.dynamsoft.com/web-twain/features/web-document-scanning-sdk-linux/">Linux</a>
                            x64, <a class="orangeLink" href="https://www.dynamsoft.com/web-twain/arm-64/" target="_blank">ARM64</a>, MIPS Ubuntu 12.0.4+, Debian 8+, Fedora 24+, 64-bit
                        </p>
                    </td>
                    <td>
                        <p class="detail">
                            </p><ul class="tags grid-2">
                                <li><p>eSCL</p></li>
                                <li><p>SANE</p></li>
                            </ul>
                            HTML5;
                        <p></p>
                    </td>
                    <td class="show-md show-sm">
                        <p>Firefox v68+</p>
                        <p>Chrome v68+</p>
                    </td>
                    <td class="hide-md hide-sm">
                        <i class="firefox"></i>
                        <p>Firefox v68+</p>
                    </td>
                    <td class="hide-md hide-sm">
                        <i class="chrome"></i>
                        <p>Chrome v68+</p>
                    </td>
                    <td class="hide-md hide-sm"></td>
                    <td class="hide-md hide-sm"></td>
                </tr>
                <tr class="f16">
                    <td>
                        <p>Android 8+</p>
                    </td>
                    <td>
                        <p class="detail">
                            </p><ul class="tags">
                                <li><p>eSCL</p></li>
                            </ul>
                            HTML5;
                        <p></p>
                    </td>
                    <td class="show-md show-sm">
                        <p>Firefox v68+</p>
                        <p>Chrome v68+</p>
                    </td>
                    <td class="hide-md hide-sm">
                        <i class="firefox"></i>
                        <p>Firefox v68+</p>
                    </td>
                    <td class="hide-md hide-sm">
                        <i class="chrome"></i>
                        <p>Chrome v68+</p>
                    </td>
                    <td class="hide-md hide-sm"></td>
                    <td class="hide-md hide-sm"></td>
                </tr>
            </tbody>
        </table>
    </main>
</div>
-->
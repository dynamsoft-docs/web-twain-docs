---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I use two different websites integrated with two different versions of Dynamic Web TWAIN SDK on the same computer?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, backward compatibility, two different versions
breadcrumbText: Can I use two different websites integrated with two different versions of Dynamic Web TWAIN on the same computer?
description: Can I use two different websites integrated with two different versions of Dynamic Web TWAIN on the same computer?
date: 2022-03-01 07:05:02 +0000
last_modified: 2026-10-26 00:00:00 +0000
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# Running two different websites integrated with two different versions of Dynamic Web TWAIN on the same computer

Dynamic Web TWAIN has limited backward compatibility between different versions and generally only one version is expected to be used on an end-user's computer.

However, since Dynamic Web TWAIN is a popular document scanning SDK and has been integrated to many web applications all over the world, it is not uncommon that some end users use two different websites (developed by two different vendors) integrated with different versions of Dynamic Web TWAIN on the same computer.

As a result, we have provided the following instructions for backward compatibility for some of the older versions, in order to support running both versions on the same computer.

From 16.x, the latest service within the major version supports all previous versions of the same major version.

> [!WARNING]
> There is a known issue for the 17.2 and 17.2.x services. Please use the 17.3 service if you are using 17.x as your latest service.

### Built-in support for the previous major version (v19.4+)

Starting from v19.4, the Dynamic Web TWAIN Service installer on **Windows, macOS and Linux** also contains the service resources of the previous major version. For example, the v19.4.4 service also includes the v18.5.5 resources, so it works with applications using either Dynamic Web TWAIN 19.x or 18.x **without copying any files**.

> [!NOTE]
> The bundled 18.x version depends on the 19.4.x release you install.

You only need to copy resources by hand (see [instructions](#instructions-for-setting-up-cross-major-version-support) below) if:
- you need to support a version older than 18.x (for example, 17.x alongside 19.4), or
- your newer service is v19.0 - v19.3, which does not include the 18.x resources.

### Platform-specific limitations

**Windows and Linux**

You can copy the older resources into the newer service. Unlike macOS, there is no Universal/Intel installer split that blocks this. On Linux, the older and newer services must be built for the same CPU architecture (x64, ARM64 or MIPS64EL), because the library files of one architecture cannot be loaded by a service built for another.

**macOS**

Whether you can copy the older resources depends on which macOS installer you use. See [macOS Rosetta Discontinuation and Dynamic Web TWAIN Service](/_articles/faq/mac-rosetta-discontinuation.md) for background.

| macOS installer | Built-in 18.x support | Can use copied resources from older versions |
|---|---|---|
| Universal installer (standard installer since v19.4) | Yes | **No.** The Universal service runs natively on Apple Silicon and cannot load the Intel-only resources of older versions. |
| Intel-only installer (available separately on the [GitHub releases page](https://github.com/Dynamsoft/Dynamic-Web-TWAIN/releases)) | Yes | Possible, but not verified for every older version. Test before deploying. |

> [!IMPORTANT]
> On Apple Silicon Macs, the Intel-only service needs Rosetta. Rosetta is removed in macOS 28. **From macOS 28 on Apple Silicon Macs, only the Universal service runs, so only applications using 19.x and the bundled 18.x are supported.** You cannot run an older version alongside them.

> [!WARNING]
> The Intel-only service cannot detect Universal TWAIN drivers. Use it only if you need to support versions older than 18.x, or if your scanner only has an Intel TWAIN driver.

**Barcode Reader add-on on macOS and Linux**

Before v18.0, the Barcode Reader add-on was not supported on macOS or Linux. If you copy 17.x or older resources on these platforms, there is no barcode reader library to copy. Barcode reading will not be available to applications using those versions.

### Instructions for setting up cross major version support

<div class="multi-panel-switching-prefix"></div>

- [Windows](#windows)
- [macOS / Linux](#maclinux)

<div class="multi-panel-start"></div>

1. Install the _older_ version of Dynamic Web TWAIN Service (also called "Dynamsoft Service").
2. Copy the .dll files from `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{version number}\` to a temporary location. For the list of .dll files you are required to copy, please refer to the [list below](#list-of-required-dll-files-windows).
3. Install the _newer_ version of the Dynamic Web TWAIN Service.
4. Copy the .dll files from your temporary location into the _new_ Dynamic Web TWAIN Service folder (from v19.0+, the target path is `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}`).

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

1. Install the _older_ version of Dynamic Web TWAIN Service (also called "Dynamsoft Service").
2. Copy the version-specific library files of the older service to a temporary location. The older service is installed in:
   - macOS: `/Applications/Dynamsoft/DynamsoftServicex64_{version number}/{installed version No.}`
   - Linux: `/opt/dynamsoft/DynamsoftService`
3. Install the _newer_ version of the Dynamic Web TWAIN Service. On macOS, use the **Intel-only** installer (see [Platform-specific limitations](#platform-specific-limitations) above).
4. Copy the library files from your temporary location into the _new_ Dynamic Web TWAIN Service folder:
   - macOS: `/Users/{username}/Applications/Dynamsoft/Dynamic Web TWAIN Service {version number}`
   - Linux: `/opt/dynamsoft/Dynamic Web TWAIN Service {version number}`

> [!NOTE]
> We do not publish exact file lists for macOS and Linux. Use the [Windows list](#list-of-required-dll-files-windows) to see which components to copy, such as the core `dwt` library, the PDF rasterizer libraries, the `DWASManager` and the upload module. On macOS, these files have the `.dylib` extension, and on Linux, `.so`. Leave out the barcode reader library (`dbr`) for versions below 18.0. Test the setup on a target machine before deploying it to end users.

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>

### List of required .dll files (Windows)

> [!NOTE]
> For a v19.4+ service, you don't need the 18.x files because they are already included.

<div class="multi-panel-switching-prefix"></div>

- [v19.0+](#19plus)
- [Versions below 19.0](#19min)

<div class="multi-panel-start"></div>

**Version 18.x**
```javascript
dwt_18.5.1.0828.dll
DynamicImagex64.dll
DynamicPdfCorex64_11.5.3.0828.dll
DynamicPdfRx64_11.5.3.0828.dll
DWASManager_18500312.dll
DeviceManager_18510828.dll
UploadModule_1.8.5.0828.dll
dbrx64_9.6.1.0312.dll
```

**Version 17.x**
```javascript
dwt_17.3.5.1212.dll
DynamicImagex64.dll
DynamicPdfCorex64_11.4.0.0531.dll
DynamicPdfRx64_11.4.0.0531.dll
DWASManager_17351212.dll
DynamicSocket.dll
libcrypto-1_1-x64.dll
libssl-1_1-x64.dll
UploadModule_1.7.2.1026.dll
dbrx64_8.8.0.0531.dll
x64
```

**Version 16.x**
```javascript
dwt_16.2.6.1212.dll
DynamicImagex64.dll
DynamicPdfCorex64_11.1.0.0112.dll
DynamicPdfRx64_11.1.0.0112.dll
DWASManager_16261212.dll
DynamicSocket.dll
libeay32.dll
ssleay32.dll
UploadModule_1.6.0.0428.dll
dbrx64_7.6.0.0112.dll
x64
```

**Version 15.x**
```javascript
dwt_15.3.4.1212.dll
DynamicImagex64.dll
DynamicPdfCorex64_10.3.3.0924.dll
DynamicPdfRx64_10.3.3.0924.dll
DWASManager_15341212.dll
DynamicSocket.dll
libeay32.dll
ssleay32.dll
UploadModule_1.4.0.0107.dll
dbrx64_7.3.0.0107.dll
x64
```

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

**Version 17.x**
```javascript
dwt_17.3.0.0531.dll
DynamicPdfCorex64_11.4.0.0531.dll
DynamicPdfRx64_11.4.0.0531.dll
libcrypto-1_1-x64.dll
```

**Version 16.x**
```javascript
dwt_16.2.0.0112.dll
DynamicPdfCorex64_11.1.0.0112.dll
DynamicPdfRx64_11.1.0.0112.dll
```

**Version 15.3.1**
```javascript
dwt_15.3.0.0116.dll
DynamicPdfCorex64_10.3.3.0924.dll
DynamicPdfRx64_10.3.3.0924.dll
```

**Version 15.3**
```javascript
dwt_15.3.0.0107.dll
DynamicPdfCorex64_10.3.3.0924.dll
DynamicPdfRx64_10.3.3.0924.dll
```

**Version 15.2**
```javascript
dwt_15.2.0.0924.dll
DynamicPdfCorex64_10.3.3.0924.dll
DynamicPdfRx64_10.3.3.0924.dll
```

**Version 15.1**
```javascript
dwt_15.1.0.0806.dll
DynamicPdfCorex64_10.3.2.0806.dll
DynamicPdfRx64_10.3.2.0806.dll
```

**Version 15.0**
```javascript
dwt_15.0.0.0625.dll
DynamicPdfCorex64_10.3.1.0124.dll
DynamicPdfRx64_10.3.1.0124.dll
```

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>
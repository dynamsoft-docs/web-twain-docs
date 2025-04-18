---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I use two different websites integrated with two different versions of Dynamic Web TWAIN SDK on the same computer?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, backward compatibility, two different versions
breadcrumbText: Can I use two different websites integrated with two different versions of Dynamic Web TWAIN on the same computer?
description: Can I use two different websites integrated with two different versions of Dynamic Web TWAIN on the same computer?
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# Running two different websites integrated with two different versions of Dynamic Web TWAIN on the same computer

Dynamic Web TWAIN has limited backward compatibility between different versions and generally only one version is expected to be used on an end-user's computer.

However, since Dynamic Web TWAIN is a popular document scanning SDK and has been integrated to many web applications all over the world, it is not uncommon that some end users use two different websites (developed by two different vendors) integrated with different versions of Dynamic Web TWAIN on the same computer.

As a result, we have provided the following instructions for backward compatibility for some of the older versions, in order to support running both versions on the same computer.

From 16.x, the latest service within the major version supports all previous versions of the same major version.
> Note: There is a known issue for the 17.2 and 17.2.x services. Please use the 17.3 service if you are using 17.x as your latest service.

### Instructions for setting up cross major version support
1. Install the _older_ version of Dynamic Web TWAIN Service (also called "Dynamsoft Service").
2. Copy the .dll files from `C:\Windows\SysWOW64\Dynamsoft\DynamsoftService64_{version number}\` to a temporary location. For the list of .dll files you are required to copy, please refer to the list below.
3. Install the _newer_ version of the Dynamic Web TWAIN Service.
4. Copy the .dll files from your temporary location into the _new_ Dynamic Web TWAIN Service folder (from v19.0+, the target path is `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}`).

### List of required .dll files
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

---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Guide - Buffer Caching
keywords: Dynamic Web TWAIN, Documentation, Deployment, Dynamic Web TWAIN Service, caching, buffer,
breadcrumbText: Dynamic Web TWAIN Service
description: Dynamic Web TWAIN SDK Documentation Dynamic Web TWAIN Service Page
---

# Buffer Caching

The DWT image buffer is controlled by the Dynamic Web TWAIN Service(formerly known as Dynamsoft Service). The Dynamic Web TWAIN Service can run in either 32-bit mode or 64-bit mode. Before DWT version 15.0, the service ran in 32-bit mode by default. This meant it could not address more than 2GB of physical memory. <!--We introduced the 64-bit version of the service in DWT version 14.0. -->Starting in version 15.0, the Dynamic Web TWAIN Service runs as 64-bit by default on 64-bit operating systems, which removes the 2GB memory limit. To limit memory usage, DWT can cache data to disk to free up memory.

## Disk Caching

The DWT image buffer handles data using the `DIB` format, which take up a lot of space in memory. For example, one A4 paper scanned in 300 DPI takes around 24MB in memory, which means 2GB of physical memory can only store no more than 85 of these images. As more images are processed, more memory gets used which may pose a threat to other programs on the machine. Due to this, the disk cache function was added. After enabling disk caching, most images will be temporarily cached on the disk, while keeping some active images in the memory to maintain high performance.

The disk caching feature is enabled by default, but can be disabled by setting [`IfAllowLocalCache`](/_articles/info/api/WebTwain_Buffer.md#ifallowlocalcache) to `false` .

You can also set how much memory `Dynamic Web TWAIN` can use before images start to be cached. By default, **800MB** is used. You can change it using the property [`BufferMemoryLimit`](/_articles/info/api/WebTwain_Buffer.md#buffermemorylimit).

> Note: All cached data is encrypted and can only be accessed by `Dynamic Web TWAIN`. When `Dynamic Web TWAIN` is unloaded (like when the browser tab refreshes or closes), the cached data is destroyed and removed from the disk automatically.

Although you can scan and load as many images as you like, you may want to handle them in smaller volumes when doing further processing. For example, when dealing with extremely large volumes, you should not try to upload or save the images all at once as that would be too time consuming and prone to errors.

## Save the encrypted image caches in local Dynamic Web TWAIN Service folder

In certain scenarios, there may be requirements to store encrypted image caches on a local disk for temporary data storage or backup purposes. For instance, when scanning a large batch of documents, accidentally closing the web page can result in the loss of scanned data, necessitating scanning the documents again. This issue can be mitigated by backing up the data before closing the page.

Starting from version 18.5, Dynamic Web TWAIN introduces a new feature that facilitates developers in securely storing image caches in encrypted form within the Dynamic Web TWAIN Service(formerly known as Dynamsoft Service) folder. This feature offers several advantages:

- Data is stored securely in encrypted form.
- The speed of storing data locally and loading it back into the Dynamic Web TWAIN buffer is fast.
- The stored data remains intact even when the `WebTwain` instance is destroyed.

> Note: Since the storage folder is located within the Dynamic Web TWAIN Service directory, the stored data will be lost if Dynamic Web TWAIN Service is uninstalled. Upgrading the Dynamic Web TWAIN Service will not affect the storage folder.

### Create a storage folder

First of all, you need to create a storage item by [`createLocalStorage()`](/_articles/info/api/WebTwain_IO.md#createlocalstorage) which is used to save the encrypted image caches. For example,

```javascript
var folderSettings = {
  password: "XXXXXXXX",
}; // Specify the password of the created storage folder
var storageItemUid = await DWTObject.createLocalStorage(folderSettings);
```

Please ensure to set a strong password to enhance data security, especially in multi-user login scenarios.

The local directory of the created storage folder is under the service's [intallation folder](/_articles/extended-usage/dynamsoft-service-configuration.md#installation-folder).

**Save image caches**

To save the specified image(s) to the storage folder, [`saveToLocalStorage()`](/_articles/info/api/WebTwain_IO.md#savetolocalstorage) method is required.

```javascript
var bExist = await DWTObject.localStorageExist(storageItemUid); // Determine whether the folder exists

if (bExist) {
  var saveImageSettings = {
    uid: storageItemUid,
    password: "XXXXXXXX",
    indices: [0,1], // The first two images in buffer
  };
  await DWTObject.saveToLocalStorage(saveImageSettings);
}
else {
  console.log("The storage folder does not exist.");
}
```

**Load image(s) from the storage folder**

To load the encrypted image caches into Dynamic Web TWAIN again, please use the method [`loadFromLocalStorage()`](/_articles/info/api/WebTwain_IO.md#loadfromlocalstorage).

```javascript
var bExist = await DWTObject.localStorageExist(storageItemUid); // Determine whether the folder exists

if (bExist) {
  var loadImageSettings = {
    uid: storageItemUid,
    password: "XXXXXXXX",
  };
  await DWTObject.loadFromLocalStorage(loadImageSettings);
}
else {
  console.log("The storage folder does not exist.");
}
```

**Remove the storage folder**

If you would like to remove the storage folder by programming, the method [`removeLocalStorage()`](/_articles/info/api/WebTwain_IO.md#removelocalstorage) can help.

```javascript
var bExist = await DWTObject.localStorageExist(storageItemUid); // Determine whether the folder exists

if (bExist) {
  var removeFolderSettings = {
    uid: storageItemUid,
    password: "XXXXXXXX",
  };
  await DWTObject.removeLocalStorage(removeFolderSettings);
}
else {
  console.log("The storage folder does not exist.");
}
```
---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Buffer
keywords: Dynamic Web TWAIN, Documentation, Buffer
breadcrumbText: Buffer
description: Dynamic Web TWAIN SDK Documentation Buffer Page
permalink: /indepth/features/buffer.html
---

# Buffer Management

When using Dynamic Web TWAIN scanner module on desktop, it collects all the input files and stores them in a buffer. This section of the guide will explore the different aspects of the buffer, including its features and abilities as well as its limits. First, let's explore the limits of the buffer and how to use the local cache.

## Memory Limits 

Dynamic Web TWAIN can run in 32bit and 64bit and the data is stored raw in `DIB` format. Before version 15.0, it's 32-bit by default and that means it can utilize no more than 2 GB of physical memory. In version 15.0 onwards, 64-bit has been made the default option on a 64-bit OS and that means there is no limitation on how much memory it can use.

In order to control the size of the data, `Dynamic Web TWAIN` can limit the number of images allowed in buffer with the property [`MaxImagesInBuffer`]({{site.info}}api/WebTwain_Buffer.html#maximagesinbuffer).

## Disk Caching

The data `Dynamic Web TWAIN` deals with are images which take up lots of space as they are stored raw in **DIB** format. For example, one A4 paper scanned in 300 DPI takes around 24MB in memory which means 2GB of physical memory can only store no more than 85 of these images. As more images are processed, more memory gets used which may pose a threat to other programs on the machine. Due to this, the disk cache function was added. After enabling disk caching, most images will be temporarily cached on the disk, while keeping some active images in the memory to maintain high performance.

The disk caching feature is enabled by default and can be disabled by setting [`IfAllowLocalCache`]({{site.info}}api/WebTwain_Buffer.html#ifallowlocalcache) to `false` .

You can also set how much memory `Dynamic Web TWAIN` can use before images start to be cached. By default, **800MB** is used. You can change it using the property [`BufferMemoryLimit`]({{site.info}}api/WebTwain_Buffer.html#buffermemorylimit). 

> NOTE
>  
> All cached data is encrypted and can only be accessed by `Dynamic Web TWAIN` .
>
> When `Dynamic Web TWAIN` is unloaded (like when the browser tab refreshes or closes), the cached data is destroyed and removed from the disk automatically.

Although you can scan and load as many images as you like, you may want to handle them in smaller volumes when doing further processing. For example, when dealing with extremely large volumes, you should not try to upload or save the images all at once as that would be too time consuming and prone to errors.

## Save the encrypted image caches in local Dynamsoft Service folder

In certain scenarios, there may be requirements to store encrypted image caches on a local disk for temporary data storage or backup purposes. For instance, when scanning a large batch of documents, accidentally closing the web page can result in the loss of scanned data, necessitating rescanning of the documents. This issue can be mitigated by backing up the data before closing the page.

Starting from version 18.5, Dynamic Web TWAIN introduces a new feature that facilitates developers in securely storing image caches in encrypted form within the Dynamsoft Service folder. This feature offers several advantages:

- Data is stored securely in encrypted form.
- The speed of storing data locally and loading it back into the Dynamic Web TWAIN buffer is fast.
- The stored data remains intact even when the Dynamic Web TWAIN object is destroyed.

*However, it's important to note that since the storage folder is located within the Dynamsoft Service directory, the stored data will be lost if Dynamsoft Service is uninstalled. The upgrade of Dynamsoft Service will not affect the storage folder.*

**Create a storage folder**

First of all, you need to create a storage item by [`createLocalStorage()`]({{site.info}}api/WebTwain_IO.html#createlocalstorage) which is used to save the encrypeted image caches. For example,

```javascript
var folderSettings = {
  password: "XXXXXXXX",
}; // Specify the password of the created storage folder
var storageItemUid = await DWTObject.createLocalStorage(folderSettings);
```

Please ensure to set a strong password to enhance data security, especially in multi-user login scenarios.

The local directory of the created storage folder is under 
  - Windows: `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{versionnumber}\storage`
  - macOS: `Go > Applications > Dynamsoft > DynamsoftServicex64_{versionnumber} > {installed version No.} > storage`
  - Linux: `/opt/dynamsoft/DynamsoftService/storage`

**Save image caches**

To save the specified image(s) to the storage folder, [`saveToLocalStorage()`]({{site.info}}api/WebTwain_IO.html#savetolocalstorage) method is required.

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

To load the encypted image caches into Dynamic Web TWAIN again, please use the method [`loadFromLocalStorage()`]({{site.info}}api/WebTwain_IO.html#loadfromlocalstorage).

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

If you would like to remove the storage folder by programming, the method [`removeLocalStorage()`]({{site.info}}api/WebTwain_IO.html#removelocalstorage) can help.

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

## Rearranging the images within the buffer

`Dynamic Web TWAIN` offers a number of methods to help you shift the images within the buffer.

> NOTE
>  
> You can also just drag the images around in the viewer to change their positions.

* Use the [`MoveImage()`]({{site.info}}api/WebTwain_Buffer.html#moveimage) method:

``` javascript
/* Assuming there are 5 images in the buffer, the following code changes the 1st image to be the 3rd. The sequence changes to 12034 from 01234*/
DWTObject.MoveImage(0, 2);
```

* If you are looking to simply switch two images in the buffer, use [`SwitchImage()`]({{site.info}}api/WebTwain_Buffer.html#switchimage):

``` javascript
// Switch the positions of the 1st and the 3rd images
DWTObject.SwitchImage(0, 2);
```

* Lastly, you can use one of the following methods to remove one or multiple images from the buffer:

``` javascript
// Removes a single image specified by index
DWTObject.RemoveImage(1);
//Removes all images in the buffer
DWTObject.RemoveAllImages();
// Removes the first 3 images from the buffer
DWTObject.SelectImages([0, 1, 2]);
DWTObject.RemoveAllSelectedImages();
```

## Tagging Images

`Dynamic Web TWAIN` offers the ability to place tag(s) on image(s) which helps putting them into groups. A tag is a string that describes the corresponding grouping. The following demonstrates how to tag images:

``` javascript
/* Tags the first two scanned images with the classification "title" to indicate that they belong to the title section of the book being scanned. The 3 images after the first two belong to chapter 1 of the book so they were tagged correspondingly */
DWTObject.TagImages([0, 1], "title");
DWTObject.TagImages([2, 3, 4], "chapter1")
```

If you are scanning in a new batch of documents and would like to put the same tag on all of them, you can do so using the [ `SetDefaultTag()` ]({{site.info}}api/WebTwain_Buffer.html#setdefaulttag) method.

``` javascript
/* The next batch of documents are the medical records of patient123 so instead of tagging each document after they are scanned, tag them all as such. */
DWTObject.SetDefaultTag("patient123");
DWTObject.AcquireImage();
```

To filter the images in the buffer by a tag, use [`FilterImagesByTag()`]({{site.info}}api/WebTwain_Buffer.html#filterimagesbytag). 

To clear the tags on a specific image, use [`ClearImageTags()`]({{site.info}}api/WebTwain_Buffer.html#clearimagetags).

## Image Data

The buffer also provides access to a wide array of info for each image. Here is the full list of the info available via the buffer:

* Bit depth, which helps to identify the pixel type of the image: [`GetImageBitDepth()`]({{site.info}}api/WebTwain_Buffer.html#getimagebitdepth)
* Height of the image in pixels: [`GetImageHeight()`]({{site.info}}api/WebTwain_Buffer.html#getimageheight)
* Width of the image in pixels: [`GetImageWidth()`]({{site.info}}api/WebTwain_Buffer.html#getimagewidth)
* Horizontal resolution of the specified image: [`GetImageXResolution()`]({{site.info}}api/WebTwain_Buffer.html#getimagexresolution)
* Vertical resolution of the specified image: [`GetImageYResolution()`]({{site.info}}api/WebTwain_Buffer.html#getimageyresolution)

The following is only supported in [desktop browsers]({{site.getstarted}}platform.html#browsers-on-desktop-devices).

* Size in bytes of the specified image according to input dimensions: [ `GetImageSize()` ]({{site.info}}api/WebTwain_Buffer.html#getimagesize)
* Size, but this time you specify an image format and `Dynamic Web TWAIN` calculates the size in bytes depending on that image format: [ `GetImageSizeWithSpecifiedType()` ]({{site.info}}api/WebTwain_Buffer.html#getimagesizewithspecifiedtype)
* Size in bytes of selected images according to input dimensions: [ `GetSelectedImagesSize()` ]({{site.info}}api/WebTwain_Buffer.html#getselectedimagessize)

## Status Reporting

Now that we've covered the general image info like  size and dimensions, let's address some of the less intuitive but still useful pieces of information that our buffer can offer:

* To get the total number of images in the buffer, use [ `HowManyImagesInBuffer` ]({{site.info}}api/WebTwain_Buffer.html#howmanyimagesinbuffer)

* The index of the image currently active in the buffer is represented via the [ `CurrentImageIndexInBuffer` ]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer) property, which you can also use to **set** the current image

* In addition to each image having a unique index, each image also has a unique image ID. To find the image ID of an image at a certain index, use [ `IndexToImageID()` ]({{site.info}}api/WebTwain_Buffer.html#indextoimageid) and use [ `ImageIDToIndex()` ]({{site.info}}api/WebTwain_Buffer.html#imageidtoindex) if vice-versa

> NOTE
>  
> Unlike the index which changes when the position of the image changes, the image ID stays unchanged until the image is no longer in the `Dynamic Web TWAIN` buffer.

* If a scanned image comes out a bit skewed, and you are not able to put that specific page through the scanner again, one potential solution would be to rotate the image by how much it is skewed, which can be easily done using [ `GetSkewAngle()` ]({{site.info}}api/WebTwain_Buffer.html#getskewangle). 

Image selection is a powerful tool that can be utilized if you want to carry out an action but only on specific images in the buffer. We will go over some of the methods used to set the selected images in the buffer:

* [ `SelectImages()` ]({{site.info}}api/WebTwain_Buffer.html#selectimages) is the main method used here. All you need to do is feed it the array of image indices you want to select
* [ `SelectAllImages()` ]({{site.info}}api/WebTwain_Buffer.html#selectallimages) simply selects all the images in the buffer
* [ `SelectedImagesIndices` ]({{site.info}}api/WebTwain_Buffer.html#selectedimagesindices) returns the indices of the selected images as an array

The following is only supported in [desktop browsers]({{site.getstarted}}platform.html#browsers-on-desktop-devices).

* The method [ `GetSkewAngleEx()` ]({{site.info}}api/WebTwain_Buffer.html#getskewangleex) is used to get the skew angle of a specified rectangle on the specified image
* Each image in the buffer also has an internal URL which you can use to reference it, accessible via [ `GetImageURL()` ]({{site.info}}api/WebTwain_Buffer.html#getimageurl) and [ `GetImagePartURL()` ]({{site.info}}api/WebTwain_Buffer.html#getimageparturl) . This could come in handy for certain situations, like retrieving and showing the images in your own viewer.

> Note
>  
> `GetImageURL()` returns a URL that has the normal scheme `http://` or `https://` while `GetImagePartURL()` returns an internal URL that has the scheme `dwt://` . The latter can only be accessed by other `Dynamic Web TWAIN` APIs.

## Blankness Detection

The buffer also comes with the ability to detect if a scanned image is blank or not. This is easily done using one of the two following methods: [ `IsBlankImage()` ]({{site.info}}api/WebTwain_Buffer.html#isblankimage) or [ `IsBlankImageExpress()` ]({{site.info}}api/WebTwain_Buffer.html#isblankimageexpress). The 2nd method is faster but not as accurate as the first.

If you believe an image should be blank but `IsBlankImage()` or `IsBlankImageExpress()` is returning `false` , you can read [ `BlankImageCurrentStdDev` ]({{site.info}}api/WebTwain_Buffer.html#blankimagecurrentstddev) (a read-only property) for that image and then **set a bigger value** to [ `BlankImageMaxStdDev` ]({{site.info}}api/WebTwain_Buffer.html#blankimagemaxstddev) , which sets the "limit" at which the buffer considers the image blank. Then when you try again, that image will be regarded as blank.

## Buffer Event Callbacks

The buffer also provides a few event callbacks that take place under specific conditions. You can use these callbacks to trigger a certain action once this event takes place. Here is an overview of the events and what each represents:

* [ `OnBitmapChanged` ]({{site.info}}api/WebTwain_Buffer.html#onbitmapchanged) This event is triggered when the data in the buffer changes. Specifically when

  + New image(s) enters the buffer
  + Old image(s) gets removed
  + Existing image(s) gets edited

  <!-- Index change? -->

* [ `OnTopImageInTheViewChanged` ]({{site.info}}api/WebTwain_Buffer.html#ontopimageintheviewchanged) This event is triggered when the first **visible** image in the viewer changes.

* [ `OnIndexChangeDragDropDone` ]({{site.info}}api/WebTwain_Buffer.html#onindexchangedragdropdone) This event is triggered when you drag and drop images in the viewer to change their positions.

<!-- An event to fire when selection change -->

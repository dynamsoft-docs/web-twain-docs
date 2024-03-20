---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - Index
keywords: Dynamic Web TWAIN, Documentation, API Reference, Index
description: Dynamic Web TWAIN Documentation API List
breadcrumbText: API Reference
permalink: /info/api/
---

> Some old APIs are deprecated, check out [Deprecated Features and APIs]({{site.info}}schedule/deprecated.html)

# API List

<div class="multi-panel-switching-prefix"></div>

- [Desktop Service](#desktop) 
- [Android Service](#android) 

<div class="multi-panel-start"></div>

<!-- ## Global

| | |
|:-|:-|
|[`Dynamsoft.DWT`]({{site.info}}api/Dynamsoft_WebTwainEnv.html)  | [`Dynamsoft.DWT.Enum`]({{site.info}}api/Dynamsoft_Enum.html)  |

## Events

| | |
|:-|:-|
|[`OnWebTwainReady`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#OnWebTwainReady)|[`OnWebTwainError`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#OnWebTwainError)|

## WebTwain -->

## Global

### Methods

|                                       |                                           |                                       |                                    |
|---------------------------------------|-------------------------------------------|---------------------------------------|------------------------------------|
| [`CreateDWTObject()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#createdwtobject) | [`CreateDWTobjectEx()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#createdwtobjectex) | [`DeleteDWTObject()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#deletedwtobject) | [`GetWebTwain()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#getwebtwain)      |
| [`Load()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#load)                       | [`RegisterEvent()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#registerevent)         | [`Unload()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#unload)                   | |


 <!-- [`UpdateCert()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#updatecert)         -->

### Properties

|                                         |                                                     |                                                            |                                 |
|-----------------------------------------|-----------------------------------------------------|------------------------------------------------------------|---------------------------------|
| [`Autoload`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#autoload)   | [`Containers`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#containers)  | [`CustomizableDisplayInfo`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#customizabledisplayinfo)   | [`DeviceFriendlyName`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#devicefriendlyname)   |
| [`Host`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#host)  | [`IfAddMD5InUploadHeader`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#ifaddmd5inuploadheader) | [`IfConfineMaskWithinTheViewer`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#ifconfinemaskwithintheviewer)   | [`IfUseActiveXForIE10Plus`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#ifuseactivexforie10plus)   |
| [`JSVersion`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#jsversion)     | [`ProductKey`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#productkey)     | [`ResourcesPath`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#resourcespath)      | [`ServiceInstallerLocation`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#serviceinstallerlocation) | 
| [`UseDefaultViewer`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#usedefaultviewer) |                 |                      |


### Events

|                                       |                                       |                             |                            |
|---------------------------------------|---------------------------------------|-----------------------------|----------------------------|
| [`OnWebTwainReady`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#onwebtwainready) | [`OnWebTwainError`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#onwebtwainerror) | [`OnWebTwainPostExecute`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#onwebtwainpostexecute) | [`OnWebTwainPreExecute`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#onwebtwainpreexecute) | 

## Buffer

### Methods

<!--* [`GetImageBitDepthAsync()`]({{site.info}}api/WebTwain_Buffer.html#getimagebitdepthasync)-->


| | | | |
|:-|:-|:-|:-|
|[`ClearImageTags()`]({{site.info}}api/WebTwain_Buffer.html#clearimagetags) | [`RenameTag()`]({{site.info}}api/WebTwain_Buffer.html#renametag) |[`RemoveTag()`]({{site.info}}api/WebTwain_Buffer.html#removetag) |[`GetTagList()`]({{site.info}}api/WebTwain_Buffer.html#gettaglist) |
|[`FilterImagesByTag()`]({{site.info}}api/WebTwain_Buffer.html#filterimagesbytag)|[`ClearFilter()`]({{site.info}}api/WebTwain_Buffer.html#clearfilter) | [`SetDefaultTag()`]({{site.info}}api/WebTwain_Buffer.html#setdefaulttag) | [`TagImages()`]({{site.info}}api/WebTwain_Buffer.html#tagimages)| 
|[`GetImageBitDepth()`]({{site.info}}api/WebTwain_Buffer.html#getimagebitdepth)| [`GetImageSize()`]({{site.info}}api/WebTwain_Buffer.html#getimagesize)| [`GetImageSizeWithSpecifiedType()`]({{site.info}}api/WebTwain_Buffer.html#getimagesizewithspecifiedtype)|[`GetSelectedImagesSize()`]({{site.info}}api/WebTwain_Buffer.html#getselectedimagessize) |
|[`GetImageHeight()`]({{site.info}}api/WebTwain_Buffer.html#getimageheight) |[`GetImageWidth()`]({{site.info}}api/WebTwain_Buffer.html#getimagewidth) | [`GetImagePartURL()`]({{site.info}}api/WebTwain_Buffer.html#getimageparturl) |[`GetImageURL()`]({{site.info}}api/WebTwain_Buffer.html#getimageurl)|
|[`GetImageXResolution()`]({{site.info}}api/WebTwain_Buffer.html#getimagexresolution) |[`GetImageYResolution()`]({{site.info}}api/WebTwain_Buffer.html#getimageyresolution) |[`GetSkewAngle()`]({{site.info}}api/WebTwain_Buffer.html#getskewangle) | [`GetSkewAngleEx()`]({{site.info}}api/WebTwain_Buffer.html#getskewangleex)|
|[`ImageIDToIndex()`]({{site.info}}api/WebTwain_Buffer.html#imageidtoindex) | [`IndexToImageID()`]({{site.info}}api/WebTwain_Buffer.html#indextoimageid)| [`IsBlankImage()`]({{site.info}}api/WebTwain_Buffer.html#isblankimage) | [`IsBlankImageExpress()`]({{site.info}}api/WebTwain_Buffer.html#isblankimageexpress)|  
|[`SelectAllImages()`]({{site.info}}api/WebTwain_Buffer.html#selectallimages)|[`MoveImage()`]({{site.info}}api/WebTwain_Buffer.html#moveimage) | [`SwitchImage()`]({{site.info}}api/WebTwain_Buffer.html#switchimage)| [`RemoveImage()`]({{site.info}}api/WebTwain_Buffer.html#removeimage) |
| [`RemoveAllImages()`]({{site.info}}api/WebTwain_Buffer.html#removeallimages)|[`RemoveAllSelectedImages()`]({{site.info}}api/WebTwain_Buffer.html#removeallselectedimages) |[`SelectImages()`]({{site.info}}api/WebTwain_Buffer.html#selectimages)|[`GetTagListByIndex()`]({{site.info}}api/WebTwain_Buffer.html#gettaglistbyindex) |
| [`CreateDocument()`]({{site.info}}api/WebTwain_Buffer.html#createdocument)|[`OpenDocument()`]({{site.info}}api/WebTwain_Buffer.html#opendocument)|[`GetCurrentDocumentName()`]({{site.info}}api/WebTwain_Buffer.html#getcurrentdocumentname)|[`RenameDocument()`]({{site.info}}api/WebTwain_Buffer.html#renamedocument)|
|[`RemoveDocument()`]({{site.info}}api/WebTwain_Buffer.html#removedocument)| [`GetDocumentInfoList()`]({{site.info}}api/WebTwain_Buffer.html#getdocumentinfolist)| [`IsBlankImageAsync()`]({{site.info}}api/WebTwain_Buffer.html#isblankimageasync) | [`CopyToDocumentAsync()`]({{site.info}}api/WebTwain_Buffer.html#copytodocumentasync) |
| [`MoveToDocumentAsync()`]({{site.info}}api/WebTwain_Buffer.html#movetodocumentasync) |

<!--
* [`ClearImageTags()`]({{site.info}}api/WebTwain_Buffer.html#clearimagetags) 
* [`RenameTag()`]({{site.info}}api/WebTwain_Buffer.html#renametag) 
* [`RemoveTag()`]({{site.info}}api/WebTwain_Buffer.html#removetag) 
* [`GetTagList()`]({{site.info}}api/WebTwain_Buffer.html#gettaglist) 
* [`FilterImagesByTag()`]({{site.info}}api/WebTwain_Buffer.html#filterimagesbytag)

* [`ClearFilter()`]({{site.info}}api/WebTwain_Buffer.html#clearfilter)
* [`SetDefaultTag()`]({{site.info}}api/WebTwain_Buffer.html#setdefaulttag) 
* [`TagImages()`]({{site.info}}api/WebTwain_Buffer.html#tagimages)
* [`GetImageBitDepth()`]({{site.info}}api/WebTwain_Buffer.html#getimagebitdepth)
* [`GetImageSize()`]({{site.info}}api/WebTwain_Buffer.html#getimagesize)

* [`GetImageSizeWithSpecifiedType()`]({{site.info}}api/WebTwain_Buffer.html#getimagesizewithspecifiedtype) 
* [`GetSelectedImagesSize()`]({{site.info}}api/WebTwain_Buffer.html#getselectedimagessize)
* [`GetImageHeight()`]({{site.info}}api/WebTwain_Buffer.html#getimageheight) 
* [`GetImageWidth()`]({{site.info}}api/WebTwain_Buffer.html#getimagewidth)
* [`GetImagePartURL()`]({{site.info}}api/WebTwain_Buffer.html#getimageparturl)

* [`GetImageURL()`]({{site.info}}api/WebTwain_Buffer.html#getimageurl)
* [`GetImageXResolution()`]({{site.info}}api/WebTwain_Buffer.html#getimagexresolution) 
* [`GetImageYResolution()`]({{site.info}}api/WebTwain_Buffer.html#getimageyresolution)
* [`GetSkewAngle()`]({{site.info}}api/WebTwain_Buffer.html#getskewangle) 
* [`GetSkewAngleEx()`]({{site.info}}api/WebTwain_Buffer.html#getskewangleex)

* [`ImageIDToIndex()`]({{site.info}}api/WebTwain_Buffer.html#imageidtoindex) 
* [`IndexToImageID()`]({{site.info}}api/WebTwain_Buffer.html#indextoimageid)
* [`IsBlankImage()`]({{site.info}}api/WebTwain_Buffer.html#isblankimage) 
* [`IsBlankImageExpress()`]({{site.info}}api/WebTwain_Buffer.html#isblankimageexpress)
* [`SelectAllImages()`]({{site.info}}api/WebTwain_Buffer.html#selectallimages)

* [`SelectImages()`]({{site.info}}api/WebTwain_Buffer.html#selectimages)
* [`MoveImage()`]({{site.info}}api/WebTwain_Buffer.html#moveimage) 
* [`SwitchImage()`]({{site.info}}api/WebTwain_Buffer.html#switchimage)
* [`RemoveImage()`]({{site.info}}api/WebTwain_Buffer.html#removeimage) 
* [`RemoveAllImages()`]({{site.info}}api/WebTwain_Buffer.html#removeallimages)

* [`RemoveAllSelectedImages()`]({{site.info}}api/WebTwain_Buffer.html#removeallselectedimages) -->

<!--* [`RemoveAllImagesAsync()`]({{site.info}}api/WebTwain_Buffer.html#removeallimagesasync)-->
<!--* [`RemoveAllSelectedImagesAsync()`]({{site.info}}api/WebTwain_Buffer.html#removeallselectedimagesasync)-->

### Properties

| | | | |
|:-|:-|:-|:-|
|[`BlankImageCurrentStdDev`]({{site.info}}api/WebTwain_Buffer.html#blankimagecurrentstddev) |[`BlankImageMaxStdDev`]({{site.info}}api/WebTwain_Buffer.html#blankimagemaxstddev) |[`BlankImageThreshold`]({{site.info}}api/WebTwain_Buffer.html#blankimagethreshold)| [`BufferMemoryLimit`]({{site.info}}api/WebTwain_Buffer.html#buffermemorylimit)|
|[`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer) |[`HowManyImagesInBuffer`]({{site.info}}api/WebTwain_Buffer.html#howmanyimagesinbuffer)| [`IfAllowLocalCache`]({{site.info}}api/WebTwain_Buffer.html#ifallowlocalcache) | [`SelectedImagesIndices`]({{site.info}}api/WebTwain_Buffer.html#selectedimagesindices)|
|[`MaxImagesInBuffer`]({{site.info}}api/WebTwain_Buffer.html#maximagesinbuffer)|

<!--

* [`BlankImageCurrentStdDev`]({{site.info}}api/WebTwain_Buffer.html#blanimagecurrentstddev)   
* [`BlankImageMaxStdDev`]({{site.info}}api/WebTwain_Buffer.html#blankimagemaxstddev)
* [`BlankImageThreshold`]({{site.info}}api/WebTwain_Buffer.html#blankimagethreshold)   
* [`BufferMemoryLimit`]({{site.info}}api/WebTwain_Buffer.html#buffermemorylimit)
* [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer) 
* [`HowManyImagesInBuffer`]({{site.info}}api/WebTwain_Buffer.html#howmanyimagesinbuffer)
* [`IfAllowLocalCache`]({{site.info}}api/WebTwain_Buffer.html#ifallowlocalcache)   
* [`SelectedImagesIndices`]({{site.info}}api/WebTwain_Buffer.html#selectedimagesindices)
* [`MaxImagesInBuffer`]({{site.info}}api/WebTwain_Buffer.html#maximagesinbuffer) -->

### Events

| | | | |
|:-|:-|:-|:-|
| [`OnBufferChanged`]({{site.info}}api/WebTwain_Buffer.html#onbufferchanged) |[`OnBitmapChanged`]({{site.info}}api/WebTwain_Buffer.html#onbitmapchanged) | [`OnIndexChangeDragDropDone`]({{site.info}}api/WebTwain_Buffer.html#onindexchangedragdropdone)| [`OnTopImageInTheViewChanged`]({{site.info}}api/WebTwain_Buffer.html#ontopimageintheviewchanged)|

## Edit

### Methods

| | | | |
|:-|:-|:-|:-|
|[`Crop()`]({{site.info}}api/WebTwain_Edit.html#crop)|[`CropToClipboard()`]({{site.info}}api/WebTwain_Edit.html#croptoclipboard)| [`CutFrameToClipboard()`]({{site.info}}api/WebTwain_Edit.html#cutframetoclipboard) |[`CutToClipboard()`]({{site.info}}api/WebTwain_Edit.html#cuttoclipboard)|
|[`CopyToClipboard()`]({{site.info}}api/WebTwain_Edit.html#copytoclipboard) |[`Erase()`]({{site.info}}api/WebTwain_Edit.html#erase) |[`Flip()`]({{site.info}}api/WebTwain_Edit.html#flip)|[`Mirror()`]({{site.info}}api/WebTwain_Edit.html#mirror)|
| [`Rotate()`]({{site.info}}api/WebTwain_Edit.html#rotate) |[`RotateEx()`]({{site.info}}api/WebTwain_Edit.html#rotateex)| [`RotateLeft()`]({{site.info}}api/WebTwain_Edit.html#rotateleft) | [`RotateRight()`]({{site.info}}api/WebTwain_Edit.html#rotateright)|
| [`ChangeBitDepth()`]({{site.info}}api/WebTwain_Edit.html#changebitdepth) | [`SetDPI()`]({{site.info}}api/WebTwain_Edit.html#setdpi)|[`ConvertToBW()`]({{site.info}}api/WebTwain_Edit.html#converttobw) |[`ConvertToGrayScale()`]({{site.info}}api/WebTwain_Edit.html#converttograyscale)|
|[`ChangeImageSize()`]({{site.info}}api/WebTwain_Edit.html#changeimagesize) | [`Invert()`]({{site.info}}api/WebTwain_Edit.html#invert)|[`SetImageWidth()`]({{site.info}}api/WebTwain_Edit.html#setimagewidth)|[`ChangeBrightnessAsync()`]({{site.info}}api/WebTwain_Edit.html#changebrightnessasync)|
|[`ChangeContrastAsnyc()`]({{site.info}}api/WebTwain_Edit.html#changecontrastasnyc)|

<!--
* [`Crop()`]({{site.info}}api/WebTwain_Edit.html#crop) 
* [`CropToClipboard()`]({{site.info}}api/WebTwain_Edit.html#croptoclipboard)
* [`CutFrameToClipboard()`]({{site.info}}api/WebTwain_Edit.html#cutframetoclipboard) 
* [`CutToClipboard()`]({{site.info}}api/WebTwain_Edit.html#cuttoclipboard)
* [`CopyToClipboard()`]({{site.info}}api/WebTwain_Edit.html#copytoclipboard) 
* [`Erase()`]({{site.info}}api/WebTwain_Edit.html#erase)
* [`Flip()`]({{site.info}}api/WebTwain_Edit.html#flip)
* [`Mirror()`]({{site.info}}api/WebTwain_Edit.html#mirror)
* [`Rotate()`]({{site.info}}api/WebTwain_Edit.html#rotate) 
* [`RotateEx()`]({{site.info}}api/WebTwain_Edit.html#rotateex)
* [`RotateLeft()`]({{site.info}}api/WebTwain_Edit.html#rotateleft) 
* [`RotateRight()`]({{site.info}}api/WebTwain_Edit.html#rotateright)
* [`ChangeBitDepth()`]({{site.info}}api/WebTwain_Edit.html#changebitdepth) 
* [`SetDPI()`]({{site.info}}api/WebTwain_Edit.html#setdpi)
* [`ConvertToBW()`]({{site.info}}api/WebTwain_Edit.html#converttobw) 
* [`ConvertToGrayScale()`]({{site.info}}api/WebTwain_Edit.html#converttograyscale)
* [`ChangeImageSize()`]({{site.info}}api/WebTwain_Edit.html#changeimagesize) 
* [`Invert()`]({{site.info}}api/WebTwain_Edit.html#invert)
* [`SetImageWidth()`]({{site.info}}api/WebTwain_Edit.html#setimagewidth)
-->
<!--* [`FlipAsync()`]({{site.info}}api/WebTwain_Edit.html#flipasync)-->
<!--* [`MirrorAsync()`]({{site.info}}api/WebTwain_Edit.html#mirrorasync)-->
<!--* [`RotateAsync()`]({{site.info}}api/WebTwain_Edit.html#rotate) -->
<!--* [`RotateLeftAsync()`]({{site.info}}api/WebTwain_Edit.html#rotateleft) -->
<!--* [`RotateRightAsync()`]({{site.info}}api/WebTwain_Edit.html#rotateright)-->
<!--* [`ConvertToGrayScaleAsync()`]({{site.info}}api/WebTwain_Edit.html#converttograyscaleasync)-->

### Properties

| |
|:-|
|[`BackgroundFillColor`]({{site.info}}api/WebTwain_Edit.html#backgroundfillcolor) |

<!--
* [`BackgroundFillColor`]({{site.info}}api/WebTwain_Edit.html#backgroundfillcolor) -->

## Scan

### Methods

| | | | |
| :------------------------------------------------ | :------------------------------------------ | ----------------------------------------------- | --------------------------------------------------------- |
| [`GetSourceNameItems()`]({{site.info}}api/WebTwain_Acquire.html#getsourcenameitems)     | [`GetSourceNames()`]({{site.info}}api/WebTwain_Acquire.html#getsourcenames)       | [`GetSourceNamesAsync()`]({{site.info}}api/WebTwain_Acquire.html#getsourcenamesasync) | [`SelectSource()`]({{site.info}}api/WebTwain_Acquire.html#selectsource)                 |
| [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync) | [`SelectSourceByIndex()`]({{site.info}}api/WebTwain_Acquire.html#selectsourcebyindex) | [`SelectSourceByIndexAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourcebyindexasync) | [`SetOpenSourceTimeout()`]({{site.info}}api/WebTwain_Acquire.html#setopensourcetimeout) |
| [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource)               | [`OpenSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#opensourceasync)         | [`EnableSourceUI()`]({{site.info}}api/WebTwain_Acquire.html#enablesourceui)                     | [`EnableSource()`]({{site.info}}api/WebTwain_Acquire.html#enablesource)                 |
| [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage)           | [`startScan()`]({{site.info}}api/WebTwain_Acquire.html#startscan)                     | [`DisableSource()`]({{site.info}}api/WebTwain_Acquire.html#disablesource)                       | [`CloseSource()`]({{site.info}}api/WebTwain_Acquire.html#closesource)                   |
| [`CloseSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourceasync)   | [`CloseWorkingProcess()`]({{site.info}}api/WebTwain_Acquire.html#closeworkingprocess) | [`GetDevicesAsync()`]({{site.info}}api/WebTwain_Acquire.html#getdevicesasync)   | [`SelectDeviceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectdeviceasync)                   |
| [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync)   |


<!--
* [`GetSourceNameItems()`]({{site.info}}api/WebTwain_Acquire.html#getsourcenameitems) 
* [`GetSourceNames()`]({{site.info}}api/WebTwain_Acquire.html#getsourcenames)
* [`GetSourceNamesAsync()`]({{site.info}}api/WebTwain_Acquire.html#getsourcenamesasync)
* [`GetDeviceType()`]({{site.info}}api/WebTwain_Acquire.html#getdevicetype)
* [`SelectSource()`]({{site.info}}api/WebTwain_Acquire.html#selectsource)
* [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync)
* [`SelectSourceByIndex()`]({{site.info}}api/WebTwain_Acquire.html#selectsourcebyindex) 
* [`SelectSourceByIndexAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourcebyindexasync) 
* [`SetOpenSourceTimeout()`]({{site.info}}api/WebTwain_Acquire.html#setopensourcetimeout)
* [`OpenSource()`]({{site.info}}api/WebTwain_Acquire.html#opensource)
* [`OpenSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#opensourceasync)
* [`EnableSourceUI()`]({{site.info}}api/WebTwain_Acquire.html#enablesourceui)
* [`EnableSource()`]({{site.info}}api/WebTwain_Acquire.html#enablesource)
* [`AcquireImage()`]({{site.info}}api/WebTwain_Acquire.html#acquireimage)
* [`startScan()`]({{site.info}}api/WebTwain_Acquire.html#startscan)
* [`DisableSource()`]({{site.info}}api/WebTwain_Acquire.html#disablesource)
* [`CloseSource()`]({{site.info}}api/WebTwain_Acquire.html#closesource)
* [`CloseSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourceasync)
* [`CloseWorkingProcess()`]({{site.info}}api/WebTwain_Acquire.html#closeworkingprocess) -->

### Properties

| | |
|:-|:-|
|[`CurrentSourceName`]({{site.info}}api/WebTwain_Acquire.html#currentsourcename) |[`IfDisableSourceAfterAcquire`]({{site.info}}api/WebTwain_Acquire.html#ifdisablesourceafteracquire) |[`IfDuplexEnabled`]({{site.info}}api/WebTwain_Acquire.html#ifduplexenabled) |[`IfFeederEnabled`]({{site.info}}api/WebTwain_Acquire.html#iffeederenabled)|
| [`PageSize`]({{site.info}}api/WebTwain_Acquire.html#pagesize) |[`PixelType`]({{site.info}}api/WebTwain_Acquire.html#pixeltype) |[`Resolution`]({{site.info}}api/WebTwain_Acquire.html#resolution) |[`SourceCount`]({{site.info}}api/WebTwain_Acquire.html#sourcecount)|

<!--

* [`CurrentSourceName`]({{site.info}}api/WebTwain_Acquire.html#currentsourcename) 
* [`IfDisableSourceAfterAcquire`]({{site.info}}api/WebTwain_Acquire.html#ifdisablesourceafteracquire)
* [`IfDuplexEnabled`]({{site.info}}api/WebTwain_Acquire.html#ifduplexenabled)  
* [`IfFeederEnabled`]({{site.info}}api/WebTwain_Acquire.html#iffeederenabled)
* [`PageSize`]({{site.info}}api/WebTwain_Acquire.html#pagesize)  
* [`PixelType`]({{site.info}}api/WebTwain_Acquire.html#pixeltype)
* [`Resolution`]({{site.info}}api/WebTwain_Acquire.html#resolution) 
* [`SourceCount`]({{site.info}}api/WebTwain_Acquire.html#sourcecount)
-->
### Events

| | |
|:-|:-|
|[`OnPostAllTransfers`]({{site.info}}api/WebTwain_Acquire.html#onpostalltransfers) | [`OnPostTransfer`]({{site.info}}api/WebTwain_Acquire.html#onposttransfer)| [`OnPostTransferAsync`]({{site.info}}api/WebTwain_Acquire.html#onposttransferasync) | 
|[`OnPreAllTransfers`]({{site.info}}api/WebTwain_Acquire.html#onprealltransfers)|[`OnPreTransfer`]({{site.info}}api/WebTwain_Acquire.html#onpretransfer)|

<!--
* [`OnPostAllTransfers`]({{site.info}}api/WebTwain_Acquire.html#onpostalltransfers)   
* [`OnPostTransfer`]({{site.info}}api/WebTwain_Acquire.html#onposttransfer)
* [`OnPostTransferAsync`]({{site.info}}api/WebTwain_Acquire.html#onposttransferasync) 
* [`OnPreAllTransfers`]({{site.info}}api/WebTwain_Acquire.html#onprealltransfers)
* [`OnPreTransfer`]({{site.info}}api/WebTwain_Acquire.html#onpretransfer)
-->
> The following APIs are compatible with TWAIN and ICA

### Methods

| | |
|:-|:-|
|[`getCapabilities()`]({{site.info}}api/WebTwain_Acquire.html#getcapabilities) | [`setCapabilities()`]({{site.info}}api/WebTwain_Acquire.html#setcapabilities)|

> The following APIs are compatible with TWAIN (mostly Windows, but could also be macOS)

### Methods

| | | | |
|:-|:-|:-|:-|
| [`OpenSourceManager()`]({{site.info}}api/WebTwain_Acquire.html#opensourcemanager)| [`OpenSourceManagerAsync()`]({{site.info}}api/WebTwain_Acquire.html#opensourcemanagerasync) | [`CloseSourceManager()`]({{site.info}}api/WebTwain_Acquire.html#closesourcemanager) | [`CloseSourceManagerAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourcemanagerasync)|
| [`GetCustomDSData()`]({{site.info}}api/WebTwain_Acquire.html#getcustomdsdata)| [`GetCustomDSDataEx()`]({{site.info}}api/WebTwain_Acquire.html#getcustomdsdataex) | [`CancelAllPendingTransfers()`]({{site.info}}api/WebTwain_Acquire.html#cancelallpendingtransfers) | [`FeedPage()`]({{site.info}}api/WebTwain_Acquire.html#feedpage) |
|[`ResetImageLayout()`]({{site.info}}api/WebTwain_Acquire.html#resetimagelayout) | [`RewindPage()`]({{site.info}}api/WebTwain_Acquire.html#rewindpage)| [`SetCustomDSData()`]({{site.info}}api/WebTwain_Acquire.html#setcustomdsdata) | [`SetCustomDSDataEx()`]({{site.info}}api/WebTwain_Acquire.html#setcustomdsdataex)|
| [`SetFileXferInfo()`]({{site.info}}api/WebTwain_Acquire.html#setfilexferinfo) | [`SetImageLayout()`]({{site.info}}api/WebTwain_Acquire.html#setimagelayout)|

### Properties

| | | | |
|:-|:-|:-|:-|
| [`BitDepth`]({{site.info}}api/WebTwain_Acquire.html#bitdepth) | [`Brightness`]({{site.info}}api/WebTwain_Acquire.html#brightness)|[`Contrast`]({{site.info}}api/WebTwain_Acquire.html#contrast) | [`DataSourceStatus`]({{site.info}}api/WebTwain_Acquire.html#datasourcestatus)| 
|[`DefaultSourceName`]({{site.info}}api/WebTwain_Acquire.html#defaultsourcename) | [`Duplex`]({{site.info}}api/WebTwain_Acquire.html#duplex)| [`IfAutoBright`]({{site.info}}api/WebTwain_Acquire.html#ifautobright) | [`IfAutoDiscardBlankpages`]({{site.info}}api/WebTwain_Acquire.html#ifautodiscardblankpages)|
|[`IfAutoFeed`]({{site.info}}api/WebTwain_Acquire.html#ifautofeed) | [`IfAutomaticBorderDetection`]({{site.info}}api/WebTwain_Acquire.html#ifautomaticborderdetection)|[`IfAutomaticDeskew`]({{site.info}}api/WebTwain_Acquire.html#ifautomaticdeskew) |[`IfAutoScan`]({{site.info}}api/WebTwain_Acquire.html#ifautoscan)|
| [`IfFeederLoaded`]({{site.info}}api/WebTwain_Acquire.html#iffeederloaded) |[`IfPaperDetectable`]({{site.info}}api/WebTwain_Acquire.html#ifpaperdetectable)| [`IfShowIndicator`]({{site.info}}api/WebTwain_Acquire.html#ifshowindicator) | [`IfShowUI`]({{site.info}}api/WebTwain_Acquire.html#ifshowui)|
| [`IfUIControllable`]({{site.info}}api/WebTwain_Acquire.html#ifuicontrollable) |[`IfUseTwainDSM`]({{site.info}}api/WebTwain_Acquire.html#ifusetwaindsm)|[`ImageCaptureDriverType`]({{site.info}}api/WebTwain_Acquire.html#imagecapturedrivertype)| [`ImageLayoutDocumentNumber`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutdocumentnumber) |
|[`ImageLayoutFrameBottom`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutframebottom)| [`ImageLayoutFrameLeft`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutframeleft) |[`ImageLayoutFrameNumber`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutframenumber)| [`ImageLayoutFrameRight`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutframeright) |
| [`ImageLayoutFrameTop`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutframetop)| [`ImageLayoutPageNumber`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutpagenumber) | [`ImagePixelType`]({{site.info}}api/WebTwain_Acquire.html#imagepixeltype)| [`MagData`]({{site.info}}api/WebTwain_Acquire.html#magdata) |
|[`MagType`]({{site.info}}api/WebTwain_Acquire.html#magtype)|[`PendingXfers`]({{site.info}}api/WebTwain_Acquire.html#pendingxfers) | [`PixelFlavor`]({{site.info}}api/WebTwain_Acquire.html#pixelflavor)| [`TransferMode`]({{site.info}}api/WebTwain_Acquire.html#transfermode) |
| [`Unit`]({{site.info}}api/WebTwain_Acquire.html#unit)|[`XferCount`]({{site.info}}api/WebTwain_Acquire.html#xfercount)|[`IfAppendImage`]({{site.info}}api/WebTwain_Acquire.html#ifappendimage)|

<!--
* [`BitDepth`]({{site.info}}api/WebTwain_Acquire.html#bitdepth)  
* [`Brightness`]({{site.info}}api/WebTwain_Acquire.html#brightness)
* [`Contrast`]({{site.info}}api/WebTwain_Acquire.html#contrast)   
* [`DataSourceStatus`]({{site.info}}api/WebTwain_Acquire.html#datasourcestatus)
* [`DefaultSourceName`]({{site.info}}api/WebTwain_Acquire.html#defaultsourcename)   
* [`Duplex`]({{site.info}}api/WebTwain_Acquire.html#duplex)
* [`IfAutoBright`]({{site.info}}api/WebTwain_Acquire.html#ifautobright)    
* [`IfAutoDiscardBlankpages`]({{site.info}}api/WebTwain_Acquire.html#ifautodiscardblankpages)
* [`IfAutoFeed`]({{site.info}}api/WebTwain_Acquire.html#ifautofeed)  
* [`IfAutomaticBorderDetection`]({{site.info}}api/WebTwain_Acquire.html#ifautomaticborderdetection)
* [`IfAutomaticDeskew`]({{site.info}}api/WebTwain_Acquire.html#ifautomaticdeskew)   
* [`IfAutoScan`]({{site.info}}api/WebTwain_Acquire.html#ifautoscan)
* [`IfFeederLoaded`]({{site.info}}api/WebTwain_Acquire.html#iffeederloaded)   
* [`IfPaperDetectable`]({{site.info}}api/WebTwain_Acquire.html#ifpaperdetectable)
* [`IfShowIndicator`]({{site.info}}api/WebTwain_Acquire.html#ifshowindicator) 
* [`IfShowUI`]({{site.info}}api/WebTwain_Acquire.html#ifshowui)
* [`IfUIControllable`]({{site.info}}api/WebTwain_Acquire.html#ifuicontrollable)  
* [`IfUseTwainDSM`]({{site.info}}api/WebTwain_Acquire.html#ifusetwaindsm)
* [`ImageCaptureDriverType`]({{site.info}}api/WebTwain_Acquire.html#imagecapturedrivertype)
* [`ImageLayoutDocumentNumber`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutdocumentnumber) 
* [`ImageLayoutFrameBottom`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutframebottom)
* [`ImageLayoutFrameLeft`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutframeleft) 
* [`ImageLayoutFrameNumber`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutframenumber)
* [`ImageLayoutFrameRight`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutframeright)  
* [`ImageLayoutFrameTop`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutframetop)
* [`ImageLayoutPageNumber`]({{site.info}}api/WebTwain_Acquire.html#imagelayoutpagenumber)  
* [`ImagePixelType`]({{site.info}}api/WebTwain_Acquire.html#imagepixeltype)
* [`MagData`]({{site.info}}api/WebTwain_Acquire.html#magdata) 
* [`MagType`]({{site.info}}api/WebTwain_Acquire.html#magtype)
* [`PendingXfers`]({{site.info}}api/WebTwain_Acquire.html#pendingxfers)   
* [`PixelFlavor`]({{site.info}}api/WebTwain_Acquire.html#pixelflavor)
* [`TransferMode`]({{site.info}}api/WebTwain_Acquire.html#transfermode)    
* [`Unit`]({{site.info}}api/WebTwain_Acquire.html#unit)
* [`XferCount`]({{site.info}}api/WebTwain_Acquire.html#xfercount)
-->
### Events

| |
|:-|
| [`OnSourceUIClose`]({{site.info}}api/WebTwain_Acquire.html#onsourceuiclose) |

## Input

### Methods

| | | | |
|:-|:-|:-|:-|
|[`LoadImage()`]({{site.info}}api/WebTwain_IO.html#loadimage)| [`LoadImageEx()`]({{site.info}}api/WebTwain_IO.html#loadimageex)|[`LoadImageFromBase64Binary()`]({{site.info}}api/WebTwain_IO.html#loadimagefrombase64binary)| [`LoadImageFromBinary()`]({{site.info}}api/WebTwain_IO.html#loadimagefrombinary)|
|[`LoadDibFromClipboard()`]({{site.info}}api/WebTwain_IO.html#loaddibfromclipboard)| [`FTPDownload()`]({{site.info}}api/WebTwain_IO.html#ftpdownload)| [`FTPDownloadEx()`]({{site.info}}api/WebTwain_IO.html#ftpdownloadex)| [`HTTPDownload()`]({{site.info}}api/WebTwain_IO.html#httpdownload)|
| [`HTTPDownloadEx()`]({{site.info}}api/WebTwain_IO.html#httpdownloadex)|[`HTTPDownloadThroughPost()`]({{site.info}}api/WebTwain_IO.html#httpdownloadthroughpost)|

<!--
* [`LoadImage()`]({{site.info}}api/WebTwain_IO.html#loadimage)
* [`LoadImageEx()`]({{site.info}}api/WebTwain_IO.html#loadimageex)
* [`LoadImageFromBase64Binary()`]({{site.info}}api/WebTwain_IO.html#loadimagefrombase64binary)
* [`LoadImageFromBinary()`]({{site.info}}api/WebTwain_IO.html#loadimagefrombinary)
* [`LoadDibFromClipboard()`]({{site.info}}api/WebTwain_IO.html#loaddibfromclipboard)
* [`FTPDownload()`]({{site.info}}api/WebTwain_IO.html#ftpdownload)
* [`FTPDownloadEx()`]({{site.info}}api/WebTwain_IO.html#ftpdownloadex)
* [`HTTPDownload()`]({{site.info}}api/WebTwain_IO.html#httpdownload)
* [`HTTPDownloadEx()`]({{site.info}}api/WebTwain_IO.html#httpdownloadex)
* [`HTTPDownloadThroughPost()`]({{site.info}}api/WebTwain_IO.html#httpdownloadthroughpost)

<!--* [`LoadDibFromClipboardAsync()`]({{site.info}}api/WebTwain_IO.html#loaddibfromclipboardasync)-->

## Output

### Methods

| | | |
|:-|:-|:-|
| [`ConvertToBase64()`]({{site.info}}api/WebTwain_IO.html#converttobase64)|[`ConvertToBlob()`]({{site.info}}api/WebTwain_IO.html#converttoblob)|[`FTPUpload()`]({{site.info}}api/WebTwain_IO.html#ftpupload)|
|[`FTPUploadEx()`]({{site.info}}api/WebTwain_IO.html#ftpuploadex)|[`FTPUploadAllAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadallasmultipagetiff)|[`FTPUploadAllAsPDF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadallaspdf)|
|[`FTPUploadAsMultiPagePDF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadasmultipagepdf)| [`FTPUploadAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadasmultipagetiff)|[`HTTPUpload()`]({{site.info}}api/WebTwain_IO.html#httpupload)| 
|[`HTTPUploadThroughPutEx()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughputex)| [`HTTPUploadThroughPost()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpost)| [`HTTPUploadThroughPostEx()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostex)|
| [`HTTPUploadAllThroughPostAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#httpuploadallthroughpostasmultipagetiff)| [`HTTPUploadAllThroughPostAsPDF()`]({{site.info}}api/WebTwain_IO.html#httpuploadallthroughpostaspdf)| [`HTTPUploadThroughPostAsMultiPagePDF()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostasmultipagepdf)|
|[`HTTPUploadThroughPostAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostasmultipagetiff)|[`OutputSelectedAreaAsync()`]({{site.info}}api/WebTwain_IO.html#outputselectedareaasync)|[`SaveAsBMP()`]({{site.info}}api/WebTwain_IO.html#saveasbmp)| 
|[`SaveAsJPEG()`]({{site.info}}api/WebTwain_IO.html#saveasjpeg)| [`SaveAsPDF()`]({{site.info}}api/WebTwain_IO.html#saveaspdf)|[`SaveAsPNG()`]({{site.info}}api/WebTwain_IO.html#saveaspng)| 
|[`SaveAsTIFF()`]({{site.info}}api/WebTwain_IO.html#saveastiff)| [`SaveSelectedImagesAsMultiPagePDF()`]({{site.info}}api/WebTwain_IO.html#saveselectedimagesasmultipagepdf)|[`SaveSelectedImagesAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#saveselectedimagesasmultipagetiff)|
| [`SaveAllAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#saveallasmultipagetiff)|[`SaveAllAsPDF()`]({{site.info}}api/WebTwain_IO.html#saveallaspdf)|[`ShareImages()`]({{site.info}}api/WebTwain_IO.html#shareimages)| 

<!--
* [`ConvertToBase64()`]({{site.info}}api/WebTwain_IO.html#converttobase64)
* [`ConvertToBlob()`]({{site.info}}api/WebTwain_IO.html#converttoblob)
* [`FTPUpload()`]({{site.info}}api/WebTwain_IO.html#ftpupload)
* [`FTPUploadEx()`]({{site.info}}api/WebTwain_IO.html#ftpuploadex)
* [`FTPUploadAllAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadallasmultipagetiff)
* [`FTPUploadAllAsPDF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadallaspdf)
* [`FTPUploadAsMultiPagePDF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadasmultipagepdf)
* [`FTPUploadAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadasmultipagetiff)
* [`HTTPUpload()`]({{site.info}}api/WebTwain_IO.html#httpupload)
* [`HTTPUploadThroughPutEx()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughputex)
* [`HTTPUploadThroughPost()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpost)
* [`HTTPUploadThroughPostEx()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostex)
* [`HTTPUploadAllThroughPostAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#httpuploadallthroughpostasmultipagetiff)
* [`HTTPUploadAllThroughPostAsPDF()`]({{site.info}}api/WebTwain_IO.html#httpuploadallthroughpostaspdf)
* [`HTTPUploadThroughPostAsMultiPagePDF()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostasmultipagepdf)
* [`HTTPUploadThroughPostAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostasmultipagetiff)
* [`SaveAsBMP()`]({{site.info}}api/WebTwain_IO.html#saveasbmp)
* [`SaveAsJPEG()`]({{site.info}}api/WebTwain_IO.html#saveasjpeg)
* [`SaveAsPDF()`]({{site.info}}api/WebTwain_IO.html#saveaspdf)
* [`SaveAsPNG()`]({{site.info}}api/WebTwain_IO.html#saveaspng)
* [`SaveAsTIFF()`]({{site.info}}api/WebTwain_IO.html#saveastiff)
* [`SaveSelectedImagesAsMultiPagePDF()`]({{site.info}}api/WebTwain_IO.html#saveselectedimagesasmultipagepdf)
* [`SaveSelectedImagesAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#saveselectedimagesasmultipagetiff)
* [`SaveAllAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#saveallasmultipagetiff)
* [`SaveAllAsPDF()`]({{site.info}}api/WebTwain_IO.html#saveallaspdf) -->

## Others

### Methods

| | | | |
|:-|:-|:-|:-|
|[`ClearTiffCustomTag()`]({{site.info}}api/WebTwain_IO.html#cleartiffcustomtag) |[`SetTiffCustomTag()`]({{site.info}}api/WebTwain_IO.html#settiffcustomtag)|[`ClearAllHTTPFormField()`]({{site.info}}api/WebTwain_IO.html#clearallhttpformfield) |[`SetHTTPFormField()`]({{site.info}}api/WebTwain_IO.html#sethttpformfield)| 
| [`SetHTTPHeader()`]({{site.info}}api/WebTwain_IO.html#sethttpheader)| [`SetUploadSegment()`]({{site.info}}api/WebTwain_IO.html#setuploadsegment)|[`ShowFileDialog()`]({{site.info}}api/WebTwain_IO.html#showfiledialog) | [`Print()`]({{site.info}}api/WebTwain_IO.html#print)|
|[`PrintEx()`]({{site.info}}api/WebTwain_IO.html#printex)|

<!--
* [`ClearTiffCustomTag()`]({{site.info}}api/WebTwain_IO.html#cleartiffcustomtag)    
* [`SetTiffCustomTag()`]({{site.info}}api/WebTwain_IO.html#settiffcustomtag)
* [`ClearAllHTTPFormField()`]({{site.info}}api/WebTwain_IO.html#clearallhttpformfield) 
* [`SetHTTPFormField()`]({{site.info}}api/WebTwain_IO.html#sethttpformfield)
* [`SetHTTPHeader()`]({{site.info}}api/WebTwain_IO.html#sethttpheader)   
* [`SetUploadSegment()`]({{site.info}}api/WebTwain_IO.html#setuploadsegment)
* [`ShowFileDialog()`]({{site.info}}api/WebTwain_IO.html#showfiledialog) 
* [`Print()`]({{site.info}}api/WebTwain_IO.html#print)
* [`PrintEx()`]({{site.info}}api/WebTwain_IO.html#printex)
-->

### Properties

| | | | |
|:-|:-|:-|:-|
|[`FTPPassword`]({{site.info}}api/WebTwain_IO.html#ftppassword) |[`FTPPort`]({{site.info}}api/WebTwain_IO.html#ftpport)| [`FTPUserName`]({{site.info}}api/WebTwain_IO.html#ftpusername) |[`IfPASVMode`]({{site.info}}api/WebTwain_IO.html#ifpasvmode)|
|[`HttpFieldNameOfUploadedImage`]({{site.info}}api/WebTwain_IO.html#httpfieldnameofuploadedimage) | [`HTTPPort`]({{site.info}}api/WebTwain_IO.html#httpport)|[`IfSSL`]({{site.info}}api/WebTwain_IO.html#ifssl)  |[`HTTPPostResponseString`]({{site.info}}api/WebTwain_IO.html#httppostresponsestring)|
|[`IfShowFileDialog`]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) |[`IfShowCancelDialogWhenImageTransfer`]({{site.info}}api/WebTwain_IO.html#ifshowcanceldialogwhenimagetransfer)| [`IfShowProgressBar`]({{site.info}}api/WebTwain_IO.html#ifshowprogressbar)  | [`JPEGQuality`]({{site.info}}api/WebTwain_IO.html#jpegquality)|
|[`IfTiffMultiPage`]({{site.info}}api/WebTwain_IO.html#iftiffmultipage) | [`TIFFCompressionType`]({{site.info}}api/WebTwain_IO.html#tiffcompressiontype)| [`MaxUploadImageSize`]({{site.info}}api/WebTwain_IO.html#maxuploadimagesize)|

<!--
* [`FTPPassword`]({{site.info}}api/WebTwain_IO.html#ftppassword)  
* [`FTPPort`]({{site.info}}api/WebTwain_IO.html#ftpport)
* [`FTPUserName`]({{site.info}}api/WebTwain_IO.html#ftpusername)  
* [`IfPASVMode`]({{site.info}}api/WebTwain_IO.html#ifpasvmode)
* [`HttpFieldNameOfUploadedImage`]({{site.info}}api/WebTwain_IO.html#httpfieldnameofuploadedimage) 
* [`HTTPPort`]({{site.info}}api/WebTwain_IO.html#httpport)
* [`IfSSL`]({{site.info}}api/WebTwain_IO.html#ifssl)  
* [`HTTPPostResponseString`]({{site.info}}api/WebTwain_IO.html#httppostresponsestring)
* [`IfShowFileDialog`]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) 
* [`IfShowCancelDialogWhenImageTransfer`]({{site.info}}api/WebTwain_IO.html#ifshowcanceldialogwhenimagetransfer)
* [`IfShowProgressBar`]({{site.info}}api/WebTwain_IO.html#ifshowprogressbar)  
* [`JPEGQuality`]({{site.info}}api/WebTwain_IO.html#jpegquality)
* [`IfTiffMultiPage`]({{site.info}}api/WebTwain_IO.html#iftiffmultipage)   
* [`TIFFCompressionType`]({{site.info}}api/WebTwain_IO.html#tiffcompressiontype)
* [`MaxUploadImageSize`]({{site.info}}api/WebTwain_IO.html#maxuploadimagesize)
* [`IfAppendImage`]({{site.info}}api/WebTwain_IO.html#ifappendimage) -->

### Events

| | | | |
|:-|:-|:-|:-|
|[`OnGetFilePath`]({{site.info}}api/WebTwain_IO.html#ongetfilepath)|[`OnPostLoad`]({{site.info}}api/WebTwain_IO.html#onpostload)| [`OnInternetTransferPercentage`]({{site.info}}api/WebTwain_IO.html#oninternettransferpercentage)|

<!--
* [`OnGetFilePath`]({{site.info}}api/WebTwain_IO.html#ongetfilepath)
* [`OnPostLoad`]({{site.info}}api/WebTwain_IO.html#onpostload)
* [`OnInternetTransferPercentage`]({{site.info}}api/WebTwain_IO.html#oninternettransferpercentage) -->

## Util

### Methods

| | | | |
|:-|:-|:-|:-|
| [`isUsingActiveX()`]({{site.info}}api/WebTwain_Util.html#isusingactivex) |[`RegisterEvent()`]({{site.info}}api/WebTwain_Util.html#registerevent) | [`UnregisterEvent()`]({{site.info}}api/WebTwain_Util.html#unregisterevent)  | [`SetLanguage()`]({{site.info}}api/WebTwain_Util.html#setlanguage)|
| [`GenerateURLForUploadData()`]({{site.info}}api/WebTwain_Util.html#generateurlforuploaddata) |

<!--
* [`RegisterEvent()`]({{site.info}}api/WebTwain_Util.html#registerevent) 
* [`UnregisterEvent()`]({{site.info}}api/WebTwain_Util.html#unregisterevent)
* [`SetProductKeyAsync()`]({{site.info}}api/WebTwain_Util.html#setproductkeyasync)
* [`SetLanguage()`]({{site.info}}api/WebTwain_Util.html#setlanguage)
* [`GenerateURLForUploadData()`]({{site.info}}api/WebTwain_Util.html#generateurlforuploaddata)-->

### Properties

| | | | |
|:-|:-|:-|:-|
|[`ErrorCode`]({{site.info}}api/WebTwain_Util.html#errorcode)| [`ErrorString`]({{site.info}}api/WebTwain_Util.html#errorstring) | [`LogLevel`]({{site.info}}api/WebTwain_Util.html#loglevel)| [`Manufacturer`]({{site.info}}api/WebTwain_Util.html#manufacturer)|
|[`ProductFamily`]({{site.info}}api/WebTwain_Util.html#productfamily)| [`ProductName`]({{site.info}}api/WebTwain_Util.html#productname)| [`VersionInfo`]({{site.info}}api/WebTwain_Util.html#versioninfo)| [`UseLocalService`]({{site.info}}api/WebTwain_Util.html#uselocalservice)|

<!--
* [`ErrorCode`]({{site.info}}api/WebTwain_Util.html#errorcode)
* [`ErrorString`]({{site.info}}api/WebTwain_Util.html#errorstring)
* [`LogLevel`]({{site.info}}api/WebTwain_Util.html#loglevel)
* [`Manufacturer`]({{site.info}}api/WebTwain_Util.html#manufacturer)
* [`ProductFamily`]({{site.info}}api/WebTwain_Util.html#productfamily)
* [`ProductName`]({{site.info}}api/WebTwain_Util.html#productname)
* [`VersionInfo`]({{site.info}}api/WebTwain_Util.html#versioninfo)
* [`ProductKey`]({{site.info}}api/WebTwain_Util.html#productkey)
* [`UseLocalService`]({{site.info}}api/WebTwain_Util.html#uselocalservice)
-->

## Viewer

### Methods

| | | | |
|:-|:-|:-|:-|
|[`bind()`]({{site.info}}api/WebTwain_Viewer.html#bind)| [`clearSelectedAreas()`]({{site.info}}api/WebTwain_Viewer.html#clearselectedareas)| [`createCustomElement()`]({{site.info}}api/WebTwain_Viewer.html#createcustomelement)| [`createImageEditor()`]({{site.info}}api/WebTwain_Viewer.html#createimageeditor)|
| [`createThumbnailViewer()`]({{site.info}}api/WebTwain_Viewer.html#createthumbnailviewer)| [`first()`]({{site.info}}api/WebTwain_Viewer.html#first)|[`fitWindow()`]({{site.info}}api/WebTwain_Viewer.html#fitwindow)|[`gotoPage()`]({{site.info}}api/WebTwain_Viewer.html#gotopage)|
| [`hide()`]({{site.info}}api/WebTwain_Viewer.html#hide)| [`last()`]({{site.info}}api/WebTwain_Viewer.html#last)| [`next()`]({{site.info}}api/WebTwain_Viewer.html#next)|[`off()`]({{site.info}}api/WebTwain_Viewer.html#off)|
|[`on()`]({{site.info}}api/WebTwain_Viewer.html#on)| [`previous()`]({{site.info}}api/WebTwain_Viewer.html#previous)| [`render()`]({{site.info}}api/WebTwain_Viewer.html#render)| [`setButtonClass()`]({{site.info}}api/WebTwain_Viewer.html#setbuttonclass)|
| [`setSelectedAreas()`]({{site.info}}api/WebTwain_Viewer.html#setselectedareas)| [`setViewMode()`]({{site.info}}api/WebTwain_Viewer.html#setviewmode) | [`show()`]({{site.info}}api/WebTwain_Viewer.html#show)| [`unbind()`]({{site.info}}api/WebTwain_Viewer.html#unbind)|
| [`createDocumentEditor()`]({{site.info}}api/WebTwain_Viewer.html#createdocumenteditor)| [`updateCheckboxStyle()`]({{site.info}}api/WebTwain_Viewer.html#updatecheckboxstyle)| [`updatePageNumberStyle()`]({{site.info}}api/WebTwain_Viewer.html#updatepagenumberstyle)| [`updateSelectionBoxStyle()`]({{site.info}}api/WebTwain_Viewer.html#updateselectionboxstyle) |

<!--
* [`bind()`]({{site.info}}api/WebTwain_Viewer.html#bind)
* [`clearSelectedAreas()`]({{site.info}}api/WebTwain_Viewer.html#clearselectedareas)
* [`createCustomElement()`]({{site.info}}api/WebTwain_Viewer.html#createcustomelement)
* [`createImageEditor()`]({{site.info}}api/WebTwain_Viewer.html#createimageeditor)
* [`createThumbnailViewer()`]({{site.info}}api/WebTwain_Viewer.html#createthumbnailviewer)
* [`first()`]({{site.info}}api/WebTwain_Viewer.html#first)
* [`fitWindow()`]({{site.info}}api/WebTwain_Viewer.html#fitwindow)
* [`gotoPage()`]({{site.info}}api/WebTwain_Viewer.html#gotopage)
* [`hide()`]({{site.info}}api/WebTwain_Viewer.html#hide)
* [`last()`]({{site.info}}api/WebTwain_Viewer.html#last)
* [`next()`]({{site.info}}api/WebTwain_Viewer.html#next)
* [`off()`]({{site.info}}api/WebTwain_Viewer.html#off)
* [`on()`]({{site.info}}api/WebTwain_Viewer.html#on)
* [`previous()`]({{site.info}}api/WebTwain_Viewer.html#previous)
* [`render()`]({{site.info}}api/WebTwain_Viewer.html#render)
* [`setButtonClass()`]({{site.info}}api/WebTwain_Viewer.html#setbuttonclass)
* [`setSelectedAreas()`]({{site.info}}api/WebTwain_Viewer.html#setselectedareas)
* [`setViewMode()`]({{site.info}}api/WebTwain_Viewer.html#setviewmode) 
* [`show()`]({{site.info}}api/WebTwain_Viewer.html#show)
* [`unbind()`]({{site.info}}api/WebTwain_Viewer.html#unbind)
-->

### Properties

| | | | |
|:-|:-|:-|:-|
|[`acceptDrop`]({{site.info}}api/WebTwain_Viewer.html#acceptdrop)| [`allowSlide`]({{site.info}}api/WebTwain_Viewer.html#allowslide)| [`allowPageDragging`]({{site.info}}api/WebTwain_Viewer.html#allowpagedragging)|[`background`]({{site.info}}api/WebTwain_Viewer.html#background)|
|[`border`]({{site.info}}api/WebTwain_Viewer.html#border) | [`cursor`]({{site.info}}api/WebTwain_Viewer.html#cursor)| [`height`]({{site.info}}api/WebTwain_Viewer.html#height)|[`idPostfix`]({{site.info}}api/WebTwain_Viewer.html#idpostfix)|
|[`ifAutoScroll`]({{site.info}}api/WebTwain_Viewer.html#ifautoscroll)|[`innerBorder`]({{site.info}}api/WebTwain_Viewer.html#innerBorder)| [`pageMargin`]({{site.info}}api/WebTwain_Viewer.html#pagemargin)|[`selectedAreaBorderColor`]({{site.info}}api/WebTwain_Viewer.html#selectedareabordercolor)|
|[`selectedPageBackground`]({{site.info}}api/WebTwain_Viewer.html#selectedpagebackground)|[`selectedPageBorder`]({{site.info}}api/WebTwain_Viewer.html#selectedpageborder)| [`selectionRectAspectRatio`]({{site.info}}api/WebTwain_Viewer.html#selectionrectaspectratio)|[`singlePageMode`]({{site.info}}api/WebTwain_Viewer.html#singlepagemode)|
|[`width`]({{site.info}}api/WebTwain_Viewer.html#width)| [`zoom`]({{site.info}}api/WebTwain_Viewer.html#zoom)| [`autoChangeIndex`]({{site.info}}api/WebTwain_Viewer.html#autochangeindex)|[`selectionMode`]({{site.info}}api/WebTwain_Viewer.html#selectionmode)|
|[`zoomOrigin`]({{site.info}}api/WebTwain_Viewer.html#zoomorigin)|

<!--
* [`acceptDrop`]({{site.info}}api/WebTwain_Viewer.html#acceptdrop)
* [`allowSlide`]({{site.info}}api/WebTwain_Viewer.html#allowslide)
* [`background`]({{site.info}}api/WebTwain_Viewer.html#background)
* [`border`]({{site.info}}api/WebTwain_Viewer.html#border)
* [`cursor`]({{site.info}}api/WebTwain_Viewer.html#cursor)
* [`height`]({{site.info}}api/WebTwain_Viewer.html#height)
* [`idPostfix`]({{site.info}}api/WebTwain_Viewer.html#idpostfix)
* [`ifAutoScroll`]({{site.info}}api/WebTwain_Viewer.html#ifautoscroll)
* [`innerBorder`]({{site.info}}api/WebTwain_Viewer.html#innerBorder)
* [`pageMargin`]({{site.info}}api/WebTwain_Viewer.html#pagemargin)
* [`selectedAreaBorderColor`]({{site.info}}api/WebTwain_Viewer.html#selectedareabordercolor)
* [`selectedPageBackground`]({{site.info}}api/WebTwain_Viewer.html#selectedpagebackground)
* [`selectedPageBorder`]({{site.info}}api/WebTwain_Viewer.html#selectedpageborder)
* [`selectionRectAspectRatio`]({{site.info}}api/WebTwain_Viewer.html#selectionrectaspectratio)
* [`showPageNumber`]({{site.info}}api/WebTwain_Viewer.html#showpagenumber)
* [`singlePageMode`]({{site.info}}api/WebTwain_Viewer.html#singlepagemode)
* [`width`]({{site.info}}api/WebTwain_Viewer.html#width)
* [`zoom`]({{site.info}}api/WebTwain_Viewer.html#zoom)
* [`autoChangeIndex`]({{site.info}}api/WebTwain_Viewer.html#autochangeindex)

-->

### Events

| | | | |
|:-|:-|:-|:-|
|[`click`]({{site.info}}api/WebTwain_Viewer.html#click)| [`contextmenu`]({{site.info}}api/WebTwain_Viewer.html#contextmenu)| [`dblclick`]({{site.info}}api/WebTwain_Viewer.html#dblclick)|[`mousemove`]({{site.info}}api/WebTwain_Viewer.html#mousemove)|
| [`mousedown`]({{site.info}}api/WebTwain_Viewer.html#mousedown)| [`mouseup`]({{site.info}}api/WebTwain_Viewer.html#mouseup)| [`mouseout`]({{site.info}}api/WebTwain_Viewer.html#mouseout)|[`mouseover`]({{site.info}}api/WebTwain_Viewer.html#mouseover)|
|[`keydown`]({{site.info}}api/WebTwain_Viewer.html#keydown)| [`keyup`]({{site.info}}api/WebTwain_Viewer.html#keyup)|[`pageAreaSelected`]({{site.info}}api/WebTwain_Viewer.html#pageareaselected)| [`pageAreaUnselected`]({{site.info}}api/WebTwain_Viewer.html#pageareaunselected)|
|[`pageRendered`]({{site.info}}api/WebTwain_Viewer.html#pagerendered)| [`resize`]({{site.info}}api/WebTwain_Viewer.html#resize)|


<!--
* [`click`]({{site.info}}api/WebTwain_Viewer.html#click)
* [`contextmenu`]({{site.info}}api/WebTwain_Viewer.html#contextmenu)
* [`dblclick`]({{site.info}}api/WebTwain_Viewer.html#dblclick)
* [`mousemove`]({{site.info}}api/WebTwain_Viewer.html#mousemove)
* [`mousedown`]({{site.info}}api/WebTwain_Viewer.html#mousedown)
* [`mouseup`]({{site.info}}api/WebTwain_Viewer.html#mouseup)
* [`mouseout`]({{site.info}}api/WebTwain_Viewer.html#mouseout)
* [`mouseover`]({{site.info}}api/WebTwain_Viewer.html#mouseover)
* [`keydown`]({{site.info}}api/WebTwain_Viewer.html#keydown)
* [`keyup`]({{site.info}}api/WebTwain_Viewer.html#keyup)
* [`pageAreaSelected`]({{site.info}}api/WebTwain_Viewer.html#pageareaselected)
* [`pageAreaUnselected`]({{site.info}}api/WebTwain_Viewer.html#pageareaunselected)
* [`pageRendered`]({{site.info}}api/WebTwain_Viewer.html#pagerendered)
* [`resize`]({{site.info}}api/WebTwain_Viewer.html#resize)
-->
<!--* [`topPageChanged`]({{site.info}}api/WebTwain_Viewer.html#toppagechanged)-->

## Addon

## BarcodeReader

### Methods

| | | | |
|:-|:-|:-|:-|
|[`decode()`]({{site.info}}api/Addon_BarcodeReader.html#decode)| [`getRuntimeSettings()`]({{site.info}}api/Addon_BarcodeReader.html#getruntimesettings)|[`updateRuntimeSettings()`]({{site.info}}api/Addon_BarcodeReader.html#updateruntimesettings)|
|[`resetRuntimeSettings()`]({{site.info}}api/Addon_BarcodeReader.html#resetruntimesettings)| [`initRuntimeSettingsWithString()`]({{site.info}}api/Addon_BarcodeReader.html#initruntimesettingswithstring)|


<!-- 
* [`decode()`]({{site.info}}api/Addon_BarcodeReader.html#decode)
* [`getRuntimeSettings()`]({{site.info}}api/Addon_BarcodeReader.html#getruntimesettings)
* [`updateRuntimeSettings()`]({{site.info}}api/Addon_BarcodeReader.html#updateruntimesettings)
* [`resetRuntimeSettings()`]({{site.info}}api/Addon_BarcodeReader.html#resetruntimesettings)
* [`initRuntimeSettingsWithString()`]({{site.info}}api/Addon_BarcodeReader.html#initruntimesettingswithstring)
-->

## PDF

### Methods

| | | | |
|:-|:-|:-|:-|
|[`GetConvertMode()`]({{site.info}}api/Addon_PDF.html#getconvertmode)| [`IsModuleInstalled()`]({{site.info}}api/Addon_PDF.html#ismoduleinstalled) | [`IsTextBasedPDF()`]({{site.info}}api/Addon_PDF.html#istextbasedpdf)| [`SetConvertMode()`]({{site.info}}api/Addon_PDF.html#setconvertmode)|
|[`SetPassword()`]({{site.info}}api/Addon_PDF.html#setpassword)|[`SetResolution()`]({{site.info}}api/Addon_PDF.html#setresolution)|[`Write.Setup()`]({{site.info}}api/Addon_PDF.html#writesetup)| [`GetReaderOptions()`]({{site.info}}api/Addon_PDF.html#getreaderoptions)|
| [`SetReaderOptions()`]({{site.info}}api/Addon_PDF.html#setreaderoptions)|

<!-- ## Camera

### Methods

| |
|:-|:-|
|[`getSourceList()`]({{site.info}}api/Addon_Camera.html#getsourcelist) | [`selectSource()`]({{site.info}}api/Addon_Camera.html#selectsource)|[`getCurrentSource()`]({{site.info}}api/Addon_Camera.html#getcurrentsource)|[`closeSource()`]({{site.info}}api/Addon_Camera.html#closesource)|
|[`getResolution()`]({{site.info}}api/Addon_Camera.html#getresolution)| [`setResolution()`]({{site.info}}api/Addon_Camera.html#setresolution)| [`getCurrentResolution()`]({{site.info}}api/Addon_Camera.html#getcurrentresolution)| [`play()`]({{site.info}}api/Addon_Camera.html#play)|
|[`pause()`]({{site.info}}api/Addon_Camera.html#pause)| [`resume()`]({{site.info}}api/Addon_Camera.html#resume)| [`stop()`]({{site.info}}api/Addon_Camera.html#stop)|[`getStatus()`]({{site.info}}api/Addon_Camera.html#getstatus)|
|[`capture()`]({{site.info}}api/Addon_Camera.html#capture)| [`showVideo()`]({{site.info}}api/Addon_Camera.html#showvideo)| [`closeVideo()`]({{site.info}}api/Addon_Camera.html#closevideo)|[`scanDocument()`]({{site.info}}api/Addon_Camera.html#scandocument)| -->

## Webcam

### Methods

| | | | |
|:-|:-|:-|:-|
|[`CaptureImage()`]({{site.info}}api/Addon_Webcam.html#captureimage) | [`CloseSource()`]({{site.info}}api/Addon_Webcam.html#closesource)| [`GetCameraControlPropertySetting()`]({{site.info}}api/Addon_Webcam.html#getcameracontrolpropertysetting) | [`GetCameraControlPropertyMoreSetting()`]({{site.info}}api/Addon_Webcam.html#getcameracontrolpropertymoresetting)|
|[`GetVideoPropertySetting()`]({{site.info}}api/Addon_Webcam.html#getvideopropertysetting)|[`GetVideoPropertyMoreSetting()`]({{site.info}}api/Addon_Webcam.html#getvideopropertymoresetting)| [`SetCameraControlPropertySetting()`]({{site.info}}api/Addon_Webcam.html#setcameracontrolpropertysetting)| [`SetVideoPropertySetting()`]({{site.info}}api/Addon_Webcam.html#setvideopropertysetting)|
|[`GetFrameRate()`]({{site.info}}api/Addon_Webcam.html#getframerate) | [`SetFrameRate()`]({{site.info}}api/Addon_Webcam.html#setframerate)| [`GetMediaType()`]({{site.info}}api/Addon_Webcam.html#getmediatype) | [`SetMediaType()`]({{site.info}}api/Addon_Webcam.html#setmediatype)|
|[`GetResolution()`]({{site.info}}api/Addon_Webcam.html#getresolution) | [`SetResolution()`]({{site.info}}api/Addon_Webcam.html#setresolution)| [`GetFramePartURL()`]({{site.info}}api/Addon_Webcam.html#getframeparturl) | [`GetFrameURL()`]({{site.info}}api/Addon_Webcam.html#getframeurl)|
|[`GetSourceList()`]({{site.info}}api/Addon_Webcam.html#getsourcelist) | [`SelectSource()`]({{site.info}}api/Addon_Webcam.html#selectsource)|[`PauseVideo()`]({{site.info}}api/Addon_Webcam.html#pausevideo) |[`PlayVideo()`]({{site.info}}api/Addon_Webcam.html#playvideo)|
|[`SetVideoRotateMode()`]({{site.info}}api/Addon_Webcam.html#setvideorotatemode) | [`StopVideo()`]({{site.info}}api/Addon_Webcam.html#stopvideo)|

## Dynamsoft.FileUploader

### Methods

| | | | |
|:-|:-|:-|:-|
| [`Init()`]({{site.info}}api/Dynamsoft_FileUploader.html#init)|[`CreateJob()`]({{site.info}}api/Dynamsoft_FileUploader.html#createjob)|[`Run()`]({{site.info}}api/Dynamsoft_FileUploader.html#run) | [`Cancel()`]({{site.info}}api/Dynamsoft_FileUploader.html#cancel)|
|[`CancelAllUpload()`]({{site.info}}api/Dynamsoft_FileUploader.html#cancelallupload)|

<div class="multi-panel-end">

</div><div class="multi-panel-start"></div>

>The Android Service Edition only supports a subset of the APIs available in the Desktop Service Edition. For the APIs that are compatible with both editions, the usage remains the same. To learn how to use the APIs, please refer to the documentation for the Desktop Service Edition.

<!-- ## Global

| | |
|:-|:-|
|[`Dynamsoft.DWT`]({{site.info}}api/Dynamsoft_WebTwainEnv.html)  | [`Dynamsoft.DWT.Enum`]({{site.info}}api/Dynamsoft_Enum.html)  |

## Events

| | |
|:-|:-|
|[`OnWebTwainReady`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#OnWebTwainReady)|[`OnWebTwainError`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#OnWebTwainError)|

## WebTwain -->

## Global

### Methods

|                                       |                                           |                                       |                                    |
|---------------------------------------|-------------------------------------------|---------------------------------------|------------------------------------|
| [`CreateDWTObject()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#createdwtobject) | [`CreateDWTobjectEx()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#createdwtobjectex) | [`DeleteDWTObject()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#deletedwtobject) | [`GetWebTwain()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#getwebtwain)      |
| [`Load()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#load)                       | [`RegisterEvent()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#registerevent)         | [`Unload()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#unload)                   |        |

<!-- [`UpdateCert()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#updatecert)  -->


### Properties

|                                         |                                                     |                                                            |                                 |
|-----------------------------------------|-----------------------------------------------------|------------------------------------------------------------|---------------------------------|
| [`Autoload`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#autoload)   | [`Containers`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#containers)  | [`CustomizableDisplayInfo`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#customizabledisplayinfo)   | [`DeviceFriendlyName`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#devicefriendlyname)   |
| [`Host`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#host)  | [`IfAddMD5InUploadHeader`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#ifaddmd5inuploadheader) | [`IfConfineMaskWithinTheViewer`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#ifconfinemaskwithintheviewer)   | [`IfUseActiveXForIE10Plus`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#ifuseactivexforie10plus)   |
| [`JSVersion`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#jsversion)     | [`ProductKey`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#productkey)     | [`ResourcesPath`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#resourcespath)      | [`ServiceInstallerLocation`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#serviceinstallerlocation) | 
| [`UseDefaultViewer`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#usedefaultviewer) |                 |                      |


### Events

|                                       |                                       |                             |                            |
|---------------------------------------|---------------------------------------|-----------------------------|----------------------------|
| [`OnWebTwainReady`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#onwebtwainready) | [`OnWebTwainError`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#onwebtwainerror) | [`OnWebTwainPostExecute`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#onwebtwainpostexecute) | [`OnWebTwainPreExecute`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#onwebtwainpreexecute) | 

## Buffer

### Methods

<!--* [`GetImageBitDepthAsync()`]({{site.info}}api/WebTwain_Buffer.html#getimagebitdepthasync)-->


| | | | |
|:-|:-|:-|:-|
|[`ClearImageTags()`]({{site.info}}api/WebTwain_Buffer.html#clearimagetags) | [`RenameTag()`]({{site.info}}api/WebTwain_Buffer.html#renametag) |[`RemoveTag()`]({{site.info}}api/WebTwain_Buffer.html#removetag) |[`GetTagList()`]({{site.info}}api/WebTwain_Buffer.html#gettaglist) |
|[`FilterImagesByTag()`]({{site.info}}api/WebTwain_Buffer.html#filterimagesbytag)|[`ClearFilter()`]({{site.info}}api/WebTwain_Buffer.html#clearfilter) | [`SetDefaultTag()`]({{site.info}}api/WebTwain_Buffer.html#setdefaulttag) | [`TagImages()`]({{site.info}}api/WebTwain_Buffer.html#tagimages)| 
|[`GetImageBitDepth()`]({{site.info}}api/WebTwain_Buffer.html#getimagebitdepth)| [`GetImageSize()`]({{site.info}}api/WebTwain_Buffer.html#getimagesize)| [`GetImageSizeWithSpecifiedType()`]({{site.info}}api/WebTwain_Buffer.html#getimagesizewithspecifiedtype)|[`GetSelectedImagesSize()`]({{site.info}}api/WebTwain_Buffer.html#getselectedimagessize) |
|[`GetImageHeight()`]({{site.info}}api/WebTwain_Buffer.html#getimageheight) |[`GetImageWidth()`]({{site.info}}api/WebTwain_Buffer.html#getimagewidth) | [`GetImagePartURL()`]({{site.info}}api/WebTwain_Buffer.html#getimageparturl) |[`GetImageURL()`]({{site.info}}api/WebTwain_Buffer.html#getimageurl)|
|[`GetImageXResolution()`]({{site.info}}api/WebTwain_Buffer.html#getimagexresolution) |[`GetImageYResolution()`]({{site.info}}api/WebTwain_Buffer.html#getimageyresolution) |[`GetSkewAngle()`]({{site.info}}api/WebTwain_Buffer.html#getskewangle) | [`GetSkewAngleEx()`]({{site.info}}api/WebTwain_Buffer.html#getskewangleex)|
|[`ImageIDToIndex()`]({{site.info}}api/WebTwain_Buffer.html#imageidtoindex) | [`IndexToImageID()`]({{site.info}}api/WebTwain_Buffer.html#indextoimageid)| [`IsBlankImage()`]({{site.info}}api/WebTwain_Buffer.html#isblankimage) | [`IsBlankImageExpress()`]({{site.info}}api/WebTwain_Buffer.html#isblankimageexpress)|  
|[`SelectAllImages()`]({{site.info}}api/WebTwain_Buffer.html#selectallimages)|[`MoveImage()`]({{site.info}}api/WebTwain_Buffer.html#moveimage) | [`SwitchImage()`]({{site.info}}api/WebTwain_Buffer.html#switchimage)| [`RemoveImage()`]({{site.info}}api/WebTwain_Buffer.html#removeimage) |
| [`RemoveAllImages()`]({{site.info}}api/WebTwain_Buffer.html#removeallimages)|[`RemoveAllSelectedImages()`]({{site.info}}api/WebTwain_Buffer.html#removeallselectedimages) |[`SelectImages()`]({{site.info}}api/WebTwain_Buffer.html#selectimages)|[`GetTagListByIndex()`]({{site.info}}api/WebTwain_Buffer.html#gettaglistbyindex) |
| [`CreateDocument()`]({{site.info}}api/WebTwain_Buffer.html#createdocument)|[`OpenDocument()`]({{site.info}}api/WebTwain_Buffer.html#opendocument)|[`GetCurrentDocumentName()`]({{site.info}}api/WebTwain_Buffer.html#getcurrentdocumentname)|[`RenameDocument()`]({{site.info}}api/WebTwain_Buffer.html#renamedocument)|
|[`RemoveDocument()`]({{site.info}}api/WebTwain_Buffer.html#removedocument)| [`GetDocumentInfoList()`]({{site.info}}api/WebTwain_Buffer.html#getdocumentinfolist)|[`CopyToDocumentAsync()`]({{site.info}}api/WebTwain_Buffer.html#copytodocumentasync) | [`MoveToDocumentAsync()`]({{site.info}}api/WebTwain_Buffer.html#movetodocumentasync) |

<!--
* [`ClearImageTags()`]({{site.info}}api/WebTwain_Buffer.html#clearimagetags) 
* [`RenameTag()`]({{site.info}}api/WebTwain_Buffer.html#renametag) 
* [`RemoveTag()`]({{site.info}}api/WebTwain_Buffer.html#removetag) 
* [`GetTagList()`]({{site.info}}api/WebTwain_Buffer.html#gettaglist) 
* [`FilterImagesByTag()`]({{site.info}}api/WebTwain_Buffer.html#filterimagesbytag)

* [`ClearFilter()`]({{site.info}}api/WebTwain_Buffer.html#clearfilter)
* [`SetDefaultTag()`]({{site.info}}api/WebTwain_Buffer.html#setdefaulttag) 
* [`TagImages()`]({{site.info}}api/WebTwain_Buffer.html#tagimages)
* [`GetImageBitDepth()`]({{site.info}}api/WebTwain_Buffer.html#getimagebitdepth)
* [`GetImageSize()`]({{site.info}}api/WebTwain_Buffer.html#getimagesize)

* [`GetImageSizeWithSpecifiedType()`]({{site.info}}api/WebTwain_Buffer.html#getimagesizewithspecifiedtype) 
* [`GetSelectedImagesSize()`]({{site.info}}api/WebTwain_Buffer.html#getselectedimagessize)
* [`GetImageHeight()`]({{site.info}}api/WebTwain_Buffer.html#getimageheight) 
* [`GetImageWidth()`]({{site.info}}api/WebTwain_Buffer.html#getimagewidth)
* [`GetImagePartURL()`]({{site.info}}api/WebTwain_Buffer.html#getimageparturl)

* [`GetImageURL()`]({{site.info}}api/WebTwain_Buffer.html#getimageurl)
* [`GetImageXResolution()`]({{site.info}}api/WebTwain_Buffer.html#getimagexresolution) 
* [`GetImageYResolution()`]({{site.info}}api/WebTwain_Buffer.html#getimageyresolution)
* [`GetSkewAngle()`]({{site.info}}api/WebTwain_Buffer.html#getskewangle) 
* [`GetSkewAngleEx()`]({{site.info}}api/WebTwain_Buffer.html#getskewangleex)

* [`ImageIDToIndex()`]({{site.info}}api/WebTwain_Buffer.html#imageidtoindex) 
* [`IndexToImageID()`]({{site.info}}api/WebTwain_Buffer.html#indextoimageid)
* [`IsBlankImage()`]({{site.info}}api/WebTwain_Buffer.html#isblankimage) 
* [`IsBlankImageExpress()`]({{site.info}}api/WebTwain_Buffer.html#isblankimageexpress)
* [`SelectAllImages()`]({{site.info}}api/WebTwain_Buffer.html#selectallimages)

* [`SelectImages()`]({{site.info}}api/WebTwain_Buffer.html#selectimages)
* [`MoveImage()`]({{site.info}}api/WebTwain_Buffer.html#moveimage) 
* [`SwitchImage()`]({{site.info}}api/WebTwain_Buffer.html#switchimage)
* [`RemoveImage()`]({{site.info}}api/WebTwain_Buffer.html#removeimage) 
* [`RemoveAllImages()`]({{site.info}}api/WebTwain_Buffer.html#removeallimages)

* [`RemoveAllSelectedImages()`]({{site.info}}api/WebTwain_Buffer.html#removeallselectedimages) -->

<!--* [`RemoveAllImagesAsync()`]({{site.info}}api/WebTwain_Buffer.html#removeallimagesasync)-->
<!--* [`RemoveAllSelectedImagesAsync()`]({{site.info}}api/WebTwain_Buffer.html#removeallselectedimagesasync)-->

### Properties

| | | | |
|:-|:-|:-|:-|
|[`BlankImageCurrentStdDev`]({{site.info}}api/WebTwain_Buffer.html#blankimagecurrentstddev) |[`BlankImageMaxStdDev`]({{site.info}}api/WebTwain_Buffer.html#blankimagemaxstddev) |[`BlankImageThreshold`]({{site.info}}api/WebTwain_Buffer.html#blankimagethreshold)| [`BufferMemoryLimit`]({{site.info}}api/WebTwain_Buffer.html#buffermemorylimit)|
|[`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer) |[`HowManyImagesInBuffer`]({{site.info}}api/WebTwain_Buffer.html#howmanyimagesinbuffer)| [`IfAllowLocalCache`]({{site.info}}api/WebTwain_Buffer.html#ifallowlocalcache) | [`SelectedImagesIndices`]({{site.info}}api/WebTwain_Buffer.html#selectedimagesindices)|
|[`MaxImagesInBuffer`]({{site.info}}api/WebTwain_Buffer.html#maximagesinbuffer)|

<!--

* [`BlankImageCurrentStdDev`]({{site.info}}api/WebTwain_Buffer.html#blanimagecurrentstddev)   
* [`BlankImageMaxStdDev`]({{site.info}}api/WebTwain_Buffer.html#blankimagemaxstddev)
* [`BlankImageThreshold`]({{site.info}}api/WebTwain_Buffer.html#blankimagethreshold)   
* [`BufferMemoryLimit`]({{site.info}}api/WebTwain_Buffer.html#buffermemorylimit)
* [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer) 
* [`HowManyImagesInBuffer`]({{site.info}}api/WebTwain_Buffer.html#howmanyimagesinbuffer)
* [`IfAllowLocalCache`]({{site.info}}api/WebTwain_Buffer.html#ifallowlocalcache)   
* [`SelectedImagesIndices`]({{site.info}}api/WebTwain_Buffer.html#selectedimagesindices)
* [`MaxImagesInBuffer`]({{site.info}}api/WebTwain_Buffer.html#maximagesinbuffer) -->

### Events

| | | | |
|:-|:-|:-|:-|
| [`OnBufferChanged`]({{site.info}}api/WebTwain_Buffer.html#onbufferchanged) |[`OnBitmapChanged`]({{site.info}}api/WebTwain_Buffer.html#onbitmapchanged) | [`OnIndexChangeDragDropDone`]({{site.info}}api/WebTwain_Buffer.html#onindexchangedragdropdone)| [`OnTopImageInTheViewChanged`]({{site.info}}api/WebTwain_Buffer.html#ontopimageintheviewchanged)|

## Edit

### Methods

| | | | |
|:-|:-|:-|:-|
|[`Crop()`]({{site.info}}api/WebTwain_Edit.html#crop)|[`CropToClipboard()`]({{site.info}}api/WebTwain_Edit.html#croptoclipboard)| [`CutFrameToClipboard()`]({{site.info}}api/WebTwain_Edit.html#cutframetoclipboard) |[`CutToClipboard()`]({{site.info}}api/WebTwain_Edit.html#cuttoclipboard)|
|[`CopyToClipboard()`]({{site.info}}api/WebTwain_Edit.html#copytoclipboard) |[`Erase()`]({{site.info}}api/WebTwain_Edit.html#erase) |[`Flip()`]({{site.info}}api/WebTwain_Edit.html#flip)|[`Mirror()`]({{site.info}}api/WebTwain_Edit.html#mirror)|
| [`Rotate()`]({{site.info}}api/WebTwain_Edit.html#rotate) |[`RotateEx()`]({{site.info}}api/WebTwain_Edit.html#rotateex)| [`RotateLeft()`]({{site.info}}api/WebTwain_Edit.html#rotateleft) | [`RotateRight()`]({{site.info}}api/WebTwain_Edit.html#rotateright)|
| [`ChangeBitDepth()`]({{site.info}}api/WebTwain_Edit.html#changebitdepth) | [`SetDPI()`]({{site.info}}api/WebTwain_Edit.html#setdpi)|[`ConvertToBW()`]({{site.info}}api/WebTwain_Edit.html#converttobw) |[`ConvertToGrayScale()`]({{site.info}}api/WebTwain_Edit.html#converttograyscale)|
|[`ChangeImageSize()`]({{site.info}}api/WebTwain_Edit.html#changeimagesize) | [`Invert()`]({{site.info}}api/WebTwain_Edit.html#invert)|[`SetImageWidth()`]({{site.info}}api/WebTwain_Edit.html#setimagewidth)|[`ChangeBrightnessAsync()`]({{site.info}}api/WebTwain_Edit.html#changebrightnessasync)|
|[`ChangeContrastAsnyc()`]({{site.info}}api/WebTwain_Edit.html#changecontrastasnyc)|

<!--
* [`Crop()`]({{site.info}}api/WebTwain_Edit.html#crop) 
* [`CropToClipboard()`]({{site.info}}api/WebTwain_Edit.html#croptoclipboard)
* [`CutFrameToClipboard()`]({{site.info}}api/WebTwain_Edit.html#cutframetoclipboard) 
* [`CutToClipboard()`]({{site.info}}api/WebTwain_Edit.html#cuttoclipboard)
* [`CopyToClipboard()`]({{site.info}}api/WebTwain_Edit.html#copytoclipboard) 
* [`Erase()`]({{site.info}}api/WebTwain_Edit.html#erase)
* [`Flip()`]({{site.info}}api/WebTwain_Edit.html#flip)
* [`Mirror()`]({{site.info}}api/WebTwain_Edit.html#mirror)
* [`Rotate()`]({{site.info}}api/WebTwain_Edit.html#rotate) 
* [`RotateEx()`]({{site.info}}api/WebTwain_Edit.html#rotateex)
* [`RotateLeft()`]({{site.info}}api/WebTwain_Edit.html#rotateleft) 
* [`RotateRight()`]({{site.info}}api/WebTwain_Edit.html#rotateright)
* [`ChangeBitDepth()`]({{site.info}}api/WebTwain_Edit.html#changebitdepth) 
* [`SetDPI()`]({{site.info}}api/WebTwain_Edit.html#setdpi)
* [`ConvertToBW()`]({{site.info}}api/WebTwain_Edit.html#converttobw) 
* [`ConvertToGrayScale()`]({{site.info}}api/WebTwain_Edit.html#converttograyscale)
* [`ChangeImageSize()`]({{site.info}}api/WebTwain_Edit.html#changeimagesize) 
* [`Invert()`]({{site.info}}api/WebTwain_Edit.html#invert)
* [`SetImageWidth()`]({{site.info}}api/WebTwain_Edit.html#setimagewidth)
-->
<!--* [`FlipAsync()`]({{site.info}}api/WebTwain_Edit.html#flipasync)-->
<!--* [`MirrorAsync()`]({{site.info}}api/WebTwain_Edit.html#mirrorasync)-->
<!--* [`RotateAsync()`]({{site.info}}api/WebTwain_Edit.html#rotate) -->
<!--* [`RotateLeftAsync()`]({{site.info}}api/WebTwain_Edit.html#rotateleft) -->
<!--* [`RotateRightAsync()`]({{site.info}}api/WebTwain_Edit.html#rotateright)-->
<!--* [`ConvertToGrayScaleAsync()`]({{site.info}}api/WebTwain_Edit.html#converttograyscaleasync)-->

### Properties

| |
|:-|
|[`BackgroundFillColor`]({{site.info}}api/WebTwain_Edit.html#backgroundfillcolor) |

<!--
* [`BackgroundFillColor`]({{site.info}}api/WebTwain_Edit.html#backgroundfillcolor) -->

## Scan

### Methods

| | | | |
| :------------------------------------------------ | :------------------------------------------ | ----------------------------------------------- | --------------------------------------------------------- |
| [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync)  | [`CloseSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourceasync)  | [`GetDevicesAsync()`]({{site.info}}api/WebTwain_Acquire.html#getdevicesasync)   | [`SelectDeviceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectdeviceasync)                   |
| [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync)   |[`getCapabilities()`]({{site.info}}api/WebTwain_Acquire.html#getcapabilities) | [`setCapabilities()`]({{site.info}}api/WebTwain_Acquire.html#setcapabilities) |

### Events

| |
|:-|
| [`OnPostTransferAsync`]({{site.info}}api/WebTwain_Acquire.html#onposttransferasync) | 


## Input

### Methods

| | | | |
|:-|:-|:-|:-|
| [`LoadImageEx()`]({{site.info}}api/WebTwain_IO.html#loadimageex)                         | [`LoadImageFromBase64Binary()`]({{site.info}}api/WebTwain_IO.html#loadimagefrombase64binary) | [`LoadImageFromBinary()`]({{site.info}}api/WebTwain_IO.html#loadimagefrombinary) |[`LoadDibFromClipboard()`]({{site.info}}api/WebTwain_IO.html#loaddibfromclipboard) |               
| [`HTTPDownload()`]({{site.info}}api/WebTwain_IO.html##httpdownload)               |[`HTTPDownloadEx()`]({{site.info}}api/WebTwain_IO.html#httpdownloadex)             | [`HTTPDownloadThroughPost()`]({{site.info}}api/WebTwain_IO.html#httpdownloadthroughpost) |

<!--
* [`LoadImage()`]({{site.info}}api/WebTwain_IO.html#loadimage)
* [`LoadImageEx()`]({{site.info}}api/WebTwain_IO.html#loadimageex)
* [`LoadImageFromBase64Binary()`]({{site.info}}api/WebTwain_IO.html#loadimagefrombase64binary)
* [`LoadImageFromBinary()`]({{site.info}}api/WebTwain_IO.html#loadimagefrombinary)
* [`LoadDibFromClipboard()`]({{site.info}}api/WebTwain_IO.html#loaddibfromclipboard)
* [`FTPDownload()`]({{site.info}}api/WebTwain_IO.html#ftpdownload)
* [`FTPDownloadEx()`]({{site.info}}api/WebTwain_IO.html#ftpdownloadex)
* [`HTTPDownload()`]({{site.info}}api/WebTwain_IO.html#httpdownload)
* [`HTTPDownloadEx()`]({{site.info}}api/WebTwain_IO.html#httpdownloadex)
* [`HTTPDownloadThroughPost()`]({{site.info}}api/WebTwain_IO.html#httpdownloadthroughpost)

<!--* [`LoadDibFromClipboardAsync()`]({{site.info}}api/WebTwain_IO.html#loaddibfromclipboardasync)-->

## Output

### Methods

| | | | |
|:-|:-|:-|:-|
| [`ConvertToBase64()`]({{site.info}}api/WebTwain_IO.html#converttobase64) | [`ConvertToBlob()`]({{site.info}}api/WebTwain_IO.html#converttoblob) | [`HTTPUpload()`]({{site.info}}api/WebTwain_IO.html#httpupload) |
| [`HTTPUploadThroughPutEx()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughputex)  | [`HTTPUploadThroughPost()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpost)  | [`HTTPUploadThroughPostEx()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostex)  |
| [`HTTPUploadAllThroughPostAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#httpuploadallthroughpostasmultipagetiff) | [`HTTPUploadAllThroughPostAsPDF()`]({{site.info}}api/WebTwain_IO.html#httpuploadallthroughpostaspdf)       | [`HTTPUploadThroughPostAsMultiPagePDF()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostasmultipagepdf) |
|[`HTTPUploadThroughPostAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostasmultipagetiff) |  [`SaveAsBMP()`]({{site.info}}api/WebTwain_IO.html#saveasbmp)   | [`SaveAsJPEG()`]({{site.info}}api/WebTwain_IO.html#saveasjpeg) | 
|[`SaveAsPDF()`]({{site.info}}api/WebTwain_IO.html#saveaspdf) | [`SaveAsPNG()`]({{site.info}}api/WebTwain_IO.html#saveaspng)|[`SaveAsTIFF()`]({{site.info}}api/WebTwain_IO.html#saveastiff)| 
|[`SaveSelectedImagesAsMultiPagePDF()`]({{site.info}}api/WebTwain_IO.html#saveselectedimagesasmultipagepdf) | [`SaveSelectedImagesAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#saveselectedimagesasmultipagetiff)|[`SaveAllAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#saveallasmultipagetiff)| 
|[`SaveAllAsPDF()`]({{site.info}}api/WebTwain_IO.html#saveallaspdf)|[`ShareImages()`]({{site.info}}api/WebTwain_IO.html#shareimages)| [`OutputSelectedAreasAsync()`]({{site.info}}api/WebTwain_IO.html#outputselectedareaasync)   |

<!--
* [`ConvertToBase64()`]({{site.info}}api/WebTwain_IO.html#converttobase64)
* [`ConvertToBlob()`]({{site.info}}api/WebTwain_IO.html#converttoblob)
* [`FTPUpload()`]({{site.info}}api/WebTwain_IO.html#ftpupload)
* [`FTPUploadEx()`]({{site.info}}api/WebTwain_IO.html#ftpuploadex)
* [`FTPUploadAllAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadallasmultipagetiff)
* [`FTPUploadAllAsPDF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadallaspdf)
* [`FTPUploadAsMultiPagePDF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadasmultipagepdf)
* [`FTPUploadAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#ftpuploadasmultipagetiff)
* [`HTTPUpload()`]({{site.info}}api/WebTwain_IO.html#httpupload)
* [`HTTPUploadThroughPutEx()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughputex)
* [`HTTPUploadThroughPost()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpost)
* [`HTTPUploadThroughPostEx()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostex)
* [`HTTPUploadAllThroughPostAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#httpuploadallthroughpostasmultipagetiff)
* [`HTTPUploadAllThroughPostAsPDF()`]({{site.info}}api/WebTwain_IO.html#httpuploadallthroughpostaspdf)
* [`HTTPUploadThroughPostAsMultiPagePDF()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostasmultipagepdf)
* [`HTTPUploadThroughPostAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#httpuploadthroughpostasmultipagetiff)
* [`SaveAsBMP()`]({{site.info}}api/WebTwain_IO.html#saveasbmp)
* [`SaveAsJPEG()`]({{site.info}}api/WebTwain_IO.html#saveasjpeg)
* [`SaveAsPDF()`]({{site.info}}api/WebTwain_IO.html#saveaspdf)
* [`SaveAsPNG()`]({{site.info}}api/WebTwain_IO.html#saveaspng)
* [`SaveAsTIFF()`]({{site.info}}api/WebTwain_IO.html#saveastiff)
* [`SaveSelectedImagesAsMultiPagePDF()`]({{site.info}}api/WebTwain_IO.html#saveselectedimagesasmultipagepdf)
* [`SaveSelectedImagesAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#saveselectedimagesasmultipagetiff)
* [`SaveAllAsMultiPageTIFF()`]({{site.info}}api/WebTwain_IO.html#saveallasmultipagetiff)
* [`SaveAllAsPDF()`]({{site.info}}api/WebTwain_IO.html#saveallaspdf) -->

## Others

### Methods

| | | | |
|:-|:-|:-|:-|
| [`ClearTiffCustomTag()`]({{site.info}}api/WebTwain_IO.html#cleartiffcustomtag) | [`SetTiffCustomTag()`]({{site.info}}api/WebTwain_IO.html#settiffcustomtag) | [`ClearAllHTTPFormField()`]({{site.info}}api/WebTwain_IO.html#clearallhttpformfield) | [`SetHTTPFormField()`]({{site.info}}api/WebTwain_IO.html#sethttpformfield) |
| [`SetHTTPHeader()`]({{site.info}}api/WebTwain_IO.html#sethttpheader)           | [`SetUploadSegment()`]({{site.info}}api/WebTwain_IO.html#setuploadsegment) |  [`Print()`]({{site.info}}api/WebTwain_IO.html#print)                       |[`PrintEx()`]({{site.info}}api/WebTwain_IO.html#printex)                       |

<!--
* [`ClearTiffCustomTag()`]({{site.info}}api/WebTwain_IO.html#cleartiffcustomtag)    
* [`SetTiffCustomTag()`]({{site.info}}api/WebTwain_IO.html#settiffcustomtag)
* [`ClearAllHTTPFormField()`]({{site.info}}api/WebTwain_IO.html#clearallhttpformfield) 
* [`SetHTTPFormField()`]({{site.info}}api/WebTwain_IO.html#sethttpformfield)
* [`SetHTTPHeader()`]({{site.info}}api/WebTwain_IO.html#sethttpheader)   
* [`SetUploadSegment()`]({{site.info}}api/WebTwain_IO.html#setuploadsegment)
* [`ShowFileDialog()`]({{site.info}}api/WebTwain_IO.html#showfiledialog) 
* [`Print()`]({{site.info}}api/WebTwain_IO.html#print)
* [`PrintEx()`]({{site.info}}api/WebTwain_IO.html#printex)
-->

### Properties

| | | | |
|:-|:-|:-|:-|
| [`HttpFieldNameOfUploadedImage`]({{site.info}}api/WebTwain_IO.html#httpfieldnameofuploadedimage) | [`HTTPPort`]({{site.info}}api/WebTwain_IO.html#httpport)                                                       | [`IfSSL`]({{site.info}}api/WebTwain_IO.html#ifssl)                           | [`HTTPPostResponseString`]({{site.info}}api/WebTwain_IO.html#httppostresponsestring) |
|[`IfShowCancelDialogWhenImageTransfer`]({{site.info}}api/WebTwain_IO.html#ifshowcanceldialogwhenimagetransfer) | [`IfShowProgressBar`]({{site.info}}api/WebTwain_IO.html#ifshowprogressbar)   | [`JPEGQuality`]({{site.info}}api/WebTwain_IO.html#jpegquality)                       | [`IfTiffMultiPage`]({{site.info}}api/WebTwain_IO.html#iftiffmultipage)                           |
| [`TIFFCompressionType`]({{site.info}}api/WebTwain_IO.html#tiffcompressiontype)                                 | [`MaxUploadImageSize`]({{site.info}}api/WebTwain_IO.html#maxuploadimagesize) |

<!--
* [`FTPPassword`]({{site.info}}api/WebTwain_IO.html#ftppassword)  
* [`FTPPort`]({{site.info}}api/WebTwain_IO.html#ftpport)
* [`FTPUserName`]({{site.info}}api/WebTwain_IO.html#ftpusername)  
* [`IfPASVMode`]({{site.info}}api/WebTwain_IO.html#ifpasvmode)
* [`HttpFieldNameOfUploadedImage`]({{site.info}}api/WebTwain_IO.html#httpfieldnameofuploadedimage) 
* [`HTTPPort`]({{site.info}}api/WebTwain_IO.html#httpport)
* [`IfSSL`]({{site.info}}api/WebTwain_IO.html#ifssl)  
* [`HTTPPostResponseString`]({{site.info}}api/WebTwain_IO.html#httppostresponsestring)
* [`IfShowFileDialog`]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) 
* [`IfShowCancelDialogWhenImageTransfer`]({{site.info}}api/WebTwain_IO.html#ifshowcanceldialogwhenimagetransfer)
* [`IfShowProgressBar`]({{site.info}}api/WebTwain_IO.html#ifshowprogressbar)  
* [`JPEGQuality`]({{site.info}}api/WebTwain_IO.html#jpegquality)
* [`IfTiffMultiPage`]({{site.info}}api/WebTwain_IO.html#iftiffmultipage)   
* [`TIFFCompressionType`]({{site.info}}api/WebTwain_IO.html#tiffcompressiontype)
* [`MaxUploadImageSize`]({{site.info}}api/WebTwain_IO.html#maxuploadimagesize)
* [`IfAppendImage`]({{site.info}}api/WebTwain_IO.html#ifappendimage) -->

### Events

| | |
|:-|:-|
|[`OnPostLoad`]({{site.info}}api/WebTwain_IO.html#onpostload)| [`OnInternetTransferPercentage`]({{site.info}}api/WebTwain_IO.html#oninternettransferpercentage)|

<!--
* [`OnGetFilePath`]({{site.info}}api/WebTwain_IO.html#ongetfilepath)
* [`OnPostLoad`]({{site.info}}api/WebTwain_IO.html#onpostload)
* [`OnInternetTransferPercentage`]({{site.info}}api/WebTwain_IO.html#oninternettransferpercentage) -->

## Util

### Methods

| | | | |
|:-|:-|:-|:-|
| [`isUsingActiveX()`]({{site.info}}api/WebTwain_Util.html#isusingactivex) |[`RegisterEvent()`]({{site.info}}api/WebTwain_Util.html#registerevent) | [`UnregisterEvent()`]({{site.info}}api/WebTwain_Util.html#unregisterevent) |[`GenerateURLForUploadData()`]({{site.info}}api/WebTwain_Util.html#generateurlforuploaddata)|

<!--
* [`RegisterEvent()`]({{site.info}}api/WebTwain_Util.html#registerevent) 
* [`UnregisterEvent()`]({{site.info}}api/WebTwain_Util.html#unregisterevent)
* [`SetProductKeyAsync()`]({{site.info}}api/WebTwain_Util.html#setproductkeyasync)
* [`SetLanguage()`]({{site.info}}api/WebTwain_Util.html#setlanguage)
* [`GenerateURLForUploadData()`]({{site.info}}api/WebTwain_Util.html#generateurlforuploaddata)-->

### Properties

| | | | |
|:-|:-|:-|:-|
|[`ErrorCode`]({{site.info}}api/WebTwain_Util.html#errorcode)| [`ErrorString`]({{site.info}}api/WebTwain_Util.html#errorstring) | [`LogLevel`]({{site.info}}api/WebTwain_Util.html#loglevel)| [`Manufacturer`]({{site.info}}api/WebTwain_Util.html#manufacturer)|
|[`ProductFamily`]({{site.info}}api/WebTwain_Util.html#productfamily)| [`ProductName`]({{site.info}}api/WebTwain_Util.html#productname)| [`VersionInfo`]({{site.info}}api/WebTwain_Util.html#versioninfo)| [`UseLocalService`]({{site.info}}api/WebTwain_Util.html#uselocalservice)|

<!--
* [`ErrorCode`]({{site.info}}api/WebTwain_Util.html#errorcode)
* [`ErrorString`]({{site.info}}api/WebTwain_Util.html#errorstring)
* [`LogLevel`]({{site.info}}api/WebTwain_Util.html#loglevel)
* [`Manufacturer`]({{site.info}}api/WebTwain_Util.html#manufacturer)
* [`ProductFamily`]({{site.info}}api/WebTwain_Util.html#productfamily)
* [`ProductName`]({{site.info}}api/WebTwain_Util.html#productname)
* [`VersionInfo`]({{site.info}}api/WebTwain_Util.html#versioninfo)
* [`ProductKey`]({{site.info}}api/WebTwain_Util.html#productkey)
* [`UseLocalService`]({{site.info}}api/WebTwain_Util.html#uselocalservice)
-->

## Viewer

### Methods

| | | | |
|:-|:-|:-|:-|
|[`bind()`]({{site.info}}api/WebTwain_Viewer.html#bind)| [`clearSelectedAreas()`]({{site.info}}api/WebTwain_Viewer.html#clearselectedareas)| [`createCustomElement()`]({{site.info}}api/WebTwain_Viewer.html#createcustomelement)| [`createImageEditor()`]({{site.info}}api/WebTwain_Viewer.html#createimageeditor)|
| [`createThumbnailViewer()`]({{site.info}}api/WebTwain_Viewer.html#createthumbnailviewer)| [`first()`]({{site.info}}api/WebTwain_Viewer.html#first)|[`fitWindow()`]({{site.info}}api/WebTwain_Viewer.html#fitwindow)|[`gotoPage()`]({{site.info}}api/WebTwain_Viewer.html#gotopage)|
| [`hide()`]({{site.info}}api/WebTwain_Viewer.html#hide)| [`last()`]({{site.info}}api/WebTwain_Viewer.html#last)| [`next()`]({{site.info}}api/WebTwain_Viewer.html#next)|[`off()`]({{site.info}}api/WebTwain_Viewer.html#off)|
|[`on()`]({{site.info}}api/WebTwain_Viewer.html#on)| [`previous()`]({{site.info}}api/WebTwain_Viewer.html#previous)| [`render()`]({{site.info}}api/WebTwain_Viewer.html#render)| [`setButtonClass()`]({{site.info}}api/WebTwain_Viewer.html#setbuttonclass)|
| [`setSelectedAreas()`]({{site.info}}api/WebTwain_Viewer.html#setselectedareas)| [`setViewMode()`]({{site.info}}api/WebTwain_Viewer.html#setviewmode) | [`show()`]({{site.info}}api/WebTwain_Viewer.html#show)| [`unbind()`]({{site.info}}api/WebTwain_Viewer.html#unbind)|
| [`createDocumentEditor()`]({{site.info}}api/WebTwain_Viewer.html#createdocumenteditor)| [`updateCheckboxStyle()`]({{site.info}}api/WebTwain_Viewer.html#updatecheckboxstyle)| [`updatePageNumberStyle()`]({{site.info}}api/WebTwain_Viewer.html#updatepagenumberstyle)| [`updateSelectionBoxStyle()`]({{site.info}}api/WebTwain_Viewer.html#updateselectionboxstyle) |

<!--
* [`bind()`]({{site.info}}api/WebTwain_Viewer.html#bind)
* [`clearSelectedAreas()`]({{site.info}}api/WebTwain_Viewer.html#clearselectedareas)
* [`createCustomElement()`]({{site.info}}api/WebTwain_Viewer.html#createcustomelement)
* [`createImageEditor()`]({{site.info}}api/WebTwain_Viewer.html#createimageeditor)
* [`createThumbnailViewer()`]({{site.info}}api/WebTwain_Viewer.html#createthumbnailviewer)
* [`first()`]({{site.info}}api/WebTwain_Viewer.html#first)
* [`fitWindow()`]({{site.info}}api/WebTwain_Viewer.html#fitwindow)
* [`gotoPage()`]({{site.info}}api/WebTwain_Viewer.html#gotopage)
* [`hide()`]({{site.info}}api/WebTwain_Viewer.html#hide)
* [`last()`]({{site.info}}api/WebTwain_Viewer.html#last)
* [`next()`]({{site.info}}api/WebTwain_Viewer.html#next)
* [`off()`]({{site.info}}api/WebTwain_Viewer.html#off)
* [`on()`]({{site.info}}api/WebTwain_Viewer.html#on)
* [`previous()`]({{site.info}}api/WebTwain_Viewer.html#previous)
* [`render()`]({{site.info}}api/WebTwain_Viewer.html#render)
* [`setButtonClass()`]({{site.info}}api/WebTwain_Viewer.html#setbuttonclass)
* [`setSelectedAreas()`]({{site.info}}api/WebTwain_Viewer.html#setselectedareas)
* [`setViewMode()`]({{site.info}}api/WebTwain_Viewer.html#setviewmode) 
* [`show()`]({{site.info}}api/WebTwain_Viewer.html#show)
* [`unbind()`]({{site.info}}api/WebTwain_Viewer.html#unbind)
-->

### Properties

| | | | |
|:-|:-|:-|:-|
|[`acceptDrop`]({{site.info}}api/WebTwain_Viewer.html#acceptdrop)| [`allowSlide`]({{site.info}}api/WebTwain_Viewer.html#allowslide)| [`allowPageDragging`]({{site.info}}api/WebTwain_Viewer.html#allowpagedragging)|[`background`]({{site.info}}api/WebTwain_Viewer.html#background)|
|[`border`]({{site.info}}api/WebTwain_Viewer.html#border) | [`cursor`]({{site.info}}api/WebTwain_Viewer.html#cursor)| [`height`]({{site.info}}api/WebTwain_Viewer.html#height)|[`idPostfix`]({{site.info}}api/WebTwain_Viewer.html#idpostfix)|
|[`ifAutoScroll`]({{site.info}}api/WebTwain_Viewer.html#ifautoscroll)|[`innerBorder`]({{site.info}}api/WebTwain_Viewer.html#innerBorder)| [`pageMargin`]({{site.info}}api/WebTwain_Viewer.html#pagemargin)|[`selectedAreaBorderColor`]({{site.info}}api/WebTwain_Viewer.html#selectedareabordercolor)|
|[`selectedPageBackground`]({{site.info}}api/WebTwain_Viewer.html#selectedpagebackground)|[`selectedPageBorder`]({{site.info}}api/WebTwain_Viewer.html#selectedpageborder)| [`selectionRectAspectRatio`]({{site.info}}api/WebTwain_Viewer.html#selectionrectaspectratio)|[`singlePageMode`]({{site.info}}api/WebTwain_Viewer.html#singlepagemode)|
|[`width`]({{site.info}}api/WebTwain_Viewer.html#width)| [`zoom`]({{site.info}}api/WebTwain_Viewer.html#zoom)| [`autoChangeIndex`]({{site.info}}api/WebTwain_Viewer.html#autochangeindex)|[`selectionMode`]({{site.info}}api/WebTwain_Viewer.html#selectionmode)|
|[`zoomOrigin`]({{site.info}}api/WebTwain_Viewer.html#zoomorigin)|

<!--
* [`acceptDrop`]({{site.info}}api/WebTwain_Viewer.html#acceptdrop)
* [`allowSlide`]({{site.info}}api/WebTwain_Viewer.html#allowslide)
* [`background`]({{site.info}}api/WebTwain_Viewer.html#background)
* [`border`]({{site.info}}api/WebTwain_Viewer.html#border)
* [`cursor`]({{site.info}}api/WebTwain_Viewer.html#cursor)
* [`height`]({{site.info}}api/WebTwain_Viewer.html#height)
* [`idPostfix`]({{site.info}}api/WebTwain_Viewer.html#idpostfix)
* [`ifAutoScroll`]({{site.info}}api/WebTwain_Viewer.html#ifautoscroll)
* [`innerBorder`]({{site.info}}api/WebTwain_Viewer.html#innerBorder)
* [`pageMargin`]({{site.info}}api/WebTwain_Viewer.html#pagemargin)
* [`selectedAreaBorderColor`]({{site.info}}api/WebTwain_Viewer.html#selectedareabordercolor)
* [`selectedPageBackground`]({{site.info}}api/WebTwain_Viewer.html#selectedpagebackground)
* [`selectedPageBorder`]({{site.info}}api/WebTwain_Viewer.html#selectedpageborder)
* [`selectionRectAspectRatio`]({{site.info}}api/WebTwain_Viewer.html#selectionrectaspectratio)
* [`showPageNumber`]({{site.info}}api/WebTwain_Viewer.html#showpagenumber)
* [`singlePageMode`]({{site.info}}api/WebTwain_Viewer.html#singlepagemode)
* [`width`]({{site.info}}api/WebTwain_Viewer.html#width)
* [`zoom`]({{site.info}}api/WebTwain_Viewer.html#zoom)
* [`autoChangeIndex`]({{site.info}}api/WebTwain_Viewer.html#autochangeindex)

-->

### Events

| | | | |
|:-|:-|:-|:-|
|[`click`]({{site.info}}api/WebTwain_Viewer.html#click)| [`contextmenu`]({{site.info}}api/WebTwain_Viewer.html#contextmenu)| [`dblclick`]({{site.info}}api/WebTwain_Viewer.html#dblclick)|[`mousemove`]({{site.info}}api/WebTwain_Viewer.html#mousemove)|
| [`mousedown`]({{site.info}}api/WebTwain_Viewer.html#mousedown)| [`mouseup`]({{site.info}}api/WebTwain_Viewer.html#mouseup)| [`mouseout`]({{site.info}}api/WebTwain_Viewer.html#mouseout)|[`mouseover`]({{site.info}}api/WebTwain_Viewer.html#mouseover)|
|[`keydown`]({{site.info}}api/WebTwain_Viewer.html#keydown)| [`keyup`]({{site.info}}api/WebTwain_Viewer.html#keyup)|[`pageAreaSelected`]({{site.info}}api/WebTwain_Viewer.html#pageareaselected)| [`pageAreaUnselected`]({{site.info}}api/WebTwain_Viewer.html#pageareaunselected)|
|[`pageRendered`]({{site.info}}api/WebTwain_Viewer.html#pagerendered)| [`resize`]({{site.info}}api/WebTwain_Viewer.html#resize)|


<!--
* [`click`]({{site.info}}api/WebTwain_Viewer.html#click)
* [`contextmenu`]({{site.info}}api/WebTwain_Viewer.html#contextmenu)
* [`dblclick`]({{site.info}}api/WebTwain_Viewer.html#dblclick)
* [`mousemove`]({{site.info}}api/WebTwain_Viewer.html#mousemove)
* [`mousedown`]({{site.info}}api/WebTwain_Viewer.html#mousedown)
* [`mouseup`]({{site.info}}api/WebTwain_Viewer.html#mouseup)
* [`mouseout`]({{site.info}}api/WebTwain_Viewer.html#mouseout)
* [`mouseover`]({{site.info}}api/WebTwain_Viewer.html#mouseover)
* [`keydown`]({{site.info}}api/WebTwain_Viewer.html#keydown)
* [`keyup`]({{site.info}}api/WebTwain_Viewer.html#keyup)
* [`pageAreaSelected`]({{site.info}}api/WebTwain_Viewer.html#pageareaselected)
* [`pageAreaUnselected`]({{site.info}}api/WebTwain_Viewer.html#pageareaunselected)
* [`pageRendered`]({{site.info}}api/WebTwain_Viewer.html#pagerendered)
* [`resize`]({{site.info}}api/WebTwain_Viewer.html#resize)
-->
<!--* [`topPageChanged`]({{site.info}}api/WebTwain_Viewer.html#toppagechanged)-->

## Addon

## PDF

### Methods

| | | | |
|:-|:-|:-|:-|
|[`GetConvertMode()`]({{site.info}}api/Addon_PDF.html#getconvertmode)| [`IsModuleInstalled()`]({{site.info}}api/Addon_PDF.html#ismoduleinstalled) | [`IsTextBasedPDF()`]({{site.info}}api/Addon_PDF.html#istextbasedpdf)| [`SetConvertMode()`]({{site.info}}api/Addon_PDF.html#setconvertmode)|
|[`SetPassword()`]({{site.info}}api/Addon_PDF.html#setpassword)|[`SetResolution()`]({{site.info}}api/Addon_PDF.html#setresolution)|[`Write.Setup()`]({{site.info}}api/Addon_PDF.html#writesetup)| [`GetReaderOptions()`]({{site.info}}api/Addon_PDF.html#getreaderoptions) |
| [`SetReaderOptions()`]({{site.info}}api/Addon_PDF.html#setreaderoptions) |



<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>

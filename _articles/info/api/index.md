---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - Index
keywords: Dynamic Web TWAIN, Documentation, API Reference, Index
description: Dynamic Web TWAIN Documentation API List
breadcrumbText: API Reference
---

> Some old APIs are deprecated, check out [Deprecated Features and APIs](/_articles/info/schedule/deprecated.md)

# API List

<!-- ## Global

| | |
|:-|:-|
|[`Dynamsoft.DWT`](/_articles/info/api/Dynamsoft_WebTwainEnv.md)  | [`Dynamsoft.DWT.Enum`](/_articles/info/api/Dynamsoft_Enum.md)  |

## Events

| | |
|:-|:-|
|[`OnWebTwainReady`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#OnWebTwainReady)|[`OnWebTwainError`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#OnWebTwainError)|

## WebTwain -->

## Global

### Methods

| [`CreateDWTObject()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#createdwtobject) | [`CreateDWTobjectEx()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#createdwtobjectex) | [`DeleteDWTObject()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#deletedwtobject) | [`GetWebTwain()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#getwebtwain) |
| [`Load()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#load) | [`RegisterEvent()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#registerevent) | [`Unload()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#unload) | |

 <!-- [`UpdateCert()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#updatecert)         -->

### Properties

| [`Autoload`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#autoload)       | [`Containers`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#containers)                                 | [`CustomizableDisplayInfo`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#customizabledisplayinfo)           | [`DeviceFriendlyName`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#devicefriendlyname) |
| [`Host`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#host)               | [`IfAddMD5InUploadHeader`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#ifaddmd5inuploadheader)         | [`IfConfineMaskWithinTheViewer`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#ifconfinemaskwithintheviewer) | [`JSVersion`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#jsversion)                   |
| [`ProductKey`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#productkey)   | [`ResourcesPath`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#resourcespath)                           | [`ServiceInstallerLocation`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#serviceinstallerlocation)         | [`UseDefaultViewer`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#usedefaultviewer)     |
| [`IfCheckCORS`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#ifcheckcors) | [`IfAlwaysFocusOnPopupWindow`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#ifalwaysfocusonpopupwindow) |                                                                                                             |

### Events

| [`OnWebTwainReady`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#onwebtwainready) | [`OnWebTwainError`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#onwebtwainerror) | [`OnWebTwainPostExecute`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#onwebtwainpostexecute) | [`OnWebTwainPreExecute`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#onwebtwainpreexecute) |

## Buffer

### Methods

<!--* [`GetImageBitDepthAsync()`](/_articles/info/api/WebTwain_Buffer.md#getimagebitdepthasync)-->

| [`ClearImageTags()`](/_articles/info/api/WebTwain_Buffer.md#clearimagetags)           | [`RenameTag()`](/_articles/info/api/WebTwain_Buffer.md#renametag)                             | [`RemoveTag()`](/_articles/info/api/WebTwain_Buffer.md#removetag)                                         | [`GetTagList()`](/_articles/info/api/WebTwain_Buffer.md#gettaglist)                       |
| [`FilterImagesByTag()`](/_articles/info/api/WebTwain_Buffer.md#filterimagesbytag)     | [`ClearFilter()`](/_articles/info/api/WebTwain_Buffer.md#clearfilter)                         | [`SetDefaultTag()`](/_articles/info/api/WebTwain_Buffer.md#setdefaulttag)                                 | [`TagImages()`](/_articles/info/api/WebTwain_Buffer.md#tagimages)                         |
| [`GetImageBitDepth()`](/_articles/info/api/WebTwain_Buffer.md#getimagebitdepth)       | [`GetImageSize()`](/_articles/info/api/WebTwain_Buffer.md#getimagesize)                       | [`GetImageSizeWithSpecifiedType()`](/_articles/info/api/WebTwain_Buffer.md#getimagesizewithspecifiedtype) | [`GetSelectedImagesSize()`](/_articles/info/api/WebTwain_Buffer.md#getselectedimagessize) |
| [`GetImageHeight()`](/_articles/info/api/WebTwain_Buffer.md#getimageheight)           | [`GetImageWidth()`](/_articles/info/api/WebTwain_Buffer.md#getimagewidth)                     | [`GetImagePartURL()`](/_articles/info/api/WebTwain_Buffer.md#getimageparturl)                             | [`GetImageURL()`](/_articles/info/api/WebTwain_Buffer.md#getimageurl)                     |
| [`GetImageXResolution()`](/_articles/info/api/WebTwain_Buffer.md#getimagexresolution) | [`GetImageYResolution()`](/_articles/info/api/WebTwain_Buffer.md#getimageyresolution)         | [`GetSkewAngle()`](/_articles/info/api/WebTwain_Buffer.md#getskewangle)                                   | [`GetSkewAngleEx()`](/_articles/info/api/WebTwain_Buffer.md#getskewangleex)               |
| [`ImageIDToIndex()`](/_articles/info/api/WebTwain_Buffer.md#imageidtoindex)           | [`IndexToImageID()`](/_articles/info/api/WebTwain_Buffer.md#indextoimageid)                   | [`IsBlankImage()`](/_articles/info/api/WebTwain_Buffer.md#isblankimage)                                   | [`IsBlankImageExpress()`](/_articles/info/api/WebTwain_Buffer.md#isblankimageexpress)     |
| [`SelectAllImages()`](/_articles/info/api/WebTwain_Buffer.md#selectallimages)         | [`MoveImage()`](/_articles/info/api/WebTwain_Buffer.md#moveimage)                             | [`SwitchImage()`](/_articles/info/api/WebTwain_Buffer.md#switchimage)                                     | [`RemoveImage()`](/_articles/info/api/WebTwain_Buffer.md#removeimage)                     |
| [`RemoveAllImages()`](/_articles/info/api/WebTwain_Buffer.md#removeallimages)         | [`RemoveAllSelectedImages()`](/_articles/info/api/WebTwain_Buffer.md#removeallselectedimages) | [`SelectImages()`](/_articles/info/api/WebTwain_Buffer.md#selectimages)                                   | [`GetTagListByIndex()`](/_articles/info/api/WebTwain_Buffer.md#gettaglistbyindex)         |
| [`CreateDocument()`](/_articles/info/api/WebTwain_Buffer.md#createdocument)           | [`OpenDocument()`](/_articles/info/api/WebTwain_Buffer.md#opendocument)                       | [`GetCurrentDocumentName()`](/_articles/info/api/WebTwain_Buffer.md#getcurrentdocumentname)               | [`RenameDocument()`](/_articles/info/api/WebTwain_Buffer.md#renamedocument)               |
| [`RemoveDocument()`](/_articles/info/api/WebTwain_Buffer.md#removedocument)           | [`GetDocumentInfoList()`](/_articles/info/api/WebTwain_Buffer.md#getdocumentinfolist)         | [`IsBlankImageAsync()`](/_articles/info/api/WebTwain_Buffer.md#isblankimageasync)                         | [`CopyToDocumentAsync()`](/_articles/info/api/WebTwain_Buffer.md#copytodocumentasync)     |
| [`MoveToDocumentAsync()`](/_articles/info/api/WebTwain_Buffer.md#movetodocumentasync) | [`updateImage()`](/_articles/info/api/WebTwain_Buffer.md#updateimage)                         |

<!--
* [`ClearImageTags()`](/_articles/info/api/WebTwain_Buffer.md#clearimagetags)
* [`RenameTag()`](/_articles/info/api/WebTwain_Buffer.md#renametag)
* [`RemoveTag()`](/_articles/info/api/WebTwain_Buffer.md#removetag)
* [`GetTagList()`](/_articles/info/api/WebTwain_Buffer.md#gettaglist)
* [`FilterImagesByTag()`](/_articles/info/api/WebTwain_Buffer.md#filterimagesbytag)

* [`ClearFilter()`](/_articles/info/api/WebTwain_Buffer.md#clearfilter)
* [`SetDefaultTag()`](/_articles/info/api/WebTwain_Buffer.md#setdefaulttag)
* [`TagImages()`](/_articles/info/api/WebTwain_Buffer.md#tagimages)
* [`GetImageBitDepth()`](/_articles/info/api/WebTwain_Buffer.md#getimagebitdepth)
* [`GetImageSize()`](/_articles/info/api/WebTwain_Buffer.md#getimagesize)

* [`GetImageSizeWithSpecifiedType()`](/_articles/info/api/WebTwain_Buffer.md#getimagesizewithspecifiedtype)
* [`GetSelectedImagesSize()`](/_articles/info/api/WebTwain_Buffer.md#getselectedimagessize)
* [`GetImageHeight()`](/_articles/info/api/WebTwain_Buffer.md#getimageheight)
* [`GetImageWidth()`](/_articles/info/api/WebTwain_Buffer.md#getimagewidth)
* [`GetImagePartURL()`](/_articles/info/api/WebTwain_Buffer.md#getimageparturl)

* [`GetImageURL()`](/_articles/info/api/WebTwain_Buffer.md#getimageurl)
* [`GetImageXResolution()`](/_articles/info/api/WebTwain_Buffer.md#getimagexresolution)
* [`GetImageYResolution()`](/_articles/info/api/WebTwain_Buffer.md#getimageyresolution)
* [`GetSkewAngle()`](/_articles/info/api/WebTwain_Buffer.md#getskewangle)
* [`GetSkewAngleEx()`](/_articles/info/api/WebTwain_Buffer.md#getskewangleex)

* [`ImageIDToIndex()`](/_articles/info/api/WebTwain_Buffer.md#imageidtoindex)
* [`IndexToImageID()`](/_articles/info/api/WebTwain_Buffer.md#indextoimageid)
* [`IsBlankImage()`](/_articles/info/api/WebTwain_Buffer.md#isblankimage)
* [`IsBlankImageExpress()`](/_articles/info/api/WebTwain_Buffer.md#isblankimageexpress)
* [`SelectAllImages()`](/_articles/info/api/WebTwain_Buffer.md#selectallimages)

* [`SelectImages()`](/_articles/info/api/WebTwain_Buffer.md#selectimages)
* [`MoveImage()`](/_articles/info/api/WebTwain_Buffer.md#moveimage)
* [`SwitchImage()`](/_articles/info/api/WebTwain_Buffer.md#switchimage)
* [`RemoveImage()`](/_articles/info/api/WebTwain_Buffer.md#removeimage)
* [`RemoveAllImages()`](/_articles/info/api/WebTwain_Buffer.md#removeallimages)

* [`RemoveAllSelectedImages()`](/_articles/info/api/WebTwain_Buffer.md#removeallselectedimages) -->

<!--* [`RemoveAllImagesAsync()`](/_articles/info/api/WebTwain_Buffer.md#removeallimagesasync)-->
<!--* [`RemoveAllSelectedImagesAsync()`](/_articles/info/api/WebTwain_Buffer.md#removeallselectedimagesasync)-->

### Properties

| [`BlankImageCurrentStdDev`](/_articles/info/api/WebTwain_Buffer.md#blankimagecurrentstddev)     | [`BlankImageMaxStdDev`](/_articles/info/api/WebTwain_Buffer.md#blankimagemaxstddev)     | [`BlankImageThreshold`](/_articles/info/api/WebTwain_Buffer.md#blankimagethreshold) | [`BufferMemoryLimit`](/_articles/info/api/WebTwain_Buffer.md#buffermemorylimit)         |
| [`CurrentImageIndexInBuffer`](/_articles/info/api/WebTwain_Buffer.md#currentimageindexinbuffer) | [`HowManyImagesInBuffer`](/_articles/info/api/WebTwain_Buffer.md#howmanyimagesinbuffer) | [`IfAllowLocalCache`](/_articles/info/api/WebTwain_Buffer.md#ifallowlocalcache)     | [`SelectedImagesIndices`](/_articles/info/api/WebTwain_Buffer.md#selectedimagesindices) |
| [`MaxImagesInBuffer`](/_articles/info/api/WebTwain_Buffer.md#maximagesinbuffer)                 |

<!--

* [`BlankImageCurrentStdDev`](/_articles/info/api/WebTwain_Buffer.md#blanimagecurrentstddev)
* [`BlankImageMaxStdDev`](/_articles/info/api/WebTwain_Buffer.md#blankimagemaxstddev)
* [`BlankImageThreshold`](/_articles/info/api/WebTwain_Buffer.md#blankimagethreshold)
* [`BufferMemoryLimit`](/_articles/info/api/WebTwain_Buffer.md#buffermemorylimit)
* [`CurrentImageIndexInBuffer`](/_articles/info/api/WebTwain_Buffer.md#currentimageindexinbuffer)
* [`HowManyImagesInBuffer`](/_articles/info/api/WebTwain_Buffer.md#howmanyimagesinbuffer)
* [`IfAllowLocalCache`](/_articles/info/api/WebTwain_Buffer.md#ifallowlocalcache)
* [`SelectedImagesIndices`](/_articles/info/api/WebTwain_Buffer.md#selectedimagesindices)
* [`MaxImagesInBuffer`](/_articles/info/api/WebTwain_Buffer.md#maximagesinbuffer) -->

### Events

| [`OnBufferChanged`](/_articles/info/api/WebTwain_Buffer.md#onbufferchanged)     | [`OnBitmapChanged`](/_articles/info/api/WebTwain_Buffer.md#onbitmapchanged) | [`OnIndexChangeDragDropDone`](/_articles/info/api/WebTwain_Buffer.md#onindexchangedragdropdone) | [`OnTopImageInTheViewChanged`](/_articles/info/api/WebTwain_Buffer.md#ontopimageintheviewchanged) |
| [`OnDiskExceedLimit`](/_articles/info/api/WebTwain_Buffer.md#ondiskexceedlimit) |

## Edit

### Methods

| [`Crop()`](/_articles/info/api/WebTwain_Edit.md#crop)                               | [`CropToClipboard()`](/_articles/info/api/WebTwain_Edit.md#croptoclipboard) | [`CutFrameToClipboard()`](/_articles/info/api/WebTwain_Edit.md#cutframetoclipboard) | [`CutToClipboard()`](/_articles/info/api/WebTwain_Edit.md#cuttoclipboard)               |
| [`CopyToClipboard()`](/_articles/info/api/WebTwain_Edit.md#copytoclipboard)         | [`Erase()`](/_articles/info/api/WebTwain_Edit.md#erase)                     | [`Flip()`](/_articles/info/api/WebTwain_Edit.md#flip)                               | [`Mirror()`](/_articles/info/api/WebTwain_Edit.md#mirror)                               |
| [`Rotate()`](/_articles/info/api/WebTwain_Edit.md#rotate)                           | [`RotateEx()`](/_articles/info/api/WebTwain_Edit.md#rotateex)               | [`RotateLeft()`](/_articles/info/api/WebTwain_Edit.md#rotateleft)                   | [`RotateRight()`](/_articles/info/api/WebTwain_Edit.md#rotateright)                     |
| [`ChangeBitDepth()`](/_articles/info/api/WebTwain_Edit.md#changebitdepth)           | [`SetDPI()`](/_articles/info/api/WebTwain_Edit.md#setdpi)                   | [`ConvertToBW()`](/_articles/info/api/WebTwain_Edit.md#converttobw)                 | [`ConvertToGrayScale()`](/_articles/info/api/WebTwain_Edit.md#converttograyscale)       |
| [`ChangeImageSize()`](/_articles/info/api/WebTwain_Edit.md#changeimagesize)         | [`Invert()`](/_articles/info/api/WebTwain_Edit.md#invert)                   | [`SetImageWidth()`](/_articles/info/api/WebTwain_Edit.md#setimagewidth)             | [`ChangeBrightnessAsync()`](/_articles/info/api/WebTwain_Edit.md#changebrightnessasync) |
| [`ChangeContrastAsnyc()`](/_articles/info/api/WebTwain_Edit.md#changecontrastasnyc) |

<!--
* [`Crop()`](/_articles/info/api/WebTwain_Edit.md#crop)
* [`CropToClipboard()`](/_articles/info/api/WebTwain_Edit.md#croptoclipboard)
* [`CutFrameToClipboard()`](/_articles/info/api/WebTwain_Edit.md#cutframetoclipboard)
* [`CutToClipboard()`](/_articles/info/api/WebTwain_Edit.md#cuttoclipboard)
* [`CopyToClipboard()`](/_articles/info/api/WebTwain_Edit.md#copytoclipboard)
* [`Erase()`](/_articles/info/api/WebTwain_Edit.md#erase)
* [`Flip()`](/_articles/info/api/WebTwain_Edit.md#flip)
* [`Mirror()`](/_articles/info/api/WebTwain_Edit.md#mirror)
* [`Rotate()`](/_articles/info/api/WebTwain_Edit.md#rotate)
* [`RotateEx()`](/_articles/info/api/WebTwain_Edit.md#rotateex)
* [`RotateLeft()`](/_articles/info/api/WebTwain_Edit.md#rotateleft)
* [`RotateRight()`](/_articles/info/api/WebTwain_Edit.md#rotateright)
* [`ChangeBitDepth()`](/_articles/info/api/WebTwain_Edit.md#changebitdepth)
* [`SetDPI()`](/_articles/info/api/WebTwain_Edit.md#setdpi)
* [`ConvertToBW()`](/_articles/info/api/WebTwain_Edit.md#converttobw)
* [`ConvertToGrayScale()`](/_articles/info/api/WebTwain_Edit.md#converttograyscale)
* [`ChangeImageSize()`](/_articles/info/api/WebTwain_Edit.md#changeimagesize)
* [`Invert()`](/_articles/info/api/WebTwain_Edit.md#invert)
* [`SetImageWidth()`](/_articles/info/api/WebTwain_Edit.md#setimagewidth)
-->
<!--* [`FlipAsync()`](/_articles/info/api/WebTwain_Edit.md#flipasync)-->
<!--* [`MirrorAsync()`](/_articles/info/api/WebTwain_Edit.md#mirrorasync)-->
<!--* [`RotateAsync()`](/_articles/info/api/WebTwain_Edit.md#rotate) -->
<!--* [`RotateLeftAsync()`](/_articles/info/api/WebTwain_Edit.md#rotateleft) -->
<!--* [`RotateRightAsync()`](/_articles/info/api/WebTwain_Edit.md#rotateright)-->
<!--* [`ConvertToGrayScaleAsync()`](/_articles/info/api/WebTwain_Edit.md#converttograyscaleasync)-->

### Properties

|[`BackgroundFillColor`](/_articles/info/api/WebTwain_Edit.md#backgroundfillcolor) |

<!--
* [`BackgroundFillColor`](/_articles/info/api/WebTwain_Edit.md#backgroundfillcolor) -->

## Scan

### Methods

| [`GetSourceNameItems()`](/_articles/info/api/WebTwain_Acquire.md#getsourcenameitems) | [`GetSourceNames()`](/_articles/info/api/WebTwain_Acquire.md#getsourcenames)           | [`GetSourceNamesAsync()`](/_articles/info/api/WebTwain_Acquire.md#getsourcenamesasync)           | [`SelectSource()`](/_articles/info/api/WebTwain_Acquire.md#selectsource)                 |
| [`SelectSourceAsync()`](/_articles/info/api/WebTwain_Acquire.md#selectsourceasync)   | [`SelectSourceByIndex()`](/_articles/info/api/WebTwain_Acquire.md#selectsourcebyindex) | [`SelectSourceByIndexAsync()`](/_articles/info/api/WebTwain_Acquire.md#selectsourcebyindexasync) | [`SetOpenSourceTimeout()`](/_articles/info/api/WebTwain_Acquire.md#setopensourcetimeout) |
| [`OpenSource()`](/_articles/info/api/WebTwain_Acquire.md#opensource)                 | [`OpenSourceAsync()`](/_articles/info/api/WebTwain_Acquire.md#opensourceasync)         | [`EnableSourceUI()`](/_articles/info/api/WebTwain_Acquire.md#enablesourceui)                     | [`EnableSource()`](/_articles/info/api/WebTwain_Acquire.md#enablesource)                 |
| [`AcquireImage()`](/_articles/info/api/WebTwain_Acquire.md#acquireimage)             | [`startScan()`](/_articles/info/api/WebTwain_Acquire.md#startscan)                     | [`DisableSource()`](/_articles/info/api/WebTwain_Acquire.md#disablesource)                       | [`CloseSource()`](/_articles/info/api/WebTwain_Acquire.md#closesource)                   |
| [`CloseSourceAsync()`](/_articles/info/api/WebTwain_Acquire.md#closesourceasync)     | [`CloseWorkingProcess()`](/_articles/info/api/WebTwain_Acquire.md#closeworkingprocess) | [`GetDevicesAsync()`](/_articles/info/api/WebTwain_Acquire.md#getdevicesasync)                   | [`SelectDeviceAsync()`](/_articles/info/api/WebTwain_Acquire.md#selectdeviceasync)       |
| [`AcquireImageAsync()`](/_articles/info/api/WebTwain_Acquire.md#acquireimageasync)   |

<!--
* [`GetSourceNameItems()`](/_articles/info/api/WebTwain_Acquire.md#getsourcenameitems)
* [`GetSourceNames()`](/_articles/info/api/WebTwain_Acquire.md#getsourcenames)
* [`GetSourceNamesAsync()`](/_articles/info/api/WebTwain_Acquire.md#getsourcenamesasync)
* [`GetDeviceType()`](/_articles/info/api/WebTwain_Acquire.md#getdevicetype)
* [`SelectSource()`](/_articles/info/api/WebTwain_Acquire.md#selectsource)
* [`SelectSourceAsync()`](/_articles/info/api/WebTwain_Acquire.md#selectsourceasync)
* [`SelectSourceByIndex()`](/_articles/info/api/WebTwain_Acquire.md#selectsourcebyindex)
* [`SelectSourceByIndexAsync()`](/_articles/info/api/WebTwain_Acquire.md#selectsourcebyindexasync)
* [`SetOpenSourceTimeout()`](/_articles/info/api/WebTwain_Acquire.md#setopensourcetimeout)
* [`OpenSource()`](/_articles/info/api/WebTwain_Acquire.md#opensource)
* [`OpenSourceAsync()`](/_articles/info/api/WebTwain_Acquire.md#opensourceasync)
* [`EnableSourceUI()`](/_articles/info/api/WebTwain_Acquire.md#enablesourceui)
* [`EnableSource()`](/_articles/info/api/WebTwain_Acquire.md#enablesource)
* [`AcquireImage()`](/_articles/info/api/WebTwain_Acquire.md#acquireimage)
* [`startScan()`](/_articles/info/api/WebTwain_Acquire.md#startscan)
* [`DisableSource()`](/_articles/info/api/WebTwain_Acquire.md#disablesource)
* [`CloseSource()`](/_articles/info/api/WebTwain_Acquire.md#closesource)
* [`CloseSourceAsync()`](/_articles/info/api/WebTwain_Acquire.md#closesourceasync)
* [`CloseWorkingProcess()`](/_articles/info/api/WebTwain_Acquire.md#closeworkingprocess) -->

### Properties

|[`CurrentSourceName`](/_articles/info/api/WebTwain_Acquire.md#currentsourcename) |[`IfDisableSourceAfterAcquire`](/_articles/info/api/WebTwain_Acquire.md#ifdisablesourceafteracquire) |[`IfDuplexEnabled`](/_articles/info/api/WebTwain_Acquire.md#ifduplexenabled) |[`IfFeederEnabled`](/_articles/info/api/WebTwain_Acquire.md#iffeederenabled)|
| [`PageSize`](/_articles/info/api/WebTwain_Acquire.md#pagesize) |[`PixelType`](/_articles/info/api/WebTwain_Acquire.md#pixeltype) |[`Resolution`](/_articles/info/api/WebTwain_Acquire.md#resolution) |[`SourceCount`](/_articles/info/api/WebTwain_Acquire.md#sourcecount)|

<!--

* [`CurrentSourceName`](/_articles/info/api/WebTwain_Acquire.md#currentsourcename)
* [`IfDisableSourceAfterAcquire`](/_articles/info/api/WebTwain_Acquire.md#ifdisablesourceafteracquire)
* [`IfDuplexEnabled`](/_articles/info/api/WebTwain_Acquire.md#ifduplexenabled)
* [`IfFeederEnabled`](/_articles/info/api/WebTwain_Acquire.md#iffeederenabled)
* [`PageSize`](/_articles/info/api/WebTwain_Acquire.md#pagesize)
* [`PixelType`](/_articles/info/api/WebTwain_Acquire.md#pixeltype)
* [`Resolution`](/_articles/info/api/WebTwain_Acquire.md#resolution)
* [`SourceCount`](/_articles/info/api/WebTwain_Acquire.md#sourcecount)
-->

### Events

| [`OnPostAllTransfers`](/_articles/info/api/WebTwain_Acquire.md#onpostalltransfers) | [`OnPostTransfer`](/_articles/info/api/WebTwain_Acquire.md#onposttransfer) | [`OnPostTransferAsync`](/_articles/info/api/WebTwain_Acquire.md#onposttransferasync) |
| [`OnPreAllTransfers`](/_articles/info/api/WebTwain_Acquire.md#onprealltransfers)   | [`OnPreTransfer`](/_articles/info/api/WebTwain_Acquire.md#onpretransfer)   |

<!--
* [`OnPostAllTransfers`](/_articles/info/api/WebTwain_Acquire.md#onpostalltransfers)
* [`OnPostTransfer`](/_articles/info/api/WebTwain_Acquire.md#onposttransfer)
* [`OnPostTransferAsync`](/_articles/info/api/WebTwain_Acquire.md#onposttransferasync)
* [`OnPreAllTransfers`](/_articles/info/api/WebTwain_Acquire.md#onprealltransfers)
* [`OnPreTransfer`](/_articles/info/api/WebTwain_Acquire.md#onpretransfer)
-->

> The following APIs are compatible with TWAIN and ICA

### Methods

|[`getCapabilities()`](/_articles/info/api/WebTwain_Acquire.md#getcapabilities) | [`setCapabilities()`](/_articles/info/api/WebTwain_Acquire.md#setcapabilities)|

> The following APIs are compatible with TWAIN (mostly Windows, but could also be macOS)

### Methods

| [`OpenSourceManager()`](/_articles/info/api/WebTwain_Acquire.md#opensourcemanager) | [`OpenSourceManagerAsync()`](/_articles/info/api/WebTwain_Acquire.md#opensourcemanagerasync) | [`CloseSourceManager()`](/_articles/info/api/WebTwain_Acquire.md#closesourcemanager)               | [`CloseSourceManagerAsync()`](/_articles/info/api/WebTwain_Acquire.md#closesourcemanagerasync) |
| [`GetCustomDSData()`](/_articles/info/api/WebTwain_Acquire.md#getcustomdsdata)     | [`GetCustomDSDataEx()`](/_articles/info/api/WebTwain_Acquire.md#getcustomdsdataex)           | [`CancelAllPendingTransfers()`](/_articles/info/api/WebTwain_Acquire.md#cancelallpendingtransfers) | [`FeedPage()`](/_articles/info/api/WebTwain_Acquire.md#feedpage)                               |
| [`ResetImageLayout()`](/_articles/info/api/WebTwain_Acquire.md#resetimagelayout)   | [`RewindPage()`](/_articles/info/api/WebTwain_Acquire.md#rewindpage)                         | [`SetCustomDSData()`](/_articles/info/api/WebTwain_Acquire.md#setcustomdsdata)                     | [`SetCustomDSDataEx()`](/_articles/info/api/WebTwain_Acquire.md#setcustomdsdataex)             |
| [`SetFileXferInfo()`](/_articles/info/api/WebTwain_Acquire.md#setfilexferinfo)     | [`SetImageLayout()`](/_articles/info/api/WebTwain_Acquire.md#setimagelayout)                 |

### Properties

| [`BitDepth`](/_articles/info/api/WebTwain_Acquire.md#bitdepth)                             | [`Brightness`](/_articles/info/api/WebTwain_Acquire.md#brightness)                                 | [`Contrast`](/_articles/info/api/WebTwain_Acquire.md#contrast)                             | [`DataSourceStatus`](/_articles/info/api/WebTwain_Acquire.md#datasourcestatus)                   |
| [`DefaultSourceName`](/_articles/info/api/WebTwain_Acquire.md#defaultsourcename)           | [`Duplex`](/_articles/info/api/WebTwain_Acquire.md#duplex)                                         | [`IfAutoBright`](/_articles/info/api/WebTwain_Acquire.md#ifautobright)                     | [`IfAutoDiscardBlankpages`](/_articles/info/api/WebTwain_Acquire.md#ifautodiscardblankpages)     |
| [`IfAutoFeed`](/_articles/info/api/WebTwain_Acquire.md#ifautofeed)                         | [`IfAutomaticBorderDetection`](/_articles/info/api/WebTwain_Acquire.md#ifautomaticborderdetection) | [`IfAutomaticDeskew`](/_articles/info/api/WebTwain_Acquire.md#ifautomaticdeskew)           | [`IfAutoScan`](/_articles/info/api/WebTwain_Acquire.md#ifautoscan)                               |
| [`IfFeederLoaded`](/_articles/info/api/WebTwain_Acquire.md#iffeederloaded)                 | [`IfPaperDetectable`](/_articles/info/api/WebTwain_Acquire.md#ifpaperdetectable)                   | [`IfShowIndicator`](/_articles/info/api/WebTwain_Acquire.md#ifshowindicator)               | [`IfShowUI`](/_articles/info/api/WebTwain_Acquire.md#ifshowui)                                   |
| [`IfUIControllable`](/_articles/info/api/WebTwain_Acquire.md#ifuicontrollable)             | [`IfUseTwainDSM`](/_articles/info/api/WebTwain_Acquire.md#ifusetwaindsm)                           | [`ImageCaptureDriverType`](/_articles/info/api/WebTwain_Acquire.md#imagecapturedrivertype) | [`ImageLayoutDocumentNumber`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutdocumentnumber) |
| [`ImageLayoutFrameBottom`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutframebottom) | [`ImageLayoutFrameLeft`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutframeleft)             | [`ImageLayoutFrameNumber`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutframenumber) | [`ImageLayoutFrameRight`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutframeright)         |
| [`ImageLayoutFrameTop`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutframetop)       | [`ImageLayoutPageNumber`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutpagenumber)           | [`ImagePixelType`](/_articles/info/api/WebTwain_Acquire.md#imagepixeltype)                 | [`MagData`](/_articles/info/api/WebTwain_Acquire.md#magdata)                                     |
| [`MagType`](/_articles/info/api/WebTwain_Acquire.md#magtype)                               | [`PendingXfers`](/_articles/info/api/WebTwain_Acquire.md#pendingxfers)                             | [`PixelFlavor`](/_articles/info/api/WebTwain_Acquire.md#pixelflavor)                       | [`TransferMode`](/_articles/info/api/WebTwain_Acquire.md#transfermode)                           |
| [`Unit`](/_articles/info/api/WebTwain_Acquire.md#unit)                                     | [`XferCount`](/_articles/info/api/WebTwain_Acquire.md#xfercount)                                   | [`IfAppendImage`](/_articles/info/api/WebTwain_Acquire.md#ifappendimage)                   |

<!--
* [`BitDepth`](/_articles/info/api/WebTwain_Acquire.md#bitdepth)
* [`Brightness`](/_articles/info/api/WebTwain_Acquire.md#brightness)
* [`Contrast`](/_articles/info/api/WebTwain_Acquire.md#contrast)
* [`DataSourceStatus`](/_articles/info/api/WebTwain_Acquire.md#datasourcestatus)
* [`DefaultSourceName`](/_articles/info/api/WebTwain_Acquire.md#defaultsourcename)
* [`Duplex`](/_articles/info/api/WebTwain_Acquire.md#duplex)
* [`IfAutoBright`](/_articles/info/api/WebTwain_Acquire.md#ifautobright)
* [`IfAutoDiscardBlankpages`](/_articles/info/api/WebTwain_Acquire.md#ifautodiscardblankpages)
* [`IfAutoFeed`](/_articles/info/api/WebTwain_Acquire.md#ifautofeed)
* [`IfAutomaticBorderDetection`](/_articles/info/api/WebTwain_Acquire.md#ifautomaticborderdetection)
* [`IfAutomaticDeskew`](/_articles/info/api/WebTwain_Acquire.md#ifautomaticdeskew)
* [`IfAutoScan`](/_articles/info/api/WebTwain_Acquire.md#ifautoscan)
* [`IfFeederLoaded`](/_articles/info/api/WebTwain_Acquire.md#iffeederloaded)
* [`IfPaperDetectable`](/_articles/info/api/WebTwain_Acquire.md#ifpaperdetectable)
* [`IfShowIndicator`](/_articles/info/api/WebTwain_Acquire.md#ifshowindicator)
* [`IfShowUI`](/_articles/info/api/WebTwain_Acquire.md#ifshowui)
* [`IfUIControllable`](/_articles/info/api/WebTwain_Acquire.md#ifuicontrollable)
* [`IfUseTwainDSM`](/_articles/info/api/WebTwain_Acquire.md#ifusetwaindsm)
* [`ImageCaptureDriverType`](/_articles/info/api/WebTwain_Acquire.md#imagecapturedrivertype)
* [`ImageLayoutDocumentNumber`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutdocumentnumber)
* [`ImageLayoutFrameBottom`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutframebottom)
* [`ImageLayoutFrameLeft`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutframeleft)
* [`ImageLayoutFrameNumber`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutframenumber)
* [`ImageLayoutFrameRight`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutframeright)
* [`ImageLayoutFrameTop`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutframetop)
* [`ImageLayoutPageNumber`](/_articles/info/api/WebTwain_Acquire.md#imagelayoutpagenumber)
* [`ImagePixelType`](/_articles/info/api/WebTwain_Acquire.md#imagepixeltype)
* [`MagData`](/_articles/info/api/WebTwain_Acquire.md#magdata)
* [`MagType`](/_articles/info/api/WebTwain_Acquire.md#magtype)
* [`PendingXfers`](/_articles/info/api/WebTwain_Acquire.md#pendingxfers)
* [`PixelFlavor`](/_articles/info/api/WebTwain_Acquire.md#pixelflavor)
* [`TransferMode`](/_articles/info/api/WebTwain_Acquire.md#transfermode)
* [`Unit`](/_articles/info/api/WebTwain_Acquire.md#unit)
* [`XferCount`](/_articles/info/api/WebTwain_Acquire.md#xfercount)
-->

### Events

| [`OnSourceUIClose`](/_articles/info/api/WebTwain_Acquire.md#onsourceuiclose) |

## Input/Output

### Input

#### Methods

| [`LoadImage()`](/_articles/info/api/WebTwain_IO.md#loadimage)                       | [`LoadImageEx()`](/_articles/info/api/WebTwain_IO.md#loadimageex)                         | [`LoadImageFromBase64Binary()`](/_articles/info/api/WebTwain_IO.md#loadimagefrombase64binary) | [`LoadImageFromBinary()`](/_articles/info/api/WebTwain_IO.md#loadimagefrombinary) |
| [`LoadDibFromClipboard()`](/_articles/info/api/WebTwain_IO.md#loaddibfromclipboard) | [`FTPDownload()`](/_articles/info/api/WebTwain_IO.md#ftpdownload)                         | [`FTPDownloadEx()`](/_articles/info/api/WebTwain_IO.md#ftpdownloadex)                         | [`HTTPDownload()`](/_articles/info/api/WebTwain_IO.md#httpdownload)               |
| [`HTTPDownloadEx()`](/_articles/info/api/WebTwain_IO.md#httpdownloadex)             | [`HTTPDownloadThroughPost()`](/_articles/info/api/WebTwain_IO.md#httpdownloadthroughpost) | [`loadFromLocalStorage()`](/_articles/info/api/WebTwain_IO.md#loadfromlocalstorage)           |

<!--
* [`LoadImage()`](/_articles/info/api/WebTwain_IO.md#loadimage)
* [`LoadImageEx()`](/_articles/info/api/WebTwain_IO.md#loadimageex)
* [`LoadImageFromBase64Binary()`](/_articles/info/api/WebTwain_IO.md#loadimagefrombase64binary)
* [`LoadImageFromBinary()`](/_articles/info/api/WebTwain_IO.md#loadimagefrombinary)
* [`LoadDibFromClipboard()`](/_articles/info/api/WebTwain_IO.md#loaddibfromclipboard)
* [`FTPDownload()`](/_articles/info/api/WebTwain_IO.md#ftpdownload)
* [`FTPDownloadEx()`](/_articles/info/api/WebTwain_IO.md#ftpdownloadex)
* [`HTTPDownload()`](/_articles/info/api/WebTwain_IO.md#httpdownload)
* [`HTTPDownloadEx()`](/_articles/info/api/WebTwain_IO.md#httpdownloadex)
* [`HTTPDownloadThroughPost()`](/_articles/info/api/WebTwain_IO.md#httpdownloadthroughpost)

<!--* [`LoadDibFromClipboardAsync()`](/_articles/info/api/WebTwain_IO.md#loaddibfromclipboardasync)-->

### Output

#### Methods

| [`ConvertToBase64()`](/_articles/info/api/WebTwain_IO.md#converttobase64)                                                 | [`ConvertToBlob()`](/_articles/info/api/WebTwain_IO.md#converttoblob)                                       | [`FTPUpload()`](/_articles/info/api/WebTwain_IO.md#ftpupload)                                                     |
| [`FTPUploadEx()`](/_articles/info/api/WebTwain_IO.md#ftpuploadex)                                                         | [`FTPUploadAllAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#ftpuploadallasmultipagetiff)           | [`FTPUploadAllAsPDF()`](/_articles/info/api/WebTwain_IO.md#ftpuploadallaspdf)                                     |
| [`FTPUploadAsMultiPagePDF()`](/_articles/info/api/WebTwain_IO.md#ftpuploadasmultipagepdf)                                 | [`FTPUploadAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#ftpuploadasmultipagetiff)                 | [`HTTPUpload()`](/_articles/info/api/WebTwain_IO.md#httpupload)                                                   |
| [`HTTPUploadThroughPutEx()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughputex)                                   | [`HTTPUploadThroughPost()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpost)                       | [`HTTPUploadThroughPostEx()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpostex)                         |
| [`HTTPUploadAllThroughPostAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#httpuploadallthroughpostasmultipagetiff) | [`HTTPUploadAllThroughPostAsPDF()`](/_articles/info/api/WebTwain_IO.md#httpuploadallthroughpostaspdf)       | [`HTTPUploadThroughPostAsMultiPagePDF()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpostasmultipagepdf) |
| [`HTTPUploadThroughPostAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpostasmultipagetiff)       | [`OutputSelectedAreaAsync()`](/_articles/info/api/WebTwain_IO.md#outputselectedareaasync)                   | [`SaveAsBMP()`](/_articles/info/api/WebTwain_IO.md#saveasbmp)                                                     |
| [`SaveAsJPEG()`](/_articles/info/api/WebTwain_IO.md#saveasjpeg)                                                           | [`SaveAsPDF()`](/_articles/info/api/WebTwain_IO.md#saveaspdf)                                               | [`SaveAsPNG()`](/_articles/info/api/WebTwain_IO.md#saveaspng)                                                     |
| [`SaveAsTIFF()`](/_articles/info/api/WebTwain_IO.md#saveastiff)                                                           | [`SaveSelectedImagesAsMultiPagePDF()`](/_articles/info/api/WebTwain_IO.md#saveselectedimagesasmultipagepdf) | [`SaveSelectedImagesAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#saveselectedimagesasmultipagetiff)     |
| [`SaveAllAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#saveallasmultipagetiff)                                   | [`SaveAllAsPDF()`](/_articles/info/api/WebTwain_IO.md#saveallaspdf)                                         | [`httpUploadBlob()`](/_articles/info/api/WebTwain_IO.md#httpuploadblob)                                           |
| [`saveBlob()`](/_articles/info/api/WebTwain_IO.md#saveblob)                                                               | [`saveToLocalStorage()`](/_articles/info/api/WebTwain_IO.md#savetolocalstorage)                             |

<!--
* [`ConvertToBase64()`](/_articles/info/api/WebTwain_IO.md#converttobase64)
* [`ConvertToBlob()`](/_articles/info/api/WebTwain_IO.md#converttoblob)
* [`FTPUpload()`](/_articles/info/api/WebTwain_IO.md#ftpupload)
* [`FTPUploadEx()`](/_articles/info/api/WebTwain_IO.md#ftpuploadex)
* [`FTPUploadAllAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#ftpuploadallasmultipagetiff)
* [`FTPUploadAllAsPDF()`](/_articles/info/api/WebTwain_IO.md#ftpuploadallaspdf)
* [`FTPUploadAsMultiPagePDF()`](/_articles/info/api/WebTwain_IO.md#ftpuploadasmultipagepdf)
* [`FTPUploadAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#ftpuploadasmultipagetiff)
* [`HTTPUpload()`](/_articles/info/api/WebTwain_IO.md#httpupload)
* [`HTTPUploadThroughPutEx()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughputex)
* [`HTTPUploadThroughPost()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpost)
* [`HTTPUploadThroughPostEx()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpostex)
* [`HTTPUploadAllThroughPostAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#httpuploadallthroughpostasmultipagetiff)
* [`HTTPUploadAllThroughPostAsPDF()`](/_articles/info/api/WebTwain_IO.md#httpuploadallthroughpostaspdf)
* [`HTTPUploadThroughPostAsMultiPagePDF()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpostasmultipagepdf)
* [`HTTPUploadThroughPostAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpostasmultipagetiff)
* [`SaveAsBMP()`](/_articles/info/api/WebTwain_IO.md#saveasbmp)
* [`SaveAsJPEG()`](/_articles/info/api/WebTwain_IO.md#saveasjpeg)
* [`SaveAsPDF()`](/_articles/info/api/WebTwain_IO.md#saveaspdf)
* [`SaveAsPNG()`](/_articles/info/api/WebTwain_IO.md#saveaspng)
* [`SaveAsTIFF()`](/_articles/info/api/WebTwain_IO.md#saveastiff)
* [`SaveSelectedImagesAsMultiPagePDF()`](/_articles/info/api/WebTwain_IO.md#saveselectedimagesasmultipagepdf)
* [`SaveSelectedImagesAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#saveselectedimagesasmultipagetiff)
* [`SaveAllAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#saveallasmultipagetiff)
* [`SaveAllAsPDF()`](/_articles/info/api/WebTwain_IO.md#saveallaspdf) -->

### Others

#### Methods

| [`ClearTiffCustomTag()`](/_articles/info/api/WebTwain_IO.md#cleartiffcustomtag) | [`SetTiffCustomTag()`](/_articles/info/api/WebTwain_IO.md#settiffcustomtag)     | [`ClearAllHTTPFormField()`](/_articles/info/api/WebTwain_IO.md#clearallhttpformfield) | [`SetHTTPFormField()`](/_articles/info/api/WebTwain_IO.md#sethttpformfield)     |
| [`SetHTTPHeader()`](/_articles/info/api/WebTwain_IO.md#sethttpheader)           | [`SetUploadSegment()`](/_articles/info/api/WebTwain_IO.md#setuploadsegment)     | [`ShowFileDialog()`](/_articles/info/api/WebTwain_IO.md#showfiledialog)               | [`Print()`](/_articles/info/api/WebTwain_IO.md#print)                           |
| [`PrintEx()`](/_articles/info/api/WebTwain_IO.md#printex)                       | [`createLocalStorage()`](/_articles/info/api/WebTwain_IO.md#createlocalstorage) | [`localStorageExist()`](/_articles/info/api/WebTwain_IO.md#localstorageexist)         | [`removeLocalStorage()`](/_articles/info/api/WebTwain_IO.md#removelocalstorage) |

<!--
* [`ClearTiffCustomTag()`](/_articles/info/api/WebTwain_IO.md#cleartiffcustomtag)
* [`SetTiffCustomTag()`](/_articles/info/api/WebTwain_IO.md#settiffcustomtag)
* [`ClearAllHTTPFormField()`](/_articles/info/api/WebTwain_IO.md#clearallhttpformfield)
* [`SetHTTPFormField()`](/_articles/info/api/WebTwain_IO.md#sethttpformfield)
* [`SetHTTPHeader()`](/_articles/info/api/WebTwain_IO.md#sethttpheader)
* [`SetUploadSegment()`](/_articles/info/api/WebTwain_IO.md#setuploadsegment)
* [`ShowFileDialog()`](/_articles/info/api/WebTwain_IO.md#showfiledialog)
* [`Print()`](/_articles/info/api/WebTwain_IO.md#print)
* [`PrintEx()`](/_articles/info/api/WebTwain_IO.md#printex)
-->

#### Properties

| [`FTPPassword`](/_articles/info/api/WebTwain_IO.md#ftppassword)                                   | [`FTPPort`](/_articles/info/api/WebTwain_IO.md#ftpport)                                                         | [`FTPUserName`](/_articles/info/api/WebTwain_IO.md#ftpusername)               | [`IfPASVMode`](/_articles/info/api/WebTwain_IO.md#ifpasvmode)                         |
| [`HttpFieldNameOfUploadedImage`](/_articles/info/api/WebTwain_IO.md#httpfieldnameofuploadedimage) | [`HTTPPort`](/_articles/info/api/WebTwain_IO.md#httpport)                                                       | [`IfSSL`](/_articles/info/api/WebTwain_IO.md#ifssl)                           | [`HTTPPostResponseString`](/_articles/info/api/WebTwain_IO.md#httppostresponsestring) |
| [`IfShowFileDialog`](/_articles/info/api/WebTwain_IO.md#ifshowfiledialog)                         | [`IfShowCancelDialogWhenImageTransfer`](/_articles/info/api/WebTwain_IO.md#ifshowcanceldialogwhenimagetransfer) | [`IfShowProgressBar`](/_articles/info/api/WebTwain_IO.md#ifshowprogressbar)   | [`JPEGQuality`](/_articles/info/api/WebTwain_IO.md#jpegquality)                       |
| [`IfTiffMultiPage`](/_articles/info/api/WebTwain_IO.md#iftiffmultipage)                           | [`TIFFCompressionType`](/_articles/info/api/WebTwain_IO.md#tiffcompressiontype)                                 | [`MaxUploadImageSize`](/_articles/info/api/WebTwain_IO.md#maxuploadimagesize) | [`IfSortBySelectionOrder`](/_articles/info/api/WebTwain_IO.md#ifsortbyselectionorder) |

<!--
* [`FTPPassword`](/_articles/info/api/WebTwain_IO.md#ftppassword)
* [`FTPPort`](/_articles/info/api/WebTwain_IO.md#ftpport)
* [`FTPUserName`](/_articles/info/api/WebTwain_IO.md#ftpusername)
* [`IfPASVMode`](/_articles/info/api/WebTwain_IO.md#ifpasvmode)
* [`HttpFieldNameOfUploadedImage`](/_articles/info/api/WebTwain_IO.md#httpfieldnameofuploadedimage)
* [`HTTPPort`](/_articles/info/api/WebTwain_IO.md#httpport)
* [`IfSSL`](/_articles/info/api/WebTwain_IO.md#ifssl)
* [`HTTPPostResponseString`](/_articles/info/api/WebTwain_IO.md#httppostresponsestring)
* [`IfShowFileDialog`](/_articles/info/api/WebTwain_IO.md#ifshowfiledialog)
* [`IfShowCancelDialogWhenImageTransfer`](/_articles/info/api/WebTwain_IO.md#ifshowcanceldialogwhenimagetransfer)
* [`IfShowProgressBar`](/_articles/info/api/WebTwain_IO.md#ifshowprogressbar)
* [`JPEGQuality`](/_articles/info/api/WebTwain_IO.md#jpegquality)
* [`IfTiffMultiPage`](/_articles/info/api/WebTwain_IO.md#iftiffmultipage)
* [`TIFFCompressionType`](/_articles/info/api/WebTwain_IO.md#tiffcompressiontype)
* [`MaxUploadImageSize`](/_articles/info/api/WebTwain_IO.md#maxuploadimagesize)
* [`IfAppendImage`](/_articles/info/api/WebTwain_IO.md#ifappendimage) -->

#### Events

|[`OnGetFilePath`](/_articles/info/api/WebTwain_IO.md#ongetfilepath)|[`OnPostLoad`](/_articles/info/api/WebTwain_IO.md#onpostload)| [`OnInternetTransferPercentage`](/_articles/info/api/WebTwain_IO.md#oninternettransferpercentage)|

<!--
* [`OnGetFilePath`](/_articles/info/api/WebTwain_IO.md#ongetfilepath)
* [`OnPostLoad`](/_articles/info/api/WebTwain_IO.md#onpostload)
* [`OnInternetTransferPercentage`](/_articles/info/api/WebTwain_IO.md#oninternettransferpercentage) -->

## Util

### Methods

|[`RegisterEvent()`](/_articles/info/api/WebTwain_Util.md#registerevent) | [`UnregisterEvent()`](/_articles/info/api/WebTwain_Util.md#unregisterevent) | [`GenerateURLForUploadData()`](/_articles/info/api/WebTwain_Util.md#generateurlforuploaddata) |

<!--
* [`RegisterEvent()`](/_articles/info/api/WebTwain_Util.md#registerevent)
* [`UnregisterEvent()`](/_articles/info/api/WebTwain_Util.md#unregisterevent)
* [`SetProductKeyAsync()`](/_articles/info/api/WebTwain_Util.md#setproductkeyasync)
* [`SetLanguage()`](/_articles/info/api/WebTwain_Util.md#setlanguage)
* [`GenerateURLForUploadData()`](/_articles/info/api/WebTwain_Util.md#generateurlforuploaddata)-->

### Properties

| [`ErrorCode`](/_articles/info/api/WebTwain_Util.md#errorcode)         | [`ErrorCause`](/_articles/info/api/WebTwain_Util.md#errorcause)   | [`ErrorString`](/_articles/info/api/WebTwain_Util.md#errorstring) | [`LogLevel`](/_articles/info/api/WebTwain_Util.md#loglevel) | [`Manufacturer`](/_articles/info/api/WebTwain_Util.md#manufacturer) |
| [`ProductFamily`](/_articles/info/api/WebTwain_Util.md#productfamily) | [`ProductName`](/_articles/info/api/WebTwain_Util.md#productname) | [`VersionInfo`](/_articles/info/api/WebTwain_Util.md#versioninfo) |                                                             |

<!--
* [`ErrorCode`](/_articles/info/api/WebTwain_Util.md#errorcode)
* [`ErrorString`](/_articles/info/api/WebTwain_Util.md#errorstring)
* [`LogLevel`](/_articles/info/api/WebTwain_Util.md#loglevel)
* [`Manufacturer`](/_articles/info/api/WebTwain_Util.md#manufacturer)
* [`ProductFamily`](/_articles/info/api/WebTwain_Util.md#productfamily)
* [`ProductName`](/_articles/info/api/WebTwain_Util.md#productname)
* [`VersionInfo`](/_articles/info/api/WebTwain_Util.md#versioninfo)
* [`ProductKey`](/_articles/info/api/WebTwain_Util.md#productkey)
* [`UseLocalService`](/_articles/info/api/WebTwain_Util.md#uselocalservice)
-->

## Viewer

### Methods

| [`bind()`](/_articles/info/api/WebTwain_Viewer.md#bind)                                   | [`clearSelectedAreas()`](/_articles/info/api/WebTwain_Viewer.md#clearselectedareas)   | [`createCustomElement()`](/_articles/info/api/WebTwain_Viewer.md#createcustomelement)     | [`createImageEditor()`](/_articles/info/api/WebTwain_Viewer.md#createimageeditor)             |
| [`createThumbnailViewer()`](/_articles/info/api/WebTwain_Viewer.md#createthumbnailviewer) | [`first()`](/_articles/info/api/WebTwain_Viewer.md#first)                             | [`fitWindow()`](/_articles/info/api/WebTwain_Viewer.md#fitwindow)                         | [`gotoPage()`](/_articles/info/api/WebTwain_Viewer.md#gotopage)                               |
| [`getVisiblePagesInfo()`](/_articles/info/api/WebTwain_Viewer.md#getvisiblepagesinfo)     | [`hide()`](/_articles/info/api/WebTwain_Viewer.md#hide)                               | [`last()`](/_articles/info/api/WebTwain_Viewer.md#last)                                   | [`next()`](/_articles/info/api/WebTwain_Viewer.md#next)                                       |
| [`off()`](/_articles/info/api/WebTwain_Viewer.md#off)                                     | [`on()`](/_articles/info/api/WebTwain_Viewer.md#on)                                   | [`previous()`](/_articles/info/api/WebTwain_Viewer.md#previous)                           | [`render()`](/_articles/info/api/WebTwain_Viewer.md#render)                                   |
| [`setButtonClass()`](/_articles/info/api/WebTwain_Viewer.md#setbuttonclass)               | [`setSelectedAreas()`](/_articles/info/api/WebTwain_Viewer.md#setselectedareas)       | [`setViewMode()`](/_articles/info/api/WebTwain_Viewer.md#setviewmode)                     | [`show()`](/_articles/info/api/WebTwain_Viewer.md#show)                                       |
| [`unbind()`](/_articles/info/api/WebTwain_Viewer.md#unbind)                               | [`updateCheckboxStyle()`](/_articles/info/api/WebTwain_Viewer.md#updatecheckboxstyle) | [`updatePageNumberStyle()`](/_articles/info/api/WebTwain_Viewer.md#updatepagenumberstyle) | [`updateSelectionBoxStyle()`](/_articles/info/api/WebTwain_Viewer.md#updateselectionboxstyle) |

<!--
* [`bind()`](/_articles/info/api/WebTwain_Viewer.md#bind)
* [`clearSelectedAreas()`](/_articles/info/api/WebTwain_Viewer.md#clearselectedareas)
* [`createCustomElement()`](/_articles/info/api/WebTwain_Viewer.md#createcustomelement)
* [`createImageEditor()`](/_articles/info/api/WebTwain_Viewer.md#createimageeditor)
* [`createThumbnailViewer()`](/_articles/info/api/WebTwain_Viewer.md#createthumbnailviewer)
* [`first()`](/_articles/info/api/WebTwain_Viewer.md#first)
* [`fitWindow()`](/_articles/info/api/WebTwain_Viewer.md#fitwindow)
* [`gotoPage()`](/_articles/info/api/WebTwain_Viewer.md#gotopage)
* [`hide()`](/_articles/info/api/WebTwain_Viewer.md#hide)
* [`last()`](/_articles/info/api/WebTwain_Viewer.md#last)
* [`next()`](/_articles/info/api/WebTwain_Viewer.md#next)
* [`off()`](/_articles/info/api/WebTwain_Viewer.md#off)
* [`on()`](/_articles/info/api/WebTwain_Viewer.md#on)
* [`previous()`](/_articles/info/api/WebTwain_Viewer.md#previous)
* [`render()`](/_articles/info/api/WebTwain_Viewer.md#render)
* [`setButtonClass()`](/_articles/info/api/WebTwain_Viewer.md#setbuttonclass)
* [`setSelectedAreas()`](/_articles/info/api/WebTwain_Viewer.md#setselectedareas)
* [`setViewMode()`](/_articles/info/api/WebTwain_Viewer.md#setviewmode)
* [`show()`](/_articles/info/api/WebTwain_Viewer.md#show)
* [`unbind()`](/_articles/info/api/WebTwain_Viewer.md#unbind)
-->

### Properties

| [`acceptDrop`](/_articles/info/api/WebTwain_Viewer.md#acceptdrop)       | [`allowPageDragging`](/_articles/info/api/WebTwain_Viewer.md#allowpagedragging)               | [`allowSlide`](/_articles/info/api/WebTwain_Viewer.md#allowslide)                         | [`autoChangeIndex`](/_articles/info/api/WebTwain_Viewer.md#autochangeindex)         |
| [`background`](/_articles/info/api/WebTwain_Viewer.md#background)       | [`border`](/_articles/info/api/WebTwain_Viewer.md#border)                                     | [`cursor`](/_articles/info/api/WebTwain_Viewer.md#cursor)                                 | [`focusOutlineEnabled`](/_articles/info/api/WebTwain_Viewer.md#focusoutlineenabled) |
| [`height`](/_articles/info/api/WebTwain_Viewer.md#height)               | [`idPostfix`](/_articles/info/api/WebTwain_Viewer.md#idpostfix)                               | [`ifAutoScroll`](/_articles/info/api/WebTwain_Viewer.md#ifautoscroll)                     | [`innerBorder`](/_articles/info/api/WebTwain_Viewer.md#innerborder)                 |
| [`pageMargin`](/_articles/info/api/WebTwain_Viewer.md#pagemargin)       | [`selectedAreaBorderColor`](/_articles/info/api/WebTwain_Viewer.md#selectedareabordercolor)   | [`selectedPageBackground`](/_articles/info/api/WebTwain_Viewer.md#selectedpagebackground) | [`selectedPageBorder`](/_articles/info/api/WebTwain_Viewer.md#selectedpageborder)   |
| [`selectionMode`](/_articles/info/api/WebTwain_Viewer.md#selectionmode) | [`selectionRectAspectRatio`](/_articles/info/api/WebTwain_Viewer.md#selectionrectaspectratio) | [`singlePageMode`](/_articles/info/api/WebTwain_Viewer.md#singlepagemode)                 | [`width`](/_articles/info/api/WebTwain_Viewer.md#width)                             |
| [`zoom`](/_articles/info/api/WebTwain_Viewer.md#zoom)                   | [`zoomOrigin`](/_articles/info/api/WebTwain_Viewer.md#zoomorigin)                             |                                                                                           |                                                                                     |

<!--
* [`acceptDrop`](/_articles/info/api/WebTwain_Viewer.md#acceptdrop)
* [`allowSlide`](/_articles/info/api/WebTwain_Viewer.md#allowslide)
* [`background`](/_articles/info/api/WebTwain_Viewer.md#background)
* [`border`](/_articles/info/api/WebTwain_Viewer.md#border)
* [`cursor`](/_articles/info/api/WebTwain_Viewer.md#cursor)
* [`height`](/_articles/info/api/WebTwain_Viewer.md#height)
* [`idPostfix`](/_articles/info/api/WebTwain_Viewer.md#idpostfix)
* [`ifAutoScroll`](/_articles/info/api/WebTwain_Viewer.md#ifautoscroll)
* [`innerBorder`](/_articles/info/api/WebTwain_Viewer.md#innerBorder)
* [`pageMargin`](/_articles/info/api/WebTwain_Viewer.md#pagemargin)
* [`selectedAreaBorderColor`](/_articles/info/api/WebTwain_Viewer.md#selectedareabordercolor)
* [`selectedPageBackground`](/_articles/info/api/WebTwain_Viewer.md#selectedpagebackground)
* [`selectedPageBorder`](/_articles/info/api/WebTwain_Viewer.md#selectedpageborder)
* [`selectionRectAspectRatio`](/_articles/info/api/WebTwain_Viewer.md#selectionrectaspectratio)
* [`showPageNumber`](/_articles/info/api/WebTwain_Viewer.md#showpagenumber)
* [`singlePageMode`](/_articles/info/api/WebTwain_Viewer.md#singlepagemode)
* [`width`](/_articles/info/api/WebTwain_Viewer.md#width)
* [`zoom`](/_articles/info/api/WebTwain_Viewer.md#zoom)
* [`autoChangeIndex`](/_articles/info/api/WebTwain_Viewer.md#autochangeindex)

-->

### Events

| [`click`](/_articles/info/api/WebTwain_Viewer.md#on)                  | [`contextmenu`](/_articles/info/api/WebTwain_Viewer.md#on) | [`dblclick`](/_articles/info/api/WebTwain_Viewer.md#on)                       | [`mousemove`](/_articles/info/api/WebTwain_Viewer.md#on)                          |
| [`mousedown`](/_articles/info/api/WebTwain_Viewer.md#on)              | [`mouseup`](/_articles/info/api/WebTwain_Viewer.md#on)     | [`mouseout`](/_articles/info/api/WebTwain_Viewer.md#on)                       | [`mouseover`](/_articles/info/api/WebTwain_Viewer.md#on)                          |
| [`keydown`](/_articles/info/api/WebTwain_Viewer.md#on)                | [`keyup`](/_articles/info/api/WebTwain_Viewer.md#on)       | [`pageAreaSelected`](/_articles/info/api/WebTwain_Viewer.md#pageareaselected) | [`pageAreaUnselected`](/_articles/info/api/WebTwain_Viewer.md#pageareaunselected) |
| [`pageRendered`](/_articles/info/api/WebTwain_Viewer.md#pagerendered) | [`resize`](/_articles/info/api/WebTwain_Viewer.md#resize)  |

<!--
* [`click`](/_articles/info/api/WebTwain_Viewer.md#click)
* [`contextmenu`](/_articles/info/api/WebTwain_Viewer.md#contextmenu)
* [`dblclick`](/_articles/info/api/WebTwain_Viewer.md#dblclick)
* [`mousemove`](/_articles/info/api/WebTwain_Viewer.md#mousemove)
* [`mousedown`](/_articles/info/api/WebTwain_Viewer.md#mousedown)
* [`mouseup`](/_articles/info/api/WebTwain_Viewer.md#mouseup)
* [`mouseout`](/_articles/info/api/WebTwain_Viewer.md#mouseout)
* [`mouseover`](/_articles/info/api/WebTwain_Viewer.md#mouseover)
* [`keydown`](/_articles/info/api/WebTwain_Viewer.md#keydown)
* [`keyup`](/_articles/info/api/WebTwain_Viewer.md#keyup)
* [`pageAreaSelected`](/_articles/info/api/WebTwain_Viewer.md#pageareaselected)
* [`pageAreaUnselected`](/_articles/info/api/WebTwain_Viewer.md#pageareaunselected)
* [`pageRendered`](/_articles/info/api/WebTwain_Viewer.md#pagerendered)
* [`resize`](/_articles/info/api/WebTwain_Viewer.md#resize)
-->
<!--* [`topPageChanged`](/_articles/info/api/WebTwain_Viewer.md#toppagechanged)-->

## Addon

## BarcodeReader

### Methods

| [`decode()`](/_articles/info/api/Addon_BarcodeReader.md#decode)                             | [`getRuntimeSettings()`](/_articles/info/api/Addon_BarcodeReader.md#getruntimesettings)                       | [`updateRuntimeSettings()`](/_articles/info/api/Addon_BarcodeReader.md#updateruntimesettings) |
| [`resetRuntimeSettings()`](/_articles/info/api/Addon_BarcodeReader.md#resetruntimesettings) | [`initRuntimeSettingsWithString()`](/_articles/info/api/Addon_BarcodeReader.md#initruntimesettingswithstring) |

<!--
* [`decode()`](/_articles/info/api/Addon_BarcodeReader.md#decode)
* [`getRuntimeSettings()`](/_articles/info/api/Addon_BarcodeReader.md#getruntimesettings)
* [`updateRuntimeSettings()`](/_articles/info/api/Addon_BarcodeReader.md#updateruntimesettings)
* [`resetRuntimeSettings()`](/_articles/info/api/Addon_BarcodeReader.md#resetruntimesettings)
* [`initRuntimeSettingsWithString()`](/_articles/info/api/Addon_BarcodeReader.md#initruntimesettingswithstring)
-->

## PDF

### Methods

| [`GetConvertMode()`](/_articles/info/api/Addon_PDF.md#getconvertmode)     | [`IsModuleInstalled()`](/_articles/info/api/Addon_PDF.md#ismoduleinstalled) | [`IsRasterizationRequired()`](/_articles/info/api/Addon_PDF.md#israsterizationrequired) | [`IsTextBasedPDF()`](/_articles/info/api/Addon_PDF.md#istextbasedpdf)     | [`SetConvertMode()`](/_articles/info/api/Addon_PDF.md#setconvertmode) |
| [`SetPassword()`](/_articles/info/api/Addon_PDF.md#setpassword)           | [`SetResolution()`](/_articles/info/api/Addon_PDF.md#setresolution)         | [`Write.Setup()`](/_articles/info/api/Addon_PDF.md#writesetup)                          | [`GetReaderOptions()`](/_articles/info/api/Addon_PDF.md#getreaderoptions) |
| [`SetReaderOptions()`](/_articles/info/api/Addon_PDF.md#setreaderoptions) |

<!-- ## Camera

### Methods

|[`getSourceList()`](/_articles/info/api/Addon_Camera.md#getsourcelist) | [`selectSource()`](/_articles/info/api/Addon_Camera.md#selectsource)|[`getCurrentSource()`](/_articles/info/api/Addon_Camera.md#getcurrentsource)|[`closeSource()`](/_articles/info/api/Addon_Camera.md#closesource)|
|[`getResolution()`](/_articles/info/api/Addon_Camera.md#getresolution)| [`setResolution()`](/_articles/info/api/Addon_Camera.md#setresolution)| [`getCurrentResolution()`](/_articles/info/api/Addon_Camera.md#getcurrentresolution)| [`play()`](/_articles/info/api/Addon_Camera.md#play)|
|[`pause()`](/_articles/info/api/Addon_Camera.md#pause)| [`resume()`](/_articles/info/api/Addon_Camera.md#resume)| [`stop()`](/_articles/info/api/Addon_Camera.md#stop)|[`getStatus()`](/_articles/info/api/Addon_Camera.md#getstatus)|
|[`capture()`](/_articles/info/api/Addon_Camera.md#capture)| [`showVideo()`](/_articles/info/api/Addon_Camera.md#showvideo)| [`closeVideo()`](/_articles/info/api/Addon_Camera.md#closevideo)|[`scanDocument()`](/_articles/info/api/Addon_Camera.md#scandocument)| -->

## Webcam

### Methods

| [`CaptureImage()`](/_articles/info/api/Addon_Webcam.md#captureimage)                       | [`CloseSource()`](/_articles/info/api/Addon_Webcam.md#closesource)                                 | [`GetCameraControlPropertySetting()`](/_articles/info/api/Addon_Webcam.md#getcameracontrolpropertysetting) | [`GetCameraControlPropertyMoreSetting()`](/_articles/info/api/Addon_Webcam.md#getcameracontrolpropertymoresetting) |
| [`GetVideoPropertySetting()`](/_articles/info/api/Addon_Webcam.md#getvideopropertysetting) | [`GetVideoPropertyMoreSetting()`](/_articles/info/api/Addon_Webcam.md#getvideopropertymoresetting) | [`SetCameraControlPropertySetting()`](/_articles/info/api/Addon_Webcam.md#setcameracontrolpropertysetting) | [`SetVideoPropertySetting()`](/_articles/info/api/Addon_Webcam.md#setvideopropertysetting)                         |
| [`GetFrameRate()`](/_articles/info/api/Addon_Webcam.md#getframerate)                       | [`SetFrameRate()`](/_articles/info/api/Addon_Webcam.md#setframerate)                               | [`GetMediaType()`](/_articles/info/api/Addon_Webcam.md#getmediatype)                                       | [`SetMediaType()`](/_articles/info/api/Addon_Webcam.md#setmediatype)                                               |
| [`GetResolution()`](/_articles/info/api/Addon_Webcam.md#getresolution)                     | [`SetResolution()`](/_articles/info/api/Addon_Webcam.md#setresolution)                             | [`GetFramePartURL()`](/_articles/info/api/Addon_Webcam.md#getframeparturl)                                 | [`GetFrameURL()`](/_articles/info/api/Addon_Webcam.md#getframeurl)                                                 |
| [`GetSourceList()`](/_articles/info/api/Addon_Webcam.md#getsourcelist)                     | [`SelectSource()`](/_articles/info/api/Addon_Webcam.md#selectsource)                               | [`PauseVideo()`](/_articles/info/api/Addon_Webcam.md#pausevideo)                                           | [`PlayVideo()`](/_articles/info/api/Addon_Webcam.md#playvideo)                                                     |
| [`SetVideoRotateMode()`](/_articles/info/api/Addon_Webcam.md#setvideorotatemode)           | [`StopVideo()`](/_articles/info/api/Addon_Webcam.md#stopvideo)                                     |

## Dynamsoft.FileUploader

### Methods

| [`Init()`](/_articles/info/api/Dynamsoft_FileUploader.md#init)                       | [`CreateJob()`](/_articles/info/api/Dynamsoft_FileUploader.md#createjob) | [`Run()`](/_articles/info/api/Dynamsoft_FileUploader.md#run) | [`Cancel()`](/_articles/info/api/Dynamsoft_FileUploader.md#cancel) |
| [`CancelAllUpload()`](/_articles/info/api/Dynamsoft_FileUploader.md#cancelallupload) |

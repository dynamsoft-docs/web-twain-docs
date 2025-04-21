---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Dynamic Web TWAIN SDK Schedule - Deprecated Features
keywords: Dynamic Web TWAIN, Documentation, Schedule, Deprecated Features
breadcrumbText: Deprecated
description: Dynamic Web TWAIN SDK Documentation Deprecated Features Page
---

# All Deprecated Features & APIs
<div class="blockquote-note"></div>
> All deprecated APIs are considered unsupported as of the version they are deprecated. They may be removed at any time with no further notice.

<!-- ## Planned

### SHA-1 signatures

To comply with Windows security updates, we will deprecate SHA-1 signatures in a future version. The impact is described below (we take 64bit Windows 7 as an example in below screenshots).

*If the deprecation is implemented:*

* When you try to install the Dynamsoft Service, you will get the following two error for "Unknown Publisher".

![Deprecation-1](/assets/imgs/Deprecation-1.png)

![Deprecation-2](/assets/imgs/Deprecation-2.png)

* When you run the ActiveX Edition in IE, you will get a prompt to allow its execution.

![Deprecation-3](/assets/imgs/Deprecation-3.png)

For more information, check out [Preparing for the deprecation of SHA-1 signatures](https://docs.microsoft.com/en-us/sysinternals/announce/sha1deprecation) from Microsoft.

The prompts are one-time, once you accept the "risk", the software will install and run as usual.

The recommended fix is to patch the operating system, you can find the patch [here](http://www.catalog.update.microsoft.com/search.aspx?q=kb4474419). -->

## 19.0

### Global

* Deprecated Property: Dynamsoft.DWT.IfUseActiveXForIE10Plus

### Util
* Deprecated Method: DWTObject.isUsingActiveX

## 18.4

### PDF Rasterizer
> [Alternative] Use the [SetReaderOptions()](/_articles/info/api/Addon_PDF.md#setreaderoptions) and [GetReaderOptions()](/_articles/info/api/Addon_PDF.md#getreaderoptions) functions instead.

* GetConvertMode()
* SetConvertMode()
* SetPassword()
* SetResolution()

Deprecate the enum value CM_RENDERALLWITHANNOTATION from [`Dynamsoft.DWT.EnumDWT_ConvertMode`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_convertmode).

### Viewer
> This API has been deprecated as of release 18.4. Please use the [`updateSelectionBoxStyle()`](/_articles/info/api/WebTwain_Viewer.md#updateselectionboxstyle) function.

* selectedAreaBorderColor

## 18.2

### Global

* Dynamsoft.DWT.GetWebTwainEx()

## 18.0

### Dynamic Web TWAIN

> [Alternative] Use [Dynamsoft.DWT.ProductKey](/_articles/info/api/Dynamsoft_WebTwainEnv.md#productkey) instead.

* Dynamsoft.DWT.licenseServer 
* Dynamsoft.DWT.sessionPassword 
* Dynamsoft.DWT.organizationID
* Dynamsoft.DWT.handshakeCode

### Util

* Deprecated Method: DWTObject.SetProductKeyAsync
* Deprecated Property: DWTObject.ProductKey

### Scan

* Deprecated Method: DWTObject.GetDeviceType

## 17.3

### Dynamic Web TWAIN

* Deleted property: Dynamsoft.DWT.UseDefaultInstallUI

### Viewer

> [Alternative] Use [updateCheckboxStyle](/_articles/info/api/WebTwain_Viewer.md#updatecheckboxstyle) and [updatePageNumberStyle](/_articles/info/api/WebTwain_Viewer.md#updatepagenumberstyle) instead.

* Viewer.showPageNumber
* Viewer.showCheckbox
* thumbnailViewer.showCheckbox
* thumbnailViewer.showPageNumber

### Camera Add-On

> [Alternative] Use [scanDocument](/_articles/info/api/Addon_Camera.md#scandocument) instead.

* Camera.showVideo()

### OCR Add-On

OCR Basic and OCR Pro client-side are deprecated.

## 17.0

### Viewer

* New APIs in v17.0 replace old APIs in v16.2-, all old APIs are deprecated.

| v17.0 | v16.2- |
|:-|:-|
| [ `Viewer.autoChangeIndex` ](/_articles/info/api/WebTwain_Viewer.md#autochangeindex) | `Viewer.topPageChanged()` |

* The following APIs are new in v17.0
  + [ `RemoveTag` ](/_articles/info/api/WebTwain_Buffer.md#removetag)
  + [ `GetTagList` ](/_articles/info/api/WebTwain_Buffer.md#gettaglist)
  + `DWT.licenseServer`
  + `DWT.handshakeCode`
  + `DWT.sessionPassword`
  + `DWT.licenseException`

## 16.2 

* Internet Explorer 8 is no longer supported.

### Camera Add-On

* New APIs in v16.2 replace old APIs in v16.1-, all old APIs are deleted.

| v16.2 | v16.1- |
|:-|:-|
| [ `Addon.Camera.showVideo()` ](/_articles/info/api/Addon_Camera.md#showvideo) | `Viewer.showVideo()` |
| [ `Addon.Camera.closeVideo()` ](/_articles/info/api/Addon_Camera.md#closevideo) | `Viewer.closeVideo()` |
| [ `Addon.Camera.off()` ](/_articles/info/api/Addon_Camera.md#off) | `Viewer.off()` |
| [ `Addon.Camera.on("video-closed")` ](/_articles/info/api/Addon_Camera.md#video-closed) | `Viewer.on("video-closed")` |
| [ `Addon.Camera.on("video-error")` ](/_articles/info/api/Addon_Camera.md#video-error) | `Viewer.on("video-error")` |

### Viewer

* New APIs in v16.2 replace old APIs in v16.1-, all old APIs are deprecated.

| v16.2 | v16.1- |
|:-|:-|
| [ `Viewer.background` ](/_articles/info/api/WebTwain_Viewer.md#background) | `BackgroundColor` |
| [ `Viewer.bind()` ](/_articles/info/api/WebTwain_Viewer.md#bind) , [ `Viewer.show()` ](/_articles/info/api/WebTwain_Viewer.md#show) , [ `Viewer.hide()` ](/_articles/info/api/WebTwain_Viewer.md#hide) | `BindViewer()` |
| [ `Viewer.cursor` ](/_articles/info/api/WebTwain_Viewer.md#cursor) | `MouseShape` |
| [ `Viewer.fitWindow()` ](/_articles/info/api/WebTwain_Viewer.md#fitwindow) | `FitWindowType` , `IfFitWindow` |
| [ `Viewer.height` ](/_articles/info/api/WebTwain_Viewer.md#height) | `Height` |
| [ `Viewer.ifAutoScroll` ](/_articles/info/api/WebTwain_Viewer.md#ifautoscroll) | `IfAutoScroll` |
| [ `Viewer.on("click", callback)` ](/_articles/info/api/WebTwain_Viewer.md#click) | `RegisterEvent("OnMouseClick", callback)` |
| [ `Viewer.on("contextmenu", callback)` ](/_articles/info/api/WebTwain_Viewer.md#contextmenu) | `RegisterEvent("OnMouseRightClick", callback)` |
| [ `Viewer.on("dblclick", callback)` ](/_articles/info/api/WebTwain_Viewer.md#dblclick) | `RegisterEvent("OnMouseDoubleClick", callback)` |
| [ `Viewer.on("mousemove", callback)` ](/_articles/info/api/WebTwain_Viewer.md#mousemove) | `RegisterEvent("OnMouseMove", callback)` |
| [ `Viewer.on("pageAreaSelected", callback)` ](/_articles/info/api/WebTwain_Viewer.md#pageareaselected) | `RegisterEvent("OnImageAreaSelected", callback)` |
| [ `Viewer.on("pageAreaUnselected", callback)` ](/_articles/info/api/WebTwain_Viewer.md#pageareaunselected) | `RegisterEvent("OnImageAreaDeSelected", callback)` |
| [ `Viewer.pageMargin` ](/_articles/info/api/WebTwain_Viewer.md#pagemargin) | `ImageMargin` |
| [ `Viewer.selectedPageBorder` ](/_articles/info/api/WebTwain_Viewer.md#selectedpageborder) | `SelectionImageBorderColor` |
| [ `Viewer.selectionRectAspectRatio` ](/_articles/info/api/WebTwain_Viewer.md#selectionrectaspectratio) | `SelectionRectAspectRatio` |
| [ `Viewer.setSelectedAreas()` ](/_articles/info/api/WebTwain_Viewer.md#setselectedareas) | `SetSelectedImageArea()` |
| [ `Viewer.showPageNumber` ](/_articles/info/api/WebTwain_Viewer.md#showpagenumber) | `ShowPageNumber` |
| [ `Viewer.unbind()` ](/_articles/info/api/WebTwain_Viewer.md#unbind) | `UnbindView()` |
| [ `Viewer.width` ](/_articles/info/api/WebTwain_Viewer.md#width) | `Width` |
| [ `Viewer.zoom` ](/_articles/info/api/WebTwain_Viewer.md#zoom) | `Zoom` |
| `ViewerEvent.imageX` | `MouseX` |
| `ViewerEvent.imageY` | `MouseY` |

> NOTE
>  
> `ViewerEvent.imageX` and `ViewerEvent.imageY` are only available as the first argument in callback functions for the mouse events "click", "dblclick", "contextMenu" and "mousemove".

* The following APIs are new in v16.2
  + [ `Viewer.acceptDrop` ](/_articles/info/api/WebTwain_Viewer.md#acceptdrop)
  + [ `Viewer.allowSlide` ](/_articles/info/api/WebTwain_Viewer.md#allowslide)
  + [ `Viewer.clearSelectedAreas()` ](/_articles/info/api/WebTwain_Viewer.md#clearselectedareas)
  + [ `Viewer.createThumbnailViewer()` ](/_articles/info/api/WebTwain_Viewer.md#createthumbnailviewer)
  + [ `Viewer.border` ](/_articles/info/api/WebTwain_Viewer.md#border)
  + [ `Viewer.first()` ](/_articles/info/api/WebTwain_Viewer.md#first)
  + [ `Viewer.getUISettings()` ](/_articles/info/api/WebTwain_Viewer.md#getuisettings)
  + [ `Viewer.gotoPage()` ](/_articles/info/api/WebTwain_Viewer.md#gotopage)
  + [ `Viewer.idPostfix` ](/_articles/info/api/WebTwain_Viewer.md#idpostfix)
  + [ `Viewer.innerBorder` ](/_articles/info/api/WebTwain_Viewer.md#innerborder)
  + [ `Viewer.last()` ](/_articles/info/api/WebTwain_Viewer.md#last)
  + [ `Viewer.next()` ](/_articles/info/api/WebTwain_Viewer.md#next)
  + [ `Viewer.on("pageRendered", callback)` ](/_articles/info/api/WebTwain_Viewer.md#pagerendered)
  + [ `Viewer.on("resize", callback)` ](/_articles/info/api/WebTwain_Viewer.md#resize)
  + [ `Viewer.previous()` ](/_articles/info/api/WebTwain_Viewer.md#previous)
  + [ `Viewer.render()` ](/_articles/info/api/WebTwain_Viewer.md#render)
  + [ `Viewer.resetUISettings()` ](/_articles/info/api/WebTwain_Viewer.md#resetuisettings)
  + [ `Viewer.selectedAreaBorderColor` ](/_articles/info/api/WebTwain_Viewer.md#selectedareabordercolor)
  + [ `Viewer.selectedPageBackground` ](/_articles/info/api/WebTwain_Viewer.md#selectedpagebackground)
  + [ `Viewer.singlePageMode` ](/_articles/info/api/WebTwain_Viewer.md#singlepagemode)

* The following APIs in v16.2 are improved based on old APIs in v16.1-.

  + [`Viewer.setViewMode()`](/_articles/info/api/WebTwain_Viewer.md#setviewmode)

    It also accepts the values "-1, -1" which is equivalent to setting `Viewer.singlePageMode` to `true` .

  + [`Viewer.updateUISettings()`](/_articles/info/api/WebTwain_Viewer.md#updateuisettings)

* The following APIs are also deprecated in v16.2

  + `SetViewMode()`

    Use Viewer.setViewMode() instead.

* The following APIs from v16.1- are removed

  + `Viewer.bOnlyShowThumbnailsView`
  + `Viewer.cursorOverThumbnailsView`
  + `Viewer.bindCustomElement()`
  + `Viewer.showCustomElement()`
  + `Viewer.hideCustomElement()`
  + `Viewer.toggleCustomElement()`
  + `Viewer.setSelectedImageArea()`
  + `Viewer.zoomIn()`
  + `Viewer.zoomOut()`

* The following APIs in v16.1- are implemented differently in v16.2  
  + `BindViewer()` with two parameters
  + `UpdateViewer()`

  The two methods above were used to set the size of the viewer or to show the thumbnail viewer. In v16, 2, different APIs are used as shown below:

``` javascript
  /* Set the size of the viewer */
  DWTObject.Viewer.height = 800;
  DWTObject.Viewer.width = 600;
  /* Create a thumbnail viewer, note that this viewer can be hidden or disposed */
  var objThumbnailViewer = DWTObject.Viewer.createThumbnailViewer(thumbnailViewerSettings);
  objThumbnailViewer.show();
  //objThumbnailViewer.hide();
  //objThumbnailViewer.dispose();
  /* updateViewMode() is used to change only the view mode of the thumbnail viewer */
  objThumbnailViewer.updateViewMode(viewMode: ViewMode);
  /* The following two are used to hook or unhook events to the thumbnail viewer */
  objThumbnailViewer.on()
  objThumbnailViewer.off()
```

  + `ShowImageEditor()`

  While this method still works, it's deprecated and the alternative is shown in the code below

``` javascript
  /* The image editor is now created on the fly and can be hidden or disposed */
  var objImageEditor = DWTObject.Viewer.createImageEditor(editorSettings);
  objImageEditor.show();
  objImageEditor.hide();
  objImageEditor.dispose();
```

  + `Viewer.bindCustomElement()`
  + `Viewer.showCustomElement()`
  + `Viewer.hideCustomElement()`
  + `Viewer.toggleCustomElement()`

  As already mentioned, these four methods are removed and the alternative implementation is shown in the code below

``` javascript
  var objCustomElement = DWTObject.Viewer.createCustomElement(document.getElementById("divCustomElement"));
  objCustomElement.show();
  objCustomElement.hide();
  objCustomElement.dispose();
```

## 16.1.1

### TWAIN Capability Negotiation

> [Alternative] Use [getCapabilities()](/_articles/info/api/WebTwain_Acquire.md#getcapabilities) and [setCapabilities()](/_articles/info/api/WebTwain_Acquire.md#setcapabilities) instead.

* CapGet()
* CapGetHelp()
* CapGetCurrent()
* CapGetDefault()
* CapGetFrameBottom()
* CapGetFrameLeft()
* CapGetFrameRight()
* CapGetFrameTop()
* CapGetLabel()
* CapGetLabels()
* CapSet()
* CapReset()
* CapSetFrame()
* CapIfSupported()
* GetCapItems()
* GetCapItemsString()
* SetCapItems()
* SetCapItemsString()
* Capability
* CapNumItems
* CapMaxValue
* CapMinValue
* CapCurrentValue
* CapCurrentIndex
* CapDefaultValue
* CapDefaultIndex
* CapType
* CapValueType
* CapStepSize
* CapValue
* CapValueString

### Buffer Management

> [Alternative] Use [SelectedImagesIndices](/_articles/info/api/WebTwain_Buffer.md#selectedimagesindices), [SelectAllImages()](/_articles/info/api/WebTwain_Buffer.md#selectallimages) and [SelectImages()](/_articles/info/api/WebTwain_Buffer.md#selectimages) instead.

* GetSelectedImageIndex()
* SetSelectedImageIndex
* SelectedImagesCount

### Image Editing

<!-- > [Alternative] Annotation feature to be added in a later version. -->

* AddText()
* CreateTextFont()
* OverlayRectangle()

### Input and Output

> [Alternative] Use new methods like [ConvertToBase64()](/_articles/info/api/WebTwain_IO.md#converttobase64), [PDF.Write.Setup()](/_articles/info/api/Addon_PDF.md#writesetup)

* SaveSelectedImagesToBase64Binary()
* SetCookie()
* IfOpenImageWithGDIPlus
* PDFAuthor
* PDFCompressionType
* PDFCreationDate
* PDFCreator
* PDFKeywords
* PDFModifiedDate
* PDFProducer
* PDFSubject
* PDFTitle
* PDFVersion
* MaxInternetTransferThreads

### Viewer

> [Alternative] Use methods like [Viewer.setViewMode()](/_articles/info/api/WebTwain_Viewer.md#setviewmode), [Viewer.setViewMode()](/_articles/info/api/WebTwain_Viewer.md#setviewmode)

* SetViewMode()
* SetSelectedImageArea()

---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Dynamic Web TWAIN SDK Schedule - Deprecated Features
keywords: Dynamic Web TWAIN, Documentation, Schedule, Deprecated Features
breadcrumbText: Deprecated
description: Dynamic Web TWAIN SDK Documentation Deprecated Features Page
permalink: /info/schedule/deprecated.html
---

# All Deprecated Features & APIs
<div class="blockquote-note"></div>
> All deprecated APIs are considered unsupported as of the version they are deprecated. They may be removed at any time with no further notice.

<!-- ## Planned

### SHA-1 signatures

To comply with Windows security updates, we will deprecate SHA-1 signatures in a future version. The impact is described below (we take 64bit Windows 7 as an example in below screenshots).

*If the deprecation is implemented:*

* When you try to install the Dynamsoft Service, you will get the following two error for "Unknown Publisher".

![Deprecation-1]({{site.assets}}imgs/Deprecation-1.png)

![Deprecation-2]({{site.assets}}imgs/Deprecation-2.png)

* When you run the ActiveX Edition in IE, you will get a prompt to allow its execution.

![Deprecation-3]({{site.assets}}imgs/Deprecation-3.png)

For more information, check out [Preparing for the deprecation of SHA-1 signatures](https://docs.microsoft.com/en-us/sysinternals/announce/sha1deprecation) from Microsoft.

The prompts are one-time, once you accept the "risk", the software will install and run as usual.

The recommended fix is to patch the operating system, you can find the patch [here](http://www.catalog.update.microsoft.com/search.aspx?q=kb4474419). -->

## 18.4

### PDF Rasterizer
> [Alternative] Use the [SetReaderOptions()]({{site.info}}api/Addon_PDF.html#setreaderoptions) and [GetReaderOptions()]({{site.info}}api/Addon_PDF.html#getreaderoptions) functions instead.

* GetConvertMode()
* SetConvertMode()
* SetPassword()
* SetResolution()

### Viewer
> This API has been deprecated as of release 18.4. Please use the [`updateSelectionBoxStyle()`]({{site.info}}api/WebTwain_Viewer.html#updateselectionboxstyle) function.

* selectedAreaBorderColor

## 18.2

### Global

* Dynamsoft.DWT.GetWebTwainEx()

## 18.0

### Dynamic Web TWAIN

> [Alternative] Use [Dynamsoft.DWT.ProductKey]({{site.info}}api/Dynamsoft_WebTwainEnv.html#productkey) instead.

* Dynamsoft.DWT.licenseServer 
* Dynamsoft.DWT.sessionPassword 
* Dynamsoft.DWT.organizationID
* Dynamsoft.DWT.handshakeCode

### Util

* Deprecated Method: DWObject.SetProductKeyAsync
* Deprecated Property: DWObject.ProductKey

### Scan

* Deprecated Method: DWObject.GetDeviceType

## 17.3

### Dynamic Web TWAIN

* Deleted property: Dynamsoft.DWT.UseDefaultInstallUI

### Viewer

> [Alternative] Use [updateCheckboxStyle]({{site.info}}api/WebTwain_Viewer.html#updatecheckboxstyle) and [updatePageNumberStyle]({{site.info}}api/WebTwain_Viewer.html#updatepagenumberstyle) instead.

* Viewer.showPageNumber
* Viewer.showCheckbox
* thumbnailViewer.showCheckbox
* thumbnailViewer.showPageNumber

### Camera Add-on

> [Alternative] Use [scanDocument]({{site.info}}api/Addon_Camera.html#scandocument) instead.

* Camera.showVideo()

## 17.0

### Viewer

* New APIs in v17.0 replace old APIs in v16.2-, all old APIs are deprecated.

| v17.0 | v16.2- |
|:-|:-|
| [ `Viewer.autoChangeIndex` ]({{site.info}}api/WebTwain_Viewer.html#autochangeindex) | `Viewer.topPageChanged()` |

* The following APIs are new in v17.0
  + [ `RemoveTag` ]({{site.info}}api/WebTwain_Buffer.html#removetag)
  + [ `GetTagList` ]({{site.info}}api/WebTwain_Buffer.html#gettaglist)
  + `DWT.licenseServer`
  + `DWT.handshakeCode`
  + `DWT.sessionPassword`
  + `DWT.licenseException`

## 16.2 

* Internet Explorer 8 is no longer supported.

### Camera Add-on

* New APIs in v16.2 replace old APIs in v16.1-, all old APIs are deleted.

| v16.2 | v16.1- |
|:-|:-|
| [ `Addon.Camera.showVideo()` ]({{site.info}}api/Addon_Camera.html#showvideo) | `Viewer.showVideo()` |
| [ `Addon.Camera.closeVideo()` ]({{site.info}}api/Addon_Camera.html#closevideo) | `Viewer.closeVideo()` |
| [ `Addon.Camera.off()` ]({{site.info}}api/Addon_Camera.html#off) | `Viewer.off()` |
| [ `Addon.Camera.on("video-closed")` ]({{site.info}}api/Addon_Camera.html#video-closed) | `Viewer.on("video-closed")` |
| [ `Addon.Camera.on("video-error")` ]({{site.info}}api/Addon_Camera.html#video-error) | `Viewer.on("video-error")` |

### Viewer

* New APIs in v16.2 replace old APIs in v16.1-, all old APIs are deprecated.

| v16.2 | v16.1- |
|:-|:-|
| [ `Viewer.background` ]({{site.info}}api/WebTwain_Viewer.html#background) | `BackgroundColor` |
| [ `Viewer.bind()` ]({{site.info}}api/WebTwain_Viewer.html#bind) , [ `Viewer.show()` ]({{site.info}}api/WebTwain_Viewer.html#show) , [ `Viewer.hide()` ]({{site.info}}api/WebTwain_Viewer.html#hide) | `BindViewer()` |
| [ `Viewer.cursor` ]({{site.info}}api/WebTwain_Viewer.html#cursor) | `MouseShape` |
| [ `Viewer.fitWindow()` ]({{site.info}}api/WebTwain_Viewer.html#fitwindow) | `FitWindowType` , `IfFitWindow` |
| [ `Viewer.height` ]({{site.info}}api/WebTwain_Viewer.html#height) | `Height` |
| [ `Viewer.ifAutoScroll` ]({{site.info}}api/WebTwain_Viewer.html#ifautoscroll) | `IfAutoScroll` |
| [ `Viewer.on("click", callback)` ]({{site.info}}api/WebTwain_Viewer.html#click) | `RegisterEvent("OnMouseClick", callback)` |
| [ `Viewer.on("contextmenu", callback)` ]({{site.info}}api/WebTwain_Viewer.html#contextmenu) | `RegisterEvent("OnMouseRightClick", callback)` |
| [ `Viewer.on("dblclick", callback)` ]({{site.info}}api/WebTwain_Viewer.html#dblclick) | `RegisterEvent("OnMouseDoubleClick", callback)` |
| [ `Viewer.on("mousemove", callback)` ]({{site.info}}api/WebTwain_Viewer.html#mousemove) | `RegisterEvent("OnMouseMove", callback)` |
| [ `Viewer.on("pageAreaSelected", callback)` ]({{site.info}}api/WebTwain_Viewer.html#pageareaselected) | `RegisterEvent("OnImageAreaSelected", callback)` |
| [ `Viewer.on("pageAreaUnselected", callback)` ]({{site.info}}api/WebTwain_Viewer.html#pageareaunselected) | `RegisterEvent("OnImageAreaDeSelected", callback)` |
| [ `Viewer.pageMargin` ]({{site.info}}api/WebTwain_Viewer.html#pagemargin) | `ImageMargin` |
| [ `Viewer.selectedPageBorder` ]({{site.info}}api/WebTwain_Viewer.html#selectedpageborder) | `SelectionImageBorderColor` |
| [ `Viewer.selectionRectAspectRatio` ]({{site.info}}api/WebTwain_Viewer.html#selectionrectaspectratio) | `SelectionRectAspectRatio` |
| [ `Viewer.setSelectedAreas()` ]({{site.info}}api/WebTwain_Viewer.html#setselectedareas) | `SetSelectedImageArea()` |
| [ `Viewer.showPageNumber` ]({{site.info}}api/WebTwain_Viewer.html#showpagenumber) | `ShowPageNumber` |
| [ `Viewer.unbind()` ]({{site.info}}api/WebTwain_Viewer.html#unbind) | `UnbindView()` |
| [ `Viewer.width` ]({{site.info}}api/WebTwain_Viewer.html#width) | `Width` |
| [ `Viewer.zoom` ]({{site.info}}api/WebTwain_Viewer.html#zoom) | `Zoom` |
| `ViewerEvent.imageX` | `MouseX` |
| `ViewerEvent.imageY` | `MouseY` |

> NOTE
>  
> `ViewerEvent.imageX` and `ViewerEvent.imageY` are only available as the first argument in callback functions for the mouse events "click", "dblclick", "contextMenu" and "mousemove".

* The following APIs are new in v16.2
  + [ `Viewer.acceptDrop` ]({{site.info}}api/WebTwain_Viewer.html#acceptdrop)
  + [ `Viewer.allowSlide` ]({{site.info}}api/WebTwain_Viewer.html#allowslide)
  + [ `Viewer.clearSelectedAreas()` ]({{site.info}}api/WebTwain_Viewer.html#clearselectedareas)
  + [ `Viewer.createThumbnailViewer()` ]({{site.info}}api/WebTwain_Viewer.html#createthumbnailviewer)
  + [ `Viewer.border` ]({{site.info}}api/WebTwain_Viewer.html#border)
  + [ `Viewer.first()` ]({{site.info}}api/WebTwain_Viewer.html#first)
  + [ `Viewer.getUISettings()` ]({{site.info}}api/WebTwain_Viewer.html#getuisettings)
  + [ `Viewer.gotoPage()` ]({{site.info}}api/WebTwain_Viewer.html#gotopage)
  + [ `Viewer.idPostfix` ]({{site.info}}api/WebTwain_Viewer.html#idpostfix)
  + [ `Viewer.innerBorder` ]({{site.info}}api/WebTwain_Viewer.html#innerborder)
  + [ `Viewer.last()` ]({{site.info}}api/WebTwain_Viewer.html#last)
  + [ `Viewer.next()` ]({{site.info}}api/WebTwain_Viewer.html#next)
  + [ `Viewer.on("pageRendered", callback)` ]({{site.info}}api/WebTwain_Viewer.html#pagerendered)
  + [ `Viewer.on("resize", callback)` ]({{site.info}}api/WebTwain_Viewer.html#resize)
  + [ `Viewer.previous()` ]({{site.info}}api/WebTwain_Viewer.html#previous)
  + [ `Viewer.render()` ]({{site.info}}api/WebTwain_Viewer.html#render)
  + [ `Viewer.resetUISettings()` ]({{site.info}}api/WebTwain_Viewer.html#resetuisettings)
  + [ `Viewer.selectedAreaBorderColor` ]({{site.info}}api/WebTwain_Viewer.html#selectedareabordercolor)
  + [ `Viewer.selectedPageBackground` ]({{site.info}}api/WebTwain_Viewer.html#selectedpagebackground)
  + [ `Viewer.singlePageMode` ]({{site.info}}api/WebTwain_Viewer.html#singlepagemode)

* The following APIs in v16.2 are improved based on old APIs in v16.1-.

  + [`Viewer.setViewMode()`]({{site.info}}api/WebTwain_Viewer.html#setviewmode)

    It also accepts the values "-1, -1" which is equivalent to setting `Viewer.singlePageMode` to `true` .

  + [`Viewer.updateUISettings()`]({{site.info}}api/WebTwain_Viewer.html#updateuisettings)

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
  DWObject.Viewer.height = 800;
  DWObject.Viewer.width = 600;
  /* Create a thumbnail viewer, note that this viewer can be hidden or disposed */
  var objThumbnailViewer = DWObject.Viewer.createThumbnailViewer(thumbnailViewerSettings);
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
  var objImageEditor = DWObject.Viewer.createImageEditor(editorSettings);
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
  var objCustomElement = DWObject.Viewer.createCustomElement(document.getElementById("divCustomElement"));
  objCustomElement.show();
  objCustomElement.hide();
  objCustomElement.dispose();
```

## 16.1.1

### TWAIN Capability Negotiation

> [Alternative] Use [getCapabilities()]({{site.info}}api/WebTwain_Acquire.html#getcapabilities) and [setCapabilities()]({{site.info}}api/WebTwain_Acquire.html#setcapabilities) instead.

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

> [Alternative] Use [SelectedImagesIndices]({{site.info}}api/WebTwain_Buffer.html#selectedimagesindices), [SelectAllImages()]({{site.info}}api/WebTwain_Buffer.html#selectallimages) and [SelectImages()]({{site.info}}api/WebTwain_Buffer.html#selectimages) instead.

* GetSelectedImageIndex()
* SetSelectedImageIndex
* SelectedImagesCount

### Image Editing

<!-- > [Alternative] Annotation feature to be added in a later version. -->

* AddText()
* CreateTextFont()
* OverlayRectangle()

### Input and Output

> [Alternative] Use new methods like [ConvertToBase64()]({{site.info}}api/WebTwain_IO.html#converttobase64), [PDF.Write.Setup()]({{site.info}}api/Addon_PDF.html#writesetup)

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

> [Alternative] Use methods like [Viewer.setViewMode()]({{site.info}}api/WebTwain_Viewer.html#setviewmode), [Viewer.setViewMode()]({{site.info}}api/WebTwain_Viewer.html#setviewmode)

* SetViewMode()
* SetSelectedImageArea()

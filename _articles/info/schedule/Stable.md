---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Schedule - Stable Release
keywords: Dynamic Web TWAIN, Documentation, Schedule, Stable Release
breadcrumbText: Stable Releases
noTitleIndex: true
description: Dynamic Web TWAIN SDK Documentation Schedule Stable Release Page
---

# Stable Releases

## 19.1 (05/07/2025) 

### New Features

Added a new method [`getVisiblePagesInfo()`](/_articles/info/api/WebTwain_Viewer.md#getvisiblepagesinfo) to return the information of visible pages in a viewer. It is useful to add custom elements.

### Improvements

- Added support for reading special TIFFs (e.g. 4-bit RGB interleaved, old-style JPEG compression) on Windows.
- Added support for keeping the PDF forms when saving.
- Updated the way of checking CSS file integrity from fetching to examining the effectiveness of CSS rules.
- Updated the format of license expiry date to avoid misunderstanding.

### Bug Fixes

- Fixed a bug that when `preserveUnmodifiedOnSave` is set to `true`, `CopyToDocumentAsync()` will fail.
- Fixed a bug that the width and height set in percentage using the Web TWAIN object is not effective after resizing.

### Other Changes

Updated the names of headers for the REST API.

- X-DICS-LICENSE-KEY -> DWT-PRODUCT-KEY
- X-DICS-DOC-PASSWORD -> DWT-DOC-PASSWORD

## 19.0 (04/01/2025) 

### New Features 

- **Greatly expanded support for the [RESTful Dynamic Web TWAIN Service](/_articles/extended-usage/restful-api.md).**
- **PDF Handling**:
  - Added new PDF Rasterizer Add-On API [`preserveUnmodifiedOnSave`](/_articles/info/api/interfaces.md#readeroptions) to preserve the size of unmodified PDF pages when saving.
  - Added new PDF Rasterizer Add-On API [`IsRasterizationRequired()`](/_articles/info/api/Addon_PDF.md#israsterizationrequired). This API returns true if the PDF file contains content other than one image per page. Please note that while invoking this API does not require a license for the PDF Rasterizer Add-On, a license is required to perform actual rasterization of the PDF for viewing purposes.
- **Cross-platform support**: Added macOS and Linux platform support for DWT Barcode Reader Add-On.
- **Error messages**: Added more informative error messages with the new [`ErrorCause`](/_articles/info/api/WebTwain_Util.md#errorcause) API.
- **Keyboard accessibility**: Added Tab key keyboard navigation in the DWT `Viewer`. The browser now shows a focus outline on the `Viewer` upon tabbing into the `Viewer`, which can be disabled with the new [`{WebTwainObject}.Viewer.disableFocusOutline`](/_articles/info/api/WebTwain_Viewer.md#disablefocusoutline) API. (this property is `true` by default, i.e. disables the outline)

### Improvements

- **Security enhancements**: updated third-party libraries to enhance security.
- **Image rasterization logic**: The logic is optimized when two or all of the following properties are specified in [`ReaderOptions.RenderOptions`: `maxWidth`, `maxHeight`, and `resolution`](/_articles/info/api/interfaces.md#readeroptions).

- **Renamed the Dynamsoft Service to Dynamic Web TWAIN Service**.
- **New Dynamic Web TWAIN Service installation path for Windows**: moved installation out of `SysWOW64` and `System32` on Windows to prevent rare false positive antivirus scans.
  - New 64-bit system-wide installation location: `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service 19`
  - New 32-bit system-wide installation location: `C:\Program Files\Dynamsoft\Dynamic Web TWAIN Service 19`
- Changed `ErrorString` messages associated with `ErrorCode -2003` for `HTTPUpload`-related APIs to include HTTP codes in the form of `HTTP process: {message}({HTTP status code})`, e.g. `HTTP process: OK(200)`. This change applies to `ErrorString` for the following APIs:

  - [`{WebTwainObject}.HTTPUpload()`](/_articles/info/api/WebTwain_IO.md#httpupload)
  - [`{WebTwainObject}.HTTPUploadThroughPost()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpost)
  - [`{WebTwainObject}.HTTPUploadThroughPostEx()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpostex)
  - [`{WebTwainObject}.HTTPUploadAllThroughPostAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#httpuploadallthroughpostasmultipagetiff)
  - [`{WebTwainObject}.HTTPUploadAllThroughPostAsPDF()`](/_articles/info/api/WebTwain_IO.md#httpuploadallthroughpostaspdf)
  - [`{WebTwainObject}.HTTPUploadThroughPostAsMultiPagePDF()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpostasmultipagepdf)
  - [`{WebTwainObject}.HTTPUploadThroughPostAsMultiPageTIFF()`](/_articles/info/api/WebTwain_IO.md#httpuploadthroughpostasmultipagetiff)
- **Thumbnail Viewer customization**: added a `position` property to the [`ThumbnailViewerEvent`](/_articles/info/api/interfaces.md#thumbnailviewerevent) to facilitate further customizations, for example, displaying a delete icon when the mouse is hovering over a thumbnail.

   ![thumbnail viewer event](/assets/imgs/thumbnail-viewer-event-demo.jpg)

### Removed Features

- **Discontinued support for the PDF Compressor Add-On.**
- **Discontinued out-of-the-box support for ActiveX.**
- **Discontinued support for 32-bit macOS**: now only supporting macOS versions 10.15 and higher.
- **Discontinued support for Android**: use [Mobile Web Capture](https://www.dynamsoft.com/use-cases/mobile-web-capture-sdk/) instead.

### Bug Fixes

- Fixed a CORS request blocked error which also triggers a prompt to install the Dynamic Web TWAIN Service.
- Fixed Vite runtime errors caused by polyfills and resource path misconfiguration.

## 18.5.1 (10/22/2024)

### Improvements 

- Enhanced product security.   
- Updated third-party libraries to enhance security.   
- Enhanced compatibility with the HTTP Content-Security-Policy style-src directive. 
- Improved scanner compatibility. 
- Improved the internal algorithms of the IsBlankImageAsync API. 
- Added a configuration to file-saving APIs that allows specifying whether to automatically create directories when the provided path does not exist. This option is enabled by default, and preserves existing behavior. 

### Bug fixes 

- Fixed an issue where removing localStorage causes additional unexpected deletions under certain conditions. 
- Fixed an issue where FTP upload APIs fail to respond for large file uploads. 
- Fixed an issue where HTTP upload APIs do not return a response to server errors. 
- Fixed a sequence issue when saving TIFF files under certain conditions. 
- Reverted to the previous version of the ChangeBitDepth API algorithm when converting images to black and white. 
- Fixed an issue where save-related APIs do not enter their failure callbacks upon failing to save under certain conditions. 
- Fixed an issue where the file selection dialog fails to load files from manually entered file names 
- Fixed an issue where right clicking on a selection of multiple images in the viewer de-selects all but one image. 
- Fixed an issue where the print API prints two images on the same page under certain conditions. 


## 18.5 (05/14/2024)

### New features

- [Save the encrypted image caches in local Dynamsoft Service folder](https://www.dynamsoft.com/web-twain/docs-archive/v18.5.1/extended-usage/buffer-caching.html#save-the-encrypted-image-caches-in-local-dynamsoft-service-folder)
  
  In certain scenarios, there may be requirements to store encrypted image caches on a local disk for temporary data storage or backup purposes. Dynamic Web TWAIN introduces a new feature that facilitates developers in securely storing image caches in encrypted form within the Dynamsoft Service folder.

- [Access-Control-Allow-Origin for Dynamsoft Service](/_articles/extended-usage/dynamsoft-service-configuration.md#access-control-allow-origin)

  A new security feature configures Dynamsoft Service to respond only to requests from specified origins.

- [Generate the encrypted PDF files](/_articles/extended-usage/pdf-processing.md#pdf-save-settings)

  Supports the generation of encrypted PDF files with password protection.

### New APIs

- Global

  | APIs                                                         | Description                                                  |
  | ------------------------------------------------------------ | ------------------------------------------------------------ |
  | [`IfCheckCORS`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#ifcheckcors) | Whether to check CORS issue in detail.  |

- Buffer

  | APIs                                                         | Description                                                  |
  | ------------------------------------------------------------ | ------------------------------------------------------------ |
  | [`updateImage()`](/_articles/info/api/WebTwain_Buffer.md#updateimage) | Update the specified image with a new image.                 |
  | [`OnDiskExceedLimit`](/_articles/info/api/WebTwain_Buffer.md#ondiskexceedlimit) | A built-in callback triggered when disk cache exceeds the limit. |

- Input/Output

  | APIs                                                         | Description                                                  |
  | ------------------------------------------------------------ | ------------------------------------------------------------ |
  | [`createLocalStorage()`](/_articles/info/api/WebTwain_IO.md#createlocalstorage) | Create a storage folder locally to save the cache of encrypted images. |
  | [`localStorageExist()`](/_articles/info/api/WebTwain_IO.md#localstorageexist) | Determine whether the storage folder exists or not.          |
  | [`saveToLocalStorage()`](/_articles/info/api/WebTwain_IO.md#savetolocalstorage) | Save encrypted image caches to the specified storage folder. |
  | [`loadFromLocalStorage()`](/_articles/info/api/WebTwain_IO.md#loadfromlocalstorage) | Load image from the specified storage folder.                |
  | [`removeLocalStorage()`](/_articles/info/api/WebTwain_IO.md#removelocalstorage) | Remove the specified storage folder.                         |
  | [`httpUploadBlob()`](/_articles/info/api/WebTwain_IO.md#httpuploadblob) | Upload images which are in blob format.                      |
  | [`saveBlob()`](/_articles/info/api/WebTwain_IO.md#saveblob)   | Save image which are in blob format.                         |
  | [`IfSortBySelectionOrder`](/_articles/info/api/WebTwain_IO.md#ifsortbyselectionorder) | Whether to load the files by the selection order when load files by open file dialog. |

### Improvements

- Updated third-party libraries to enhance security.
- Added an optional parameter `capabilities` to the method [`getCapabilities()`](/_articles/info/api/WebTwain_Acquire.md#getcapabilities) for getting specified capabilities.
- Added `modifyId` to the interface [`BufferChangeInfo`](/_articles/info/api/interfaces.md#bufferchangeinfo) for returning the `imageId` of the modified image when [`OnBufferChanged`](/_articles/info/api/WebTwain_Buffer.md#onbufferchanged) is triggered.
- Added `password` to the interface [`PDFWSettings`](/_articles/info/api/interfaces.md#pdfwsettings) for configuring the password of the PDF file to save when [`Write.Setup()`](/_articles/info/api/Addon_PDF.md#writesetup) is called.
- Added data type `Device` to the parameter `scanner` in the interface [`ScanSetup`](/_articles/info/api/interfaces.md#scansetup) for supporting the device object when [`startScan()`](/_articles/info/api/WebTwain_Acquire.md#startscan) is used.
- Optimized the quality of the de-skewed image in the built-in ImageEditor.

### Changes

- Changed the design of the default Dynamsoft Service installation pop-up.

  ![Installation changes](/assets/imgs/installation-changes.png)

- Changed the data type of `imageId` from `number` to `string`. The affected APIs are as follows: 

  - Methods: [`ImageIDToIndex()`](/_articles/info/api/WebTwain_Buffer.md#imageidtoindex), [`IndexToImageID()`](/_articles/info/api/WebTwain_Buffer.md#indextoimageid)
  - Interfaces:

    | Interfaces                                                   | Related Methods or Events                                    |
    | ------------------------------------------------------------ | ------------------------------------------------------------ |
    | [`TagInfo`](/_articles/info/api/interfaces.md#taginfo)        | [`GetTagList()`](/_articles/info/api/WebTwain_Buffer.md#gettaglist) |
    | [`DocumentInfo`](/_articles/info/api/interfaces.md#documentinfo) | [`GetDocumentInfoList()`](/_articles/info/api/WebTwain_Buffer.md#getdocumentinfolist) |
    | [`OutputInfo`](/_articles/info/api/interfaces.md#outputinfo)  | [`OnPostTransferAsync`](/_articles/info/api/WebTwain_Acquire.md#onposttransferasync) |
    | [`BufferChangeInfo`](/_articles/info/api/interfaces.md#bufferchangeinfo) | [`OnBufferChanged`](/_articles/info/api/WebTwain_Buffer.md#onbufferchanged) |

### Bug fixes

- Resolved a bug where a predominantly white image turned black when changing its bit depth to 1 or converting it to B&W by fixing a threshold issue in the methods [`ChangeBitDepth()`](/_articles/info/api/WebTwain_Edit.md#changebitdepth) and [`ConvertToBW()`](/_articles/info/api/WebTwain_Edit.md#converttobw).
- Resolved the file compatibility issue when loading PDF files via drag and drop.
- Resolved a bug where [`Dynamsoft.DWT.Unload()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#unload) was still called even when the web page reload was cancelled.

### Barcode Reader Addon

- Updated to version 9.6.40.

## 18.4.2 (12/05/2023)

- Security update for Dynamsoft Service.

## 18.4.1 (10/24/2023)

### MacOS Service Hotfix
- Due to changes introduced with ICA drivers, Dynamic Web TWAIN may exhibit strange behavior while scanning. This release updates the Dynamsoft Service for MacOS to address these issues. See [this article](/_articles/faq/macos-sonoma-distorted-scans.md) for more details.

### DWTObject process optimization
- Fixed an issue where if the Web TWAIN object was deleted from context mid scan, the scanning queue would not terminate, leaving any future requests being left pending in queue.

## 18.4 (09/26/2023)

### This Version's Highlights
- Enhanced the encryption algorithm to strengthen local cache security.
-	Added the ability to stylize the selection box in the Viewer and Image Editor.
- Added a new function that allows you to export the selected image area to either a blob or base64 format.
-	Added a property to relocate the server-side folder that hosts the Dynamsoft Service installers.
- Added a new blank page detection method.
- Added a RESTful API (See [this article](https://www.dynamsoft.com/blog/announcement/dynamsoft-service-restful-api/) for more details)

### New APIs and Properties

#### Viewer and Image Editor Improvements
- Added [`updateSelectionBoxStyle()`](/_articles/info/api/WebTwain_Viewer.md#updateselectionboxstyle) to both the Viewer and the Image Editor to allow for custom styling of the rectangular selection box used when selecting a portion of an image in the Viewer and Image Editor.

#### Editor Functionality
- Added [`OutputSelectedAreaAsync()`](/_articles/info/api/WebTwain_IO.md#outputselectedareaasync) to export the selected image area to blob or base64.

#### Resource Optimization
- Added `Dynamsoft.DWT.ServiceInstallerLocation` to allow moving the dist folder to a different location than the Resources folder.

#### Buffer
- Added [`MoveToDocumentAsync()`](/_articles/info/api/WebTwain_Buffer.md#movetodocumentasync) and [`CopyToDocumentAsync()`](/_articles/info/api/WebTwain_Buffer.md#copytodocumentasync) to allow for more multi-document handling.
- Added [`IsBlankImageAsync()`](/_articles/info/api/WebTwain_Buffer.md#isblankimageasync) as an additional blank page detection method using a different algorithm than the existing `IsBlankImage()` and `IsBlankImageExpress()` functions. This method allows for sensitivity customization, enabling users to overlook minor marks and disregard background patterns. This API currently is Windows only.

### Improvements

#### PDF Rasterizer
- Added new [`ReaderOptions`](/_articles/info/api/interfaces.md#readeroptions) interface.
- Added functions [`SetReaderOptions()`](/_articles/info/api/Addon_PDF.md#setreaderoptions) and [`GetReaderOptions()`](/_articles/info/api/Addon_PDF.md#getreaderoptions) to utilize the new `ReaderOptions` interface.

#### File Saving
- Saving a Black and White JPG will now automatically convert the image to grayscale prior to saving. This is due to the limitation that JPGs do not allow black and white images.  Previously, Black and White images were not able to be saved to JPG without manually converting the color space prior.

### Bug Fixes
- Fixed a bug where the Content-Type of ConvertToBlob was sometimes incorrectly reported in the response back from the Dynamsoft Service.
- Fixed a bug where setting the container size by percentage caused incorrect viewer sizing.

### Deprecations
#### PDF Rasterizer
> [Alternative] Use the [`SetReaderOptions()`](/_articles/info/api/Addon_PDF.md#setreaderoptions) and [`GetReaderOptions()`](/_articles/info/api/Addon_PDF.md#getreaderoptions) functions instead.

* GetConvertMode()
* SetConvertMode()
* SetPassword()
* SetResolution()

#### Viewer

* selectedAreaBorderColor has been deprecated. Please use the [`updateSelectionBoxStyle()`](/_articles/info/api/WebTwain_Viewer.md#updateselectionboxstyle) function.


## 18.3 (06/20/2023)

### New Features

#### Image Viewer

- Add a new property <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Viewer.html#zoomorigin" target="_blank">zoomOrigin</a> to determine the zoom origin as well as adding to <a href="https://www.dynamsoft.com/web-twain/docs/info/api/Interfaces.html#imageeditor" target="_blank">ImageEditor</a> and <a href="https://www.dynamsoft.com/web-twain/docs/info/api/Interfaces.html#editorsettings" target="_blank">EditorSettings</a>.

### Preview Feature

#### PDF Compressor (Beta)

- PDF Compressor is a compression technology based on color clustering which can help to reduce the file size when saving images as a PDF file. To preview this feature, please see <a href="https://demo.dynamsoft.com/Samples/dwt/PDF-Compressor/PDF-Compressor.html" target="_blank">this demo</a>. Please <a href="https://www.dynamsoft.com/company/customer-service/#contact" target="_blank">contact us</a> if you have any feedback or suggestions.

### Improvements

#### Image Viewer

-	Optimized display speed of images in the viewer when view is set to n*n <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_Viewer.html#setviewmode" target="_blank">ViewMode</a>.

#### Android Service

-	When the remaining valid date of the local.dynamsoft.com certificate is less than or equal to 21 days, the certificate will be automatically renewed in the network environment.

#### <a href="https://www.dynamsoft.com/remote-scan/docs/introduction/" target="_blank">Remote Scan</a>

-	Optimize the configuration pages of Bonjour Service and Proxy Service to make the process clearer and easier to proceed.

#### General Improvements

- Update third-party libraries to the latest version.
-	Remove redundant 32-bit dlls from Dynamsoft Service 64-bit installation directory.


## 18.2 (05/09/2023)

### New Features
#### WIA 2.0 Scanner Support
 - Added support for direct control of WIA 2.0 drivers in [EnumDWT_DeviceType](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_devicetype). <!-- Please see Insert link to FAQ -->

<iframe width="560" height="315" src="https://www.youtube.com/embed/mZcWLGwfCP4" title="WIA Scanner Support" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


#### Optimized Android Service for document scanning from Android devices
- The Android service is available on <a href="https://play.google.com/store/apps/details?id=com.dynamsoft.mobilescan" target="_blank">Google Play Store</a>.
- Expanded the capabilities of the Android platform. See <a href="https://www.dynamsoft.com/web-twain/docs/info/api/#android" target="_blank">the APIs supported on Android service</a>.

#### Remote Scan
- The Remote Scan solution powered by Dynamic Web TWAIN is now officially available. Using Remote Scan, you can turn any of your traditional document scanners into a network accessible scanner and allow your end users to use it without any client side installs. Read <a href="https://www.dynamsoft.com/remote-scan/docs/introduction/" target="_blank">this documentation</a> to learn how the Remote Scan solution works.


### Improvements

#### Image Viewer
- The Viewer component has been migrated to a dedicated resource file. This will allow for viewerless implementations of Dynamic Web TWAIN, as well as reducing the load on the browser by removing the necessity of loading the Viewer resources into memory when the Viewer is not being used. See the property [Dynamsoft.DWT.UseDefaultViewer](/_articles/info/api/Dynamsoft_WebTwainEnv.md#usedefaultviewer).
- Added the enum [EnumDWT_WorkMode](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_workmode) with a new option for image editor setting. Please refer to [createImageEditor](/_articles/info/api/WebTwain_Viewer.md#createimageeditor).
- Added new method `save()` to the ImageEditor object, please refer to [createImageEditor](/_articles/info/api/WebTwain_Viewer.md#createimageeditor).

#### Optimized error handling during web twain initialization
- Added the [OnWebTwainError](/_articles/info/api/Dynamsoft_WebTwainEnv.md#onwebtwainerror) event for better capturing errors during the Web Twain object initialization. 

#### General Improvements
- Updated the barcode reader library to v9.6.20
- Improved progress bar accuracy during the encoding and decoding operations


<!-- 
--> 
### Bug fixes
Fixed bug where ShowFileDialog might not work properly on MacOS. 



## 18.1 (01/12/2023)

Dynamic Web TWAIN v18.1 is restructured into two editions. While the standard Service Edition focuses on interactions with scanners, the Plus Edition offers support for mobile cameras as well. The goal is to make sure the Service Edition is small-sized, easy-to-use, and stable. The Plus Edition, on the other hand, is more comprehensive and offers flexibility in platforms and devices.

The following table gives a quick comparison between the two editions.

|                                                                   | Service Edition                                                      | Plus Edition                                       |
|-------------------------------------------------------------------|----------------------------------------------------------------------|----------------------------------------------------|
| Interact with scanners from browsers on Windows, macOS and Linux  | Yes                                                                  | Yes                                                |
| Interact with scanners from browsers on Android                   | This will be supported in the next release.                          | Yes                                                |
| Interact with mobile cameras on iOS and Android devices           | No                                                                   | Yes                                                |
| Barcode Reader addon                                              | Windows platform for now                                             | Cross-platform support on all desktops and mobile  |
| Remote Scan                                                       | Windows/macOS/Linux support                                          | Cross-platform support                             |

NOTE (2025 Update): 

The Plus Edition was a temporary offering, as its enhanced features were integrated into a separate SDK product by the end of 2023. As a result, the Plus Edition is no longer available for public download. If you still require access to the Plus Edition for legacy purposes, please contact [support@dynamsoft.com](mailto:support@dynamsoft.com). 


## 18.0 (12/22/2022)

### Localhost Scan

#### New Features 

##### Service Edition for Android
  - Enable document scanning from eSCL-compatible scanners or Wi-Fi Direct scanners directly to your Android mobile device. Please refer to <a href="https://www.dynamsoft.com/blog/announcement/web-twain-android-service-scan-document/" target="_blank">this blog</a> for more details.
  
  [Get Dynamsoft Service in Google Play](https://play.google.com/store/apps/details?id=com.dynamsoft.mobilescan)

##### Scanner
  - Added new method [GetDevicesAsync](/_articles/info/api/WebTwain_Acquire.md#getdevicesasync){:target="_blank"}.
  - Added new method [SelectDeviceAsync](/_articles/info/api/WebTwain_Acquire.md#selectdeviceasync){:target="_blank"}.
  - Added new method [AcquireImageAsync](/_articles/info/api/WebTwain_Acquire.md#acquireimageasync){:target="_blank"}.
  - Added new optional parameter `deviceType` to the method [SelectSourceAsync](/_articles/info/api/WebTwain_Acquire.md#selectsourceasync){:target="_blank"}.

##### Mobile Web Capture
  - Support turning on/off torch
    - Added new method [turnOnTorch](https://www.dynamsoft.com/web-twain/docs-archive/v18.0/info/api/Addon_Camera.html#turnontorch){:target="_blank"} and [turnOffTorch](https://www.dynamsoft.com/web-twain/docs-archive/v18.0/info/api/Addon_Camera.html#turnofftorch){:target="_blank"}.
    - Added new method [getCapabilities](https://www.dynamsoft.com/web-twain/docs-archive/v18.0/info/api/Addon_Camera.html#getcapabilities){:target="_blank"}.
    - Added new property `torch` to `ScannerViewer`. Refer to [scanDocument](https://www.dynamsoft.com/web-twain/docs-archive/v18.0/info/api/Addon_Camera.html#scandocument){:target="_blank"}.

#### Improved Features
  - All license key types can now be specified with the API Dynamsoft.DWT.ProductKey.
  - Added new property [Dynamsoft.DWT.DeviceFriendlyName](/_articles/info/api/Dynamsoft_WebTwainEnv.md){:target="_blank"} which defines the specific device that consumes the license quota
  -	Added new enumeration [Dynamsoft.DWT.EnumDWT_ExtImageInfo](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_extimageinfo){:target="_blank"}
  -	Updated Barcode Reader add-on library to version 9.4. Check out the release notes for <a href="https://www.dynamsoft.com/barcode-reader/docs/web/programming/javascript/release-notes/js-9.html?ver=latest" target="_blank">Barcode Reader JavaScript SDK - 9.x</a>


#### Bug Fixes
  - Base64 string returning null on load
  - Scanner source name not showing on source list
  - OnPreExecute not removing loading bar
  - ConvertToBase64 not working in v17.3
 
#### Deprecations
  - Check out the [Deprecations](/_articles/info/schedule/deprecated.md#180) page for v18.0 deprecations.

#### Changes to ActiveX Edition
  -	Added the following API supports for better compatibility with HTML5 Edition: 
  [HTTPUpload](/_articles/info/api/WebTwain_IO.md#httpupload){:target="_blank"}, 
  [ConvertToBase64](/_articles/info/api/WebTwain_IO.md#converttobase64){:target="_blank"}, 
  [OnBufferChanged](/_articles/info/api/WebTwain_Buffer.md#onbufferchanged){:target="_blank"}, 
  [CloseSourceAsync](/_articles/info/api/WebTwain_Acquire.md#closesourceasync){:target="_blank"}, 
  [OpenSourceAsync](/_articles/info/api/WebTwain_Acquire.md#opensourceasync){:target="_blank"}, 
  [GetSourceNamesAsync](/_articles/info/api/WebTwain_Acquire.md#getsourcenamesasync){:target="_blank"}, 
  [CloseSourceManagerAsync](/_articles/info/api/WebTwain_Acquire.md#closesourcemanagerasync){:target="_blank"}, 
  [OpenSourceManagerAsync](/_articles/info/api/WebTwain_Acquire.md#opensourcemanagerasync){:target="_blank"}

### Remote Scan
Remote Document Scanning enables document scanning from all available Dynamsoft Services and eSCL scanners on the intranet through one proxy service, via any supported devices and browsers, without any software installation. Please refer to <a href="https://www.dynamsoft.com/remote-scan/docs/introduction/" target="_blank">this documentation</a> for more details.

<iframe width="560" height="315" src="https://www.youtube.com/embed/yMUmETWLDQ8" title="New Features in Dynamic Web TWAIN 18.0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Breaking Changes
In 18.0+, if you call Dynamsoft.DWT.GetWebTwain against a non-existent ContainerID, you will get a null return. Previously, if you made the same call in the same situation, the WebTWAIN object would still initialize. To initiate the WebTWAIN object against a ContainerID, please use `GetWebTwain`. To utilize a viewer-less WebTWAIN object, please use [`CreateDWTObjectEx`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#createdwtobjectex)


## 17.3 (06/30/2022)

### New and Improved Features 

#### Mobile Web Capture
 - Improved performance and user experience with re-designed mobile document capture workflow. Some highlights:
    - The original copy of an image is kept in the new document editor object so you can always go back to the original image to make any edit.
    - Building your custom workflow to trigger actions in your desired sequence is made easy.
    - Interface elements in the viewer/editor are now customizable. You can easily add/remove icons or change their style.

See the <a href="https://demo.dynamsoft.com/web-twain/mobile-online-camera-scanner/" target="_blank">**live demo**</a>.

#### Buffer
- Added new method [RenameDocument](/_articles/info/api/WebTwain_Buffer.md#renamedocument){:target="_blank"}.
-	Renamed methods
    - CreateFile -> [CreateDocument](/_articles/info/api/WebTwain_Buffer.md#createdocument){:target="_blank"}
    - OpenFile -> [OpenDocument](/_articles/info/api/WebTwain_Buffer.md#opendocument){:target="_blank"}
    - GetCurrentFileName -> [GetCurrentDocumentName](/_articles/info/api/WebTwain_Buffer.md#getcurrentdocumentname){:target="_blank"}
    -	RemoveFile -> [RemoveDocument](/_articles/info/api/WebTwain_Buffer.md#removedocument){:target="_blank"}
    -	GetFileInfoList -> [GetDocumentInfoList](/_articles/info/api/WebTwain_Buffer.md#getdocumentinfolist){:target="_blank"}
- Added new method [GetRawDataAsync](/_articles/info/api/WebTwain_Buffer.md#getrawdataasync){:target="_blank"}.

#### Viewer
- Added new method [updateCheckboxStyle](/_articles/info/api/WebTwain_Viewer.md#updatecheckboxstyle){:target="_blank"} to customize checkboxes. This method is also added to `ThumbnailViewer`. Refer to [createThumbnailViewer](/_articles/info/api/WebTwain_Viewer.md#createthumbnailviewer){:target="_blank"}.
- Added new method [updatePageNumberStyle](/_articles/info/api/WebTwain_Viewer.md#updatepagenumberstyle){:target="_blank"} to customize page numbers. This method is also added to `ThumbnailViewer`. Refer to [createThumbnailViewer](/_articles/info/api/WebTwain_Viewer.md#createthumbnailviewer){:target="_blank"}.
- Added new properties `checkbox` and `pageNumber` to `ThumbnailViewerSettings`. Refer to [createThumbnailViewer](/_articles/info/api/WebTwain_Viewer.md#createthumbnailviewer){:target="_blank"}.
- Added a new parameter `documentConfiguration` to the method [createTemplate](/_articles/info/api/WebTwain_Viewer.md#createtemplate){:target="_blank"}.
- Added new method [createDocumentEditor](/_articles/info/api/WebTwain_Viewer.md#createdocumenteditor){:target="_blank"}.
- Added new property [selectionMode](/_articles/info/api/WebTwain_Viewer.md#selectionmode){:target="_blank"}.
- Added new property [allowPageDragging](/_articles/info/api/WebTwain_Viewer.md#allowpagedragging){:target="_blank"}.

### Minor Improvements 
 - Modified [Dynamsoft.DWT.EnumDWT_PDFCompressionType](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_pdfcompressiontype){:target="_blank"} from `PDF_JBig2` to `PDF_JBIG2`.
 - Made changes to support organizationID value for Dynamsoft.DWT.ProductKey.
 - Enabled license key validation for the correct version during initialization.

### Bug Fixes
 - On MacOS, images in the viewer were sometimes lost when waking up from sleep mode.
 - Incorrect error message displayed when using camera function with UseLocalService set to true.
 - Unchecking checkboxes did not trigger the OnBufferChanged event.
 - Failed to load dll for PDF decoding or encoding when using v17.x SDK with an older version image dll file.
 - Images failed to display in print window.
 - Edited images not showing correctly in Image Editor.
 - Images not displaying correctly in landscape mode when printing from Image Editor.
 - Iframe not working in Edge due to Content Security Policy.

### Deprecations

* Check out the [Deprecations](/_articles/info/schedule/deprecated.md#173) page for v17.3 deprecations.

## 17.2.5 (03/29/2022)

### Improved Features 

 - Updated the files *dynamsoft.webtwain.initiate.js* and *dynamsoft.webtwain.addon.camera.js* for better performance of mobile document capturing when using Safari on iOS/iPadOS 13+

### Bug Fixes

 - Updated the file *dynamsoft.webtwain.initiate.js* to resolve a memory leak issue in v17.2.1 on Chrome 98+ when the [view mode](/_articles/info/api/WebTwain_Viewer.md#setviewmode){:target="_blank"} is set to (-1, -1) or if a [thumbnail viewer](/_articles/info/api/WebTwain_Viewer.md#createthumbnailviewer){:target="_blank"} is used.

## 17.2.1 (02/24/2022)

### Improved Features 

 - Made changes to handle <a href="https://developer.chrome.com/blog/private-network-access-preflight/" target="_blank">CORS preflight requests</a> sent by Chrome from V98. Learn more [here](/_articles/faq/private-network-access-in-chrome101.md){:target="_blank"}. 
 - For Chromium V84+, use userAgentData instead of userAgent in response to UserAgent String phasing out issue. 

### Bug Fixes

 - Fixed a bug where Dynamsoft Service installation/uninstallation failed due to the current user account does not match the user account under C:\Users{account}. Learn more [here](/_articles/faq/service-installation-issue.md){:target="_blank"}. 
 - [HTML5 on MacOS] Fixed a bug where the short key (set by [organizationID](/_articles/info/api/Dynamsoft_WebTwainEnv.md#organizationid){:target="_blank"}) did not work on macOS 12+.
 - Fixed a bug where the mouse wheel did not work when the mouse was over the viewer.
 - [HTML5 on MacOS] Fixed a bug where buttons were not visible during Dynamic Web TWAIN/Dynamsoft Service installation when using dark mode.

## 17.2 (01/20/2022)

### New Features

#### Buffer
 - Organize images in a set
   - [HTML5 & WASM] Added new method [`CreateFile()`](/_articles/info/api/WebTwain_Buffer.md#createfile){:target="_blank"}.
   - [HTML5 & WASM] Added new method [`OpenFile()`](/_articles/info/api/WebTwain_Buffer.md#openfile){:target="_blank"}.
   - [HTML5 & WASM] Added new method [`RemoveFile()`](/_articles/info/api/WebTwain_Buffer.md#removefile){:target="_blank"}.
   - [HTML5 & WASM] Added new method [`GetCurrentFileName()`](/_articles/info/api/WebTwain_Buffer.md#getcurrentfilename){:target="_blank"}.
   - [HTML5 & WASM] Added new method [`GetFileInfoList()`](/_articles/info/api/WebTwain_Buffer.md#getfileinfolist){:target="_blank"}.
 - [HTML5 & WASM] Added new method [`GetTagListByIndex()`](/_articles/info/api/WebTwain_Buffer.md#gettaglistbyindex){:target="_blank"}.

#### Editor

- [HTML5 & WASM] Added new method [`ChangeBrightnessAsync()`](/_articles/info/api/WebTwain_Edit.md#changebrightnessasync){:target="_blank"}. 
- [HTML5 & WASM] Added new method [`ChangeContrastAsync()`](/_articles/info/api/WebTwain_Edit.md#changecontrastasnyc){:target="_blank"}.

#### Camera
- [WASM] Added new method [`scanDocument()`](https://www.dynamsoft.com/web-twain/docs-archive/v17.2.1/info/api/Addon_Camera.html#scandocument){:target="_blank"} to capture document(s).

#### Viewer
- [HTML5 & WASM] Added new property [`showCheckbox`](/_articles/info/api/WebTwain_Viewer.md#showcheckbox){:target="_blank"}. 
- [HTML5 & WASM] Added new method [`createTemplate()`](/_articles/info/api/WebTwain_Viewer.md#createtemplate){:target="_blank"} to create document scanner template. 

### Improved Features 

* Improved the <strong>mobile document capture</strong> in WASM mode. See more <a href="https://www.dynamsoft.com/web-twain/features/mobile-web-capture-sdk/" target="_blank">here</a>. 
* Added `CM_RENDERALLWITHANNOTATION` convert mode to [EnumDWT_ConvertMode](/_articles/info/api/Addon_PDF.md#setconvertmode){:target="_blank"} to support loading PDFs with annotations.
* Modified DynamicImage.dll(DynamicImagex64.dll) to improve encoding and decoding mode of TIFF files.
* Updated Barcode Reader library to version 8.6. Check out the release notes for <a href="https://www.dynamsoft.com/barcode-reader/programming/javascript/release-notes/js-8.html#860-08312021" target="_blank">Barcode Reader JavaScript SDK - 8.6</a>

### Bug Fixes

* Fixed a bug where the image displayed in the thumbnail may be inconsistent with that on the canvas when switching tags through `FilterImageByTag`.
* Fixed a bug that Dynamic Web TWAIN object could not be initialized when using iframe in Edge.
*	[HTML5 on macOS] Fixed a bug where `IfDuplexEnabled` may not work for some scanners. 
* [HTML5 on macOS & Linux] Fixed a bug where calling `LoadDibFromClipboard` does not work after calling `CropToClipboard`.

## 17.1.1 (08/19/2021)

### Improved Features 

* Updated DSSCN2.exe and DSSCN2x64.exe to optimize scanner compatibility.
* Improved the performance for the Dynamsoft Service connection.
* Improved [LoadDibFromClipboard](/_articles/info/api/WebTwain_IO.md#loaddibfromclipboard){:target="_blank"} to make it more stable.

### Bug Fixes

* Fixed a bug where operating system incorrectly judged when using Dynamic Web TWAIN with Electron.
* Fixed a bug that drag and drop does not work when loading multiple files.

## 17.1 (06/15/2021)

### New Features 

* Added support for ChromeOS. See more <a href="https://www.dynamsoft.com/codepool/chrome-os-web-document-scanning.html" target="_blank">here</a>

*	Added property [organizationID](/_articles/info/api/Dynamsoft_WebTwainEnv.md#organizationid){:target="_blank"} which can be used to fetch license(s) belonging to the specified organization from the License Tracking Server. With this property, the licensing of the library is smoother from trial to full and it is much easier to manage a license change without code updates.

### Improved Features 

*	The built-in viewer can now display thumbnails faster.

*	Installers for ARM x64 and MIPS x64 are now included in the package by default.

*	Separated the library into two distinctive modes: Desktop Service and WebAssembly for easier understanding and usage.

### Major Bug Fixes

*	Fixed a bug where the image fails to be displayed after it gets cropped and saved in the built-in ImageEditor.

*	Fixed a bug where images meant to be saved on the hard disk end up in the image buffer on macOS.

*	Fixed a bug where erasing part of an image will change its original display mode to be 'centered'.

### Changes to ActiveX Edition

*	Fixed a bug where the barcode reader addon fails to initiate on IE 10.


## 17.0 (04/20/2021) 

### New Features 

* Added support for 64-bit ARM based computers. [Video](https://www.youtube.com/watch?v=mBnaseU2xtc) 

* Added support for 64-bit MIPS based computers.  

* Added support for trackable license types such as "Per Browser Client". This new license mechanism is incompatible with the traditional product key. The related APIs are licenseServer, handshakeCode, sessionPassword, licenseException. 

* Added method [`RemoveTag()`](/_articles/info/api/WebTwain_Buffer.md#removetag) to remove a specified tag from one or multiple images. 

* Added method [`GetTagList()`](/_articles/info/api/WebTwain_Buffer.md#gettaglist) to return the status of all current tags. 

* Added method [`PrintEx()`](/_articles/info/api/WebTwain_IO.md#printex) to support selective printing.  

* Added property [`autoChangeIndex`](/_articles/info/api/WebTwain_Viewer.md#autochangeindex) which, when set to true, will make sure the first image in the viewer is always selected when scrolling through multiple images. 

### Improved Features 

* The built-in viewer now consumes less memory than before. 

* Scanning via ICA now supports the transfer modes File and Memory. 

* Upgraded the encryption algorithm for locally cached images from 64-bit Blowfish to AES-256-GCM encryption. 

* [`DefaultSourceName`](/_articles/info/api/WebTwain_Acquire.md#defaultsourcename) now refers to the last used source. 

* Updated Barcode Reader library to version 8.2.1. Check out release notes for [Barcode Reader JavaScript SDK - 8.2.1.](https://www.dynamsoft.com/barcode-reader/programming/javascript/release-notes/js-8.html#821-03292021)

###   Changed Behaviors  

* The property Viewer.selectedAreaBorderColor now also applies to the selection box on the video opened by the method [`showVideo`](https://www.dynamsoft.com/web-twain/docs-archive/v17.2.1/info/api/Addon_Camera-v17.1.1.html#showvideo).

### Breaking changes 

#### Moved 

* The original namespace `Dynamsoft.WebTwainEnv` is renamed to `Dynamsoft.DWT`. 

* All enumerations are moved under `Dynamsoft.DWT`. For example, `Dynamsoft.EnumDWT_PixelType` and `EnumDWT_PixelType` work in version 16.2 and lower but now it must be written as `Dynamsoft.DWT.EnumDWT_PixelType`.  

#### Others 

* Server-side OCR pro is no longer supported in this version. 

* When OCR Pro is used on the client side, it requires a trackable license. The traditional product key no longer works. 

### Bug Fixes 

* Fixed a bug where the method [`CloseSourceManager()`](/_articles/info/api/WebTwain_Acquire.md#closesourcemanager) gets called too many times and slows down scanning when you use SelectSourceByIndex() for source selection. 

* Fixed a bug where you get an incorrect name with the API [`CurrentSourceName`](/_articles/info/api/WebTwain_Acquire.md#currentsourcename)  or [`DefaultSourceName`](/_articles/info/api/WebTwain_Acquire.md#defaultsourcename) . 

### Notice 

* The package @types/dwt is no longer maintained, the type definitions are included by default in the dwt package since version 16.2. 

#### [NPM related](https://www.npmjs.com/package/dwt) 
* Add changes to Types 
  + Added definition for [`UseLocalService`](/_articles/info/api/WebTwain_Util.md#uselocalservice), [`RemoveTag()`](/_articles/info/api/WebTwain_Buffer.md#removetag)and [`GetTagList()`](/_articles/info/api/WebTwain_Buffer.md#gettaglist). 
  + Removed old definitions based on version 12, 13 and 14. 
  + Renamed namespace WebTwainEnv to DWT. 
  + Moved enumerations under Dynamsoft.WebTwainEnv. 

## `16.2` (01/18/2021)

### New Features

* Connection with the Dynamsoft Service is now maintained after the computer awake from sleep or hibernation.
  + Only on Windows or macOS.

* Added a new event [`OnBufferChanged`](/_articles/info/api/WebTwain_Buffer.md#onbufferchanged) which is triggered when the buffer changes like
  + New pages enter the buffer.
  + Existing pages are removed.
  + Existing pages are modified.
  + Existing pages are shifted.
  + Existing pages are filtered by a specified tag.
  + Page selection changes.

* Added a configuration page to update the host or ports of the Dynamsoft Service. By default, this page can be accessed by the URL http://127.0.0.1:18625/admin/.

* The default loader bar can now be customized with the API [`Dynamsoft.WebTwainEnv.CustomizableDisplayInfo.loaderBarSource`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#loaderbarsource). 
  + Only effective when set before the page finishes loading (i.e. before [DOMContentLoaded](https://developer.mozilla.org/en-US/docs/Web/API/Window/DOMContentLoaded_event)).

* Added a new global property [`Dynamsoft.WebTwainEnv.IfAlwaysFocusOnPopupWindow`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#ifalwaysfocusonpopupwindow) to control whether to set focus on scanner-related windows opened by the Dynamsoft Service when the browser tab on which the SDK is running is active. In the past, these windows will be on top no matter which browser tab is active.

* [Shadow DOM](https://www.dynamsoft.com/codepool/polymer-shadow-dom-web-document-scan.html) is officially supported.

* Added support for ARM-based macOS.

* Added support for 64-bit Raspberry Pi.

### Improved Features

* Made the viewer more independent and robust. Related APIs are redesigned.
  + Added a new global property [`Dynamsoft.WebTwainEnv.UseDefaultViewer`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#usedefaultviewer) to control whether the built-in viewer is used.

* Scanning remotely now supports showing the Manufacturer's User Interface.
  + Only when the remote machine is Windows.
  + To show the UI, use [`AcquireImage()`](/_articles/info/api/WebTwain_Acquire.md#acquireimage) with the parameter `deviceConfiguration` instead of the API [`IfShowUI`](/_articles/info/api/WebTwain_Acquire.md#ifshowui).
  + Check out [how to enable remote scan](/_articles/general-usage/scanner-image-acquisition.md#how-to-enable-remote-scan).

* Improved the tagging mechanism
  + Added a new method [`RenameTag()`](/_articles/info/api/WebTwain_Buffer.md#renametag) to rename an existing tag.
  + Added a new method [`ClearFilter()`](/_articles/info/api/WebTwain_Buffer.md#clearfilter) to stop filtering images by tag.
  + The method [`FilterImagesByTag()`](/_articles/info/api/WebTwain_Buffer.md#filterimagesbytag) shows all images if no parameter is passed or shows no image at all if the tag value passed doesn't exist or there is no images under that tag.

* Updated the signatures for the files on macOS so that TWAIN drivers can be populated correctly.

* Added global configuration options for the WASM-mode which includes [`maxHeapSize`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#maxheapsize) and [`fetchOptions`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#fetchoptions).

* Improved the methods [getCapabilities](/_articles/info/api/WebTwain_Acquire.md#getcapabilities) and [setCapabilities](/_articles/info/api/WebTwain_Acquire.md#setcapabilities) so that they work for ICA drivers on macOS too.

* The Barcode Reader add-on is upgraded from 7.4.0.0428 to 7.6.0.0112.
* Improved the display quality of the viewer in single-image mode (-1 * -1).

### Changed Behaviors

* When the view changes from single-image mode to multi-image mode, the cursor used to be changed to "hand" which means you can drag and drop images, in v16.2, the cursor will stay unchanged. In other words, if the cursor was "crosshair" in single-image mode, it'll continue to be "crosshair" in multi-image mode which means you can continue to draw rectangles on these images (NOTE that you can only draw on the *current* image). You can use the property [Viewer.cursor](/_articles/info/api/WebTwain_Viewer.md#cursor) to change the cursor in this case.

* The properties [`Width`](/_articles/info/api/WebTwain_Viewer.md#width) and [`Height`](/_articles/info/api/WebTwain_Viewer.md#height) will always return the actual number of pixels even if you set them with a percentage like "50%".

* The properties `BackgroundColor` and `SelectionImageBorderColor` will always return a string that represents the style (color, border, etc.) even if you set them with numbers. For example,  `BackgroundColor` returns "#000032" if you set it to "50" and `SelectionImageBorderColor` returns "1px solid #000032" when you set it to "50". Also, these two properties are deprecated and should be replaced by [`Viewer.background`](/_articles/info/api/WebTwain_Viewer.md#background) and [`Viewer.selectedPageBorder`](/_articles/info/api/WebTwain_Viewer.md#selectedpageborder).

* The properties `IfFitWindow` and `FitWindowType` are now write-only as their actual values may not be correct when you read them. As these properties are deprecated, use [`fitWindow()`](/_articles/info/api/WebTwain_Viewer.md#fitwindow) instead.

* Added a 3rd parameter `fill` to the method [`play()`](https://www.dynamsoft.com/web-twain/docs-archive/v17.2.1/info/api/Addon_Camera-v17.1.1.html?ver=16.2&&cVer=true#play) which determines whether the video should fill the whole viewer and have a part of the video hidden. In v16.1.1-, the default behavior is to fill the whole viewer and in v16.2, it'll put the video within the viewer and possibly leave some margin.

* On macOS, the default transfer mode for TWAIN drivers is changed from "native" to "memory".

* The "Cut" ("Erase") button in the image editor now cuts the selected area to the clipboard instead of just erasing the area.

* The "Stretch" button is deleted from the image editor.

* The type declaration files are now included in the [`Dynamic Web TWAIN` package](https://www.npmjs.com/package/dwt). From version 16.2 on, these files are no longer maintained on [DefinitelyTyped](https://github.com/DefinitelyTyped/DefinitelyTyped).

### Breaking changes

#### Moved

* The methods `showVideo()` and `closeVideo()` are moved from the interface `Viewer` to `Addon.Camera`.

* The method [`showVideo()`](https://www.dynamsoft.com/web-twain/docs-archive/v17.2.1/info/api/Addon_Camera-v17.1.1.html?ver=16.2&&cVer=true#showvideo) has added two more parameters `mode` and `fill` and the video starts in the new default `picture` mode. To get the old behavior, use the `document` mode.

#### Deleted

* The property `SelectedImagesCount` and the method `GetSelectedImageIndex()` are deleted. Use [`SelectedImagesIndices`](/_articles/info/api/WebTwain_Buffer.md#selectedimagesindices) instead.

* The method `SetSelectedImageIndex()` is deleted. Use [`SelectImages()`](/_articles/info/api/WebTwain_Buffer.md#selectimages) instead.

* The method `UpdateViewer()` is deleted. There is no alternative method.

* The second parameter for the method `BindViewer()` is deleted and it has only one parameter to specify the HTML element now. Therefore, you cannot use this method to create a thumbnail viewer anymore. Use the new method [`createThumbnailViewer()`](/_articles/info/api/WebTwain_Viewer.md#createthumbnailviewer) instead.

#### Others

* Check out [Viewer related API changes in version 16.2](/_articles/info/api/appendix.md#viewer-related-api-changes-in-version-162).

### Bug Fixes

* Fixed a bug where if you create a `WebTwain` instance under WASM-mode and then destroy it and create another `WebTwain` instance under Service-mode, you will be prompted to install the Dynamsoft Service even if it is already installed.

* Fixed a bug with the scanner model "Canon DR-M260" (200 series) where the manufacturer's UI hangs or disappears once it is shown.

* Fixed a bug on macOS where 1-bit TIFF files become inverted once they are transferred via the system clipboard.

* Fixed a bug where changing the UI of the image editor will affect the main viewer.

* Fixed a bug where the method [`updateRuntimeSettings`](/_articles/info/api/Addon_BarcodeReader.md#updateruntimesettings) will overwrite all settings you set with the method [`initRuntimeSettingsWithString`](/_articles/info/api/Addon_BarcodeReader.md#initruntimesettingswithstring).

* Fixed a bug where the wrong PDF library is referenced when the SDK switches to the Service-mode from WASM-mode.

* Fixed a bug on mobile devices where once an image is cut, its metadata is lost and can no longer be printed (it appears blank when being printed).

* Fixed a bug where if the Dynamsoft Service is not installed and a `WebTwain` instance is created using the method `CreateDWTObject()` or `CreateDWTObjectEx()`, the connection to the service is not attempted automatically as expected (a page refreshing is required).

* Fixed a bug with the API `Dynamsoft.WebTwainEnv.CustomizableDisplayInfo` so that it now works again.

* Fixed a bug where removed images remain in the viewer.

* Fixed a bug where if you set the `display` attribute of the viewer to `none`, it becomes black.

* Fixed a bug where global keyboard or mouse events registered to the Dynamsoft Viewer were not released correctly.

### Deprecations

* Check out the [Deprecations](/_articles/info/schedule/deprecated.md#162) page for v16.2.

### Changes to ActiveX Edition

* Internet Explorer 8 is no longer supported.
* Fixed a bug where when saving an image as TIFF, the same image gets duplicated in the buffer.

## `16.1.1` (08/13/2020)

### Changed Behaviors

* Whether to load the `WASM` for the Camera module is now optional (used to be mandatory in `16.1` ) and is disabled by default.

* The webcam/camera license is now considered a core license and can be used without a scan license.

## `16.1` (08/04/2020)

### New Features

* Added method `SetProductKeyAsync()` which sets the product key asynchronously. Previously, the property ProductKey was used for both setting and reading the key. The same behavior is kept in 16.1 but the recommendation now is to use the method `SetProductKeyAsync()` to set it and use the property `ProductKey` to read it.

* Added methods `GetSourceNamesAsync()`,      `SelectSourceAsync()`,     `SelectSourceByIndexAsync()`,     `OpenSourceAsync()`,       `CloseSourceAsync()`,     `OpenSourceManagerAsync()`,     `CloseSourceManagerAsync()` , as asynchronous complements to their existing synchronous methods.

* Support showing both 64-bit TWAIN drivers and 32-bit TWAIN drivers at the same time.

> NOTE: This driver type does not work if we call `SelectSource()` synchronously (without callbacks).

* Added APIs under `Addon.Camera` as a complement to the existing APIs under `Addon.Webcam` . These APIs include `getSourceList()` ,      `selectSource()` ,      `getCurrentSource()` ,      `closeSource()` ,      `getResolution()` ,      `setResolution()` ,      `getCurrentResolution()` , `play()` ,      `pause()` ,      `resume()` ,      `stop()` ,      `getStatus()` and `capture()` . Unlike the old APIs under `Addon.Webcam` which are good only on Windows, the new APIs are good on Windows, macOS, Linux as well as iOS & Android.

* Added a property `UseLocalService` to return whether a `WebTwain` instance is running in the Local-Service mode or WASM mode.

* Added built-in video processing feature which enables video streaming, edge detection, perspective adjustment, capturing, etc. Related APIs include `showVideo()`,  `closeVideo()` and two callbacks `video-closed` and `video-error` .

> NOTE: on desktop, this feature requires a webcam/camera addon license.

### Extra Features

* Added a feature to run Dynamsoft Service with the account "Local Service". By default, it is still "Local System". Contact Dynamsoft to learn more.

### Beta Feature

* 16.1 now supports acquiring images from a remote scanner which is connected to a machine which is connected via HTTP. This feature is designed to enable document scanning on mobile devices.

### Better Performance

* Improved the speed to initialize the library under WASM mode by splitting one WebAssembly file into multiple files and loading them in the background.
* Improved memory usage by sharing the same heap among multiple WebAssembly workers.
* Improved image decoding by removing unnecessary image processing operations as well as lowering the memory usage.
* Improved data transferring efficiency by using pointers instead of strings.
* Improved performance by saving compiled WebAssembly code into the working process for later use.

### Changed Behaviors

* This version is backward compatible with version 16.0. This means once you have installed the Dynamsoft Service for version 16.1, an application running version 16.0 also works without the need to install the Service for version 16.0.
* The method `LoadImageEx()` now supports mobile platforms as well.
* Dynamsoft Service directory is now named with its major version in it. For example, `/DynamsoftServicex64/` is now `/DynamsoftServicex64_16/`. Also ActiveX related files are put into a different directory called `/WebTWAINActiveX/` .

### Bug Fixes

* Fixed a bug where images fail to show in the viewer in IE 10.
* Fixed a bug in Chrome where the print UI invoked by the API `Print()` disappears immediately after showing up.
* Fixed a bug with the API `Dynamsoft.WebTwainEnv.Host` which is now effective.
* Fixed a bug with consecutive cropping operations with the API `Crop()`.
* Fixed a bug with `WebTwain` instances created by the API `Dynamsoft.WebTwainEnv.CreateDWTObjectEx()` so that their UI binding works correctly.

### Deprecations

No deprecation in version 16.1.

### Changes to ActiveX Edition

No changes in version 16.1.

## `16.0` (06/16/2020)

### Features to the Core Module

* Added a new mobile edition that enables document capturing via mobile cameras and other document manipulation functionalities. Most of the existing methods and properties are made compliant with this new edition.
* Added WASM based document manipulation functionalities which enable the use of all features of Dynamic Web TWAIN except for document scanning without installing the Dynamsoft Service.
* Added setting `Dynamsoft.WebTwainEnv.UseLocalService` to switch the working mode of the library between Local-Service mode and WASM mode. Only valid on desktop operating systems.
* Replaced the built-in image viewer including the built-in image editor with the Dynamsoft Viewer.
* The creation of a `WebTwain` instance is now independent from the UI. In version 16.0, you can create a `WebTwain` instance in 4 ways
  + Specify a `Container` that has a `ContainerId` and assign it to `Dynamsoft.WebTwainEnv.Containers` . A `ContainerId` is essentially the id of an `HTMLDivElement` element which is required for generating a built-in Dynamsoft Viewer. Then call the method `Dynamsoft.WebTwainEnv.GetWebTwain()` with `ContainerId` as the argument to get the instance.
  + Call the method `Dynamsoft.WebTwainEnv.CreateDWTObject()` to create an instance with built-in Dynamsoft Viewer.
  + Specify a `Container` that has a `WebTwainId` but no `ContainerId` and assign it to `Dynamsoft.WebTwainEnv.Containers` . A `WebTwainId` is just a string to uniquely specify the instance. Then call the new method `Dynamsoft.WebTwainEnv.GetWebTwainEx()` with `WebTwainId` as the argument to get the instance.
  + Call the method `Dynamsoft.WebTwainEnv.CreateDWTObjectEx()` to create an instance without a built-in Dynamsoft Viewer.

> Note
>  
> If a `WebTwain` instance is created without a built-in Dynamsoft Viewer, you can create a Viewer later and bind it to the existing `WebTwain` instance using the new method `BindViewer()` . The Viewer can also be updated or unbound with the new methods `UpdateViewer()` and `UnbindViewer()` .

* Added method `LoadImageFromBinary()` to enable importing data from binary (an object of the type Blob or ArrayBuffer).
* Added methods `getCapabilities()` and `setCapabilities()` which enables fast capability negotiation.
* Added method `EnableSourceUI()` to enable TWAIN configuration without scanning.
* Added method `SelectImages()` to select one or multiple images programmatically. This method replaces the old APIs `SetSelectedImageIndex()` and `SelectedImagesCount` .
* Added property `SelectedImagesIndices` to return the indices of selected images. This property replaces the old API `GetSelectedImageIndex()` .
* Added Viewer-specific APIs: `setViewMode()` ,      `updateUISettings()` ,      `setButtonClass()` ,      `setSelectedImageArea()` ,      `zoomIn()` ,      `zoomOut()` ,      `bindCustomElement()` ,      `showCustomElement()` ,      `hideCustomElement()` ,      `toggleCustomElement()` . These methods should be called like this: `DWTObject.Viewer.zoomIn()` .

### Updated Add-on Features

* Added PDF Rasterizer mobile edition.
* Extended the PDF Rasterizer on desktop to the WASM mode.
* Replaced the old barcode reader add-on with a new add-on which now supports both Local-Service mode and WASM mode of the desktop editions as well as the mobile edition.

### Better Performance

* In favor of the WASM mode, image transferring now uses JPEG more often than PNG. Previously, there was only the Local-Service mode and only PNG was used.
* The following methods are made asynchronous (while still synchronous-compliant):

`ChangeImageSize()` , `ConvertToBW()` , `ConvertToGrayScale()` , `Crop()` , `Erase()` , `FilterImageByTag()` , `Flip()` , `GetSelectedImagesSize()` , `GetSkewAngle()` , `Invert()` , `Mirror()` , `Rotate()` , `RotateEx()` , `RotateLeft()` , `RotateRight()` , `SetDPI()` , `SetImageWidth()`

> NOTE
>  
> These APIs must be called asynchronously in the WASM mode.

### Changed Behaviors

* The methods `HTTPDownload()` and `HTTPDownloadEx()` no longer has the "Content-Type" header in their HTTP Get requests.
* The method `GetSourceNames(true)` now returns more information which includes "DriverType" and "DeviceInfo".

### Deprecations

* Deprecated `SetSelectedImageIndex()`,  `GetSelectedImageIndex()` and `SelectedImagesCount` in favor of the new method `SelectImages()` .
* Deprecated `IfOpenImageWithGDIPlus` in favor of the built-in imaging decoder.
* Deprecated the following APIs in favor of the new methods `getCapabilities()` and `setCapabilities()` :

`CapGet()` , `CapGetHelp()` , `CapGetCurrent()` , `CapGetDefault()` , `CapGetFrameBottom()` , `CapGetFrameLeft()` , `CapGetFrameRight()` , `CapGetFrameTop()` , `CapGetLabel()` , `CapGetLabels()` , `CapSet()` , `CapReset()` , `CapSetFrame()` , `CapIfSupported()` , `GetCapItems()` , `GetCapItemsString()` , `SetCapItems()` , `SetCapItemsString()` , `Capability` , `CapNumItems` , `CapMaxValue` , `CapMinValue` , `CapCurrentValue` , `CapCurrentIndex` , `CapDefaultValue` , `CapDefaultIndex` , `CapType` , `CapValueType` , `CapDescription` , `CapStepSize` , `CapValue` , `CapValueString`

### Changes to ActiveX Edition

* Added method `SelectImages()` .
* Added property `SelectedImagesIndices` .

## `15.3.1` (03/05/2020)

### Improved

* [HTML5] When reinstalling the Dynamsoft service, the service configuration file `DSConfiguration.ini` will now be replaced directly.

### Fixed

* [HTML5] Fixed a bug where the scanner stops responding when you cancel the scan multiple times.
* [HTML5] Fixed a bug where the scanner stops responding when the library tries to retrieve extended information that contains magnetic data.
* [HTML5] Fixed a bug where images can't be selected in batches (CTRL/SHIFT + Click) after swapping the current tag.

## `15.3` (01/07/2020)

### New

* [HTML5] Added a new configuration `extendedImageInfoQueryLevel` for the method `AcquireImage()` that allows setting up how the library queries extended image info items. In version 15.2, the default level would result in scanning failure or serious performance issues with some scanners.
* [HTML5] Added a new method `GetSourceNames(bool bIncludeDetails)` that returns the list of available data sources as a string array. On Windows, when `bIncludeDetails` is set to `true` , this method returns more details about the sources including its protocol versions, manufacturer and whether it's the default/current source, etc.
* [HTML5] Added a new method `SelectAllImages()` that can select all images in buffer or all images that have been filtered by tags.
* [HTML5] Added a new method `ConvertToBW(number imageIndex)` that converts a specific image to Black & White.
* [HTML5] Added a new method `Invert(number imageIndex)` that inverts a specific image.

### Improved

* [HTML5] changing the methods `HTTPUploadThroughPostDirectly()`, `HTTPDownloadDirectly()` to only work on whitelisted images/files (check NOTE below).
* [HTML5] Changing the default SSL certificates is now officially supported.
* [HTML5] Changed the property `LogLevel` so that when it's set to `1\0` , it's equivalent to setting `LogLevel` to `14\1` in the file `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64\DSConfiguration.ini`
* [HTML5] Local caching is made smoother by introducing a new process to do the caching when the threshold is reached. As a result, it is significantly faster when loading a great many files.
* [HTML5 on macOS] When using ICA(Image Capture Architecture) sources, info that was written to system log is now written to `wtss.log` .
* [Upload Module] Now the module can only upload files/images that are whitelisted (check NOTE below)

> Note on how whitelisting is done
>
> Dynamsoft Service keeps a whitelist of all images in buffer as well as images saved by the Service. The whitelist lives on until the current service process is destroyed.
> Each Dynamic Web TWAIN object keeps a whitelist of file paths that are retrieved in the callback `OnGetFilePath` for the method `ShowFileDialog()` .

### Deprecated

[HTML5] Further improved security by deleting the methods `FTPUploadDirectly()` , `FTPDownloadDirectly()` , `FileExists()`. 

### Fixed

[HTML5] Fixed a bug where Dynamsoft Service gets stuck when you try to perform concurrent operations on the same image(s) like uploading and converting them at the same time.
[HTML5] Fixed a bug where Dynamsoft Service crashes when the callback OnBitmapChanged is called recursively.

## `15.2` (09/19/2019)

### New

* [HTML5] Added the capability to add tags to images. The tags can then be used to filter the images. The new APIs are `TagImages()` ,      `ClearImageTags()` ,      `SetDefaultTag()` and `FilterImagesByTag()` .

### Improved

* [HTML5] Tidied up the Dynamsoft Service installer by removing redundant files.
* [HTML5] Unified image decoding capabilities for JPEG and PNG on Windows, macOS and Linux.
* [HTML5] Improved the speed of PDF decoding by loading the file as a whole instead of per page.
* [HTML5 on Windows] Improved Windows buffer management so that its capacity is only limited by the size of disk space on the machine.
* [HTML5 on macOS] Improved macOS installers for better user experience.
* [ActiveX] Aligned PDF rasterizer in ActiveX so that it shares the same feature set with the HTML5 edition.

### Fixed

* [HTML5] Fixed a bug with the API `CreateTextFont()` where the text takes up extra space when it is rotated by 90 degrees.
* [HTML5] Fixed a bug where printing results in unnecessary extra blank pages in Firefox or IE11.
* [HTML5] Fixed a bug where a missing filename parameter results in upload failure.
* [HTML5 on Windows] Fixed a bug where the library attempts to download an incorrect installer when the Barcode Reader add-on is used.
* [HTML5 on Windows] Fixed a bug with the API `GenerateURLForUploadData()` so that it returns an URL that shows the correct SDK version.
* [All] Fixed a bug where 8-bit image data can't be compressed as a JPEG-TIFF.
* [All] Fixed a bug with the event `OnTopImageInTheViewChanged()` where it doesn't get triggered if images are acquired into an empty buffer.

## `15.1` (08/13/2019)

### New

* [macOS] Added 64bit support to macOS.
* [macOS & Linux] Expanded the event `OnPostTransferAsync` from Windows to macOS & Linux. The method serves as the asynchronous counterpart to the existing synchronous event `OnPostTransfer` . Information about the transferred image is returned in the event listener.
* [macOS & Linux] Expanded the method `startScan()` from Windows to macOS & Linux. The method accepts a JSON object that specifies all the scan parameters. This makes it simpler and even faster to initiate a scan job. At the same time, you can specify how you want the scanned data to be processed by adding extra output parameters in the same JSON object.

### Improved

* [Win] Improved the methods `ConvertToBlob()` ,      `ConvertToBase64()` and image loading methods so that they can handle much bigger files.
* [Linux] Improved the image encode/decode functionalities on Linux so that it can encode/decode files just like Windows.
* [macOS & Linux] Expanded PDF related capabilities to macOS and Linux so that all 3 platforms share the same features.
* [macOS & Linux] Improved the PDF decode engine so that it can load more PDF files without invoking the PDF rasterizer.

### Fixed

* [Win] Fixed a bug where some scanners can only scan with document feeder but not the flatbed.

## `15.0` (06/27/2019)

### New

* [HTML5 on Windows] Added a new method `startScan()` which accepts a JSON object that specifies all the scan parameters. This makes it simpler and even faster to initiate a scan job. At the same time, you can specify how you want the scanned data to be processed by adding extra output parameters in the same JSON object.
* [HTML5 on Windows] Added a new event `OnPostTransferAsync` as the asynchronous counterpart to the existing synchronous event `OnPostTransfer` . Information about the transferred image is returned in the event listener.
* [HTML5 on Windows] Added a new PDF core DLL as the default engine for PDF encoding & decoding. This new PDF DLL has added support for JPEG2000 and JBIG2 compression types.
* [HTML5 on Windows] Added a new method `PDF.Write.Setup()` which accepts a JSON object that contains all the parameters needed for creating PDF files.
* [HTML5 on macOS] Added a new file `libDynamicImg.dylib` to the macOS edition which provides functionalities equal to those provided by the file `DynamicImage.dll` on Windows. Essentially, this file offers better image encoding and decoding.
* [HTML5] Added a pair of methods `IndexToImageID()` and `ImageIDToIndex()` which converts the index of an image to its image id or vice versa. The id of an image is an unique number that can be used to specify the image.
* [HTML5] Added a new event `OnIndexChangeDragDropDone` which is triggered when you drag and drop images to resort them in the viewer. The event returns the from and to indices for the operation.

### Improved

* [HTML5] Improved the method `AcquireImage()` by adding two more options `IfGetImageInfo` & `IfGetExtImageInfo` to its parameter `optionalDeviceConfig` which are `true` by default and means extra image info will be returned with each transferred image.
* [HTML5 on Windows] Improved the method `SetFileXferInfo()` so that you can specify a naming pattern for the transferred images when the transfer mode is Disk File.
* [HTML5] Improved the performance of Dynamsoft Service by allowing two time-consuming operations to occur concurrently. The affected methods are `ConvertToBlob()` ,      `ConvertToBase64()` ,      `GenerateURLForUploadedData()` as well as a few HTTP Upload methods.
* [HTML5] Improved service connecting efficiency by removing optional ports and use the same ports no matter it's 64bit service or 32bit. Also, during initialization, JavaScript will attempt to connect to the core scan module directly instead of connecting to the service first.
* [HTML5] Improved the functions `ConvertToBase64()`,     `ConvertToBlob()`,  `GenerateURLForUploadData()` ,      `HTTPUpload()` ,      `HTTPUploadAllThroughPostAsMultiPageTIFF()` ,      `HTTPUploadAllThroughPostAsPDF()` ,      `HTTPUploadThroughPost()` ,      `HTTPUploadThroughPostAsMultiPagePDF()` ,      `HTTPUploadThroughPostAsMultiPageTIFF()` ,      `HTTPUploadThroughPostEx()` so that the current indices of the images which were operated on in these methods are returned in the callback functions. This is due to the fact that the indices might have changed during these time-consuming operations.

### Changed

* [HTML5 on Windows] 64bit service has been made the default option on 64bit machines.

### Fixed

* [HTML5 on Windows] Fixed a bug where it takes too much time to load a network file in RDS-mode Chrome.
* [HTML5 on Windows] Fixed a bug where an unwanted black line may appear as the right edge of saved TIFF files.

## `14.3.1` (01/15/2019)

### New

* [ActiveX] Added method `GetImagePartURL()` to work with the Barcode Reader.
* [HTML5] Added a few global settings which may speed up the initialization process of the SDK. The settings are `IfCheckDCP` ,      `IfCheckDWT` ,      `IfDisableDefaultSettings` and `IsLicensePromptFriendly` .

### Improved

* [HTML5 on Windows] Improved the TIFF compression algorithm when it's set to JPEG so that the resulting file size is significantly reduced.
* [ActiveX & HTML5 on Windows] Included the Webcam and Barcode reader libraries in the service installer for easier distribution.
* [HTML5] Improved the built-in image viewer to be more responsive when navigating through images.

### Changed

* [All Editions] Changed the Hex Code for representing a color from `#BBGGRR` to `#RRGGBB` for all methods that may require a color as one of its parameters.

### Fixed

* [HTML5 on Windows] Fixed a bug where the method `LoadImageFromBase64Binary()` may fail to decode a string.
* [HTML5 on Windows] Fixed a bug where the service may crash during string conversion.
* [File Uploader] Fixed a bug where the upload module may fail to open 4 threads for uploading.

## `14.3` (11/20/2018)

### Improved

* [All Editions] Unified the installation prompt for all editions.

### Fixed

* [HTML5] Fixed a bug where images to print appear shrunken when rotated.
* [HTML5] Fixed a bug where the method `CancelAllUpload()` only cancels one job.
* [HTML5] Fixed a bug where OCR Pro Full license gives out an error message when used on the client-side.

## `14.2` (10/16/2018)

### Improved

* [All Editions] Simplified the installation process of the SDK by putting multiple installers together. From this version on, you can get the Dynamsoft Service, Dynamic Web TWAIN and its PDF Rasterizer addon installed with one installer.
* [HTML5] Improved the method `ConvertToBlob()` so that it can be called multiple times in a row.
* [File Uploader] Added a property `FormField` to allow adding extra fields when uploading.

### Fixed

* [HTML5] Fixed a bug with the file `DynamicSocket.dll` to avoid service crash.

### Changed

* Removed Dynamsoft Camera SDK related files.

## `14.1` (09/06/2018)

### Improved

* [ActiveX] Improved the `SelectSource()` method so that it can also be used asynchronously.
* [File Uploader] Updated the upload module so that the information returned from the server can be accessed in the callback functions of an upload job.
* [File Uploader] Added the version number of the library to the name of the library so that different versions of the library can co-exist.

### Fixed

* [HTML5] Fixed a bug with the event `OnInternetTransferPercentage` which doesn't fire when `IfShowCancelDialogWhenImageTransfer` is set to `false` .
* [HTML5] Fixed a bug with the image editor where it stops responding after you scan or load new images without saving the currently modified image.
* [HTML5] Fixed a bug with the image editor where it no longer adapts to the size change of the browser window after you pressed the scan button in its toolbar.
* [HTML5] Fixed a bug that some files would fail to load when you drag and drop multiple TIFF files to load in Dynamic Web TWAIN.
* [HTML5] Fixed a bug where loading a file from a path that is composed of Unicode characters would fail.
* [HTML5 on Windows] Fixed a bug where the multi-user service doesn't start under the Enhanced Mode.
* [HTML5 on macOS] Fixed a bug on macOS where the built-in Select-Source dialog appears to be too wide.
* [HTML5 on macOS] Fixed a bug on macOS where `Undefined` shows up as available sources.
* [HTML5 on macOS] Fixed a bug on macOS where you can't press Ctrl to select multiple zones on an image. Instead, you need to use the meta Key.

### Changed

* [File Uploader] Changed `GenerateURLForUploadData()` to be an asynchronous method.
* [File Uploader] Changed the module so that the encrypted files which are in the cache waiting to be uploaded will be cleared when the upload fails or when it is cancelled

## `14.0` (07/17/2018)

### New

* [HTML5 on Windows] Added a new upload module to handle upload jobs which can carry out upload jobs behind the scene even after the browser is closed.
* [HTML5 on Windows] Added a new API `GenerateURLForUploadData()` to generate a URL which will be used by the upload module to fetch the file/data to upload.
* [HTML5 on Windows] Added a 64-bit service, 64-bit scan module, and 64-bit PDF Rasterizer. However, the 32-bit service and modules are still installed by default.
* [HTML5 on Windows] Added Enhanced Mode to the service to optimize the performance for environments like Citrix. When enabled, the service can handle multiple client connections much better.
* [HTML5] Added a JS-based `SelectSource()` dialog to replace the system's default dialog.
* [HTML5] Added a feature to drag and drop one or multiple images in the viewer to rearrange them.
* [HTML5] Added a feature to load images when they are dropped onto the viewer from the local disk. When dropping in-between 2 images in the viewer, the new images will be inserted between them, otherwise, the new images will be appended.
* [HTML5] Added scan, load, and remove features to the image editor.
* [HTML5] Added a configuration `IfCheck64bitServiceFirst` in `dynamsoft.webtwain.config.js` which determines whether the JavaScript library checks the 64-bit Dynamsoft Service first. If 64-bit server is installed, this setting will speed up the initialization of the SDK. The default value is false.
* [HTML5] Added a configuration `IfAddMD5InUploadHeader` in `dynamsoft.webtwain.config.js` which determines whether the header `dwt-md5` is added in HTTP posts. The default value is `false` .
* [HTML5] Added a configuration `IfConfineMaskWithinTheViewer` in `dynamsoft.webtwain.config.js` which determines whether the mask during SDK initialization or time-consuming operations covers the complete page or just the built-in viewer. The default value is `false` .
* [HTML5] Added configurations in `dynamsoft.webtwain.config.js` that enables setting the display language for built-in prompts and image editor, etc. The default language is English.
* [HTML5] Added configurations in `dynamsoft.webtwain.config.js` to show/hide certain buttons on the image editor.

### Improved

* [All Editions] Rearranged the `/Resources/` folder in the installation directory which contains all the JavaScript library files and files for distribution. Removed the deprecated plug-in completely.
* [HTML5 on Windows] Improved the file transfer mode to be able to transfer multiple files in one scan session.
* [HTML5 on Windows] Added Unicode support to make it possible to access files which has special characters from non-English languages in its path or name.
* [HTML5] When the viewer is set to the view mode of 1 * 1 or -1 * -1, users can now select multiple areas on the image by drawing rectangles while pressing the CTRL button. These selected areas can be moved around too.
* [HTML5] Improved the event `OnImageAreaSelected` so that when it's triggered, it will return the 1-based index of the rectangle which represents a selected area on the image. The event is triggered when a new area is selected or a selected area is moved.
* [HTML5] The HTML5 license can now be used to restrict the usage of the SDK in certain browsers.
* [ActiveX] Updated the license verification module to be compatible with that of the HTML5 edition.

### Changed

* [All Editions] Removed intellisense files but still available upon request.
* [HTML5 on Windows] The service is now installed with a `.msi` by default instead of a `.exe` .
* [HTML5 on macOS] Changed the API `ImageCaptureDriverType` which now is set to 4 by default and the only allowed values are 0 (TWAIN), 3 (ICA) and 4 (TWAIN & ICA).
* [HTML5] All the required images in the SDK are hard-coded into JavaScript code.
* [HTML5] The non-production server license will now come with a prompt of license notice.
* [HTML5] Changed the background color for images when they are selected or when the mouse hovers over one of them. This only works when the view mode is n * n. By comparison, in old versions, the background stays white.
* [HTML5] Changed the background color for the image editor.
* [HTML5] Changed the theme of the SDK including the progress bar color, waiting spinner, etc.
* [HTML5] Changed the events `OnMouseClick` ,      `OnMouseDoubleClick` and `OnMouseRightClick` to be triggered when the mouse is up. In old versions, they were triggered when the mouse is down.

## `13.4.1` (04/16/2018)

### New

* [All Editions] Dynamic Web TWAIN is officially published to NPM.

### Improved

* [HTML5 on Windows & Linux] Optimized the scanner module for better compatibility with certain scanner models.
* [All Editions] Improved the JS library so that it works better with Angular 5.

## `13.4` (03/12/2018)

### Improved

* [HTML5] Optimized the installation process so that users who are not able to download Dynamic Web TWAIN module as a ZIP can now download it as an MSI file to install.

### Changed

* Updated the SDK installer to make it possible to download and install other Dynamsoft SDKs together with Dynamic Web TWAIN during the installation process.

### Fixed

[HTML5] Fixed a bug where you see the progress bar displayed on the page for no reason when you use Dynamic Web TWAIN with other libraries or frameworks like the popular BootStrap.

## `13.3` (01/16/2018)

### Improved

* [Add-on] Replaced the PDF Rasterizer add-on with a new technology which made it possible to use the rasterizer on macOS as well as Linux besides Windows.
* [HTML5] Optimized the memory usage by Dynamsoft Service and the JavaScript library so that users can scan and process even more pages.
* [HTML5] Optimized the scan module on Linux for better user experience.
* [HTML5] Updated the `HTTPUpload***` methods so that they can be used in a for-loop.
* [HTML5] Updated the installer of Dynamsoft Service so that Firefox no longer needs to be restarted twice.
* [HTML5] Added a new button for the "Erase" feature on the built-in image editor.
* [HTML5] Improved the method `OverlayRectangle()` so that the overlays will move with the image.
* [HTML5] Improved the method `OverlayRectangle()` so that the image is moved automatically to make sure the newly added overlay is placed in the center of the viewer. This only works when the image is larger than the viewer.
* [HTML5] Added a "readme" file in the `/Resources/` folder to explain what each file is for in that folder.

### Changed

* [HTML5] Changed the installing process especially for users who need to use the SDK in a domain network.
* [ActiveX] Changed the default value for `IfAllowLocalCache` to `true` .

### Fixed

* [All Editions] Fixed a bug where the uploaded PDF files might be corrupted if the upload was interrupted during the process due to insufficient physical memory.
* [HTML5] Fixed a bug where an error is thrown even after a TIFF file is loaded successfully.
* [ActiveX] Fixed a bug where a very big PDF file might fail to be loaded.
* [ActiveX] Fixed a bug where IE might crash when saving scanned images to a multi-page PDF or TIFF.

## `13.2` (11/01/2017)

* [HTML5] Fixed a memory leak where the scanning service didn't release memory after transferring image data to web browsers. Note: this bug started in version 13.0.
* [HTML5] Fixed a bug where sometimes the web twain service didn't get shut down properly
* [ActiveX] Fixed a bug where a base64 string ended with "==" could not be decoded by using the `SetCustomDSDataEx()` method
* [ActiveX] Fixed a bug where the `Dynamsoft.WebTwainEnv.Load()` method didn't work after calling the `Dynamsoft.WebTwainEnv.Unload()` method
* [ActiveX] Fixed a bug where the `TransferMode` property didn't work properly

## `13.1` (08/22/2017)

### New

* [HTML5 Only] Added the `ConvertToBlob()` API to return the Blob of specified indices in the designated file type.

### Improved

* [HTML5 Only] Improved the `SetHTTPFormField()` API to be able to set Blobs in HTTP Forms aside from strings.
* [HTML5 Only] Improved the `HTTPUpload()` API to be able to upload binary data set by `SetHTTPFormField()` .
* [HTML5 Only] Improved the `SetHTTPHeader()` API to support `HTTPDownload()` and `HTTPDownloadEx()` methods as well.
* [HTML5 Only] Added prefix to all names used in CSS to avoid possible conflict.
* [HTML5 Only] Much improved performance for the communication between browsers and the service.

### Fixed

* Fixed a bug where you can't initialize the SDK with the method `Dynamsoft.WebTwainEnv.Load()` on the page without first `Dynamsoft.WebTwainEnv.Unload()` it.
* Fixed a bug where the `HTTPUpload()` API doesn't work if it's done asynchronously in a loop.
* Fixed a bug where you get an error when setting the size of the viewer by percentage.

### NOTICE

* The ActiveX edition stays unchanged for this upgrade.

## `13.0` (06/20/2017)

### Improved

* [HTML5 Only] Replaced Dynamic Web TWAIN service with the unified Dynamsoft Service.
* [HTML5 Only] Replaced the barcode add-on and the webcam add-on with Dynamsoft Barcode Reader SDK and Dynamsoft Camera SDK.
* [HTML5 Only] Authorization prompts now support multiple languages.
* [HTML5 Only] The method `LoadImageFromBase64Binary()` can now be called asynchronously.
* [HTML5 Only] Much improved performance for the communication between browsers and the service.

### Changed

* [HTML5 Only] Changed the default behavior of the authorization prompts to "always hide".

### Fixed

* Fixed a bug where cropping an image doesn't use the new coordinates when the image has been scrolled.
* Fixed a bug where you see an unnecessary error 'TypeMismatchError' when loading a multi-page TIFF/PDF.

###　NOTICE

* The ActiveX edition stays unchanged for this upgrade.

## `12.3.1` (04/14/2017)

* [HTML5 Only] Updated the certificates used by Dynamic Web TWAIN service to handle the incompatibility in IE 10/11 on Windows 7/8/8.1.

## `12.3` (04/06/2017)

* [HTML5 Only] Updated the certificates used by Dynamic Web TWAIN service to handle the updates introduced in Chrome 58+.
* [HTML5 Only] Updated the key exchange as well as the cipher in Dynamic Web TWAIN service for secure connections.

## `12.2` (01/10/2017)

### Improved

* [HTML5 Only] Improved the SSL certificate by updating the signature algorithm to SHA256
* [HTML5 Only] Improved the Web TWAIN service to handle the new certificate

### Fixed

* Fixed a bug where scanning might fail if the user doesn't register the event `OnPostTransfer`
* Fixed a bug where `Dynamsoft.WebTwainEnv.CreateDWTObject()` still tries to connect to non-SSL ports even when the page is running in HTTPS

## `12.1` (11/03/2016)

### New

* Added the Linux Edition to support Firefox and Chrome on 64bit Linux OS.
* [HTML5 Only] Added a new method `SetUploadSegment()` which can be used to set the threshold for segmented upload as well as size of each segment.

### Improved

* [HTML5 Only] Improved the method `Dynamsoft.WebTwainEnv.CreateDWTObject()` to allow listening on multiple IPs.
* [HTML5 Only] Improved the OCR pro license to allow using multiple licenses.
* Improved how the SDK works in Edge. Now you can run local pages directly in Edge.

### Fixed

* Fixed a bug where `CurrentImageIndexInBuffer` and `HowManyImagesInBuffer` return wrong values in the callback for the event `OnPostLoad` .
* Fixed errors with license error messages.
* Fixed a bug where an image disappears when you try to get information like resolution or size of the image in the callback for the `OnPostTransfer` event.
* Fixed a bug where the 'decoding tiff' dialogue appears when converting PDF files to images.

## `12.0` (09/22/2016)

### New

* [HTML5 Only] Added a new method `HTTPUpload()` which supports uploading files as binary as well as base64 string. The method also supports segmented upload when handling big files.
* [HTML5 Only] Added a new method `ConvertToBase64()` which supports converting one or more images to a base64 string.
* [HTML5 Only] Added a new method `SetHTTPHeader()` which supports adding a header to an HTTP Upload Post request.
* [HTML5 Only] Added a new method `GetImageURL()` which returns the direct URL of an image based on its index in the buffer.
* Added a new property `IfAutoScroll` which when set to false will stop the automatic scrolling of the viewer when scanning or loading images.
* [HTML5 Only] Added a new security feature called Dynamsoft Authentication which requires more user interaction when dealing with local files or devices.
* Added MSI installers for both ActiveX and HTML5 editions.

### Improved

* Improved the method `ChangeImageSize()` by adding a new mechanism for the new option "Best Quality".
* Improved the way license verification is done and optimized the error messages for license issues.
* Improved the way a `WebTwain` instance is created by adding global methods like `Dynamsoft.WebTwainEnv.CreateDWTObject()` and `Dynamsoft.WebTwainEnv.DeleteDWTObject()` .
* Improved the image editor's zooming feature by allowing it to zoom centered by the position of the mouse.
* Improved the way uploading is done by adding a MD5 to every upload Post request.

### Fixed

* Fixed a bug where `MagData` doesn't work during scanning.
* Fixed a bug with the Mac edition where TIFF files are loaded with inverted colors.
* Fixed a bug where the event `OnPostLoad` gets triggered twice when loading a file.
* Fixed a bug with the ActiveX where selecting an image area returns the wrong coordinates when the image is bigger than the viewer (scroll bars are shown).
* Fixed a bug where `CurrentImageIndexInBuffer` and `HowManyImagesInBuffer` are not updated correctly when the method `LoadImagesFromBase64Binary()` is used.

## `11.3.2` (07/05/2016)

### New

* Added the feature to automatically create a dump file for debugging purposes when the scanning service crashes
* Added official support for OCR Professional

### Improved

* Optimized the scanning performance by reducing unnecessary web socket messages
* Optimized the compatibility of the accompanying JS files so that they can work with different versions of scanning services
* Added an internal mechanism in the accompanying JS files to support Angular2
* Optimized Mac scanning process to make it possible to switch from TWAIN protocol to ICA protocol

## `11.3` (03/01/2016)

### New

* Added `IsTextBasedPDF()` API to the PDF rasterizer to determine whether a PDF is text-based.
* Added support for reading binary barcode and returning the result as a base64 string.

### Improved

* Updated barcode reader library to v4.1.0.112 which uses improved positioning algorithm that can better identify and locate DataMatrix barcodes.
* Improved the event `OnPostLoad` so that it gets triggered for the methods `HTTPDownload(Ex)` ,      `FTPDownload(Ex)` as well as `LoadImageFromBase64Binary()` .
* [HTML5 edition only] Improved the API `AcquireImage()` . Now you can set two callback functions to this method to check its status.

### Fixed

* Fixed bugs related to asynchronous APIs such as the bug where the image index is not updated properly for the first and second images.
* Fixed a bug where the error message for cancelling the "Open File Dialog" says "fail to open file dialog box". Now it correctly says that "User cancelled the operation".
* [HTML5 edition only] Fixed a bug in printing where no matter how you set up, you can only get one copy.
* [HTML5 edition only] Fixed a bug where the event `OnSourceUIClose` never gets triggered.
* Fixed a few small bugs with the API documentation and Samples within the product installer.
* The API `CloseSource()` used to be called automatically after a scanning job is done in v11.2 and a few earlier versions. This has caused issues for a few customers. In this version, this API is no longer called automatically.
* We have improved the SDK so that it can also work seamlessly with our OCR add-on.

## `11.2` (11/24/2015)

### New

* Added PDF Rasterizer Add-on to convert text PDF files to images. This way, text PDF files can be successfully displayed in the viewer.
* Added DataMatrix Reader add-on to read data matrix code from an image.
* Added PDF 417 reader add-on to read PDF 417 code from an image.
* Added `CloseWorkingProcess()` method to close the current HTML5 scanning process.

### Improved

* Improved `Print()` method to support printing images via Windows' native print program.
* Improved the upload mechanism to indicate a successful upload if the returned string from server side only contains invisible characters.
* Improved the performance of scanning by optimizing the scanning process.

### Fixed

* Fixed a bug where scanner source can't be displayed when multiple scanning pages are opened in a browser on Mac.
* Fixed a bug where the HTML/JS samples in the product installation folder failed to run locally in Edge browser unless the demos are deployed to an HTTP Server.
* Fixed a bug where the return value is incorrect when users click on Cancel button in the Select Source dialog.
* Fixed a bug where OnPostLoad event is not triggered when loading a local image via its full file path.
* Fixed a bug where scanning log is enabled by default. It could affect the performance of HTML5 scanning.

## `11.1` (09/08/2015)

* [HTML5 Edition] Added support for Microsoft Edge browser.
* [Windows Edition] Added QR Code Reader Add-on.
* [Mac Edition] Added Webcam Addon.
* [Mac Edition] Added 1D Barcode Reader Add-on.
* [Mac Edition] Added QR Code Reader Add-on.

## `11.0` (07/23/2015)

### New

* [Mac Edition] Added HTML5 support for Safari v7+, Chrome v27+ and Firefox v27+ on Mac OS X 10.6 or later.
* [HTML5 Edition] Added HTML5 support for Internet Explorer 10 and 11.
* Added `SetOpenSourceTimeout()` method to check `ErrorString` property when `SelectSource()` method fails after a specified number of milliseconds. This prevents the scan page from being unresponsive when the selected device is not connected.
* [Webcam Add-on] Added `SetVideoRotateMode()` method to rotate the video preview stream.
* [HTML5 Edition] Added `OnWebTwainPreExecuteCallback` ,      `OnWebTwainPostExecuteCallback` events and `ShowCustomMask()` ,      `HideCustomMask()` methods in `dynamsoft.webtwain.install.js` to display or hide the Dynamsoft's progress overlay during scanning.

### Improved

* [Barcode Add-on] Improved 1D Barcode Reader Add-on to support reading CodeBar, Code_93, EAN_8, EAN_13, ITF, UPC_A, UPC_E.
* [HTML5 Edition] Improved performance of built-in image viewer when viewing images in 1 * 1 view mode.
* [HTML5 Edition] The method Print now supports printing multiple pages.
* Improved security by limiting the access of Dynamsoft Scanning Service to registered domain(s) or IP(s) for a particular website.

### Fixed

* [HTML5 Edition] Fixed a bug where users are continuously prompt to install Dynamic Web TWAIN on Firefox when accessing a secure website on a different Windows user account.
* [ActiveX Edition] Fixed a bug where the system's save-file dialog does not appear when saving images in IE11 on Windows 8.1.
* [ActiveX Edition] Fixed a bug where the `DynamicWebTwainCtrl.dll` crashes when `LogLevel` is set to 1 and `HTTPPostResponseString` returns more than 1024 characters.
* [ActiveX Edition] Fixed a bug where the remote file URL gets truncated if it is too long when uploading or downloading.
* Fixed a bug where the method `SetHTTPFormField()` does not work as expected.
* [HTML5 Edition] Fixed a bug where 'Upload Error' is returned when image uploading is cancelled.
* Fixed a bug where the method `SetTiffCustomTag()` does not work.
* [All Editions for Windows] Fixed a bug where the method `CapIfSupported()` does not return support level of specified capability.

## `10.2` (03/24/2015)

### New

* [All Editions for Windows] Added Webcam Add-on to support image capturing from Webcams using Microsoft DirectShow API. The related APIs are:
  + `Addon.Webcam.CaptureImage()`
  + `Addon.Webcam.CloseSource()`
  + `Addon.Webcam.Download()`
  + `Addon.Webcam.GetCameraControlMoreSetting()`
  + `Addon.Webcam.GetCameraControlSetting()`
  + `Addon.Webcam.GetFrameRate()`
  + `Addon.Webcam.GetMediaType()`
  + `Addon.Webcam.GetResolution()`
  + `Addon.Webcam.GetSourceList()`
  + `Addon.Webcam.GetVideoPropertyMoreSetting()`
  + `Addon.Webcam.GetVideoPropertySetting()`
  + `Addon.Webcam.SelectSource()`
  + `Addon.Webcam.SetCameraControlPropertySetting()`
  + `Addon.Webcam.SetFrameRate()`
  + `Addon.Webcam.SetMediaType()`
  + `Addon.Webcam.SetResolution()`
  + `Addon.Webcam.SetVideoPropertySetting()`
* [HTML5 Edition] Added the view mode n*-1 to allow horizontal thumbnails.
* [HTML5 Edition] Added the property `ShowPageNumber` to allow hiding or showing of the number labels at the top-left corner of the images in the viewer.

### Improved

* [HTML5 Edition] Greatly improved the performance of the built-in image viewer and editor by rewriting it.
* [HTML5 Edition] Reduced CPU/Memory consumption when handling very big images.
* Improved the property `Height` and `Width` to allow the use of percentages
* [HTML5 Edition] Improved performance when navigating through images quickly using the built-in image editor
* [HTML5 Edition] Improved security by limiting the web server to listen to 'localhost' only.
* Improved IntelliSense by separating the original document into different modules.
* Improved error message management by separating the add-on related messages.
* Improved the property `MaxUploadImageSize` by providing a clear error message.
* [HTML5 Edition] Methods which returns a Boolean value now returns `true` or `false` instead of `1` , or `0` .
* Separated the old Plug-in edition from the HTML5 edition for easier deployment and better performance. The previous Chrome&Firefox Edition is now divided into 2 editions: Plugin Edition and HTML5 Edition.
* `IfShowFileDialog` and `IfDisableSourceAfterAcquire` are set to `true` by default in the JS Client.

### Fixed

* Fixed the bug in the Barcode Reader add-on where barcode location fails for 200 DPI.
* [HTML5 Edition] Fixed the bug where the event `OnImageAreaSelected` is triggered when the mouse enters or leaves the image editor.
* [HTML5 Edition] Fixed the bug where the event `OnImageAreaSelected` is triggered multiple times when selecting the area in the image editor.
* [HTML5 Edition] Fixed the bug where the initialization of the SDK fails if `Dynamsoft.WebTwainEnv.Load()` is called more than once.
* [HTML5 Edition] Fixed the bug where the SDK sends unnecessary WebSocket requests when loading images.
* Fixed the bug with the method `ChangeBitDepth()` where the processed image appears to be covered in a grey mask.
* Fixed the bug with the method `ConvertToGrayScale()` where calling this method on a 1-bit image turns it black.
* Fixed the bug with the methods `SaveAsTIFF()` and `SaveAsPDF()` where the progress bar doesn't show.
* Fixed the bug with image uploading when 'successful' is returned when it's actually cancelled.
* Fixed a few unclear or wrong error messages.

## `10.1.1` (12/23/2014)

### New

* Added `Dynamsoft.WebTwainEnv.AutoLoad` property to enable or disable automatic loading of Dynamic Web TWAIN.
* Added dynamic loading and unloading methods `Dynamsoft.WebTwainEnv.Load()` and `Dynamsoft.WebTwainEnv.Unload()` .

### Improved

* Improved the initiation process for Dynamic Web TWAIN so that you don't need to worry about the order of `dynamsoft.webtwain.initiate.js` and `dynamsoft.webtwain.config.js` .

### Fixed

* Fixed a bug where the event `OnImageAreaSelected` gets fired multiple times when you draw a rectangle on the image.

## `10.1` (12/16/2014)

Dynamsoft's Dynamic Web TWAIN V10.1 SDK Upgrades Include JavaScript IntelliSense, 1D Barcoding.

### New

* Added 1D Barcode Reader Add-on to support reading Code39 and Code128.
* Added JavaScript IntelliSense to help you write code faster and with fewer errors. You can use IntelliSense in Visual Studio 2010 or above and Eclipse 4.2 or above.
* Added `BufferMemoryLimit` property to set how much physical memory is allowed for storing images. Once the limit is reached, images will be cached on the hard disk. Cached image data will be automatically deleted when the scan page is closed.
* Added enumerated constants to make your code more readable.

### Improved

* Greatly improved user experience by providing well-arranged API document and simplifying all sample code.
* Dynamic Web TWAIN v10.1 now supports Internet Explorer (IE) 6 and 7. In v10.0 and v10.0.1, IE 6 and 7 were not supported.
* The improvements below are specifically for Chrome&Firefox Edition - which uses HTML5 WebSocket.
  + Optimized memory usage to handle more scanned images, 
  + Added support for cropping an image when the image viewer is set to 1 x 1 view mode, 
  + Improved page size setting of the `Print()` method, 
  + Supported `SetSelectedImageArea()` method and `OverlayRectangle()` method.

### Fixed

* Fixed a bug where the property `TIFFCompressionType` does not work properly.
* Fixed a bug where clipboard related APIs did not work in the HTML5 version.
* Fixed a bug where uploading images in a loop did not work in the HTML5 version.

## `10.0.1` (10/16/2014)

Dynamsoft's Dynamic Web TWAIN V10.0.1 SDK introduced improvements to the Chrome & Firefox Edition. The ActiveX and Mac Editions remained the same (these components remain as v10.0).

### New

* Enhanced robustness of WebSocket connection: The new version will automatically try re-building the connection in case it is inadvertently closed due to network problems.
* Better support for Chrome 38, such as downloading large files using the `HttpDownload()` method.

### Improved

* When a user visits the scan page for the first time the new version takes 1~2 seconds to detect whether the client-side browser has Dynamic Web TWAIN installed. With v10.0, it took around 7 seconds before the installation prompt.
* With the file updated to `dynamsoft.webtwain.config.js` you can freely move the Resources folder to any directory you like.
* More detailed log files.

### Fixed

In v10.0.1 there is no limit to the size of an Http Request. In v10.0, the WebSocket connection could have failed to be built if the size of Http Header exceeds 1kB, which led to a recurring prompt for installation.

* Fixed a bug where the browser crashed if the WebSocket was closed during the upload process.
* Fixed a bug where a time-out error might occur during uploading of a big file.
* Fixed a bug where the property settings on `TIFFCompressionType` does not work.
* Fixed the bug where the method `FTPDownloadDirectly()` does not work.
* Fixed the bug where the method `FTPUploadDirectly()` does not work using "\\" in path parameters.
* The responses from the server after upload are now wholly put into the property `HTTPPostResponseString` . With previous versions, the responses would be trimmed if longer than 1024 KB.

## `10.0` (09/16/2014) - Based on 10.0 Preview

### New

* Added HTML5 Image Viewer to the Chrome&Firefox Edition.
* Added progress bar when loading, saving, uploading & downloading multiple images.

### Improved

* Faster and more stable image acquisition.
* Improved samples in the installer.

### Fixed

* Fixed the bug where image acquisition service sometimes stops during multiple operations.
* Fixed the bug where `HTTPDownloadDirectly()` fail to download files.
* Fixed the bug where some scanning settings don't work for some models of Neat scanners.

## `10.0 Preview` (08/21/2014)

* New HTML5 WebSocket SDK to enable TWAIN scanning in Chrome and Firefox 27+ on Windows.
* Added Disk Caching mechanism. This feature enables high volume document scanning which was limited by the physical memory size.
* Added JPEG compression type to TIFF encoding/decoding. You can reduce the size of TIFF files significantly by using the JPEG compression.
* Much improved image editing features like `ChangeBitDepth()` ,      `GrayScale()` , etc.

## `9.3 Preview` (06/10/2014)

* New HTML5 WebSocket SDK to enable TWAIN scanning in post-NPAPI Chrome. The new SDK will be added to the Plugin Edition of Dynamic Web TWAIN.

## `9.2` (01/02/2014)

* Fully support Internet Explorer 11.
* Added `RegisterEvent()` method and `UnregisterEvent()` method for using Dynamic Web TWAIN events in IE 11 and other web browsers(e.g. Chrome, Firefox, Safari and Opera).

## `9.1` (08/27/2013)

* Added native scanning support for Mac Edition.
* The new property - `ImageCaptureDriverType` - allows Mac users to directly acquire images via native scan(without installing a TWAIN driver).
* Improved IE users' experience when using a separate process(i.e. `BrokerProcessType` = 1) for document scanning. In v9.0, IE users might need to manually allow the broker process to run. It is now automated with the enhanced security of the ActiveX edition.
* Fixed bug where `OnPostTransfer` event is not triggered in some cases.

## `9.0` (03/26/2013)

* Simplified installation and deployment process.
* For developers: no need to generate a LPK file to verify the license. The `ProductKey` property is available to set a series of alphanumeric code for license verification at runtime. Developers only need to generate a product key with Licensing Manager which is installed with Dynamic Web TWAIN.
* For end users: no need to install/enable Microsoft Licensed Class Manager. It would be much easier for end users to activate the control.
* Added a new feature to acquire images in an independent process which greatly improves the robustness of the application.
* Added `MaxInternetTransferThreads` property to set the maximum number of threads for uploading /downloading files through POST. This can dramatically improve the performance.
* Added `FileExists()` method to check if a certain file exists on the local disk.
* Added `GetSkewAngle()` / `GetSkewAngleEx()` (Mac edition not supported) property to get the skew angle of an image by its index in buffer.

## `8.0.1` (09/04/2012)

* New Events and Improvements:
  + `OnSourceUIClose()` : triggered when the user interface of source is closed.
  + `OnBitmapChanged()` : triggered when the bitmap of image buffer is changed, such as new image scanned, image deleted or image edited etc.
* Improved `LoadDibFromClipboard()` method. You can now load images in clipboard of Windows Vista or above into Dynamic Web TWAIN.
* Improved the performance of the `IsBlankImage()` and `IsBlankImageEx()` methods for detecting blank images.
* Fixed bug where the original DPI (dots per inch) got lost when saving images using the 64-bit ActiveX Edition.

## `8.0` (07/17/2012)

* Added new add-on: Barcode(1D) - supports 1D barcode recognition.
* Added new add-on: Barcode(2D) - supports 2D barcode recognition.
* Added new add-on: OCR(Optical Character Recognition) - performs OCR on documents in different languages and converts them to searchable text and PDFs.
* Added `GetImageXResolution()` and `GetImageYResolution()` methods to get the resolution from the scanned image(s).
* Added `SetDPI()` method to Change the DPI(dots per inch) for the specified image.
* Added `ShowFileDialog()` method and `OnGetFilePath` event to show the "save file dialog"/"open file dialog" and get the path.
* Added `AllowPluginAuthentication` property to allow the plugin to send authentication requests.
* Added `BlankImageCurrentStdDev` property to return the current standard deviation of the pixels in the image.
* Added `MagData` and `MagType` properties to read magnetic data from scanners.

## `7.0` (03/06/2012)

* Improved the image decoder for ActiveX x86 edition. Dynamic Web TWAIN will use GDI+ to decode the image if gdiplus.dll is available in the operating system.
* Added the support for simple annotation. Now you can add a text on the image.
* Added `FTPUploadDirectly()`,  `HTTPUploadThroughPostDirectly()` and `HTTPUploadThroughPutDirectly()` methods to upload all types of local files without encoding/decoding.
* Added `HTTPDownloadDirectly()` and `FTPDownloadDirectly()` methods to download files to local without encoding/decoding.
* Improved the performance of image rotate method.
* Standardized the naming convention for the properties and methods in ActiveX edition.
* Modified the default value of `MaxImagesInBuffer` to 64.
* Added `GetDeviceType()` method to determine the type of the image acquisition device.
* Added `PDFVersion` property to read/write the PDF version.
* Added `IfScanInNewThread` property to allow Dynamic Web TWAIN to communicate with scanner in a separate thread.
* Added `ImageEditorIfModal` property to set whether the image editor runs in modal state.
* Added `CapValueType` property to return or set the type of the `CapValue` .
* Added `IfAutomaticBorderDetection` property to encapsulate the `ICAP_AUTOMATICBORDERDETECTION` capability.
* Added `IfAutomaticDeskew` property to encapsulate the `ICAP_AUTOMATICDESKEW` capability.
* Added `IfAutoDiscardBlankpages` property to encapsulate the `ICAP_AUTODISCARDBLANKPAGES` capability.
* Improved `IfDeviceOnline` property. Now `TW_ENUMERATION` type of the return result is supported.

## `6.4` (11/15/2011)

* Mac Edition added. Compatible with browsers including Safari, Firefox, Chrome and Opera on Mac OS X 10.5 or later.(PPC not supported).
* Mac Edition supports TWAIN Specification 1.9. A TWAIN driver for Mac is required to use a scanner with the plug-in.
* Mac Edition supports loading all PDF, PSD and TGA formats.
* Mac Edition supports loading images with JPEG2000 compression.

## `6.3.1` (09/01/2011)

* Improved the memory management for ActiveX 64-bit Edition.
* Added `LogLevel` property to capture more exceptions.
* Changed the "Thank you for evaluating ..." dialog box to non-modal dialog.(For Plug-in edition only).

## `6.3` (06/14/2011)

* Support both 32-bit and 64-bit TWAIN device drivers(ActiveX Edition only).
* Support both 32-bit and 64-bit Internet Explorer(ActiveX Edition).
* Support Firefox 4.
* Added the `OnPostLoad` event which is triggered after executing `LoadImage()` / `LoadImageEx()` .
* Optimized the `LoadDibFromClipboard()` method.
* Optimized image editor.

## `6.2` (03/15/2011)

* Support TWAIN Specification 2.1.
* Further improved the security:
  + Compatible with Data Execution Prevention(DEP) and Protected Mode.
  + Added Windows Authentication and Basic Authentication support for Plug-in Edition.
  + Allow you to install the ActiveX control to your personal folder.
* Easier and faster image processing:
  + Added `IfShowFileDialog` property to show the browse dialog box when loading and saving images.
  + Optimized the blank page detection. Added `IsBlankImageEx()` method to detect whether a certain area on an image is blank.
* Added `SaveSelectedImagesToBase64Binary()` to save selected images to base64 binary.
* Added `LoadImageFromBase64Binary()` to load images from a base64 byte array.
* Added support for fitting the selected image to the width or height of the window with the property `FitWindowType` .
* Added support for getting general info of a scanned image including image width/height and bit depth with the methods `GetImageBitDepth()` ,      `GetImageWidth()` and `GetImageHeight()` .
* Further improved the print feature with the property `IfShowPrintUI` to set whether to display the user interface of the printer.
* Support more models of Canon scanners.

## `6.1` (08/31/2010)

* Simplified installation process for Chrome, Safari, Opera users.
* Support simple Annotation.
* Support Forms Authentication.
* Support certificate binding.
* Added session/cookie support for Plug-in Edition.
* Added removing selected images.
* `MaxImagesInBuffer` : In both the trial and full versions of Dynamic Web TWAIN, the maximum value you can set to the property has been raised from 1024 to 4096.
* Added methods: `SetCookie()` ,      `BindSSLCert()` ,      `BindSSLCertEx()`,  `OverlayRectangle()` ,      `RemoveAllSelectedImages()` .
* Added properties: `MouseX` ,      `MouseY` .

## `6.0` (05/18/2010)

* Firefox 3.6 supported.
* Chrome, Opera, Safari on Windows supported(Plug-in Edition).
* Added barcode detection.
* Added multiple images selection.
* Added saving images to a byte array.
* Added loading an image from a byte array.
* Added uploading multiple images as a multi-page PDF/TIFF file.
* Support setting board color for selected images.
* Support FTP passive mode.
* Support specifying the field name when uploading through HTTP POST.
* Added rotating the image of a specified index in buffer by a specified angle.
* Added cutting the image data in the specified area to the system clipboard in DIB format.
* Added clearing the specified area of an image and filling the area with a color.
* `MaxImagesInBuffer` : In the trial version of Dynamic Web TWAIN, the maximum value you can set to the property has been raised from 4 to 1024.
* Optimized `HTTPPostResponseString` in Plug-in Edition: You can use `HTTPPostResponseString` property to get much more detailed info returned from the web server.
* Added methods: `CutFrameToClipboard()`,  `Erase()` ,      `FTPUploadSelectedImagesAsMultiPagePDF()` ,      `FTPUploadSelectedImagesAsMultiPageTIFF()` ,      `GetBarcodeInfo()` ,      `GetBarcodeText()` ,      `HTTPUploadSelectedImagesThroughPostAsMultiPagePDF()` ,      `HTTPUploadSelectedImagesThroughPostAsMultiPageTIFF()` ,      `HTTPUploadSelectedImagesThroughPutAsMultiPagePDF()` ,      `HTTPUploadSelectedImagesThroughPutAsMultiPageTIFF()` ,      `LoadImageFromBytes()` ,      `MoveImage()`,     `Print()`,  `Rotate()` ,      `SaveSelectedImagesAsMultiPagePDF()` ,      `SaveSelectedImagesAsMultiPageTIFF()` ,      `SaveSelectedImagesToBytes()`,  `GetSelectedImagesSize()` .
* Added properties: `AllowMultiSelect`,  `BackgroundColor` ,      `BackgroundFillColor` ,      `BarcodeCount` ,      `HttpFieldNameOfUploadedImage` ,      `IfPASVMode` ,      `SelectedImageIndex`,     `SelectedImagesCount`,  `SelectionImageBorderColor` ,      `VScrollBar` .
* Added event: `OnInternetTransferPercentageEx`

## `5.2` (07/14/2009)

* Added Windows authentication support(ActiveX edition only).
* Fixed session bug.
* Improved TIFF and PDF support.
* Added blank page detection.
* Added zoom in/zoom out features.
* Added a new feature in `ShowImageEditor()` : If the `IfFitWindow` property is set to `true` , the image will fit the size of window when the Image Editor prompts; otherwise the image will be displayed in its full size.
* Added method: `IsBlankImage()` .
* Added properties: `BlankImageMaxStdDev` ,      `BlankImageThreshold` ,      `Zoom` ,      `EnableInteractiveZoom` .
* Added capability: `ICAP_EXTIMAGEINFO` .

## `5.1.1` (09/09/2008)

* Optimized distribution of Dynamic Web TWAIN Plug-in Edition for Firefox 3. You can now install Dynamic Web TWAIN automatically in Firefox 3.
* Fixed issue that the action page is called twice when uploading image data by using HTTP POST method.
* The specified image displayed when this image is set as the current image by using the `CurrentImageIndexInBuffer` property.

## `5.1` (05/27/2008)

* Cookie session integration support added(ActiveX edition only).
* Insert and switch features added. You can now insert new scanned images before the current image and switch the positions of two images in buffer.
* More user interaction features added. One more view mode(-1 by -1) is added and scroll bars will be shown if necessary. Also, you can now drag the image to adjust its position in the control or select an area on the control directly.
* More mouse events added. Events will be fired when you double click the mouse, right click the mouse, select an area on the control and so on.
* New feature added in `SetViewMode()` : when the view mode is set to -1 by -1, Dynamic Web TWAIN only shows the current image. No scroll bar is provided to navigate to other images.
* New feature added in `IfFitWindow` : when the value of this property is `false` , the image will be displayed in its full size and scroll bars will be shown if necessary(the width or height of the image is bigger than the control size).
* New feature added in `MouseShape` : when the value of this property is set to `true` , the cursor is set as a hand. If the width or height of the image is bigger than the control size, scroll bars will be shown and you can drag the image to adjust its position in the control. When the value of the property is set to `false` , the cursor is set as an arrow. You can select an area on the control directly.
* Added methods: `GetImageSizeWithSpecifiedType()` ,      `SwitchImage()` .
* Added property: `IfAppendImage` .
* Added events: `OnMouseDoubleClick`,     `OnMouseRightClick`,  `OnImageAreaSelected` ,      `OnImageAreaDeSelected` ,      `OnTopImageInTheViewChanged` .

## `5.0.1` (12/04/2007)

* Optimized PDF encoder and decoder.
* Detail error message returned when uploading images through POST method fails.
* Fixed bugs.

## `5.0` (10/19/2007)

* PDF and multi-page PDF support added. You can now save the scanned document to local disk or upload to web server in PDF format.
* HTML form manipulation support added. You can now add fields to the HTML form to have additional information for web server before uploading the scanned images to the web server.
* Image preview mode added. You can view the scanned images in the preview mode, like 1 by 2, 2 by 2. This feature helps you have better overview of your images when you have multi-page document.
* Image upload progress bar and cancel option added. You can use the built-in progress bar or your own progress bar for the upload. Cancel option is also provided.
* Download from HTTP stream support added. You do not need to create temp files at server side for download.
* More user interaction features added. Several mouse events are added.
* Added methods: `SetViewMode()` ,      `GetViewMode()`,  `SaveAsPDF()` ,      `SaveAllAsPDF()` ,      `FTPUploadAllAsPDF()` ,      `HTTPUploadAllThroughPostAsPDF()` ,      `HTTPUploadAllThroughPutAsPDF()`,  `LoadImageEx()` ,      `FTPDownloadEx()` ,      `FTPUploadEx()`,  `HTTPDownloadEx()` ,      `HTTPUploadThroughPostEx()` ,      `HTTPUploadThroughPutEx()`,  `SetHTTPFormField()` ,      `ClearAllHTTPFormFiled()` .
* Added properties: `ImageMargin`,  `MouseShape` ,      `PDFCompressionType` ,      `PDFAuthor` ,      `PDFCreationDate` ,      `PDFCreator` ,      `PDFKeywords` ,      `PDFModifiedDate` ,      `PDFProducer` ,      `PDFSubject` ,      `PDFTitle`,  `IfShowCancelDialogWhenImageTransfer` .
* Added events: `OnMouseClick` ,      `OnMouseMove`,  `OnInternetTransferPercentage` .

## `4.2.1` (04/28/2006)

* Fixed bug where uploading or downloading images via SSL connection fails sometimes.
* `IfSSL` property added.

## `4.2` (11/02/2005)

* Dynamic Web TWAIN ActiveX is digitally signed by VeriSign.

## `4.1` (09/08/2005)

* Image Editor added which can be used for image editing and viewing. Supports basic image editing features including Rotate, Crop, Mirror, Flip and ChangeImageSize.
* Related methods: `RotateLeft()`,     `RotateRight()`,     `Mirror()`,  `Crop()` ,      `CropToClipboard()` ,      `GetImageSize()` ,      `ChangeImageSize()`,  `ShowImageEditor()` .
* Related properties: `ImageEditorWindowTitle` ,      `ImageEditorIfReadonly` ,      `ImageEditorIfEnableEnumerator` .
* Other methods added: `LoadDibFromClipboard()` ,      `GetDefaultImageLayout()` ,      `GetImageLayout()` ,      `ResetImageLayout()` ,      `SetImageLayout()` .

## `4.0` (05/31/2005)

* Plug-In Edition added. Compatible with Netscape, Mozilla, FireFox and other Gecko-based browsers.
* PNG supported.
* RLE, G3, G4, LZW, PackBits TIFF compression supported.
* Local multi-image buffer added: you can view and manage multiple acquired images locally before uploading them to web server.
* Multi-page TIFF upload/download supported.
* Added methods: `SaveAllAsMultiPageTIFF()` ,      `SaveAsPNG()` ,      `RemoveAllImages()` ,      `RemoveImage(),`  `FTPUpload()` ,      `FTPDownload()` ,      `HTTPUploadThroughPost()` ,      `HTTPUploadThroughPut()`,  `HTTPDownload()` ,      `FTPUploadAllAsMultiPageTIFF()` ,      `HTTPUploadAllThroughPostAsMultiPageTIFF()` ,      `HTTPUploadAllThroughPutAsMultiPageTIFF()`
* Added properties: `MaxImagesInBuffer`,     `HowManyImagesInBuffer`,     `CurrentImageIndexInBuffer`,     `TIFFCompressionType`,  `IfFitWindow` .
* `SaveAsBMP()` ,      `SaveAsJPEG()` and `SaveAsTIFF()` methods modified. They now save images of specified indexes in buffer.
* `CopyToClipboard()` method modified. It copies the image of a specified index in buffer.
* `CutToClipboard()` method modified. It cuts the image of a specified index in buffer.
* The behavior of `hDib` property changed. It returns the Handle of the DIB of a specified index in buffer.
* The behavior of `Picture` property changed. It returns the `Picture` object of the image of a specified index in buffer.
* `FTPUploadAsBMP()` ,      `FTPUploadAsJPEG()` ,      `FTPUploadAsTIFF()` methods replaced by `FTPUpload()` method.
* `FTPDownloadBMP()` and `FTPDownloadJPEG()` methods replaced by `FTPDownload()` method.
* `HTTPUploadAsBMPThroughPost()` ,      `HTTPUploadAsJPEGThroughPost()` and `HTTPUploadAsTIFFThroughPost()` methods replaced by `HTTPUploadThroughPost()` method.
* `HTTPUploadAsBMPThroughPut()` ,      `HTTPUploadAsJPEGThroughPut()` and `HTTPUploadAsTIFFThroughPut()` methods replaced by `HTTPUploadThroughPut()` method.
* `HTTPDownloadBMP()` and `HTTPDownloadJPEG()` methods replaced by `HTTPDownload()` method.
* `LoadBMP()` and `LoadJPEG()` methods replaced by `LoadImage()` method.

## `3.0.3` (03/15/2005)

* `HTTPPostResponseString` property added. Response string from the HTTP server will be available in `HTTPPostResponseString` property if an error occurs for `HTTPUploadAsBMPThroughPost()` ,      `HTTPUploadAsJPEGThroughPost()` and `HTTPUploadAsTIFFThroughPost()` methods.

## `3.0.2` (03/07/2005)

* `HTTPUploadAsBMPThroughPost()` ,      `HTTPUploadAsJPEGThroughPost()` and `HTTPUploadAsTIFFThroughPost()` methods memory access violation bug fixed.

## `3.0` (01/18/2005)

* One page and multi-page Tiff supported.
* HTTP Upload now supports HTTP Post command.
* Many high level properties and methods added.
* Method `EnableSource(Boolean IfShowUI)` changed to `EnableSource()` , method `HTTPUploadAsBMP()` changed to `HTTPUploadAsBMPThroughPut()` , method `HTTPUploadAsJPEG()` changed to `HTTPUploadAsJPEGThroughPut()` .
* Added methods: `FeedPage()` ,      `FTPUploadAsTIFF()` ,      `RewindPage()`,  `HTTPUploadAsBMPThroughPost()` ,      `HTTPUploadAsJPEGThroughPost()`,     `HTTPUploadAsTIFFThroughPost()`,     `HTTPUploadAsTIFFThroughPut()`,  `SaveAsTIFF()` .
* Added properties: `BitDepth` ,      `Brightness` ,      `Contrast` ,      `DataSourceStatus` ,      `Duplex` ,      `IfAutoBright` ,      `IfAutoFeed` ,      `IfAutoScan`,     `IfDeviceOnline`,  `IfDisableSourceAfterAcquire` ,      `IfDuplexEnabled` ,      `IfFeederEnabled` ,      `IfModalUI` ,      `IfPaperDetectable` ,      `IfShowIndicator` , `IfShowUI` ,      `IfThrowException` ,      `IfTiffMultiPage` ,      `IfUIControllable` ,      `PageSize` ,      `PixelFlavor` ,      `PixelType` ,      `Resolution` ,      `Unit` ,      `XferCount` 	 	 	 

## `2.0.1` (12/21/2004)

* `HTTPUploadAsJPEG()` and `HTTPUploadAsBMP()` modified to accommodate the new behavior of the IIS of Windows 2003 Server.

## `2.0` (06/01/2004)

* The online demo is available.
* Supports uploading and downloading through HTTP.
* Supports proxy.
* Built-In JPEG codec.
* Supports Buffered Memory image transfer mode.
* Supports Disk File image transfer mode.
* Totally rewritten with pure Windows API and assembly language.
* Built-In TWAIN session wizard.
* `CapSetFrame()`,     `CapGetFrameLeft()`,     `CapGetFrameTop()`,     `CapGetFrameRight()`,  `CapGetFrameBottom()` added for the negotiation of `ICAP_FRAMES` capability.
* `OnPreAllTransfers` ,      `OnPostAllTransfers` ,      `OnTransferCancelled` ,      `OnTransferError` events added.

## `1.0.2` (03/15/2004)

* `BorderStyle` property added.

## `1.0.1` (11/15/2003)

* `hDIB` property added.
* `Picture` property can work properly.

## `1.0` (08/20/2003)

* TWAIN specification 1.9 compatible.
* Supports Native image transfer mode.
* Supports uploading and downloading image trough FTP.

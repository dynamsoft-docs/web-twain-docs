---
layout: default-layout
needAutoGenerateSidebar: true
# noTitleIndex: true
title: Dynamic Web TWAIN SDK API Reference - Input and Output APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, IO APIs
breadcrumbText: IO
description: Dynamic Web TWAIN SDK Documentation | API Reference | IO APIs Page
permalink: /info/api/WebTwain_IO.html
---

# {WebTwainObject} IO

The properties and methods on this page live in the namespace {WebTwainObject}. {WebTwainObject} denotes the `WebTwain` instance. Learn about [how to create a web twain object]({{site.indepth}}features/initialize.html#creating-the-webtwain-instance).

<div class="multi-panel-switching-prefix"></div>

- [Desktop Service](#desktop) 
- [Android Service](#android) 

<div class="multi-panel-start"></div>

**Methods**

**Input Methods**

|                                                   |
| :------------------------------------------------ | :------------------------------------------------------ | ----------------------------------------------------------- | ----------------------------------------------- |
| [`LoadImage()`](#loadimage)                       | [`LoadImageEx()`](#loadimageex)                         | [`LoadImageFromBase64Binary()`](#loadimagefrombase64binary) | [`LoadImageFromBinary()`](#loadimagefrombinary) |
| [`LoadDibFromClipboard()`](#loaddibfromclipboard) | [`FTPDownload()`](#ftpdownload)                         | [`FTPDownloadEx()`](#ftpdownloadex)                         | [`HTTPDownload()`](#httpdownload)               |
| [`HTTPDownloadEx()`](#httpdownloadex)             | [`HTTPDownloadThroughPost()`](#httpdownloadthroughpost) | [`HTTPDownloadDirectly()`](#httpdownloaddirectly)           |

**Output Methods**

|                                                                                                                          |
| :----------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| [`ConvertToBase64()`](#converttobase64)                                                 | [`ConvertToBlob()`](#converttoblob)                                       | [`FTPUpload()`](#ftpupload)                                                     |
| [`FTPUploadEx()`](#ftpuploadex)                                                         | [`FTPUploadAllAsMultiPageTIFF()`](#ftpuploadallasmultipagetiff)           | [`FTPUploadAllAsPDF()`](#ftpuploadallaspdf)                                     |
| [`FTPUploadAsMultiPagePDF()`](#ftpuploadasmultipagepdf)                                 | [`FTPUploadAsMultiPageTIFF()`](#ftpuploadasmultipagetiff)                 | [`HTTPUpload()`](#httpupload)                                                   |
| [`HTTPUploadThroughPutEx()`](#httpuploadthroughputex)                                   | [`HTTPUploadThroughPost()`](#httpuploadthroughpost)                       | [`HTTPUploadThroughPostEx()`](#httpuploadthroughpostex)                         |
| [`HTTPUploadAllThroughPostAsMultiPageTIFF()`](#httpuploadallthroughpostasmultipagetiff) | [`HTTPUploadAllThroughPostAsPDF()`](#httpuploadallthroughpostaspdf)       | [`HTTPUploadThroughPostAsMultiPagePDF()`](#httpuploadthroughpostasmultipagepdf) |
| [`HTTPUploadThroughPostAsMultiPageTIFF()`](#httpuploadthroughpostasmultipagetiff)       | [`HTTPUploadThroughPostDirectly()`](#httpuploadthroughpostdirectly)       | [`SaveAsBMP()`](#saveasbmp)                                                     |
| [`SaveAsJPEG()`](#saveasjpeg)                                                           | [`SaveAsPDF()`](#saveaspdf)                                               | [`SaveAsPNG()`](#saveaspng)                                                     |
| [`SaveAsTIFF()`](#saveastiff)                                                           | [`SaveSelectedImagesAsMultiPagePDF()`](#saveselectedimagesasmultipagepdf) | [`SaveSelectedImagesAsMultiPageTIFF()`](#saveselectedimagesasmultipagetiff)     |
| [`SaveAllAsMultiPageTIFF()`](#saveallasmultipagetiff)                                   | [`SaveAllAsPDF()`](#saveallaspdf)                                         | [`ShareImages()`](#shareimages)                                                 |
| [`OutputSelectedAreasAsync()`](#outputselectedareaasync)   |

**Other Methods**

|                                               |
| :-------------------------------------------- | :---------------------------------------- | --------------------------------------------------- | ----------------------------------------- |
| [`ClearTiffCustomTag()`](#cleartiffcustomtag) | [`SetTiffCustomTag()`](#settiffcustomtag) | [`ClearAllHTTPFormField()`](#clearallhttpformfield) | [`SetHTTPFormField()`](#sethttpformfield) |
| [`SetHTTPHeader()`](#sethttpheader)           | [`SetUploadSegment()`](#setuploadsegment) | [`ShowFileDialog()`](#showfiledialog)               | [`Print()`](#print)                       |
| [`PrintEx()`](#printex)                       |

**Properties**

|                                                                 |
| :-------------------------------------------------------------- | :---------------------------------------------------------------------------- | ------------------------------------------- | --------------------------------------------------- |
| [`FTPPassword`](#ftppassword)                                   | [`FTPPort`](#ftpport)                                                         | [`FTPUserName`](#ftpusername)               | [`IfPASVMode`](#ifpasvmode)                         |
| [`HttpFieldNameOfUploadedImage`](#httpfieldnameofuploadedimage) | [`HTTPPort`](#httpport)                                                       | [`IfSSL`](#ifssl)                           | [`HTTPPostResponseString`](#httppostresponsestring) |
| [`IfShowFileDialog`](#ifshowfiledialog)                         | [`IfShowCancelDialogWhenImageTransfer`](#ifshowcanceldialogwhenimagetransfer) | [`IfShowProgressBar`](#ifshowprogressbar)   | [`JPEGQuality`](#jpegquality)                       |
| [`IfTiffMultiPage`](#iftiffmultipage)                           | [`TIFFCompressionType`](#tiffcompressiontype)                                 | [`MaxUploadImageSize`](#maxuploadimagesize) |                    

**Events**

|                                   |
| :-------------------------------- | :-------------------------- | --------------------------------------------------------------- |
| [`OnGetFilePath`](#ongetfilepath) | [`OnPostLoad`](#onpostload) | [`OnInternetTransferPercentage`](#oninternettransferpercentage) |


<div class="multi-panel-end">

</div><div class="multi-panel-start"></div>

>The Android Service Edition only supports a subset of the APIs available in the Desktop Service Edition. For the APIs that are compatible with both editions, the usage remains the same. To learn how to use the APIs, please refer to the documentation for the Desktop Service Edition.

**Methods**

**Input Methods**

|                                                   |
| :------------------------------------------------ | :------------------------------------------------------ | ----------------------------------------------------------- | ----------------------------------------------- |
| [`LoadImageEx()`](#loadimageex)                         | [`LoadImageFromBase64Binary()`](#loadimagefrombase64binary) | [`LoadImageFromBinary()`](#loadimagefrombinary) |[`LoadDibFromClipboard()`](#loaddibfromclipboard) |               
| [`HTTPDownload()`](#httpdownload)               |[`HTTPDownloadEx()`](#httpdownloadex)             | [`HTTPDownloadThroughPost()`](#httpdownloadthroughpost) |       

**Output Methods**

|                                                                                                                          |
| :----------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| [`ConvertToBase64()`](#converttobase64) | [`ConvertToBlob()`](#converttoblob) | [`HTTPUpload()`](#httpupload) |
| [`HTTPUploadThroughPutEx()`](#httpuploadthroughputex)  | [`HTTPUploadThroughPost()`](#httpuploadthroughpost)  | [`HTTPUploadThroughPostEx()`](#httpuploadthroughpostex)  |
| [`HTTPUploadAllThroughPostAsMultiPageTIFF()`](#httpuploadallthroughpostasmultipagetiff) | [`HTTPUploadAllThroughPostAsPDF()`](#httpuploadallthroughpostaspdf)       | [`HTTPUploadThroughPostAsMultiPagePDF()`](#httpuploadthroughpostasmultipagepdf) |
|[`HTTPUploadThroughPostAsMultiPageTIFF()`](#httpuploadthroughpostasmultipagetiff) |  [`SaveAsBMP()`](#saveasbmp)   | [`SaveAsJPEG()`](#saveasjpeg) | 
|[`SaveAsPDF()`](#saveaspdf) | [`SaveAsPNG()`](#saveaspng)  |[`SaveAsTIFF()`](#saveastiff) | 
 |[`SaveSelectedImagesAsMultiPagePDF()`](#saveselectedimagesasmultipagepdf) | [`SaveSelectedImagesAsMultiPageTIFF()`](#saveselectedimagesasmultipagetiff)| [`SaveAllAsMultiPageTIFF()`](#saveallasmultipagetiff) | 
|[`SaveAllAsPDF()`](#saveallaspdf) |[`ShareImages()`](#shareimages)|

**Other Methods**

|                                               |
| :-------------------------------------------- | :---------------------------------------- | --------------------------------------------------- | ----------------------------------------- |
| [`ClearTiffCustomTag()`](#cleartiffcustomtag) | [`SetTiffCustomTag()`](#settiffcustomtag) | [`ClearAllHTTPFormField()`](#clearallhttpformfield) | [`SetHTTPFormField()`](#sethttpformfield) |
| [`SetHTTPHeader()`](#sethttpheader)           | [`SetUploadSegment()`](#setuploadsegment) |  [`Print()`](#print)                       |[`PrintEx()`](#printex)                       |

**Properties**

|                                                                 |
| :-------------------------------------------------------------- | :---------------------------------------------------------------------------- | ------------------------------------------- | --------------------------------------------------- |
| [`HttpFieldNameOfUploadedImage`](#httpfieldnameofuploadedimage) | [`HTTPPort`](#httpport)                                                       | [`IfSSL`](#ifssl)                           | [`HTTPPostResponseString`](#httppostresponsestring) |
|[`IfShowCancelDialogWhenImageTransfer`](#ifshowcanceldialogwhenimagetransfer) | [`IfShowProgressBar`](#ifshowprogressbar)   | [`JPEGQuality`](#jpegquality)                       | [`IfTiffMultiPage`](#iftiffmultipage)                           |
| [`TIFFCompressionType`](#tiffcompressiontype)                                 | [`MaxUploadImageSize`](#maxuploadimagesize) |                    

**Events**

|                                   |
| :-------------------------------- | :-------------------------- | --------------------------------------------------------------- |
|  [`OnPostLoad`](#onpostload) | [`OnInternetTransferPercentage`](#oninternettransferpercentage) |

<div class="multi-panel-end"></div>

---

## LoadImage  

Load image(s) specified by its absolute path.  

**Syntax**

```javascript
LoadImage(
    fileName: string,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**  

`fileName`: The path of the image to load.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**  

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Example**

```javascript
DWObject.LoadImage(
    "C:\\test\\DWT.jpg",
    function () {
        console.log("success");
    },
    function (errorCode, errorString) {
        console.log(errorString);
    }
);
```

---

## LoadImageEx  

Load image(s) specified by its absolute path.

**Syntax**

```javascript
LoadImageEx(
    fileName: string,
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`fileName`: The path of the image to load.

`type`: The format of the image. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**  

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v5.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">18.2+</td>
</tr>

</table>
</div>

**Usage Notes**

You can set [IfShowFileDialog]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) before calling this API to enable/disable "Open File" dialog.

**Example**

```javascript
DWObject.IfShowFileDialog = true; //"Open File" dialog will be opened.

DWObject.LoadImageEx(
    "", //file name can be empty if "Open File" dialog is called.
    Dynamsoft.DWT.EnumDWT_ImageType.IT_JPG,
    function () {
        console.log("success");
    },
    function (errorCode, errorString) {
        console.log(errorString);
    }
);
```

```javascript
DWObject.IfShowFileDialog = false; //Default value is true.

DWObject.LoadImageEx(
    "C:\\test\\DWT.jpg",
    Dynamsoft.DWT.EnumDWT_ImageType.IT_JPG,
    function () {
        console.log("success");
    },
    function (errorCode, errorString) {
        console.log(errorString);
    }
);
```

**Remark**

[Load Guide]({{site.indepth}}features/input.html#load-files)

---

## LoadImageFromBase64Binary

Load image(s) from a base64 string.

**Syntax**

```javascript
LoadImageFromBase64Binary(
    imageData: string,
    imageType: Dynamsoft.DWT.EnumDWT_ImageType,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`imageData`: The image data which is a base64 string without the data URI scheme.

`imageType`: The format of the image. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`successCallback`: A callback function that is executed if the request succeeds.
 
`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.2+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage Notes**

You may leverage [ConvertToBase64]({{site.info}}api/WebTwain_IO.html#converttobase64) to get a base64 string.

**Example**

```javascript
DWObject.ConvertToBase64(
    [0, 1, 2],
    Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
    function (result, indices, type) {
        DWObject.LoadImageFromBase64Binary(
            result.getData(0, result.getLength()),
            Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
            function () {
                console.log("success");
            },
            function (errorCode, errorString) {
                console.log(errorString);
            }
        );
    },
    function (errorCode, errorString) {
        console.log(errorString);
    }
);
```

**Remark**

[Load Guide]({{site.indepth}}features/input.html#load-files-in-binary-or-base64-string-format)

---

## LoadImageFromBinary

Load image(s) from a binary object (Blob or ArrayBuffer).

**Syntax**

```javascript
LoadImageFromBinary(
    imageData: Blob | ArrayBuffer,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`imageData`: The image data.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.


**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage Notes**

You may leverage [ConvertToBlob]({{site.info}}api/WebTwain_IO.html#converttoblob) to get a Blob object.

**Example**

```javascript
DWObject.ConvertToBlob(
    [0, 1, 2],
    Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
    function (result, indices, type) {
        DWObject.LoadImageFromBinary(
            result,
            function () {
                console.log("success");
            },
            function (errorCode, errorString) {
                console.log(errorString);
            }
        );
    },
    function (errorCode, errorString) {
        console.log(errorString);
    }
);
```

**Remark**

[Load Guide]({{site.indepth}}features/input.html#load-files-in-binary-or-base64-string-format)

---

## LoadDibFromClipboard

Load an image from the system clipboard. The image must be in DIB format.

**Syntax**

```javascript
LoadDibFromClipboard(
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.1+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage Notes**

If called without any callback functions, these methods (except for [LoadImageFromBinary()]({{site.info}}api/WebTwain_IO.html#loadimagefrombinary) ) become synchronously and return a boolean value to indicate whether it succeeded.

However, calling them asynchronously is recommended.

---

## OnGetFilePath

This event is triggered when [ShowFileDialog()]({{site.info}}api/WebTwain_IO.html#showfiledialog) is called or when [LoadImageEx()]({{site.info}}api/WebTwain_IO.html#loadimageex) is called with [IfShowFileDialog]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) set to true.

**Syntax**

```javascript
RegisterEvent(
    "OnGetFilePath",
    function (
        isSave: boolean,
        filesCount: number,
        index: number,
        directory: string,
        fileName: string
    ) {}
);
```

**Parameters**

`isSave`: Whether or not the event is triggered after a save-file dialog was shown.

`filesCount`: How many files were selected.

`index`: The index of the current image.

`directory`: The parent directory of currently selected file(s), "\\\\" is not included. If the methed [ShowFileDialog]({{site.info}}api/WebTwain_IO.html#showfiledialog) failed, the initial directory path set in the [ShowFileDialog]({{site.info}}api/WebTwain_IO.html#showfiledialog) method is returned.

`fileName`: The current file name.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v8.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWObject.RegisterEvent('OnGetFilePath', function(isSave, filesCount, index, directory, filename) {
    alert("isSave:" + isSave + " fileCount: " +  filesCount + " index: " +  index + " directory: " +  directory + "\\" +  filename);
});
```

---

## OnPostLoad

This event is triggered when a file from a local directory has been loaded into the control.

**Syntax**

```javascript
RegisterEvent(
    "OnPostLoad",
    function (directory: string, fileName: string, fileType: string) {}
);
```

**Parameters**

`directory`: The directory of the loaded file. For example, "C:\\Users\\[username]\\Downloads".

`fileName`: The name of the loaded file. For example, "image1.jpg".

`fileType`: The file type. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v6.3+ </td>
<td align="center">v10.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Example**

```javascript
DWObject.RegisterEvent("OnPostLoad", function (path, name, type) {
    alert(path + "\\" + name);
});
```

---

## FTPDownload

Download the specified file via FTP.

**Syntax**

```javascript
FTPDownload(
    host: string,
    path: string,
    successCallback: () => void,
    failureCallBack: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`host`: The FTP Host.

`path`: Specify the file to download.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
</tr>

</table>
</div>

---

## FTPDownloadEx

Download the specified file via FTP.

**Syntax**

```javascript
FTPDownloadEx(
    host: string,
    path: string,
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    successCallback: () => void,
    failureCallBack: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`host`: The FTP Host.

`path`: Specify the file to download.

`type`: The format of the file. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
</tr>

</table>
</div>

**Example**

```javascript
/* The sample file path is: 
 * "ftp://192.168.8.20/files/sample.pdf"
 */
var onSuccess = function() {
    console.log("Downloaded a file successfully!");
};

var onFailure = function(errorCode, errorString) {
    console.log(errorString);
};

DWObject.FTPPort = 21;
DWObject.FTPUserName = "FTPUser";
DWObject.FTPPassword = "SomePassword";
DWObject.FTPDownloadEx("192.168.8.20", "/files/sample.pdf", Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF, onSuccess, onFailure);
```

---

## FTPUpload

Upload the specified image via FTP.

**Syntax**

```javascript
FTPUpload(
    host: string,
    index: number,
    path: string,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`host`: The FTP Host.

`index`: Specify the index of the image in the buffer. The index is 0-based.

`path`: The path to save the file.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
</tr>

</table>
</div>

**Example**

```javascript
var onSuccess = function() {
    console.log("Uploaded a file successfully!");
};

var onFailure = function(errorCode, errorString) {
    console.log(errorString);
};

DWObject.FTPUserName = 'test';
DWObject.FTPPort = 21;
DWObject.FTPPassword = 'test';
DWObject.FTPUpload(
    '192.168.8.222', //The FTP Host
    0, // The index of the image
    'test.pdf', // The path & name of the file 
    OnSuccess, // Callback in case of success
    OnFailure // Callback in case of failure
);
```

---

## FTPUploadEx

Upload the specified image via FTP.

**Syntax**

```javascript
FTPUploadEx(
    host: string,
    index: number,
    path: string,
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`host`: The FTP Host.

`index`: Specify the index of the image in the buffer. The index is 0-based.

`path`: The path to save the file.

`type`: The format of the file. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.0+ </td>
<td align="center">v5.0+ </td>
<td align="center">v5.0+ </td>
<td align="center">v5.0+ </td>
<td align="center">v5.0+ </td>
</tr>

</table>
</div>

---

## FTPUploadAllAsMultiPageTIFF

Upload all images as a multi-page TIFF via FTP.

**Syntax**

```javascript
FTPUploadAllAsMultiPageTIFF(
    host: string,
    path: string,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`host`: The FTP Host.

`path`: Specify the path to save the file.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
</tr>

</table>
</div>

---

## FTPUploadAllAsPDF

Upload all images as a multi-page PDF via FTP.

**Syntax**

```javascript
FTPUploadAllAsPDF(
    host: string,
    path: string,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`host`: The FTP Host.

`path`: Specify the path to save the file.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
<td align="center">v4.0+ </td>
</tr>

</table>
</div>

---

## FTPUploadAsMultiPagePDF

Upload selected images as a multi-page PDF via FTP.

**Syntax**

```javascript
FTPUploadAsMultiPagePDF(
    host: string,
    path: string,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`host`: The FTP Host.

`path`: Specify the path to save the file.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**
<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
</tr>

</table>
</div>

---

## FTPUploadAsMultiPageTIFF

Upload selected images as a multi-page TIFF via FTP.

**Syntax**

```javascript
FTPUploadAsMultiPageTIFF(
    host: string,
    path: string,
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`host`: The FTP Host.

`path`: Specify the path to save the file.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
</tr>

</table>
</div>

---

## FTPUserName

The password to connect to the FTP.

**Syntax**

```javascript
FTPUserName: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
</tr>

</table>
</div>

---

## FTPPassword

The password to connect to the FTP.

**Syntax**

```javascript
FTPPassword: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
</tr>

</table>
</div>

---

## FTPPort

The port to connect to the FTP.

**Syntax**

```javascript
FTPPort: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
</tr>

</table>
</div>

---

## IfPASVMode

Return or set whether to use passive mode when connect to the FTP.

**Syntax**

```javascript
IfPASVMode: boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
<td align="center">v6.0+ </td>
</tr>


</table>
</div>

---

## HTTPPassword

Return or set the password used to log into the HTTP server.

**Syntax**

```javascript
HTTPPassword: string;
```

---

## HTTPUserName

Return or set the user name used to log into the HTTP server.

**Syntax**

```javascript
HTTPUserName: string;
```

---

## HTTPDownload

Download the specified file via a HTTP Get request.

**Syntax**

```javascript
HTTPDownload(
    host: string,
    path: string,
    successCallback: () => void,
    failureCallback: (
        errorCode: number,
        errorString: string) => void
): void;
```

**Parameters**

`host`: The HTTP Host.

`path`: Specify the path of the file to download.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Example**

```javascript
/* The sample file path is: 
 * "http://localhost:300/files/sample.tif"
 */
var onSuccess = function() {
    console.log("Downloaded a file successfully!");
};

var onFailure = function(errorCode, errorString) {
    console.log(errorString);
};

DWObject.HTTPPort = 300;
DWObject.HTTPDownload("localhost", "/files/sample.tif", onSuccess, onFailure);
```

**Remark**

[Download Guide]({{site.indepth}}features/input.html#download)

---

## HTTPDownloadEx

Download the specified file via a HTTP Get request.

**Syntax**

```javascript
HTTPDownloadEx(
    host: string,
    path: string,
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`host`: The HTTP Host.

`path`: Specify the path of the file to download.

`type`: The format of the file. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v5.0+ </td>
<td align="center">v5.0+ </td>
<td align="center">v5.0+ </td>
<td align="center">v5.0+ </td>
<td align="center">v5.0+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage Notes**

If you want to use this method to upload / download files through HTTPS, please don't forget to set [IfSSL]({{site.info}}api/WebTwain_IO.html#ifssl) to true and set the correct [HTTPPort]({{site.info}}api/WebTwain_IO.html#httpport).

**Example**

In this example, the URL points to a server-side script.

The server-side script can be written in any language and in any logic as long as it returns a file. Please refer to [Download-Server-Script]({{site.indepth}}development/Server-script.html#download-a-file).

```javascript
/* The sample file path is: 
 * "http://localhost:300/files/sample.tif"
 */
var onSuccess = function() {
    console.log("Downloaded a file successfully!");
};

var onFailure = function(errorCode, errorString) {
    console.log(errorString);
};

DWObject.HTTPPort = 300;
DWObject.HTTPDownloadEx("localhost", "/getFile.aspx", Dynamsoft.DWT.EnumDWT_ImageType.IT_TIF, onSuccess, onFailure);
```

**Remark**

[Download Guide]({{site.indepth}}features/input.html#download)

---

## HTTPDownloadThroughPost

Download the specified file via a HTTP Post request.

**Syntax**

```javascript
HTTPDownloadThroughPost(
    host: string,
    path: string,
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string, response?: any) => void,
): void;
```

**Parameters**

`host`: The HTTP Host.

`path`: Specify the path of the file to download.

`type`: The format of the file. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.
- `response`: The response from your server.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

---

## HTTPDownloadDirectly

Download the specified file via a HTTP Get request.

**Syntax**

```javascript
HTTPDownloadDirectly(
    host: string,
    path: string,
    localPath: string,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`host`: The HTTP Host.

`path`: Specify the path of the file to download.

`localPath`: Specify where to save the file.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v7.0+ </td>
<td align="center">v7.0+ </td>
<td align="center">v7.0+ </td>
<td align="center">v7.0+ </td>
<td align="center">v7.0+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage notes**

The Dynamic Web TWAIN library will decode the downloaded data based on the `type` parameter ( `HTTPDownloadEx()` , `HTTPDownloadThroughPost()` ) or the extension of the file in the `path` parameter ( `HTTPDownload()` ).

For security reasons, the method `HTTPDownloadDirectly()` can only download the specified file to a whitelisted location. In other words, the user needs to call the method [ShowFileDialog()](#showfiledialog) and then get a whitelisted location to use. For security purposes, the following file extensions are not permitted to be downloaded via API: exe,app,sh,com,msi,dmg,rpm,pkg,deb,apk,aab,dll,cmd,bat,dylib,so.

**Example**

```javascript
DWObject.RegisterEvent(
    "OnGetFilePath",
    function (isSave, filesCount, index, directory, fileName) {
        DWObject.HTTPDownloadDirectly(
        "www.dynamsoft.com",
        "/Products/Dynamsoft_Security_Whitepaper.pdf",
        directory + "\\" + fileName,
        function () {},
        function (errorCode, errorString) {
            console.log(errorString);
        }
        );
    }
);

DWObject.ShowFileDialog(true, "PDF|*.pdf", 0, ".pdf", "", true, false, 1);
```

---

## HTTPUpload

Upload the specified image(s) via a HTTP Post.

**Syntax**

```javascript
HTTPUpload(
    URL: string,
    indices: number[],
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    dataFormat: Dynamsoft.DWT.EnumDWT_UploadDataFormat | number,
    fileName: string,
    onEmptyResponse: () => void,
    onServerReturnedSomething: (errorCode: number, errorString: string, response: string) => void
): void;
```
```javascript
HTTPUpload(
    URL: string,
    indices: number[],
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    dataFormat: Dynamsoft.DWT.EnumDWT_UploadDataFormat | number,
    onEmptyResponse: () => void,
    onServerReturnedSomething: (errorCode: number, errorString: string, response: string) => void
): void;
```

**Parameters**

`URL`: The server-side script to receive the post. For the sample code of Server Script, please refer to [Upload-Server-Script]({{site.indepth}}development/Server-script.html#how-to-process-uploaded-files).

`indices`: Specify the image(s).

`type`: The format of the file. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`dataFormat`: Whether to upload the file as binary or a base64 string. Please refer to [EnumDWT_UploadDataFormat]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_uploaddataformat).

`fileName`: The file name.

`onEmptyResponse`: A callback function that is executed if the response is empty.

`onServerReturnedSomething`: A callback function that is executed if the response is not empty.
- `errorCode` The error code.
- `errorString` The error string.
- `response` The response string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v18.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage Notes**

If you want to use this method to upload / download files through HTTPS, please don't forget to set [IfSSL]({{site.info}}api/WebTwain_IO.html#ifssl) to true and set the correct [HTTPPort]({{site.info}}api/WebTwain_IO.html#httpport).

**Example**

```javascript
DWObject.HTTPUpload(
    'https://www.dynamsoft.com/SaveToFile.aspx', 
    [0,1],  
    Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF, 
    Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary, 
    'test.pdf', 
    OnEmptyResponse, 
    OnServerReturnedSomething
);

function OnEmptyResponse() {
    console.log('Success');
}

function OnServerReturnedSomething(errCode, errString, responseStr) {
    console.log(errString);
}
```

**Remark**

[Upload Guide]({{site.indepth}}features/output.html#upload)

---

## HTTPUploadThroughPutEx

Upload the specified image via a HTTP Put request.

**Syntax**

```javascript
HTTPUploadThroughPutEx(
    host: string,
    index: number,
    path: string,
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    successCallback: () => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`host`: The HTTP Host.

`index`: Specify the image.

`path`: Specify the path to put the file.

`type`: The format of the file. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

---

## HTTPUploadThroughPost

Upload the specified image via a HTTP Post request.

**Syntax**

```javascript
HTTPUploadThroughPost(
    host: string,
    index: number,
    target: string,
    fileName: string,
    onEmptyResponse: () => void,
    onServerReturnedSomething: (errorCode: number, errorString: string, response: string) => void
): void;
```

**Parameters**

`host`: The HTTP Host.

`index`: Specify the image.

`target`: The target where the request is sent. For the sample code of Server Script, please refer to [Upload-Server-Script]({{site.indepth}}development/Server-script.html#how-to-process-uploaded-files).

`fileName`: The file name.

`onEmptyResponse`: A callback function that is executed if the response is empty.

`onServerReturnedSomething`: A callback function that is executed if the response is not empty.
- `errorCode`: The error code.
- `errorString`: The error string.
- `response`: The response string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage Notes**

If you want to use this method to upload / download files through HTTPS, please don't forget to set [IfSSL]({{site.info}}api/WebTwain_IO.html#ifssl) to true and set the correct [HTTPPort]({{site.info}}api/WebTwain_IO.html#httpport).

**Example**

```javascript
var strHTTPServer = location.hostname; //The name of the HTTP server. For example: "www.dynamsoft.com";
var CurrentPathName = unescape(location.pathname);
var CurrentPath = CurrentPathName.substring(0, CurrentPathName.lastIndexOf("/") + 1);
var strActionPage = CurrentPath + "SaveToFile.aspx";

DWObject.IfSSL = false; // Set whether SSL is used
DWObject.HTTPPort = location.port == "" ? 100 : location.port;

var Digital = new Date();
var uploadfilename = Digital.getMilliseconds();

DWObject.HTTPUploadThroughPost(
    strHTTPServer,
    i,
    strActionPage,
    uploadfilename + ".jpg",
    function () {
        console.log("Empty response");
    },
    function (errorCode,errorString,response) {
        console.log(response);
    }
);
```

---

## HTTPUploadThroughPostEx

Upload the specified image in a specific image format via a HTTP Post request.

**Syntax**

```javascript
HTTPUploadThroughPostEx(
    host: string,
    index: number,
    target: string,
    fileName: string,
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    onEmptyResponse: () => void,
    onServerReturnedSomething: (
        errorCode: number,
        errorString: string,
        response: string) => void
): void;
```

**Parameters**

`host`: The HTTP Host.

`index`: Specify the image.

`target`: The target where the request is sent. For the sample code of Server Script, please refer to [Upload-Server-Script]({{site.indepth}}development/Server-script.html#how-to-process-uploaded-files).

`fileName`: The file name.

`type`: The format of the file. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`onEmptyResponse`: A callback function that is executed if the response is empty.

`onServerReturnedSomething`: A callback function that is executed if the response is not empty.
- `errorCode`: The error code.
- `errorString`: The error string.
- `response`: The response string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage Notes**

If you want to use this method to upload / download files through HTTPS, please don't forget to set [IfSSL]({{site.info}}api/WebTwain_IO.html#ifssl) to true and set the correct [HTTPPort]({{site.info}}api/WebTwain_IO.html#httpport).

---

## HTTPUploadAllThroughPostAsMultiPageTIFF

Upload all images in the buffer as a TIFF file via a HTTP Post request.

**Syntax**

```javascript
HTTPUploadAllThroughPostAsMultiPageTIFF(
    host: string,
    target: string,
    fileName: string,
    onEmptyResponse: () => void,
    onServerReturnedSomething: (
        errorCode: number,
        errorString: string,
        response: string) => void
): void;
```

**Parameters**

`host`: The HTTP Host.

`target`: The target wherethe request is sent. For the sample code of Server Script, please refer to [Upload-Server-Script]({{site.indepth}}development/Server-script.html#how-to-process-uploaded-files).

`fileName`: The file name.

`onEmptyResponse`: A callback function that is executed if the response is empty.

`onServerReturnedSomething`: A callback function that is executed if the response is not empty.
- `errorCode`: The error code.
- `errorString`: The error string.
- `response`: The response string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v4.0+</td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage Notes**

If you want to use this method to upload / download files through HTTPS, please don't forget to set [IfSSL]({{site.info}}api/WebTwain_IO.html#ifssl) to true and set the correct [HTTPPort]({{site.info}}api/WebTwain_IO.html#httpport).

---

## HTTPUploadAllThroughPostAsPDF

Upload all images in the buffer as a PDF file via a HTTP Post request.

**Syntax**

```javascript
HTTPUploadAllThroughPostAsPDF(
    host: string,
    target: string,
    fileName: string,
    onEmptyResponse: () => void,
    onServerReturnedSomething: (
        errorCode: number,
        errorString: string,
        response: string) => void
): void;
```

**Parameters**

`host`: The HTTP Host.

`target`: The target where the request is sent. For the sample code of Server Script, please refer to [Upload-Server-Script]({{site.indepth}}development/Server-script.html#how-to-process-uploaded-files).

`fileName`: The file name.

`onEmptyResponse`: A callback function that is executed if the response is empty.

`onServerReturnedSomething`: A callback function that is executed if the response is not empty.
- `errorCode`: The error code.
- `errorString`: The error string.
- `response`: The response string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage Notes**

If you want to use this method to upload / download files through HTTPS, please don't forget to set [IfSSL]({{site.info}}api/WebTwain_IO.html#ifssl) to true and set the correct [HTTPPort]({{site.info}}api/WebTwain_IO.html#httpport).

---

## HTTPUploadThroughPostAsMultiPagePDF

Upload all selected images in the buffer as a PDF file via a HTTP Post request.

**Syntax**

```javascript
HTTPUploadThroughPostAsMultiPagePDF(
    host: string,
    target: string,
    fileName: string,
    onEmptyResponse: () => void,
    onServerReturnedSomething: (
        errorCode: number,
        errorString: string,
        response: string) => void
): void;
```

**Parameters**

`host`: The HTTP Host.

`target`: The target where the request is sent. For the sample code of Server Script, please refer to [Upload-Server-Script]({{site.indepth}}development/Server-script.html#how-to-process-uploaded-files).

`fileName`: The file name.

`onEmptyResponse`: A callback function that is executed if the response is empty.

`onServerReturnedSomething`: A callback function that is executed if the response is not empty.
- `errorCode`: The error code.
- `errorString`: The error string.
- `response`: The response string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage Notes**

If you want to use this method to upload / download files through HTTPS, please don't forget to set [IfSSL]({{site.info}}api/WebTwain_IO.html#ifssl) to true and set the correct [HTTPPort]({{site.info}}api/WebTwain_IO.html#httpport).

---

## HTTPUploadThroughPostAsMultiPageTIFF

Upload all selected images in the buffer as a TIFF file via a HTTP Post request.

**Syntax**

```javascript
HTTPUploadThroughPostAsMultiPageTIFF(
    host: string,
    target: string,
    fileName: string,
    onEmptyResponse: () => void,
    onServerReturnedSomething: (
        errorCode: number,
        errorString: string,
        response: string) => void
): void;
```

**Parameters**

`host`: The HTTP Host.

`target`: The target where the request is sent. For the sample code of Server Script, please refer to [Upload-Server-Script]({{site.indepth}}development/Server-script.html#how-to-process-uploaded-files).

`fileName`: The file name.

`onEmptyResponse`: A callback function that is executed if the response is empty.

`onServerReturnedSomething`: A callback function that is executed if the response is not empty.
- `errorCode`: The error code.
- `errorString`: The error string.
- `response`: The response string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage Notes**

If you want to use this method to upload / download files through HTTPS, please don't forget to set [IfSSL]({{site.info}}api/WebTwain_IO.html#ifssl) to true and set the correct [HTTPPort]({{site.info}}api/WebTwain_IO.html#httpport).

---

## HTTPUploadThroughPostDirectly

**Syntax**

```javascript
HTTPUploadThroughPostDirectly(
    host: string,
    path: string,
    target: string,
    fileName: string,
    onEmptyResponse: () => void,
    onServerReturnedSomething: (
        errorCode: number,
        errorString: string,
        response: string) => void
): void;
```

**Parameters**

`host`: The HTTP Host.

`path`: Specify the file to upload.

`target`: The target where the request is sent. For the sample code of Server Script, please refer to [Upload-Server-Script]({{site.indepth}}development/Server-script.html#how-to-process-uploaded-files).

`fileName`: The file name.

`onEmptyResponse`: A callback function that is executed if the response is empty.

`onServerReturnedSomething`: A callback function that is executed if the response is not empty.
- `errorCode`: The error code.
- `errorString`: The error string.
- `response`: The response string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v7.0+</td>
<td align="center">v7.0+</td>
<td align="center">v7.0+</td>
<td align="center">v7.0+</td>
<td align="center">v7.0+</td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage notes**

If you want to use this method to upload / download files through HTTPS, please don't forget to set [IfSSL]({{site.info}}api/WebTwain_IO.html#ifssl) to true and set the correct [HTTPPort]({{site.info}}api/WebTwain_IO.html#httpport).

For security reasons, the method `HTTPUploadThroughPostDirectly()` can only upload a whitelisted file. In other words, the local file to upload should be either created by the library or selected manually by the user.

To select a local file to upload, call the method [ShowFileDialog()](#showfiledialog) and then get the file path in the callback [OnGetFilePath](#ongetfilepath). Check out the example below.

**Example**

```javascript
DWObject.RegisterEvent(
  "OnGetFilePath",
  function (isSave, filesCount, index, directory, fileName) {
    DWObject.HTTPUploadThroughPostDirectly(
      "localhost",
      directory + "\\" + fileName,
      "SaveUploadedFile.aspx",
      fileName,
      function () {},
      function (errorCode, errorString, response) {
        console.log(errorString + " " + response);
      }
    );
  }
);
DWObject.ShowFileDialog(false, "All Files|*.*", 0, "", "", false, false, 1);
```

---

## HttpFieldNameOfUploadedImage

Return or set the field name for the uploaded file. By default, it's "RemoteFile".

**Syntax**

```javascript
HttpFieldNameOfUploadedImage: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
<td align="center">v6.0+</td>
</tr>

</table>
</div>

---

## HTTPPort

Return or set the HTTP Port. The default value is `80`.

**Syntax**

```javascript
HTTPPort: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.2.1+</td>
<td align="center">v4.2.1+</td>
<td align="center">v4.2.1+</td>
<td align="center">v4.2.1+</td>
<td align="center">v4.2.1+</td>
</tr>

</table>
</div>

---

## IfSSL

Return or set whether to use SSL in HTTP requests. The default value is `false`.

**Syntax**

```javascript
IfSSL: boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
</tr>

</table>
</div>

---

## HTTPPostResponseString

Return the response string of the latest HTTP Post request.

**Syntax**

```javascript
readonly HTTPPostResponseString: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v3.0.3+</td>
<td align="center">v3.0.3+</td>
<td align="center">v3.0.3+</td>
<td align="center">v3.0.3+</td>
<td align="center">v3.0.3+</td>
</tr>

</table>
</div>

---

## MaxUploadImageSize

Return or set the maximum allowed size of a file to upload (in bytes). The default value is `-1` which indicates there is no limit over the upload size. The value should be equal or smaller than `2147483647` which essentially means `2 GB`.

**Syntax**

```javascript
MaxUploadImageSize: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
<td align="center">v5.2+</td>
</tr>

</table>
</div>

---

## OnInternetTransferPercentage

This event is triggered multiple times during a HTTP upload or download request.

**Syntax**

```javascript
RegisterEvent("OnInternetTransferPercentage", function (percentage: number) {});
```

**Parameters**

`percentage`: Return the progress by percentage.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
</tr>

</table>
</div>

---

## ConvertToBase64

Convert the specified images to a base64 string.

**Syntax**

```javascript
ConvertToBase64(
    indices: number[],
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    successCallback: (result: Base64Result, indices: number[], type: number) => void,
    failureCallBack: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`indices`: Specify one or multiple images.

`type`: The file type. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`successCallback`: A callback function that is executed if the request succeeds.
- `result`: The resulting base64 string. Please refer to [Base64Result]({{site.info}}api/Interfaces.html#base64result).
- `indices`: The indices of the converted images.
- `type`: The file type.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v18.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage Notes**

`getData()` returns the pure base64 string without the data URI scheme. For example, "/9j/4AAQSkZJRgABA...". If you want to use the string, you probably need to add the scheme. For example, "data:image/png; base64, /9j/4AAQSkZJRgABA...".

**Example**

```javascript
DWObject.ConvertToBase64(
    [0, 1, 2],
    Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
    function (result, indices, type) {
        console.log(result.getData(0, result.getLength()));
    },
    function (errorCode, errorString) {
        console.log(errorString);
    }
);
```

---

## ConvertToBlob

Convert the specified images to a blob.

**Syntax**

```javascript
ConvertToBlob(
    indices: number[],
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    successCallback: (result: Blob, indices: number[], type: number) => void,
    failureCallBack: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`indices`: Specify one or multiple images.

`type`: The file type. Please refer to [EnumDWT_ImageType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype).

`successCallback`: A callback function that is executed if the request succeeds.
- `result`: The resulting blob.
- `indices`: The indices of the converted images.
- `type`: The file type.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v13.0+</td>
<td align="center">v13.0+</td>
<td align="center">v13.0+</td>
<td align="center">v13.0+</td>
</tr>

</table>
</div>

**Example**

```javascript
DWObject.ConvertToBlob(
    [0, 1, 2],
    Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
    function (result, indices, type) {
        console.log(result.size);
    },
    function (errorCode, errorString) {
        console.log(errorString);
    }
);
```

---
## OutputSelectedAreaAsync

Copy selected area to Blob or base64.

**Syntax**

```typescript
OutputSelectedAreaAsync({
    index: number,
    area: {
        x: number,
        y: number,
        width: number,
        height: number
    },
    type: Dynamsoft.DWT.EnumDWT_ImageType | number,
    imageFormatType: Dynamsoft.DWT.EnumDWT_ImageFormatType | number,
}): Promise < Blob | string > ;
```

**Parameters**

`index`: Image to be copied from.

`area`: Area of image to be copied. X,Y is top left corner origin, width and height is size of area to be copied

`type`: The target image type of the blob/base64 (See [`Dynamsoft.DWT.EnumDWT_ImageType`]({{site.info}}/api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype) for allowable types).

`imageFormatType`: Specify if the return should be Blob or base64 string ([`Dynamsoft.DWT.EnumDWT_ImageFormatType`]({{site.info}}/api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imageformattype) for values)

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">N/A</td>
<td align="center">v18.4+</td>
<td align="center">v18.4+</td>
<td align="center">v18.4+</td>
<td align="center">v18.4+</td>
<td align="center">v18.4+</td>
</tr>

</table>
</div>

---

## SaveAsBMP

Save the specified image as a BMP file.

**Syntax**

```javascript
SaveAsBMP(
    fileName: string,
    index: number,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`fileName`: The name to save to (or specify the absolute path).

`index`: The index which specifies the image to save.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage Notes**

If you would like to save images by showing the 'Save File' dialog box, you can set [IfShowFileDialog]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) to true.

---

## SaveAsJPEG

Save the specified image as a JPEG file.

**Syntax**

```javascript
SaveAsJPEG(
    fileName: string,
    index: number,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`fileName`: The name to save to (or specify the absolute path).

`index`: The index which specifies the image to save.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage notes**

If you would like to save images by showing the 'Save File' dialog box, you can set [IfShowFileDialog]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) to `true`.

---

## SaveAsPDF

Save the specified image as a PDF file.

**Syntax**

```javascript
SaveAsPDF(
    fileName: string,
    index: number,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`fileName`: The name to save to (or specify the absolute path).

`index`: The index which specifies the image to save.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v5.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage notes**

Learn about [how to config PDF save settings](./Addon_PDF.md#writesetup).

If you would like to save images by showing the 'Save File' dialog box, you can set [IfShowFileDialog]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) to `true`.

---

## SaveAsPNG

Save the specified image as a PNG file.

**Syntax**

```javascript
SaveAsPNG(
    fileName: string,
    index: number,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`fileName`: The name to save to (or specify the absolute path).

`index`: The index which specifies the image to save.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage notes**

If you would like to save images by showing the 'Save File' dialog box, you can set [IfShowFileDialog]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) to true.

---

## SaveAsTIFF

Save the specified image as a TIFF file.

**Syntax**

```javascript
SaveAsTIFF(
    fileName: string,
    index: number,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v3.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Parameters**

`fileName`: The name to save to (or specify the absolute path).

`index`: The index which specifies the image to save.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Usage notes**

If you would like to save images by showing the 'Save File' dialog box, you can set [IfShowFileDialog]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) to true.

---

## SaveAllAsMultiPageTIFF

Saves all the images in buffer as a multi-page TIFF file.

**Syntax**

```javascript
SaveAllAsMultiPageTIFF(
    fileName: string,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`fileName`: The name to save to (or specify the absolute path).

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode` The error code.
- `errorString` The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v4.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage notes**

If you are using WASM mode on the desktop, the image will always be saved to the Downloads folder even if you specify an absolute path.

If you would like to save images by showing the 'Save File' dialog box, you can set [IfShowFileDialog]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) to true.

---

## SaveAllAsPDF

Saves all the images in buffer as a multi-page PDF file.

**Syntax**

```javascript
SaveAllAsPDF(
    fileName: string,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`fileName`: The name to save to (or specify the absolute path).

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v5.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage notes**

Learn about [how to config PDF save settings]({{site.info}}api/Addon_PDF.html#writesetup).

If you would like to save images by showing the 'Save File' dialog box, you can set [IfShowFileDialog]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) to true.

---
## ShareImages

Shares images using Android's built in share functionality. 

**Syntax**
```javascript
ShareImages(
    fileName: string,
    indices: number[],
    type: Dynamsoft.DWT.EnumDWT_ImageType
): Promise< void>; 
```
If `indicies` is an array, the behavour is dependant on `type`:

 - If type is set to PDF or TIFF, a single multi-page file is shared

 - If any other type is set, mutiple single page files will be shared in the format of filename1.filetype, filename2.filetype, etc.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
<td align="center">not supported</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

---

## SaveSelectedImagesAsMultiPagePDF

Saves all selected images in buffer as a multi-page PDF file.

**Syntax**

```javascript
SaveSelectedImagesAsMultiPagePDF(
    fileName: string,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`fileName`: The name to save to (or specify the absolute path).

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage notes**

Learn about [how to config PDF save settings](./Addon_PDF.md#write-setup).

If you would like to save images by showing the 'Save File' dialog box, you can set [IfShowFileDialog]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) to `true`.

---

## SaveSelectedImagesAsMultiPageTIFF

Saves all selected images in buffer as a multi-page TIFF file.

**Syntax**

```javascript
SaveSelectedImagesAsMultiPageTIFF(
    fileName: string,
    successCallback ? : () => void,
    failureCallback ? : (errorCode: number, errorString: string) => void
): void | boolean;
```

**Parameters**

`fileName`: The name to save to (or specify the absolute path).

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

**Usage notes**

If called without any callback functions, these methods become synchronously and return a boolean value to indicate whether it succeeded. However, calling them asynchronously is recommended.

If you would like to save images by showing the 'Save File' dialog box, you can set [IfShowFileDialog]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) to `true`.

---

## ClearTiffCustomTag

Clear the content of all custom tiff tags.

**Syntax**

```javascript
ClearTiffCustomTag(): boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

## SetTiffCustomTag

Sets a custom tiff tag (up to 32 tags). The string to be set in a tag can be base64 encoded.

**Syntax**

```javascript
SetTiffCustomTag(
    id: number,
    content: string,
    useBase64Encoding: boolean
): boolean;
```

**Parameters**

`id`: The id of the custom tag.

`content`: The content of the tag.

`useBase64Encoding`: Whether the content is encoded.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

The method `SetTiffCustomTag()` sets one or up to 32 tags to be added to a TIFF file when generating it. The content of the tags can be plain text or a base64-encoded string. If it's encoded, it'll be decoded when generating the TIFF file.

To make sure you don't included unwanted tags, call `ClearTiffCustomTag()` to clear old tags before setting up new ones.

**Example**

```javascript
DWObject.ClearTiffCustomTag();
DWObject.SetTiffCustomTag(700, "Created By DWT", false);
DWObject.SaveAsTIFF("C:\\DWT.tiff", 0);
```

---

## ClearAllHTTPFormField

Clear all the custom fields from the HTTP Post Form.

**Syntax**

```javascript
ClearAllHTTPFormField(): boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
</tr>

</table>
</div>

---

## SetHTTPFormField

Add a custom field to the HTTP Post Form. Or add a binary file to the HTTP Post Form.

**Syntax**

```javascript
SetHTTPFormField(
    name: string,
    value: string
): boolean;
```
```javascript
SetHTTPFormField(
    name: string,
    content: Blob,
    fileName ? : string
): boolean;
```

**Parameters**

`name`: The name of the field.

`value`: The value of the field.

`content`: The content of the file.

`fileName`: The name of the file.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
<td align="center">v5.0+</td>
</tr>

</table>
</div>

---

## SetHTTPHeader

Add a custom header to the HTTP Post Form.

**Syntax**

```javascript
SetHTTPHeader(
    name: string,
    value: string
): boolean;
```

**Parameters**

`name`: The name of the header.

`value`: The value of the header.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
</tr>

</table>
</div>

---

## SetUploadSegment

Set the segmentation threshold and segment size.

**Syntax**

```javascript
SetUploadSegment(
    threshold: number,
    size: number
): boolean;
```

**Parameters**

`threshold`: Specify the threshold (in MB).

`size`: Specify the segment size (in KB).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v12.1+</td>
<td align="center">v12.1+</td>
<td align="center">v12.1+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

## IfShowFileDialog

Return or set whether to show open/save file dialog when saving images in the buffer or loading images from a local directory. 

**_Note:_** This does not affect the Android Service edition. The dialog will always show not matter what ```IfShowFileDialog``` is set to.

**Syntax**

```javascript
IfShowFileDialog: boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v6.2+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

**Usage notes**

Supported in Service mode only.

---

## IfShowCancelDialogWhenImageTransfer

Return or set whether to show the progress of an operation with a button to cancel it.

**Syntax**

```javascript
IfShowCancelDialogWhenImageTransfer: boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v5.2+ </td>
<td align="center">v18.2+ </td>
</tr>

</table>
</div>

**Usage Notes**

This API is only valid if `IfShowProgressBar = true;`

---

## IfShowProgressBar
Return or set whether the progress bar will be displayed during any encoding, decoding, or transfer activities.

**Syntax**

```javascript
IfShowProgressBar: boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">v8.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

---

## ShowFileDialog

Show the system's save-file dialog or open-file dialog.

**Syntax**

```javascript
ShowFileDialog(
    isSave: boolean,
    filter: string,
    filterIndex: number,
    defaultExtension: string,
    initialDirectory: string,
    allowMultiSelect: boolean,
    showOverwritePrompt: boolean,
    flag: number
): boolean;
```

**Parameters**

`isSave`: Whether to show a save-file dialog or an open-file dialog.

`filter`: The filter pattern like "JPG or *.jpg".

`filterIndex`: The order of the filter. Normally, just put 0.

`defaultExtension`: Extension to be appended to the file name. Only valid in a save-file dialog.

`initialDirectory`: The initial directory that the dialog opens.

`allowMultiSelect`: Whether or not multiple files can be selected at the same time. Only valid in an open-file dialog.

`showOverwritePrompt`: Whether or not a prompt shows up when saving a file may overwrite an existing file.

`flag`: If set to 0, `allowMultiSelect` and `showOverwritePrompt` will be effective. Otherwise, these two parameters are ignored.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v8.0+</td>
<td align="center">v10.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

Supported in Service mode only.

The `filter` pattern string consists of a combination(s) of valid file extensions with asterisk (\*). For example: `JPG, PNG and TIF | *.jpg;*png;*.tif` . On macOS, the string is different. For example `JPG, PNG , TIF` . To show all files, use `All Files | *.*` . Do not include spaces in the pattern string.

This method will trigger [ `OnGetFilePath` ](#ongetfilepath) event even when it fails. If multiple files are selected, the event will be called multiple times.

**Example**

```javascript
DWObject.RegisterEvent(
    "OnGetFilePath",
    function (isSave, filesCount, index, directory, fileName) {
        alert(" directory: " + directory + "\\" + fileName);
    }
);

//On macOS
DWObject.ShowFileDialog(
    false,
    "TIF,TIFF,JPG,JPEG,PNG,PDF",
    0,
    "",
    "",
    true,
    false,
    0
);

//On Windows
DWObject.ShowFileDialog(
    false,
    "BMP,TIF,JPG,PNG,PDF|*.bmp;*.tif;*.png;*.jpg;*.pdf;*.tiff;*.jpeg",
    0,
    "",
    "",
    true,
    false,
    0
);
```

---

## Print

Export all image data in the buffer to a new browser window and use the browser's built-in print feature to print the image(s).

**Syntax**

```javascript
Print(useOSPrintWindow ? : boolean): boolean;
```

**Parameters**

`useOSPrintWindow`: Whether to use the print feature of the operating system instead.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v6.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage Notes**

The parameter only works in Windows Service mode.

---

## PrintEx

Print selected image(s).

**Syntax**

```javascript
PrintEx(indices: number[]): void;
```

**Parameters**

`indices`: Specify the image.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v17.0+ </td>
<td align="center">v17.0+ </td>
<td align="center">v17.0+ </td>
<td align="center">v17.0+ </td>
</tr>

</table>
</div>

---

## JPEGQuality

Return or set the quality for JPEG compression.

**Syntax**

```javascript
JPEGQuality: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v5.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage notes**

The default value of JPEGQuality property is 80.

The valid range is 0-100. The higher the JPEGQuality property, the better the quality and the bigger the size of the file.

---

## IfTiffMultiPage

Return or set whether to append to or replace an existing TIFF file with the same name.

**Syntax**

```javascript
IfTiffMultiPage: boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v3.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage notes**

When you save a new image in the same name of an existing TIFF file: 

1) If this property is true, the new image will be added to the existing file.

2) If this property is false, the new image will replace the existing file.

---

## TIFFCompressionType

Return or set the compression type for TIFF files.

**Syntax**

```javascript
TIFFCompressionType: Dynamsoft.DWT.EnumDWT_TIFFCompressionType | number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v4.0+ </td>
<td align="center">v10.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v11.0+ </td>
<td align="center">v12.1+ </td>
</tr>

</table>
</div>

**Usage notes**

When set to TIFF_AUTO (0), 1-bit images will be compressed in TIFF_T6 (4) while images with other bit depth will be compressed in TIFF_LZW (5).

When set to TIFF_JPEG (7), 1-bit images will be compressed in TIFF_T6 (4), color images or grey images (8-bit or higher) in TIFF_JPEG (7) standard, and other images by TIFF_LZW (5).

TIFF_T4 (3) and TIFF_FAX3 (3) are two names for the same compression type. So are TIFF_T6 (4) and TIFF_FAX4 (4).

TIFF_RLE (2), TIFF_T4 (3), TIFF_FAX3 (3) and TIFF_PACKBITS (32773) only support compression of 1-bit images. TIFF_JPEG (7) supports compression of 8-bit above color images and 8-bit grey images.

When TIFF_JPEG (7) is used, you can use JPEGQuality to further reduce the size of the TIFF file.




<div class="multi-panel-switching-end"></div>

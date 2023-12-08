---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Input
keywords: Dynamic Web TWAIN, Documentation, Input
breadcrumbText: Input
description: Dynamic Web TWAIN SDK Documentation Input Page
permalink: /indepth/features/input.html
---

# Input

This section introduces different ways to get data into the `Dynamic Web TWAIN` buffer.

## Scanners

### Scan From a Local Scanner

> Supported on [desktop]({{site.getstarted}}platform.html#browsers-on-desktop-devices).

A local scanner refers to a scanner that is plugged in the same desktop via USB or is available on the local network and is accessible on the local desktop. The latter is generally known as a network scanner. A network scanner is connected to the LAN itself (cable or WI-FI) and is assigned a static IP. The scanner driver from the device vendor then configures the IP to connect to the scanner.

> As far as `Dynamic Web TWAIN` is concerned, a network scanner is just like a local scanner because its driver has taken care of the network connection behind the scene.

The following code shows one way to acquire the image via the local Dynamsoft Service.
``` javascript
//Get the list of available TWAIN scanners
let scannerList=await DWObject.GetDevicesAsync()

//Select the desired scanner from the list [selecting the first scanner in the list for this example]
await DWObject.SelectDeviceAsync(scannerList[0])

//Acquire image (with configuration)
await DWObject.AcquireImageAsync({Resolution:100,IfShowUI:false})
```

### Scan From an eSCL Scanner
Many modern scanners and multi-functional printers (MFPs) support the eSCL protocol. The protocol is a vendor-neutral network protocol that allows driverless scanning via ethernet, wireless and USB-connected devices. eSCL-compatible scanners advertise themselves via mDNS so that we can find them easily. mDNS is a zero-configuration service. It is implemented by Apple Bonjour and the open-source Avahi software packages.
> See [this blog post](https://www.dynamsoft.com/blog/announcement/dynamic-web-twain-escl-scanner/) for more information about eSCL.

- To scan from an eSCL Scanner to PC, the Dynamsoft Service must be installed on the client PC
- To scan from an eSCL Scanner to Android, you must install the Android Service on the client device from the [Play Store](https://play.google.com/store/apps/details?id=com.dynamsoft.mobilescan).

The following code shows one way to acquire the image via the eSCL protocol.
``` javascript
//Get the list of available eSCL scanners
let esclDeviceList=await DWObject.GetDevicesAsync(Dynamsoft.DWT.EnumDWT_DeviceType.ESCLSCANNER)

//Select the desired scanner from the list
await DWObject.SelectDeviceAsync(esclDeviceList[0])

//Acquire image (with configuration)
await DWObject.AcquireImageAsync({Resolution:100,IfShowUI:false})
```

## Capture from cameras

### Use [DirectShow Cameras]({{site.getstarted}}hardware.html#directshow-cameras)

To include the Webcam add-on, simply add a reference to the corresponding webcam JS file which is included in the [resources folder]({{site.faq}}what-are-the-resources-files.html).

``` html
<script src="Resources/addon/dynamsoft.webtwain.addon.webcam.js"></script>
```

The following code snippet shows how to use a camera through `DirectShow`.
  

``` javascript
function PlayVideo(bShow) {
    if (DWObject) {
        DWObject.Addon.Webcam.StopVideo();
        DWObject.Addon.Webcam.SelectSource("CAMERA-NAME");
        DWObject.Addon.Webcam.PlayVideo(DWObject, 80, function() {});
    }
}

function CaptureImage() {
    if (DWObject) {
        DWObject.Addon.Webcam.SelectSource("CAMERA-NAME");
        var funCaptureImage = function() {
            setTimeout(function() {
                DWObject.Addon.Webcam.StopVideo();
            }, 50);
        };
        DWObject.Addon.Webcam.CaptureImage(funCaptureImage, funCaptureImage);
    }
}
```

## Load files

Load in this context means to open files which are accessible on the file system. These files can reside on the local disk or shared on the network.

> As a lightweight library, `Dynamic Web TWAIN` only supports the following file types: BMP, JPG, TIF, PNG, and PDF. However, not all files of these types can be loaded correctly. Learn more [here]({{site.getstarted}}Filetype.html). If you come across a file that is of one of the supported file types but fails to load, please contact [Dynamsoft Support]({{site.about}}getsupport.html).

### [Recommended] Show the `Open File` dialog and select files to load.

> Supported on [desktop]({{site.getstarted}}platform.html#browsers-on-desktop-devices) and [mobile]({{site.getstarted}}platform.html#browsers-on-mobile-devices) platforms. 

The `Open File` dialog is only displayed on [desktop]({{site.getstarted}}platform.html#browsers-on-desktop-devices). On mobile browsers, users are presented with the option to take a picture, use an existing image on the device, or open an existing file stored on the device. 

``` javascript
var onSuccess = function() {
    console.log("Loaded a file successfully!");
};
var onFailure = function(errorCode, errorString) {
    console.log(errorString);
};
DWObject.IfShowFileDialog = true;
// PDF Rasterizer Addon is used here to ensure PDF support
DWObject.Addon.PDF.SetResolution(200);
DWObject.Addon.PDF.SetConvertMode(Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL);
DWObject.LoadImageEx("", Dynamsoft.DWT.EnumDWT_ImageType.IT_ALL, onSuccess, onFailure);
```

### Open an existing file using its absolute path

> Supported on [desktop]({{site.getstarted}}platform.html#browsers-on-desktop-devices) only. 

``` javascript
var onSuccess = function() {
    console.log("Loaded a file successfully!");
};
var onFailure = function(errorCode, errorString) {
    console.log(errorString);
};
DWObject.IfShowFileDialog = false;
// PDF Addon is used here to ensure PDF support
DWObject.Addon.PDF.SetResolution(200);
DWObject.Addon.PDF.SetConvertMode(Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL);
/* "YOUR-FILE-PATH" - example path
 * Windows: 
 *   Local: "D:\\Files\\sample.pdf"
 *   LAN: "\\\\192.168.1.45\\sme\\sample.tif"
 * macOS: "/Applications/Images/sample.pdf"
 * Linux: "/home/userA/Files/sample.pdf"
 */
DWObject.LoadImage("YOUR-FILE-PATH", onSuccess, onFailure);
```

### Drag and drop files onto the viewer area of a `WebTwain` instance

> Only supported on [desktop]({{site.getstarted}}platform.html#browsers-on-desktop-devices) platform.

### Download

> `Download` is another type of `Load`. The only difference between a `Download` with what's written above is that the file to load needs to be transferred to the local device via the network first. `Dynamic Web TWAIN` takes care of the whole process and supports both `HTTP` and `FTP`.

#### `HTTP` or `HTTPS`

> Supported on [desktop]({{site.getstarted}}platform.html#browsers-on-desktop-devices) and [mobile]({{site.getstarted}}platform.html#browsers-on-mobile-devices) platforms. For this option, a URL is used to fetch the file. The URL either specifies the path of the file itself or points to a server-side script that eventually returns a file. Check out the code snippets below demonstrating both scenarios.

##### The URL specifies a file

``` javascript
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

##### The URL points to a server-side script

> The method `HTTPDownloadEx` is used because the file type needs to be specified.

JavaScript

``` javascript
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

Server-side script

> The server-side script can be written in any language and in any logic as long as it returns a file.

``` csharp
<%@ Page Language="C#"%>
<%
try
{
    String fileName = "sample.tif";
    String filePath = Server.MapPath(".") + "\\files\\" + fileName;
    System.IO.FileInfo fileInfo = new System.IO.FileInfo(filePath);
    Response.ClearContent();
    Response.ClearHeaders();
    Response.Clear();
    Response.Buffer = true;
    String fileNameEncode;
    fileNameEncode = HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8);
    fileNameEncode = fileNameEncode.Replace("+", "%20");
    String appendedheader = "attachment;filename=" + fileNameEncode;
    Response.AppendHeader("Content-Disposition", appendedheader);
    Response.WriteFile(fileInfo.FullName);
    }
catch (Exception)
{	}
%>
```

#### `FTP`

> Supported on [desktop]({{site.getstarted}}platform.html#browsers-on-desktop-devices) platform.

The following code shows how to download a file from FTP.

``` javascript
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

### Load files in binary or base64 string format 

> Supported on [desktop]({{site.getstarted}}platform.html#browsers-on-desktop-devices) and [mobile]({{site.getstarted}}platform.html#browsers-on-mobile-devices) platforms.

`Dynamic Web TWAIN` is capable of reading files in binary or base64 string format.

``` javascript
var onSuccess = function() {
    console.log("Loaded a file successfully!");
};
var onFailure = function(errorCode, errorString) {
    console.log(errorString);
};
/**
 * The following function loads a binary/blob. 
 * The method ConvertToBlob() is used to create
 * the Blob as an example but the actual Blob can 
 * come from anywhere.
 */
function loadFileFromBinary() {
    if (DWObject) {
        DWObject.ConvertToBlob(
            [0],
            Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
            function(result) {
                DWObject.LoadImageFromBinary(
                    result, onSuccess, onFailure);
            }, onFailure);
    }
}
/**
 * The following function loads a base64 string. 
 * The method ConvertToBase64() is used to create
 * the string as an example but the string can 
 * come from anywhere.
 * NOTE: the prefix such as "data:image/png;base64,"
 * should NOT be included in the data to load.
 */
function loadFileFromBase64() {
    if (DWObject) {
        DWObject.ConvertToBase64(
            [0],
            Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
            function(result) {
                DWObject.LoadImageFromBase64Binary(
                    result.getData(0, result.getLength()),
                    Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
                    onSuccess, onFailure);
            }, onFailure);
    }
}
```

### Load files from the system clipboard

> Supported on [desktop]({{site.getstarted}}platform.html#browsers-on-desktop-devices) only.

``` javascript
DWObject.LoadDibFromClipboard()
```

## Related KBs

<a href="{{site.faq}}what-physical-scanners-are-supported.html" target="_blank">What physical document scanners does the Dynamic Web TWAIN SDK support?</a>   
<a href="{{site.faq}}how-to-use-TWACKER-to-check-if-your-device-is-TWAIN-Compliant.html" target="_blank">How to use TWACKER to check if your device is TWAIN Compliant?</a>  
<a href="{{site.faq}}how-to-test-if-your-scanner-supports-ICA-scanning-on-Mac-OS.html" target="_blank">How to test if your scanner supports ICA scanning on Mac OS?</a>  
<a href="{{site.faq}}how-to-test-if-your-device-is-SANE-compliant.html" target="_blank">How to test if your device is SANE compliant?</a>  
<a href="{{site.faq}}setting-scan-settings-without-ui.html" target="_blank">Can I set scanning settings without using the default scanner's UI? What pre-scanning settings do you support?</a>  
<a href="{{site.faq}}hide-offline-scanners-from-source-list.html" target="_blank">Can I hide offline scanner devices from the select source list?</a>  
<a href="{{site.faq}}hide-webcam-from-source-list.html" target="_blank">Can I hide webcam devices from the select source list? </a>  

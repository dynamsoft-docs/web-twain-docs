---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Basics - Loading Documents from Files
keywords: Dynamic Web TWAIN, Documentation, development, guide, development guide, basic, basic guide, importing images, image import, importing documents, documents, document import
breadcrumbText: Loading Documents from Files
description: Dynamic Web TWAIN SDK General Usage Guide - Loading Documents from Files
permalink: /extended-usage/file-import.html
---

# Loading Documents from Files

> Prerequisite: [DWT Initialization]({{site.general-usage}}initialization.html)

On top of scanning images, DWT can also load documents from files on the file system, or files shared over the network. It can display, edit, and export these documents just the same as scanned images. This flexible design caters to mixed use, scanner-only, or file-only scenarios. We support the following file types: BMP, JPG, TIF, PNG, and PDF. DWT does not support all PDFs due to the complexities of the format, but the PDF rasterizer add-on does provide extra compatibility on top of base support in DWT. We can load in files through the following methods:

## Note on PDF Compatibility

The PDF rasterizer add-on provides compatibility for a broader range of PDFs. Here, we added the add-on script in the html head. For any loaded PDFs, the add-on rasterizes every page at the set resolution of 200 DPI. The PDF rasterizer can also selectively rasterize images only - check [`Dynamsoft.DWT.EnumDWT_ConvertMode`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_convertmode) and [`SetReaderOptions()`]({{site.api}}Addon_PDF.html#setreaderoptions) for details.

## Loading Files from the Selection UI

The most common file loading method is by prompting the user with a file selection interface. DWT brings up this interface slightly differently for desktop and mobile platforms.

On desktop browsers, DWT brings up the file selection interface, where users can select files on the local file system, as well as accessible files on the local network. <!-- Can local network files be accessed on mobile? --> On mobile browsers, the prompt allows users to select files from the local file system, select images from the local file system, or to take a picture. This is done with either the [`LoadImageEx()`]({{site.api}}WebTwain_IO.html#loadimageex) or [`LoadImage()`]({{site.api}}WebTwain_IO.html#loadimage) API. Here we demonstrate with `LoadImageEx()`:

### Sample Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/addon/dynamsoft.webtwain.addon.pdf.js"></script> <!-- Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation -->

    </head>

    <body>
        <input type="button" value="Open File" onclick="LoadFile();" />
        <div id="dwtcontrolContainer"></div>

        <script type="text/javascript">
            var DWTObject;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");

                // Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation
                DWTObject.Addon.PDF.SetReaderOptions({
                    convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL, //Rasterize all PDFs
                    renderOptions: {
                        resolution: 200, // Set resolution to 200 DPI
                    },
                });
            });

            function LoadFile() {
                if (DWTObject) {
                    DWTObject.IfShowFileDialog = true; // Enable file selection dialog

                    DWTObject.LoadImageEx(
                        "", // File path empty while file selection dialog is enabled
                        Dynamsoft.DWT.EnumDWT_ImageType.IT_ALL, // Allow all file types
                        function () {
                            console.log("Successfully loaded file");
                        },
                        function (errorCode, errorString) {
                            console.log(errorString);
                        }
                    );
                }
            }
        </script>
    </body>
</html>
```

APIs used:

- [`RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`LoadImageEx()`]({{site.api}}WebTwain_IO.html#loadimageex)
- [`IfShowFileDialog`]({{site.api}}WebTwain_IO.html#ifshowfiledialog)
- [`Dynamsoft.DWT.EnumDWT_ImageType`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype)
- [`Dynamsoft.DWT.EnumDWT_ConvertMode`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_convertmode)
- [`SetReaderOptions()`]({{site.api}}Addon_PDF.html#setreaderoptions)

### Explanation

We first enable file selection dialogue with the [`IfShowFileDialog`]({{site.api}}WebTwain_IO.html#ifshowfiledialog) property. Then, the call to [`LoadImageEx()`]({{site.api}}WebTwain_IO.html#loadimageex) can omit an explicit file path (the `""`). The second argument allows all DWT-supported file formats to appear in the selection dialogue.

[`LoadImage()`]({{site.api}}WebTwain_IO.html#loadimage), works similarly to `LoadImageEx()`, but it does not specify an image file format:

```javascript
DWTObject.LoadImage(
    "", // File path empty while file selection dialog is enabled
    function () { console.log("Successfully loaded file"); },
    function (errorCode, errorString) { console.log(errorString) }
)
```

## Loading Files with File Paths

> This feature is only supported on desktop.

When the web application only needs to load a particular file, DWT can retrieve it using a file path directly, and skip the file selection dialog altogether with the `IfShowFileDialog` property found in the `WebTwain` instance:

> Note: This example uses [`LoadImage()`]({{site.api}}WebTwain_IO.html#loadimage), but [`LoadImageEx()`]({{site.api}}WebTwain_IO.html#loadimageex) works similarly.

### Sample Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/addon/dynamsoft.webtwain.addon.pdf.js"></script> <!-- Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation -->
    </head>

    <body>
        <input type="button" value="Open File" onclick="LoadFile();" />
        <div id="dwtcontrolContainer"></div>

        <script type="text/javascript">
            var DWTObject;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");

                // Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation
                DWTObject.Addon.PDF.SetReaderOptions({
                    convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL, //Rasterize all PDFs
                    renderOptions: {
                        resolution: 200, // Set resolution to 200 DPI
                    },
                });
            });

            function LoadFile() {
                if (DWTObject) {
                    DWTObject.IfShowFileDialog = false; // Disable file selection dialog

                    DWTObject.LoadImage(
                        "FILE_PATH_STRING",
                        function () {
                            console.log("Successfully loaded file");
                        },
                        function (errorCode, errorString) {
                            console.log(errorString);
                        }
                    );
                }
            }
        </script>
    </body>
</html>
```

APIs used:

- [`RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`LoadImage()`]({{site.api}}WebTwain_IO.html#loadimage)
- [`IfShowFileDialog`]({{site.api}}WebTwain_IO.html#ifshowfiledialog)
- [`Dynamsoft.DWT.EnumDWT_ConvertMode`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_convertmode)
- [`SetReaderOptions()`]({{site.api}}Addon_PDF.html#setreaderoptions)

## Loading Files from Binary Blobs

The [`LoadImageFromBinary()`]({{site.api}}WebTwain_IO.html#loadimagefrombinary) is used to load images from Blobs. This sample converts a sample to a Blob with another API ([`ConvertToBlob()`]({{site.api}}WebTwain_IO.html#converttoblob)) in order to demonstrate loading Blobs - `ConvertToBlob()` is not necessary as a part of the normal workflow.

### Sample Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/addon/dynamsoft.webtwain.addon.pdf.js"></script> <!-- Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation -->
    </head>

    <body>
        <input type="button" value="Open File" onclick="LoadFile();" />
        <div id="dwtcontrolContainer"></div>

        <script type="text/javascript">
            var DWTObject;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");

                // Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation
                DWTObject.Addon.PDF.SetReaderOptions({
                    convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL, //Rasterize all PDFs
                    renderOptions: {
                        resolution: 200, // Set resolution to 200 DPI
                    },
                });
            });

            function LoadFile() {
                if (DWTObject) {
                    DWTObject.IfShowFileDialog = true; // Disable file selection dialog

                    DWTObject.LoadImageEx(
                        "", // File path can be empty when file selection dialog is enabled
                        Dynamsoft.DWT.EnumDWT_ImageType.IT_ALL, // Allow all file types
                        // Upon successful image load, convert loaded image into a Blob for demonstration purposes, then import that Blob again to create a duplicate image
                        function () {
                            DWTObject.ConvertToBlob(
                                [0], // Select the first image in the buffer
                                Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG, // Encode Blob as PNG
                                // Load Blob result back into the WebTwain instance
                                function (result) {
                                    DWTObject.LoadImageFromBinary(
                                        result,
                                        function () {
                                            console.log(
                                                "Successfully loaded blob"
                                            );
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
                        },
                        function () {
                            console.log("LoadImage failure");
                        }
                    );
                }
            }
        </script>
    </body>
</html>
```

APIs used:

- [`RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`LoadImageEx()`]({{site.api}}WebTwain_IO.html#loadimageex)
- [`IfShowFileDialog`]({{site.api}}WebTwain_IO.html#ifshowfiledialog)
- [`Dynamsoft.DWT.EnumDWT_ImageType`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype)
- [`LoadImageFromBinary()`]({{site.api}}WebTwain_IO.html#loadimagefrombinary)
- [`ConvertToBlob()`]({{site.api}}WebTwain_IO.html#converttoblob)
- [`Dynamsoft.DWT.EnumDWT_ConvertMode`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_convertmode)
- [`SetReaderOptions()`]({{site.api}}Addon_PDF.html#setreaderoptions)

### Explanation

This sample code loads an image from a file, and then converts that image into a Blob. This step is done to get an image Blob on hand. `LoadImageFromBinary()` can then load that Blob back into the `WebTwain` instance, which results in a second copy of the image. [`ConvertToBlob()`]({{site.api}}WebTwain_IO.html#converttoblob) must specify a particular target image format - in this case PNG.

<!-- Mention that we use LoadImageEx because because of async - LoadImage would need to put ConvertToBlob in the success callback -->

## Loading Files from Base64 Strings

Base64 strings handle similarly to Blobs, but with [`LoadImageFromBase64Binary()`]({{site.api}}WebTwain_IO.html#loadimagefrombase64binary). Once again, we use an extra API ([`ConvertToBase64()`]({{site.api}}WebTwain_IO.html#convertobase64)) for demonstration purposes.

### Sample Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/addon/dynamsoft.webtwain.addon.pdf.js"></script> <!-- Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation -->
    </head>

    <body>
        <input type="button" value="Open File" onclick="LoadFile();" />
        <div id="dwtcontrolContainer"></div>

        <script type="text/javascript">
            var DWTObject;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");

                // Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation
                DWTObject.Addon.PDF.SetReaderOptions({
                    convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL, //Rasterize all PDFs
                    renderOptions: {
                        resolution: 200, // Set resolution to 200 DPI
                    },
                });
            });

            function LoadFile() {
                if (DWTObject) {
                    DWTObject.IfShowFileDialog = true; // Disable file selection dialog

                    DWTObject.LoadImage(
                        "", // File path can be empty when file selection dialog is enabled
                        // Upon successful image load, convert loaded image into a Base64Result for demonstration purposes, then import that Base64Result again to create a duplicate image
                        function () {
                            DWTObject.ConvertToBase64(
                                [0], // Select the first image in the buffer
                                Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG, // Encode Base64Result as PNG
                                // Load Base64Result back into the WebTwain instance
                                function (result) {
                                    DWTObject.LoadImageFromBase64Binary(
                                        result.getData(0, result.getLength()),
                                        function () {
                                            console.log(
                                                "Successfully loaded image from Base64 string"
                                            );
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
                        },
                        function () {
                            console.log("LoadImage failure");
                        }
                    );
                }
            }
        </script>
    </body>
</html>
```

APIs used:

- [`RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`LoadImage()`]({{site.api}}WebTwain_IO.html#loadimage)
- [`IfShowFileDialog`]({{site.api}}WebTwain_IO.html#ifshowfiledialog)
- [`Dynamsoft.DWT.EnumDWT_ImageType`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype)
- [`LoadImageFromBase64Binary()`]({{site.api}}WebTwain_IO.html#loadimagefrombase64binary)
- [`ConvertToBase64()`]({{site.api}}WebTwain_IO.html#convertobase64)
- [`Base64Result`]({{site.api}}Interfaces.html#base64result)
- [`Dynamsoft.DWT.EnumDWT_ConvertMode`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_convertmode)
- [`SetReaderOptions()`]({{site.api}}Addon_PDF.html#setreaderoptions)

### Explanation

This sample code loads an image from a file, and then converts that image into a `Base64Result`. This step is done to get a Base64 string on hand. `LoadImageFromBase64Binary()` can then load that `Base64Result` back into the `WebTwain` instance, which results in a second copy of the image.

## Downloading Files over HTTP(S)

DWT supports files downloads over HTTP to access files over a network, either with a path to the file using the `HTTPDownload()` API, or a path to a server-side script that returns the file, with the `HTTPDownloadEx()` API. The following sample uses both to retrieve an image hosted by a local web server.

### Sample Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/addon/dynamsoft.webtwain.addon.pdf.js"></script> <!-- Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation -->
    </head>

    <body>
        <input
            type="button"
            value="Load from file path"
            onclick="LoadFilePath();"
        />
        <input
            type="button"
            value="Load from script"
            onclick="LoadFileFromScript();"
        />
        <div id="dwtcontrolContainer"></div>

        <script type="text/javascript">
            var DWTObject;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");

                // Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation
                DWTObject.Addon.PDF.SetReaderOptions({
                    convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL, //Rasterize all PDFs
                    renderOptions: {
                        resolution: 200, // Set resolution to 200 DPI
                    },
                });
            });

            // Load from sample file at sample path "http://localhost:300/files/sample.tif"
            function LoadFilePath() {
                if (DWTObject) {
                    DWTObject.HTTPPort = 300;
                    DWTObject.HTTPDownload(
                        "localhost", // File host
                        "/files/sample.tif", // File path
                        function () {
                            console.log(
                                "Successfully loaded image from file path"
                            );
                        },
                        function (errorCode, errorString) {
                            console.log(errorString);
                        }
                    );
                }
            }

            // Load same file using script at sample path "http://localhost:300/getFile.aspx"
            function LoadFileFromScript() {
                if (DWTObject) {
                    DWTObject.HTTPPort = 300;
                    DWTObject.HTTPDownloadEx(
                        "localhost", // Script host
                        "/getFile.aspx", // Script path
                        Dynamsoft.DWT.EnumDWT_ImageType.IT_TIF,
                        function () {
                            console.log(
                                "Successfully loaded image from script"
                            );
                        },
                        function (errorCode, errorString) {
                            console.log(errorString);
                        }
                    );
                }
            }
        </script>
    </body>
</html>
```

### Sample Server Script Code

```C#
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

APIs used:

- [`RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`Dynamsoft.DWT.EnumDWT_ImageType`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype)
- [`HTTPDownload()`]({{site.api}}WebTwain_IO.html#httpdownload)
- [`HTTPDownloadEx()`]({{site.api}}WebTwain_IO.html#httpdownloadEx)
- [`Dynamsoft.DWT.EnumDWT_ConvertMode`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_convertmode)
- [`SetReaderOptions()`]({{site.api}}Addon_PDF.html#setreaderoptions)

### Explanation

In the example above, the two APIs request the same file at the same location on the web server. [`HTTPDownload()`]({{site.api}}WebTwain_IO.html#httpdownload) requests it using the file path itself. [`HTTPDownloadEx()`]({{site.api}}WebTwain_IO.html#httpdownloadEx) is more flexible, and as well as direct file paths, it can also be pointed to any server-side script that returns a file. The sample server script we provide happens to be in C#, but this is not a language requirement.

Note that `HTTPDownload()` and `HTTPDownloadEx()` support **HTTPS**. This requires the property [`IfSSL`]({{site.api}}WebTwain_IO.html#ifssl) to be set to `true` - please check our API references on [`HTTPDownloadEx()`]({{site.api}}WebTwain_IO.html#httpdownloadEx) for more information.

## Loading Files over FTP

> This feature is only supported on desktop.

DWT can load files retrieved over FTP, and also handle authentication when needed. The sample found below demonstrates loading a file hosted on an FTP server (requiring user authentication).

### Sample Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/addon/dynamsoft.webtwain.addon.pdf.js"></script>
        <!-- Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation -->
    </head>

    <body>
        <input type="button" value="Open File" onclick="LoadFileFromFTP();" />
        <div id="dwtcontrolContainer"></div>

        <script type="text/javascript">
            var DWTObject;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");

                // Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation
                DWTObject.Addon.PDF.SetReaderOptions({
                    convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL, //Rasterize all PDFs
                    renderOptions: {
                        resolution: 200, // Set resolution to 200 DPI
                    },
                });
            });

            function LoadFileFromFTP() {
                if (DWTObject) {
                    DWTObject.FTPPort = 21;

                    DWTObject.FTPUserName = "FTPUsername"; // Set username, use empty string if anonymous
                    DWTObject.FTPPassword = "FTPPassword"; // Set password, use empty string if no password
                    DWTObject.FTPDownloadEx(
                        "192.168.8.20",
                        "/files/sample.tif",
                        Dynamsoft.DWT.EnumDWT_ImageType.IT_ALL,
                        function () {
                            console.log("Successfully loaded image from FTP");
                        },
                        function (errorCode, errorString) {
                            console.log(errorString);
                        }
                    );
                }
            }
        </script>
    </body>
</html>
```

APIs used:

- [`RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`LoadImageEx()`]({{site.api}}WebTwain_IO.html#loadimageex)
- [`IfShowFileDialog`]({{site.api}}WebTwain_IO.html#ifshowfiledialog)
- [`Dynamsoft.DWT.EnumDWT_ImageType`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype)
- [`FTPDownloadEx()`]({{site.api}}WebTwain_IO.html#ftpdownloadex)
- [`FTPPort`]({{site.api}}WebTwain_IO.html#ftpport)
- [`FTPUserName`]({{site.api}}Interfaces.html#ftpusername)
- [`FTPPassword`]({{site.api}}Interfaces.html#ftppassword)
- [`Dynamsoft.DWT.EnumDWT_ConvertMode`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_convertmode)
- [`SetReaderOptions()`]({{site.api}}Addon_PDF.html#setreaderoptions)

## Drag/Dropping Files

> This feature is only supported on desktop.

Drag/drop is built into the desktop version of the `WebTwain` `Viewer`. Users can drag and drop file icons into the viewer to load files. This feature can be turned on or off with the property [`Viewer.acceptDrop`]({{site.api}}WebTwain_Viewer.html#acceptdrop), e.g. `DWTObject.Viewer.acceptDrop = false` prevents the `Viewer` from accepting dropped images. This property is `true` by default.

## Loading Files from the System Clipboard

> This feature is only supported on desktop.

This following sample loads the most recent file from the system clipboard with the [`LoadDibFromClipboard()`]({{site.api}}WebTwain_IO.html#loaddibfromclipboard) API. Note that this API only supports DIB files.

### Sample Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/addon/dynamsoft.webtwain.addon.pdf.js"></script> <!-- Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation -->
    </head>

    <body>
        <input
            type="button"
            value="Scan"
            onclick="AcquireImage();"
        />
        <input
            type="button"
            value="Copy First Image to Clipboard"
            onclick="CopyFileToClipboard();"
        />
        <input
            type="button"
            value="Paste From Clipboard"
            onclick="LoadFileFromClipboard();"
        />
        <div id="dwtcontrolContainer"></div>

        <script type="text/javascript">
            var DWTObject;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");

                // Optional PDF rasterizer add-on for enhanced PDF handling, not necessary for operation
                DWTObject.Addon.PDF.SetReaderOptions({
                    convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL, //Rasterize all PDFs
                    renderOptions: {
                        resolution: 200, // Set resolution to 200 DPI
                    },
                });
            });

            function LoadFileFromClipboard() {
                if (DWTObject) {
                    DWTObject.LoadDibFromClipboard(
                        function () {
                            console.log(
                                "Successfully pasted image from clipboard"
                            );
                        },
                        function (errorCode, errorString) {
                            console.log(errorString);
                        }
                    );
                }
            }

            function CopyFileToClipboard() {
                if (DWTObject) {
                    DWTObject.CopyToClipboard(
                        DWTObject.CurrentImageIndexInBuffer,
                    );
                }
            }

            function AcquireImage() {
                if (DWTObject) {
                    DWTObject.SelectSourceAsync()
                    .then(function () {
                        return DWTObject.AcquireImageAsync({
                            IfCloseSourceAfterAcquire: true,
                        });
                    })
                    .catch(function (exp) {
                        alert(exp.message);
                    });
                }
            }
        </script>
    </body>
</html>
```

APIs used:

- [`RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`LoadDibFromClipboard()`]({{site.api}}WebTwain_IO.html#loaddibfromclipboard)
- [`Dynamsoft.DWT.EnumDWT_ConvertMode`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_convertmode)
- [`SetReaderOptions()`]({{site.api}}Addon_PDF.html#setreaderoptions)
- [`CopyToClipboard()`]({{site.api}}WebTwain_Edit.html#copytoclipboard)
- [`CurrentImageIndexInBuffer`]({{site.api}}WebTwain_Buffer.html#currentimageindexinbuffer)

### Explanation

In addition to [`LoadDibFromClipboard()`]({{site.api}}WebTwain_IO.html#loaddibfromclipboard), we also used [`CopyToClipboard()`]({{site.api}}WebTwain_Edit.html#copytoclipboard) to copy the displayed image to the clipboard. The user can then click the paste button to load that image back in. Note that `CopyToClipboard()` does not accept success/failure callbacks.
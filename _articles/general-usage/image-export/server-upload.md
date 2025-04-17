---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Uploading Images to Web Server
keywords: Dynamic Web TWAIN, Documentation, upload, output, web, server, web server, server upload
breadcrumbText: Uploading to Web Server
description: Dynamic Web TWAIN SDK Documentation Output Page
---

# Uploading Images to the Web Server

> Prerequisite: [DWT Initialization](/_articles/general-usage/initialization.md)<br/>
> Prerequisite: [Managing the Image Buffer](/_articles/general-usage/image-processing/buffer-management.md)

DWT contains data upload APIs that allow uploading to web servers with just a few lines of code. DWT supports uploading via both `HTTP` and `FTP`.

## Uploading over `HTTP`

DWT provides a variety of built-in `HTTP ` upload APIs. Here, we demonstrate using [`HTTPUpload()`](/_articles/info/api/WebTwain_IO.md#httpupload)to upload all 

### Sample Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
    </head>

    <body>
        <input type="button" value="Scan" onclick="AcquireImage();" /><br/>
        <!-- Upload all images in the buffer as a single PDF-->
        <input type="button" value="Upload all images" onclick="upload();" /><br/>
        <div id="dwtcontrolContainer"></div>

        <script type="text/javascript">
            var DWTObject;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
            });

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

            /**
             * Upload the images specified by their indices in the specified file type.
             * @param indices Specify the images
             * @param type Specify the file type
             */
            function upload() {
                // Create path to server-side script
                var url = "https://demo.dynamsoft.com/sample-uploads/"; // Path to demo script which has SSL certificate
                DWTObject.HTTPPort = 433; // Using default HTTPS port, can be modified as needed
                DWTObject.IfSSL = true; // Enable HTTPS
                
                var fileName = "SampleFile.pdf";
                if (DWTObject) {
                    DWTObject.SelectAllImages(); 
                    DWTObject.HTTPUpload(
                        url,
                        DWTObject.SelectedImagesIndices,
                        Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
                        Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary,
                        fileName,
                        function() {
                            console.log('Successfully uploaded the file');
                        },
                        function(errCode, errString, responseStr) {
                            console.log(errString);
                        }
                    );
                }
            }
        </script>
    </body>
</html>
```

APIs used:

- [`RegisterEvent()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#registerevent)
- [`OnWebTwainReady`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#onwebtwainready)
- [`SelectSourceAsync()`](/_articles/info/api/WebTwain_Acquire.md#selectsourceasync)
- [`AcquireImageAsync()`](/_articles/info/api/WebTwain_Acquire.md#acquireimageasync)
- [`IfCloseSourceAfterAcquire`](/_articles/info/api/Device.md#deviceobjectacquireimage)
- [`SelectAllImages()`](/_articles/info/api/WebTwain_Buffer.md#selectallimages)
- [`SelectedImagesIndices`](/_articles/info/api/WebTwain_Buffer.md#selectedimagesindices)
- [`HTTPUpload()`](/_articles/info/api/WebTwain_IO.md#httpupload)
- [`HTTPPort`](/_articles/info/api/WebTwain_IO.md#httpport)
- [`IfSSL`](/_articles/info/api/WebTwain_IO.md#ifssl)
- [`Dynamsoft.DWT.EnumDWT_UploadDataFormat`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_uploaddataformat)
- [`Dynamsoft.DWT.EnumDWT_ImageType`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_imagetype)
<!-- -   [`Dynamsoft.Lib.detect.ssl`]() -->

### Explanation

This sample uploads the scanned images to the server as a PDF in binary form, and hands the data off to the server for further processing. Note that the upload handler script (here `https://demo.dynamsoft.com/sample-uploads/`) must be defined in order to receive the data accordingly, but is otherwise language- and logic-agnostic. Read our [server-side scripting guide](/_articles/general-usage/server-side-scripting.md) for more information.

We use [`HTTPUpload()`](/_articles/info/api/WebTwain_IO.md#httpupload) to perform the following tasks:

> Note: Only `PDF` and `TIF` support multi-page documents. When using other image formats, `HTTPUpload()` can only upload one image per API call - it will fail when selecting more than one image.

- Target images in the buffer specified by the `indices` array for uploading.
  - We can only use more than one index when the target image format is `PDF` or `TIF`.
- Encode the images in the image format specified by `type`. In this case, we call it with the `Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF` enum to encode to PDF.
  - This API supports `BMP` , `JPG` , `TIF` , `PNG` and `PDF` formats. Learn more about supported file formats [here]({{site.getstarted}}filetype.html).
  - Only `TIF`s and `PDF`s support multi-page files, and they use the `Dynamsoft.DWT.EnumDWT_ImageType.IT_TIF` and `Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF` values, respectively.
- Convert the encoded images into a type specified by the `Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary` (either binary or Base64 strings). In this case we convert to binary.
- Create an HTTP Form and perform an asynchronous HTTP (Ajax) request to send the form to the server-side script at the location specified by `url`.
- Wait for the confirmation from the server, then execute the callback.
- Note that `HTTPUpload()` appends the correct file extension to the file name if it does not detect the correct ending in the `fileName` argument. For example, passing `example.jpg` for a `PDF` results in the file `example.jpg.pdf`, whereas passing the correct `example.pdf` in the first place will not result in changes to the file name.

Before calling `HTTPUpload()`, we first select all images in the buffer using `SelectAllImages()`. `HTTPUpload()` receives the full list of image indices from `SelectedImagesIndices`.

Also, note that `HTTPUpload()` supports `HTTPS` when there is an SSL certificate. In this case, the sample upload site supplies an SSL certificate, so we enable `HTTPS` with `Dynamsoft.DWT.IfSSL = true`. (the default value is `false`)

DWT provides other `HTTP` uploading APIs as well, such as for specifically uploading multi-page PDFs, or for uploading via `HTTP` post requests, among others. Read more about them in detail in our [API reference](/_articles/info/api/WebTwain_IO.md).

### Using Existing Upload Logic with DWT

We can also continue to use existing AJAX-style upload logic to upload images from DWT. The following example block assumes the existing logic is AJAX and uses [FormData](https://developer.mozilla.org/en-US/docs/Web/API/FormData/FormData):

``` javascript
function uploadThroughAJAX(imageBufferIndices, fileFormat) {
    DWTObject.ConvertToBlob(
        imageBufferIndices,
        fileFormat,
        function(result, _indices, fileFormat) {
            var url = "https://YOUR-SITE:PORT/PATH/TO/SCRIPT.aspx";
            var fileName = "SampleFile" + getExtension(fileFormat);
            var formData = new FormData();
            formData.append('RemoteFile', result, fileName);
            var response = await fetch(url, {method: "POST", body: formData});
            // Check response
        },
        function(errorCode, errorString) {
            console.log(errorString);
        }
    );
}
function getExtension(fileFormat) {
    switch (fileFormat) {
        case Dynamsoft.DWT.EnumDWT_ImageType.IT_BMP:
            return ".bmp";
        case Dynamsoft.DWT.EnumDWT_ImageType.IT_JPG:
            return ".jpg";
        case Dynamsoft.DWT.EnumDWT_ImageType.IT_TIF:
         return ".tif";
        case Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG:
            return ".png";
        case Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF:
            return ".pdf";
        default:
            return ".unknown";
    }
}
 
```

APIs used:

- [`ConvertToBlob()`](/_articles/info/api/WebTwain_IO.md#converttoblob)

#### Explanation

The only DWT API used in this example is [`ConvertToBlob()`](/_articles/info/api/WebTwain_IO.md#converttoblob), which takes care of file format encoding and binary conversion of the images, with a given array of image buffer indices and a file format enum.

## Uploading over FTP

Aside from `HTTP`, DWT also supports `FTP`, which is much simpler to use. The [`FTPUpload()`](/_articles/info/api/WebTwain_IO.md#ftpupload) is used to upload a single image like so:

``` javascript
DWTObject.FTPUserName = 'username';
DWTObject.FTPPort = 21;
DWTObject.FTPPassword = 'password';
DWTObject.FTPUpload(
    '192.168.8.222', //The FTP Host
    imageIndex,
    'test.pdf', // The path & name of the file 
    function () { console.log('Successful FTP upload'); },
    function (errorCode, errorString) { console.log('Failed FTP upload'); }
);
```

APIs used:

- [ `FTPUserName` ](/_articles/info/api/WebTwain_IO.md#ftpusername)
- [ `FTPPort` ](/_articles/info/api/WebTwain_IO.md#ftpport)
- [ `FTPPassword` ](/_articles/info/api/WebTwain_IO.md#ftppassword)
- [ `FTPUpload()` ](/_articles/info/api/WebTwain_IO.md#ftpupload)

Note that the FTP port (and credentials) are set using `WebTwain` instance properties, unlike the host address which is passed as an argument.

DWT provides other HTTP upload APIs, for example, to better handle multi-page files (in the case of `TIF` and `PDF` formats). Please read more in our [API reference](/_articles/info/api/WebTwain_IO.md).

## `FileUploader`

The `FileUploader` is a special feature that uploads files using the Dynamic Web TWAIN Service, rather than directly from the web application. This is useful for uploading large amounts of data which may otherwise degrade browser performance. Here is a quick run-down of its operation:

1. `Dynamic Web TWAIN` will prepare the file to upload with the method [ `GenerateURLForUploadData()` ](/_articles/info/api/WebTwain_Util.md#generateurlforuploaddata)
2. Create a File Uploader instance with the method [ `Init()` ](/_articles/info/api/Dynamsoft_FileUploader.md#init)
3. Create an upload job with [ `CreateJob()` ](/_articles/info/api/Dynamsoft_FileUploader.md#createjob)
   - Define the target URL [ `ServerUrl` ](/_articles/info/api/Dynamsoft_FileUploader.md#serverurl)
   - Define the upload content [ `SourceValue` ](/_articles/info/api/Dynamsoft_FileUploader.md#sourcevalue) 
   - (Optional) Define callback functions [ `OnUploadTransferPercentage` ](/_articles/info/api/Dynamsoft_FileUploader.md#onuploadtransferpercentage) ,  [ `OnRunSuccess` ](/_articles/info/api/Dynamsoft_FileUploader.md#onrunsuccess),  [ `OnRunFailure` ](/_articles/info/api/Dynamsoft_FileUploader.md#onrunfailure)
4. Run the job
5. Wait for the confirmation from the server

Check out how to use the Uploader in the following code snippets

``` html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script type="text/javascript" src="Resources/addon/dynamsoft.upload.js"></script>
    </head>

    <body>
        <div id="processbar" style="width:0%;height: 10px;background-color: blue;"></div>
        <button onclick="useUploader(DWTObject.SelectedImagesIndices, Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF);">UseUploader</button>
        <script type="text/javascript">
            var dsUploadManager;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain('dwtcontrolContainer');
                Dynamsoft.FileUploader.Init('', function (obj) {
                    dsUploadManager = obj;
                },
                    function (errCode, errStr) {
                        console.log(errStr);
                    }
                );
            });

            function useUploader(indices, type) {
                if (DWTObject) {
                    DWTObject.GenerateURLForUploadData(indices, type, function (url, indices, iImageType) {
                        // Create a Job
                        var job = dsUploadManager.CreateJob();
                        // Configure the Job
                        job.ServerUrl = "....";
                        var fileName = "SampleFile" + getExtension(type);
                        job.SourceValue.Add(url, fileName);
                        job.OnUploadTransferPercentage = function (obj, percentage) {
                            console.log(percentage)
                            var processbar = document.getElementById("processbar");
                            processbar.style.width = percentage + "%";
                        };
                        job.OnRunSuccess = function () {
                            console.log("upload success");
                        };
                        job.OnRunFailure = function (e) {
                            console.error(e)
                        };
                        // Run the Job
                        dsUploadManager.Run(job);
                    }, function () { });
                }
            }
            </script>
    </body>
</html>
```

Check out [Server-side Scripting](/_articles/general-usage/server-side-scripting.md) for more information on the target URL.
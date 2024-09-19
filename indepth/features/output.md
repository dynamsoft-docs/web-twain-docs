---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Output
keywords: Dynamic Web TWAIN, Documentation, Output
breadcrumbText: Output
description: Dynamic Web TWAIN SDK Documentation Output Page
permalink: /indepth/features/output.html
---

# Output

Different ways to export data from the `Dynamic Web TWAIN` buffer.

## Upload

The most common usage of `Dynamic Web TWAIN` is to scan documents and upload them to the server via `HTTP` and `FTP` . The library has a number of APIs to make this happen. Read on to learn more.

### HTTP with Built-in APIs

For HTTP uploading, Dynamsoft recommends the method [ `HTTPUpload()` ]({{site.info}}api/WebTwain_IO.html#httpupload). Check out the following code snippet

``` javascript
/**
 * Upload the images specified by their indices in the specified file type.
 * @param indices Specify the images
 * @param type Specify the file type
 */
function upload(indices, type) {
    var protocol = Dynamsoft.Lib.detect.ssl ? "https://" : "http://",
        port = window.location.port === "" ? 80 : window.location.port,
        actionPage = "/upload.aspx";
    // path to the server-side script
    var url = protocol + window.location.hostname + ":" + port + actionPage;
    var fileName = "SampleFile" + getExtension(type);
    if (DWTObject) {
        DWTObject.HTTPUpload(
            url,
            indices,
            type,
            Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary,
            fileName,
            function() {
                console.log('Success');
            },
            function(errCode, errString, responseStr) {
                console.log(errString);
            }
        );
    }
}
/**
 * Return the extension string of the specified image type.
 * @param type The image type (number).
 */
function getExtension(type) {
    switch (type) {
        case 0:
            return ".bmp";
        case 1:
            return ".jpg";
        case 2:
         return ".tif";
        case 3:
            return ".png";
        case 4:
            return ".pdf";
        case 7:
        case 8:
        default:
            return ".unknown";
    }
}
```

#### Questions

##### Q: How is the upload done

**A**: `Dynamic Web TWAIN` does the uploading in a few steps

* Grab the image(s) specified by `indices` ; 
* Encode the image(s) in the specified type which results in a binary file; 
* [Optional] Convert the file into a base64 string; 
* Create an HTTP Form and perform an asynchronous HTTP (Ajax) request to send the form to the specified `url` ; 
* Wait for the confirmation from the server.

The server-side script specified by `url` is very important, check out [Server-side Scripting]({{site.indepth}}development/Server-script.html) for more information.

##### Q: Is SSL supported

**A**: Yes, as shown in the following line, you just need to make sure the correct protocol is used

``` javascript
var protocol = Dynamsoft.Lib.detect.ssl ? "https://" : "http://"
```

##### Q: What file types are supported

**A**: As shown in the above function `getExtension()` , `Dynamic Web TWAIN` supports `BMP` , `JPG` , `TIF` , `PNG` and `PDF` .

##### Q: Can I upload multiple images as one file

**A**: Yes, the file types `TIF` and `PDF` support multi-page. Make sure you use these two types when trying to upload multiple images as one file.

##### Q: Can I upload the file as a base64 string

**A**: Yes, the 4th parameter of the method `HTTPUpload()` is `dataFormat` and it has two allowed values which are `Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary` and `Dynamsoft.DWT.EnumDWT_UploadDataFormat.Base64` . The code snippet uses the former but you can feel free to use the latter to upload the file as a base64 string.

### HTTP with the File Uploader

The File Uploader is an independent component that is dedicated to file uploading. It can be used seamlessly with `Dynamic Web TWAIN` . 

#### How is upload done using the File Uploader

1. `Dynamic Web TWAIN` will prepare the file to upload with the method [ `GenerateURLForUploadData()` ]({{site.info}}api/WebTwain_Util.html#generateurlforuploaddata)
* Create a File Uploader instance with the method [ `Init()` ]({{site.info}}api/Dynamsoft_FileUploader.html#init)
* Create an upload job with [ `CreateJob()` ]({{site.info}}api/Dynamsoft_FileUploader.html#createjob)
  + Define the target URL [ `ServerUrl` ]({{site.info}}api/Dynamsoft_FileUploader.html#serverurl)
  + Define the upload content [ `SourceValue` ]({{site.info}}api/Dynamsoft_FileUploader.html#sourcevalue) 
  + [Optional] Define callback functions [ `OnUploadTransferPercentage` ]({{site.info}}api/Dynamsoft_FileUploader.html#onuploadtransferpercentage) ,  [ `OnRunSuccess` ]({{site.info}}api/Dynamsoft_FileUploader.html#onrunsuccess),  [ `OnRunFailure` ]({{site.info}}api/Dynamsoft_FileUploader.html#onrunfailure)
* Run the job
* Wait for the confirmation from the server

Check out how to use the Uploader in the following code snippets

``` html
<div id="processbar" style="width:0%;"></div>
```

``` javascript
// Create a File Uploader instance
Dynamsoft.FileUploader.Init('', function(obj) {
        dsUploadManager = obj;
    },
    function(errCode, errStr) {
        console.log(errStr);
    }
);

function useUploader(indices, type) {
    if (DWTObject) {
        DWTObject.GenerateURLForUploadData(indices, type, function(url, indices, iImageType) {
            // Create a Job
            var job = dsUploadManager.CreateJob();
            // Configure the Job
            job.ServerUrl = "https://YOUR-SITE:PORT/PATH/TO/SCRIPT.aspx";
            var fileName = "SampleFile" + getExtension(type);
            job.SourceValue.Add(url, fileName);
            job.OnUploadTransferPercentage = function(obj, percentage) {
                var processbar = document.getElementById("processbar");
                processbar.style.width = a + "%";
            };
            job.OnRunSuccess = function() {};
            job.OnRunFailure = function() {};
            // Run the Job
            dsUploadManager.Run(job);
        }, function() {});
    }
}
```

Check out [Server-side Scripting]({{site.indepth}}development/Server-script.html) for more information on the target URL.

### HTTP with existing upload logic

In some cases, you might already have an upload logic in your application and just want to upload the data in the `Dynamic Web TWAIN` buffer with the same logic. The following code assumes the existing logic is pure `AJAX` which expects the [FormData](https://developer.mozilla.org/en-US/docs/Web/API/FormData/FormData)

``` javascript
function uploadThroughAJAX(indices, type) {
    DWTObject.ConvertToBlob(
        indices,
        type,
        function(result, _indices, type) {
            var url = "https://YOUR-SITE:PORT/PATH/TO/SCRIPT.aspx";
            var fileName = "SampleFile" + getExtension(type);
            var formData = new FormData();
            formData.append('RemoteFile', result, fileName);
            makeRequest(url, formData, false);
        },
        function(errorCode, errorString) {
            console.log(errorString);
        }
    );
}

function makeRequest(url, formData, flg) {
    // Set up the request
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        if (window.ActiveXObject) {
            try {
                xhr = new ActiveXObject("MSXML2.XMLHTTP.3.0");
            } catch (ex) {
                alert(ex);
            }
        }
    }
    if (xhr) {
        if (flg) {
            // Open the connection
            xhr.open("GET", url, true);
            xhr.onreadystatechange = requestresult;
            xhr.setRequestHeader("If-Modified-Since", "0");
            xhr.send(null);
        } else {
            // Send the Data via POST
            xhr.open("POST", url, false);
            if (formData != null) {
                xhr.send(formData);
            } else {
                xhr.send(null);
            }
        }
    } else {
        alert("Sorry, but I couldn't create an XMLHttpRequest! ");
    }
}

function requestresult() {
    if (xhr.readyState == 4) {
        if (xhr.status == 200) {
            // File(s) uploaded
            var outMsg;
            if (xhr.responseXML && xhr.responseXML.documentElement) {
                outMsg = xhr.responseXML;
                alert(xhr.responseText);
            }
        }
    }
}
```

### FTP

FTP is a lot simpler than HTTP. A simple example:

``` javascript
DWTObject.FTPUserName = 'test';
DWTObject.FTPPort = 21;
DWTObject.FTPPassword = 'test';
DWTObject.FTPUpload(
    '192.168.8.222', //The FTP Host
    0, // The index of the image
    'test.pdf', // The path & name of the file 
    OnFtpUploadSuccess, // Callback in case of success
    OnFtpUploadFailure // Callback in case of failure
);
```

`Dynamic Web TWAIN` provides quite a few APIs for FTP upload too

* [ `FTPUpload()` ]({{site.info}}api/WebTwain_IO.html#ftpupload)
* [ `FTPUploadEx()` ]({{site.info}}api/WebTwain_IO.html#ftpuploadex)
* [ `FTPUploadAllAsMultiPageTIFF()` ]({{site.info}}api/WebTwain_IO.html#ftpuploadallasmultipagetiff)
* [ `FTPUploadAllAsPDF()` ]({{site.info}}api/WebTwain_IO.html#ftpuploadallaspdf)
* [ `FTPUploadAsMultiPagePDF()` ]({{site.info}}api/WebTwain_IO.html#ftpuploadasmultipagepdf)
* [ `FTPUploadAsMultiPageTIFF()` ]({{site.info}}api/WebTwain_IO.html#ftpuploadasmultipagetiff)
* [ `FTPPassword` ]({{site.info}}api/WebTwain_IO.html#ftppassword)
* [ `FTPPort` ]({{site.info}}api/WebTwain_IO.html#ftpport)
* [ `FTPUserName` ]({{site.info}}api/WebTwain_IO.html#ftpusername)
* [ `IfPASVMode` ]({{site.info}}api/WebTwain_IO.html#ifpasvmode)

## Save

`Dynamic Web TWAIN` offers several methods to save your images to an absolute file path. Depending on what your exact needs are, you can choose from any of the following methods:

* [ `SaveAsBMP()` ]({{site.info}}api/WebTwain_IO.html#saveasbmp)
* [ `SaveAsJPEG()` ]({{site.info}}api/WebTwain_IO.html#saveasjpeg)
* [ `SaveAsPDF()` ]({{site.info}}api/WebTwain_IO.html#saveaspdf)
* [ `SaveAsPNG()` ]({{site.info}}api/WebTwain_IO.html#saveaspng)	
* [ `SaveAsTIFF()` ]({{site.info}}api/WebTwain_IO.html#saveastiff)
* [ `SaveSelectedImagesAsMultiPagePDF()` ]({{site.info}}api/WebTwain_IO.html#saveselectedimagesasmultipagepdf)
* [ `SaveSelectedImagesAsMultiPageTIFF()` ]({{site.info}}api/WebTwain_IO.html#saveselectedimagesasmultipagetiff)
* [ `SaveAllAsPDF()` ]({{site.info}}api/WebTwain_IO.html#saveallaspdf)
* [ `SaveAllAsMultiPageTIFF()` ]({{site.info}}api/WebTwain_IO.html#saveallasmultipagetiff)

### Show dialog to save

You can set the [ `IfShowFileDialog` ]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) property to `true` , which will show the open/save file dialog whenever you save an image(s) within the `Dynamic Web TWAIN` buffer

``` javascript
DWTObject.IfShowFileDialog = true;
// The path is selected in the dialog, therefore we only need the file name
DWTObject.SaveAllAsPDF("Sample.pdf",
    function() {
        console.log('Successful!');
    },
    function(errCode, errString) {
        console.log(errString);
    }
);
```

### Save to an absolute path

If you don't want to show any dialog and you know for sure where you want the files saved, you can save with absolute paths while setting [ `IfShowFileDialog` ]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog) to `false` .

> When using an absolute path, you must make sure the current user has the proper permission to save to that path. Otherwise the save will fail.

``` javascript
DWTObject.IfShowFileDialog = false;
DWTObject.SaveAllAsPDF("D:\\Sample.pdf",
    function() {
        console.log('Successful!');
    },
    function(errCode, errString) {
        console.log(errString);
    }
);
```

### Save multiple files to the same location

If you want the user to choose a file path once and then save multiple images to that location, you can do so via the [ `OnGetFilePath` ]({{site.info}}api/WebTwain_IO.html#ongetfilepath) event.

``` javascript
DWTObject.RegisterEvent("OnGetFilePath", (isSave, filesCount, index, directory, _fn) => {
    if (directory === "" && _fn === "") {
        console.log("User cancelled the operation.")
    } else {
        var path = directory + "\\" + _fn.substr(0, _fn.lastIndexOf("."));
        DWTObject.IfShowFileDialog = false;
        for (var i = 1; i < DWTObject.HowManyImagesInBuffer; i++) {
            DWTObject.SaveAsJPEG(path + "-" + i.toString() + ".jpg", i,
                function() {
                    console.log('Successful!');
                },
                function(errCode, errString) {
                    console.log(errString);
                }
            );
        }
    }
});
DWTObject.IfShowFileDialog = true;
DWTObject.SaveAsJPEG("Sample.jpg", 0,
    function() {
        console.log('Successful!');
    },
    function(errCode, errString) {
        console.log(errString);
    }
);
```

## Convert 

In some cases, you want to process the data yourself and want to extract it from the `Dynamic Web TWAIN` buffer. `Dynamic Web TWAIN` offers two approaches.

### Convert to a Blob

To do this, use the method [ `ConvertToBlob()` ]({{site.info}}api/WebTwain_IO.html#ConvertToBlob) which has been mentioned several times above. The following is a simple example

``` javascript
DWTObject.ConvertToBlob(
    [0, 1, 2],
    Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
    function(result, indices, type) {
        console.log(result.size);
    },
    function(errorCode, errorString) {
        console.log(errorString);
    }
);
```

### Convert to Base64

To do this, use the method [ `ConvertToBase64()` ]({{site.info}}api/WebTwain_IO.html#converttobase64)

``` javascript
DWTObject.ConvertToBase64(
    [0, 1, 2],
    Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
    function(result, indices, type) {
        console.log(result.getData(0, result.getLength()));
    },
    function(errorCode, errorString) {
        console.log(errorString);
    }
);
```

## Print

`Dynamic Web TWAIN` supports printing with the method [ `Print()` ]({{site.info}}api/WebTwain_IO.html#print).

---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Getting Started - Uploading Images to the Server
keywords: Dynamic Web TWAIN, Documentation, Hello World, upload, helloworld
breadcrumbText: Uploading documents
description: Dynamic Web TWAIN SDK Documentation - Uploading Images to the Server
permalink: /getstarted/uploading.html
---

# Uploading Images to the Server

<div class='blockquote-note'></div>
> This article is part of our HelloWorld series. If you have not already reviewed HelloWorld, please start [here]({{site.getstarted}}helloworld.html)

After scanning your document, you may want to upload the scanned documents to a server. In the [previous guide]({{site.getstarted}}helloworld.html), you created the scanning component of your HelloWorld, now you will add the code to perform an upload scanned documents as a PDF file.

## Write the server script to receive and save the uploaded file

<!-- TODO: Greatly Improve descriptors here -->

On the server side, any script language can be used (ASP. NET, JSP, PHP, etc.). Here you will be using ASP.NET (C#) as an example. You can see some additional sample scripts in other languages [here]({{site.indepth}}development/Server-script.html#how-to-process-uploaded-files).


Create a `saveUploadedPDF.aspx` file in the same location as your `HelloWorld.html` with the following contents:

``` csharp
<%@ Page Language="C#" %>
<%
    try
    {
        String strImageName;
        HttpFileCollection files = HttpContext.Current.Request.Files;
        HttpPostedFile uploadfile = files["RemoteFile"];
        strImageName = uploadfile.FileName;
        uploadfile.SaveAs(Server.MapPath(".") + "\\" + strImageName);
    }
    catch
    {
    }
%>
```

> `RemoteFile` is the default field name for the uploaded file. So you use it to extract the file from the POST Request. This field name can be changed with the API [`HttpFieldNameOfUploadedImage`]({{site.info}}api/WebTwain_IO.html#httpfieldnameofuploadedimage).

## Add an upload button in HTML

``` html
<input type="button" value="Upload" onclick="UploadAsPDF();" />
```

## Write the upload function

``` javascript
function UploadAsPDF() {
    // var url = Dynamsoft.Lib.detect.ssl ? "https://" : "http://";
    var url = location.protocol=='https:' ? "https://" : "http://";
    url += location.hostname;
    var path = location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1);
    url += location.port === "" ? path : ":" + location.port + path;
    url += "saveUploadedPDF.aspx";
    var indices = [];
    if (DWObject) {
        if (DWObject.HowManyImagesInBuffer === 0) {
            console.log("There is no image to upload!");
            return;
        }
        // DWObject.SelectAllImages();
        indices = DWObject.SelectedImagesIndices;
        DWObject.HTTPUpload(
            url,
            indices,
            Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
            Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary,
            "HelloWorld.pdf",
            function() {
                //The server response is empty!
                console.log("Successfully uploaded!")
            },
            function(errCode, errString, response) {
                console.log(errString);
            }
        );
    }
}
```

<!-- To perform the upload, you will use the following APIs and Properties: -->
Newly introduced APIs and Properties:
<!-- - [`Dynamsoft.Lib.detect.ssl`]() -->

- [`HowManyImagesInBuffer`]({{site.info}}api/WebTwain_Buffer.html#howmanyimagesinbuffer)
- [`SelectedImagesIndicies`]({{site.info}}api/WebTwain_Buffer.html#selectedimagesindices)
- [`HTTPUpload()`]({{site.info}}api/WebTwain_IO.html#httpupload)

## Review the complete code

After adding all the functions, the complete HelloWorld application should look like this:

```html
<html>

<head>
    <title>Hello World</title>
    <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
    <script src="Resources/dynamsoft.webtwain.config.js"></script>
</head>

<body>
    <input type="button" value="Scan" onclick="AcquireImage();" />
    <input type="button" value="Upload" onclick="UploadAsPDF();" />

    <div id="dwtcontrolContainer"></div>

    <script type="text/javascript">
        var DWObject;

        function Dynamsoft_OnReady() {
            DWObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
        }

        function AcquireImage() {
            if(DWObject) {
                DWObject.SelectSourceAsync()
                    .then(function () {
                        return DWObject.AcquireImageAsync({
                            IfDisableSourceAfterAcquire: true,
                        });
                    })
                    .then(function (result) {
                        console.log(result);
                    })
                    .catch(function (exp) {
                        console.error(exp.message);
                    })
                    .finally(function () {
                        DWObject.CloseSourceAsync().catch(function (e) {
                            console.error(e);
                        });
                    });
            }
        }

        function UploadAsPDF() {
            // var url = Dynamsoft.Lib.detect.ssl ? "https://" : "http://";
            // url += location.hostname;
            // var path = location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1);
            // url += location.port === "" ? path : ":" + location.port + path;
            // url += "saveUploadedPDF.aspx";

            // var url = (Dynamsoft.Lib.detect.ssl ? "https://" : "http://") + location.hostname + (location.port === "" ? location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1) : ":" + location.port + location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1)) + "saveUploadedPDF.aspx";

            // var url = `${location.protocol}//${location.host}${location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1)}saveUploadedPDF.aspx`;

            var url = location.protocol + "//" + location.host + location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1) + "saveUploadedPDF.aspx";

            var indices = [];
            if (DWObject) {
                if (DWObject.HowManyImagesInBuffer === 0) {
                    console.log("There is no image to upload!");
                    return;
                }
                // DWObject.SelectAllImages();
                indices = DWObject.SelectedImagesIndices;
                DWObject.HTTPUpload(
                    url,
                    indices,
                    Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
                    Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary,
                    "HelloWorld.pdf",
                    function () {
                        //The server response is empty!
                        console.log("Successfully uploaded!")
                    },
                    function (errCode, errString, response) {
                        console.log(errString);
                    }
                );
            }
        }
    </script>
</body>

</html>
```

Now you can use the page to scan a document and then upload the images as a PDF document.

![HelloWorldUpload]({{site.assets}}imgs/HelloWorldUpload.png)

# Additional information

**Samples Applications**
- [Try scan & upload online demo](https://demo.dynamsoft.com/Samples/dwt/Scan-Documents-and-Upload-Them/DWT_Scan_Upload_Demo.html)
- [Get scan & upload sample source code](https://www.dynamsoft.com/web-twain/sample-downloads/?demoSampleId=4)

# Next article

Now that you have completed your HelloWorld application and uploaded your first file, it is now time to learn how explore [customising your scan settings]({{site.getstarted}}scansettings.html).

<!-- - [Review HelloWorld]({{site.getstarted}}helloworld.html) -->
<!-- - [Customising your scan settings]({{site.getstarted}}scansettings.html) -->
<!-- - [Editing your images]({{site.getstarted}}editing.html) -->

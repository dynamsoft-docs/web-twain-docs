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

<!-- <div class='blockquote-note'></div>
> This article is part of our HelloWorld series. If you have not already reviewed HelloWorld, please start [here]({{site.getstarted}}helloworld.html) -->

After scanning your document, you may want to upload the scanned documents to a server. In the [previous guide]({{site.getstarted}}scanning.html), you created the scanning component of your HelloWorld, now you will add the code to perform an upload scanned documents as a PNG file. 

## Add an Upload button in HTML

``` html
<input type="button" value="Upload" onclick="Upload();" />
```

## Write the Upload function and the associated callback functions

``` javascript
function Upload() {
    if (DWTObject && DWTObject.HowManyImagesInBuffer > 0) {
        var strUrl = "https://demo.dynamsoft.com/sample-uploads/";
        var imgAry = [DWTObject.CurrentImageIndexInBuffer];
        DWTObject.HTTPUpload(
            strUrl, 
            imgAry, 
            Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
            Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary, 
            "WebTWAINImage.png", 
            onUploadSuccess, 
            onUploadFailure);
    } else {
        alert("There is no image in buffer.");
    }
}

function onUploadSuccess() {
    alert('Upload successful');
}

function onUploadFailure(errorCode, errorString, sHttpResponse) {
    alert(sHttpResponse.length > 0 ? sHttpResponse : errorString);
}
```

<!-- To perform the upload, you will use the following APIs and Properties: -->
Links to API Reference:
<!-- - [`Dynamsoft.Lib.detect.ssl`]() -->

- [`HowManyImagesInBuffer`]({{site.info}}api/WebTwain_Buffer.html#howmanyimagesinbuffer){:target="_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer){:target="_blank" rel="noreferrer noopener"}
- [`HTTPUpload()`]({{site.info}}api/WebTwain_IO.html#httpupload){:target="_blank" rel="noreferrer noopener"}
- [`Dynamsoft.DWT.EnumDWT_ImageType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype){:target="_blank" rel="noreferrer noopener"}
- [`Dynamsoft.DWT.EnumDWT_UploadDataFormat`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_uploaddataformat){:target="_blank" rel="noreferrer noopener"}


## Review the code

```html
<html>

<head>
    <title>Hello World</title>
    <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
    <script src="Resources/dynamsoft.webtwain.config.js"></script>
</head>

<body>
    <input type="button" value="Scan" onclick="AcquireImage();" />
    <input type="button" value="Upload" onclick="Upload();" />

    <div id="dwtcontrolContainer"></div>

    <script type="text/javascript">
        var DWTObject;

        function Dynamsoft_OnReady() {
            DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
        }

        function AcquireImage() {
            if (DWTObject) {
                DWTObject.SelectSourceAsync().then(function () {
                    return DWTObject.AcquireImageAsync({ 
                        IfCloseSourceAfterAcquire: true 
                    });
                }).catch(function (exp) {
                    alert(exp.message);
                });
            }
        }
        function Upload() {
            if (DWTObject && DWTObject.HowManyImagesInBuffer > 0) {
                var strUrl = "https://demo.dynamsoft.com/sample-uploads/";
                var imgAry = [DWTObject.CurrentImageIndexInBuffer];
                DWTObject.HTTPUpload(strUrl, imgAry, Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
                    Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary, "WebTWAINImage.png", onUploadSuccess, onUploadFailure);
            } else {
                alert("There is no image in buffer.");
            }
        }

        function onUploadSuccess() {
            alert('Upload successful');
        }

        function onUploadFailure(errorCode, errorString, sHttpResponse) {
            alert(sHttpResponse.length > 0 ? sHttpResponse : errorString);
        }

    </script>
</body>

</html>
```

## Run the application

### Open the application in your browser

![HelloWorldUpload0]({{site.assets}}imgs/HelloWorldUpload0.png)

### Scan a document

![HelloWorldUpload1]({{site.assets}}imgs/HelloWorldUpload1.png)

### Upload the image

After uploading, you should receive the Upload successful message

![HelloWorldUpload2]({{site.assets}}imgs/HelloWorldUpload2.png)



**Additional information**

For the purposes of this guide, a Dynamsoft hosted end point is used, but for your own application you will need to create your own end point. 

<!-- Please see [this guide <<link does not work yet as article is not yet written>>]() for creating your own endpoint. -->

**Sample Applications**
- [Try the Scan Documents + Upload demo](https://demo.dynamsoft.com/Samples/dwt/Scan-Documents-and-Upload-Them/DWT_Scan_Upload_Demo.html){:target="_blank" rel="noreferrer noopener"}
- [Get the Scan Documents + Upload demo source code](https://www.dynamsoft.com/web-twain/sample-downloads/?demoSampleId=4){:target="_blank" rel="noreferrer noopener"}

# Previous Article

<!-- If you need a refresher on creating the base project, please review [initalizing the environment]({{site.getstarted}}initialize.html). -->

To get the image you are uploading, review [scanning an image]({{site.getstarted}}scanning.html)

# Next article

Now that you have completed your HelloWorld application and uploaded your first file, it is now time to explore [setting scan parameters]({{site.getstarted}}scansettings.html).

<!-- - [Review HelloWorld]({{site.getstarted}}helloworld.html) -->
<!-- - [Customising your scan settings]({{site.getstarted}}scansettings.html) -->
<!-- - [Editing your images]({{site.getstarted}}editing.html) -->



<!--             // var url = Dynamsoft.Lib.detect.ssl ? "https://" : "http://";
            // url += location.hostname;
            // var path = location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1);
            // url += location.port === "" ? path : ":" + location.port + path;
            // url += "saveUploadedPDF.aspx";

            // var url = (Dynamsoft.Lib.detect.ssl ? "https://" : "http://") + location.hostname + (location.port === "" ? location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1) : ":" + location.port + location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1)) + "saveUploadedPDF.aspx";

            // var url = `${location.protocol}//${location.host}${location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1)}saveUploadedPDF.aspx`;
 -->
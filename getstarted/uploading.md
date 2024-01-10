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
On the server side, any script language can be used (ASP.NET, JSP, PHP, etc.). 

<!-- Here you will be using ASP.NET (C#) as an example. You can see some additional sample scripts in other languages [here]({{site.indepth}}development/Server-script.html#how-to-process-uploaded-files). -->

<div class="multi-panel-switching-prefix"></div>
- [ASP.NET(C#)](#csharp)
- [JSP](#jsp)
- [PHP](#php)
<!-- - [Node.JS](#nodejs) -->

<div class="multi-panel-start" id="csharp"></div>
<!-- C# -->
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
<div class="multi-panel-end"></div>

<div class="multi-panel-start" id="jsp"></div>
<!-- JSP -->

To upload via JSP, you will need to utilize the following packages:

```jsp
<%@  page language="java" import="java.io.*,java.util.*,org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*"%>
```

To save the file to disk, you will need to add this to your script:

```java
// Create a factory for disk-based file items
DiskFileItemFactory factory = new DiskFileItemFactory();
// Configure a repository (to ensure a secure temp location is used)
ServletContext servletContext = this.getServletConfig().getServletContext();
File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
// Set factory constraints
factory.setRepository(repository);
// Sets the threshold beyond which files are written to disk
factory.setSizeThreshold(1000000000);
// Create a new file upload handler
ServletFileUpload upload = new ServletFileUpload(factory);
// Set overall request size constraint
upload.setSizeMax(-1);
// Parse the request
List<FileItem> items = upload.parseRequest(request);
// Process the uploaded items
Iterator<FileItem> iter = items.iterator();
String _fields = "";
String fileName = "";
long sizeInBytes = 0;
String _temp_Name = application.getRealPath("/Dynamsoft_Upload");
File _fieldsTXT = new File(_temp_Name);
if(!_fieldsTXT.exists())
{
    boolean result = _fieldsTXT.createNewFile();
    System.out.println("File create result:"+result);
}
Writer objWriter = new BufferedWriter(new FileWriter(_fieldsTXT));
while (iter.hasNext()) {
    FileItem item = iter.next();
    // Process a regular form field
    if (item.isFormField()) {
        _fields = "FieldsTrue:";			
        String fieldName = item.getFieldName();
        String value = item.getString();			
        try {
            //File appending
            objWriter.write(fieldName + " :  " + value);
            objWriter.write(System.getProperty( "line.separator" ));
        } 
        catch (Exception e) {
            e.printStackTrace();
        }			
    } 
    // Process a file upload
    else {
        if(_fields.equals("FieldsTrue:")){
            objWriter.flush();
            objWriter.close();	
        }
        else{
            objWriter.flush();
            objWriter.close();
            _fieldsTXT.delete();
        }
        String fieldName = item.getFieldName();
        fileName = item.getName();
        String contentType = item.getContentType();
        boolean isInMemory = item.isInMemory();
        sizeInBytes = item.getSize();
        if(fileName!=null && sizeInBytes!=0){
            String _temp_Name2 = application.getRealPath("/Dynamsoft_Upload/" + fileName);
            File uploadedFile = new File(_temp_Name2);
            if(!uploadedFile.exists())
            {
                boolean result = uploadedFile.createNewFile();
                System.out.println("File create result:"+result);
            }			
            try {
                item.write(uploadedFile);
            } 
            catch (Exception e) {
                e.printStackTrace();
            }
            if(_fieldsTXT.exists())
            {
                String _temp_Name3 = application.getRealPath("/action/Dynamsoft_Upload/" + fileName.substring(0,fileName.length()-4) + "_1.txt");
                _fieldsTXT.renameTo(new File(_temp_Name3));
            }
        }
    }
}
```

<div class="multi-panel-end"></div>

<div class="multi-panel-start" id="php"></div>
<!-- PHP -->

```php
$fileTempName = $_FILES['RemoteFile']['tmp_name'];
$fileSize = $_FILES['RemoteFile']['size'];
$fileName = "Dynamsoft_Upload\\" . $_FILES['RemoteFile']['name'];
$fileName = iconv("UTF-8", "gb2312", $fileName);
$count = count($_POST);
if ($count > 0) {
    $_fieldsTXT = fopen(substr($fileName, 0, strlen($fileName) - 4) . "_1.txt", "w");
    $_fields = "";
    foreach ($_POST as $key => $value) {
        $_fields = "FieldsTrue:";
        fwrite($_fieldsTXT, $key . " :  " . $value . PHP_EOL);
    }
}

if (file_exists($fileName)) {
    $fWriteHandle = fopen($fileName, 'w');
} else {
    $fWriteHandle = fopen($fileName, 'w');
}

$fReadHandle = fopen($fileTempName, 'rb');
$fileContent = fread($fReadHandle, $fileSize);
fwrite($fWriteHandle, $fileContent);
fclose($fWriteHandle);
```

<div class="multi-panel-end"></div>

<!-- <div class="multi-panel-start"></div>
Node.JS
<div class="multi-panel-end"></div> -->

<div class="multi-panel-switching-end"></div>

> `RemoteFile` is the default field name for the uploaded file. So you use it to extract the file from the POST Request. This field name can be changed with the API [`HttpFieldNameOfUploadedImage`]({{site.info}}api/WebTwain_IO.html#httpfieldnameofuploadedimage).

## Add an upload button in HTML

``` html
<input type="button" value="Upload" onclick="UploadAsPDF();" />
```

## Write the upload function

``` javascript
function UploadAsPDF() {

    var url = `${location.protocol}//${location.host}${location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1)}saveUploadedPDF.aspx`;

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
Links to API Reference:
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



<!--             // var url = Dynamsoft.Lib.detect.ssl ? "https://" : "http://";
            // url += location.hostname;
            // var path = location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1);
            // url += location.port === "" ? path : ":" + location.port + path;
            // url += "saveUploadedPDF.aspx";

            // var url = (Dynamsoft.Lib.detect.ssl ? "https://" : "http://") + location.hostname + (location.port === "" ? location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1) : ":" + location.port + location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1)) + "saveUploadedPDF.aspx";

            // var url = `${location.protocol}//${location.host}${location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1)}saveUploadedPDF.aspx`;
 -->
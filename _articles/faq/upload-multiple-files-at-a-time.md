---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How to upload multiple files at a time?
keywords: Dynamic Web TWAIN, Document Saving, upload files
breadcrumbText: How to upload multiple files at a time?
description: How to upload multiple files at a time?
date: 2022-08-29 18:03:43 +0000
last_modified: 2026-07-30 10:09:28 +0000
---

# Document Saving

## How to upload multiple files at a time?

### Scenario:
After scanning multiple documents, you may want to send each one to your server as its own separate file in a single HTTP request, rather than calling an upload method separately for each image. Before version 13.1, this required multiple calls to the upload method(s). From version 13.1 onward, you can send them all in one request instead, as shown below.

### Solution:
Convert each image to a JPG file (as a Blob) using [ConvertToBlob](/_articles/info/api/WebTwain_IO.md#converttoblob), attach each one as its own form field using [SetHTTPFormField](/_articles/info/api/WebTwain_IO.md#sethttpformfield), then call [HTTPUpload](/_articles/info/api/WebTwain_IO.md#httpupload) once at the end to submit everything together.

> [!NOTE]
> Because each image is already attached individually as its own form field, the final `HTTPUpload()` call below doesn't need to specify which images to send — it simply submits the form. This is different from passing image indices directly to `HTTPUpload()`, which only combines multiple images into a single file for multi-page formats like PDF or TIFF.

### Steps:

1. In JS, write code similar to the following:
```javascript
function UploadAsJPG() {
    var count = 0;
    DWTObject.ClearAllHTTPFormField();
    DWTObject.SetHTTPFormField("UploadedImagesCount",DWTObject.HowManyImagesInBuffer);

    function asyncFailureFunc(errorCode, errorString) {
        alert("ErrorCode: " + errorCode + "\r" + "ErrorString:" + errorString);
    };

    var onEmptyResponse = function () {
        console.log("Uploaded Successfully");
    };

    var onServerReturnedSomething = function (ecode,estring,resp) {
        console(resp);
    }

    var convertImage = function (_index) {
        DWTObject.ConvertToBlob(
            [_index], 
            Dynamsoft.DWT.EnumDWT_ImageType.IT_JPG,
            function (result) {
                DWTObject.SetHTTPFormField('image_' + _index, result, 'JPG_image_' + _index);
                count++;
                if (count < DWTObject.HowManyImagesInBuffer) {
                    convertImage(count);
                } else {
                    DWTObject.HTTPUpload("http://localhost:90/saveUploadedJPG.aspx", onEmptyResponse, onServerReturnedSomething);// Please replace the URL with yours.
                }
            }, 
            asyncFailureFunc
        );
    };

    convertImage(0);
}
```
2. On the server, add an action page to process the uploaded data, take c# as an example,
```csharp
<%@ Page Language="C#" %>
<%
    try
    {
        String strImageName;
        String strInfo = HttpContext.Current.Request["UploadedImagesCount"];
        short uploadedImagesCount = Convert.ToInt16(strInfo);
        HttpFileCollection files = HttpContext.Current.Request.Files;
        for (short i = 0; i < uploadedImagesCount; i++)
        {
            HttpPostedFile uploadfile = files["image_" + i.ToString()];
            strImageName = uploadfile.FileName;
    
            uploadfile.SaveAs(Server.MapPath(".") + "\\UploadedImages\\" + strImageName + ".jpg");
        }
    }
    catch
    {
    }
%>
```

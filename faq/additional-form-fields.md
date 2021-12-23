---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I send additional form fields with images to my server or database?
keywords: Dynamic Web TWAIN, Document Saving, additional form fields
breadcrumbText: How can I send additional form fields with images to my server or database?
description: How can I send additional form fields with images to my server or database?
---

# Document Saving

## How can I send additional form fields with images to my server or database?

You can use <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html?ver=latest#sethttpformfield" target="_blank">SetHTTPFormField</a> to set meta data as form fields and use <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html?ver=latest#httpupload" target="_blank">HTTPUpload</a> to send it to the server side with the scanned document.

```javascript
// Clear old fields before adding new ones
DWObject.ClearAllHTTPFormField();
DWObject.SetHTTPFormField("FileType", "Insurance Doc");
```

You can check out this <a href="https://demo.dynamsoft.com/Samples/dwt/Scan-Documents-and-Upload-Them/DWT_Scan_Upload_Demo.html" target="_blank">demo project</a> for sending additional form fields when uploading the scanned document.

<a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html?ver=latest#sethttpformfield" target="_blank">SetHTTPFormField</a> can also be used to send image data in base64 or BLOB to the server side.

By design, the method <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#httpupload" target="_blank">HTTPUpload()</a> only contains one file. But as it essentially sends an HTTP form to the server, you can attach multiple files in that form using the methods <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#converttoblob" target="_blank">ConvertToBlob()</a> and <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#sethttpformfield" target="_blank">SetHTTPFormField()</a> .
Check out the following snippet on how it is done. NOTE that the method <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#httpupload" target="_blank">HTTPUpload()</a> only has 3 parameters as it doesn’t need to specify a file anymore.

```javascript
/**
 * Upload the images specified by their indices in the specified file type as separate files.
 * @param indices Specify the images
 * @param type Specify the file type
 */
function uploadSeparateFiles(indices, type) {
  var protocol = Dynamsoft.Lib.detect.ssl ? "https://" : "http://",
    port = window.location.port === "" ? 80 : window.location.port,
    actionPage = "/upload.aspx";
  // path to the server-side script
  var url = protocol + window.location.hostname + ":" + port + actionPage;
  if (DWObject) {
    var done = 0,
      count = indices.length;
    var toBlob = function (index) {
      var fieldName = "SampleFile_" + index;
      var fileName = fieldName + getExtension(type);
      DWObject.ConvertToBlob(
        [index],
        type,
        function (result, _indices, type) {
          DWObject.SetHTTPFormField(fieldName, result, fileName);
          done++;
          if (done === count) {
            DWObject.HTTPUpload(
              url,
              function () {
                console.log("Success");
              },
              function (errCode, errString, responseStr) {
                console.log(errString);
              }
            );
          } else {
            toBlob(indices[done]);
          }
        },
        function (errorCode, errorString) {
          console.log(errorString);
        }
      );
    };
    toBlob(indices[done]);
  }
}
```

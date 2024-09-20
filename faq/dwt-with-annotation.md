---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN with Annotations
keywords: Dynamic Web TWAIN, Annotation
breadcrumbText: Dynamic Web TWAIN with Annotations – Hello World
description: Dynamic Web TWAIN with Annotations – Hello World
permalink: /faq/dwt-with-annotation.html
---

# Dynamic Web TWAIN with Annotations – Hello World

The Dynamic Web TWAIN library (DWT) is a software development kit (SDK) specifically designed to integrate efficient document scanning workflows into various web applications. The Dynamsoft Document Viewer (DDV) is a versatile web document viewer with support for document annotations. In this guide, we explain how to use DDV in place of the built-in DWT viewer to enable annotations and provide a superior viewer experience.

![Flow chart for Dynamic Web TWAIN with Annotations – Hello World](/assets/imgs/dwt-with-ddv.jpg)

- Check out [HelloWorld](https://demo.dynamsoft.com/Samples/dwt/web-twian-document-viewer/index.html) online

## 1. Add Dependencies

Use the SDK by including the packages below:
- Dynamic Web TWAIN: provides scanning, saving, and uploading functionalities.
- Dynamsoft Document Viewer: provides improved document viewer and annotation functionalities

### 1.1 Deliver Dependencies via CDN

Deliver the SDK dependencies with either the [jsDelivr](https://jsdelivr.com/) or the [UNPKG](https://unpkg.com/) CDN.

- jsDelivr

  ```html
    // Dynamic Web TWAIN
    <script src="https://cdn.jsdelivr.net/npm/dwt@latest/dist/dynamsoft.webtwain.min.js"></script>
    // Dynamsoft Document Viewer
    <script src="https://cdn.jsdelivr.net/npm/dynamsoft-document-viewer@latest/dist/ddv.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/dynamsoft-document-viewer@latest/dist/ddv.css">
  ```

- UNPKG

  ```html
    // Dynamic Web TWAIN
    <script src="https://unpkg.com/dwt@latest/dist/dynamsoft.webtwain.min.js"></script>
    // Dynamsoft Document Viewer
    <script src="https://unpkg.com/dynamsoft-document-viewer@latest/dist/ddv.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dynamsoft-document-viewer@latest/dist/ddv.css">
  ```

## 2. Define HTML Elements

Define the following elements:

- A container to hold the viewer

    ```html
    <div id="container" style="height:580px; width:1000px"></div>
    ```

- Buttons to invoke functions

    ```html
    <input type="button" value="Scan" onclick="AcquireImage();" />
    <input type="button" value="Save PDF" onclick="SavePDFs();" />
    <input type="button" value="Upload" onclick="Upload();" />
    ```

## 3. Initialize the SDK

### 3.1 Initialize Dynamsoft Document Viewer

```javascript
// Dynamsoft Document Viewer
// Public trial license which is valid for 24 hours
// You can request a 30-day trial key from https://www.dynamsoft.com/customer/license/trialLicense/?product=dwtddv
Dynamsoft.DDV.Core.license = "DLS2eyJvcmdhbml6YXRpb25JRCI6IjIwMDAwMSJ9";
Dynamsoft.DDV.Core.engineResourcePath = "https://cdn.jsdelivr.net/npm/dynamsoft-document-viewer@latest/dist/engine";
await Dynamsoft.DDV.Core.init(); 
```

### 3.2 Create the Edit Viewer

```javascript
// Enable image filtering
Dynamsoft.DDV.setProcessingHandler("imageFilter", new Dynamsoft.DDV.ImageFilter());
// Create a Dynamsoft Document Viewer Edit Viewer to display and edit documents scanned with Dynamic Web TWAIN
let editViewer;
editViewer = new Dynamsoft.DDV.EditViewer({
    container: "container",
    uiConfig: Dynamsoft.DDV.getDefaultUiConfig("editViewer", {includeAnnotationSet: true}),
});

// Create a Dynamsoft Document Viewer document to contain and display images scanned by Dynamic Web TWAIN
let ddvDoc;
ddvDoc = Dynamsoft.DDV.documentManager.createDocument({
    name: "ddvtestDoc"
});

// Open the document
editViewer.openDocument(ddvDoc.uid);
```

Links to related documentation:

- [`How to configure image filter`](https://www.dynamsoft.com/document-viewer/docs/features/advanced/imagefilter.html)
- [`Edit Viewer`](https://www.dynamsoft.com/document-viewer/docs/features/viewers/editviewer.html)  
- [`How to configure your desired uiconfig`](https://www.dynamsoft.com/document-viewer/docs/ui/customize/index.html)

Links to API Reference:

- Dynamsoft Document Viewer:
    - [`setProcessingHandler()`](https://www.dynamsoft.com/document-viewer/docs/api/namespace/ddv.html#static-setprocessinghandler)  
    - [`Dynamsoft.DDV.EditViewer`](https://www.dynamsoft.com/document-viewer/docs/api/class/editviewer.html#editviewer)  
    - [`createDocument()`](https://www.dynamsoft.com/document-viewer/docs/api/class/documentmanager.html#createdocument)  
    - [`openDocument()`](https://www.dynamsoft.com/document-viewer/docs/api/class/editviewer.html#opendocument)  

### 3.3 Create a Viewerless Dynamic Web TWAIN Instance
```javascript
// Create Dynamic Web TWAIN object
// Public trial license which is valid for 24 hours
// You can request a 30-day trial key from https://www.dynamsoft.com/customer/license/trialLicense/?product=dwtddv
Dynamsoft.DWT.UseDefaultViewer = false;	
Dynamsoft.DWT.ResourcesPath = "https://cdn.jsdelivr.net/npm/dwt@latest/dist";
Dynamsoft.DWT.ProductKey = "DLS2eyJvcmdhbml6YXRpb25JRCI6IjIwMDAwMSJ9";

let DWObject;
// Create a Dynamic Web TWAIN instance without the built-in viewer
Dynamsoft.DWT.CreateDWTObjectEx({
        WebTwainId: "dwtId",
    },function (object) {
        DWObject = object;
    }, function (error) {
        console.log(error);
    }
);
```

Links to API Reference:
-  Dynamic Web TWAIN:
    - [`CreateDWTObjectEx()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#createdwtobjectex)  

## 4. Use SDK Features

### 4.1 Add Simple Scanning Functionality

Use the Dynamic Web TWAIN instance for scanning. After scan completion, import the scanned data into DDV for viewing, editing, and annotating.

#### 4.1.1 Register the OnPostTransferAsync Event

```javascript
//Register the OnPostTransferAsync event in the success callback function of CreateDWTObjectEx.
Dynamsoft.DWT.CreateDWTObjectEx({
        WebTwainId: "dwtId",
    },
    function (object) {
        DWObject = object;
        // Call Dynamsoft_OnPostTransferAsync upon completion of every individual page scan
        DWObject.RegisterEvent("OnPostTransferAsync", Dynamsoft_OnPostTransferAsync);
    },
    function (error) {
        console.log(error);
    }
);

// Import scanned page into Dynamsoft Document Viewer to display
function Dynamsoft_OnPostTransferAsync(outputInfo){
    if(DWObject) {
        let index = DWObject.ImageIDToIndex(outputInfo.imageId);
        DWObject.ConvertToBlob(
            [index], 
            Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG, 
            function(blob){
                ddvDoc.loadSource(blob);
            }, 
            function(ec,es){
                console.log(es);
            }
        );
    }
}
```

Links to API Reference:

- Dynamic Web TWAIN:
    - [`OnPostTransferAsync`]({{site.info}}api/WebTwain_Acquire.html#onposttransferasync)
    - [`ImageIDToIndex()`]({{site.info}}api/WebTwain_Buffer.html#imageidtoindex)
    - [`ConvertToBlob()`]({{site.info}}api/WebTwain_IO.html#converttoblob)
- Dynamsoft Document Viewer:
    - [`loadSource()`](https://www.dynamsoft.com/document-viewer/docs/api/interface/idocument/index.html#loadsource)

#### 4.1.2 Use Dynamic Web TWAIN to Scan from Document Scanners

```javascript
function AcquireImage() {
    if (DWObject) {
        DWObject.SelectSourceAsync().then(function () {
            return DWObject.AcquireImageAsync({ 
                IfCloseSourceAfterAcquire: true 
            });
        }).catch(function (exp) {
            alert(exp.message);
        });
    }
}
```

Links to API Reference:
- Dynamic Web TWAIN:
    - [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync)
    - [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync)

### 4.2 Add  PDF Saving to Local Functionality

Use the Dynamsoft Document Viewer saveToPdf API to convert the scanned document to a PDF Blob, then use the Dynamic Web TWAIN saveBlob API to export the document to local as a PDF.

```javascript
const pdfSettings = {
   saveAnnotation: "annotation"  
};
function SavePDFs(){
    editViewer.currentDocument.saveToPdf(pdfSettings).then(function(blob){
        DWObject.IfShowFileDialog = true;
        DWObject.saveBlob("WebTWAINImage.pdf", blob).then(function () {
            console.log("OK");
        }).catch(function (err) {
            console.log(err);
        });
    });
}
```

Links to API Reference:
- Dynamic Web TWAIN:
    - [`IfShowFileDialog`]({{site.info}}api/WebTwain_IO.html#ifshowfiledialog)
    - [`saveBlob()`]({{site.info}}api/WebTwain_IO.html#saveblob)
- Dynamsoft Document Viewer:
    - [`saveToPdf()`](https://www.dynamsoft.com/document-viewer/docs/api/interface/idocument/index.html#savetopdf)

### 4.3 Add Server Upload Functionality

Use  the Dynamsoft Document Viewer saveToPdf API to convert the scanned document to a PDF Blob, then use the Dynamic Web TWAIN httpUploadBlob API to upload the document to the server as a PDF.
```javascript
// Can be discarded if already defined previously
const pdfSettings = {
   saveAnnotation: "annotation"  
};

function Upload(){
    editViewer.currentDocument.saveToPdf(pdfSettings).then(function(blob){
        let fileName = "WebTWAINImage.pdf";
        DWObject.httpUploadBlob(
            "https://demo.dynamsoft.com/sample-uploads/",
            blob,
            fileName
        ).then(function () {
            console.log("Upload successful.");
        }).catch(function (err) {
            console.log(err);
        });
    });
}
```

Links to related documentation:
- [`Uploading Images to the Server`](https://www.dynamsoft.com/web-twain/docs/getstarted/uploading.html)

Links to API Reference:
- Dynamic Web TWAIN:
    - [`httpUploadBlob()`]({{site.info}}api/WebTwain_IO.html#httpuploadblob)
- Dynamsoft Document Viewer:
    - [`saveToPdf()`](https://www.dynamsoft.com/document-viewer/docs/api/interface/idocument/index.html#savetopdf)

## Review the Complete Code

```html
<!DOCTYPE html>
<html>
<head>
    <title>HelloWorld</title>
    <script src=" https://cdn.jsdelivr.net/npm/dwt@latest/dist/dynamsoft.webtwain.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/dynamsoft-document-viewer@latest/dist/ddv.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/dynamsoft-document-viewer@latest/dist/ddv.css ">
</head>
<body>
    <input type="button" value="Scan" onclick="AcquireImage();" />
    <input type="button" value="Save PDF" onclick="SavePDFs();" />
    <input type="button" value="Upload" onclick="Upload();" /> <br/>
    <div id="container" style="height:580px; width: 1000px;"></div>
</body>
<script type="text/javascript">
let DWObject, editViewer, ddvDoc;
(async function(){
    // Dynamsoft Document Viewer
    // Public trial license which is valid for 24 hours
    // You can request a 30-day trial key from https://www.dynamsoft.com/customer/license/trialLicense/?product=dwtddv
    Dynamsoft.DDV.Core.license = "DLS2eyJvcmdhbml6YXRpb25JRCI6IjIwMDAwMSJ9";
    Dynamsoft.DDV.Core.engineResourcePath = "https://cdn.jsdelivr.net/npm/dynamsoft-document-viewer@latest/dist/engine";
    await Dynamsoft.DDV.Core.init(); 

    // Enable image filtering
    Dynamsoft.DDV.setProcessingHandler("imageFilter", new Dynamsoft.DDV.ImageFilter());
    // Create a Dynamsoft Document Viewer Edit Viewer to display and edit documents scanned with Dynamic Web TWAIN
    editViewer = new Dynamsoft.DDV.EditViewer({
        container: "container",
        uiConfig: Dynamsoft.DDV.getDefaultUiConfig("editViewer", {includeAnnotationSet: true})
    });

    // Create a Dynamsoft Document Viewer document to contain and display images scanned by Dynamic Web TWAIN
    ddvDoc = Dynamsoft.DDV.documentManager.createDocument({
        name: "ddvtestDoc"
    });

    // Open the document
    editViewer.openDocument(ddvDoc.uid);

    // Create Dynamic Web TWAIN object
    // Public trial license which is valid for 24 hours
    // You can request a 30-day trial key from https://www.dynamsoft.com/customer/license/trialLicense/?product=dwtddv
    Dynamsoft.DWT.UseDefaultViewer = false;
    Dynamsoft.DWT.ResourcesPath = "https://cdn.jsdelivr.net/npm/dwt@latest/dist";
    Dynamsoft.DWT.ProductKey = "DLS2eyJvcmdhbml6YXRpb25JRCI6IjIwMDAwMSJ9";
    // Create a Dynamic Web TWAIN instance without the built-in viewer
    Dynamsoft.DWT.CreateDWTObjectEx({
        WebTwainId: "dwtId",
    },function (object) {
        DWObject = object;
        // Call Dynamsoft_OnPostTransferAsync upon completion of every individual page scan
        DWObject.RegisterEvent("OnPostTransferAsync", Dynamsoft_OnPostTransferAsync);
    }, function (error) {
        console.log(error);
    });
})();

// Import scanned page into Dynamsoft Document Viewer to display
function Dynamsoft_OnPostTransferAsync(outputInfo){
    if(DWObject) {
        let index = DWObject.ImageIDToIndex(outputInfo.imageId);
        DWObject.ConvertToBlob(
            [index], 
            Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG, 
            function(blob){
                ddvDoc.loadSource(blob);
            },
            function(ec,es){
                console.log(es);
            }
        );
    }
}


// Scan with Dynamic Web TWAIN
function AcquireImage() {
    if (DWObject) {
        DWObject.SelectSourceAsync().then(function () {
            return DWObject.AcquireImageAsync({ 
                IfCloseSourceAfterAcquire: true 
            });
        }).catch(function (exp) {
            alert(exp.message);
        });
    }
}

const pdfSettings = {
   saveAnnotation: "annotation"  
};

function SavePDFs(){
    editViewer.currentDocument.saveToPdf(pdfSettings).then(function(blob){
        DWObject.IfShowFileDialog = true;
        DWObject.saveBlob("WebTWAINImage.pdf", blob).then(function () {
            console.log("OK");
        }).catch(function (err) {
            console.log(err);
        });
    });
}

function Upload(){
    editViewer.currentDocument.saveToPdf(pdfSettings).then(function(blob){
        let fileName = "WebTWAINImage.pdf";
        DWObject.httpUploadBlob(
            "https://demo.dynamsoft.com/sample-uploads/",
            blob,
            fileName
        ).then(function () {
            console.log("Upload successful.");
        }).catch(function (err) {
            console.log(err);
        });
    });
}

</script>
</html>

```

## Run the Web Application

![Flow chart for Dynamic Web TWAIN with Annotations – Hello World](/assets/imgs/dwt-ddv-helloworld.png)

## Further Reading

- [`Use the API to edit images within the control`](https://www.dynamsoft.com/document-viewer/docs/features/viewers/editviewer.html#edit-pages)
- [`Use the API to delete or switch images within the control`](https://www.dynamsoft.com/document-viewer/docs/api/interface/idocument/index.html#members)
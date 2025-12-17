---
layout: default-layout
needAutoGenerateSidebar: true
needGenerateH3Content: true
noTitleIndex: true
title: Dynamic Web TWAIN SDK Features - OCR
keywords: Dynamic Web TWAIN, Documentation, OCR
breadcrumbText: OCR
description: Dynamic Web TWAIN SDK Documentation OCR Page
---

# OCR

Dynamic Web TWAIN provides an OCR add-on to extract text from scanned images. It utilizes the latest deep learning techniques and delivers high accuracy. All processing occurs locally on end-user devices, with no data uploaded to cloud servers.

Read on to learn about how to use it.

## Requirements

* Windows 10 versions >= 1809 and all versions of Windows 11
* A license with the OCR module ([contact support to get a 30-day trial license](mailto:support@dynamsoft.com))
* [DynamicWebTWAINOCRResources.zip](https://download2.dynamsoft.com/dwt/DynamicWebTWAINOCRResources.zip)

## Online Demo

You can visit the [online demo](https://demo.dynamsoft.com/Samples/dwt/OCR/index.html) to try it.

## How to Use

### Step One - Install the OCR Package

Download [DynamicWebTWAINOCRResources.zip](https://download2.dynamsoft.com/dwt/DynamicWebTWAINOCRResources.zip), unzip it and run `Install.cmd` inside the `DynamicWebTWAINOCRPack.zip` file as admin to install the OCR package.

It will copy an `ocr` folder to Dynamic Web TWAIN Service's [installation folder](/_articles/extended-usage/dynamsoft-service-configuration.md#installation-folder). The `ocr` folder contains the runtime and model files that are required to perform on-device OCR.


> [!NOTE]
> * You need to [install Dynamic Web TWAIN Service](/_articles/extended-usage/dynamsoft-service-configuration.md#installation-of-dynamic-web-twain-service) beforehand.
> * Since only Windows is supported for now, you have to do this on a Windows client for testing.



### Step Two - Write a Basic Document Scanning Page

Create a HTML file with the following content. It can scan documents from scanners as well as loading local images.

```html
<!DOCTYPE html>
<html>
<head>
  <title>Dynamic Web TWAIN - OCR Demo</title>
  <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
  <script src="Resources/dynamsoft.webtwain.config.js"></script>
  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
  <style>
    #dwtcontrolContainer {
      margin-top: 20px;
      width: 320px;
      height: 400px;
      border: 1px solid #ccc;
    }

    .container {
      display: flex;
      gap: 20px;
    }
  </style>
</head>
<body>
  <div>
    <div>Input: </div>
    <input type="button" value="Scan" onclick="AcquireImage();" />
    <input type="button" value="Load Image" onclick="LoadImage();" />
  </div>

  <div class="container">
    <div id="dwtcontrolContainer"></div>
  </div>
  
  <script type="text/javascript">
    var DWTObject;
    Dynamsoft.DWT.ProductKey = "DLS2eyJvcmdhbml6YXRpb25JRCI6IjIwMDAwMSJ9"; //one-day trial license
    Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
      DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
      DWTObject.Viewer.width = "100%";
      DWTObject.Viewer.height = "100%";
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

    function LoadImage(){
      DWTObject.IfShowFileDialog = true; //"Open File" dialog will be opened.
      DWTObject.LoadImageEx(
          "", //file name can be empty if "Open File" dialog is called.
          Dynamsoft.DWT.EnumDWT_ImageType.IT_ALL,
          function () {
              console.log("success");
          },
          function (errorCode, errorString) {
              console.log(errorString);
          },
      );
    }
  </script>
</body>
</html>
```

PS: You can find where the resources files are in this [FAQ](/_articles/faq/what-are-the-resources-files.md).

### Step Three - Include the Add-on

Reference the add-on's JavaScript with the following code. You can find the file in `DynamicWebTWAINOCRResources.zip`.

> If you are using the [npm package](https://www.npmjs.com/package/dwt), the OCR is already included in the main JavaScript file (`dynamsoft.webtwain.min.js` or `dynamsoft.webtwain.min.mjs`), which means you can skip this step.

```html
<script src="dynamsoft.webtwain.addon.ocrkit.js"></script>
```

Then, you can run the following to check if it is installed correctly:

```js
async function CheckIsOCRInstalled(){
  try {
    let info = await DWTObject.Addon.OCRKit.GetInstalledOCRInfo();
    console.log(info);
    if (info.version) {
      return true;
    }
  } catch (error) {
    alert(error.message);
    return false;
  }
  alert("OCR Add-on is not installed. Please install it to use OCR features.");
  return false;
}
```

APIs used:

[`GetInstalledOCRInfo()`](/_articles/info/api/Addon_OCR.md#getinstalledocrinfo)

### Step Four - Detect Page Orientation

This is an optional step. If the scanned document is rotated, we can detect its orientation and rotate it.

```js
async function CorrectOrientationForOne(index){
  let result = await DWTObject.Addon.OCRKit.DetectPageOrientation(index);
  if (result.angle != 0) {
    DWTObject.Rotate(index,-result.angle,true);
  }
}
```

APIs used:

- [`DetectPageOrientation()`](/_articles/info/api/Addon_OCR.md#detectpageorientation)
- [`Rotate()`](/_articles/info/api/WebTwain_Edit.md#rotate)

### Step Five - Recognize Text

Recognize the text in one image and print it in a `pre` element.

```html
<pre id="result"></pre>
<script>
async function RecognizeOnePage(index){
  let result = await DWTObject.Addon.OCRKit.Recognize(index);
  PrettyPrintResult(result);
}

function PrettyPrintResult(result){
  let prettyResult = "";
  result.blocks.forEach(block => {
    block.lines.forEach(line => {
      line.words.forEach(word => {
        prettyResult += word.value + " ";
      });
      prettyResult += "\n";
    });
    prettyResult += "\n";
  });
  document.getElementById("result").innerText = prettyResult;
}
</script>
```

APIs used:

[`Recognize()`](/_articles/info/api/Addon_OCR.md#recognize)

### Step Six - Save as PDF

After recognition, we can save the OCR results and images as a PDF file. It will add an invisible text layer above the original content so that the text becomes selectable and searchable.

```js
let indicesOfAll = DWTObject.SelectAllImages();
await DWTObject.Addon.OCRKit.SaveToPath(indicesOfAll,Dynamsoft.DWT.EnumDWT_OCRKitOutputFormat.PDF_WITH_EXTRA_TEXTLAYER,"output.pdf");
```

APIs used:

[`SaveToPath()`](/_articles/info/api/Addon_OCR.md#savetopath)

### Step Seven - Review the Complete Code

Here is the complete code of the demo.

```html
<!DOCTYPE html>
<html>
<head>
  <title>Dynamic Web TWAIN - OCR Demo</title>
  <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
  <script src="Resources/dynamsoft.webtwain.config.js"></script>
  <script src="dynamsoft.webtwain.addon.ocrkit.js"></script>
  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
  <style>
    #dwtcontrolContainer {
      margin-top: 20px;
      width: 320px;
      height: 400px;
      border: 1px solid #ccc;
    }
    #result {
      margin-top: 20px;
      padding: 10px;
      width: 300px;
      height: 380px;
      border: 1px solid #ccc;
      background-color: #f9f9f9;
      white-space: pre-wrap;
      overflow: auto;
    }
    .container {
      display: flex;
      gap: 20px;
    }
  </style>
</head>
<body>
  <div>
    <div>Input: </div>
    <input type="button" value="Scan" onclick="AcquireImage();" />
    <input type="button" value="Load Image" onclick="LoadImage();" />
  </div>
  <div>
    <div>Processing:</div>
    <input type="button" value="Correct Orientation" onclick="CorrectOrientation();" />
    <input type="button" value="Recognize Text" onclick="Recognize();" />
    <label>
      Language:
      <select id="language">
        <option value="en">English</option>
        <option value="fr">French</option>
        <option value="es">Spanish</option>
        <option value="de">German</option>
        <option value="it">Italian</option>
        <option value="pt">Portuguese</option>
      </select>
    </label>
    <label>
      Target:
      <select id="processingTarget">
        <option value="current">Current Image</option>
        <option value="all">All Images</option>
      </select>
    </label>
  </div>
  <div>
    <div>Output:</div>
    <input type="button" value="Save as PDF" onclick="SaveAsPDF();" />
    <label>Option:
      <select id="outputFormat">
        <option value="extralayer">With Extra Text Layer</option>
        <option value="plaintext">Plain Text</option>
      </select>
    </label>
  </div>

  <div class="container">
    <div id="dwtcontrolContainer"></div>
    <pre id="result"></pre>
  </div>
  
  <script type="text/javascript">
    var DWTObject;
    var storedOCRResults = {};

    Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
      DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
      DWTObject.Viewer.width = "100%";
      DWTObject.Viewer.height = "100%";
      CheckIsOCRInstalled();
      DWTObject.RegisterEvent('OnBufferChanged',
        function (bufferChangeInfo) {
          console.log('Buffer changed: ', bufferChangeInfo);
          if (DWTObject.CurrentImageIndexInBuffer != -1) {
            let imageID = DWTObject.IndexToImageID(DWTObject.CurrentImageIndexInBuffer);
            if (imageID in storedOCRResults) {
              PrettyPrintResult(storedOCRResults[imageID]);
            } else {
              document.getElementById("result").innerText = "";
            }
          }
        }
      )
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

    function LoadImage(){
      DWTObject.IfShowFileDialog = true; //"Open File" dialog will be opened.
      DWTObject.LoadImageEx(
          "", //file name can be empty if "Open File" dialog is called.
          Dynamsoft.DWT.EnumDWT_ImageType.IT_ALL,
          function () {
              console.log("success");
          },
          function (errorCode, errorString) {
              console.log(errorString);
          },
      );
    }

    async function CorrectOrientation() {
      if (DWTObject) {
        if (document.getElementById("processingTarget").value === "all") {
          let count = DWTObject.HowManyImagesInBuffer;
          for (let i = 0; i < count; i++) {
            DWTObject.SelectImages([i])
            await CorrectOrientationForOne(i);
          }
          return;
        }else{
          if (DWTObject.CurrentImageIndexInBuffer != -1) {
            await CorrectOrientationForOne(DWTObject.CurrentImageIndexInBuffer);
          }
        }
      }
    }

    async function CorrectOrientationForOne(index){
      let result = await DWTObject.Addon.OCRKit.DetectPageOrientation(index);
      console.log(result);
      if (result.angle != 0) {
        DWTObject.Rotate(index,-result.angle,true);
      }
    }

    async function Recognize() {
      if (DWTObject) {
        if (document.getElementById("processingTarget").value === "all") {
          let count = DWTObject.HowManyImagesInBuffer;
          for (let i = 0; i < count; i++) {
            DWTObject.SelectImages([i])
            await RecognizeOnePage(i);
          }
          return;
        }else{
          if (DWTObject.CurrentImageIndexInBuffer != -1) {
            await RecognizeOnePage(DWTObject.CurrentImageIndexInBuffer);
          }
        }
      }
    }

    async function RecognizeOnePage(index){
      let language = document.getElementById("language").value;
      let result = await DWTObject.Addon.OCRKit.Recognize(index,{settings:{language:language}});
      console.log(result);
      storedOCRResults[result.imageID] = result;
      PrettyPrintResult(result);
    }

    function PrettyPrintResult(result){
      let prettyResult = "";
      result.blocks.forEach(block => {
        block.lines.forEach(line => {
          line.words.forEach(word => {
            prettyResult += word.value + " ";
          });
          prettyResult += "\n";
        });
        prettyResult += "\n";
      });
      document.getElementById("result").innerText = prettyResult;
    }

    async function CheckIsOCRInstalled(){
      try {
        let info = await DWTObject.Addon.OCRKit.GetInstalledOCRInfo();
        console.log(info);
        if (info.version) {
          return true;
        }
      } catch (error) {
        alert(error.message);
        return false;
      }
      alert("OCR Add-on is not installed. Please install it to use OCR features.");
      return false;
    }

    async function SaveAsPDF(){
      try {
        let format = document.getElementById('outputFormat').value;
        if(format === "extralayer"){
          await DWTObject.Addon.OCRKit.SaveToPath(DWTObject.SelectAllImages(),Dynamsoft.DWT.EnumDWT_OCRKitOutputFormat.PDF_WITH_EXTRA_TEXTLAYER,"output.pdf");
        }else{
          await DWTObject.Addon.OCRKit.SaveToPath(DWTObject.SelectAllImages(),Dynamsoft.DWT.EnumDWT_OCRKitOutputFormat.PDF_PLAIN_TEXT,"output.pdf");
        }  
      } catch (error) {
        alert(error.message);
      }
    }
  </script>
</body>
</html>
```

This complete code is different from the [online demo](#online-demo)'s code, which supports regional OCR. You can find the code for the online demo [here](https://download2.dynamsoft.com/Samples/DWT/Scan-Documents-and-Do-OCR.zip).

## FAQ

### What Languages are Supported?

The OCR add-on supports multiple languages including English, French, Spanish, German, Italian, and Portuguese.

Contact [support](mailto:support@dynamsoft.com) if you need to OCR documents in other languages.

### What are the Hardware Requirements?

The OCR add-on requires a 64-bit operating system and at least 4GB of RAM for optimal performance.

### Can I Limit the Region for OCR?

Yes. You can specify which regions for OCR using the `rects` option of the [`recognize()`](/_articles/info/api/Addon_OCR.md#recognize) function.

### Will My Document be Uploaded to a Remote Server?

No. The OCR process happens locally on your machine. No data is sent to any remote servers. Also, we do not collect data for training AI.

### What is Searchable PDF?

A searchable PDF is a type of PDF file where the text content is recognized by a computer. This means you can use the Find function (usually Ctrl+F or Cmd+F) to search for specific words or phrases within the document, just like you would on a webpage or in a Word document. 

The OCR add-on supports two kinds of searchable PDF output.

* Plain-text PDF, which will only keep a text layer of the OCRed text for each page.
* Extra-text-layer PDF, which will add an extra invisible text layer of the OCRed text above each page.

### What are OCR Basic and OCR Pro?

OCR Basic and OCR Pro are previous OCR add-ons, which are deprecated in v16.2. But they are still usable in the latest version.

To differentiate from previous versions, the new OCR added since v19.3 uses `OCRKit` as the namespace.

### Why I Cannot Load Saved PDF Files

The searchable PDF saved has a text layer. You need to use [PDF Rasterizer](/_articles/info/api/Addon_PDF.md) to load it. A PDF Rasterizer license is required.


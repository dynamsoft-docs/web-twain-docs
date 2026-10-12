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

Dynamic Web TWAIN provides an OCR add-on to extract text from scanned images. It utilizes the system's built-in OCR or a custom OCR based on ONNX runtime. All processing occurs locally on end-user devices, with no data uploaded to cloud servers.

It is free to use with the core license module.

Read on to learn about how to use it.

## Online Demo

You can visit the [online demo](https://demo.dynamsoft.com/Samples/dwt/OCR/index.html) ([source code](https://download2.dynamsoft.com/Samples/DWT/Scan-Documents-and-Do-OCR.zip)) to try it.

## Engines

The OCR add-on has several engines to use.

* Windows.Media.Ocr: The built-in OCR for Windows since Windows 10 10240.
* Apple.Vision: The built-in OCR for macOS since macOS 10.15.
* Onnx.Ocr: A custom OCR based on ONNX runtime. It provides higher latin recognition accuracy and can detect page orientations. It is only supported on Windows 10+.

### Installation

Windows.Media.Ocr and Apple.Vision can be used without any extra installation. For Windows.Media.Ocr, if the OCR model for a specific language does not exist by default, you need to install the language pack of that language in system settings.

Onnx.Ocr needs extra installation. Download [DynamicWebTWAINOCRPack.zip](https://download2.dynamsoft.com/dwt/DynamicWebTWAINOCRPack.zip), unzip it and run `Install.cmd` file as admin to install the OCR package. It will copy extra runtime and models files to the `ocr` folder of Dynamic Web TWAIN Service's [installation folder](/_articles/extended-usage/dynamsoft-service-configuration.md#installation-folder).

### Supported Languages

| Language | Windows.Media.Ocr | Apple.Vision | Onnx.Ocr |
| :--- | :--- | :--- | :--- |
| English | Supported | Supported | Supported |
| French | Supported | Supported | Supported |
| Italian | Supported | Supported | Supported |
| Spanish | Supported | Supported | Supported |
| German | Supported | Supported | Supported |
| Portuguese | Supported | Supported | Supported |
| Czech | Supported | Supported | Unsupported |
| Polish | Supported | Supported | Unsupported |
| Dutch | Supported | Supported | Unsupported |
| Norwegian | Supported | Supported | Unsupported |
| Finnish | Supported | Supported | Unsupported |
| Danish | Supported | Supported | Unsupported |
| Simplified Chinese | Supported | Supported | Unsupported |
| Traditional Chinese | Supported | Supported | Unsupported |
| Japanese | Supported | Supported | Unsupported |
| Korean | Supported | Supported | Unsupported |
| Arabic | Supported | Supported | Unsupported |
| Russian | Supported | Supported | Unsupported |
| Ukrainian | Unsupported | Supported | Unsupported |
| Thai | Unsupported | Supported | Unsupported |
| Vietnamese | Unsupported | Supported | Unsupported |
| Turkish | Unsupported | Supported | Unsupported |
| Indonesian | Unsupported | Supported | Unsupported |
| Malay | Unsupported | Supported | Unsupported |
| Romanian | Unsupported | Supported | Unsupported |
| Swedish | Unsupported | Supported | Unsupported |
| Hindi | Unsupported | Supported | Unsupported |
| Marathi | Unsupported | Supported | Unsupported |
| Cantonese | Unsupported | Supported | Unsupported |

Apple.Vision may support fewer languages on an old version of macOS. The table lists the supported languages on macOS 26.

## How to Use

Suppose you've already have a working html file using Dynamic Web TWAIN to scan documents. For example, the [hello world demo](/_articles/hello-world/index.md). Let's add the OCR function to it with the following steps.

### Step One - Include the Add-on

Reference the add-on's JavaScript with the following code.

> If you are using the [npm package](https://www.npmjs.com/package/dwt), the OCR is already included in the main JavaScript file (`dynamsoft.webtwain.min.js` or `dynamsoft.webtwain.min.mjs`), which means you can skip this step.

```html
<script src="Resources/addon/dynamsoft.webtwain.addon.ocrconnector.js"></script>
```

Then, you can run the following to get info of the installed OCR engines and list them in `select` elements:

```html
<label>
  Engine:
  <select id="engine" onchange="listLanguagesOfSelectedEngine();">
  </select>
</label>
<label>
  Language:
  <select id="language"">
  </select>
</label>
<script>
async function GetInstalledOCRInfo(){
  try {
    let info = await DWTObject.Addon.OCRConnector.GetInstalledOCRInfo();
    console.log(info);
  } catch (error) {
    alert(error.message);
  }
}

function listEngines(){
  let select = document.getElementById("engine");
  select.innerHTML = "";
  ocrInfo.engines.forEach(function (engine) {
    let option = document.createElement("option");
    option.value = engine.name;
    option.text = engine.name;
    select.add(option);
  });
  listLanguagesOfSelectedEngine(select.value);
}

function listLanguagesOfSelectedEngine(engine) {
  let select = document.getElementById("language");
  select.innerHTML = "";
  let info = ocrInfo.engines.find(function (e) { return e.name === engine; });
  info.languages.forEach(function (language) {
    let option = document.createElement("option");
    option.value = language;
    option.text = language;
    select.add(option);
  });
}
</script>
```

APIs used:

[`GetInstalledOCRInfo()`](/_articles/info/api/Addon_OCR.md#getinstalledocrinfo)

### Step Two - Detect Page Orientation

This is an optional step. If the scanned document is rotated, we can detect its orientation and rotate it. The Onnx.Ocr is required for this operation.

```js
async function CorrectOrientationForOne(index){
  let result = await DWTObject.Addon.OCRConnector.DetectPageOrientation(index);
  if (result.angle != 0) {
    DWTObject.Rotate(index,-result.angle,true);
  }
}
```

APIs used:

- [`DetectPageOrientation()`](/_articles/info/api/Addon_OCR.md#detectpageorientation)
- [`Rotate()`](/_articles/info/api/WebTwain_Edit.md#rotate)

### Step Three - Recognize Text

Recognize the text in one image with the selected engine and the selected language, and print it in a `pre` element.

```html
<pre id="result"></pre>
<script>
async function RecognizeOnePage(index){
  let engine = document.getElementById("engine").value;
  let language = document.getElementById("language").value;
  let result = await DWTObject.Addon.OCRConnector.Recognize(index,{
    engine:{name:engine},
    settings:{language:language}
  });
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

### Step Four - Save as PDF

After recognition, we can save the OCR results and images as a PDF file. It will add an invisible text layer above the original content so that the text becomes selectable and searchable.

```js
let indicesOfAll = DWTObject.SelectAllImages();
await DWTObject.Addon.OCRKit.SaveToPath(indicesOfAll,Dynamsoft.DWT.EnumDWT_OCRKitOutputFormat.PDF_WITH_EXTRA_TEXTLAYER,"output.pdf");
```

APIs used:

[`SaveToPath()`](/_articles/info/api/Addon_OCR.md#savetopath)

### Step Five - Review the Complete Code

Here is the complete code of the demo.

```html
<!DOCTYPE html>
<html>
<head>
  <title>Dynamic Web TWAIN - OCR Demo</title>
  <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
  <script src="Resources/dynamsoft.webtwain.config.js"></script>
  <script src="Resources/addon/dynamsoft.webtwain.addon.ocrconnector.js"></script>
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
      Engine:
      <select id="engine" onchange="listLanguagesOfSelectedEngine();">
      </select>
    </label>
    <label>
      Language:
      <select id="language" onchange="ApplyResultDirection();">
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
    var ocrInfo;

    Dynamsoft.DWT.ProductKey = "DLS2eyJvcmdhbml6YXRpb25JRCI6IjIwMDAwMSJ9"; //one-day trial license
    Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
      DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
      DWTObject.Viewer.width = "100%";
      DWTObject.Viewer.height = "100%";
      GetInstalledOCRInfo();
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
      try {
        let result = await DWTObject.Addon.OCRConnector.DetectPageOrientation(index);
        console.log(result);
        if (result.angle != 0) {
          DWTObject.Rotate(index,-result.angle,true);
        }
      }catch(error) {
        alert(error.message);
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
      let engine = document.getElementById("engine").value;
      let language = document.getElementById("language").value;
      let result = await DWTObject.Addon.OCRConnector.Recognize(index,{
        engine:{name:engine},
        settings:{language:language}
      });
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
      ApplyResultDirection();
    }

    var RTL_LANGUAGES = [
      "ar", "he"
    ];

    function isRtlLanguage(language) {
      if (!language) {
        return false;
      }
      let value = language.trim().toLowerCase();
      return RTL_LANGUAGES.some(function (lang) {
        return value === lang || new RegExp("^" + lang + "(?![a-z])").test(value);
      });
    }

    function ApplyResultDirection() {
      let resultEl = document.getElementById("result");
      let language = document.getElementById("language").value;
      resultEl.style.direction = isRtlLanguage(language) ? "rtl" : "";
    }

    async function GetInstalledOCRInfo(){
      try {
        ocrInfo = await DWTObject.Addon.OCRConnector.GetInstalledOCRInfo();
        listEngines();
      } catch (error) {
        alert(error.message);
      }
    }
    
    function listEngines(){
      let select = document.getElementById("engine");
      select.innerHTML = "";
      ocrInfo.engines.forEach(function (engine) {
        let option = document.createElement("option");
        option.value = engine.name;
        option.text = engine.name;
        select.add(option);
      });
      listLanguagesOfSelectedEngine(select.value);
    }

    function listLanguagesOfSelectedEngine(engine) {
      let select = document.getElementById("language");
      select.innerHTML = "";
      let info = ocrInfo.engines.find(function (e) { return e.name === engine; });
      info.languages.forEach(function (language) {
        let option = document.createElement("option");
        option.value = language;
        option.text = language;
        select.add(option);
      });
    }

    async function SaveAsPDF(){
      try {
        let format = document.getElementById('outputFormat').value;
        if(format === "extralayer"){
          await DWTObject.Addon.OCRConnector.SaveToPath(DWTObject.SelectAllImages(),Dynamsoft.DWT.EnumDWT_OCRConnectorOutputFormat.PDF_WITH_EXTRA_TEXTLAYER,"output.pdf");
        }else{
          await DWTObject.Addon.OCRConnector.SaveToPath(DWTObject.SelectAllImages(),Dynamsoft.DWT.EnumDWT_OCRConnectorOutputFormat.PDF_PLAIN_TEXT,"output.pdf");
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

To differentiate from previous versions, the new OCR added in v19.3 used `OCRKit` as the namespace and later changed `OCRKit` to `OCRConnector` in v19.5.

### Why I Cannot Load Saved PDF Files

The searchable PDF saved has a text layer. You need to use [PDF Rasterizer](/_articles/info/api/Addon_PDF.md) to load it. A PDF Rasterizer license is required.


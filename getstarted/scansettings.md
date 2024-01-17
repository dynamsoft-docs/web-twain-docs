---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Getting Started - Setting Scan Parameters
keywords: Dynamic Web TWAIN, Documentation, Hello World, upload, helloworld
breadcrumbText: Uploading documents
description: Dynamic Web TWAIN SDK Documentation - First Upload
permalink: /getstarted/scansettings.html
---

# Setting Scan Parameters

<div class='blockquote-note'></div>
> This article is part of our HelloWorld series. If you have not already reviewed HelloWorld, please start [here]({{site.getstarted}}helloworld.html)

There are various settings you can specify to control your scan parameters to ensure that your incoming images are all uniform. To achieve this, you will need to modify the parameters of `AcquireImage()` in the HelloWorld application.

## Disabling the Scanner's built in UI

Showing the scanner interface will cause the the scanner driver to override any scan settings you designate via JSON by the settings that are defined in the scanner UI. To ensure the settings take effect, you will need to disable the scanner interface during the scan process.

### Disable the Scanner's UI via JSON

Add `IfShowUI: false` to the JSON in `AcquireImageAsync()` in `AcquireImage()`.

```js
function AcquireImage() {
    if (DWObject) {
        DWObject.SelectSourceAsync()
            .then(() => DWObject.AcquireImageAsync({
                IfDisableSourceAfterAcquire: true,
                IfShowUI: false,
            }))
            .then(result => console.log(result))
            .catch(exp => console.error(exp.message))
            .finally(() => DWObject.CloseSourceAsync().catch(e => console.error(e)));
    }
}
```

Links to API Reference:

- [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync){:target="_blank" rel="noreferrer noopener"}
- [`IfDisableSourceAfterAcquire`]({{site.info}}api/WebTwain_Acquire.html#ifdisablesourceafteracquire){:target="_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync){:target="_blank" rel="noreferrer noopener"}
- [`IfDisableSourceAfterAcquire`]({{site.info}}api/WebTwain_Acquire.html#ifdisablesourceafteracquire){:target="_blank" rel="noreferrer noopener"}
- [`IfShowUI`]({{site.info}}api/WebTwain_Acquire.html#ifshowui){:target="_blank" rel="noreferrer noopener"}
- [`CloseSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourceasync){:target="_blank" rel="noreferrer noopener"}

## Add the scan parameters to the JSON

For this example, you will be setting the scan `PixelType` (also known as colourspace) to grayscale, and setting the scan `Resolution` to 150DPI.

### Modify the `AcquireImage()` parameters

Add `PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY` and `Resolution:150` to your JSON.

```js
function AcquireImage() {
    if (DWObject) {
        DWObject.SelectSourceAsync()
            .then(() => DWObject.AcquireImageAsync({
                IfDisableSourceAfterAcquire: true,
                IfShowUI: false,
                PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,
                Resolution: 150,
            }))
            .then(result => console.log(result))
            .catch(exp => console.error(exp.message))
            .finally(() => DWObject.CloseSourceAsync().catch(e => console.error(e)));
    }
}
```

Links to API Reference:

- [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync){:target="_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync){:target="_blank" rel="noreferrer noopener"}
- [`IfShowUI`]({{site.info}}api/WebTwain_Acquire.html#ifshowui){:target="_blank" rel="noreferrer noopener"}
- [`IfDisableSourceAfterAcquire`]({{site.info}}api/WebTwain_Acquire.html#ifdisablesourceafteracquire){:target="_blank" rel="noreferrer noopener"}
- [`PixelType`]({{site.info}}api/WebTwain_Acquire.html#pixeltype){:target="_blank" rel="noreferrer noopener"}
- [`Resolution`]({{site.info}}api/WebTwain_Acquire.html#resolution){:target="_blank" rel="noreferrer noopener"}
- [`CloseSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourceasync){:target="_blank" rel="noreferrer noopener"}


## Review the completed code

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
        var DWObject;

        function Dynamsoft_OnReady() {
            DWObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
        }

        function AcquireImage() {
            if (DWObject) {
                DWObject.SelectSourceAsync()
                    .then(() => DWObject.AcquireImageAsync({ 
                        IfDisableSourceAfterAcquire: true,
                        IfShowUI: false,
                        PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,
                        Resolution: 150,
                        }))
                    .then(result => console.log(result))
                    .catch(exp => console.error(exp.message))
                    .finally(() => DWObject.CloseSourceAsync().catch(e => console.error(e)));
            }
        }
        function Upload() {
            if (DWObject && DWObject.HowManyImagesInBuffer > 0) {
                var strUrl = "https://demo.dynamsoft.com/sample-uploads/";
                var aryIndex = [DWObject.CurrentImageIndexInBuffer];
                DWObject.HTTPUpload(strUrl, aryIndex, Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
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

![HelloWorld-Scan-1]({{site.assets}}imgs\HelloWorldScanSetting1.png)

### Press the Scan button

### View the scan

With the added parameters, you should receive a grayscale image

![HelloWorld-Scan-2]({{site.assets}}imgs\HelloWorldScanSetting2.png)

# Previous Articles

If you need a refresher on setting up the base project, please review [HelloWorld]({{site.getstarted}}hellowworld.html).

The previous article of [uploading images to the server]({{site.getstarted}}uploading.html) still applies, and you can apply the same concepts to the new upload process.

# Next article

The next thing to learn is how explore [editing images]({{site.getstarted}}editing.html).
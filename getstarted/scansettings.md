---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK HelloWorld - Setting Scan Settings
keywords: Dynamic Web TWAIN, Documentation, Hello World, upload, helloworld
breadcrumbText: Scan settings
description: Dynamic Web TWAIN SDK HelloWorld - Setting Scan Settings
permalink: /getstarted/scansettings.html
---

# Setting Scan Settings

<!-- <div class='blockquote-note'></div>
> This article is part of our HelloWorld series. If you have not already reviewed HelloWorld, please start [here]({{site.getstarted}}helloworld.html). -->

There are various settings you can specify to control your scan parameters to ensure that your incoming images are all uniform. To achieve this, you will need to modify the parameters of `AcquireImage()` in the HelloWorld application.

## Add Scan parameters to the JSON

### Disable the Scanner's UI via JSON
Showing the scanner interface will cause the the scanner driver to override any scan settings you designate via JSON by the settings that are defined in the scanner UI. To ensure the settings take effect, you will need to disable the scanner interface during the scan process.

Add `IfShowUI: false` to the JSON in `AcquireImageAsync()` in `AcquireImage()`.

```js
function AcquireImage() {
    if (DWObject) {
        DWObject.SelectSourceAsync().then(function () {
            return DWObject.AcquireImageAsync({ 
                IfCloseSourceAfterAcquire: true,
                IfShowUI: false,
            });
        }).catch(function (exp) {
            alert(exp.message);
        });
    }
}
```

Links to API Reference:

- [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync){:target="_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync){:target="_blank" rel="noreferrer noopener"}
- [`IfCloseSourceAfterAcquire`]({{site.info}}api/Device.html#deviceobjectacquireimage){:target="_blank" rel="noreferrer noopener"}
- [`IfShowUI`]({{site.info}}api/WebTwain_Acquire.html#ifshowui){:target="_blank" rel="noreferrer noopener"}

### Add the scan parameters to the JSON

For this example, you will be setting the scan `PixelType` (also known as colourspace) to grayscale, and setting the scan `Resolution` to 150DPI.

Add `PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY` and `Resolution:150` to your JSON.

```js
function AcquireImage() {
    if (DWObject) {
        DWObject.SelectSourceAsync().then(function () {
            return DWObject.AcquireImageAsync({ 
                IfCloseSourceAfterAcquire: true,
                IfShowUI: false,
                PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,
                Resolution: 150,
            });
        }).catch(function (exp) {
            alert(exp.message);
        });
    }
}
```

Links to API Reference:

- [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync){:target="_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync){:target="_blank" rel="noreferrer noopener"}
- [`IfCloseSourceAfterAcquire`]({{site.info}}api/Device.html#deviceobjectacquireimage){:target="_blank" rel="noreferrer noopener"}
- [`IfShowUI`]({{site.info}}api/WebTwain_Acquire.html#ifshowui){:target="_blank" rel="noreferrer noopener"}
- [`PixelType`]({{site.info}}api/WebTwain_Acquire.html#pixeltype){:target="_blank" rel="noreferrer noopener"}
- [`Dynamsoft.DWT.EnumDWT_PixelType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_pixeltype){:target="_blank" rel="noreferrer noopener"}
- [`Resolution`]({{site.info}}api/WebTwain_Acquire.html#resolution){:target="_blank" rel="noreferrer noopener"}


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
        var DWObject;

        function Dynamsoft_OnReady() {
            DWObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
        }

        function AcquireImage() {
            if (DWObject) {
                DWObject.SelectSourceAsync().then(function () {
                    return DWObject.AcquireImageAsync({ 
                        IfCloseSourceAfterAcquire: true,
                        IfShowUI: false,
                        PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,
                        Resolution: 150,
                    });
                }).catch(function (exp) {
                    alert(exp.message);
                });
            }
        }

        function Upload() {
            if (DWObject && DWObject.HowManyImagesInBuffer > 0) {
                var strUrl = "https://demo.dynamsoft.com/sample-uploads/";
                var imgAry = [DWObject.CurrentImageIndexInBuffer];
                DWObject.HTTPUpload(strUrl, imgAry, Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
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

If you need a refresher on setting up the base project, please review [initalizing the environment]({{site.getstarted}}initialize.html).

If you have yet to acquire the image from the scaner, please review [scanning an image]({{site.getstarted}}scanning.html).

If this scan is all that you need, you can review [uploading images to the server]({{site.getstarted}}uploading.html).

# Next article

The next thing to learn is how explore [editing images]({{site.getstarted}}editing.html).
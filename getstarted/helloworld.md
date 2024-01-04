---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Getting Started - Hello World
keywords: Dynamic Web TWAIN, Documentation, Hello World
breadcrumbText: Hello World
description: Dynamic Web TWAIN SDK Documentation Hello World Page
permalink: /getstarted/helloworld.html
---

# HelloWorld

> Before you start, please make sure you have downloaded and installed the latest version of Dynamic Web TWAIN SDK. If you have not yet done so, you can download the SDK with a 30-day free trial from [here](https://www.dynamsoft.com/Downloads/WebTWAIN_Download.aspx).

This guide will help you create your first browser-based scanning application using DWT in just a few minutes! 

If you would like to follow a video guide of HelloWorld, you can check out the video on [YouTube](https://www.youtube.com/watch?v=qShti9aVfLU){:target="_blank"}

## Create a web application
<!-- Updated helloworld.html to HelloWorld.html to match the screenshot -->

Create a `HelloWorld.html` anywhere and copy the `Resources` folder to the same location. You can typically find the `Resources` folder in `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN SDK {Version Number}\`.

* Resources

  ![Build-the-Hello-World-Scan-Page-1]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-1.png)  <!-- TODO: Update screenshot for v18 SDK -->


* The project

  ![Build-the-Hello-World-Scan-Page-2]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-2.png)


## Include the library

Embed the script of the library and add a `div` element for the library on the page.

``` html
<script src="Resources/dynamsoft.webtwain.initiate.js"></script>
<script src="Resources/dynamsoft.webtwain.config.js"></script>
```

``` html
<div id="dwtcontrolContainer"></div>
```

> `dwtcontrolContainer` is the default id for the div in the default DWT resources, and any of the Dynamsoft provided demos. If you would like to use a different id for this div, you will need to change `Dynamsoft.DWT.Containers` in the file `dynamsoft.webtwain.config.js` to match.

## Add simple scanning functionality

Now that we have our scripts included in the application, we will have to write the code to use the DWT library.

### Add a Scan button in HTML

``` html
<input type="button" value="Scan" onclick="AcquireImage();" />
```

### Add code to initiate scanning from a document scanner


```html
<script type="text/javascript">
    var DWObject;

    function Dynamsoft_OnReady() {
        DWObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
    }

    function AcquireImage() {
        if (DWObject) {
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
</script>
```
    
Newly introduced APIs and Properties:

- [`Dynamsoft.DWT.GetWebTwain()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#getwebtwain){:target="_blank" rel="noreferrer noopener"}
- [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync){:target="_blank" rel="noreferrer noopener"}
- [`IfDisableSourceAfterAcquire`]({{site.info}}api/WebTwain_Acquire.html#ifdisablesourceafteracquire){:target="_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync){:target="_blank" rel="noreferrer noopener"}
- [`CloseSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourceasync){:target="_blank" rel="noreferrer noopener"}

## Review the code

At this point, our HelloWorld code should look like this:

``` html
<html>

<head>
    <title>Hello World</title>
    <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
    <script src="Resources/dynamsoft.webtwain.config.js"></script>
</head>

<body>
    <input type="button" value="Scan" onclick="AcquireImage();" />
    <div id="dwtcontrolContainer"></div>

    <script type="text/javascript">
        var DWObject;

        function Dynamsoft_OnReady() {
            DWObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
        }

        function AcquireImage() {
            if (DWObject) {
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
    </script>
</body>

</html>
```

## See the scan page in action

* Open the page in your browser

  ![Build-the-Hello-World-Scan-Page-3]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-3.png)

  > If you see a license notice, please make sure you have a valid license. Open `dynamsoft.webtwain.config.js` and ensure  that you have a licence defined at `Dynamsoft.DWT.ProductKey`. If you need further assistance, please contact [Dynamsoft Support]({{site.about}}getsupport.html).

* Press the Scan button

  After pressing the Scan button, you will be presented with the Select Source dialog. Select your scanner and press the Select button.

  ![Build-the-Hello-World-Scan-Page-4]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-4.png)

  > Only TWAIN / WIA / ICA / SANE compliant devices are listed in the Select Source dialog. If your connected scanner doesn't show up in the list, please make sure the proper driver is installed. If you are using Windows and don't have a physical scanner on hand, you may install the [Virtual Scanner](https://www.dynamsoft.com/web-twain/docs/faq/download-virtual-scanner-for-testing.html) – a scanner simulator which is developed by the [TWAIN Working Group](https://www.twain.org/) for testing purposes.

<!-- * Scanner UI -->

* After the scanner finishes scanning, the scanned documents will show up in the viewer.

  ![Build-the-Hello-World-Scan-Page-5]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-5.png)

**Further information**

<!-- TODO -->
<< Insert links to further readings >>

## Next article

The next article in this guide will explain [uploading images to the server]({{site.getstarted}}uploading.html).
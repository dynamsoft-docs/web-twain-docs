---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK HelloWorld - Simple Scan
keywords: Dynamic Web TWAIN, Documentation, Hello World, helloworld, scan, scanning
breadcrumbText: Hello World
description: Dynamic Web TWAIN SDK HelloWorld - Simple Scan
permalink: /getstarted/scanning.html
---

<!-- <div class='blockquote-note'></div>
> This article is part of our HelloWorld series. If you have not already reviewed HelloWorld, please start [here]({{site.getstarted}}helloworld.html). -->

# Scanning an Image

The main use case for DWT is to acquire images from a document scanner. To achieve this, you will need to create a web application and add the required functionality.

## Initializing the Environment

To use any of the DWT functions, you will need to create a web application that loads the DWT environment.

### Create a web application

Create a `HelloWorld.html` anywhere and copy the `Resources` folder to the same location. You can typically find the `Resources` folder in `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN SDK {Version Number}\`.

* Resources

  ![Build-the-Hello-World-Scan-Page-1]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-1.png)


* The project

  ![Build-the-Hello-World-Scan-Page-2]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-2.png)


### Include the DWT scripts

Embed the script of the library and add a `div` element for the library on the page.

```html
<script src="Resources/dynamsoft.webtwain.initiate.js"></script>
<script src="Resources/dynamsoft.webtwain.config.js"></script>
```

```html
<div id="dwtcontrolContainer"></div>
```

> `dwtcontrolContainer` is the default id for the div in the default DWT resources, and any of the Dynamsoft provided demos. If you would like to use a different id for this div, you will need to change `Dynamsoft.DWT.Containers` in the file `dynamsoft.webtwain.config.js` to match.

### Initialize the DWT environment

Now that the scripts have been included in the application, it is time to write the code to use the DWT library.

DWT has a built in event that, by default, triggers `Dynamsoft_OnReady()` when the DWT Resources are loaded into browser memory. You can use this event to initialize the DWT object.

<!-- DWT has a built in event `OnWebTwainReady` that fires and, by default, triggers `Dynamsoft_OnReady()` when the DWT Resources are loaded into browser memory. You can use this event to initialize the DWT object. -->

```js
function Dynamsoft_OnReady() {
    DWObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
}
```

The core functionality of DWT is to acquire images from a scanner. Since you have initalized the environment, you can now utilize the DWT API to get an image from the scanner.

## Add simple scanning functionality

### Add a Scan button in HTML

```html
<input type="button" value="Scan" onclick="AcquireImage();" />
```

### Add code to initiate scanning from a document scanner

```js
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

- [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync){:target="_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync){:target="_blank" rel="noreferrer noopener"}
- [`IfCloseSourceAfterAcquire`]({{site.info}}api/Device.html#deviceobjectacquireimage){:target="_blank" rel="noreferrer noopener"}
- [`CloseSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourceasync){:target="_blank" rel="noreferrer noopener"}

## Review the code

At this point, your HelloWorld code should look like this:

```html
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
                DWObject.SelectSourceAsync().then(function () {
                    return DWObject.AcquireImageAsync({ 
                        IfCloseSourceAfterAcquire: true 
                    });
                }).catch(function (exp) {
                    alert(exp.message);
                });
            }
        }

    </script>
</body>

</html>
```

## Run the application

### Open the page in your browser

![Build-the-Hello-World-Scan-Page-3]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-3.png)

> If you see a license notice, please make sure you have a valid license. Open `dynamsoft.webtwain.config.js` and ensure  that you have a licence defined at `Dynamsoft.DWT.ProductKey`. If you need further assistance, please contact [Dynamsoft Support]({{site.about}}getsupport.html).

### Press the Scan button

After pressing the Scan button, you will be presented with the Select Source dialog. Select your scanner and press the Select button. 

![Build-the-Hello-World-Scan-Page-4]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-4.png)

> Only TWAIN / WIA / ICA / SANE compliant devices are listed in the Select Source dialog. If your connected scanner doesn't show up in the list, please make sure the proper driver is installed. If you are using Windows and don't have a physical scanner on hand, you may install the [Virtual Scanner](https://www.dynamsoft.com/web-twain/docs/faq/download-virtual-scanner-for-testing.html) – a scanner simulator which is developed by the [TWAIN Working Group](https://www.twain.org/) for testing purposes.

### Scanner UI

You will be then presented with your scanner's built in interface. Please initiate a scan from this dialog. Your scanner's interface may differ from the provided screenshot.

![Build-the-Hello-World-Scan-Page-UI]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-UI.png)


###  View the scanned image

After the scanner finishes scanning, the scanned documents will show up in the viewer

![Build-the-Hello-World-Scan-Page-5]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-5.png)

<!-- # Further information

<!-- TODO
<< Insert links to further readings >> -->

<!-- # Previous article

If you need a refresher on setting up the base project, please see [initalizing the environment]({{site.getstarted}}initialize.html). -->

# Next article

The next article in this guide will explain [uploading images to the server]({{site.getstarted}}uploading.html).
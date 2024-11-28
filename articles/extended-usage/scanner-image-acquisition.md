---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Basics - Acquiring Images from Scanners
keywords: Dynamic Web TWAIN, Documentation, development, guide, development guide, basic, basic guide, importing images, image import, imaging devices, selecting imaging devices, scanners, scanning, image acquisition
breadcrumbText: Acquiring Images from Scanners
description: Dynamic Web TWAIN SDK General Usage Guide - Acquiring Images from Scanners
permalink: /general-usage/scanner-image-acquisition.html
redirect_from: /indepth/features/input.html
---

# Acquiring Images from Scanners

> Prerequisite: [DWT Initialization]({{site.general-usage}}initialization.html)

DWT can import images in a few different ways, the most common which is to acquire images from image sources, which are scanners and other imaging hardware. (We can also load image files, both from the local file system and over the network, as explained [here]({{site.general-usage}}image-import/file-import.html))

After the web application has initialized DWT and instantiated a `WebTwain` object, the `WebTwain` object can perform image acquisition, which is a term that includes scanning and file input. We will first go over scanning in this section. Note that we also provide an add-on for webcam-based scanning, which you can learn more about [here]({{site.api}}Addon_Webcam.html).

## Acquisition from All Available Scanners

Here, we present a web application with full image scanning capabilities. The user can click the "Scan" button to select a detected scanner, then set scanning options. Once image acquisition finishes, `WebTwain` `Viewer` displays the image in the web application.

### Sample Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
    </head>

    <body>
        <input type="button" value="Scan" onclick="AcquireImage();" />
        <div id="dwtcontrolContainer"></div>

        <script type="text/javascript">
            var DWTObject;

            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
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
        </script>
    </body>
</html>
```

APIs used:

-   [`RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
-   [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
-   [`GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
-   [`SelectSourceAsync()`]({{site.api}}WebTwain_Acquire.html#selectsourceasync)
-   [`AcquireImageAsync()`]({{site.api}}WebTwain_Acquire.html#acquireimageasync)
-   [`IfCloseSourceAfterAcquire`]({{site.api}}Device.html#deviceobjectacquireimage)

### Explanation

#### Selecting the Data Source

Upon calling the `AcquireImage()` function through the button click, `SelectSourceAsync()` opens up the source selector UI. The promise resolves once the user selects the desired data source and closes the UI, upon which the `WebTwain` instance opens the data source.

> Note: An imaging device typically refers to physical hardware that provides image data, most notably scanners. An image/data source refers to the logical representation of imaging devices, which allows software to interface with the imaging device.

#### Acquiring the Image

Next up, calling `SelectSourceAsync()` on the `WebTwain` instance initiates image acquisition from the previously opened data source. This step opens up the data source UI, which is specific to the selected data source. Once the user selects scan options and confirms the scan, the data source UI closes, and DWT sends the scan command. Once the `WebTwain` instance acquires the image, the instance's `Viewer` component displays the image on the web page.

Finally, `AcquireImageAsync()` closes the data source after completing the scan, because we passed it a [`DeviceConfiguration`]({{site.api}}Interfaces.html#DeviceConfiguration) argument, where we set `IfCloseSourceAfterAcquire` to `true`.

## Specifying Scanner Protocol

`SelectSourceAsync()` can take an [`EnumDWT_DeviceType`]({{site.api}}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_devicetype) argument to specify data sources using particular scanning protocols, and show only those data sources in the source selection UI. This may be useful in an internal use scenario where there is knowledge about the scanner hardware being used with DWT. For example, to show only eSCL data sources, we use the `Dynamsoft.DWT.EnumDWT_DeviceType.ESCLSCANNER` enum like so:

```JS
function AcquireImage() {
	if (DWTObject) {
		DWTObject.SelectSourceAsync(Dynamsoft.DWT.EnumDWT_DeviceType.ESCLSCANNER)
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
```

## Specifying Scanning Options

Many use cases require a pre-specified set of scanning options (such as, but not limited to color mode and resolution) to be applied on the scan. We can pass these arguments to the image source using the [`DeviceConfiguration`]({{site.api}}Interfaces.html#DeviceConfiguration) passed to `AcquireImageAsync()`. For example, these object properties specify the following:

-   `IfShowUI: false` turns off the **image source UI** (the second menu) to prevent the user from overriding the scan configuration.
-   `PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_BW` sets the color mode to binary (black and white) using the [`Dynamsoft.DWT.EnumDWT_PixelType`]({{site.api}}/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_pixeltype) enum.
-   `Resolution: 200` sets the image resolution to 200 DPI.

Modifying the previous `AcquireImage()` function results in this:

```JS
function AcquireImage() {
	if (DWTObject) {
		DWTObject.SelectSourceAsync()
        .then(function () {
            return DWTObject.AcquireImageAsync({
                IfShowUI: false,
                IfCloseSourceAfterAcquire: true,
                PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_BW,
                Resolution: 200,
                });
            })
        .catch(function (exp) {
            alert(exp.message);
        });
	}
}
```

These parameters will configure the scan using pre-set values, and also prevent user error by not allowing the user to override these settings.

## Further Reading

We demonstrated how to use APIs to scan documents from a web application, along with some simple customizations. For more extensive customizations, read more in our [advanced guides]({{site.extended-usage}}index.html). You can also consult our [FAQ]({{site.faq}}index.html) for better product knowledge and troubleshooting.

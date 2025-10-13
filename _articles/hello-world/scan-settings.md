---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK HelloWorld - Specifying Scan Settings
keywords: Dynamic Web TWAIN, Documentation, Hello World, upload, helloworld
breadcrumbText: Scan settings
description: Dynamic Web TWAIN SDK HelloWorld - Specifying Scan Settings
---

# Specifying Scan Settings

Some applications may require images to be scanned with particular scan settings, e.g. a prescribed image size, resolution, color, etc. It may be undesirable to alter these settings, so we may wish to issue these settings to the scanner directly, without alteration by end users. We will demonstrate this method by passing scan settings through the DWT API in the HelloWorld application.

> Prerequisites: Hello World - Uploading Images to the Server

## Specify Scan Parameters with JSON

The `AcquireImagesAsync()` API accepts scan setting arguments in a JSON format (specified by [DeviceConfiguration](/_articles/info/api/interfaces.md#DeviceConfiguration){:target="\_blank" rel="noreferrer noopener"}). For this example, we will demonstrate specifying a grayscale image with a resolution of 150 ppi by passing a few of these defined properties:

- `IfShowUI: false` - this disables the scanner UI. Scan settings issued through the UI would override scan settings passed by JSON, so this prevents end user misuse.
- `PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY` - this sets the image color mode to grayscale.
- `Resolution:150` - this sets the image resolution to 150 ppi.

Add all three properties in the JSON argument passed to `AcquireImageAsync()`:

```javascript
function AcquireImage() {
    if (DWTObject) {
        DWTObject.SelectSourceAsync()
            .then(function () {
                return DWTObject.AcquireImageAsync({
                    IfCloseSourceAfterAcquire: true,
                    IfShowUI: false,
                    PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,
                    Resolution: 150,
                });
            })
            .catch(function (exp) {
                alert(exp.message);
            });
    }
}
```

## Review the Code

```html
<html>
    <head>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
    </head>

    <body>
        <input type="button" value="Scan" onclick="AcquireImage();" />
        <input type="button" value="upload" onclick="upload();" />
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
                                IfShowUI: false,
                                PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_GRAY,
                                Resolution: 150,
                            });
                        })
                        .catch(function (exp) {
                            alert(exp.message);
                        });
                }
            }

            function upload() {
                if (DWTObject && DWTObject.HowManyImagesInBuffer > 0) {
                    var strUrl = "https://demo.dynamsoft.com/sample-uploads/";
                    var imgAry = [DWTObject.CurrentImageIndexInBuffer];
                    DWTObject.HTTPUpload(
                        strUrl,
                        imgAry,
                        Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
                        Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary,
                        "WebTWAINImage.png",
                        onEmptyResponse,
                        onServerReturnedSomething,
                    );
                } else {
                    alert("There is no image in buffer.");
                }
            }

            function onEmptyResponse() {
                alert("Upload successful");
            }

            function onServerReturnedSomething(errorCode, errorString, sHttpResponse) {
                alert(sHttpResponse.length > 0 ? sHttpResponse : errorString);
            }
        </script>
    </body>
</html>
```

Links to API Reference:

- [`SelectSourceAsync()`](/_articles/info/api/WebTwain_Acquire.md#selectsourceasync){:target="\_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`](/_articles/info/api/WebTwain_Acquire.md#acquireimageasync){:target="\_blank" rel="noreferrer noopener"}
- [`IfCloseSourceAfterAcquire`](/_articles/info/api/Device.md#deviceobjectacquireimage){:target="\_blank" rel="noreferrer noopener"}
- [`IfShowUI`](/_articles/info/api/WebTwain_Acquire.md#ifshowui){:target="\_blank" rel="noreferrer noopener"}
- [`PixelType`](/_articles/info/api/WebTwain_Acquire.md#pixeltype){:target="\_blank" rel="noreferrer noopener"}
- [`Dynamsoft.DWT.EnumDWT_PixelType`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_pixeltype){:target="\_blank" rel="noreferrer noopener"}
- [`Resolution`](/_articles/info/api/WebTwain_Acquire.md#resolution){:target="\_blank" rel="noreferrer noopener"}

## Run the Application

### Open the Application in Your Browser

![HelloWorld-Scan-1](/assets/imgs/HelloWorldScanSetting1.png)

### Press the Scan button

The scan should proceed directly after the button press, without displaying the scanner UI.

### View the scan

You should receive a grayscale image at 150 ppi:

![HelloWorld-Scan-2](/assets/imgs/HelloWorldScanSetting2.png)

# Previous Articles

<!-- If you need a refresher on setting up the base project, please review [initializing the environment]({{site.getstarted}}initialize.html). -->

If you have yet to acquire the image from the scanner, please review [scanning an image](/_articles/hello-world/scanning.md).

If this scan is all that you need, you can review [uploading images to the server](/_articles/hello-world/uploading.md).

# Next Article

The next and final step in our guide is [editing images](/_articles/hello-world/editing.md) after acquisition.

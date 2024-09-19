---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK HelloWorld - Editing Images
keywords: Dynamic Web TWAIN, Documentation, Hello World, editing, helloworld
breadcrumbText: Uploading documents
description: Dynamic Web TWAIN SDK HelloWorld - Editing Images
permalink: /hello-world/editing.html
redirect_from:
    - /getstarted/editing.html
---

# Editing Images

<!--
<div class='blockquote-note'></div>
> This article is part of our HelloWorld series. If you have not already reviewed HelloWorld, please start [here]({{site.getstarted}}helloworld.html). -->

DWT offers a number of image manipulation features used after image acquisition and before uploading or exporting. These include but are not limited to rotation, cropping, and resizing. In this example, we will demonstrate image color mode conversion and image rotation in HelloWorld.

> Prerequisites: Hello World - Specifying Scan Settings
<!-- For the quick guide on available APIs, please see [ImageEditing]({{site.indepth}}features/edit.html){:target="_blank" rel="noreferrer noopener"} -->

## Add Image Binarization

Add this line in the `HelloWorld.html` body to create a color mode conversion button:

```html
<input
	type="button"
	value="Convert to binary image"
	onclick="binarizeImage();"
/>
```

Then, define `binarizeImage()` in the `script` element:

```js
function binarizeImage() {
	DWTObject.ConvertToBW(DWTObject.CurrentImageIndexInBuffer);
}
```

APIs used:

- [`ConvertToBW()`]({{site.info}}api/WebTwain_Edit.html#convertToBW){:target="\_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer){:target="\_blank" rel="noreferrer noopener"}

## Add Image Rotation

Add two buttons for 90 degree clockwise and anti-clockwise image rotation:

```html
<input type="button" value="Rotate clockwise" onclick="rotateCW();" />
<input type="button" value="Rotate counter-clockwise" onclick="rotateCCW();" />
```

Define the rotation functions in the `script` element:

```js
function rotateCW() {
	DWTObject.RotateRight(DWTObject.CurrentImageIndexInBuffer);
}
function rotateCCW() {
	DWTObject.RotateLeft(DWTObject.CurrentImageIndexInBuffer);
}
```

APIs used:

- [`RotateRight()`]({{site.info}}api/WebTwain_Edit.html#rotateright){:target="\_blank" rel="noreferrer noopener"}
- [`RotateLeft()`]({{site.info}}api/WebTwain_Edit.html#rotateleft){:target="\_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer){:target="\_blank" rel="noreferrer noopener"}

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
		<input
			type="button"
			value="Convert to binary image"
			onclick="binarizeImage();"
		/>
		<input type="button" value="Rotate clockwise" onclick="rotateCW();" />
		<input
			type="button"
			value="Rotate counter-clockwise"
			onclick="rotateCCW();"
		/>

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
					DWTObject.HTTPupload(
						strUrl,
						imgAry,
						Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
						Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary,
						"WebTWAINImage.png",
						onUploadSuccess,
						onUploadFailure
					);
				} else {
					alert("There is no image in buffer.");
				}
			}

			function onUploadSuccess() {
				alert("Upload successful");
			}

			function onUploadFailure(errorCode, errorString, sHttpResponse) {
				alert(sHttpResponse.length > 0 ? sHttpResponse : errorString);
			}

			function binarizeImage() {
				DWTObject.ConvertToBW(DWTObject.CurrentImageIndexInBuffer);
			}

			function rotateCW() {
				DWTObject.RotateRight(DWTObject.CurrentImageIndexInBuffer);
			}

			function rotateCCW() {
				DWTObject.RotateLeft(DWTObject.CurrentImageIndexInBuffer);
			}
		</script>
	</body>
</html>
```

<!--
Links to API Reference:

- [`SelectSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#selectsourceasync){:target="_blank" rel="noreferrer noopener"}
- [`AcquireImageAsync()`]({{site.info}}api/WebTwain_Acquire.html#acquireimageasync){:target="_blank" rel="noreferrer noopener"}
- [`IfShowUI`]({{site.info}}api/WebTwain_Acquire.html#ifshowui){:target="_blank" rel="noreferrer noopener"}
- [`IfCloseSourceAfterAcquire`]({{site.info}}api/Device.html#deviceobjectacquireimage){:target="_blank" rel="noreferrer noopener"}
- [`PixelType`]({{site.info}}api/WebTwain_Acquire.html#pixeltype){:target="_blank" rel="noreferrer noopener"}
- [`Resolution`]({{site.info}}api/WebTwain_Acquire.html#resolution){:target="_blank" rel="noreferrer noopener"}
- [`CloseSourceAsync()`]({{site.info}}api/WebTwain_Acquire.html#closesourceasync){:target="_blank" rel="noreferrer noopener"}
- [`ConvertToBW()`]({{site.info}}api/WebTwain_Edit.html#converttobw){:target="_blank" rel="noreferrer noopener"}
- [`RotateRight()`]({{site.info}}api/WebTwain_Edit.html#rotateright){:target="_blank" rel="noreferrer noopener"}
- [`RotateLeft()`]({{site.info}}api/WebTwain_Edit.html#rotateleft){:target="_blank" rel="noreferrer noopener"}
- [`CurrentImageIndexInBuffer`]({{site.info}}api/WebTwain_Buffer.html#currentimageindexinbuffer){:target="_blank" rel="noreferrer noopener"} -->

## Run the Application

### Open the application in your browser

![HelloWorldEdit]({{site.assets}}imgs/HelloWorldEdit.png)

### Press the Scan button

![HelloWorldEditBW1]({{site.assets}}imgs/HelloWorldEditBW1.png)

### Convert the image to black and white

Click the ConvertToBW button and the image will change to black and white:

![HelloWorldEditBW2]({{site.assets}}imgs/HelloWorldEditBW2.png)

### Rotate the image

Using the Rotate CW and Rotate CCW buttons, rotate the image.

- Rotating the converted image once using the rotateCW button:

![HelloWorldEditCW]({{site.assets}}imgs/HelloWorldEditrotateCW.png)

- Rotating the converted image once using the rotateCCW button:

![HelloWorldEditCCW]({{site.assets}}imgs/HelloWorldEditRotateCCW.png)

Congratulations, you have completed the Hello World tutorial for DWT!

# Previous Articles

If you would like to review any of the previous steps, you can review:

<!-- - [Initializing the environment]({{site.getstarted}}initialize.html) -->

- [Scanning an image]({{site.getstarted}}scanning.html)
- [Uploading images to the server]({{site.getstarted}}uploading.html)
- [Setting scan parameters]({{site.getstarted}}scansettings.html)

# Next Article

Now that you had a chance to look at what DWT can do, you can learn about how to use DWT in your web application in detail with our [general developer guide]({{site.general-usage}}index.html).

<!-- << Insert what goes next >> -->

<!--
- [Customizing your scan settings]({{site.getstarted}}scansettings.html)
- [Review HelloWorld]({{site.getstarted}}helloworld.html)
- [Review Uploading Documents]({{site.getstarted}}uploading.html) -->

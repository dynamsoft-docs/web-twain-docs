---
layout: default-layout
needAutoGenerateSidebar: true
title: How to enable mobile capture
keywords: Dynamic Web TWAIN, Documentation, Mobile Web Capture
breadcrumbText: Mobile Web Capture
description: Dynamic Web TWAIN SDK Documentation Mobile Web Capture Page
---

<div class="blockquote-warning"></div>
> Mobile Web Capture has been removed from Dynamic Web TWAIN as of Release 18.2. If you still require Mobile Web Capture, you must use the Plus edition of Dynamic Web TWAIN v18.1. Please contact [support@dynamsoft.com](mailto:support@dynamsoft.com) for further details.

# How to Enable Mobile Web Capture

You can follow the steps below to use Dynamic Web TWAIN SDK to enable image capture from mobile cameras in a web page. 

<!--- Firstly, please [download and install Dynamic Web TWAIN](https://www.dynamsoft.com/web-twain/downloads) if you haven't done so. --->

## Start a Web application

Create a `mobile-capture.html` and copy the `Resources` folder of Dynamic Web TWAIN, which can be found under the installation folder, to the same location. 

## Include the library

Embed the scripts of the library, among which `dynamsoft.webtwain.addon.camera.js` is the add-on module for mobile web capture.

``` html
<script src="Resources/dynamsoft.webtwain.initiate.js"></script>
<script src="Resources/dynamsoft.webtwain.config.js"></script>
<script src="Resources/addon/dynamsoft.webtwain.addon.camera.js"></script> 
```

Add an `div` element on the page for the library. `dwtcontrolContainer` is the default ID for the div. You can change it in the file `dynamsoft.webtwain.config.js` if necessary.

``` html
<div id="dwtcontrolContainer"></div>
```

## Add code for mobile web capture

The below code shows how to scan a document from scanners on desktop and invoke the camera module for mobile capture. 

``` javascript
function AcquireImage() {
   if (DWTObject) {
     if (Dynamsoft.Lib.env.bMobile) {
	   var showVideoConfigs = {
		scannerViewer:{
			autoDetect:{
				enableAutoDetect: true
			}
		},
		filterViewer: {
			exitDocumentScanAfterSave: true
		}
	    };
           
	    if(!DWTObject.UseLocalService) {
        // invoke the camera module for mobile capture
		DWTObject.Addon.Camera.scanDocument(showVideoConfigs).then(
			function(){
				console.log("OK");
			}, 
			function(error){
				console.log(error.message);
			});
	    } 
       }
       else {
            DWTObject.SelectSource(
                function() {
                    DWTObject.OpenSource();
                    DWTObject.AcquireImage();
                },
                function() {
                    console.log("SelectSource failed!");
                });
       }
   }
}
```

## See the mobile capture page in action

To try out the mobile web capture, please first deploy the web application as an HTTPS site so that it will get proper authentication to access the mobile cameras. 

## Try mobile capture demo

Here is a working mobile capture online demo which you can test. 

- [Try mobile capture online demo](https://demo.dynamsoft.com/web-twain/mobile-online-camera-scanner/)
- [Download mobile capture sample code](https://www.dynamsoft.com/web-twain/sample-downloads/?demoSampleId=663)

## Additional notes:

1. By default, the size of the viewer is 270 in width and 350 in height, so it'll appear to be too small. Check out [how to customize the viewer]({{site.indepth}}features/viewer.html#customize-the-viewer) for more information.

2. Important: Not all mobile browsers allow the use of cameras. Check out [browsers on mobile devices]({{site.getstarted}}platform.html#browsers-on-mobile-devices) for more information. If you are using an unsupported browser (for example, Chrome on iOS), you may receive the error `The current browser has not implemented the MediaDevices interface`.

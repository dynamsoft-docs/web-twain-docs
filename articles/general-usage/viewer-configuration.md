---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Basics - Customizing the Viewer
keywords: Dynamic Web TWAIN, Documentation, development, guide, development guide, basic, basic guide, viewer configuration, UI
breadcrumbText: DWT Viewer Configuration
description: Dynamic Web TWAIN SDK General Usage Guide - Customizing the Viewer
permalink: /general-usage/viewer-configuration.html
redirect_from:
    - /indepth/features/viewer.html
---

# Configuring the Viewer

> Prerequisite: [DWT Initialization]({{site.general-usage}}initialization.html)

The `Viewer` component of the `WebTwain` instance is responsible for displaying scanned documents, and all other UI features. This guide explains how to configure `Viewer` behavior.

## Configuring Viewer Instantiation

### Configuring Built-in Viewers

The default `WebTwain` instance automatically creates its own `Viewer` instance with default settings - the `Viewer` is bound to the HTML `<div>` element with `id=dwtcontrolContainer` and specified display size, which are defined by the `Dynamsoft.DWT.Containers`. We go over this process in detail in the [DWT Initialization]({{site.general-usage}}initialization.html) article. We can configure the `Viewer`'s `id` and display size by altering the configuration resource file `dynamsoft.webtwain.config.js`. Modify the existing `Dynamsoft.DWT.Containers` property as shown below:

#### Sample Code

##### Relevant Snippet from `dynamsoft.webtwain.config.js`

```JS
Dynamsoft.DWT.Containers = [{
    ContainerId: 'customDivID', // New default div id
    Width: '800px', // New initial Viewer pixel width
    Height: '600px' // New initial Viewer pixel height
}]
```

##### HTML

```html
<html>
    <head>
        <!-- Initialize DWT by loading resource files, and instantiate WebTwain object behind-the-scenes -->
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
    </head>

    <body>
        <input type="button" value="Scan" onclick="AcquireImage();" /><br>
        <div id="customDivID"></div> <!-- The WebTwain object binds to this div by default -->
        <script>
            let DWTObject; // Use this to store the WebTwain object after retrieval

            // Retrieve WebTwain object after initializing DWT
            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("customDivID"); // Retrieve instantiated WebTwain object with new div ID
            });

            // Scan image
            function AcquireImage() {
                if (DWTObject) {
                    DWTObject.SelectSourceAsync().then(
                        function () {
                            return DWTObject.AcquireImageAsync(
                                { IfCloseSourceAfterAcquire: true }
                            );
                        }
                    ).catch(function (exp) {
                        alert(exp.message);
                    });
                }
            }
        </script>
    </body>
</html>
```

APIs used:

- [`Dynamsoft.DWT.Containers`]({{site.api}}Dynamsoft_WebTwainEnv.html#containers)
- [`Dynamsoft.DWT.RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`Dynamsoft.DWT.GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`SelectSourceAsync()`]({{site.api}}WebTwain_Acquire.html#selectsourceasync)
- [`AcquireImageAsync()`]({{site.api}}WebTwain_Acquire.html#acquireimageasync)
- [`IfCloseSourceAfterAcquire`]({{site.api}}Device.html#deviceobjectacquireimage)

#### Explanation

In the DWT configuration resource file, we changed the `<div>` container ID to `customDivID`, and set new dimensions for the default `Viewer` using the [`Dynamsoft.DWT.Containers`]({{site.api}}Dynamsoft_WebTwainEnv.html#containers) property. (which contains [Containers]({{site.api}}Interfaces.html#Container)) During DWT initialization, not only does the `containerId` bind the default `Viewer`, it also acts as an identifier for the default `WebTwain` instance. Consequently, we must use `customDivID` with [`Dynamsoft.DWT.GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain) to get the default `WebTwain` instance once it has been created.

### Binding a `Viewer` to a `WebTwain` Instance

To further customize a `Viewer`, we create a `WebTwain` instance that does not have a `Viewer` component, then bind a custom `Viewer` to it. In this example, we create a `WebTwain` instance with a viewer that also displays thumbnails to its side.

##### Relevant Snippet from `dynamsoft.webtwain.config.js`

```JS
Dynamsoft.DWT.Containers = []
Dynamsoft.DWT.AutoLoad = false;
```

##### HTML

```html
<html>
    <head>
        <!-- Initialize DWT by loading resource files, and instantiate WebTwain object behind-the-scenes -->
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
    </head>

    <body>
        <input type="button" value="Scan" onclick="AcquireImage();" /><br/>
        <div id="customDivID"></div> <!-- The WebTwain object binds to this div by default -->
        <script>
            let DWTObject; // Use this to store the WebTwain object after retrieval

            // Create headless WebTwain instance and bind viewer after initializing DWT
            Dynamsoft.DWT.CreateDWTObjectEx({
                    WebTwainId: "customWebTwainID" // Identifier for WebTwain instance
                },
                function (createdDWTObj) {
                    DWTObject = createdDWTObj; // Get the WebTwain instance
                    DWTObject.Viewer.bind(
                        document.getElementById("customDivID")
                    ); // Create a Viewer, bind to the WebTwain instance and the div
                    DWTObject.Viewer.height = 600;
                    DWTObject.Viewer.width = 800;
                    let thumbnailViewer =
                        DWTObject.Viewer.createThumbnailViewer(); // Create a thumbnail viewer bound to the WebTwain instance
                    thumbnailViewer.show();
                    DWTObject.Viewer.show();
                },
                function (err) {
                    console.log(err);
                }
            );

            // Scan image
            function AcquireImage() {
                if (DWTObject) {
                    DWTObject.SelectSourceAsync().then(
                        function () {
                            return DWTObject.AcquireImageAsync(
                                { IfCloseSourceAfterAcquire: true }
                            );
                        }
                    ).catch(function (exp) {
                        alert(exp.message);
                    });
                }
            }
        </script>
    </body>
</html>
```

APIs used:

- [`Dynamsoft.DWT.Containers`]({{site.api}}Dynamsoft_WebTwainEnv.html#containers)
- [`Dynamsoft.DWT.CreateDWTObjectEx()`]({{site.api}}Dynamsoft_WebTwainEnv.html#createdwtobjectex)
- [`DWTInitialConfig`]({{site.api}}Interfaces.html#dwtinitialconfig)
- [`Viewer.bind()`]({{site.api}}WebTwain_Viewer.html#bind)
- [`Viewer.createThumbnailViewer()`]({{site.api}}WebTwain_Viewer.html#createthumbnailviewer)
- [`Viewer.show()`]({{site.api}}WebTwain_Viewer.html#show)
- [`ThumbnailViewer`]({{site.api}}Interfaces.html#thumbnailviewer)
- [`SelectSourceAsync()`]({{site.api}}WebTwain_Acquire.html#selectsourceasync)
- [`AcquireImageAsync()`]({{site.api}}WebTwain_Acquire.html#acquireimageasync)
- [`IfCloseSourceAfterAcquire`]({{site.api}}Device.html#deviceobjectacquireimage)

#### Explanation

To demonstrate `Viewer` binding, we first create a `Viewer`-less (headless) `WebTwain` instance. We must first prevent DWT from creating a default-configured `WebTwain` instance (auto-loading) during its initialization stage, as this instance comes with a `Viewer`. We can clear [`Dynamsoft.DWT.Containers`]({{site.api}}Dynamsoft_WebTwainEnv.html#containers) and set [`Dynamsoft.DWT.AutoLoad`]({{site.api}}Dynamsoft_WebTwainEnv.html#autoload) `false` in the configuration `dynamsoft.webtwain.config.js` resource file to prevent auto-loading.

We then use [`CreateDWTObjectEx()`]({{site.api}}Dynamsoft_WebTwainEnv.html#createdwtobjectex) to create the desired custom `WebTwain` instance without a `Viewer`. In the success callback of `CreateDWTObjectEx()`, we then customize its features, namely its `Viewer` and `ThumbnailViewer`. This is the key point of this sample.

[`bind()`]({{site.api}}WebTwain_Viewer.html#bind) simultaneously creates the `Viewer` instance, binds it to the `WebTwain` instance that it was called from, and also binds it to the HTML container by container `id`. This `Viewer` instance is then accessible using the `Viewer` property from the `WebTwain` instance. For example, `DWTObject.Viewer.height` is the height of the `Viewer`.

Likewise, **after** the `Viewer` has been instantiated and bound, we can create a thumbnail viewer in the `Viewer` by accessing the [`createThumbnailViewer()`]({{site.api}}WebTwain_Viewer.html#createthumbnailviewer) function provided within the `Viewer` instance. Finally, we display both the `Viewer` and `ThumbnailViewer` on screen with their respective `show()` APIs.

> Note: The `Viewer` is always bound to a `WebTwain` instance. As such, the `Viewer` and its properties must always be accessed as a property of a `WebTwain` instance.

## Interacting with the Viewer

Users can interact with the `Viewer` graphically to work with scanned documents. These interactions also have APIs which can be called directly. Here is a non-exhaustive list of commonly used interactive features, along with their associated APIs (accessed from its parent `WebTwain` instance):

- [`Viewer.next()`]({{site.api}}WebTwain_Viewer.html#next): Display the page after the current one
- [`Viewer.previous()`]({{site.api}}WebTwain_Viewer.html#previous): Display the page before the current one
- [`Viewer.first()`]({{site.api}}WebTwain_Viewer.html#first): Display the first page
- [`Viewer.last()`]({{site.api}}WebTwain_Viewer.html#last): Display the last page
- [`Viewer.goToPage()`]({{site.api}}WebTwain_Viewer.html#last): Display the n-th page
- [`Viewer.setViewMode()`]({{site.api}}WebTwain_Viewer.html#setviewmode): Specify the dimensions of the grid of images to display at once
- [`Viewer.fitWindow()`]({{site.api}}WebTwain_Viewer.html#fitWindow): Fit the image to the `Viewer`
- [`Viewer.zoom`]({{site.api}}WebTwain_Viewer.html#zoom): Set the image display magnification factor, only when `setViewMode` is -1 x -1
- [`Viewer.setSelectedAreas()`]({{site.api}}WebTwain_Viewer.html#setselectedareas): Select a rectangular region on the displayed page
- [`Viewer.unbind()`]({{site.api}}WebTwain_Viewer.html#unbind): Unbind and delete the `Viewer`

Here is a rudimentary sample that demonstrates page movement APIs:

### Sample Code

```html
<html>
    <head>
        <!-- Initialize DWT by loading resource files, and instantiate WebTwain object behind-the-scenes -->
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
    </head>

    <body>
        <input type="button" value="Scan" onclick="AcquireImage();" /><br>
        <div id="customDivID"></div> <!-- The WebTwain object binds to this div by default -->
        <!-- Buttons to demonstrate Viewer API calls -->
        <input
            type="button"
            value="Next page"
            onclick="DWTObject.Viewer.next();"
        /><br>
        <input
            type="button"
            value="Previous page"
            onclick="DWTObject.Viewer.previous();"
        /><br>
        <input
            type="button"
            value="First page"
            onclick="DWTObject.Viewer.first();"
        /><br>

        <script>
            let DWTObject; // Use this to store the WebTwain object after retrieval

            // Retrieve WebTwain object after initializing DWT
            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("customDivID"); // Retrieve instantiated WebTwain object with new div ID
            });

            // Scan image
            function AcquireImage() {
                if (DWTObject) {
                    DWTObject.SelectSourceAsync().then(
                        function () {
                            return DWTObject.AcquireImageAsync(
                                { IfCloseSourceAfterAcquire: true }
                            );
                        }
                    ).catch(function (exp) {
                        alert(exp.message);
                    });
                }
            }
        </script>
    </body>
</html>
```

APIs used:

- [`RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`SelectSourceAsync()`]({{site.api}}WebTwain_Acquire.html#selectsourceasync)
- [`AcquireImageAsync()`]({{site.api}}WebTwain_Acquire.html#acquireimageasync)
- [`IfCloseSourceAfterAcquire`]({{site.api}}Device.html#deviceobjectacquireimage)
- [`SelectSourceAsync()`]({{site.api}}WebTwain_Acquire.html#selectsourceasync)
- [`AcquireImageAsync()`]({{site.api}}WebTwain_Acquire.html#acquireimageasync)
- [`IfCloseSourceAfterAcquire`]({{site.api}}Device.html#deviceobjectacquireimage)
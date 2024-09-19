---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Basics - Initializing DWT
keywords: Dynamic Web TWAIN, Documentation, development, guide, development guide, basic, basic guide, initializing DWT
breadcrumbText: DWT Initialization
description: Dynamic Web TWAIN SDK General Usage Guide - Initializing DWT
permalink: /general-usage/initialization.html
redirect_from:
    - /indepth/features/initialize.html
---

# Initializing DWT

> Prerequisite: [Loading Library Resources]({{site.general-usage}}resource-loading.html)

This article explores how to initialize the **DWT SDK** (**DWT**) for use in a web application. The main goal is to instantiate the **`WebTwain`** object, which is the entrypoint to most DWT functionalities, such as image scanning, image viewing, file uploading, and more. To load resources using other methods (via CDN or package manager), read our [resource loading guide]({{site.general-usage}}resource-loading.html), and read about initialization with these resources in our [advanced initialization guide]({{site.extended-usage}}advanced-initialization.html).

## Sample Code

The following is a minimal amount of sample code needed to create a web application that initializes DWT loading resource files found in our [official SDK](https://www.dynamsoft.com/web-twain/downloads).

```html
<html>
    <head>
        <!-- Initialize DWT by loading resource files, and instantiate WebTwain object behind-the-scenes. -->
        <script src="Resources/dynamsoft.webtwain.config.js"></script>
        <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
    </head>

    <body>
        <div id="dwtcontrolContainer"></div> <!-- The WebTwain object binds to this div by default -->
        <script>
            var DWTObject; // Use this to store the WebTwain object after retrieval

            // Retrieve WebTwain object after initializing DWT
            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer"); // Retrieve instantiated WebTwain object

                // Include this block to verify WebTwain instantiation
                /*
                    if (DWTObject) {
                        alert("WebTwain object instantiated");
                    }
                    */
            });
        </script>
    </body>
</html>
```

APIs used:

- [`Dynamsoft.DWT.RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`Dynamsoft.DWT.GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)

> DWT resides in the `Dynamsoft` namespace. Specifically, most DWT features reside within `Dynamsoft.DWT`. <!-- You can learn more about our namespaces in detail [here](namespaces and scopes). -->

### Running the Sample Code

For demonstration purposes, save the sample in an HTML file (e.g. `helloWorld.html`) in a new directory. Then, open the HTML file in a browser, and the DWT UI should display a loading animation. To **verify** that the `WebTwain` object has been instantiated, you can uncomment the verification code block.

Otherwise, click [here]({{site.indepth}}deployment/server.html) to learn how to deploy DWT on your web server.

> If your environment does not have **Dynamsoft Service** installed, a prompt will appear to ask you to install the service. You can learn more about what the service does [here]({{site.faq}}what-does-dynamsoft-service-do-on-end-user-machine.html).

Below is more detail on what happens during initialization and how to retrieve the `WebTwain` object.

## Explanation

Initializing DWT means making its features available for use, e.g. so the web application can scan, view, and upload images. This process begins with loading the resource files. By default, initialization also performs a few other tasks as outlined below.

### The `WebTwain` and `Viewer` Objects

During DWT initialization under default configurations, DWT **instantiates** a `WebTwain` object, as well as a `Viewer` object as a member of that `WebTwain` object. The `WebTwain` object contains most DWT APIs. Furthermore, the `Viewer` within the `WebTwain` object represents the viewer UI, so the `Viewer` is used to control UI features such as displaying scan previews, editing scanned images, etc. The `Viewer` is bound to the following html element:

```html
<div id="dwtcontrolContainer"></div>
```

Make sure that this `div` exists in the DOM. The `WebTwain` instance also uses the `id` as an identifier. We use this identifier to get the `WebTwain` instance with [`GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain).

## Retrieving the `WebTwain` Object

It is important to access the `WebTwain` object only after it has been instantiated. We can do this by registering the [`OnWebTwainReady`]({{site.api}}/Dynamsoft_WebTwainEnv.html#onwebtwainready) event, then invoking [`GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain) in the callback function. This ensures that we do not try to access the `WebTwain` object before it is instantiated. Once we can access the `WebTwain` object, we can proceed to use powerful features within DWT.

## Further Reading

For advanced DWT initialization methods, including changing default configurations, or instantiating a `WebTwain` instance without a `Viewer`, take a look at the [advanced initialization guide]({{site.extended-usage}}advanced-initialization.html).
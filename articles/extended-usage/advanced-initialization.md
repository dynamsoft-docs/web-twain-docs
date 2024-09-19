---
layout: default-layout
needAutoGenerateSidebar: true
title: Advanced DWT Initialization
keywords: Dynamic Web TWAIN, extended guide, advanced, advanced initialization, initialization, webtwain, webtwain initialization, headless, configuration
breadcrumbText: Advanced DWT Initialization
description: Advanced DWT Initialization
permalink: /extended-usage/advanced-initialization.html
---

# Advanced DWT Initialization

> Prerequisite: [DWT Initialization]({{site.general-usage}}initialization.html)

As presented in the standard [initialization guide]({{site.general-usage}}initialization.html), DWT instantiates a default `WebTwain` object in its default configuration. Here, we offer some alternative ways to instantiate `WebTwain` objects, as well as ways to alter the configuration of `WebTwain` objects.

> Note: jsDelivr currently has problems delivering the Dynamsoft Service installer (`https://cdn.jsdelivr.net/npm/dwt@latest/dist/dist/DynamsoftServiceSetup.msi`) due to [size restrictions](https://www.jsdelivr.com/documentation#id-configuring-a-default-file-in-packagejson); please consider hosting this particular resource file elsewhere. UKPKG is currently unaffected. For information about the Dynamsoft Service, learn more [here]({{site.extended-usage}}dynamsoft-service-configuration.html).

## Auto-Loading with CDN/Package Manager Resources

The resource files loaded from CDNs and package managers slightly differ from the resource files obtained from the [official SDK](https://www.dynamsoft.com/web-twain/downloads). Namely, `Dynamsoft.DWT.AutoLoad` is `true` in official SDK resources (`dynamsoft.webtwain.config.js`), and `false` otherwise. This property affects whether or not DWT automatically instantiates `WebTwain` instances upon load resources (auto-load). Likewise, `Dynamsoft.DWT.Containers` provides configurations for `WebTwain` instances created during auto-load. This is found in the official SDK resources (`dynamsoft.webtwain.config.js`), and absent otherwise. To enable auto-loading when obtaining resources from CDNs or package manager, we must define these two properties, for example:

### Loading from jsDelivr

```html
<html>
    <head>
        <!-- Load resources from jsDelivr CDN -->
        <script src="https://cdn.jsdelivr.net/npm/dwt@latest/dist/dynamsoft.webtwain.min.js"></script>
    </head>

    <body>
        <div id="dwtcontrolContainer"></div> <!-- The WebTwain object binds to this div by default -->
        <script>
            var DWTObject; // Use this to store the WebTwain object after retrieval

            Dynamsoft.DWT.ResourcesPath = "https://cdn.jsdelivr.net/dwt@latest/dist"; // Load supporting resources from here
            Dynamsoft.DWT.ProductKey = ""; // Add product key here

            // Configure the default WebTwain instance
            Dynamsoft.DWT.Containers = [{
                ContainerId: 'dwtcontrolContainer', // Binds WebTwain to container by ID
                Width: 270,
                Height: 320
            }];
            // Instantiate the WebTwain instance upon loading resources
            Dynamsoft.DWT.AutoLoad = true;

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
- [`Dynamsoft.DWT.ResourcesPath`]({{site.api}}Dynamsoft_WebTwainEnv.html#resourcespath)
- [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey)
- [`Dynamsoft.DWT.Containers`]({{site.api}}Dynamsoft_WebTwainEnv.html#containers)
- [`Dynamsoft.DWT.Container`]({{site.api}}Interfaces.html#Container)
- [`Dynamsoft.DWT.AutoLoad`]({{site.api}}Dynamsoft_WebTwainEnv.html#autoload)

### Explanation

Setting values for `Dynamsoft.DWT.AutoLoad` and `Dynamsoft.DWT.Containers` results in identical startup behavior for resources obtained from CDNs and package managers to resources obtained from the official SDK.

> Note: jsDelivr currently has problems delivering the Dynamsoft Service installer (`https://cdn.jsdelivr.net/npm/dwt@latest/dist/dist/DynamsoftServiceSetup.msi`) due to [size restrictions](https://www.jsdelivr.com/documentation#id-configuring-a-default-file-in-packagejson); please consider hosting this particular resource file elsewhere. UKPKG is currently unaffected. For information about the Dynamsoft Service, learn more [here]({{site.extended-usage}}dynamsoft-service-configuration.html).

## Configuring Default `WebTwain` Instances

Since [`Dynamsoft.DWT.Containers`]({{site.api}}Dynamsoft_WebTwainEnv.html#containers) controls the configuration for the `WebTwain` instance, we can use it to control the initial dimensions of the `Viewer`, and the container that the `Viewer` is bound to. `Dynamsoft.DWT.Containers` is an array of objects of the interface [`Dynamsoft.DWT.Container`]({{site.api}}Interfaces.html#Container), which looks like this:

``` typescript
interface Container {
    WebTwainId?: string;
    ContainerId?: string;
    Width?: string | number;
    Height?: string | number;
}
```

Previously we omitted the `WebTwainId` property. This is simply another identifier which can substitute `ContainerId`, particularly in the case of headless `WebTwain` instances. A `WebTwain` instance must have **at least one** of these two properties defined.

To create multiple `WebTwain` instances with `Dynamsoft.DWT.Containers`, simply add elements to the array. Make sure to use different identifiers for the instances to prevent conflicts.

## Instantiating `WebTwain` Without Auto-Load

Some use cases call for instantiating `WebTwain` objects on demand. To do this, we use the [`Dynamsoft.DWT.Load()`]({{site.api}}Dynamsoft_WebTwainEnv.html#load) API to create the `WebTwain` instance. This following example demonstrates this method with resources obtained from a CDN, but resources from other sources also work:

### Sample Code

```html
<html>
    <head>
        <!-- Load resources from jsDelivr CDN -->
        <script src="https://cdn.jsdelivr.net/npm/dwt@latest/dist/dynamsoft.webtwain.min.js"></script>
    </head>

    <body>
        <div id="dwtcontrolContainer"></div> <!-- WebTwain container -->
        <input type="button" value="Create a WebTwain object" onclick="instantiate();" />
        <script>
            var DWTObject; // Use this to store the WebTwain object after retrieval

            Dynamsoft.DWT.ResourcesPath = "https://cdn.jsdelivr.net/dwt@latest/dist"; // Load supporting resources from here
            Dynamsoft.DWT.ProductKey = ""; // Add product key here

            // Configure the WebTwain instance created when calling Dynamsoft.DWT.Load()
            Dynamsoft.DWT.Containers = [{
                ContainerId: 'dwtcontrolContainer', // Binds WebTwain to container by ID
                Width: 270,
                Height: 320
            }];

            // Retrieve WebTwain object after Dynamsoft.DWT.Load() returns
            Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", function () {
                DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer"); // Retrieve instantiated WebTwain object

                // Include this block to verify WebTwain instantiation
                /*
                    if (DWTObject) {
                        alert("WebTwain object instantiated");
                    }
                    */
            });

            function instantiate() {
                Dynamsoft.DWT.Load();
            }
        </script>
    </body>
</html>
```

APIs Used:

- [`Dynamsoft.DWT.RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`Dynamsoft.DWT.GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`Dynamsoft.DWT.ResourcesPath`]({{site.api}}Dynamsoft_WebTwainEnv.html#resourcespath)
- [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey)
- [`Dynamsoft.DWT.Containers`]({{site.api}}Dynamsoft_WebTwainEnv.html#containers)
- [`Dynamsoft.DWT.Container`]({{site.api}}Interfaces.html#Container)
- [`Dynamsoft.DWT.Load()`]({{site.api}}Dynamsoft_WebTwainEnv.html#load)

### Explanation

> Note: When using resources from the official SDK, we must set `Dynamsoft.DWT.AutoLoad = false` in the `dynamsoft.webtwain.config.js` file.

This sample above instantiates a `WebTwain` object upon demand. In this case the button triggers instantiation, which calls [`Dynamsoft.DWT.Load()`]({{site.api}}Dynamsoft_WebTwainEnv.html#load). `Dynamsoft.DWT.Load()` creates `WebTwain` instances based on the value of `Dynamsoft.DWT.Containers`. `Dynamsoft.DWT.Load()` also triggers the `OnWebTwainReady` event, which allows us to store the `WebTwain` object in the `DWTObject` variable.

> Note: `Dynamsoft.DWT.Load()` also triggers `OnWebTwainReady` during auto-load; DWT just invokes `Dynamsoft.DWT.Load()` automatically.

## Instantiating WebTwain Without `OnWebTwainReady`

The previous two methods relied on listening to the `OnWebTwainReady` event to grab the `WebTwain` instance, and using `Dynamsoft.DWT.Containers` for the configuration. For more flexibility, DWT offers the [`Dynamsoft.DWT.CreateDWTObject()`]({{site.api}}Dynamsoft_WebTwainEnv.html#createdwtobject) API. The following sample works with resources obtained from any source:

### Sample Code

```html
<html>
    <head>
        <!-- Load resources from jsDelivr CDN -->
        <script src="https://cdn.jsdelivr.net/npm/dwt@latest/dist/dynamsoft.webtwain.min.js"></script>
    </head>

    <body>
        <div id="dwtcontrolContainer"></div> <!-- Bind WebTwain instance to this container -->
        <input type="button" value="Create a WebTwain object" onclick="instantiate();" />
        <script>
            var DWTObject; // Use this to store the WebTwain object after retrieval

            Dynamsoft.DWT.ResourcesPath = "https://cdn.jsdelivr.net/dwt@latest/dist"; // Load supporting resources from here
            Dynamsoft.DWT.ProductKey = ""; // Add product key here

            // Create WebTwain instance
            function instantiate() {
                Dynamsoft.DWT.CreateDWTObject(
                    'dwtControlContainer'
                    , function (object) {
                        DWTObject = object;
                    }, function (exp) {
                        console.error(exp)
                    });
            }
        </script>
    </body>
</html>
```

APIs Used:

- [`Dynamsoft.DWT.RegisterEvent()`]({{site.api}}Dynamsoft_WebTwainEnv.html#registerevent)
- [`Dynamsoft.DWT.GetWebTwain()`]({{site.api}}Dynamsoft_WebTwainEnv.html#getwebtwain)
- [`OnWebTwainReady`]({{site.api}}Dynamsoft_WebTwainEnv.html#onwebtwainready)
- [`Dynamsoft.DWT.ResourcesPath`]({{site.api}}Dynamsoft_WebTwainEnv.html#resourcespath)
- [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey)
- [`Dynamsoft.DWT.CreateDWTObject()`]({{site.api}}Dynamsoft_WebTwainEnv.html#createdwtobject)

### Explanation

> Note: When using resources from the official SDK, we must set `Dynamsoft.DWT.AutoLoad = false` and `Dynamsoft.DWT.Containers = []` in the `dynamsoft.webtwain.config.js` file to disable auto-loading.

This method creates a `WebTwain` instance, and makes it available through the success callback function, rather than registering a callback handler to the `OnWebTwainReady` event. [`Dynamsoft.DWT.CreateDWTObject()`]({{site.api}}Dynamsoft_WebTwainEnv.html#createdwtobject) also binds the `WebTwain` instance to a container via a container `id`. This method does not provide a way to configure the size of the `Viewer`, so the `Viewer` size must be set after instantiation (e.g. with the `Viewer` [`width`]({{site.api}}WebTwain_Viewer.html#width) and [`height`]({{site.api}}WebTwain_Viewer.html#width) properties).

`Dynamsoft.DWT.CreateDWTObject()` can also set network configurations with an overloaded method like so:

```JS
CreateDWTObject(
    ContainerId: string, 
    host: string, 
    port: string | number, 
    portSSL: string | number, 
    successCallBack: (DWTObject: WebTwain) => void,
    failureCallBack: ({code: number, message: string}) => void
): void;
```

## Creating Headless `WebTwain` Instances

The other instantiation methods all create a `Viewer` component in the `WebTwain` instance. To forgo a `Viewer`, or to create one separately after the fact, DWT provides the [`Dynamsoft.DWT.CreateDWTObjectEx()`]({{site.api}}Dynamsoft_WebTwainEnv.html#createdwtobjectex). This sample demonstrates creating a `WebTwain` instance on demand. This works with resource files obtained from any source.

### Sample Code

```html
<html>
    <head>
        <!-- Load resources from jsDelivr CDN -->
        <script src="https://cdn.jsdelivr.net/npm/dwt@latest/dist/dynamsoft.webtwain.min.js"></script>
    </head>

    <body>
        <input type="button" value="Scan an image" onclick="acquireImage();" />
        <input type="button" value="Create a WebTwain object" onclick="instantiate();" />
        <script>
            var DWTObject; // Use this to store the WebTwain object after retrieval

            Dynamsoft.DWT.ResourcesPath = "https://cdn.jsdelivr.net/dwt@latest/dist"; // Load supporting resources from here
            Dynamsoft.DWT.ProductKey = ""; // Add product key here

            // Create WebTwain instance without a Viewer
            function instantiate() {
                Dynamsoft.DWT.CreateDWTObjectEx({
                    WebTwainId: 'dwtObj' // Alternative identifier to containerID when no Viewer/container
                    }, function (object) {
                        DWTObject = object;
                    }, function (exp) {
                        console.error(exp)
                    });
            }

            // Scan image to WebTwain instance
            function acquireImage() {
                if (DWTObject) {
                    DWTObject.SelectSourceAsync()
                    .then(function () {
                        return DWTObject.AcquireImageAsync({
                            IfCloseSourceAfterAcquire: true,
                        });
                    })
                    .then(function () {
                    console.log(DWTObject.HowManyImagesInBuffer); // Indicate that image was scanned
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

APIs Used:

- [`Dynamsoft.DWT.ResourcesPath`]({{site.api}}Dynamsoft_WebTwainEnv.html#resourcespath)
- [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey)
- [`Dynamsoft.DWT.CreateDWTObjectEx()`]({{site.api}}Dynamsoft_WebTwainEnv.html#createdwtobjectex)
- [`DWTInitialConfig`]({{site.api}}Interfaces.html#DWTInitialConfig)
- [`SelectSourceAsync()`]({{site.api}}WebTwain_Acquire.html#selectsourceasync)
- [`AcquireImageAsync()`]({{site.api}}WebTwain_Acquire.html#acquireimageasync)
- [`IfCloseSourceAfterAcquire`]({{site.api}}Device.html#deviceobjectacquireimage)
- [`HowManyImagesInBuffer`]({{site.api}}WebTwain_Buffer.html#howmanyimagesinbuffer)

### Explanation

> Note: When using resources from the official SDK, we must set `Dynamsoft.DWT.AutoLoad = false` and `Dynamsoft.DWT.Containers = []` in the `dynamsoft.webtwain.config.js` file to disable auto-loading.

[`Dynamsoft.DWT.CreateDWTObjectEx()`]({{site.api}}Dynamsoft_WebTwainEnv.html#createdwtobjectex) creates a `WebTwain` instance provided by the [`DWTInitialConfig`]({{site.api}}Interfaces.html#DWTInitialConfig) interface (this can also configure `host`, `port`, `ssl`). In this example, the object simply defines an identifier. Since this `WebTwain` instance is headless, it cannot be identifier by its container's `id`, so we use the `WebTwainId` property instead.

## Customizing the instances

The instances are defined in `dynamsoft.webtwain.config.js`:

``` javascript
Dynamsoft.DWT.Containers = [{
    ContainerId: 'dwtcontrolContainer',
    Width: '585px',
    Height: '513px'
}];
```

`Containers` is an array of the `Container` type.

``` typescript
interface Container {
    WebTwainId?: string;
    ContainerId?: string;
    Width?: string | number;
    Height?: string | number;
}
```

Notes:

- `WebTwainId` and `ContainerId` are both optional but one must exist as the identifier for that `WebTwain` instance.
- `Width` and `Height` determine the initial viewer size of the instance.
- When instantiating with `Dynamsoft.DWT.Load` , `ContainerId` , `Width` and `Height` are required. Dynamic Web TWAIN will try to locate an HTML element with the ID defined by `ContainerId` and use `Width` and `Height` as the viewer size.

To create multiple instances, simply provide multiple `Containers`. For example, the following code creates two `WebTwain` instances:

``` javascript
Dynamsoft.DWT.Containers = [{
    ContainerId: 'dwtcontrolContainer1',
    Width: '585px',
    Height: '513px'
}, {
    ContainerId: 'dwtcontrolContainer2',
    Width: '585px',
    Height: '513px'
}];
```

<!-- Should not be in this guide -->

## Note on Namespaces

DWT operates under the `Dynamsoft` namespace, and most of its features may be found in `Dynamsoft.DWT`. Here is the break-down:

- [`Dynamsoft.DWT`]({{site.api}}Dynamsoft_WebTwainEnv.html)

    This contains global methods and properties such as DWT initialization and `WebTwain` instantiation. This also contains enumerations, e.g. [`Dynamsoft.DWT.EnumDWT_PixelType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftenumdwt_pixeltype).

- `Dynamsoft.Lib`

    This contains information such as environment detection results (`Dynamsoft.Lib.env`), and global methods such as `showMask()` and `hideMask()`.
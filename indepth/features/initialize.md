---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Initialization
keywords: Dynamic Web TWAIN, Documentation, Initialization 
breadcrumbText: Initialization
description: Dynamic Web TWAIN SDK Documentation Initialization Page
permalink: /indepth/features/initialize.html
---

# Initialize
Initializing Dynamic Web TWAIN takes a few simple steps, as you can see in the [Getting Started]({{site.getstarted}}helloworld.html) chapter. The following guide will dive deeper into the process how Dynamic Web TWAIN is intialized once the web page loads.

## Loading the Core JS Files

This is the first step of the initialization.

### Introduction to the core files

Inside the `Resources` directory that is included in the SDK installation folder, you can find the following two main JS files which define the configurations and operation of Dynamic Web TWAIN:

- `dynamsoft.webtwain.initiate.js`

  This file is the **core** of the Dynamic Web TWAIN JavaScript Library. You're not supposed to change it without consulting the [Dynamsoft Support Team]({{site.about}}Getsupport.html).
- `dynamsoft.webtwain.config.js`

  This file is used for setting basic configurations of Dynamic Web TWAIN, e.g., configure the product key, change the initial viewer size, and more.

If you are using the official <a href="https://www.npmjs.com/package/dwt" target="_blank">dwt NPM package</a>, you will see `dynamsoft.webtwain.min.js` and `dynamsoft.webtwain.min.mjs` instead. For simplicity, in each of these files Dynamsoft has included all necessary JavaScript code which includes both files mentioned above plus `dynamsoft.webtwain.install.js` and all extra components (add-ons). The `dynamsoft.webtwain.min.js` file is a simple combination of the code while the `dynamsoft.webtwain.min.mjs` file is built as an ECMAScript 6 (ES6) Module that is used in applications based on Angular, React, and Vue etc.

## Loading Add-on JS files

Dynamic Web TWAIN offers a number of optional add-ons, including a barcode reader, a PDF rasterizer, and two webcam utilizers. The files for these components reside in the **addon** subfolder in the **Resources** directory. [Learn more about the resource files]({{site.faq}}what-are-the-resources-files.html).

You can reference the respective JS file to include any of these add-on components. Once a JS file is referenced, the member methods/properties of that component are made available in the [Dynamsoft Namespace](#the-dynamsoft-namespace) and can later be used by the `WebTwain` instances.

If you use any of the `min` file from the `Dynamic Web TWAIN` package, all add-on components are included by default.

## Loading the supporting files

Once the main JS files are loaded in, the initialization process moves to load all the other supporting JS files as well as the CSS files. 

The following files which can be found in the **Resources** folder are required:

- `dynamsoft.webtwain.install.js`: used to configure the dialogs which show up when the Dynamsoft Service is not installed or needs upgrade, etc. This file is automatically loaded when the code in `dynamsoft.webtwain.initiate.js` executes.
- `src/dynamsoft.viewer.js`, `src/dynamsoft.viewer.css`, `src/dynamsoft.webtwain.css`: used to build the viewer component of Dynamic Web TWAIN, as well as define the CSS of the other UI elements of the library.

## Creating the WebTwain instance

This is the last step of the initialization.

The leading player of Dynamic Web TWAIN is the `WebTwain` class. Almost all methods and properties are defined in this class.

Three methods to instantiate Dynamic Web TWAIN:

### [`Dynamsoft.DWT.Load()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#load)

This is the default method to create `WebTwain` instances. The following two snippets are equivalent.

Snippet 1:

``` javascript
Dynamsoft.DWT.OnWebTwainReady = function() {
    DWObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
}
```

Snippet 2:

``` javascript
Dynamsoft.DWT.RegisterEvent('OnWebTwainReady', Dynamsoft_OnReady);
function Dynamsoft_OnReady() {
    DWObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
}
```

By default, `Dynamsoft.DWT.Load()` will be called automatically as soon as the running environment is ready.

You can control the behavior using `Dynamsoft.DWT.AutoLoad` which is defined in the file `dynamsoft.webtwain.config.js`. It is set to `true` by default but can be called anywhere before the actual loading begins.

When `Load()` is called, `Dynamic Web TWAIN` tries to create the `WebTwain` instances. Once it's done, `Dynamic Web TWAIN` triggers the built-in callback `Dynamsoft.DWT.OnWebTwainReady` in which the method [`Dynamsoft.DWT.GetWebTwain`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#getwebtwain) can be used to get the handler(s) of the instance(s). For simplicity, the `OnWebTwainReady` callback points to a global function called `Dynamsoft_OnReady`.

### [`Dynamsoft.DWT.CreateDWTObject()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#createdwtobject)

This method manually creates a `WebTwain` instance with a default built-in viewer.

``` javascript
/**
 * Create a WebTwain instance with UI.
 * @param ContainerId Specify the HTML element (typically of the type HTMLDivElement) to hold the UI.
 * @param host Specify the host.
 * @param port Specify the port.
 * @param portSSL Specify the SSL port.
 * @param successCallback A callback function that is executed if the request succeeds.
 * @param failureCallback A callback function that is executed if the request fails.
 */
CreateDWTObject(
    ContainerId: string,
    host ? : string,
    port ? : string | number,
    portSSL ? : string | number,
    successCallBack: (DWObject: WebTwain) => void,
    failureCallBack: (errorString: string) => void
): void;
```

The following would be equivalent to using [Load](#dynamsoftdwtload) with the configuration `Dynamsoft.DWT.Containers = [{ContainerId: 'dwtcontrolContainer', Width: '585px', Height: '513px'}`

``` javascript
Dynamsoft.DWT.CreateDWTObject(
    'dwtcontrolContainer',
    function(obj) {
        obj.Width = 585;
        obj.Height = 513;
    },
    function(err) {
        console.log(err);
    }
);
```

### [`Dynamsoft.DWT.CreateDWTObjectEx()`]({{site.info}}api/Dynamsoft_WebTwainEnv.html#createdwtobjectex)

This method manually creates a `WebTwain` instance without a default built-in viewer.

``` typescript
/**
 * Create a WebTwain instance without UI.
 * @param WebTwainId Specify the Id of the instance.
 * @param successCallback A callback function that is executed if the request succeeds.
 * @param failureCallback A callback function that is executed if the request fails.
*/
CreateDWTObjectEx(
    dwtInitialConfig: DWTInitialConfig,
    successCallBack: (DWObject: WebTwain) => void,
    failureCallBack: ({code: number, message: string}) => void
): void;
```

The following is the `DWTInitialConfig` interface:

``` typescript
interface DWTInitialConfig {
    WebTwainId: string;
    Host?: string;
    Port?: string;
    SSLPort?: string;
}
```

Compared with [`CreateDWTObject`](#dynamsoftwebtwainenvcreatedwtobject), `CreateDWTObjectEx` requires a `WebTwainId` instead of a `ContainerId`.

The following would be equivalent to using [Load](#dynamsoftdwtload) with the configuration `Dynamsoft.DWT.Containers = [{ContainerId: 'dwtcontrolContainer', Width: '800px', Height: '600px'}`

The created instance doesn't have a built-in viewer. You can instead use the method [`bind()`]({{site.info}}api/WebTwain_Viewer.html#bind) to add a viewer.

``` javascript
var DWObject = null;
Dynamsoft.DWT.CreateDWTObjectEx({
        WebTwainId: 'dwtcontrol'
    },
    function(obj) {
        DWObject = obj;
        DWObject.Viewer.bind(document.getElementById('dwtcontrolContainer'));
        DWObject.Viewer.height = 600;
        DWObject.Viewer.width = 800;
        DWObject.Viewer.show();
    },
    function(err) {
        console.log(err);
    }
);
```

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

## The Dynamsoft Namespace

Dynamic Web TWAIN operates under the `Dynamsoft` namespace.

`Dynamsoft` is the top-level namespace. Dynamic Web TWAIN and other Dynamsoft libraries are all defined under `Dynamsoft`. For Dynamic Web TWAIN, the major members of this namespace are:

- [`Dynamic Web TWAIN`]({{site.info}}api/Dynamsoft_WebTwainEnv.html)

    Includes global methods, properties for `WebTwain` initialization and instantiation, etc.

- `Lib`

    Includes information like environment detection results (`Dynamsoft.Lib.env`) and global methods like `showMask()`, `hideMask()`, etc.

- `Enumerations`

    Includes enumerations like [`Dynamsoft.DWT.EnumDWT_PixelType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftenumdwt_pixeltype).

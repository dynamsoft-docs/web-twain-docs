---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Basics - Loading Library Resources
keywords: Dynamic Web TWAIN, Documentation, development, guide, development guide, basic, basic guide, initializing DWT
breadcrumbText: Loading Library Resources
description: Dynamic Web TWAIN SDK General Usage Guide - Loading Library Resources
permalink: /general-usage/resource-loading.html
redirect_from: /indepth/features/initialize.html

---

# Loading Library Resources

Before using the **Dynamic Web TWAIN SDK** (DWT), the web application must first load its resource files. These resource files may be gathered from three locations, with slightly different characteristics. DWT provides **core resources** (i.e. core functionality) that load directly into the web application. This in turn loads **supporting resources**, which include add-ons, css, and more - read about them in detail [here]({{site.faq}}what-are-the-resources-files.html).

## Note on File Size

The installers for the [Dynamsoft Service]({{site.extended-usage}}dynamsoft-service-configuration.html) are numerous and take up a lot of disk space. We may save disk space by removing unused installers for unused platforms/architectures if called for, whether for deployment or for development environments.

The official SDK installers store the installers under the `/dist` directory, and the package managers/CDNs keep them under `/dist/dist`. For example, if the web application does not support end users on Linux-based platforms, we may elect to remove `DynamsoftServiceSetup.deb`, `DynamsoftServiceSetup.rpm`, etc.

## Loading from Official SDK Package

The official [DWT installer](https://www.dynamsoft.com/web-twain/downloads) installs the SDK with a 30-day free trial (license key included), and contains the resource scripts, along with SDK documentation, and samples. This method is useful for developers to quickly evaluate the SDK. The resource files may be obtained from the following locations after installation:

- On Windows: `C:\Program Files (x86)\Dynamsoft\Dynamic WebTWAIN SDK {version number}/Resources`
- On Linux: Where you extracted the SDK archive file to - `{extracted directory}/Dynamic Web TWAIN SDK {version number}/Resources`
- On MacOS: `/Applications/Dynamsoft/Dynamic Web TWAIN SDK {version number}/Resources`

In which case they load like so:

```html
<html>
    <head>
        <!-- Load core DWT resource files -->
        <script src="{local SDK directory}/Resources/dynamsoft.webtwain.config.js"></script>
        <script src="{local SDK directory}/Resources/dynamsoft.webtwain.initiate.js"></script>
    </head>

    <body>
    </body>
</html>
```

This method organizes the resources a little differently compared to the files from the CDNs and the package managers. Here, the **core resources** are loaded using two JavaScript files, which do not contain add-ons. These two files load other **supporting resource files** in turn (such as add-on resource files, css, and more - read about them in detail [here]({{site.faq}}what-are-the-resources-files.html)) found in the SDK directories. Here is a quick introduction to the core resource files:

- `dynamsoft.webtwain.initiate.js`
  - This file contains the core DWT JavaScript library.
- `dynamsoft.webtwain.config.js`
  - This file contains basic DWT configurations, e.g. configuring the product key, changing the initial dimensions of the image viewer, etc.

Though these core resource files do not contain add-ons, we may load add-on resource files from the `{local SDK directory}/Resources/addon` directory. (just make sure that the license key permits the use of the add-on(s)) The 30-day trial license key that comes with the install includes all add-ons.

## Loading from CDN

The most straight-forward method of loading resources is to fetch them from CDNs. (Both CDNs provide identical files) DWT resource files are hosted on [jsDelivr](https://jsdelivr.com/) and [UNPKG](https://unpkg.com/). Unlike our official SDK package, the CDNs require the user to supply a license key. See our [licensing page]({{site.general-usage}}license.html) for more details, and request a trial license [here](https://www.dynamsoft.com/customer/license/trialLicense/?product=dwt).

The resources obtained from the package managers differ slightly from the ones found in the official SDK package, in that it has the property `Dynamsoft.DWT.AutoLoad = false`, whereas it is `true` in the official SDK package. This property controls initialization behavior; read our [initialization guide]({{site.extended-usage}}advanced-initialization.html) to learn more.

Simply create a `script` element like so:

### Loading from [UNPKG](https://unpkg.com/dwt@latest/dist/dynamsoft.webtwain.min.js)

```html
<html>
    <head>
        <!-- Load resources from UNPKG CDN -->
        <script src="https://unpkg.com/dwt@latest/dist/dynamsoft.webtwain.min.js"></script>
    </head>

    <body>
        <script>
            Dynamsoft.DWT.ResourcesPath = "https://unpkg.com/dwt@latest/dist"; // Load supporting resources from here
            Dynamsoft.DWT.ProductKey = ""; // Add product key here
        </script>
    </body>
</html>
```

APIs used:

- [`Dynamsoft.DWT.ResourcesPath`]({{site.api}}Dynamsoft_WebTwainEnv.html#resourcespath)
- [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey)

### Loading from [jsDelivr](https://cdn.jsdelivr.net/npm/dwt@latest/dist/dynamsoft.webtwain.min.js)

Note that jsDelivr currently has problems delivering the Dynamsoft Service installer (`https://cdn.jsdelivr.net/npm/dwt@latest/dist/dist/`) due to [size restrictions](https://www.jsdelivr.com/documentation#id-configuring-a-default-file-in-packagejson); please consider hosting this particular resource file elsewhere. UKPKG is currently unaffected. For information about the Dynamsoft Service, learn more [here]({{site.extended-usage}}dynamsoft-service-configuration.html).

```html
<html>
    <head>
        <!-- Load resources from jsDelivr CDN -->
        <script src="https://cdn.jsdelivr.net/npm/dwt@latest/dist/dynamsoft.webtwain.min.js"></script>
    </head>

    <body>
        <script>
            Dynamsoft.DWT.ResourcesPath = "https://cdn.jsdelivr.net/npm/dwt@latest/dist"; // Load supporting resources from here
            Dynamsoft.DWT.ProductKey = ""; // Add product key here
        </script>
    </body>
</html>
```

APIs used:

- [`Dynamsoft.DWT.ResourcesPath`]({{site.api}}Dynamsoft_WebTwainEnv.html#resourcespath)
- [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey)

### Explanation

 These two CDNs provide the file `dynamsoft.webtwain.min.js`, which contains the core of the DWT library, as well as add-ons (e.g. [PDF Rasterizer](https://www.dynamsoft.com/web-twain/pdf-to-image-javascript/) and others). The remaining resources are loaded in from the same path, which should be declared as a property. Note that an appropriate license key is required to use the add-on(s). 

## Loading from Package Managers

The resources obtained from the package managers differ slightly from the ones found in the official SDK package, in that it has the property `Dynamsoft.DWT.AutoLoad = false`, whereas it is `true` in the official SDK package. This property controls initialization behavior; read our [initialization guide]({{site.extended-usage}}advanced-initialization.html) to learn more. Just like the CDNs, the package managers require the users to supply a license key. See our [licensing page]({{site.general-usage}}license.html) for more details, and request a trial license [here](https://www.dynamsoft.com/customer/license/trialLicense/?product=dwt).

The DWT package is hosted on both `npm` and `yarn` (both packages are identical), and the installation commands are as follows:

### Installing from `npm`:
```shell
npm install dwt
```

### Installing from `yarn`:
```shell
yarn add dwt
```

Both of these package managers provide the resources as both a plain JavaScript file or as an ECMAScript module. `dynamsoft.webtwain.min.js` is plain JavaScript, which operates in the same way as the resources acquired from the [CDNs](#loading-from-cdn). On the other hand, the package managers also provide `dynamsoft.webtwain.min.mjs`, which is a ECMAScript module containing core DWT resources, also including add-ons. Either package manager provides the same files. The same licensing restrictions apply with using add-on functionality as with the files [loaded from CDN](#loading-from-cdn). This may be loaded as plain JavaScript, or as an ECMAScript module:

### Loading as Plain JavaScript

```html
<html>
    <head>
        <!-- Load resources -->
        <script src="./node_modules/dwt/dist/dynamsoft.webtwain.min.js"></script>
    </head>
    
    <body>
        <script>
            Dynamsoft.DWT.ResourcesPath = "./node_modules/dwt/dist/"; // Load supporting resources from here
            Dynamsoft.DWT.ProductKey = ""; // Add product key here
        </script>
    </body>
</html>
```

APIs used:

- [`Dynamsoft.DWT.ResourcesPath`]({{site.api}}Dynamsoft_WebTwainEnv.html#resourcespath)
- [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey)

### Loading as ECMAScript Module

> Note: To avoid confusion, we suggest renaming the default `node_modules` directory, or moving the `dwt` package to a different location for self-hosting, as the `node_modules` is reserved for Node.js dependencies.

```html
<html>
    <head>
    </head>

    <body>
        <script type="module">
            import Dynamsoft from 'dwt';
            Dynamsoft.DWT.ResourcesPath = "./node_modules/dwt/dist/"; // Load supporting resources from here
            Dynamsoft.DWT.ProductKey = ""; // Add product key here
        </script>
    </body>
</html>
```

APIs used:

- [`Dynamsoft.DWT.ResourcesPath`]({{site.api}}Dynamsoft_WebTwainEnv.html#resourcespath)
- [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey)
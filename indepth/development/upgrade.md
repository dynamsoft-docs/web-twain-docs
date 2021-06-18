---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN Development - Upgrade Guide
keywords: Dynamic Web TWAIN, Documentation, Development, Upgrade Guide
breadcrumbText: Upgrade Guide
description: Dynamic Web TWAIN SDK Documentation Upgrade Guide Page
---

# Upgrade

This upgrade section talks about how to upgrade Dynamic Web TWAIN to the latest version. 

#### IMPORTANT

Please be aware of the following namespace changes introduced in version 17.0.

| v17.0+ |v16.2- |
|:-|:-|
|`Dynamsoft.DWT` |`Dynamsoft.WebTwainEnv`|
|`Dynamsoft.DWT.EnumDWT_` |`Dynamsoft.EnumDWT_`|
|`Dynamsoft.DBR.EnumBarcodeFormat` |`Dynamsoft.EnumBarcodeFormat`|

More barcode enumeration can be found <a href="https://www.dynamsoft.com/barcode-reader/programming/javascript/api-reference/enum/EnumBarcodeColourMode.html?ver=latest" target="_blank">here</a>

See more Breaking Changes in V17.0 [here]({{site.info}}schedule/stable.html) 


## Update the resources files

The resources files refer to the Resources folder in the installation directory, C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN SDK 17.0. For more details, you can check [here]({{site.about}}faqs.html#what-are-the-resources-files).

### Regular Web application 

#### Uninstall the old version

* **Windows**: Search `Dynamic Web TWAIN` in `Control Panel -> Programs and Features` , and remove all the relevant components there.

* **macOS**: Execute `Applications > Dynamsoft > Dynamic Web TWAIN SDK {Version Number} > Uninstall.pkg`

#### Install the new version

You can [use the official installer]({{site.about}}resources.html#how-to-get-dwt) to install the new verion.

<a href="https://www.dynamsoft.com/web-twain/downloads" class="downloadBtn fr textUpperCase">Download SDK</a>

#### Replace the resources files

If you haven't renamed the official folder, the resources files should reside in a folder named "Resources". In this step, copy the new resources files and replace the old ones. The new files are typically found in the following location after the installation

* **Windows**: `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN SDK {Version Number}\`
* **macOS**: `Applications > Dynamsoft > Dynamic Web TWAIN SDK {Version Number}`

### Applications that make use of the `dwt` package

If your application uses a framework or library like `Angular` , `React` , `Vue` , etc., the upgrade is easier as you just need to install the new version to replace the old one. For example

``` cmd
npm install dwt
```

or 

``` cmd
yarn add dwt
```

You may want to update the types definition as well

``` cmd
npm install @types/dwt
```

or 

``` cmd
yarn add @types/dwt
```

## Update the Product Key

The Product Key needs to be updated when your current license is no longer valid (expired, for example) or when you upgrade across major versions. The Product Key is set using the global API `Dynamsoft.DWT.ProductKey` and the change is only effective before [creating `WebTwain` instances]({{site.indepth}}features/initialize.html#creating-the-webtwain-instance). 

In most cases, you can just make the change in the file `dynamsoft.webtwain.config.js` .

``` javascript
// If you have multiple license keys, just separate them with semicolons.
Dynamsoft.DWT.ProductKey = 't0076lQAAAGNcO61He******; t0076lQAAAGNcO61He******';
```

If it is set elsewhere, you need to find it and replace it. For example, if you are making use of the [dwt package](https://www.npmjs.com/package/dwt) ( `dynamsoft.webtwain.min.js` or `dynamsoft.webtwain.min.mjs` ), the file `dynamsoft.webtwain.config.js` doesn't exist and you should already have the above line of code in your own JavaScript where you can update the license when needed.

But if you are using [Per Browser Client](https://www.dynamsoft.com/Products/WebTWAIN_License.aspx#per_browser_client) license,  you need to use [handshakeCode]({{site.info}}api/Dynamsoft_WebTwainEnv.html#handshakecode) to set.

``` javascript
Dynamsoft.DWT.handshakeCode = "DynamsoftID-CustomCode";
Dynamsoft.DWT.Load();
```

Please note that this licensing model is only supported from `DWT` 17.0 and needs to be used with License Tracking Server (`LTS` for short). See more about [What is a LTS](https://www.dynamsoft.com/license-tracking/docs/selfhosting/managelts.html?ver=latest)

## Update `DWT` on the client-side

### Service mode

 Starting in version 16.*, `DWT` is designed to be backward compatible (unfortunately, just as far back as 16.0). The compatibility is done in two ways

* For minor versions like 16.1 to 16.2, if the newer version of `DWT` has been installed on a desktop, websites utilizing both the newer version and the older version can work without reinstallation of `DWT`
* For major versions like 16.* to 17.*, the newer version will be installed to a different directory which can coexist with the older version. The user can choose to uninstall the old version if necessary

That means, once you, as the maintainer, have finished upgrading your application to a newer `DWT` on the server side, the clients could face one of two situations

* If the clients have installed the same or even newer minor version of `DWT` themselves (probably from another application that uses `DWT` ), they don't need to do anything; 
* If the clients never installed `DWT` or have an older version or a different new major version of it, they will be required to do a reinstallation of `DWT` . The process is described [here]({{site.indepth}}deployment/service.html#how-to-install-dwt).

### WASM mode

By comparison, if `DWT` runs only in the [WASM mode]({{site.indepth}}features/initialize.html#wasm-mode), the clients don't need to install anything themselves as the [WASM browsers]({{site.getstarted}}platform.html#wasm-browsers) will take care of the upgrade process. What the clients may encounter is a slower-than-usual page load when they visit the application for the first time after the upgrade.

Once upgraded, the old WASM files will continue to exist in the browser as cached data until it's purged by the browser or by the user.

## Other Topics

### Expand your application to mobile platforms

If you are upgrading to version 17 for mobile functionality (basically, `DWT` in [wasm mode]({{site.indepth}}features/initialize.html#wasm-mode)), there are some considerations to be made. As mobile support is one of the newest offerings from Dynamsoft, not all of the old `DWT` features are fully available at present. That said, we are constantly working on increasing the supported mobile feature set, so we recommend reviewing our [release notes]({{site.info}}schedule/stable.html), and if you have any questions, contact [Dynamsoft Support]({{site.about}}getsupport.html).

As an example for how some existing `DWT` features will work on [mobile platforms]({{site.getstarted}}platform.html#browsers-on-mobile-devices), see below: 

#### Scanning

This will become either capturing from mobile cameras or [capturing from a Remote Windows machine]({{site.indepth}}features/input.html#how-to-enable-remote-scan) in the LAN.

#### Loading

This will be either loading or capturing.

#### Saving

This will become an in-browser download operation as mentioned [here]({{site.indepth}}features/output.html#save-as-a-download).

#### Editing

Similar to existing desktop functionality but the performance is not as good.

#### Uploading

Similar to existing desktop browser functionality but is limited to only one API [ `HTTPUpload()` ]({{site.info}}api/WebTwain_IO.html#httpupload).

#### Viewing

Identical to current desktop browser functionality.

#### Barcode reading

Identical to current desktop browser functionality.

#### PDF Handling

Similar to current desktop browser functionality but the rasterizing feature depends on embeded fonts in the PDF file whereas the on desktop, the system fonts can also be used.

#### OCR

Client-side support is to be added in a later version.

---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Dynamic Web TWAIN SDK License
keywords: Dynamic Web TWAIN, Documentation, License
breadcrumbText: License
description: Dynamic Web TWAIN SDK Documentation License Page
permalink: /general-usage/license.html
---

# Using License Keys

Dynamic Web TWAIN (DWT) requires a valid license key to function. License keys authorize the use of DWT, as well as any configured add-on modules.

## Use Trial Licenses

You can request a trial license of Dynamic Web TWAIN through our <a href="https://www.dynamsoft.com/customer/license/trialLicense?product=dwt" target="_blank">customer portal</a>, and we will email you your trial license key. You can also contact our [support team](https://www.dynamsoft.com/company/contact/) for new licenses and/or trial license extensions.

### Configure Trial License Keys

License keys are configured in the [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey) property. (**Note**: prior to version 17.0, this property was `Dynamsoft.WebTwainEnv.ProductKey`). The configuration differs depending on how a project loads DWT resource files (see [loading library resources]({{site.general-usage}}resource-loading.html) for more details). Trial key strings typically have the `t0076` prefix.

<div class="multi-panel-switching-prefix"></div>

- [Official SDK](#trial-keys-with-sdk) 
- [Package Managers](#trial-keys-with-package-managers)

<div class="multi-panel-start"></div>

1. Locate the `dynamsoft.webtwain.config.js` file (or search for `ProductKey`).

2. Assign the license key string to [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey):

   ```javascript
   Dynamsoft.DWT.ProductKey = 't0076******'; // Use an offline trial key
   ```

3. Load (or reload, if replacing an existing key) the web application and see that it starts scanning.

<div class="multi-panel-end">

</div><div class="multi-panel-start"></div>

When using package managers such as `npm`, be sure to check out our web framework samples. Roughly speaking, it involves setting `Dynamsoft.DWT.ProductKey` before calling either [`Dynamsoft.DWT.Load()`]({{site.api}}Dynamsoft_WebTwainEnv.html#load) or [`Dynamsoft.DWT.CreateDWTObjectEx()`]({{site.api}}Dynamsoft_WebTwainEnv.html#createdwtobjectex):

- [Use Web TWAIN in Angular]({{site.indepth}}development/angular.html)
- [Use Web TWAIN in React]({{site.indepth}}development/react.html)
- [Use Web TWAIN in Vue]({{site.indepth}}development/vue.html)

<div class="multi-panel-switching-end"></div>

## Using Full Licenses

Contact our [sales team](https://www.dynamsoft.com/store/dynamic-web-twain/) to purchase full licenses for Dynamic Web TWAIN. Use our <a href="https://www.dynamsoft.com/customer/license/fullLicense" target="_blank">customer portal</a> to manage full licenses. Full licenses are either offline licenses, or DLS-connected licenses. DLS-connected licenses contact DLS servers for authentication purposes - please see [Dynamsoft License Server](https://www.dynamsoft.com/license-server/docs/about/index.html) for more details. Full licenses may also be configured with add-on modules.

### Acquiring Full Keys

<div class="multi-panel-switching-prefix"></div>

- [DLS-Connected Keys](#get-dls-keys) 
- [Offline Keys](#get-offline-keys)

<div class="multi-panel-start"></div>

DLS-connected license keys begin with the `DLS` prefix. Learn more about the Dynamsoft Licensing Server [here](https://www.dynamsoft.com/license-server/docs/about/activate.html).

1. Without add-ons: activate the license in the customer portal, then acquire the DLS key. This key only authorizes the use of the core DWT module.
2. With add-ons: activate the license and configure the core DWT module along with add-ons into one project in DLS, then acquire the DLS key. This authorizes the use of the add-on modules on top of the core module.

<div class="multi-panel-end">

</div><div class="multi-panel-start"></div>

Offline license keys begin with the `f0068` prefix.

1. Without add-ons: activate the license in the customer portal, then acquire the offline key. This key only authorizes the use of the core DWT module.
2. With add-ons: activate the license in the customer portal, then acquire the offline keys. This may result in multiple license keys - one for the base DWT module, and separate ones for the add-ons. To use multiple keys in a single project, concatenate them (in any order) into a single string, separated with semicolons.

<div class="multi-panel-switching-end"></div>

### Configuring Full License Keys

To use a full license key, set the value of [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey) to the key string. (**Note**: prior to version 17.0, this property was `Dynamsoft.WebTwainEnv.ProductKey`) The configuration differs depending on how a project loads DWT resource files (see [loading library resources]({{site.general-usage}}resource-loading.html) for more details).

<div class="multi-panel-switching-prefix"></div>

- [DLS-Connected Keys](#use-dls-keys) 
- [Offline Keys](#use-offline-keys)
- [Multiple Offline Keys](#use-multiple-offline-keys)
- [Package Managers](#full-keys-with-package-managers)

<div class="multi-panel-start"></div>

1. Locate the `dynamsoft.webtwain.config.js` file (or search for `ProductKey`).

2. Assign the license key string to [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey):

   ```javascript
   Dynamsoft.DWT.ProductKey = 'DLS******'; // Use an online key
   ```

3. Load (or reload, if replacing an existing key) the web application and see that it starts scanning.

<div class="multi-panel-end">

</div><div class="multi-panel-start"></div>

1. Locate the `dynamsoft.webtwain.config.js` file (or search for `ProductKey`).

2. Assign the license key string to [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey):

   ```javascript
   Dynamsoft.DWT.ProductKey = 'f0068******;'; // Use an online key
   ```

3. Load (or reload, if replacing an existing key) the web application and see that it starts scanning.

<div class="multi-panel-end">

</div><div class="multi-panel-start"></div>

Offline license keys with add-ons should be concatenated (in any order) into a single string, separated with semicolons, and assigned to the same property (e.g. `f0068******;f0068******`).

1. Locate the `dynamsoft.webtwain.config.js` file (or search for `ProductKey`).

2. Assign the license key string to [`Dynamsoft.DWT.ProductKey`]({{site.api}}Dynamsoft_WebTwainEnv.html#productkey):

   ```javascript
   Dynamsoft.DWT.ProductKey = 'f0068******;f0068******'; // Use an online key
   ```

3. Load (or reload, if replacing an existing key) the web application and see that it starts scanning.

<div class="multi-panel-end">

</div><div class="multi-panel-start"></div>

When using package managers such as `npm`, be sure to check out our web framework samples. Roughly speaking, it involves setting `Dynamsoft.DWT.ProductKey` before calling either [`Dynamsoft.DWT.Load()`]({{site.api}}Dynamsoft_WebTwainEnv.html#load) or [`Dynamsoft.DWT.CreateDWTObjectEx()`]({{site.api}}Dynamsoft_WebTwainEnv.html#createdwtobjectex):

- [Use Web TWAIN in Angular]({{site.indepth}}development/angular.html)
- [Use Web TWAIN in React]({{site.indepth}}development/react.html)
- [Use Web TWAIN in Vue]({{site.indepth}}development/vue.html)

<div class="multi-panel-switching-end"></div>

## License Agreement

View the Dynamic Web TWAIN License Agreement <a href="https://www.dynamsoft.com/Products/WebTwain_license.aspx" target="_blank">here</a>.

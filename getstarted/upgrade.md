---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Dynamic Web TWAIN SDK Development - Upgrade Guide
keywords: Dynamic Web TWAIN, Documentation, Development, Upgrade Guide
breadcrumbText: Upgrade Guide
description: Dynamic Web TWAIN SDK Documentation Upgrade Guide Page
permalink: /indepth/development/upgrade.html
---

# Upgrade

This upgrade section talks about how to upgrade Dynamic Web TWAIN to a newer version. 

## How to upgrade

You can follow the steps below to upgrade Dynamic Web TWAIN:

1. Back up your current copy of `dynamsoft.webtwain.config.js`.

2. On your development machine, uninstall the old version of Dynamic Web TWAIN and install the new one.

3. Get the new **Resources** folder under the installation folder of Dynamic Web TWAIN and update the folder in your application. Use your original `dynamsoft.webtwain.config.js` if you want to keep the old settings. 

    Typical paths of Dynamic Web TWAIN folder:

   * **Windows**: `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN SDK {Version Number}\`
   * **macOS**: `Applications > Dynamsoft > Dynamic Web TWAIN SDK {Version Number}`

4. Make necessary updates to the related code.

    If you get a new **license key** for the new version, you may follow the steps in [License]({{site.about}}license.html) to update it.
 
    For changes in the new version, you can check the [Release Notes]({{site.info}}schedule/stable.html) and [Deprecations]({{site.info}}schedule/deprecated.html).

    > Note: Please be aware of the following namespace changes introduced in v17.0:

    > | v17.0+ |v16.2- |
    > |:-|:-|
    > |`Dynamsoft.DWT` |`Dynamsoft.WebTwainEnv`|
    > |`Dynamsoft.DWT.EnumDWT_` |`Dynamsoft.EnumDWT_`|
    > |`Dynamsoft.DBR.EnumBarcodeFormat` |`Dynamsoft.EnumBarcodeFormat`|

5. Deploy the new version files to your server and test. 

Beginning with Dynamic Web TWAIN v16.0, the Dynamic Web TWAIN Service(formerly known as Dynamsoft Service) is backward compatible within _the same major version_. Once you upgrade Dynamic Web TWAIN for your application on the server side, for **end-users' side**

- If the end-users have installed the same version or newer minor versions of Dynamic Web TWAIN Service, they don't need to do anything;
- If the end-users have never installed Dynamic Web TWAIN Service, or have an older version or a different newer major version of it, they will be required to do a reinstallation of Dynamic Web TWAIN Service. The process is described <a href="{{site.indepth}}deployment/service.html#installation-of-dynamsoft-service">here</a>  

## Update `dwt` package

If your application uses a framework or library like Angular, React, Vue, etc. and uses the `dwt` package, you can just install the new version of Dynamic Web TWAIN to replace the old one. For example:

> Note: the `@types/dwt` package is no longer used, and types are now included within the `dwt` package itself as of [version 17.0]({{site.info}}schedule/stable.html#17004202021).

For npm:

``` cmd
npm install dwt
```

For Yarn:

``` cmd
yarn add dwt
```
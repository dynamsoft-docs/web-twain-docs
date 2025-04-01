---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - UI Elements
keywords: Dynamic Web TWAIN, Documentation, UI
breadcrumbText: UI
description: Dynamic Web TWAIN SDK Documentation UI Page
permalink: /extended-usage/ui-customization.html
---

# UI Elements

In this section, we'll explore the UI Elements that are built into the `Dynamic Web TWAIN` library for user interactions. 

Generally speaking, most UI elements are configured in the file **dynamsoft.webtwain.install.js**. This file is already referenced inside the **dynamsoft.webtwain.initiate.js**.

## Installation Dialog

![UI 1]({{site.assets}}imgs/Initialization-1.png)

This dialog comes up when using `Dynamic Web TWAIN` scanner module under one of the following conditions:

* The Dynamic Web TWAIN Service is not installed
* The Dynamic Web TWAIN Service is not running
* A failure to connect to the Dynamic Web TWAIN Service

If needing to disable the default dialog or come up with your own install dialog, you can make changes to `Dynamsoft._show_install_dialog()` in the **dynamsoft.webtwain.install.js** file.
## Indicators

### Loading bar and backdrop

![UI 2]({{site.assets}}imgs/UI-8.png)

This loading bar and backdrop shows up when creating a `WebTwain` instance or when you try to scan. The functions `Dynamsoft.DWT.OnWebTwainPreExecute()` and `Dynamsoft.DWT.OnWebTwainPostExecute()` are called before and after the process. You can customize the behavior like this

``` javascript
Dynamsoft.DWT.OnWebTwainPreExecute = function() {
    // Show your own progress indicator
    console.log('An operation starts!');
};
Dynamsoft.DWT.OnWebTwainPostExecute = function() {
    // Hide the progress indicator
    console.log('An operation ends!');
};
```

On the other hand, you can also call the functions `Dynamsoft.DWT.OnWebTwainPreExecute()` and `Dynamsoft.DWT.OnWebTwainPostExecute()` to show and hide the loader bar and backdrop when you need it in your own workflow.

If you just want to change the loading bar, you can use the `Dynamsoft.DWT.CustomizableDisplayInfo.loaderBarSource` .

### Progress bar

When `Dynamic Web TWAIN` performs a time-consuming task, it'll show a progress bar. This progress bar is either like this

![UI-3]({{site.assets}}imgs/UI-7.png)

or like this (with a `Cancel` button)

![UI-4]({{site.assets}}imgs/UI-9.png)

The 1st bar shows up when saving, loading or converting and can be hidden by setting [ `IfShowProgressBar` ]({{site.info}}api/WebTwain_IO.html#ifshowprogressbar) to `false` .

Both bars show up when uploading or downloading and can be hidden by setting  [ `IfShowCancelDialogWhenImageTransfer` ]({{site.info}}api/WebTwain_IO.html#ifshowcanceldialogwhenimagetransfer) to `false` .

For uploading or downloading, you can also build your own progress bar with the help of the built-in event [ `OnInternetTransferPercentage` ]({{site.info}}api/WebTwain_IO.html#oninternettransferpercentage). 

``` javascript
DWTObject.RegisterEvent('OnInternetTransferPercentage',
    function(percentage) {
        console.log(percentage);
        // Use the percentage to build your own progress bar
    }
);
```

## Language

### Error Messages

`Dynamic Web TWAIN` has many built-in error messages as shown [here]({{site.info}}api/appendix.html#error-list). Each `ErrorString` has its own `ErrorCode` . To change the language of the message, you can read the `ErrorCode` and output the error string you have customized. For example

``` javascript
if (DWTObject.ErrorCode === -2359) {
    // ErrorString "The index is out of range."
    // To Spanish
    console.log("El índice está fuera de rango.")
}
```

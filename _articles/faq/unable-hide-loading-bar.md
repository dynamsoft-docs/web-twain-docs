---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Why I cannot hide the loading bar (spinner)?
keywords: Dynamic Web TWAIN, UI Customization, hide, spinner, loading bar
breadcrumbText: Why I cannot hide the loading bar (spinner)?
description: Why I cannot hide the loading bar (spinner)?
---

# UI Customization

## Why I cannot hide the loading bar (spinner)?

### Symptom:
In v17.3 of the Dynamic Web TWAIN SDK, you may find the spinner is unable to hide with the method mentioned in this [article](/_articles/extended-usage/ui-customization.md#loading-bar-and-backdrop), it will continue to spin or will never stop.

![image1](/assets/imgs/unable_hide_spinner_spinner.png)

### Cause:
The event `Dynamsoft.OnWebTwainPreExecuteCallback` is not registered in the **dynamsoft.webtwain.install.js** file in v17.3 so that the `Dynamsoft.DWT.OnWebTwainPreExecute()` will never be called.


### Workaround:
Step 1) In the **dynamsoft.webtwain.install.js** file, add the event behind the function `OnWebTwainPostExecuteCallback`.

![image3](/assets/imgs/unable_hide_spinner_install_code2.png)

````javascript
Dynamsoft.OnWebTwainPreExecuteCallback = function(){
    console.log("OnWebTwainPreExecuteCallback")
}
````

Step 2) Follow the step in this [article](/_articles/extended-usage/ui-customization.md#loading-bar-and-backdrop).


*Note: If `Dynamsoft.DWT.AutoLoad` in your code is set to false, please <a href="https://www.dynamsoft.com/company/contact/" target="_blank">contact us</a>.*

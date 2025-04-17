---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK HelloWorld - Initialization
keywords: Dynamic Web TWAIN, Documentation, Hello World, script, import
breadcrumbText: Hello World
description: Dynamic Web TWAIN SDK HelloWorld - Initialization
#---

# Initializing the Environment

To use any of the DWT functions, you will need to create a web application that loads the DWT environment.

## Create a web application

Create a `HelloWorld.html` anywhere and copy the `Resources` folder to the same location. You can typically find the `Resources` folder in `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN SDK {Version Number}\`.

* Resources

  ![Build-the-Hello-World-Scan-Page-1]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-1.png)


* The project

  ![Build-the-Hello-World-Scan-Page-2]({{site.assets}}imgs/Build-the-Hello-World-Scan-Page-2.png)


## Initialize the DWT environment

### Include the DWT scripts

Embed the script of the library and add a `div` element for the library on the page.

```html
<script src="Resources/dynamsoft.webtwain.initiate.js"></script>
<script src="Resources/dynamsoft.webtwain.config.js"></script>
```

```html
<div id="dwtcontrolContainer"></div>
```

> `dwtcontrolContainer` is the default id for the div in the default DWT resources, and any of the Dynamsoft provided demos. If you would like to use a different id for this div, you will need to change `Dynamsoft.DWT.Containers` in the file `dynamsoft.webtwain.config.js` to match.

### Initialize the DWT environment

Now that the scripts have been included in the application, it is time to write the code to use the DWT library.

DWT has a built in event that, by default, triggers `Dynamsoft_OnReady()` when the DWT Resources are loaded into browser memory. You can use this event to initialize the DWT object.

<!-- DWT has a built in event `OnWebTwainReady` that fires and, by default, triggers `Dynamsoft_OnReady()` when the DWT Resources are loaded into browser memory. You can use this event to initialize the DWT object. -->

```javascript
function Dynamsoft_OnReady() {
    DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
}
```

Link to API Reference:

- [`Dynamsoft.DWT.GetWebTwain()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#getwebtwain){:target="_blank" rel="noreferrer noopener"}
<!-- - [`OnWebTwainReady`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#onwebtwainready){:target="_blank" rel="noreferrer noopener"} -->

<!-- **What is Dynamsoft_OnReady?**

DWT's default behaviour is to initalizae the DWT environment as soon as the application has loaded the DWT scripts. Once the scripts have been completely loaded, `OnWebTwainReady` is automatically fired and will look for `Dynamsoft_OnReady()`. For more information please see the API description for the [`OnWebTwainReady`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#onwebtwainready){:target="_blank" rel="noreferrer noopener"}. -->

### Review the Code

```html
<html>

<head>
    <title>Hello World</title>
    <script src="Resources/dynamsoft.webtwain.initiate.js"></script>
    <script src="Resources/dynamsoft.webtwain.config.js"></script>
</head>

<body>
    <input type="button" value="Scan" onclick="AcquireImage();" />
    <div id="dwtcontrolContainer"></div>

    <script type="text/javascript">
        var DWTObject;

        function Dynamsoft_OnReady() {
            DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
        }

    </script>
</body>

</html>
```

## Run the application

![HelloWorldInit]({{site.assets}}imgs/HelloWorldInit.png)

# Next article

Now that the envrionment is loaded and ready to go, the next step will be [scanning an image]({{site.getstarted}}scanning.html).
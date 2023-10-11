---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - Global APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, Global APIs
breadcrumbText: Global
description: Dynamic Web TWAIN SDK Documentation API Reference Global APIs Page
permalink: /info/api/Dynamsoft_WebTwainEnv.html
---

# `Dynamsoft.DWT`
> Global properties and functions.

``` typescript
interface Dynamsoft.DWT {
    readonly licenseException: string;
    
    readonly ActiveXVersion: string;
    readonly JSVersion: string;
    readonly PdfVersion: string;
    readonly ServerLinuxVersionInfo: string;
    readonly ServerMacVersionInfo: string;
    readonly ServerVersionInfo: string;
    /**
     * Whether to load UI related js files.
    */
    UseDefaultViewer: boolean;
    /**
    * Attach the callback function to the specified event.
    * @param event Specify the event.
    * @param callback Specify the callback.
    */
    RegisterEvent(event: string, callback: (...args: any[]) => void): void;
    /**
     * Whether to create a WebTwain instance automatically.
     */
    AutoLoad: boolean;
    ContainerMap: object;
    /**
     * Define the friendly name to the specified client device.
     */
    DeviceFriendlyName: string;
    /**
     * Define the Id and UI of the WebTwain instances.
     */
    Containers: Container[];
    Host: string; //"local.dynamsoft.com"
    IfAddMD5InUploadHeader: boolean;
    IfDisableDefaultSettings: boolean;
    IfUseActiveXForIE10Plus: boolean;
    readonly inited: boolean;
    ProductKey: string;
    /**
     * Define the path to the Web TWAIN resources folder
     */
    ResourcesPath: string;
    /**
     * Define the path to the Web TWAIN dist folder (client side service installers)
     */
    ServiceInstallerLocation: string;
    
    // Functions
    CreateDWTObject(
        ContainerId: string, 
        host?: string, 
        port?: string | number, 
        portSSL?: string | number, 
        asyncSuccessFunc: function (DWObject: WebTwain) {}, 
        asyncFailureFunc: function (errorString: string) {}
    ): void;
    CreateDWTObjectEx(
        dwtInitialConfig: DWTInitialConfig,                 
        asyncSuccessFunc: (DWObject: WebTwain) => {},                   
        asyncFailureFunc: (errorString: string) => {}
    ): void;
    DeleteDWTObject(Id?: string): boolean;
    GetWebTwain(ContainerIdOrWebTwainId?: string): WebTwain;
    GetWebTwainEx(ContainerIdOrWebTwainId: string): WebTwain;
    Load(): void;
    Unload(): void;
    OnWebTwainPostExecute: function () {};
    OnWebTwainPreExecute: function () {};
}

/**
 * Update and download cert to DynamsoftServicex64_17\cert 
 */
UpdateCert(
    url: string, // url to download the new certificate. 
    optionalAsyncSuccessFunc?: function () {}, 
    optionalAsyncFailureFunc?: function (errorCode: number, errorString: string) {}
);

```

## licenseException

Error message related to license.

**Syntax**

``` typescript
licenseException: string;
```

**Usage notes**

Check [license error list](https://www.dynamsoft.com/license-tracking/docs/common/errorlist.html) 

## Options

### `Containers`

An array of `Container` definitions that specifies the UI elements for `WebTwain` instances. The `Container` interface is defined below

``` typescript
interface Container {
    WebTwainId?: string, // Id of the WebTwain instance
    ContainerId?: string, // Id of the element
    Width?: string | number, // Width of the element
    Height?: string | number // Height of the element
}
```

`WebTwainId` and `ContainerId` are both optional but one must exist as the identifier for that `WebTwain` instance.

`Width` and `Height` determine the initial viewer size of the instance.

### `IfAddMD5InUploadHeader`
  
Whether or not an md5 header `dwt-md5` should be included in HTTP upload requests. Note that this header is not a standard header and may be deemed invalid on some web servers.
  
The default value is `false` .

### `ProductKey`

Sets or returns the product key for the library. A product key is required to enables certain modules of the library.
  
### `ResourcesPath`

Sets or returns where the library looks for resources files including service installers, CSS, etc.

## Functions

### `UpdateCert`

Update and download certificate (server.pem.ldsc & server_key.pem.ldsc) to DynamsoftServicex64_17\cert.

**Syntax**

``` typescript
UpdateCert(
    url: string,
    optionalAsyncSuccessFunc?: () => void,
    optionalAsyncFailureFunc?: (
        errorCode: number, 
        errorString: string) => void
);
```

**Parameters**

`url`: Url to download the new certificate. E.g. http://download.dynamsoft.com/cert.zip. server.pem.ldsc & server_key.pem.ldsc should be in cert.zip.

`successCallback`: A callback function that is executed if the request succeeds.

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
</tr>

</table>
</div>

**Example**
``` javascript
// overwrite the following function in dynamsoft.webtwain.install.js
   Dynamsoft.OnSSLCertInfo = function (sslExpiredDate) {
        console.log(sslExpiredDate);
   Dynamsoft.DWT.UpdateCert("https://domainlocation.com/cert.zip", 
        function () { console.log("OK"); }, 
        function (errorCode, errorString) { console.log(errorString);}
    );
  };
```

### `CreateDWTObject()`

  Creates a new `WebTwain` instance that listens to the specified host & ports. An UI element specified by the parameter `ContainerId` which is typically a <div> is required. The library will generate a UI and bind it to this element.
  

### `CreateDWTObjectEx()`

  Creates a new UI-less `WebTwain` instance. This instance will be uniquely identified by the parameter `WebTwainId` .

``` typescript
interface DWTInitialConfig {
    WebTwainId: string,
        Host ? : string,
        Port ? : string,
        PortSSL ? : string,
}
```

### `DeleteDWTObject()`

  Delete the `WebTwain` instance specified by `Id` which can either be a `ContainerId` or a `WebTwainId` .

### `GetWebTwain()`

  Gets an `WebTwain` instance by its `ContainerId` .

### `GetWebTwainEx()`

  Gets an `WebTwain` instance by its `WebTwainId` .
  
### `Load()`

  Initiates the library. If there are predefined `Containers` , one `WebTwain` instance will be created for each `Container` .

### `RegisterEvent()`
  [We removed OnWebTWainReady...]: # 
  Registers an environmental event. Typically the event is `OnWebTwainReady` which is triggered when the initialization completes.

### `Unload()`

  Destroys all `WebTwain` instances and cuts off the connection to the Dynamsoft Service.

### `UseDefaultViewer`

Whether to use the built-in viewer. If it is set to `false` , the file `dynamsoft.webtwain.viewer.js` is not loaded at all and there is no way to add it back later. Therefore, only set it to `false` when you absolutely won't need the viewer or will be building your own viewer.

### `CustomizableDisplayInfo`

Use this API to customize the UI.

#### `errorMessages`

Specify the error messages.

#### `generalMessages`

Specify general messages.

#### `customProgressText`

Specify text on progress bars.

#### `buttons`

Specify the titles and whether to show one or multiple buttons on the image editor.

#### `dialogText`

Specify the text on dialogs.

#### `loaderBarSource`

Specify the source of the loader bar image. Check out more on [HTMLImageElement.src](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/src).

#### `loaderBarClassName`

Specify the class name of the DIV element that contains the loader bar. With this class, you can customize the loader bar even further with CSS.

#### `OnWebTwainReady`

A built-in callback triggered when the Web TWAIN resources have completed loading

**Example**
```javascript
Dynamsoft.DWT.RegisterEvent('OnWebTwainReady', 
  Dynamsoft_OnReady //The typical function for initalizing the environment once the resources have loaded
); 
```

#### `OnWebTwainError`

A built-in callback triggered when an error is detected when loading the Web TWAIN environment

**Example**
```javascript
Dynamsoft.DWT.RegisterEvent('OnWebTwainError', 
  Dynamsoft_OnError 
); 

 
function Dynamsoft_OnError(error){
  // error handling
  console.error(error.message);
} 
```

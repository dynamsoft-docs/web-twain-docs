---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - Global APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, Global APIs
breadcrumbText: Global
description: Dynamic Web TWAIN SDK Documentation API Reference Global APIs Page
permalink: /info/api/Dynamsoft_WebTwainEnv.html
---

# Global
> The Global Web TWAIN properties and methods on this page live in the namespace `{Dynamsoft.DWT}`,

**Methods**

|                                       |                                           |                                       |                                    |
|---------------------------------------|-------------------------------------------|---------------------------------------|------------------------------------|
| [`CreateDWTObject()`](#createdwtobject) | [`CreateDWTobjectEx()`](#createdwtobjectex) | [`DeleteDWTObject()`](#deletedwtobject) | [`GetWebTwain()`](#getwebtwain)      |
| [`Load()`](#load)                       | [`RegisterEvent()`](#registerevent)         | [`Unload()`](#unload)                   |        |

<!-- [`UpdateCert()`](#updatecert)  -->

**Properties**

|                                         |                                                     |                                                            |                                 |
|-----------------------------------------|-----------------------------------------------------|------------------------------------------------------------|---------------------------------|
| [`Autoload`](#autoload)   | [`Containers`](#containers)  | [`CustomizableDisplayInfo`](#customizabledisplayinfo)   | [`DeviceFriendlyName`](#devicefriendlyname)   |
| [`Host`](#host)  | [`IfAddMD5InUploadHeader`](#ifaddmd5inuploadheader) | [`IfConfineMaskWithinTheViewer`](#ifconfinemaskwithintheviewer)   | [`IfUseActiveXForIE10Plus`](#ifuseactivexforie10plus)   |
| [`JSVersion`](#jsversion)     | [`ProductKey`](#productkey)     | [`ResourcesPath`](#resourcespath) | [`ServiceInstallerLocation`](#serviceinstallerlocation)  |
| [`UseDefaultViewer`](#usedefaultviewer) | [`IfCheckCORS`](#ifcheckcors)   |                      |


**Events**

|                                       |                                       |                             |                            |
|---------------------------------------|---------------------------------------|-----------------------------|----------------------------|
| [`OnWebTwainReady`](#onwebtwainready) | [`OnWebTwainError`](#onwebtwainerror) | [`OnWebTwainPostExecute`](#onwebtwainpostexecute) | [`OnWebTwainPreExecute`](#onwebtwainpreexecute) | 


<!--
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
        asyncSuccessFunc: function (DWTObject: WebTwain) {}, 
        asyncFailureFunc: function (errorString: string) {}
    ): void;
    CreateDWTObjectEx(
        dwtInitialConfig: DWTInitialConfig,                 
        asyncSuccessFunc: (DWTObject: WebTwain) => {},                   
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
-->
<!-- ## Options -->

<!-- 
### errorMessages

Specify the error messages.

### generalMessages

Specify general messages.

### customProgressText

Specify text on progress bars.

### buttons

Specify the titles and whether to show one or multiple buttons on the image editor.

### dialogText

Specify the text on dialogs.

### loaderBarSource

Specify the source of the loader bar image. Check out more on [HTMLImageElement.src](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/src).

### loaderBarClassName

Specify the class name of the DIV element that contains the loader bar. With this class, you can customize the loader bar even further with CSS. -->


## CreateDWTObject()

Creates a new `WebTwain` instance that listens to the specified host & ports. An UI element specified by the parameter `ContainerId` which is typically a <div> is required. The library will generate UI and bind it to this element.

**Syntax**

```typescript
CreateDWTObject(
    ContainerId: string, 
    successCallBack: (DWTObject: WebTwain) => void,
    failureCallBack: ({code: number, message: string}) => void
): void;

CreateDWTObject(
    ContainerId: string, 
    host: string, 
    port: string | number, 
    portSSL: string | number, 
    successCallBack: (DWTObject: WebTwain) => void,
    failureCallBack: ({code: number, message: string}) => void
): void;
```

**Parameters**

`ContainerId`: Specify the id of HTML element (typically of the type HTMLDivElement) to hold the UI.

`host`: Specify the host. Default value: `"127.0.0.1"`

`port`: Specify the port. Default value: `18622`

`portSSL`: Specify the SSL port. Default value: `18623`

`successCallback`: A callback function that is executed if the request succeeds.
- `DWTObject`: The `WebTwain` instance.

`failureCallback`: A callback function that is executed if the request fails.
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
<td align="center">not supported</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```typescript
var DWTObject;
Dynamsoft.DWT.CreateDWTObject('dwtcontrolContainer',"127.0.0.1", 18622, 18623,
    function (DWTObject) { 
        DWTObject = DWTObject;
        DWTObject.SelectSourceAsync().then(function () {
        DWTObject.AcquireImageAsync({ 
            IfCloseSourceAfterAcquire: true 
        });
    }).catch(function (exp) {
        alert(exp.message);
    });}, 
    function (error) {console.log(error);}
);
```

OR

```typescript
var DWTObject;
Dynamsoft.DWT.CreateDWTObject('dwtcontrolContainer',
        function (DWTObject) { 
            DWTObject = DWTObject;
            DWTObject.SelectSourceAsync().then(function () {
            DWTObject.AcquireImageAsync({ 
                IfCloseSourceAfterAcquire: true 
            });
        }).catch(function (exp) {
            alert(exp.message);
        });}, 
        function (error) {console.log(error);}
);
```

---

## CreateDWTObjectEx()

Creates a new UI-less `WebTwain` instance. This instance will be uniquely identified by the parameter `WebTwainId`.

**Syntax**

```typescript
CreateDWTObjectEx(
  dwtInitialConfig: DWTInitialConfig, 
  successCallBack: (DWTObject: WebTwain) => void, 
  failureCallBack: ({code: number, message: string}) => void
): void;
```

**Parameters**

`dwtInitialConfig`: Specify the initial configuration of the instance. Please refer to [`DWTInitialConfig`]({{site.info}}api/Interfaces.html#DWTInitialConfig).

`successCallback`: A callback function that is executed if the request succeeds.
- `DWTObject`: The `WebTwain` instance.

`failureCallback`: A callback function that is executed if the request fails.
- `code`: The error code.
- `message`: The error string.

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
<td align="center">not supported</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
<td align="center">v16.0+</td>
</tr>

</table>
</div>

**Example**

```typescript
var DWTObject;
Dynamsoft.DWT.CreateDWTObjectEx({
      WebTwainId: 'dwtId',
  },function (DWTObject) {
      DWTObject = DWTObject;
      DWTObject.Viewer.bind("dwtcontrolContainer");
      DWTObject.Viewer.show();
      DWTObject.SelectSourceAsync().then(function () {
              DWTObject.AcquireImageAsync({ 
                  IfCloseSourceAfterAcquire: true 
              });
          }).catch(function (exp) {
              alert(exp.message);
          });
  }, function (error) {
      console.log(error);
});
```

---

## DeleteDWTObject()

Delete and destroy the specified `WebTwain` instance.

**Syntax**

```typescript
DeleteDWTObject(Id: string): boolean;
```

**Parameters**

`Id`: Specify the instance with its `ContainerId` or `WebTwainId`.

**Return Value**

`true`: Successfully.

`false`: Failed.

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
<td align="center">not supported</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

## GetWebTwain()

Return the `WebTwain` instance by its `ContainerId` or `WebTwainId`.

**Syntax**

```typescript
GetWebTwain(ContainerIdOrWebTwainId?: string): WebTwain;
```

**Parameters**

`ContainerIdOrWebTwainId`: Specify the instance with its `ContainerId` or `WebTwainId`.

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
<td align="center">v10.1+</td>
<td align="center">v10.1+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
var DWTObject;
function Dynamsoft_OnReady() {
    DWTObject = Dynamsoft.DWT.GetWebTwain('dwtcontrolContainer'); // Get the Dynamic Web TWAIN object that is embeded in the div with id 'dwtcontrolContainer'
}
```

**Usage Note**

- If no parameter is provided, the first valid `WebTwain` instance is returnd.

---

<!-- ## GetWebTwainEx()

Gets an `WebTwain` instance by its `WebTwainId`.

--- -->
  
## Load()

Initiates the library. If there are predefined [`Containers`](#containers), one `WebTwain` instance will be created for each `Container`. 

**Syntax**

```typescript
Load(): Promise<void>;
```

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
<td align="center">v10.2+</td>
<td align="center">v10.2+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
Dynamsoft.DWT.Load();
```

**Usage Note**

- Only used if [`AutoLoad`](#autoload) is set to `false`.

---

## RegisterEvent()

Registers an environmental event.

**Syntax**

```typescript
Dynamsoft.DWT.RegisterEvent(eventName: string, listener: (...arguments: any[])=>any): boolean;
```

**Parameters**

`eventName`: Specify the event. Supported events: [`OnWebTwainReady`](#onwebtwainready), [`OnWebTwainError`](#onwebtwainerror), [`OnWebTwainPostExecute`](#onwebtwainpostexecute), [`OnWebTwainPreExecute`](#onwebtwainpreexecute)

`listener`: Specify the callback.

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
<td align="center">v1.0+</td>
<td align="center">v10.0+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```javascript
Dynamsoft.DWT.RegisterEvent('OnWebTwainReady',
 Dynamsoft_OnReady //The typical function for initalizing the environment once the resources have loaded
);
 
function Dynamsoft_OnReady() {
DWTObject = Dynamsoft.DWT.GetWebTwain('dwtcontrolContainer'); // Get the Dynamic Web TWAIN object that is embeded in the div with id 'dwtcontrolContainer'
}
 
Dynamsoft.DWT.RegisterEvent("OnWebTwainError", function (error) {
});
 
Dynamsoft.DWT.RegisterEvent("OnWebTwainPostExecute", function () {
});
 
Dynamsoft.DWT.RegisterEvent("OnWebTwainPreExecute", function () {
});
```

---

## Unload()

Destroys all `WebTwain` instances and cuts off the connection to the Dynamsoft Service.

**Syntax**

```typescript
Unload(): void;
```

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
<td align="center">v10.2+</td>
<td align="center">v10.2+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

<!-- ## UpdateCert

Update and download certificate (server.pem.ldsc & server_key.pem.ldsc) to DynamsoftServicex64_{version}\cert.

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

--- -->

## AutoLoad

Specifies whether or not to load the Web TWAIN environment when the Dynamic Web TWAIN scripts are loaded into memory.

**Syntax**

```typescript
AutoLoad: boolean;
```

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
<td align="center">v10.2+</td>
<td align="center">v10.2+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage Notes**

Default value: `true`.

---

## Containers

Defines the Id and UI of the WebTwain instances.

**Syntax**

```typescript
Containers: Container[];
```

Please refer to [`Container`]({{site.info}}api/Interfaces.html#Container).

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
<td align="center">v10.1+</td>
<td align="center">v10.1+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

## CustomizableDisplayInfo

Define the display info.

**Syntax**

```typescript
CustomizableDisplayInfo: DisplayInfo;
```

Please refer to [`DisplayInfo`]({{site.info}}api/Interfaces.html#DisplayInfo).

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
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
</tr>

</table>
</div>

---

## DeviceFriendlyName

This property allows you to specify a specified name to the client machine that will be used to identify the client machine when using Dynamsoft License Server. If this is not set, a randomly generated non-tracable UID will be generated.

**Syntax**

```typescript
DeviceFriendlyName: string;
```

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
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

---

## Host

Specify the target address for the local Dynamsoft Service.

**Syntax**

```typescript
Host: string;
```

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
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
</tr>

</table>
</div>

**Usage Notes**

Default value: `127.0.0.1`.

---

## IfAddMD5InUploadHeader
  
Whether or not an md5 header `dwt-md5` should be included in HTTP upload requests. Note that this header is not a standard header and may be deemed invalid on some web servers.

**Syntax**

```typescript
IfAddMD5InUploadHeader: boolean;
```

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
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

**Usage Notes**

Default value: `false`.

---

## IfConfineMaskWithinTheViewer

This property defines whether any Dynamic Web TWAIN generated masks will apply to the entire window or just the `Viewer` object. Setting this property to `true` will confine the mask to the `Viewer` object.

**Syntax**

```typescript
IfConfineMaskWithinTheViewer: boolean;
```

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
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

**Usage Notes**

Default Value: `false`.

---

## IfUseActiveXforIE10Plus

This property specifies whether Dynamic Web TWAIN will be loaded using HTML5 or ActiveX when loaded in Internet Explorer 10+. 

**Syntax**

```typescript
IfUseActiveXForIE10Plus: boolean;
```

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
<td align="center">v10.3+</td>
<td align="center">v10.3+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Usage Notes**

- Default value: `false`. 
- If set to `true`, ActiveX will be used, else HTML5 will be used.
- This property needs to be set before Dynamic Web TWAIN loads.

---

## JSVersion

This is a readonly property that specifies what version the server side Dynamic Web TWAIN resources are being used with the web application.

**Syntax**

```typescript
readonly JSVersion: string;
```

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
<td align="center">v13.1+</td>
<td align="center">v13.1+</td>
<td align="center">v13.1+</td>
<td align="center">v13.1+</td>
<td align="center">v13.1+</td>
</tr>

</table>
</div>

---

## ProductKey

Sets or returns the product key for the library. A valid product key is required for each module of Dynamic Web TWAIN.

**Syntax**

```typescript
ProductKey: string;	
```

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
<td align="center">v10.1+</td>
<td align="center">v10.1+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**

```typescript
Dynamsoft.DWT.ProductKey = 't0076lQAAAGNcO61He******';
```

If you have multiple license keys, separate them with semicolons like below:

```typescript
Dynamsoft.DWT.ProductKey = 't0076lQAAAGNcO61He******;t0076lQAAAGNcO61He******';
```

---

## ResourcesPath

Sets or returns where the path to the Dynamic Web TWAIN resource files are hosted.

**Syntax**

```typescript
ResourcesPath: string;
```

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
<td align="center">v10.1+</td>
<td align="center">v10.1+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

## ServiceInstallerLocation

Sets or returns where the path to the Dynamsoft Service installers are hosted.

**Syntax**

```typescript
ServiceInstallerLocation: string;
```

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
<td align="center">v18.4+</td>
<td align="center">v18.4+</td>
<td align="center">v18.4+</td>
<td align="center">v18.4+</td>
<td align="center">v18.4+</td>
</tr>

</table>
</div>

---

## UseDefaultViewer

Whether to use the built-in viewer. 

**Syntax**

```typescript
UseDefaultViewer: boolean;
```

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
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
<td align="center">v16.2+</td>
</tr>

</table>
</div>

**Usage Notes**

- If it is set to `false`, the file `dynamsoft.webtwain.viewer.js` is not loaded at all and there is no way to add it back later. Therefore, only set it to `false` when you absolutely won't need the viewer or will be building your own viewer.

---

## IfCheckCORS

Whether to check CORS issue in detail.

**Syntax**

```typescript
IfCheckCORS: boolean;
```

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
<td align="center">not supported</td>
<td align="center">v18.5+</td>
<td align="center">v18.5+</td>
<td align="center">v18.5+</td>
<td align="center">v18.5+</td>
</tr>

</table>
</div>

**Usage Notes**

- Default value: `false`.
- When set to `true`, if encountering a CORS issue, it will detect the issue more specifically and return the corresponding CORS error.
- When set to `false`, if encountering a CORS issue, it will solely detect that the Dynamsoft Service is not connected and prompt a service installation window.

---

## OnWebTwainReady

A built-in callback triggered when the Web TWAIN resources have completed loading

**Syntax**

```typescript
RegisterEvent("OnWebTwainReady", function () {});
```

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
<td align="center">v10.1+</td>
<td align="center">v10.1+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

**Example**
```javascript
Dynamsoft.DWT.RegisterEvent('OnWebTwainReady', 
  Dynamsoft_OnReady //The typical function for initalizing the environment once the resources have loaded
); 

var DWTObject;

function Dynamsoft_OnReady() {
  DWTObject = Dynamsoft.DWT.GetWebTwain('dwtcontrolContainer'); // Get the Dynamic Web TWAIN object that is embeded in the div with id 'dwtcontrolContainer'
}
```

---

## OnWebTwainError

A built-in callback triggered when an error is detected when loading the Web TWAIN environment.

**Syntax**

```typescript
RegisterEvent("OnWebTwainError", function () {});
```

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
<td align="center">v18.2+</td>
<td align="center">v18.2+</td>
<td align="center">v18.2+</td>
<td align="center">v18.2+</td>
<td align="center">v18.2+</td>
</tr>

</table>
</div>

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

---

## OnWebTwainPostExecute

This event triggers at the resolution of an asynchronous API.

The default behaviour is to hide the mask and loading spinner triggered by `OnWebTwainPreExecute`.

You may override this function to implement your own post-excecute scenario. Please refer to this [article]({{site.indepth}}features/ui.html#loading-bar-and-backdrop).


**Syntax**

```typescript
RegisterEvent("OnWebTwainPostExecute", function () {});
```


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
<td align="center">not supported</td>
<td align="center">v10.3+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>

---

## OnWebTwainPreExecute

This event triggers at the beginning of an asynchronous API. 

The default behaviour is to display a mask and a loading spinner.

You may override this function to either hide the default loading spinner, or define your own. Please refer to this [article]({{site.indepth}}features/ui.html#loading-bar-and-backdrop).

**Syntax**

```typescript
RegisterEvent("OnWebTwainPreExecute", function () {});
```

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
<td align="center">not supported</td>
<td align="center">v10.3+</td>
<td align="center">v11.0+</td>
<td align="center">v11.0+</td>
<td align="center">v12.1+</td>
</tr>

</table>
</div>
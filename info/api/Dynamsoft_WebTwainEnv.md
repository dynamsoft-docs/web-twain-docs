---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN API Reference - Global APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, Global APIs
breadcrumbText: Global
description: Dynamic Web TWAIN SDK Documentation API Reference Global APIs Page
permalink: /info/api/Dynamsoft_WebTwainEnv.html
---

# `Dynamsoft.DWT`
> Global properties and functions.

``` typescript
interface Dynamsoft.DWT {
    readonly licenseServer: string [];
    readonly organizationID: string;
    readonly handshakeCode: string;
    readonly sessionPassword: string;
    readonly licenseException: string;
    
    readonly ActiveXVersion: string;
    readonly JSVersion: string;
    readonly PdfVersion: string;
    readonly ServerLinuxVersionInfo: string;
    readonly ServerMacVersionInfo: string;
    readonly ServerVersionInfo: string;
    /**
     * Whether to create a WebTwain instance automatically.
     */
    AutoLoad: boolean;
    ContainerMap: object;
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
    ResourcesPath: string;
    UseLocalService: boolean;
     /**
     * Whether to use camera wasm. The default value is false. 
     * Set this property to true if you want to use camera wasm in service mode.
     */
    UseCameraAddonWasm: boolean;
    
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
    GetWebTwain(ContainerId?: string): WebTwain;
    GetWebTwainEx(WebTwainId: string): WebTwain;
    Load(): void;
    Unload(): void;
    RemoveAllAuthorizations: function () {};    
    OnWebTwainNotFound: function () {};
    OnWebTwainPostExecute: function () {};
    OnWebTwainPreExecute: function () {};
    OnWebTwainReady: function () {};
    OnWebTwainWillInit: function () {};
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

## licenseServer

**Syntax**

``` typescript
/**
 * Specify by URL the license server from where authorization is acquired at runtime.
 */
licenseServer: string [];
```

**Example**
``` javascript
Dynamsoft.DWT.licenseServer = ["https://your.mainServer.com", "https://your.backupServer.com"];
```

**Usage notes**

Gets or sets the URL of the License Tracking Server used to authenticate the license (handshakeCode) and track usage. When set to null (default value), it will connect to Dynamsoft's License Tracking Server for online verification. A self hosting option is available. Learn more about [License Tracking Server 2.0](https://www.dynamsoft.com/license-tracking/docs/about/index.html). 


## organizationID

**Syntax**

``` typescript
/**
 * Get or set the organization ID. 
 */
organizationID: string;
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
<td align="center">WASM</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v17.1+ </td>
<td align="center">v17.1+ </td>
<td align="center">v17.1+ </td>
<td align="center">v17.1+ </td>
<td align="center">v17.1+ </td>
</tr>

</table>
</div>


**Example**
``` javascript
Dynamsoft.DWT.organizationID = "123456"; // replace the number 123456 with YOUR-ORGANIZATION-ID
```

**Usage notes**

Check out more on [how to specify the Organization ID](https://www.dynamsoft.com/license-tracking/docs/common/mechanism.html#specify-the-organization-id)

## handshakeCode

**Syntax**

``` typescript
/**
 * Gets or sets the handshake code to interact with the license server(s).
 */
handshakeCode: string;
```

**Example**
``` javascript
Dynamsoft.DWT.handshakeCode = "1000**601-1000***44";
```

**Usage notes**

Learn more about [What is handshakeCode](https://www.dynamsoft.com/license-tracking/docs/about/terms.html#handshake-code)

## sessionPassword

**Syntax**

``` typescript
/**
 * Gets or sets the session password of the handshake code set in Dynamsoft License server.
 */
handshakeCode: string;
```

**Example**
``` javascript
Dynamsoft.DWT.sessionPassword = "MyPassw0rd";
```

**Usage notes**
Learn more about [session password](https://www.dynamsoft.com/license-tracking/docs/about/terms.html#session-password) in Dynamsoft License server.

## licenseException

**Syntax**

``` typescript
/**
 * Error message related to license.
 */
licenseException: string;
```

**Usage notes**

Check [license error list](https://www.dynamsoft.com/license-tracking/docs/common/errorlist.html) 

## Options

### `UpdateCert`

**Syntax**

``` typescript
/**
 * Update and download certificate (server.pem.ldsc & server_key.pem.ldsc) to DynamsoftServicex64_17\cert.
 * @param url Url to download the new certificate. E.g. http://download.dynamsoft.com/cert.zip. server.pem.ldsc & server_key.pem.ldsc should be in cert.zip. 
 * @param successCallback A callback function that is executed if the request succeeds.
 * @param failureCallback A callback function that is executed if the request fails.
 * @argument errorCode The error code.
 * @argument errorString The error string.
 */
UpdateCert(
        url: string,
        optionalAsyncSuccessFunc?: () => void,
        optionalAsyncFailureFunc?: (
            errorCode: number, 
            errorString: string) => void
    );
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
<td align="center">WASM</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

**Example**
``` javascript
// overwrite the following function in dynamsoft.webtwain.install.js
   Dynamsoft.OnSSLCertInfo = function (sslExpiredDate) {
        console.log(sslExpiredDate);
   Dynamsoft.DWT.UpdateCert("https://xxx.com/cert.zip", 
        function () { console.log("OK"); }, 
        function (errorCode, errorString) { console.log(errorString);}
    );
  };
```

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

### `UseLocalService`

Sets or returns whether to use the service or use WASM only. This property can be changed at runtime (but not recommended) and affects `WebTwain` instances created after the change.

The default value is `true` .
  
### `UseCameraAddonWasm`

Whether to use camera wasm. Set this property to true if you want to use camera wasm in service mode.

The default value is false. 

## Functions

### `CreateDWTObject()`

  Creates a new `WebTwain` instance that listens to the specified host & ports. An UI element specified by the parameter `ContainerId` which is typically a <div> is required. The library will generate a UI and bind it to this element.
  

### `CreateDWTObjectEx()`

  Creates a new UI-less `WebTwain` instance. This instance will be uniquely identified by the parameter `WebTwainId` .

``` typescript
interface DWTInitialConfig {
    WebTwainId: string,
        Host ? : string,
        Port ? : string,
        PortSSL ? : string
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

  Registers an environmental event. Typically the event is `OnWebTwainReady` which is triggered when the initialization completes.

### `Unload()`

  Destroys all `WebTwain` instances and cuts off the connection to the Dynamsoft Service.

### `RemoveAllAuthorizations()`

Removes the specific authorizations made by end users on a client machine. Only effective when the security feature is enabled for local files, scanners or cameras.

### `UseDefaultViewer`

Whether to use the built-in viewer. If it is set to `false` , the file `dynamsoft.viewer.js` is not loaded at all and there is no way to add it back later. Therefore, only set it to `false` when you absolutely won't need the viewer or will be building your own viewer.

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

### `WasmConfig`

#### `maxHeapSize`

Specify the maximum memory allowed to be used by the library when it's in WASM-mode. By default, it's 200 (MB).

#### `fetchOptions`

* `headers`

A Headers object, an object literal, or an array of two-item arrays to set request's headers. Check out [HeadersInit](https://microsoft.github.io/PowerBI-JavaScript/modules/_node_modules_typedoc_node_modules_typescript_lib_lib_dom_d_.html#headersinit).

* `mode`

A string to indicate whether the request will use CORS, or will be restricted to same-origin URLs. Sets request's mode. Check out [RequestMode](https://microsoft.github.io/PowerBI-JavaScript/modules/_node_modules_typedoc_node_modules_typescript_lib_lib_dom_d_.html#requestmode).

* `credentials`

A string indicating whether credentials will be sent with the request always, never, or only when sent to a same-origin URL. Sets request's credentials. Check out [RequestCredentials](https://microsoft.github.io/PowerBI-JavaScript/modules/_node_modules_typedoc_node_modules_typescript_lib_lib_dom_d_.html#requestcredentials).

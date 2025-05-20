---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - Camera Addon APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, Camera Addon APIs
breadcrumbText: Camera Addon
description: Dynamic Web TWAIN SDK Documentation API Reference Camera Addon APIs Page
ignore: true
---

# `{WebTwainObject}.Addon.Camera`

> {WebTwainObject} denotes the `WebTwain` instance.

Dynamic Web TWAIN comes with a Camera add-on for you to capture images or documents using MediaDevices cameras, auto crop and adjust perspective. 

To include the Camera add-on, simply add a reference to the corresponding camera JS file:

``` html
<script src="Resources/addon/dynamsoft.webtwain.addon.camera.js"></script>
```
Check out [MediaDevices Cameras](/_articles/general-usage/scanner-image-acquisition.md#use-mediadevices-cameras) to learn more on how to use the camera add-on.

**Methods**


| [`getSourceList()`](#getsourcelist) | [`selectSource()`](#selectsource)   | [`getCurrentSource()`](#getcurrentsource)         | [`closeSource()`](#closesource)   |
| [`getResolution()`](#getresolution) | [`setResolution()`](#setresolution) | [`getCurrentResolution()`](#getcurrentresolution) | [`play()`](#play)                 |
| [`pause()`](#pause)                 | [`resume()`](#resume)               | [`stop()`](#stop)                                 | [`getStatus()`](#getstatus)       |
| [`capture()`](#capture)             | [`closeVideo()`](#closevideo)       | [`scanDocument()`](#scandocument)                 | [`turnOnTorch()`](#turnontorch) | 
| [`turnOffTorch()`](#turnofftorch)   | [`getCapabilities()`](#getcapabilities) | 

**Events**


| [`video-closed`](#video-closed) | [`video-error`](#video-error) | 

---

## getSourceList

**Syntax**

```typescript
/**
 * Return a list of all available cameras.
 */
getSourceList(): Promise<DeviceInfo[]>;

interface DeviceInfo{
    deviceId: string;
    label: string;
}
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+ </td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.Addon.Camera.getSourceList();
```

---

## selectSource

**Syntax**

```typescript
/**
 * Select a camera to use.
 * @param deviceId Specify the camera with its deviceId.
 */
selectSource(deviceId: string): Promise<DeviceInfo>;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+ </td>
</tr>

</table>
</div> 

---

## getCurrentSource

**Syntax**

```typescript
/**
 * Return the info about the current camera.
 */
getCurrentSource():DeviceInfo;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+ </td>
</tr>

</table>
</div>

---

## closeSource

**Syntax**

```typescript
/**
 * Close the current camera.
 */
closeSource(): Promise<DeviceInfo>;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

---

## getResolution

**Syntax**

```typescript
/**
 * Return the resolutions supported by the current camera.
 */
getResolution(): Promise<Resolution[]>

interface Resolution{
    width: number;
    height: number;
}
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

---

## setResolution

**Syntax**

```typescript
/**
 * Set the resolution for the current camera.
 * @param resolution Specify the resolution.
 */
setResolution(resolution: Resolution): Promise<Resolution>;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

---

## getCurrentResolution

**Syntax**

```typescript
/**
 * Return the resolution of the current camera.
 */
getCurrentResolution(): Promise<Resolution>;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

**Usage notes**

If the camera is playing, the actual resolution is returned. If the camera is not playing, the last set resolution or null is returned.

---

## play

**Syntax**

```typescript
/**
 * Start streaming video from the current camera.
 * @param element Specify an HTML element to put the video stream in.
 * @param resolution Specify the initial resolution.
 * @param fill Whether to fill the viewer space with the video stream and leave no margin. The default value is `false`.
 */
play(element?: HTMLElement,
    resolution?: Resolution,
    fill?: boolean
): Promise<Resolution>;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

**Usage notes**

If no camera is chosen, the default camera is used.

If the method is called without arguments or `null` is passed to `element` , the video will show in the main viewer.

---

## pause

**Syntax**

```typescript
/**
 * Pause the video stream.
 */
pause(): void;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>
---

## resume

**Syntax**

```typescript
/**
 * Resume the video stream.
 */
resume(): void;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

---

## stop

**Syntax**

```typescript
/**
 * Stop the video stream.
 */
stop(): void;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

---

## getStatus

**Syntax**

```typescript
/**
 * Return the status of the current camera.
 */
getStatus(): string;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

**Usage notes**

The status string is either empty or one of the following: "playing", "paused", "stopped". An empty string means no camera is open.

---

## capture

**Syntax**

```typescript
/**
 * Capture a frame from the video stream.
 */
capture(): Promise<Blob>;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

---

## closeVideo

**Syntax**

```typescript
/**
 * Close the camera and hide the video streaming UI.
 */
closeVideo(): void;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v16.1+</td>
<td align="center">v16.1+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

## video-closed

**Syntax**

``` typescript
/**
 * This event is triggered when the video is closed.
 */
on("video-closed", callback: () => void): boolean;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.2+ </td>
<td align="center">v16.2+</td>
<td align="center">v16.2+ </td>
<td align="center">v16.2+</td>
<td align="center">v16.2+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

---

## video-error

**Syntax**

``` typescript
/**
 * This event is triggered when the video playing operation. throws out an error.
 * @argument errorCode The error code.
 * @argument errorString The error string.
 */
on("video-error", callback: (errorCode, errorString) => void): boolean;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported  </td>
<td align="center">v16.2+ </td>
<td align="center">v16.2+</td>
<td align="center">v16.2+ </td>
<td align="center">v16.2+</td>
<td align="center">v16.2+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

## scanDocument

**Syntax**

``` typescript
/**
 * Open the camera to capture document(s).
 * @param documentConfiguration Specify the document configuration.
 */
scanDocument(documentConfiguration?: DocumentConfiguration
): Promise<Resolution>;

interface DocumentConfiguration {
  scannerViewer?: ScannerViewer;
  documentEditorSettings?: DocumentEditorSettings
}

interface ScannerViewer {
  element?: HTMLDivElement | string; //Bind the element or element id. 
                            //After binding, display the video in the specified element, otherwise, display the video in full screen.
  deviceId?: string;
  maxDocuments?: number;       //The maximum number of documents for current scan
  enableBorderDetection?: boolean;  // Whether to enable border detection. The default value is true.
  fullScreen?: boolean;   //Whether to display the video in full screen. The default value is false.
  polygonStyle?:{      //The style of the auto detect border.       
    stroke?: string;    //default: "#fe8e14". Only supports #16 hexadecimal.
    strokeWidth?: string;  //default: "2px"
    dash?: string          //The allowed value are "solid" and "dashed", the default value is "solid".
  };
  headerStyle?:{
    background?: string;  //default: "#000000". Only supports #16 hexadecimal.
    color?: string;  //The color of the icons. Default : "#ffffff". Only supports #16 hexadecimal.
    selectedColor?: string  //The color of the selected icon. Default: "#fe8e14". Only supports #16 hexadecimal.
  };
  bodyStyle?:{
    background?: string;  //default: "#ffffff". Only supports #16 hexadecimal.
    loaderBarSource?: string //The image source of the loader bar: url (e.g. "https://xxx.png") or base64
  };
  footerStyle?:{
    background?: string;  //default: "#000000". Only supports #16 hexadecimal.
    color?: string;  //The color of the icons. Default : "#ffffff". Only supports #16 hexadecimal.
    selectedColor?: string //The color of the selected icon. Default : "#fe8e14". Only supports #16 hexadecimal.
  };
  scanButtonStyle?:{
    background?: string;  //default: "#fe8e14". Only supports #16 hexadecimal.
    color?: string  //Default : "#ffffff". Only supports #16 hexadecimal.
  };    
  resolution?:{
    visibility?: string; //Whether to display the resolution icon in the upper left corner. Values: "visible""hidden". Default; "visible".
    
    valueList?:[ {   
      label: string;    //The resolution value listed in the drop-down list. For example:"1920x1080"
      value: Resolution //The resolution you set. For example: { width:1920, height:1080}
    },{……}]
      defaultValue?: Resolution //Set the default value according to the value set in the valueList.
  };
  autoScan?:{   //Automatically capture when a clear document is detected. Only applicable to video scanning. 
      visibility?: string;     //Whether to display the automatic scan icon. Values: "visible""hidden". Default: "visible".
      enableAutoScan?: boolean; //Whether to enable automatic scan. The default value is false.
  };
  autoDetect?:{  //Only applicable to video scanning.                  
      visibility?: string;         //Whether to display the automatic border detection icon. Values: "visible""hidden". Default: "visible".
      enableAutoDetect?: boolean;   //Whether to enable automatic border detection. The default value is false.     
      acceptedPolygonConfidence?: number; //The default value is 80. The higher the setting, the more accurate the automatic border detection.
      fpsLimit?: number  //The maximum number of frames detected per second. The default value is 3.
  };     
  continuousScan?: boolean; //Whether to enable continuous scan. The default value is true.
  switchCamera?:{  //The default camera is the rear camera.
      visibility?: string   //Whether to display the switch camera icon. Values: "visible""hidden". Default: "visible".
  };
  loadLocalFile?:{  
      visibility?: string   //Whether to display the load local file icon. Values: "visible""hidden". Default: "visible".
  };
  torch?:{
      visibility?: string;   //Whether to display the torch icon if torch is supported. Values: "visible""hidden". Default: "visible".
      enableTorch?: boolean //Whether to enable torch by default. Default：false.
  },
  funcConfirmExit?: (bExistImage: boolean) => Promise<boolean>;
    //funcConfirmExit is the callback function,
    //Return Promise.resolve(true): End this capture without saving the image data.
    //Return Promise.resolve(false): Stay on the original viewer
  funcConfirmExitAfterSave?: (firedByDocumentEdit: boolean) => void
    //funcConfirmExitAfterSave is the callback function
},

interface DocumentEditorSettings {
  visibility?: string; //Values: "visible""hidden". Default: "visible".
  element?: HTMLDivElement | string; //Bind the element or element id. 
  //After binding, display the video in the specified element, otherwise, display the video in full screen.  
  defaultViewerName?: string;  //value: "cropViewer", "mainViewer". default: "cropViewer" for scanDocument, "mainViewer" for createDocumentEditor
  headerStyle?:{
    background?: string;  //default: "#000000". Only supports #16 hexadecimal.
    color?: string;  //The color of the icons. Default: "#ffffff". Only supports #16 hexadecimal.
    selectedColor?: string;  //The color of the selected icon. Default: "#fe8e14". Only supports #16 hexadecimal.
    disableColor?: string;  //default: "#808080"
  };
  bodyStyle?:{
    background?: string;  //default: "#ffffff". Only supports #16 hexadecimal.
    loaderBarSource?: string; //The image source of the loader bar: url (e.g. "https://xxx.png") or base64
  };
  footerStyle?:{
    background?: string;  //default: "#000000". Only supports #16 hexadecimal.
    color?: string;  //The color of the icons. Default : "#ffffff". Only supports #16 hexadecimal.
    selectedColor?: string;  //The color of the selected icon. Default: "#fe8e14". Only supports #16 hexadecimal.
  };
  insert?: {  //Insert an image  
    visibility?: string;  //Whether to display the insert icon. Values: "visible""hidden". Default: "visible".
    position?: string;   //Set whether to insert the image "before" or "after" the current image. The default value is "before".
  };
  remove?: { //Remove an image
    visibility?: string;   //Whether to display the remove icon. Values: "visible""hidden". Default: "visible".
    funcConfirmRemove?: () => Promise<boolean>; 
      //funcConfirmRemove is the callback function
  };
  rotateLeft?: { 
    visibility?: string;   //Whether to display the rotate left icon. Values: "visible""hidden". Default: "visible".
  };
  filter?: {
    visibility?: string;   //Whether to display the filter icon. Values: "visible""hidden". Default: "visible".
    valueList?:[ {  //If not specified, listing all the filters in the order of original, blackAndWhite, grayscale, clean, brightening, saveToner by default. 
                    //Support adjusting the valueList order to arrange the filter order.
      label: string;   //The label of the filter. For example. The filter "Original" can be modified to any word you want to describe
      value: string;   //The filter value. The value must be set according to our specification below.
    //Allowed values: original, blackAndWhite, grayscale, clean, brightening, saveToner	
      option?: {
        level: 1  //The filter level. The allowed values are 1(default value), 2, 3.
                  //The higher the level, the better the quality, but the more time it takes.
        }
    },{……}]
    defaultValue?: string;   //Filter selected by default. By default, the original filter is selected.
    applyToAll?: {
      visibility?: string; //"visible": hidden". Default: "visible"
      enableApplyToAll?: boolean; //Default:false
      label?: string; //Default: "Apply to all"
    }
  };
  crop?: {
    visibility?: string;  //"visible": hidden". Default: "visible"
  };
  cropViewer?: CropViewer;
  funcConfirmExit?: (bChanged: boolean, previousViewerName: string) => Promise<Number>;
    //funcConfirmExit is the callback function.
    //Return Promise.resolve(EnumDWT_ConfirmExitType.Exit): Exit original viewer without saving the image data. 
    //Return Promise.resolve(EnumDWT_ConfirmExitType.SaveAndExit): Exit original viewer with saving the image data. 
    //Return Promise.resolve(EnumDWT_ConfirmExitType.Cancel): Stay on the original viewer
  funcConfirmExitAfterSave?: (firedByDocumentEdit: boolean) => void
    //funcConfirmExitAfterSave is the callback function
},

interface CropViewer {
  visibility?: string;   //Whether to display the crop viewer. Values: "visible""hidden". Default: "visible".
  polygonStyle?: {    //The polygon style in the crop viewer.       
    stroke: string;       //default: "#fe8e14". Only supports #16 hexadecimal.
    strokeWidth: string;   //default: "2px"
    dash: string           //The allowed value are "solid" and "dashed", the default value is "solid".
  };
  rotateLeft?: {   
    visibility?: string;   //Whether to display the rotate left icon. Values: "visible""hidden". Default: "visible".
  };
  rotateRight?: {   
    visibility?: string;   //Whether to display the rotate right icon. Values: "visible""hidden". Default: "visible".
  };
  autoDetectBorder?: {   
    visibility?: string;   //Whether to display the automatic border detection icon. Values: "visible""hidden". Default: "visible".
  };
  funcConfirmExit?: (bChanged: boolean, previousViewerName: string) => Promise<Number>
    //funcConfirmExit is the callback function.
    //Return Promise.resolve(EnumDWT_ConfirmExitType.Exit): Exit original viewer without saving the image data. 
    //Return Promise.resolve(EnumDWT_ConfirmExitType.SaveAndExit): Exit original viewer with saving the image data. 
    //Return Promise.resolve(EnumDWT_ConfirmExitType.Cancel): Stay on the original viewer
 }

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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+</td>
<td align="center">v17.2+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

---

## turnOnTorch

Turn on the torch/flashlight.

**Syntax**

```typescript
turnOnTorch(): Promise<void>;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

**Usage notes**

This method should be called when the camera is turned on. It only works with Chromium-based browsers such as Edge and Chrome on Windows or Android. Other browsers such as Firefox or Safari are not supported. All browsers on iOS (including Chrome) use WebKit as the rendering engine and are not supported. You can check if this capability is supported by the camera using API [getCapabilities](#getcapabilities).

---

## turnOffTorch

Turn off the torch/flashlight.

**Syntax**
```typescript
turnOffTorch(): Promise<void>;
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

**Usage notes**

This method should be called when the camera is turned on. It only works with Chromium-based browsers such as Edge and Chrome on Windows or Android. Other browsers such as Firefox or Safari are not supported. All browsers on iOS (including Chrome) use WebKit as the rendering engine and are not supported. You can check if this capability is supported by the camera using API [getCapabilities](#getcapabilities).

---

## getCapabilities

**Syntax**

```typescript
/**
 * Get the camera capabilities.
 */
getCapabilities(): MediaTrackCapabilities
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
<td align="center">Android Service</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+</td>
<td align="center">v18.0+ </td>
<td align="center">v18.0+</td>
</tr>

</table>
</div>

**Usage notes**

This method should be called when the camera is turned on. It only works with Chromium-based browsers such as Edge and Chrome on Windows or Android. Other browsers such as Firefox or Safari are not supported. All browsers on iOS (including Chrome) use WebKit as the rendering engine and are not supported.

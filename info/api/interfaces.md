---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN API Reference - Interfaces
keywords: Dynamic Web TWAIN, Documentation, API Reference, Interfaces
breadcrumbText: Utility
description: Dynamic Web TWAIN SDK Documentation API Reference Interfaces Page
permalink: /info/api/interfaces.html
needGenerateH3Content: true
---

# Interfaces
<!--
| |
|:-|:-|
| [`Device`](#device)  | [`DeviceConfiguration`](#DeviceConfiguration)  |
-->


---

## Global

### DWTInitialConfig

**Syntax**

```typescript
interface DWTInitialConfig {
    WebTwainId: string,
    Host ? : string, // Default value: "127.0.0.1"
    Port ? : string | number, // Default value: 18622
    PortSSL ? : string | number, // Default value: 18623
}
```

### Container

**Syntax**

``` typescript
interface Container {
    WebTwainId?: string, // Id of the WebTwain instance
    ContainerId?: string, // Id of the element
    Width?: string | number, // Width of the element
    Height?: string | number // Height of the element
}
```

`WebTwainId` and `ContainerId` are both optional but one must exist as the identifier for that `WebTwain` instance.

`Width` and `Height` determine the initial size of `Viewer` object.

### DisplayInfo

**Syntax**

```typescript
interface DisplayInfo {
    loaderBarSource?: string;
    loaderBarClassName?: string;
    buttons?: any;
    customProgressText?: any;
    dialogText?: any;
    errorMessages?: any;
    generalMessages?: any;
}
```

## Scan

### Device

**Syntax**

```typescript
interface Device{
   name: string;
   displayName: string;
   deviceType: DeviceType;
   serverInfo?: serverInfo;
   deviceInfo?: any;
}
```

---

### DeviceConfiguration

**Syntax**

```typescript
interface DeviceConfiguration {
    IfShowUI?: boolean; //Whether to show the built-in User Interface from the device vendor
    PixelType?: Dynamsoft.DWT.EnumDWT_PixelType | number | string; //Whether to scan in color, grey or black & white
    Resolution?: number; //Measured by dots per pixel (DPI)
    IfFeederEnabled?: boolean; //Whether to use the document feeder or the flatbed of the device
    IfDuplexEnabled?: boolean; //Whether to scan one side or both sides
    IfDisableSourceAfterAcquire?: boolean; //Whether to close the built-in User Interface after aquisition. Only valid when {IfShowUI} is true.
    IfGetImageInfo?: boolean; //Whether to retrieve information about the image after it's transferred.
    IfGetExtImageInfo?: boolean; //Whether to retrieve extended information about the image after it's transferred.
    extendedImageInfoQueryLevel?: Dynamsoft.DWT.EnumDWT_ExtImageInfo | number; //How much extended information is retrieved. Only valid when {IfGetExtImageInfo} is true.
    SelectSourceByIndex?: number; //Specify a source by its index.
    IfCloseSourceAfterAcquire?: boolean; //Whether to close the data source after aquisition. Default: false.
    PageSize?: Dynamsoft.DWT.EnumDWT_CapSupportedSizes | number; //Specify page size
}
```

---

### SourceDetails

**Syntax**

```typescript
interface SourceDetails {
    /**
     * The driver type which can be "TWAIN" | "ICA" | "SANE"
     */
    DriverType?: string;
    /**
     * Information about the driver if it's DriverType is "ICA"
     */
    DeviceInfo?: any;
    /**
     * The name of the data source. E.g. "TWAIN2 FreeImage Software Scanner".
     */
    ProductName?: string;
    /**
     * Whether it is the default source.
     */
    IsDefaultSource?: boolean;
    /**
     * Whether it is the current source.
     */
    IsCurrentSource?: boolean;
    /**
     * The family name of the data source. E.g. "Software Scan".
     */
    ProductFamily?: string;
    /**
     * The manufacturer of the data source. E.g. "TWAIN Working Group".
     */
    Manufacturer?: string;
    /**
     *
     */
    SupportedGroups?: 1073741827,
    /**
     * The version of the protocol based on which the data source is developed.
     */
    ProtocolMajor?: number;
    ProtocolMinor?: number;
    /**
     * Detailed version of the data source.
     */
    Version?: Version;
}
```

Please refer to [Version]({{site.info}}api/Interfaces.html#version).

---

### Version

**Syntax**

```typescript
interface Version {
    MajorNum?: number;
    MinorNum?: number;
    Language?: number;
    Country?: number;
    Info?: string;
}
```

---

### ScanSetup

**Syntax**

```typescript
interface ScanSetup {
  /**
   * An id that specifies this specific setup.
   */
  setupId?: string,
  /**
   * Whether to ignore or fail the acquistion when an exception is raised. Set "ignore" or "fail".
   */
  exception?: string,
  /**
   * The name of the data source (the scanner). If not set, the default data source is used.
   */
  scanner?: string,
  ui?: {
    /**
     * Whether to show the UI of the device.
     */
    bShowUI?: boolean,
    /**
     * Whether to show the indicator of the device.
     */
    bShowIndicator?: boolean,
  },
  /**
   * The TWAIN transfer mode.
   */
  transferMode?: Dynamsoft.DWT.EnumDWT_TransferMode | number,
  /**
   * Set how the transfer is done.
   */
  fileXfer?: {
    /**
     * Specify the file name (or pattern) for file transfer.
     * Example: "C:\\WebTWAIN<%06d>.bmp"
     */
    fileName?: string,
    /**
     * Specify the file format.
     */
    fileFormat?: Dynamsoft.DWT.EnumDWT_FileFormat | number,
    /**
     * Specify the quality of JPEG files.
     */
    jpegQuality?: number,
    /**
     * Specify the compression type of the file.
     */
    compressionType?: Dynamsoft.DWT.EnumDWT_CompressionType | number
  }
  /**
   * Set where the scanned images are inserted.
   */
  insertingIndex?: number,
  /**
   * The profile is a base64 string, if present, it overrides settings and more settings.
   */
  profile?: string,
  /**
   * Basic settings.
   */
  settings?: {
    /**
     * "ignore" (default) or "fail".
     */
    exception?: string,
    /**
     * Specify the pixel type.
     */
    pixelType?: Dynamsoft.DWT.EnumDWT_PixelType | number,
    /**
     * Specify the resolution.
     */
    resolution?: number,
    /**
     * Whether to enable document feader.
     */
    bFeeder?: boolean,
    /**
     * Whether to enable duplex scan.
     */
    bDuplex?: boolean
  },
  moreSettings?: {
    /**
     * "ignore" (default) or "fail".
     */
    exception?: string,
    /**
     * Specify the bit depth.
     */
    bitDepth?: number,
    /**
     * Specify the page size.
     */
    pageSize?: Dynamsoft.DWT.EnumDWT_CapSupportedSizes | number,
    /**
     * Specify the unit.
     */
    unit?: Dynamsoft.DWT.EnumDWT_UnitType | number,
    /**
     * Specify a layout to scan, if present, it'll override pageSize.
     */
    layout?: {
      left?: number,
      top?: number,
      right?: number,
      bottom?: number
    },
    /**
     * Specify the pixel flavor.
     */
    pixelFlavor?: Dynamsoft.DWT.EnumDWT_CapPixelFlavor | number,
    /**
     * Specify Brightness.
     */
    brightness?: number,
    /**
     * Specify contrast.
     */
    contrast?: number,
    /**
     * Specify how many images are transferred per session.
     */
    nXferCount?: number,
    /**
     * Whether to enable automatic blank image detection and removal.
     */
    autoDiscardBlankPages?: boolean,
    /**
     * Whether to enable automatic border detection.
     */
    autoBorderDetection?: boolean,
    /**
     * Whether to enable automatic skew correction.
     */
    autoDeskew?: boolean,
    /**
     * Whether to enable automatic brightness adjustment.
     */
    autoBright?: boolean
  },
  /**
   * A callback triggered before the scan, after the scan and after each page has been transferred.
   * Returned status
   * {event: 'beforeAcquire', result: {…}} //Equivalent to OnPreAllTransfers event
   * {event: 'postTransfer', bScanCompleted: false, result: {…}} //Equivalent to OnPostTransfer event
   * {event: 'postTransfer', bScanCompleted: true, result: {…}} //Equivalent to OnPostAllTransfers event
   */
  funcScanStatus?: (status: Status) => void,
  /**
   * Set up how the scanned images are outputted.
   */
  outputSetup?: {
    /**
     * Output type. "http" is the only supported type for now.
     */
    type?: string,
    /**
     * Set the output format.
     */
    format?: Dynamsoft.DWT.EnumDWT_ImageType | number,
    /**
     * Specify how many times the library will try the output.
     */
    reTries?: 3,
    /**
     * Whether to use the FileUploader.
     */
    useUploader?: false,
    /**
     * Whether to upload all images in one HTTP post.
     */
    singlePost?: boolean,
    /**
     * Whether to show a progress bar when outputting.
     */
    showProgressBar?: boolean,
    /**
     * Whether to remove the images after outputting.
     */
    removeAfterOutput?: boolean,
    /**
     * A callback triggered during the outputting.
     * @argument fileInfo A JSON object that contains the fileName, percentage, statusCode, responseString, etc.
     */
    funcHttpUploadStatus?: (fileInfo: any) => void,
    /**
     * Setup for PDF output.
     */
    pdfSetup?: {
      author?: string,
      compression?: Dynamsoft.DWT.EnumDWT_PDFCompressionType | number,
      creator?: string,
      /**
       * Example: 'D:20181231'
       */
      creationDate?: string,
      keyWords?: string,
      /**
       * Example: 'D:20181231'
       */
      modifiedDate?: string,
      producer?: string,
      subject?: string,
      title?: string,
      version?: number,
      quality?: number
    },
    /**
     * Setup for TIFF output.
     */
    tiffSetup?: {
      quality?: number,
      compression?: Dynamsoft.DWT.EnumDWT_TIFFCompressionType | number,
      /**
       * Specify Tiff custom tags.
       */
      tiffTags?: TiffTag[]
    },
    /**
     * Setup for HTTP upload via Post.
     */
    httpParams?: {
      /**
       * Target of the request.
       * Example: "http://dynamsoft.com/receivepost.aspx"
       */
      url?: string,
      /**
       * Custom headers in the form.
       * Example: {md5: ""}
       */
      headers?: any,
      /**
       * Custom form fields.
       * Example: {"UploadedBy": "Dynamsoft"}
       */
      formFields?: any,
      /**
       * The maximum size of a file to be uploaded (in bytes).
       */
      maxSizeLimit?: number,
      /**
       * Specify how many threads (<=4) are to be used. Only valid when {useUploader} is true.
       */
      threads?: number,
      /**
       * Specify the names for the files in the form.
       * Example: "RemoteName<%06d>"
       */
      remoteName?: string,
      /**
       * Specify the name(s) (pattern) of the uploaded files.
       * Example: "uploadedFile<%06d>.jpg"
       */
      fileName?: string
    }
  }
}
```

---

### OutputInfo

**Syntax**

```typescript
interface OutputInfo {
  /**
   * Id of the image if it's transferred to the buffer.
   */
  imageId?: number;
  /**
   * Path of the image if it's transferred to the disk.
   */
  Path?: string;
  /**
   * Information about the image.
   */
  imageInfo?: object;
  /**
   * Extended information about the image.
   */
  extendedImageInfo?: object;
}
```

---

### CapabilityDetails

**Syntax**

```typescript
/**
 * Detailed information about a specific capability
 */
interface CapabilityDetails {
    /**
     * The Capability.
     */
    capability: ValueAndLabel;
    /**
     * The container type of the Capability
     */
    conType?: ValueAndLabel;
    /**
     * The index for the current value of the Capability
     */
    curIndex?: number;
    /**
     * The current value of the Capability
     */
    curValue?: ValueAndLabel;
    /**
     * The index for the default value of the Capability
     */
    defIndex?: number;
    /**
     * The operation types that are supported by the Capability. Types include {"get", "set", "reset" "getdefault", "getcurrent"}
     */
    query?: string[];
    /**
     * The value type of the Capability. Value types include
        TWTY_BOOL: 6
        TWTY_FIX32: 7
        TWTY_FRAME: 8
        TWTY_INT8: 0
        TWTY_INT16: 1
        TWTY_INT32: 2
        TWTY_STR32: 9
        TWTY_STR64: 10
        TWTY_STR128: 11
        TWTY_STR255: 12
        TWTY_UINT8: 3
        TWTY_UINT16: 4
        TWTY_int: 5
     */
    valueType?: ValueAndLabel;
    /**
     * The available values of the Capability
     */
    values?: ValueAndLabel[];
}
```

Please refer to [ValueAndLabel]({{site.info}}api/Interfaces.html#valueandlabel).

---

### ValueAndLabel

**Syntax**

```typescript
interface ValueAndLabel {
    /**
     * Numeric representation of the item
     */
    value?: Dynamsoft.DWT.EnumDWT_Cap | Dynamsoft.DWT.EnumDWT_CapType | Dynamsoft.DWT.EnumDWT_CapValueType | number;
    /**
     * Label or name of the item
     */
    label?: string;
}
```

Please refer to [EnumDWT_Cap]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_cap), [EnumDWT_CapType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_captype) and [EnumDWT_CapValueType]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_capvaluetype).

---

### Capabilities

**Syntax**

```typescript
interface Capabilities {
    /**
     * Whether to "ignore" or "fail" the request if an exception occurs. This is an overall setting that is inherited by all capabilities.
     */
    exception: string;
    /**
     * Specifies how to set capabilities
     */
    capabilities: CapabilitySetup[]
}
```

Please refer to [CapabilitySetup]({{site.info}}api/Interfaces.html#capabilitysetup).

---

### CapabilitySetup

**Syntax**

```typescript
interface CapabilitySetup {
    /**
     * Specify a capability
     */
    capability: Dynamsoft.DWT.EnumDWT_Cap | number;
    /**
     * The value to set to the capability or the value of the capability after setting.
     */
    curValue: number | string; //array is not supported
    errorCode?: number;
    errorString?: string;
    /**
     * Whether to "ignore" or "fail" the request if an exception occurs when setting this specific capability.
     */
    exception? : string;
}
```

---

## Viewer

### CustomElement

**Syntax**

```typescript
interface CustomElement {
    /**
     * Show the custom element.
     */
    show(): boolean;
    /**
     * Hide the custom element.
     */
    hide(): boolean;
    /**
     * Remove the custom element.
     */
    dispose(): boolean;
    /**
     * Return the created element.
     */
    element?: any;
};
```

### ImageEditor

**Syntax**

<div class="sample-code-prefix template2"></div>
>- v18.4
>- v18.3
>- v18.2
>
>
```typescript
interface ImageEditor {
    /**
     * Show the ImageEditor object.
     */
    show(): boolean;
    /**
     * Keeps the image data in the browser editor in sync with the buffer.
     **/
    save(): Promise<void>;
    /**
     * Hide the ImageEditor object.
     */
    hide(): boolean;
    /**
     * Remove the ImageEditor object.
     */
    dispose(): boolean;
    /**
     * Set the selction box styling
     */
    updateSelectionBoxStyle(selectionBoxStyleSettings?: SelectionBoxStyleSettings): boolean;
    /**
     * Set the zoom origin.
     */
    zoomOrigin?: {
        x: string; //x-coordinate. Default is "center", values: "left", "right", "center"
        y: string; //y-coordinate. Default is "center", values: "top", "bottom", "center"
    }
};
```
```typescript
interface ImageEditor {
    /**
     * Show the ImageEditor object.
     */
    show(): boolean;
    /**
     * Keeps the image data in the browser editor in sync with the buffer.
     **/
    save(): Promise<void>;
    /**
     * Hide the ImageEditor object.
     */
    hide(): boolean;
    /**
     * Remove the ImageEditor object.
     */
    dispose(): boolean;
    /**
     * Set the zoom origin.
     */
    zoomOrigin?: {
        x: string; //x-coordinate. Default is "center", values: "left", "right", "center".
        y: string; //y-coordinate. Default is "center", values: "top", "bottom", "center"
    }
};
```
```typescript
interface ImageEditor {
    /**
     * Show the ImageEditor object.
     */
    show(): boolean;
    /**
     * Keeps the image data in the browser editor in sync with the buffer.
     **/
    save(): Promise<void>;
    /**
     * Hide the ImageEditor object.
     */
    hide(): boolean;
    /**
     * Remove the ImageEditor object.
     */
    dispose(): boolean;
};
```


---

### EditorSettings

**Syntax**

<div class="sample-code-prefix template2"></div>
>- v18.3+
>- v18.2
>
>
```typescript
interface EditorSettings {
    /**
     * Specify an HTML Element.
     */
    element?: HTMLDivElement | HTMLElement;
    /**
     * The width of the image editor viewer. The default value is "100%".
     * 'Invalid property value' will be reported when the set value is not string or number.
     */
    width?: number | string;
    /**
     * The height of the image editor viewer. The default value is "100%".
     * 'Invalid property value' will be reported when the set value is not string or number.
     */
    height?: number | string;
    /**
     * The border of the ImageEditor viewer.
     * 'Invalid property value' is reported when the set value does not meet the CSS standard.
     */
    border?: string;
    /**
     * Set the border of the top toolbar.
     * 'Invalid property value' is reported when the set value does not meet the CSS standard.
     */
    topMenuBorder?: string;
    /**
     * The inner border of the image area.
     */
    innerBorder?: string;
    /**
     * The background color/image of the ImageEditor viewer.
     * 'Invalid property value' is reported when the set value does not meet the CSS standard.
     */
    background?: string;
    /**
     * Whether to pop up a window prompting to save the changes. The default value is true.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     */
    promptToSaveChange?: boolean;
    /**
     * Modify button titles and whether to hide specific buttons in the image editor viewer.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     */
    buttons?: any;
    /**
     * Define the dialog text
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     */
    dialogText?: any;
    /**
     * Default is normal, values: normal=0, balance=1.
     */
    workMode?: number | Dynamsoft.DWT.EnumDWT_WorkMode;
    /**
     * Set the zoom origin.
     */
    zoomOrigin?: {
        x: string; //x-coordinate. Default is "center", values: "left", "right", "center".
        y: string; //y-coordinate. Default is "center", values: "top", "bottom", "center".
    };
}
```
```typescript
interface EditorSettings {
    /**
     * Specify an HTML Element.
     */
    element?: HTMLDivElement | HTMLElement;
    /**
     * The width of the image editor viewer. The default value is "100%".
     * 'Invalid property value' will be reported when the set value is not string or number.
     */
    width?: number | string;
    /**
     * The height of the image editor viewer. The default value is "100%".
     * 'Invalid property value' will be reported when the set value is not string or number.
     */
    height?: number | string;
    /**
     * The border of the ImageEditor viewer.
     * 'Invalid property value' is reported when the set value does not meet the CSS standard.
     */
    border?: string;
    /**
     * Set the border of the top toolbar.
     * 'Invalid property value' is reported when the set value does not meet the CSS standard.
     */
    topMenuBorder?: string;
    /**
     * The inner border of the image area.
     */
    innerBorder?: string;
    /**
     * The background color/image of the ImageEditor viewer.
     * 'Invalid property value' is reported when the set value does not meet the CSS standard.
     */
    background?: string;
    /**
     * Whether to pop up a window prompting to save the changes. The default value is true.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     */
    promptToSaveChange?: boolean;
    /**
     * Modify button titles and whether to hide specific buttons in the image editor viewer.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     */
    buttons?: any;
    /**
     * Define the dialog text
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     */
    dialogText?: any;
    /**
     * Default is normal, value: normal=0, balance=1.
     */
    workMode?: number | Dynamsoft.DWT.EnumDWT_WorkMode;
}
```

**Note**

Please refer to [EnumDWT_WorkMode]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_workmode).

---

### ThumbnailViewer

**Syntax**

```typescript
interface ThumbnailViewer {
    /**
     * Show the ThumbnailViewer object.
     */
    show(): boolean;
    /**
     * Hide the ThumbnailViewer object.
     */
    hide(): boolean;
    /**
     * Remove the ThumbnailViewer object.
     */
    dispose(): boolean;
    /**
     * Change the view mode of the thumbnail viewer.
     * @param viewMode Specify the new mode.
     */
    updateViewMode(viewMode: ViewMode): void;
    /**
     * Change the checkbox style. Available in v17.3+.
     * @param checkboxSettings Specify the checkbox settings.
     */
    updateCheckboxStyle(checkboxSettings?: CheckboxSettings): void;
    /**
     * Change the page number style. Available in v17.3+.
     * @param pageNumberSettings Specify the page number settings.
     */
    updatePageNumberStyle(pageNumberSettings?: PageNumberSettings): void;
    /**
     * Bind a listner to the specified event. You can bind one or multiple listeners to the same event.
     * @param eventName Specify the event name.
     * @param callback Specify the listner.
     */
    on(eventName: string, callback: (event: ThumbnailViewerEvent | KeyboardEvent, domEvent?: MouseEvent) => void): void;
    /**
     * Unbind event listener(s) from the specified viewer event.
     * @param eventName Specify the event.
     * @param callback Specify the listener to remove
     */
    off(eventName: string, callback?: () => void): void;
}
```
**Note**

Please refer to [ViewMode]({{site.info}}api/Interfaces.html#viewmode) and [ThumbnailViewerEvent]({{site.info}}api/Interfaces.html#thumbnailviewerevent).

---

### ThumbnailViewerSettings

**Syntax**

```typescript
interface ThumbnailViewerSettings {
    /**
     * Specify how many images to display per row.
     */  
    columns?: number;
    /**
     * Specify how many images to display per column.
     */  
    rows?: number;    
    /**
     * Whether to allow keyboard control. Default: true.
     */  
    allowKeyboardControl?: boolean;
    /**
     * Whether to allow page dragging to reorder the pages.
     * Default: true.
     */
    allowPageDragging?: boolean;
    /**
     * Whether to allow resizing of the thumbnail viewer.
     * Default: false.
     */
    allowResizing?: boolean;
    /**
     * Set or return the CSS rule for the background of the thumbnail viewer.
     * Default: "rgb(255, 255, 255)".
     */
    background?: string;
    /**
     * Set or return the CSS rule for the border of the thumbnail viewer.
     * Default: "".
     */
    border?: string;
    /**
     * Set or return the CSS rule for the background of the page the mouse hovers over in the thumbnail viewer.
     * Default: "rgb(239, 246, 253)".
     */
    hoverPageBackground?: string;
    /**
     * Set or return the CSS rule for the border of the page the mouse hovers over in the thumbnail viewer.
     * Default: "1px solid rgb(238, 238, 238)".
     */
    hoverPageBorder?: string;
    /**
     * Set or return the location of the thumbnail viewer. Allowed values are "left", "right", "top", "bottom".
     * Default: "left".
     */
    location?: string;
    /**
     * Set or return the CSS rule for the background of a normal page in the thumbnail viewer.
     * Default: "transparent".
     */
    pageBackground?: string;
    /**
     * Set or return the CSS rule for the border of a normal page in the thumbnail viewer.
     * Default: "1px solid rgb(238, 238, 238)".
     */
    pageBorder?: string;
    /**
     * Set or return the margin between two adjacent images and the margin between an image and the border of the thumbnail viewer. The value can either be in pixels or percentage.
     * Default: 10.
     */
    pageMargin?: number | string;
    /**
     * Set or return the CSS rule for the background of the placeholder which appears when you drag page(s) to reorder them in the thumbnail viewer.
     * Default: "rgb(251, 236, 136)".
     */
    placeholderBackground?: string;
    /**
     * Set or return whether the pages are arranged vertically or horizontally.
     * Default: "vertical". Allowed values are "vertical" and "horizontal".
     */
    scrollDirection?: string;
    /**
     * Set or return the CSS rule for the background of the selected page(s) in the thumbnail viewer.
     * Default: "rgb(199, 222, 252)".
     */
    selectedPageBackground?: string;
    /**
     * Set or return the CSS rule for the border of the selected page(s) in the thumbnail viewer.
     * Default: "1px solid rgb(125,162,206)".
     */
    selectedPageBorder?: string;
    /**
     * Set or return the size of the thumbnail viewer. The value can either be in pixels or percentage (based on the width or height of the entire viewer).
     * Default: "30%".
     */
    size?: number | string;
    /**
     * Set whether to select the index in the upper left corner of the viewer when scrolling.
     * Default: false.
     */
    autoChangeIndex?: boolean;
    checkbox?: {
      visibility?: string; //"visible":hidden", default: "hidden"
      width?: number | string; //default: "24px",number unit: px, string value: "24px"/"10%", relative to parent container
      height?: number | string; //default: "24px",number unit: px, string value: "24px"/"10%", relative to parent container
      background?: string; //default: "#ffffff"
      borderWidth?: number | string;  //default: "2px", unit: px, percentage value not supported
      borderColor?: string; //default: "#000000"
      checkMarkColor?: string; //default: "#000000"
      checkMarkLineWidth?: number | string; //default: "2px", unit: px, percentage value not supported
      borderRadius?: number | string;  //default: 0, number unit: px, string value: "10px"/"10%",relative to itself
      opacity?: number; //default:0.5, value range [0-1], value greater 1 defaults to 1
      left?: number | string;  //default: 0, number unit: px, string value: "10px"/"10%", relative to parent container
      top?: number | string;  //default: 0, number unit: px, string value: "10px"/"10%", relative to parent container
      right?: number | string;  //default: "", number unit: px, string value: "10px"/"10%", relative to parent container
      bottom?: number | string;  //default: "", number unit: px, string value: "10px"/"10%", relative to parent container
      translateX?: number | string; //default: "", number unit: px, string value: "10px"/"10%", relative to itself
      translateY?: number | string //default: "",  number unit: px, string value: "10px"/"10%", relative to itself
    };
    pageNumber?: {
      visibility?: string; //"visible": hidden", default: "hidden"
      width?: number | string; //default: "24px", number unit: px, string value: "24px"/"10%", relative to parent container
      height?: number | string; //default: "24px", number unit: px, string value: "24px"/"10%", relative to parent container
      background?: string; //default: "#ffffff"            
      borderWidth?: number | string; //default: "1px", unit: px, percentage value not supported
      borderColor?: string; //default: "#a79898"
      borderRadius?: number | string; //default: "50%", number unit: px, string value: "10px"/"10%", relative to itself
      opacity?:number; //default: 0.5, value range [0-1], value greater 1 defaults to 1
      color?: string; //default: "#000000", supports #16 hexadecimal only
      fontFamily?: string; //default: "sans-serif"
      fontSize?: number | string; //default: 12, unit: px, percentage value not supported
      left?: number | string; //default: "", number unit: px, string value: "10px"/"10%", relative to parent container
      top?: number | string; //default: "", number unit: px, string value: "10px"/"10%", relative to parent container
      right?: number | string; //default: 0, number unit: px, string value: "10px"/"10%", relative to parent container
      bottom?: number | string; //default: 0, number unit: px, string value: "10px"/"10%", relative to parent container
      translateX?: number | string; //default: "", number unit: px, string value: "10px"/"10%", relative to itself
      translateY?: number | string //default: "", number unit: px, string value: "10px"/"10%", relative to itself
    }
}
```

---

### ThumbnailViewerEvent

**Syntax**

```typescript
interface ThumbnailViewerEvent {
    // The index of the current page.
    index: number;
    // The x-coordinate of the browser page.
    pageX: number;
    // The y-coordinate of the browser page.
    pageY: number;
};
```

---

### ViewMode

**Syntax**

```typescript
interface ViewMode {
    /**
     * Specify the number of images per row.
     */
    columns?: number;
    /**
     * Specify the number of images per column.
     */
    rows?: number;
    /**
     * Set or return whether the pages are arranged vertically or horizontally.
     * Default: "vertical". Allowed values are "vertical" and "horizontal".
     */
    scrollDirection?: string;
}
```

---

### Area

**Syntax**

```typescript
interface Area {
    left: number,
    top: number,
    right: number,
    bottom: number,
};
```

---

### CheckboxSettings

**Syntax**

```typescript
interface CheckboxSettings {
  visibility?: string; //"visible": hidden", default: "hidden" 
  width?: number | string; //default: "24px", number unit: px, string value: "24px"/"10%", relative to parent container
  height?: number | string; //default: "24px", number unit: px, string value: "24px"/"10%", relative to parent container
  background?: string; //default: "#ffffff"
  borderWidth?: number | string; //default: "2px", unit: px, percentage value not supported
  borderColor?: string; //default: "#000000"
  checkMarkColor?: string; //default: "#000000"
  checkMarkLineWidth?: number | string; //default: "2px", unit: px, percentage value not supported
  borderRadius?: number | string;  //default: 0, number unit: px, string value: "10px"/"10%", relative to itself
  opacity?: number; //default:0.5, value range [0-1], value greater 1 defaults to 1
  left?: number | string;  //default: 0, number unit: px, string value: "10px"/"10%", relative to parent container
  top?: number | string;  //default: 0, number unit: px, string value: "10px"/"10%", relative to parent container
  right?: number | string;  //default: "", number unit: px, string value: "10px"/"10%", relative to parent container
  bottom?: number | string;  //default: "", number unit: px, string value: "10px"/"10%", relative to parent container
  translateX?: number | string; //default: "", number unit: px, string value: "10px"/"10%", relative to itself
  translateY?: number | string //default: "", number unit: px, string value: "10px"/"10%", relative to itself
}
```

---

### PageNumberSettings

**Syntax**

```typescript
interface PageNumberSettings {       
  visibility?: string; //"visible": hidden", default: "hidden" 
  width?: number | string; //default: "24px", number unit: px, string value: "24px"/"10%", relative to parent container
  height?: number | string; //default: "24px", number unit: px, string value: "24px"/"10%", relative to parent container
  background?: string; //default:"#ffffff"            
  borderWidth?: number | string; //default: "1px", unit: px, percentage value not supported
  borderColor?: string; //default: "#a79898"
  borderRadius?: number | string; //default: "50%", number unit: px, string value: "10px"/"10%", relative to itself
  opacity?:number; //default: 0.5, value range [0-1], value greater 1 defaults to 1
  color?: string; //default: "#000000", supports #16 hexadecimal only
  fontFamily?: string; //default: "sans-serif"
  fontSize?: number | string; //default: 12, unit: px, percentage value not supported
  left?: number | string; //default: "", number unit: px, string value: "10px"/"10%", relative to parent container
  top?: number | string; //default: "", number unit: px, string value: "10px"/"10%", relative to parent container
  right?: number | string; //default: 0, number unit: px, string value: "10px"/"10%", relative to parent container
  bottom?: number | string; //default: 0, number unit: px, string value: "10px"/"10%", relative to parent container
  translateX?: number | string; //default: "", number unit: px, string value: "10px"/"10%", relative to itself
  translateY?: number | string //default: "", number unit: px, string value: "10px"/"10%", relative to itself
}
```

---

### SelectionBoxStyleSettings
```typescript
interface SelectionBoxStyleSettings { 
    borderColor?: string, //Default: rgba(0,0,0,1). Selection box line segment colour in "rgba(r, g, b, a)"
    borderWidth?: number, //Default: 1. Unit: pixels. Width of individual pattern segments.
    lineDash?: [number,number], //Default: [5,2]. Unit: pixels. Line spacing where x is shaded pixels and y is gap in pixels.
    handleWidth?: number, //Default: 9. Unit: pixels. Width of the selection box control handle.
    handleHeight?: number, //Default: 9. Unit: pixels. Height of the selection box control handle.
    handleColor?: string //Default: rgba(0,0,0,1). Selection box control handle colour in "rgba(r, g, b, a)"
} 

```

---

### ViewerEvent

**Syntax**

```typescript
interface ViewerEvent {
    // The index of the current page.
    index: number;
    //The x-coordinate of the upper-left corner of the page.
    imageX: number;
    //The y-coordinate of the upper-left corner of the page.
    imageY: number;
    // The x-coordinate of the browser page.
    pageX: number;
    // The y-coordinate of the browser page.
    pageY: number;
};
```

---

### rect

**Syntax**

```typescript
interface rect{
    // The index of the selected area. The index is 0-based. This is useful when you have multiple selected areas on one page.
    areaIndex: number;
    // The x-coordinate of the upper-left corner of the area.
    x: number;
    // The y-coordinate of the upper-left corner of the area.
    y: number;
    // The width of the selected area.
    width: number;
    // The height of the selected area.
    height: number;
};
```

---

## Buffer

### TagInfo

**Syntax**

```typescript
interface TagInfo {
    name: string;
    imageIds: number[];
}
```

---

### BufferChangeInfo

**Syntax**

```typescript
interface BufferChangeInfo {
    /**
     * Action type includes 'add', 'remove', 'modify', 'shift' and 'filter'
     */
    action: string;
    /**
     * The image id (not the index) of the current page.
     */
    currentId: number;
    /**
     * All image ids.
     */
    imageIds: number[];
    /**
     * All selected image ids.
     */
    selectedIds: number[];
}
```

---

### DocumentInfo

**Syntax**

```typescript
interface DocumentInfo {
   name: string;
   imageIds: number[];
}
```

---

## Output

### Base64Result

**Syntax**

```typescript
interface Base64Result {
    /**
     * Return the length of the result string.
     */
    getLength(): number;
    /**
     * Return part of the string.
     * @param offset The starting position.
     * @param length The length of the expected string.
     */
    getData(offset: number, length: number): string;
    /**
     * Return the MD5 value of the result.
     */
    getMD5(): string;
}
```

---

## PDF

### ReaderOptions

Sets the PDF Rasterizer parameters

**Syntax**

```typescript
interface ReaderOptions {
    /**
     * Default value: CM_AUTO
     */
    convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode | number,   
    /**
     * If a password is required to open the PDF, set it here. Default value: "".
     */
    password?: string,  
    renderOptions?: {
        /**
         * Controls whether or not annotations will be rendered. Only valid if convertMode is set to CM_RENDERALL or CM_AUTO with a valid PDF Rastierzer license. Default value: false.
         */
        renderAnnotations?: boolean,
        /**
         * DPI. Only affects text being rasterized. Does not affect images extracted from the PDF file. Default value: 200.
         */
        resolution?: number,  
        /**
         * Pixels. 0 is no limit. Default value: 0.
         */
        maxWidth?: number,
        /** 
         * Pixels. 0 is no limit. Default value: 0.
         */
        maxHeight?: number,
        /**
         * Whether or not to render in grayscale. Default value: false.
         */
        renderGrayscale?: boolean
    }

}

```

Please see [this list]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_convertmode) for available ConvertMode enumerations.

---


<!--
---

###

**Syntax**

```typescript

```

---

###

**Syntax**

```typescript

```


---

###

**Syntax**

```typescript

```

---

###

**Syntax**

```typescript

```

---

###

**Syntax**

```typescript

```
-->
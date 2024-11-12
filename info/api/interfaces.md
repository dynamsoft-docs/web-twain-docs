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

## Global

### DWTInitialConfig

**Syntax**

```typescript
interface DWTInitialConfig {
    WebTwainId: string;
    Host ? : string; // Default value: "127.0.0.1"
    Port ? : string | number; // Default value: 18622
    PortSSL ? : string | number; // Default value: 18623
}
```

- `Host`, `Port`, `PortSSL`: These three optional parameters must be set at the same time.

### Container

**Syntax**

``` typescript
interface Container {
    WebTwainId?: string; // Id of the WebTwain instance
    ContainerId?: string; // Id of the element
    Width?: string | number; // Width of the element
    Height?: string | number; // Height of the element
}
```

- `WebTwainId` and `ContainerId` are both optional but one must exist as the identifier for that `WebTwain` instance.
- `Width` and `Height` determine the initial size of `Viewer` object.

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
   deviceType: Dynamsoft.DWT.EnumDWT_DeviceType;
   serviceInfo?: ServiceInfo;
   deviceInfo?: any;
}
```

- [`EnumDWT_DeviceType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_devicetype)
- [`ServiceInfo`]({{site.info}}api/Interfaces.html#serviceinfo)

### ServiceInfo

**Syntax**

```typescript
interface ServiceInfo {
	server: string;
	attrs?: any;
}
```



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

- [`EnumDWT_PixelType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_pixeltype)
- [`EnumDWT_ExtImageInfo`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_extimageinfo)
- [`EnumDWT_CapSupportedSizes`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_capsupportedsizes)

`extendedImageInfoQueryLevel` is 0 (`default`) by default which means the following information will be retrieved (if available):

| Label                  | Value  |
| :--------------------- | :----- |
| TWEI_BARCODEX          | 0x1200 |
| TWEI_BARCODEY          | 0x1201 |
| TWEI_BARCODETEXT       | 0x1202 |
| TWEI_BARCODETYPE       | 0x1203 |
| TWEI_ENDORSEDTEXT      | 0x1213 |
| TWEI_BARCODECONFIDENCE | 0x121A |
| TWEI_BARCODEROTATION   | 0x121B |
| TWEI_BARCODETEXTLENGTH | 0x121C |
| TWEI_BOOKNAME          | 0x1238 |
| TWEI_CHAPTERNUMBER     | 0x1239 |
| TWEI_DOCUMENTNUMBER    | 0x123A |
| TWEI_PAGENUMBER        | 0x123B |
| TWEI_CAMERA            | 0x123C |
| TWEI_FRAMENUMBER       | 0x123D |
| TWEI_FRAME             | 0x123E |
| TWEI_PIXELFLAVOR       | 0x123F |
| TWEI_MAGDATA           | 0x1243 |
| TWEI_MAGTYPE           | 0x1244 |
| TWEI_PAGESIDE          | 0x1245 |

If it's set to 1 (`standard`), the following will also be retrieved (if available):

| Label                      | Value  |
| :------------------------- | :----- |
| TWEI_DESHADETOP            | 0x1204 |
| TWEI_DESHADELEFT           | 0x1205 |
| TWEI_DESHADEHEIGHT         | 0x1206 |
| TWEI_DESHADEWIDTH          | 0x1207 |
| TWEI_DESHADESIZE           | 0x1208 |
| TWEI_SPECKLESREMOVED       | 0x1209 |
| TWEI_HORZLINEXCOORD        | 0x120A |
| TWEI_HORZLINEYCOORD        | 0x120B |
| TWEI_HORZLINELENGTH        | 0x120C |
| TWEI_HORZLINETHICKNESS     | 0x120D |
| TWEI_VERTLINEXCOORD        | 0x120E |
| TWEI_VERTLINEYCOORD        | 0x120F |
| TWEI_VERTLINELENGTH        | 0x1210 |
| TWEI_VERTLINETHICKNESS     | 0x1211 |
| TWEI_PATCHCODE             | 0x1212 |
| TWEI_FORMCONFIDENCE        | 0x1214 |
| TWEI_FORMTEMPLATEMATCH     | 0x1215 |
| TWEI_FORMTEMPLATEPAGEMATCH | 0x1216 |
| TWEI_FORMHORZDOCOFFSET     | 0x1217 |
| TWEI_FORMVERTDOCOFFSET     | 0x1218 |
| TWEI_BARCODECOUNT          | 0x1219 |
| TWEI_DESHADECOUNT          | 0x121D |
| TWEI_DESHADEBLACKCOUNTOLD  | 0x121E |
| TWEI_DESHADEBLACKCOUNTNEW  | 0x121F |
| TWEI_DESHADEBLACKRLMIN     | 0x1220 |
| TWEI_DESHADEBLACKRLMAX     | 0x1221 |
| TWEI_DESHADEWHITECOUNTOLD  | 0x1222 |
| TWEI_DESHADEWHITECOUNTNEW  | 0x1223 |
| TWEI_DESHADEWHITERLMIN     | 0x1224 |
| TWEI_DESHADEWHITERLAVE     | 0x1225 |
| TWEI_DESHADEWHITERLMAX     | 0x1226 |
| TWEI_BLACKSPECKLESREMOVED  | 0x1227 |
| TWEI_WHITESPECKLESREMOVED  | 0x1228 |
| TWEI_HORZLINECOUNT         | 0x1229 |
| TWEI_VERTLINECOUNT         | 0x122A |
| TWEI_DESKEWSTATUS          | 0x122B |
| TWEI_SKEWORIGINALANGLE     | 0x122C |
| TWEI_SKEWFINALANGLE        | 0x122D |
| TWEI_SKEWCONFIDENCE        | 0x122E |
| TWEI_SKEWWINDOWX1          | 0x122F |
| TWEI_SKEWWINDOWY1          | 0x1230 |
| TWEI_SKEWWINDOWX2          | 0x1231 |
| TWEI_SKEWWINDOWY2          | 0x1232 |
| TWEI_SKEWWINDOWX3          | 0x1233 |
| TWEI_SKEWWINDOWY3          | 0x1234 |
| TWEI_SKEWWINDOWX4          | 0x1235 |
| TWEI_SKEWWINDOWY4          | 0x1236 |
| TWEI_ICCPROFILE            | 0x1240 |
| TWEI_LASTSEGMENT           | 0x1241 |
| TWEI_SEGMENTNUMBER         | 0x1242 |
| TWEI_FILESYSTEMSOURCE      | 0x1246 |
| TWEI_IMAGEMERGED           | 0x1247 |
| TWEI_MAGDATALENGTH         | 0x1248 |
| TWEI_PAPERCOUNT            | 0x1249 |
| TWEI_PRINTERTEXT           | 0x124A |

If it's set to 2 (`supported`), then besides what's mentioned in the two tables above, the Dynamic Web TWAIN library will also try to query the scanner for its own custom extended image info.



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
     * Supported Groups
     */
    SupportedGroups?: number
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

- [`Version`]({{site.info}}api/Interfaces.html#version)



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



### ScanSetup

**Syntax**

```typescript
interface ScanSetup {
  /**
   * An id that specifies this specific setup.
   */
  setupId?: string;
  /**
   * Whether to ignore or fail the acquistion when an exception is raised. Set "ignore" or "fail".
   */
  exception?: string;
  /**
   * The name of the data source (the scanner) or Device object. If not set, the default data source is used.
   */
  scanner?: string | Device;
  ui?: {
    /**
     * Whether to show the UI of the device.
     */
    bShowUI?: boolean;
    /**
     * Whether to show the indicator of the device.
     */
    bShowIndicator?: boolean;
  };
  /**
   * The TWAIN transfer mode.
   */
  transferMode?: Dynamsoft.DWT.EnumDWT_TransferMode | number;
  /**
   * Set how the transfer is done.
   */
  fileXfer?: {
    /**
     * Specify the file name (or pattern) for file transfer.
     * Example: "C:\\WebTWAIN<%06d>.bmp"
     */
    fileName?: string;
    /**
     * Specify the file format.
     */
    fileFormat?: Dynamsoft.DWT.EnumDWT_FileFormat | number;
    /**
     * Specify the quality of JPEG files.
     */
    jpegQuality?: number;
    /**
     * Specify the compression type of the file.
     */
    compressionType?: Dynamsoft.DWT.EnumDWT_CompressionType | number;
  };
  /**
   * Set where the scanned images are inserted.
   */
  insertingIndex?: number;
  /**
   * The profile is a base64 string, if present, it overrides settings and more settings.
   */
  profile?: string;
  /**
   * Basic settings.
   */
  settings?: {
    /**
     * "ignore" (default) or "fail".
     */
    exception?: string;
    /**
     * Specify the pixel type.
     */
    pixelType?: Dynamsoft.DWT.EnumDWT_PixelType | number;
    /**
     * Specify the resolution.
     */
    resolution?: number;
    /**
     * Whether to enable document feeder.
     */
    bFeeder?: boolean;
    /**
     * Whether to enable duplex scan.
     */
    bDuplex?: boolean;
  };
  moreSettings?: {
    /**
     * "ignore" (default) or "fail".
     */
    exception?: string;
    /**
     * Specify the bit depth.
     */
    bitDepth?: number;
    /**
     * Specify the page size.
     */
    pageSize?: Dynamsoft.DWT.EnumDWT_CapSupportedSizes | number;
    /**
     * Specify the unit.
     */
    unit?: Dynamsoft.DWT.EnumDWT_UnitType | number;
    /**
     * Specify a layout to scan, if present, it'll override pageSize.
     */
    layout?: {
      left?: number;
      top?: number;
      right?: number;
      bottom?: number;
    };
    /**
     * Specify the pixel flavor.
     */
    pixelFlavor?: Dynamsoft.DWT.EnumDWT_CapPixelFlavor | number;
    /**
     * Specify Brightness.
     */
    brightness?: number;
    /**
     * Specify contrast.
     */
    contrast?: number;
    /**
     * Specify how many images are transferred per session.
     */
    nXferCount?: number;
    /**
     * Whether to enable automatic blank image detection and removal.
     */
    autoDiscardBlankPages?: boolean;
    /**
     * Whether to enable automatic border detection.
     */
    autoBorderDetection?: boolean;
    /**
     * Whether to enable automatic skew correction.
     */
    autoDeskew?: boolean;
    /**
     * Whether to enable automatic brightness adjustment.
     */
    autoBright?: boolean;
  };
  /**
   * A callback triggered before the scan, after the scan and after each page has been transferred.
   * Returned status
   * {event: 'beforeAcquire', result: {…}} //Equivalent to OnPreAllTransfers event
   * {event: 'postTransfer', bScanCompleted: false, result: {…}} //Equivalent to OnPostTransfer event
   * {event: 'postTransfer', bScanCompleted: true, result: {…}} //Equivalent to OnPostAllTransfers event
   */
  funcScanStatus?: (status: Status) => void;
  /**
   * Set up how the scanned images are outputted.
   */
  outputSetup?: {
    /**
     * Output type. "http" is the only supported type for now.
     */
    type?: string;
    /**
     * Set the output format.
     */
    format?: Dynamsoft.DWT.EnumDWT_ImageType | number;
    /**
     * Specify how many times the library will try the output.
     */
    reTries?: number;
    /**
     * Whether to use the FileUploader.
     */
    useUploader?: boolean;
    /**
     * Whether to upload all images in one HTTP post.
     */
    singlePost?: boolean;
    /**
     * Whether to show a progress bar when outputting.
     */
    showProgressBar?: boolean;
    /**
     * Whether to remove the images after outputting.
     */
    removeAfterOutput?: boolean;
    /**
     * A callback triggered during the outputting.
     * @argument fileInfo A JSON object that contains the fileName, percentage, statusCode, responseString, etc.
     */
    funcHttpUploadStatus?: (fileInfo: any) => void;
    /**
     * Setup for PDF output.
     */
    pdfSetup?: {
      author?: string;
      compression?: Dynamsoft.DWT.EnumDWT_PDFCompressionType | number;
      creator?: string;
      /**
       * Example: 'D:20181231'
       */
      creationDate?: string;
      keyWords?: string;
      /**
       * Example: 'D:20181231'
       */
      modifiedDate?: string;
      producer?: string;
      subject?: string;
      title?: string;
      version?: number;
      quality?: number;
    };
    /**
     * Setup for TIFF output.
     */
    tiffSetup?: {
      quality?: number;
      compression?: Dynamsoft.DWT.EnumDWT_TIFFCompressionType | number;
      /**
       * Specify Tiff custom tags.
       */
      tiffTags?: TiffTag[];
    };
    /**
     * Setup for HTTP upload via Post.
     */
    httpParams?: {
      /**
       * Target of the request.
       * Example: "http://dynamsoft.com/receivepost.aspx"
       */
      url?: string;
      /**
       * Custom headers in the form.
       * Example: {md5: ""}
       */
      headers?: any;
      /**
       * Custom form fields.
       * Example: {"UploadedBy": "Dynamsoft"}
       */
      formFields?: any;
      /**
       * The maximum size of a file to be uploaded (in bytes).
       */
      maxSizeLimit?: number;
      /**
       * Specify how many threads (<=4) are to be used. Only valid when {useUploader} is true.
       */
      threads?: number;
      /**
       * Specify the names for the files in the form.
       * Example: "RemoteName<%06d>"
       */
      remoteName?: string;
      /**
       * Specify the name(s) (pattern) of the uploaded files.
       * Example: "uploadedFile<%06d>.jpg"
       */
      fileName?: string;
    };
  };
}
```

- [`Device`]({{site.info}}api/Interfaces.html#device)
- [`EnumDWT_TransferMode`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_transfermode)
- [`EnumDWT_FileFormat`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_fileformat)
- [`EnumDWT_CompressionType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_compressiontype)
- [`EnumDWT_PixelType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_pixeltype)
- [`EnumDWT_CapSupportedSizes`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_capsupportedsizes)
- [`EnumDWT_UnitType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_unittype)
- [`EnumDWT_CapPixelFlavor`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_cappixelflavor)
- [`EnumDWT_ImageType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_imagetype)
- [`EnumDWT_PDFCompressionType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_pdfcompressiontype)
- [`EnumDWT_TIFFCompressionType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_tiffcompressiontype)
- [`Status`]({{site.info}}api/Interfaces.html#status)
- [`TiffTag`]({{site.info}}api/Interfaces.html#tifftag)

### Status

**Syntax**

```typescript
interface Status {
    bScanCompleted?: boolean;
    event?: string;
    result?: {
        currentPageNum?: number;
    };
}
```

### TiffTag

**Syntax**

```typescript
interface TiffTag {
    tagIdentifier?: number;
    content?: string;
    useBase64Encoding?: boolean;
}
```

### OutputInfo

**Syntax**

```typescript
interface OutputInfo {
  /**
   * Id of the image if it's transferred to the buffer.
   */
  imageId?: string;
  /**
   * Path of the image if it's transferred to the disk.
   */
  path?: string;
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
     * Except TWON_ARRAY type whose current values return via the attribute values
     */
    curValue?: ValueAndLabel | string | number | Frame;
    /**
     * The default value of the Capability
     */
    defaultValue?: ValueAndLabel | string | number | Frame;
    /**
     * The maximum value of the Capability
     */
    maxValue?: number;
    /**
     * The minimum value of the Capability
     */
    minValue?: number;
    /**
     * The step size of the Capability
     */
    stepSize?: number;
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
     * The current values of the Capability when conType's label is TWON_ARRAY.
     */
    values?: ValueAndLabel[] | any[];
    /**
     * The available values of the Capability when conType's label is TWON_ENUMERATION.
     */
    enums?: ValueAndLabel[] | any[];
}
```

- [`ValueAndLabel`]({{site.info}}api/Interfaces.html#valueandlabel)
- [`Frame`]({{site.info}}api/Interfaces.html#frame)



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

- [`EnumDWT_Cap`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_cap)
- [`EnumDWT_CapType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_captype) 
- [`EnumDWT_CapValueType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_capvaluetype)



### Frame

**Syntax**

```typescript
interface Frame{
    left:number,
    top:number,
    right:number,
    bottom:number,
}
```

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
    capabilities: CapabilitySetup[];
}
```

- [`CapabilitySetup`]({{site.info}}api/Interfaces.html#capabilitysetup)



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
     * Except TWON_ARRAY type whose current values are set via the attribute values.
     */
    curValue?: number | string | object; 
    /**
     * The value array to set to the capability or the value array of the capability after setting.
     * Only available for TWON_ARRAY type.
    */
    values?: any[];
    errorCode?: number;
    errorString?: string;
    /**
     * Whether to "ignore" or "fail" the request if an exception occurs when setting this specific capability.
     */
    exception? : string;
}
```

- [`EnumDWT_Cap`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_cap)

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
>- v18.4+
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

- [`SelectionBoxStyleSettings`]({{site.info}}api/Interfaces.html#selectionboxstylesettings)



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

- [EnumDWT_WorkMode]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_workmode).



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
    /**
     * Where to put the thumbnail view. The allowed values are left, top, right, bottom. The default value is left.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     */
    location: string;
    /**
     * Specify the size of width or height in pixels or percentage. The default value is 30%.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     * number in pixels, string in percentage
     */
    size: number | string;
    /**
     * 
     * Specify scroll direction. Allowed values are 'vertical' and 'horizontal'.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     */
    scrollDirection: string;
    /**
     * Set the margin between images & the margin between image and the viewer border). The default value is 10.
     * Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     * number in pixels, string in percentage
     */
    margin: number | string;
    /**
     * Set the background of the entire thumbnail viewer. The default value is white.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     * Allow any CSS rules
     */
    background: string;
    /**
     * Set the border of the thumbnail viewer.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     * Allow any CSS rules
     */
    border: string;
    /**
     * Whether to allow keyboard control.
     */
    allowKeyboardControl: boolean;
    /**
     * Whether to allow image dragging. The default value is true.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     */
    allowPageDragging: boolean;
    /**
     * Whether to allow the mouse to resize the thumbnail viewer. The default value is false.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     */
    allowResizing: boolean;
    /**
     * When set to true, will make sure the first image in the viewer is always selected when scrolling through multiple images.
     */
    autoChangeIndex: boolean;
    /**
     * Return or set the background colour/image of the thumbnail viewer. The default value is white.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     * Allow any CSS rules
     */
    pageBackground: string;
    /**
     * Set the border of the thumbnail viewer.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     * Allow any CSS rules
     */
    pageBorder: string;
    /**
     * Set the image background when the mouse is hovered.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     * Allow any CSS rules
     */
    hoverBackground: string;
    /**
     * Set the image border when the mouse is hovered.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     * Allow any CSS rules
     */
    hoverBorder: string;
    /**
     * Set the background when dragging the image. The default value is yellow.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     * Allow any CSS rules
     */
    placeholderBackground: string;
    /**
     * Set the border of the selected image.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     * Allow any CSS rules
     */
    selectedImageBorder: string;
    /**
     * Set the background of the selected image.
     * 'Invalid property value' will be reported when the specified value type is wrong or the parameter name is spelled incorrectly.
     * Allow any CSS rules
     */
    selectedImageBackground: string;
}
```


- [`ViewMode`]({{site.info}}api/Interfaces.html#viewmode) 
- [`CheckboxSettings`]({{site.info}}api/Interfaces.html#checkboxsettings)
- [`PageNumberSettings`]({{site.info}}api/Interfaces.html#pagenumbersettings)
- [`ThumbnailViewerEvent`]({{site.info}}api/Interfaces.html#thumbnailviewerevent)
- [`KeyboardEvent`](https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent)
- [`MouseEvent`](https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent)

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
      translateY?: number | string; //default: "",  number unit: px, string value: "10px"/"10%", relative to itself
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
      translateY?: number | string; //default: "", number unit: px, string value: "10px"/"10%", relative to itself
    };
}
```



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



### Area

**Syntax**

```typescript
interface Area {
    left: number;
    top: number;
    right: number;
    bottom: number;
};
```



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
  translateY?: number | string; //default: "", number unit: px, string value: "10px"/"10%", relative to itself
}
```



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
  translateY?: number | string; //default: "", number unit: px, string value: "10px"/"10%", relative to itself
}
```



### SelectionBoxStyleSettings
```typescript
interface SelectionBoxStyleSettings { 
    borderColor?: string; //Default: rgba(0,0,0,1). Selection box line segment colour in "rgba(r, g, b, a)"
    borderWidth?: number; //Default: 1. Unit: pixels. Width of individual pattern segments.
    lineDash?: [number,number]; //Default: [5,2]. Unit: pixels. Line spacing where x is shaded pixels and y is gap in pixels.
    handleWidth?: number; //Default: 9. Unit: pixels. Width of the selection box control handle.
    handleHeight?: number; //Default: 9. Unit: pixels. Height of the selection box control handle.
    handleColor?: string; //Default: rgba(0,0,0,1). Selection box control handle colour in "rgba(r, g, b, a)"
} 

```



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



## Buffer

### TagInfo

**Syntax**

```typescript
interface TagInfo {
    name: string;
    imageIds: string[];
}
```



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
    currentId: string;
    /**
     * All image ids.
     */
    imageIds: string[];
    /**
     * All selected image ids.
     */
    selectedIds: string[];
    /**
     * The modified imageId, only available when action type is 'modify'.
    */
    modifiedId?: string; 
}
```

### DocumentInfo

**Syntax**

```typescript
interface DocumentInfo {
   name: string;
   imageIds: string[];
}
```


<!-- ### MetaData

**Syntax**

```typescript
interface MetaData{
    /**
     * The width of image.
     */
    width: number;
    /**
     * The height of image.
     */
    height: number;
    /**
     * The bit depth of image.
     */
    bitDepth: number;
    /**
     * The x-axis resolution of image.
     */
    resolutionX: number;
    /**
     * The y-axis resolution of image.
     */
    resolutionY: number;
}
``` -->


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



## PDF

### ReaderOptions

Sets the PDF Rasterizer parameters.

**Syntax**

```typescript
interface ReaderOptions {
    /**
     * Default value: CM_AUTO
     */
    convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode | number;   
    /**
     * If a password is required to open the PDF, set it here. Default value: "".
     */
    password?: string;  
    renderOptions?: {
        /**
         * Controls whether or not annotations will be rendered. Only valid if convertMode is set to CM_RENDERALL or CM_AUTO with a valid PDF Rastierzer license. Default value: false.
         */
        renderAnnotations?: boolean;
        /**
         * DPI. Only affects text being rasterized. Does not affect images extracted from the PDF file. Default value: 200.
         */
        resolution?: number;  
        /**
         * Pixels. 0 is no limit. Default value: 0.
         */
        maxWidth?: number;
        /** 
         * Pixels. 0 is no limit. Default value: 0.
         */
        maxHeight?: number;
        /**
         * Whether or not to render in grayscale. Default value: false.
         */
        renderGrayscale?: boolean;
    }

}

```

- [`EnumDWT_ConvertMode`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_convertmode)



### PDFWSettings

Specify the pdf writing settings.

**Syntax**

```typescript
interface PDFWSettings {
    /**
     * Specify the author.
     */
    author?: string;
    /**
     * Specify the compression type.
     */
    compression?: Dynamsoft.DWT.EnumDWT_PDFCompressionType | number;
     /**
     * Specify the page type.
     */
    pageType?: Dynamsoft.DWT.EnumPDF_Page | number; 
    /**
     * Specify the creator.
     */
    creator?: string;
    /**
     * Specify the creation date.
     * Note that the argument should start with 'D:' like 'D:20181231'.
     */
    creationDate?: string;
    /**
     * Specify the key words.
     */
    keyWords?: string;
    /**
     * Specify the modified date.
     * Note that the argument should start with 'D:' like 'D:20181231'.
     */
    modifiedDate?: string;
    /**
     * Specify the producer.
     */
    producer?: string;
    /**
     * Specify the subject.
     */
    subject?: string;
    /**
     * Specify the title.
     */
    title?: string;
    /**
     * Specify the PDF version. For example, 1.5. The allowed values are 1.1 ~ 1.7.
     * NOTE: If the compression type is PDF_JBig2, the lowest allowed version is 1.4
     * If the compression type is PDF_JP2000, the lowest allowed version is 1.5
     */
    version?: string;
    /**
     * Specify the quality of the images in the file.
     * The value ranges from 0 to 100.
     * Only valid when the {compression} is 'JPEG' or 'JPEG2000'.
     */
    quality?: number;
    /**
     * From version 18.5
     * Specify the password.
     * Default value: ''
     * Up to 32 characters.
     */
    password?: string;
}
```

- [`EnumDWT_PDFCompressionType`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_pdfcompressiontype) 
- [`EnumPDF_Page`]({{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumpdf_page)


## Webcam

### CameraControlProperty

The information about the specified camera property.

**Syntax**

```typescript
interface CameraControlProperty {
    /**
     * Return the value of the property.
     */
    GetValue(): number;
    /**
     * Return whether the property is set autmatically or not.
     */
    GetIfAuto(): boolean;
}
```

### CameraControlPropertyExtra

The detailed information about the specified camera property.

**Syntax**

```typescript
interface CameraControlPropertyExtra {
    /**
     * Return the minimum value of the property.
     */
    GetMinValue(): number;
    /**
     * Return the maximum value of the property.
     */
    GetMaxValue(): number;
    /**
     * Return the default value of the property.
     */
    GetDefaultValue(): number;
    /**
     * Return the smallest increment by which the property can change.
     */
    GetSteppingDelta(): number;
    /**
     * Return whether the property is set autmatically or not.
     */
    GetIfAuto(): boolean;
}
```

### VideoControlProperty

The information about the specified video property.

**Syntax**

```typescript
interface VideoControlProperty {
    /**
     * Return the value of the property.
     */
    GetValue(): number;
    /**
     * Return whether the property is set autmatically or not.
     */
    GetIfAuto(): boolean;
}
```

### VideoControlPropertyExtra

The detailed information about the specified video property.

**Syntax**

```typescript
interface VideoControlPropertyExtra {
    /**
     * Return the minimum value of the property.
     */
    GetMinValue(): number;
    /**
     * Return the maximum value of the property.
     */
    GetMaxValue(): number;
    /**
     * Return the default value of the property.
     */
    GetDefaultValue(): number;
    /**
     * Return the smallest increment by which the property can change.
     */
    GetSteppingDelta(): number;
    /**
     * Return whether the property is set autmatically or not.
     */
    GetIfAuto(): boolean;
}
```

### FrameRate

The frame rates.

**Syntax**

```typescript
interface FrameRate {
    /**
     * Return the number of available frame rates.
     */
    GetCount(): number;
    /**
     * Return the specified frame rate.
     */
    Get(index: number): number;
    /**
     * Return the current frame rate.
     */
    GetCurrent(): number;
}
```

### MediaType

The media types.

**Syntax**

```typescript
interface MediaType {
    /**
     * Return the number of available media types.
     */
    GetCount(): number;
    /**
     * Return the specified media type.
     */
    Get(index: number): string;
    /**
     * Return the current media type.
     */
    GetCurrent(): string;
}
```

### Resolution

The resolutions.

**Syntax**

```typescript
interface Resolution {
    /**
     * Return the number of available resolutions.
     */
    GetCount(): number;
    /**
     * Return the specified resolution.
     */
    Get(index: number): string;
    /**
     * Return the current resolution.
     */
    GetCurrent(): string;
}
```


## BarcodeReader

### TextResult

**Syntax**

```typescript
interface TextResult {
    /**
     * Barcode result content in a byte array.
     */
    barcodeBytes: number[];
    /**
     * The barcode format.
     */
    barcodeFormat: Dynamsoft.DBR.EnumBarcodeFormat | number;
    /**
     * Extra barcde formats.
     */
    barcodeFormat_2: Dynamsoft.DBR.EnumBarcodeFormat_2 | number;
    /**
     * Barcode formats as a string.
     */
    barcodeFormatString: string;
    /**
     * Extra barcode formats as a string.
     */
    barcodeFormatString_2: string;
    /**
     * The barcode result text.
     */
    barcodeText: string;
    /**
     * Detailed result information.
     */
    detailedResult: any;
    /**
     * The corresponding localization result.
     */
    localizationResult: LocalizationResult;
    /**
     * Other information
     */
    results: Result[];
}
```

- [`EnumBarcodeFormat`](https://www.dynamsoft.com/barcode-reader/docs/web/programming/javascript/api-reference/enum/EnumBarcodeFormat.html?ver=9.6.33)
- [`EnumBarcodeFormat_2`](https://www.dynamsoft.com/barcode-reader/docs/web/programming/javascript/api-reference/enum/EnumBarcodeFormat_2.html?ver=9.6.33)
- [`LocalizationResult`]({{site.info}}api/Interfaces.html#localizationresult) 
- [`Result`]({{site.info}}api/Interfaces.html#result)

### LocalizationResult

**Syntax**

```typescript
interface LocalizationResult {
    /**
     * The angle of a barcode. Values range from 0 to 360.
     */
    angle: number;
    /**
     * The X coordinate of the left-most point.
     */
    x1: number;
    /**
     * The X coordinate of the second point in a clockwise direction.
     */
    x2: number;
    /**
     * The X coordinate of the third point in a clockwise direction.
     */
    x3: number;
    /**
     * The X coordinate of the fourth point in a clockwise direction.
     */
    x4: number;
    /**
     * The Y coordinate of the left-most point.
     */
    y1: number;
    /**
     * The Y coordinate of the second point in a clockwise direction.
     */
    y2: number;
    /**
     * The Y coordinate of the third point in a clockwise direction.
     */
    y3: number;
    /**
     * The Y coordinate of the fourth point in a clockwise direction.
     */
    y4: number;
    moduleSize: number;
    pageNumber: number;
    regionName: number;
    resultCoordinateType: number;
    terminatePhase: number;
}
```

### Result

**Syntax**

```typescript
interface Result {
    accompanyingTextBytes: number[];
    clarity: number;
    confidence: number;
    deformation: number;
    resultType: number;
}
```

### RuntimeSettings

**Syntax**

```typescript
interface RuntimeSettings {
    barcodeFormatIds: number;
    barcodeFormatIds_2: number;
    binarizationModes: number[];
    deblurLevel: number;
    expectedBarcodesCount: number;
    furtherModes: FurtherModes;
    intermediateResultSavingMode: number;
    intermediateResultTypes: number;
    localizationModes: number[];
    maxAlgorithmThreadCount: number;
    minBarcodeTextLength: number;
    minResultConfidence: number;
    pdfRasterDPI: number;
    pdfReadingMode: number;
    region: Region;
    resultCoordinateType: number;
    returnBarcodeZoneClarity: number;
    scaleDownThreshold: number;
    scaleUpModes: number[];
    terminatePhase: number;
    textResultOrderModes: number[];
    timeout: number;
}
```

- [`FurtherModes`]({{site.info}}api/Interfaces.html#furthermodes)
- [`Region`]({{site.info}}api/Interfaces.html#region)

### FurtherModes

**Syntax**

```typescript
interface FurtherModes {
    accompanyingTextRecognitionModes: number[];
    barcodeColourModes: number[];
    barcodeComplementModes: number[];
    colourClusteringModes: number[];
    colourConversionModes: number[];
    deformationResistingModes: number[];
    dpmCodeReadingModes: number[];
    grayscaleTransformationModes: number[];
    imagePreprocessingModes: number[];
    regionPredetectionModes: number[];
    textAssistedCorrectionMode: number;
    textFilterModes: number[];
    textureDetectionModes: number[];
}
```

### Region

**Syntax**

```typescript
interface Region {
    regionBottom: number;
    regionLeft: number;
    regionMeasuredByPercentage: number;
    regionRight: number;
    regionTop: number;
}
```

## FileUploader

### FormField

```typescript
interface FormField {
    /**
     * Specify the block size. By default, it's 10240.
     * @param key Specify the key of the field.
     * @param value Sepcify the value of the field.
     */
    Add: (
        key: string;
        value: string;
    ) => boolean;
}
```

### SourceValue

```typescript
interface SourceValue {
    /**
     * Specify the block size. By default, it's 10240.
     * @param source A URL to specify the content of the file.
     * Normally it's generated by {GenerateURLForUploadData()}
     * @param name Specify the name of the file.
     * @param key Specify the key of the file in the request. This key can be used to retrieve the file content in server-side scripts.
     */
    Add: (
        source: string;
        name: string;
        key?: string;
    ) => void;
}
```

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
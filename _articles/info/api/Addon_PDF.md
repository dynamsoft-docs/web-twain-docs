---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - PDF Addon APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, PDF Addon APIs
breadcrumbText: PDF Addon
description: Dynamic Web TWAIN SDK Documentation API Reference PDF Addon APIs Page
---

# {WebTwainObject}.Addon.PDF

> {WebTwainObject} denotes the `WebTwain` instance.

**Methods**

| [`GetConvertMode()`](#getconvertmode) | [`GetReaderOptions()`](#getreaderoptions) | [`IsModuleInstalled()`](#ismoduleinstalled) | [`IsRasterizationRequired()`](#israsterizationrequired) |
| [`IsTextBasedPDF()`](#istextbasedpdf) | [`SetConvertMode()`](#setconvertmode)     | [`SetPassword()`](#setpassword)             | [`SetResolution()`](#setresolution)                     |
| [`Write.Setup()`](#writesetup)        | [`SetReaderOptions()`](#setreaderoptions) |                                             |                                                         |

---

## GetConvertMode()

> [!NOTE]
> This API has been deprecated as of release 18.4. Please use the [`GetReaderOptions()`](/_articles/info/api/Addon_PDF.md#getreaderoptions) function.

Return the convert mode.

**Syntax**

```typescript
GetConvertMode(): number;
```

Please refer to [`EnumDWT_ConvertMode`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_convertmode).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
</tr>

</table>
</div>

---

## GetReaderOptions()

Returns the current PDF reader options. Please refer to [`ReaderOptions`](/_articles/info/api/interfaces.md#readeroptions).

**Syntax**

```typescript
GetReaderOptions(): ReaderOptions;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v18.4+ </td>
<td align="center">v18.4+ </td>
<td align="center">v18.4+ </td>
<td align="center">v18.4+ </td>
</tr>

</table>
</div>

---

## IsModuleInstalled()

Return whether the PDF module has been installed.

**Syntax**

```typescript
IsModuleInstalled(): boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v14.1+ </td>
<td align="center">v14.1+ </td>
<td align="center">v14.1+ </td>
<td align="center">v14.1+ </td>
</tr>

</table>
</div>

---

## IsRasterizationRequired()

Return whether a local PDF file needs rasterization. If each PDF page contains only one image, return `false`. Otherwise, return `true`.

**Syntax**

```typescript
IsRasterizationRequired(path: string): boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v19.0+ </td>
<td align="center">v19.0+ </td>
<td align="center">v19.0+ </td>
<td align="center">v19.0+ </td>
</tr>

</table>
</div>

---

## IsTextBasedPDF()

Detect whether a local PDF file is text based or not.

**Syntax**

```typescript
IsTextBasedPDF(path: string): boolean;
```

**Parameters**

`path`: Specify the path of the PDF file.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
</tr>

</table>
</div>

---

## SetConvertMode()

> [!NOTE]
> This API has been deprecated as of release 18.4. Please use the [`SetReaderOptions()`](/_articles/info/api/Addon_PDF.md#setreaderoptions) function.

Set the convert mode.

**Syntax**

```typescript
SetConvertMode(mode: Dynamsoft.DWT.EnumDWT_ConvertMode | number): boolean;
```

**Parameters**

`mode`: Specify the mode. Please refer to [`EnumDWT_ConvertMode`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_convertmode). The default value is 3 (`Dynamsoft.DWT.EnumDWT_ConvertMode.CM_AUTO`)

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
</tr>

</table>
</div>

**Usage notes**

There are three conversion modes

- `CM_RENDERALL` (1): All the content in the target PDF file will be rasterized.
- `CM_IMAGEONLY` (2): The PDF Rasterizer is turned off.
- `CM_AUTO` (3): The library automatically detect whether a file needs to be rasterized or not and then process the file accordingly.

Use this method before you import a PDF into the viewer with methods such as [`LoadImage()`](/_articles/info/api/WebTwain_IO.md#loadimage){:target="\_blank"}, [`HTTPDownload()`](/_articles/info/api/WebTwain_IO.md#httpdownload){:target="\_blank"}, and [`FTPDownload()`](/_articles/info/api/WebTwain_IO.md#ftpdownload){:target="\_blank"}.

---

## SetReaderOptions()

Sets the current PDF reader options.

**Syntax**

```typescript
SetReaderOptions(options: ReaderOptions): boolean;
```

**Parameters**
`options`: Please see the [`ReaderOptions`](/_articles/info/api/interfaces.md#readeroptions) interface.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v18.4+ </td>
<td align="center">v18.4+ </td>
<td align="center">v18.4+ </td>
<td align="center">v18.4+ </td>
</tr>

</table>
</div>

**Usage Notes**
Use this method before you import a PDF into the viewer with methods such as [`LoadImage()`](/_articles/info/api/WebTwain_IO.md#loadimage){:target="\_blank"}, [`HTTPDownload()`](/_articles/info/api/WebTwain_IO.md#httpdownload){:target="\_blank"}, and [`FTPDownload()`](/_articles/info/api/WebTwain_IO.md#ftpdownload){:target="\_blank"}.

**Examples**

1. Render the PDF file to grayscale images without annotations.

    ```javascript
    DWTObject.Addon.PDF.SetReaderOptions({
        convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL,
        renderOptions: {
            renderAnnotations: false,
            renderGrayscale: true,
        },
    });
    ```

2. Render the PDF file to images, but when saving, preserve the original data if the content of a page is not modified.

    ```javascript
    DWTObject.Addon.PDF.SetReaderOptions({
        convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL,
        preserveUnmodifiedOnSave: true, //only available for v19.0+
    });
    ```

---

## SetPassword()

v
> This API has been deprecated as of release 18.4. Please use the [`SetReaderOptions()`](/_articles/info/api/Addon_PDF.md#setreaderoptions) function.

Set the password for reading encrypted PDF files.

**Syntax**

```typescript
SetPassword(password: string): boolean;
```

**Parameters**

`password`: Specify the password.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
</tr>

</table>
</div>

**Usage notes**

Use this method before you import a PDF into the viewer with methods such as [`LoadImage()`](/_articles/info/api/WebTwain_IO.md#loadimage){:target="\_blank"}, [`HTTPDownload()`](/_articles/info/api/WebTwain_IO.md#httpdownload){:target="\_blank"}, and [`FTPDownload()`](/_articles/info/api/WebTwain_IO.md#ftpdownload){:target="\_blank"}.

---

## SetResolution()

> [!NOTE]
> This API has been deprecated as of release 18.4. Please use the [`SetReaderOptions()`](/_articles/info/api/Addon_PDF.md#setreaderoptions) function.

Set the resolution for rasterizing.

**Syntax**

```typescript
SetResolution(resolution: number): boolean;
```

**Parameters**

`resolution`: Specify the resolution.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
</tr>

</table>
</div>

**Usage notes**

The default resolution for the conversion is 200. We recommend that you set a value smaller than 300, otherwise it might slow down the program or cause the process to fail.

Use this method before you import a PDF into the viewer with methods such as [`LoadImage()`](/_articles/info/api/WebTwain_IO.md#loadimage){:target="\_blank"}, [`HTTPDownload()`](/_articles/info/api/WebTwain_IO.md#httpdownload){:target="\_blank"}, and [`FTPDownload()`](/_articles/info/api/WebTwain_IO.md#ftpdownload){:target="\_blank"}.

---

## Write.Setup()

Set up the PDF writing engine.

**Syntax**

```typescript
Write.Setup(settings: PDFWSettings): boolean;
```

**Parameters**

`settings`: Configures how the PDF is generated. Please refer to [`PDFWSettings`](/_articles/info/api/interfaces.md#pdfwsettings).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v15.0+ </td>
<td align="center">v15.1+ </td>
<td align="center">v15.1+ </td>
<td align="center">v15.1+ </td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.Addon.PDF.Write.Setup({
    author: "Dynamsoft",
    compression: Dynamsoft.DWT.EnumDWT_PDFCompressionType.PDF_JPEG,
    pageType: Dynamsoft.DWT.EnumPDF_Page.Page_A4,
    creator: "DWT",
    creationDate: "D:20230101085959",
    keyWords: "samplepdf",
    modifiedDate: "D:20230101090101",
    producer: "Dynamic Web TWAIN",
    subject: "SamplePdf",
    title: "SamplePdf",
    version: "1.5",
    quality: 90,
});

DWTObject.SaveAllAsPDF("DynamicWebTWAIN.pdf", OnSuccess, OnFailure);

function OnSuccess() {
    console.log("successful");
}

function OnFailure(errorCode, errorString) {
    if (errorCode != -2326) alert(errorString);
}
```

**Usage notes**

Use this method before you create a PDF with methods such as [`HTTPUpload()`](/_articles/info/api/WebTwain_IO.md#httpupload){:target="\_blank"}, [`SaveAsPDF()`](/_articles/info/api/WebTwain_IO.md#saveaspdf){:target="\_blank"}, and [`SaveAllAsPDF()`](/_articles/info/api/WebTwain_IO.md#saveallaspdf){:target="\_blank"}.

Only the core module license is required to use this method.

---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - PDF Addon APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, PDF Addon APIs
breadcrumbText: PDF Addon
description: Dynamic Web TWAIN SDK Documentation API Reference PDF Addon APIs Page
permalink: /info/api/Addon_PDF.html
---

# `{WebTwainObject}.Addon.PDF`

> {WebTwainObject} denotes the `WebTwain` instance.

**Methods**

|                                       |
| :------------------------------------ | :------------------------------------------ | ------------------------------------- | ------------------------------------- |
| [`GetConvertMode()`](#getconvertmode) | [`IsModuleInstalled()`](#ismoduleinstalled) | [`IsTextBasedPDF()`](#istextbasedpdf) | [`SetConvertMode()`](#setconvertmode) |
| [`SetPassword()`](#setpassword)       | [`SetResolution()`](#setresolution)         | [`Write.Setup()`](#writesetup)        |

---

## GetConvertMode

Return the convert mode.

**Syntax**

```typescript
GetConvertMode(): number;
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
<td align="center">not supported  </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
<td align="center">v17.2+ </td>
</tr>

</table>
</div>

---

## IsModuleInstalled

Return whether the PDF module has been installed.

**Syntax**

```typescript
IsModuleInstalled(): boolean;
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
<td align="center">v14.1+ </td>
<td align="center">v14.1+ </td>
<td align="center">v14.1+ </td>
<td align="center">v14.1+ </td>
<td align="center">v14.1+ </td>
</tr>

</table>
</div>

---

## IsTextBasedPDF

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
<td align="center">ActiveX</td>
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
<td align="center">v11.2+ </td>
</tr>

</table>
</div>

---

## SetConvertMode

Set the convert mode.

**Syntax**

```typescript
SetConvertMode(mode: Dynamsoft.DWT.EnumDWT_ConvertMode | number): boolean;
```

Enumerations：<a href="{{{site.info}}api/Dynamsoft_Enum.html#dynamsoftdwtenumdwt_convertmode" target="_blank">Dynamsoft.DWT.EnumDWT_ConvertMode</a>
 

**Parameters**

`mode`: Specify the mode. The default value is 3 (Dynamsoft.DWT.EnumDWT_ConvertMode.CM_AUTO)

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
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
<td align="center">v11.2+ </td>
</tr>

</table>
</div>

**Usage notes**

There are four conversion modes

- CM_RENDERALL (1): All the content in the target PDF file will be rasterized.
- CM_IMAGEONLY (2): The PDF Rasterizer is turned off.
- CM_AUTO (3): The library automatically detect whether a file needs to be rasterized or not and then process the file accordingly.
- CM_RENDERALLWITHANNOTATION (4): Support loading PDF file with annotation. 

Use this method before you import a PDF into the viewer with methods such as <a href="{{site.info}}api/WebTwain_IO.html#loadimage" target="_blank">`LoadImage()`</a> , <a href="{{site.info}}api/WebTwain_IO.html#httpdownload" target="_blank">`HTTPDownload()`</a> and <a href="{{site.info}}api/WebTwain_IO.html#httpdownload" target="_blank">`FTPDownload()`</a>.

---

## SetPassword

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
<td align="center">ActiveX</td>
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
<td align="center">v11.2+ </td>
</tr>

</table>
</div>

**Usage notes**

Use this method before you import a PDF into the viewer with methods such as <a href="{{site.info}}api/WebTwain_IO.html#loadimage" target="_blank">`LoadImage()`</a> , <a href="{{site.info}}api/WebTwain_IO.html#httpdownload" target="_blank">`HTTPDownload()`</a> and <a href="{{site.info}}api/WebTwain_IO.html#httpdownload" target="_blank">`FTPDownload()`</a>.

---

## SetResolution

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
<td align="center">ActiveX</td>
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
<td align="center">v11.2+ </td>
</tr>

</table>
</div>

**Usage notes**

The default resolution for the conversion is 200. We recommend that you set a value smaller than 300, otherwise it might slow down the program or cause the process to fail.

Use this method before you import a PDF into the viewer with methods such as <a href="{{site.info}}api/WebTwain_IO.html#loadimage" target="_blank">`LoadImage()`</a> , <a href="{{site.info}}api/WebTwain_IO.html#httpdownload" target="_blank">`HTTPDownload()`</a> and <a href="{{site.info}}api/WebTwain_IO.html#httpdownload" target="_blank">`FTPDownload()`</a>.

---

## Write.Setup()

Set up the PDF writing engine.

**Syntax**

```typescript
Write.Setup(settings: PDFWSettings): void;

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
     * Allowed values are 0: Original, 2: A4, 6: letter, 8: legal
     */
    pageType?: number; 
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
     * NOTE: If the compression type is PDF_JBig2, the lowerest version is 1.4
     * If the compression type is PDF_JP2000, the lowerest version is 1.5
     */
    version?: string;
    /**
     * Specify the quality of the images in the file.
     * The value ranges from 0 to 100.
     * Only valid when the {compression} is 'JPEG' or 'JPEG2000'.
     */
    quality?: number;
}
```

**Parameters**

`settings`: Configures how the PDF is generated.

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
<td align="center">not supported </td>
<td align="center">v15.0+ </td>
<td align="center">v15.1+ </td>
<td align="center">v15.1+ </td>
<td align="center">v15.1+ </td>
</tr>

</table>
</div>

**Usage notes**

Use this method before you create a PDF with methods such as <a href="{{site.info}}api/WebTwain_IO.html#httpupload" target="_blank">`HTTPUpload()`</a>, <a href="{{site.info}}api/WebTwain_IO.html#saveaspdf" target="_blank">`SaveAsPDF()`</a>, and <a href="{{site.info}}api/WebTwain_IO.html#saveallaspdf" target="_blank">`SaveAllAsPDF()`</a>

Only the core module license is required to use this method.
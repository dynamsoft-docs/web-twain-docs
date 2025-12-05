---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - OCR Addon APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, OCR Addon APIs
breadcrumbText: OCR Addon
description: Dynamic Web TWAIN SDK Documentation API Reference OCR Addon APIs Page
---

# {WebTwainObject}.Addon.OCRKit

> {WebTwainObject} denotes the `WebTwain` instance.

**Methods**

| [`GetInstalledOCRInfo()`](#getinstalledocrinfo) | [`DetectPageOrientation()`](#detectpageorientation) | [`Recognize()`](#recognize) | [`SaveToPath()`](#savetopath) |
| [`SaveAsBase64()`](#saveasbase64) | [`SaveAsBlob()`](#saveasblob) |  |  |

---

## GetInstalledOCRInfo()

Return the info of the installed OCR addon. It will throw an error if the OCR module is not installed.

**Syntax**

```typescript
GetInstalledOCRInfo(): Promise<OCRInfo>;
```

**Return Values**

Promise of an [`OCRInfo`](/_articles/info/api/interfaces.md#ocrinfo) object.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported</td>
</tr>

</table>
</div>

---

## DetectPageOrientation()

**Syntax**

```ts
DetectPageOrientation( 
  index: number,  
  settings?: { 
    detectionMode?: EnumDWT_PageOrientationDetectionMode | number
  }
): Promise<{angle: EnumDWT_PageOrientation | number, confidence: number}>; 
```

**Parameters**

`index`: Index of the image to process.

`settings`: Settings of the method. You can configure the accuracy mode. Please refer to [`EnumDWT_PageOrientationDetectionMode`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_pageorientationdetectionmode).

**Return Values**

Promise of an object of the orientation detection result. Please refer to [`EnumDWT_PageOrientation`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_pageorientation).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported</td>
</tr>

</table>
</div>

---

## Recognize()

Recognize the text in one page.

**Syntax**

```ts
Recognize( 
  index: number,
  options?: {
    settings?: { 
      language?: string,
      pageOrientation?: EnumDWT_PageOrientation| number,
    },  
    rects?: { 
      left: number, 
      top: number, 
      right: number, 
      bottom: number
    }[]
  }
): Promise<OCRResult>;  
```

**Parameters**

`index`: Index of the image to process.

`options`:

* `settings`: Settings of the recognition.
  * `language`: Specify the code of language for recognition (`en`, `fr`, e.g.). See the table below listing supported languages.
  * `pageOrientation`: Specify the orientation of the page. The OCR will rotate the page before recognition. Please refer to [`EnumDWT_PageOrientation`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_pageorientation).
* `rects`: An array of rectangles to limit the regions for recognition.

**Return Values**

Promise of the [`OCRResult`](/_articles/info/api/interfaces.md#ocrresult) object.

**Supported Languages**

| Language Name              | Code  |
| :------------------------- | :---- |
| English                    | en    |
| French                     | fr    |
| Spanish                    | es    |
| German                     | de    |
| Italian                    | it    |
| Portuguese                 | pt    |

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported</td>
</tr>

</table>
</div>


---

## SaveToPath()

Save the result to a local path.

**Syntax**

```ts
SaveToPath(
  indices: number[],  
  outputFormat: Dynamsoft.DWT.EnumDWT_OCRKitOutputFormat | number,  
  path: string
): Promise<boolean>;
```

**Parameters**

`indices`: Indices of the pages to save.

`outputFormat`: Please refer to [`EnumDWT_OCRKitOutputFormat`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_ocrkitoutputformat).

`path`: System's absolute path or filename for saving. A file saving dialog will appear for confirmation.

**Return Values**

A `boolean` result indicating the success of the operation.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported</td>
</tr>

</table>
</div>


---

## SaveAsBase64()

Save the result as base64.

**Syntax**

```ts
SaveAsBase64(
  indices: number[],
  outputFormat: Dynamsoft.DWT.EnumDWT_OCRKitOutputFormat | number
): Promise<string>;
```

**Parameters**

`indices`: Indices of the pages to save.

`outputFormat`: Please refer to [`EnumDWT_OCRKitOutputFormat`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_ocrkitoutputformat).

**Return Values**

A base64 string result.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported</td>
</tr>

</table>
</div>


---

## SaveAsBlob()

Save the result as blob.

**Syntax**

```ts
SaveAsBlob(
  indices: number[],  
  outputFormat: Dynamsoft.DWT.EnumDWT_OCRKitOutputFormat | number
): Promise<blob>;
```

**Parameters**

`indices`: Indices of the pages to save.

`outputFormat`: Please refer to [`EnumDWT_OCRKitOutputFormat`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_ocrkitoutputformat).

**Return Values**

A `blob` result.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">not supported </td>
<td align="center">not supported</td>
</tr>

</table>
</div>
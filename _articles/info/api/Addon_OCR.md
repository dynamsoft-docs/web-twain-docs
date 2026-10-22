---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - OCR Addon APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, OCR Addon APIs
breadcrumbText: OCR Addon
description: Dynamic Web TWAIN SDK Documentation API Reference OCR Addon APIs Page
---

# {WebTwainObject}.Addon.OCRConnector

> {WebTwainObject} denotes the `WebTwain` instance.

**Methods**

| [`GetInstalledOCRInfo()`](#getinstalledocrinfo) | [`DetectPageOrientation()`](#detectpageorientation) | [`Recognize()`](#recognize) | [`SaveToPath()`](#savetopath) |
| [`SaveAsBase64()`](#saveasbase64) | [`SaveAsBlob()`](#saveasblob) |  |  |

---

## GetInstalledOCRInfo()

Return the info of the installed OCR addon. It contains a list of OCR engines and their supported languages.

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
<td align="center">Windows</td>
<td align="center">macOS</td>
<td align="center">Linux</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">v19.5+ </td>
<td align="center">not supported</td>
</tr>

</table>
</div>

---

## DetectPageOrientation()

Detect the orientation of a page.

**Syntax**

```ts
DetectPageOrientation( 
  index: number,  
  settings?: { 
    engine?: {
      name: string; 
    },
    detectionMode?: EnumDWT_PageOrientationDetectionMode | number
  }
): Promise<{angle: EnumDWT_PageOrientation | number, confidence: number}>; 
```

**Parameters**

`index`: Index of the image to process.

`settings`: Settings of the method. You can configure the accuracy mode and which OCR engine to use. Please refer to [`EnumDWT_PageOrientationDetectionMode`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_pageorientationdetectionmode). Currently, only the `Onnx.Ocr` engine supports this and it is used by default if installed.

**Return Values**

Promise of an object of the orientation detection result. Please refer to [`EnumDWT_PageOrientation`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_pageorientation).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">Windows</td>
<td align="center">macOS</td>
<td align="center">Linux</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">not supported</td>
<td align="center">not supported</td>
</tr>

</table>
</div>

---

## Recognize()

Recognize the text in one page. You can specify the engine and the language; their values can be retrieved via [`GetInstalledOCRInfo`](#getinstalledocrinfo)

**Syntax**

```ts
Recognize( 
  index: number,
  options?: {
    engine?: { 
      name :string 
    },
    settings?: { 
      language?: string,
      pageOrientation?: EnumDWT_PageOrientation| number,
      recognitionLevel?: "accurate" | "fast",
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

* `engine`: The OCR engine to use.
* `settings`: Settings of the recognition.
  * `language`: Specify the code of language for recognition. See [the table](/_articles/extended-usage/ocr.md) to learn about supported languages.
  * `pageOrientation`: Specify the orientation of the page. The OCR will rotate the page before recognition. Please refer to [`EnumDWT_PageOrientation`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_pageorientation).
  * `recognitionLevel`: Specify the recognition level for the OCR. It is only valid for macOS.
* `rects`: An array of rectangles to limit the regions for recognition.

**Return Values**

Promise of the [`OCRResult`](/_articles/info/api/interfaces.md#ocrresult) object.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">Windows</td>
<td align="center">macOS</td>
<td align="center">Linux</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">v19.5+ </td>
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
  outputFormat: Dynamsoft.DWT.EnumDWT_OCRConnectorOutputFormat | number,  
  path: string
): Promise<boolean>;
```

**Parameters**

`indices`: Indices of the pages to save.

`outputFormat`: Please refer to [`EnumDWT_OCRConnectorOutputFormat`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_ocrconnectoroutputformat).

`path`: System's absolute path or filename for saving. A file saving dialog will appear for confirmation.

**Return Values**

Promise of a `boolean` result indicating the success of the operation.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">Windows</td>
<td align="center">macOS</td>
<td align="center">Linux</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">v19.5+ </td>
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
  outputFormat: Dynamsoft.DWT.EnumDWT_OCRConnectorOutputFormat | number
): Promise<string>;
```

**Parameters**

`indices`: Indices of the pages to save.

`outputFormat`: Please refer to [`EnumDWT_OCRConnectorOutputFormat`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_ocrconnectoroutputformat).

**Return Values**

Promise of a base64 string result.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">Windows</td>
<td align="center">macOS</td>
<td align="center">Linux</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">v19.5+ </td>
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
  outputFormat: Dynamsoft.DWT.EnumDWT_OCRConnectorOutputFormat | number
): Promise<Blob>;
```

**Parameters**

`indices`: Indices of the pages to save.

`outputFormat`: Please refer to [`EnumDWT_OCRConnectorOutputFormat`](/_articles/info/api/Dynamsoft_Enum.md#dynamsoftdwtenumdwt_ocrconnectoroutputformat).

**Return Values**

Promise of a `Blob` object.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">Windows</td>
<td align="center">macOS</td>
<td align="center">Linux</td>
</tr>

<tr>
<td align="center">v19.3+ </td>
<td align="center">v19.5+ </td>
<td align="center">not supported</td>
</tr>

</table>
</div>

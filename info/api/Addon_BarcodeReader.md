---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API Reference - BarcodeReader Addon APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, BarcodeReader Addon APIs
breadcrumbText: Barcode Reader Addon
description: Dynamic Web TWAIN SDK Documentation API Reference BarcodeReader Addon APIs Page
permalink: /info/api/Addon_BarcodeReader.html
---

# `{WebTwainObject}.Addon.BarcodeReader`

> {WebTwainObject} denotes the `WebTwain` instance.

**Methods**

|                                                                                            |
| :----------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| [`decode()`]({{site.info}}api/Addon_BarcodeReader.html#decode)                             | [`getRuntimeSettings()`]({{site.info}}api/Addon_BarcodeReader.html#getruntimesettings)                       | [`updateRuntimeSettings()`]({{site.info}}api/Addon_BarcodeReader.html#updateruntimesettings) |
| [`resetRuntimeSettings()`]({{site.info}}api/Addon_BarcodeReader.html#resetruntimesettings) | [`initRuntimeSettingsWithString()`]({{site.info}}api/Addon_BarcodeReader.html#initruntimesettingswithstring) |

---

## decode()

Read an image in the buffer and try to locate and decode barcode(s) on it. Please refer to [`TextResult`]({{site.info}}api/interfaces.html#textresult).

**Syntax**

```typescript
decode(index: number): Promise<TextResult[]> ;
```

**Parameters**

`index`: Specify the image to decode.

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.1+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## getRuntimeSettings()

Return the current runtime settings or the settings of the specified built-in template. Please refer to [`RuntimeSettings`]({{site.info}}api/Interfaces.html#runtimesettings).

The template can only be "speed", "balance", or "coverage". 

**Syntax**

```typescript
getRuntimeSettings(template?: string): Promise<RuntimeSettings> ;
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
<td align="center">v14.3.1+ </td>
<td align="center">v14.1+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## updateRuntimeSettings()

Update the runtime settings with a given object or use the string "speed", "balance", or "coverage" to use our preset settings. The default setting is "coverage".

**Syntax**

```typescript
updateRuntimeSettings(settings: RuntimeSettings): Promise<RuntimeSettings> ;
```

**Parameters**

`settings`: Specify the runtime settings. Please refer to [`RuntimeSettings`]({{site.info}}api/Interfaces.html#runtimesettings).

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
<td align="center">v14.3.1+ </td>
<td align="center">v14.1+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

**Example**

```javascript
DWTObject.Addon.BarcodeReader.getRuntimeSettings("balance")
  .then(function (settings) {
    settings.barcodeFormatIds = Dynamsoft.DBR.EnumBarcodeFormat.BF_ONED;
    return DWTObject.Addon.BarcodeReader.updateRuntimeSettings(settings);
  })
  .then(function () {
    DWTObject.Addon.BarcodeReader.decode(0).then(
      function (textResult) {
        console.log(textResult);
      },
      function (ex) {
        console.log(ex.message || ex);
      }
    );
  });
```

---

## resetRuntimeSettings()

Reset all runtime settings to default values. Please refer to [`RuntimeSettings`]({{site.info}}api/Interfaces.html#runtimesettings).

**Syntax**

```typescript
resetRuntimeSettings(): Promise<RuntimeSettings> ;
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
<td align="center">v14.3.1+ </td>
<td align="center">v14.1+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>

---

## initRuntimeSettingsWithString()

Set up the barcode reader with advanced settings.

**Syntax**

```typescript
initRuntimeSettingsWithString(
    settings: string
): Promise<RuntimeSettings> ;
```

**Parameters**

`settings`: The runtime setting in the form of a string.

**Return value**

Please refer to [`RuntimeSettings`]({{site.info}}api/Interfaces.html#runtimesettings).

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
<td align="center">v16.0+ </td>
<td align="center">v16.0+ </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
<td align="center">not supported </td>
</tr>

</table>
</div>
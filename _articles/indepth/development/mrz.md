---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Development - MRZ Scanner Integration
keywords: Dynamic Web TWAIN, Documentation, Development, MRZ, MRZ Scanner, Integration
breadcrumbText: MRZ Scanner Integration
description: Dynamic Web TWAIN SDK Documentation MRZ Scanner Integration Page
---

# Integrating the MRZ Scanner into a Dynamic Web TWAIN Application

One of the solutions that Dynamsoft offers is the [MRZ Scanner](https://www.dynamsoft.com/use-cases/mrz-scanner/), which is built on the foundational products [Dynamsoft Label Recognizer]({{ site.dcv }}core/introduction/?ver=latest&ver=latest#dynamsoft-label-recognizer) and the [Dynamsoft Code Parser]({{ site.dcv }}core/introduction/?ver=latest&ver=latest#dynamsoft-code-parser). This solution allows the user to scan MRZs in a web or native mobile application, either via a camera or static images from the local photo library.

In this article, we will address how you can integrate the MRZ Scanner JavaScript Edition with Dynamic Web TWAIN to read the Machine-Readable Zone (MRZ) of passports, ID cards, and visas from scanned or loaded images, without the need for a camera input. For each document, the sample shows the parsed MRZ fields, a cropped image of the card or passport page, and the holder's portrait when one is found.

> [!NOTE]
> You can download the [full sample code](https://github.com/Dynamsoft/web-twain-codelab/tree/main/with-other-sdks/mrz-scanner) from the Dynamic Web TWAIN Codelab Github repository. The sample is split across several files, so this article explains how the pieces fit together and points you to the relevant code rather than reproducing all of it. Please use this sample as reference when building your own application.

## Initialization

Dynamic Web TWAIN (DWT for short) allows users to acquire images from scanners in a web application, as well as load or download existing documents. One of the advantages of using Dynamic Web TWAIN is that it allows the user to load in PDFs as well as images. So whether you are loading in a local image or acquiring an image from a physical scanner, Dynamic Web TWAIN keeps things simple and implements these features with a few simple API.

In this integration, Dynamic Web TWAIN controls the scanner and keeps the scanned pages in its image buffer, and the MRZ Scanner reads them.

### Setting up the Resources

Both SDKs are loaded from the jsDelivr CDN, so you don't need to host the DWT Resources folder yourself. The sample's [`index.html`](https://github.com/Dynamsoft/web-twain-codelab/blob/main/with-other-sdks/mrz-scanner/index.html) includes one script tag for each SDK:

```html
<script src="https://cdn.jsdelivr.net/npm/dwt@19.4.4/dist/dynamsoft.webtwain.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/dynamsoft-mrz-scanner@4.0.0/dist/mrz-scanner.bundle.js"></script>
```

Both SDKs extend the same `Dynamsoft` global, so the order of these tags does not matter. The machine running the browser also needs the **Dynamic Web TWAIN Service**. If it is not installed, the page prompts the user to download it.

Each SDK needs its own license key. Set them in `DWT_LICENSE_KEY` and `MRZ_LICENSE_KEY` at the top of [`js/shared.js`](https://github.com/Dynamsoft/web-twain-codelab/blob/main/with-other-sdks/mrz-scanner/js/shared.js). The public trial key included in the sample stops working after 24 hours of use. You can request a free trial key for each product from the [Customer Portal](https://www.dynamsoft.com/customer/license/trialLicense).

> [!NOTE]
> The Web TWAIN version is set in two places: `DWT_VERSION` in `js/shared.js` and the `<script>` tag in `index.html`. Make sure to update both together.

Loading PDFs may also require the PDF Rasterizer module in your Web TWAIN license. Web TWAIN reads image-only PDFs on its own, but it uses the PDF Rasterizer to convert any other PDF into images. Trial licenses include the PDF Rasterizer. For details, see [supported file formats](/_articles/introduction/supported-file-formats.md#pdf).

To learn more about setting up DWT and the license key, please refer to the [General Usage]({{ site.general-usage }}index.html) page of the DWT docs. For the implementation that this guide will address, we will keep it to the basic functionalities of DWT, which is to [acquire images from a scanner]({{ site.general-usage }}scanner-image-acquisition.html) and [load documents from local files]({{ site.extended-usage }}file-import.html).

### Initializing Dynamic Web TWAIN and the MRZ Scanner

Dynamic Web TWAIN is set up in `initDWT()` in [`js/scanner.js`](https://github.com/Dynamsoft/web-twain-codelab/blob/main/with-other-sdks/mrz-scanner/js/scanner.js). It sets the license key and the CDN resource path, creates the WebTwain object with [`CreateDWTObjectEx()`](/_articles/info/api/Dynamsoft_WebTwainEnv.md#createdwtobjectex), and binds the viewer to the `dwtcontrolContainer` element. It also registers [`OnBufferChanged`](/_articles/info/api/WebTwain_Buffer.md#onbufferchanged), so that the sample is notified whenever images are scanned, loaded, removed, or edited.

The same file handles image acquisition:

- **Scanning:** Instead of the native source selection dialog, the sample lists the available scanners in a dropdown with [`GetSourceNamesAsync()`](/_articles/info/api/WebTwain_Acquire.md#getsourcenamesasync). It then scans with [`AcquireImageAsync()`](/_articles/info/api/WebTwain_Acquire.md#acquireimageasync) in color at 300 DPI, since MRZ recognition degrades badly on black-and-white scans. The feeder and duplex settings are always set explicitly, because some drivers fail when they are left out.
- **Loading files:** [`LoadImageEx()`](/_articles/info/api/WebTwain_IO.md#loadimageex) opens the system's file dialog and loads images or PDF pages straight into the buffer.

The MRZ Scanner is created in `getMRZScanner()` in [`js/reader.js`](https://github.com/Dynamsoft/web-twain-codelab/blob/main/with-other-sdks/mrz-scanner/js/reader.js). Unlike the previous version of this sample, which used the foundational Capture Vision API, the integration now uses the [MRZ Scanner API](https://www.dynamsoft.com/mrz-scanner/docs/web/api/mrz-scanner.html) directly:

```js
mrzScanner = new Dynamsoft.MRZScanner({
    license: MRZ_LICENSE_KEY,
    container: "#mrzScannerHost",
    templateFilePath: new URL("assets/mrz-template.json", location.href).href,
    returnOriginalImage: false,
    returnDocumentImage: true,
    returnPortraitImage: true,
});
```

A few things to note about this configuration:

- The MRZ Scanner needs a real container for its loading overlay. Since reading from images never opens a camera view, the sample places the `mrzScannerHost` container off-screen.
- The sample uses a custom template instead of the MRZ Scanner's default one. See [The custom template](#the-custom-template).
- Dynamic Web TWAIN already shows the original image, so the sample only asks the MRZ Scanner for the cropped document image and the portrait.

## Implementing the MRZ Reader

Now that DWT and the MRZ Scanner are initialized, it's time to look at the MRZ reading portion of the code. For most scans, passing a page from DWT to the MRZ Scanner takes a single call:

```js
const result = await mrzScanner.launch(DWTObject.GetImageURL(index));
```

[`GetImageURL()`](/_articles/info/api/WebTwain_Buffer.md#getimageurl) returns a URL that the local Dynamic Web TWAIN Service serves, and `launch()` downloads the image from that URL. The service allows these cross-origin requests, so no extra setup is needed.

This call lives in `readImage()` in [`js/reader.js`](https://github.com/Dynamsoft/web-twain-codelab/blob/main/with-other-sdks/mrz-scanner/js/reader.js). The returned result contains the parsed MRZ fields in `result.data`, the cropped document image via `result.getDocumentImage()`, and the portrait via `result.getPortraitImage()`. The table of MRZ fields is built in `buildFields()` in [`js/render.js`](https://github.com/Dynamsoft/web-twain-codelab/blob/main/with-other-sdks/mrz-scanner/js/render.js), which uses the `Dynamsoft.EnumMRZData` keys and `Dynamsoft.MRZDataLabel` labels provided by the MRZ Scanner. You no longer need to parse the individual fields, dates, and document types yourself.

> [!IMPORTANT]
> `launch()` throws an error if it is called again before the previous read finishes. The sample sends every read through a single queue (`enqueue()` in `js/reader.js`). If you adapt the sample and remove the queue, make sure that reads still cannot overlap.

The sample also checks the MRZ license once with `Dynamsoft.LicenseManager.initLicense()` before the first read, since `launch()` would otherwise show a license error for every image.

### Scans Already Cropped by the Scanner

Along with the MRZ fields, the MRZ Scanner returns a cropped and straightened image of the card or passport page. To crop, it looks for the edges of the document against the background around it.

Many TWAIN card scanners crop each scan to the edges of the card. That leaves no background around the card, so the MRZ Scanner has no edges to find, and it crops the image differently every time. The sample treats a scan as pre-cropped when it is about passport-page size or smaller, which it works out from the image's pixel size and DPI (scans with no DPI value are never treated as pre-cropped). For these scans, the sample:

1. Copies the scan out of Web TWAIN with [`ConvertToBlob()`](/_articles/info/api/WebTwain_IO.md#converttoblob) and draws it on a canvas with a black border, which gives the MRZ Scanner edges to find the card and its portrait. The canvas is then passed to `launch()` instead of the image URL.
2. Shows the original scan, without the border, as the cropped image.

This step is required for consistent results, and no template setting replaces it. See `isTrimmedToDocument()`, `getScanBitmap()`, and `drawOnCanvas()` in `js/reader.js`.

### The Custom Template

The sample loads [`assets/mrz-template.json`](https://github.com/Dynamsoft/web-twain-codelab/blob/main/with-other-sdks/mrz-scanner/assets/mrz-template.json) instead of the MRZ Scanner's default template. Only the part that finds the edges of the card or passport is changed:

| Scan | What the template changes |
| --- | --- |
| Passport on the glass of a flatbed | Edge detection runs on a copy scaled down to 1024 px on its shorter side, with settings tuned for a pale passport on a white background. |
| ID card on a large black page (macOS ICA) | `MinQuadrilateralAreaRatio: 5` lets the card take up as little as 5% of the image. The default setting ignores a card at about 10% of the page. |

MRZ reading and parsing are unchanged, and the cropped image still comes from the full-resolution scan. The template keeps only `ReadAll`, the one template the sample uses.

### Running the Sample

Please note that in order to properly function, the sample will need to be hosted on a server. The scripts are ES modules, and browsers do not load modules from `file://` URLs.

If you are using VS Code, a quick and easy way to serve the project is using the [Live Server (Five Server) VSCode extension](https://marketplace.visualstudio.com/items?itemName=yandeu.five-server). Simply install the extension, open the `index.html` file in the editor, and click "Go Live" in the bottom right corner of the editor. This will serve the application at `http://127.0.0.1:5500/`. Alternatively, you can also use IIS or Github Pages to quickly serve your application.

Plain HTTP is fine on `localhost`. To open the sample from another machine on your network, serve it over HTTPS.

## Final Comments

This sample was built on Dynamic Web TWAIN and version 4 of the MRZ Scanner JavaScript Edition. For a full description of every file in the sample, please see the sample's [README](https://github.com/Dynamsoft/web-twain-codelab/blob/main/with-other-sdks/mrz-scanner/README.md). Here are some references to check out:

- [Dynamic Web TWAIN User Guide]({{ site.general-usage }}index.html)
- [MRZ Scanner JavaScript Edition User Guide](https://www.dynamsoft.com/mrz-scanner/docs/web/guides/mrz-scanner.html)
- [Dynamic Web TWAIN API Reference]({{ site.api }})
- [MRZ Scanner JavaScript Edition API Reference](https://www.dynamsoft.com/mrz-scanner/docs/web/api/mrz-scanner.html)

If there are any questions regarding this sample or your own implementation, please feel free to contact the [Dynamsoft Support Team](https://www.dynamsoft.com/company/contact/).

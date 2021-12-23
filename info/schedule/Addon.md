---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Dynamic Web TWAIN Schedule - Addon Release
keywords: Dynamic Web TWAIN, Documentation, Schedule, Addon Release
breadcrumbText: Addons
description: Dynamic Web TWAIN SDK Documentation Schedule - Addon Release Page
---

# DWT Core and Addon

## Recent Version Matches

| Version | Service | Core | PDFR | Barcode | Camera | OCRB | OCRPro| Uploader | 
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| v17.1 | 1.7.1.0525 | 1.7.1.0525 | 11.2.0.0330 | 8.2.0.0525 | 15.0.0.0625 | 10.0.0.0618 | 1.2.0.0806 | 1.7.0.0525 |
| v17.0 | 1.7.0.0330 | 1.7.0.0330 | 11.0.0.0330 | 8.2.0.0330 | 15.0.0.0625 | 10.0.0.0618 | 1.2.0.0806 | 1.7.0.0330 |
| v16.2 | 1.6.2.0112 | 16.2.0.0112 | 11.1.0.112 | 7.6.0.0112 | 15.0.0.0625 | 10.0.0.0618 | 1.2.0.0806 | 1.6.0.0428 |
| v16.1.1 | 1.6.1.0728 | 16.1.0.0728 | 11.0.0.0428 | 7.4.0.0428 | 15.0.0.0625 | 10.0.0.0618 | 1.2.0.0806 | 1.6.0.0428 |
| v15.3.1 | 1.5.3.0107 | 15.3.0.0116 | 10.3.3.0924 | 7.3.0.0107 | 15.0.0.0625 | 10.0.0.0618 | 1.2.0.0806 | 1.4.0.0107 |
| v14.3.1 | 1.4.1.0115 | 14.3.1.0115 | 10.3.0.0712 | 6.4.1.0115 | 14.3.1.0115 | 10.0.0.0618 | 1.2.0.0806 | 1.2.1.0115 |

## PDFR

It is a light-weighted PDF library working with Dynamic Web TWAIN SDK on the client side to convert text-based PDF files into images and display in the image viewer.

### `11.0.0.0428` (6/18/2020)

#### IMPROVED

This addon now works both in the Local-Service mode and the WASM mode.
This addon now works on iOS, iPadOS & Android too.

### `10.3.1.0124` (06/27/2019)

#### IMPROVED

* [HTML5 on Windows] Changed the old DLL names to reflect the fact that they only work as the rasterizer.
* [HTML5 on Windows] Removed the old PDF. Download method.
* [HTML5 on Windows] Removed license limitation on the method IsTextBasedPDF so that it can always be used regardless of whether a license is in place.

### `10.3.0.0712` (9/06/2018)

#### IMPROVED

* Added the version number of the library to the name of the library so that different versions of the library can co-exist.
* Added a method `IsModuleInstalled()` to detect whether the library has been installed on the client machine.
* Updated the library to version 10.3.0.0712 which is more stable and uses the memory more efficiently. The new library also has fixed a bug where a loaded PDF may appear tilted.

### `10.2.0.1123` (7/17/2018)

#### FIXED

* Fixed the typo `EnumDWT_ConverMode` to `EnumDWT_ConvertMode`

### `10.2` (1/16/2018)

#### IMPROVED

* Upgraded the current PDF Rasterizer engine for Windows client.

#### NEW

* Added support for macOS client and Linux client.

### `9.6` (03/01/2016)

#### NEW

* Added PDF Rasterizer Add-on to convert text-based PDF files to images. This way, text PDF files can be successfully displayed in the viewer of the Dynamic Web TWAIN Scanner Core module. Available APIs are:
  + `Addon.PDF.SetConvertMode()` : to turn on or off the PDF rasterizer feature.
  + `Addon.PDF.Download()` : to deploy the PDF library from the server side to the client machine.
  + `Addon.PDF.SetPassword()` : set the password to decrypt the targeted PDF file.
  + `Addon.PDF.SetResolution()` : to set the output image resolution.
  + `Addon.PDF.IsTextBasedPDF()` : to detect if a PDF file is text-based or not.

## Barcode Reader

A professional linear & 2D barcode reading library for recognizing barcode from any document captured from scanners, cameras or file systems.

### `8.2` (04/20/2021)

* Added support for MSI Code (Modified Plessey).
* Improved the recognition accuracy for GS1 Databar.
* Improved the localization robustness for QR Code.
* Improved the localization for low quality 1D barcodes.
* Improved the deblurring performance and recognition rate for DataMatrix.
* Improved the recognition rate for Aztec.
* Improved both the localization and decoding algorithms for Postal Codes


### `7.4.0.0428` (06/18/2020)

* This addon has been redesigned with brand-new APIs.
* This addon now works both in the Local-Service mode and the WASM mode.
* This addon now works on iOS, iPadOS & Android too.

### `7.3.0.0107` (01/07/2020)

* Updated the library to version 7.3.
* Removed independent service checking logic.

### `7.1` (09/19/2019)

* Updated the library to version 7.1.

### `7.0` (08/13/2019)

* Updated the library to version 7.0.

### `6.5.2.0627` (06/27/2019)

* Updated the library to version 6.5.2.

### `6.4.1.0115` (01/15/2019)

* Expanded the Barcode Reader feature to the ActiveX.
* Updated the Barcode reader libraries to version 6.4.1.

### `6.3` (09/18/2018) (Since DWT 14.1)

* Check out DBR news for more info.

### `5.2` (09/18/2017)

#### IMPROVED

* Improved the localization and recognition algorithms for PDF417 barcodes.
* Optimized the de-blur algorithm for 1D barcodes to improve the recognition accuracy.
* Optimized the timeout support. Now it is possible to stop barcode recognition by timeout.
* Increased QR Code and DataMatrix barcode recognition speed for B&W images.

### `5.1` (06/20/2017) (since DWT 13.0)

#### NEW

* Reconstructed the barcode reader SDKs to closely working with the Scanner Core module of the Dynamic Web TWAIN SDK.
* Added support for reading barcodes from a base64 string image.
* New de-blur algorithm for 1D barcodes to improve the accuracy when scanning linear barcodes from out-of-focus, blurred images.
* Added new APIs that enable you to specify page numbers, barcode regions and barcode angles for barcode detection. These greatly improve the decoding workflow and barcode reading efficiency.
* Added ImageCaptureDevice API to set the capture device (scanner, camera or fax) being used to scan barcode images. When set, it will use a better and more appropriate image processing technique to the images captured from that device.
* Added BarcodeColorMode API to set the ink color for barcodes searching.
* Added BarcodeTextEncoding API to set barcode text encoding mode so that you can display special characters properly.
* Added TimeoutPerPage API to set the maximum amount of time for reading barcodes on one page.
* Added Angle property to return the rotation angle of a detected barcode.

#### IMPROVED

* Updated barcode reader library with improved positioning algorithm that can better identify and locate DataMatrix barcodes.

### `4.3` (10/13/2016) (DWT12.1~12.3.1)

#### NEW

* New localization algorithm was implemented for 1D barcode scanning to improve barcode reading speed.
* New multi-thread processing was implemented for 2D barcode reading to improve decoding accuracy.

#### IMPROVED

* Improved recognition for perspective QR Codes.
* Optimized decoding performance for large size, special angle and multiple 1D barcodes.
* Other small fixes and tweaks.

### `4.2` (04/08/2016) (DWT12.0)

#### IMPROVED

* Changed 1D barcode decoding module to improve recognition accuracy.

### `4.1` (01/21/2016) (11.3~11.3.2)

#### IMPROVED

* Improved positioning algorithm to better identify and localize DataMatrix barcodes.

### `4.0` (07/23/2015) (11.2)

#### NEW

* Added CodeBar, Code_93, EAN_8, EAN_13, ITF, UPC_A, UPC_E support to the 1D Barcode Reader module.
* Added support for PDF417 and DataMatrix.

### `3.0` (08/13/2015) (DWT11.1)

#### NEW

* Added support for QR Code and Industrial 2 of 5.

### `2.0` (07/17/2015) (DWT11.0, internal barcode dll version 9.6)

#### NEW

* Added support for reading CodeBar, Code_93, EAN_8, EAN_13, ITF, UPC_A, UPC_E.

#### FIXED

* Fixed the bug in the Barcode Reader add-on where barcode location fails for 200 DPI.

### `1.0` (01/20/2015) (since DWT10.1~10.2, internal barcode dll version 9.5)

* Updates in this version include 1D barcode improvements in accuracy and performance for Code 39 and Code128 recognition. Also image preprocessing is improved. For Code 128, the recognition ratio and speed have jumped up by as much as 30 percent.

## Desktop Webcam Capture

### `15.0` (06/27/2019)

#### IMPROVED

* Fixed a bug where the video stream may appear distorted if the DIV to put the stream has a different aspect ratio.

### `14.3.1` (01/15/2019)

#### IMPROVED

* Added a new method `IsModuleInstalled()` to detect whether the webcam module has already been installed on the local system.
* The method `GetImageURL()` and `GetImagePartURL()` are renamed to `GetFrameURL()` and `GetFramePartURL()` .
* Fixed a bug where the memory may fail to be freed after a frame is captured either by `CaptureImage()` or `GetFramePartURL()` .

### `14.2.0.1022` (11/20/2018)

#### IMPROVED

* Added Webcam addon back for Windows with a new feature to embed the video stream on the page.

## OCR

### `1.1.0.0625` (08/13/2019)

* [OCRPro] Added a feature to read multiple zones in one OCR operation.

### `1.1.0.0625` (06/27/2019)

* [OCRPro] Fixed a bug where the OCR result may not be readable when the target language is Arabic.

### `1.0.0.425` (11/20/2018)

* [OCRPro] Added a new feature to allow multiple OCR processes to run concurrently on the server side.

### `1.0.0.425` (09/06/2018)

* [OCRPro & OCRB] Added the version number of the library to the name of the library so that different versions of the library can co-exist.
* [OCRPro & OCRB] Added a method `IsModuleInstalled()` to detect whether the library has been installed on the client machine.

### `1.0.0.425` (07/17/2018)

* [OCRPro] Better mechanism to verify the OCR license.

### `1.0` (07/05/2016)

* [OCRPro] Added OCR Professional (OCR Pro) module. The module uses Kofax's OCR engine. It only works on Windows.

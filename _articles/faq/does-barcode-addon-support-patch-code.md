---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Does your Barcode Reader addon support patch code?
keywords: Dynamic Web TWAIN, Addon, patch code
breadcrumbText: Does your Barcode Reader addon support patch code?
description: Does your Barcode Reader addon support patch code?
date: 2021-12-01 01:09:41 +0800
last_modified: 2022-06-10 04:40:03 +0800
---

# Addon

## Does your Barcode Reader addon support patch code?

Yes, the add-on supports the patch code format (API <a href="https://www.dynamsoft.com/barcode-reader/parameters/enum/format-enums.html" target="_blank">EnumBarcodeFormatPATCHCODE</a>).
Check <a href="https://www.dynamsoft.com/barcode-reader/features/#Supported-Barcode-Types" target="_blank">here</a> for all supported barcode types.

By default, the add-on reads all the supported barcode types from the image. To read specific barcode types, you can use barcodeFormatIds and barcodeFormatIds2 in runtime settings. For patch code, you would use:
barcodeFormatIds = Dynamsoft.DBR.EnumBarcodeFormat.BF_ONED

More information can be found here: [Specify the Barcode Type(s) to Read](/_articles/extended-usage/barcode-processing.md#specify-the-barcode-types-to-read){:target="_blank"}.

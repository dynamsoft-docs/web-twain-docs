---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error message - You have exceeded the number of OCR attempts allowed by the current license
keywords: Dynamic Web TWAIN, Error Troubleshooting, exceeded OCR attempts
breadcrumbText: Error message - You have exceeded the number of OCR attempts allowed by the current license
description: Error message - You have exceeded the number of OCR attempts allowed by the current license
date: 2021-12-03 23:26:46 +0800
last_modified: 2022-10-21 14:05:54 +0800
---

# Error Troubleshooting

## Error message - You have exceeded the number of OCR attempts allowed by the current license

### Symptom

When you use the OCRPro addon, you may receive this error message returned by the member method [GetErrorString()](/_articles/info/api/Addon_OCR.md#recognizeselectedimages){:target="_blank"} of the OCRResult class.

### Cause

The license quota has been used up and extra quota needs to be purchased. The OCRPro licenses are yearly licenses and each license has a limitation on the number of pages allowed to be OCR'ed. The SDK will throw this error when the limitation is reached.

### Solution

Contact <a href="mailto:support@dynamsoft.com" target="_blank">Dynamsoft Support</a> for any assistance.

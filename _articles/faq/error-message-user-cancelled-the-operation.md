---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error message - User cancelled the operation
keywords: Dynamic Web TWAIN, Error Troubleshooting, product key does not support version
breadcrumbText: Error message - User cancelled the operation
description: Error message - User cancelled the operation
---

# Error Troubleshooting

## Error message - User cancelled the operation

### Symptom

You may encounter the error "user cancelled the operation" after successfully scanning all pages. But you can still run the application normally.

### Cause

1) The user manually terminated the ongoing operation.

2) This is known to happen if you use a **WIA/WIATWAIN** driver instead of TWAIN driver. Our SDK is developed based upon the TWAIN protocol, therefore the performance in WIA driver cannot be guaranteed.

### Resolution

(For versions prior to v18.2) To prevent any issues related to the WIA driver, we recommend using the TWAIN driver provided by the manufacturer.
<br>
(For v18.2 and above) To mitigate potential problems with the WIATWAIN driver, we suggest using either the TWAIN driver from the manufacturer or the WIA driver, which is officially supported starting from version v18.2.
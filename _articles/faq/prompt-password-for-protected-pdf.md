---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I prompt users for a password when loading a password-protected PDF?
keywords: Dynamic Web TWAIN, Addon, PDF, password, encrypted, LoadImageEx, OnPostLoad
breadcrumbText: How can I prompt users for a password when loading a password-protected PDF?
description: How can I prompt users for a password when loading a password-protected PDF?
date: 2026-04-09 10:00:00 +0800
last_modified: 2026-04-09 10:00:00 +0800
---

# Addon

## How can I prompt users for a password when loading a password-protected PDF?

Dynamic Web TWAIN does not provide a built-in password prompt UI for encrypted PDFs.  
You need to implement your own prompt flow in application code.

### Recommended flow for `LoadImage()` / `LoadImageEx()`

1. Call [`LoadImage()`](/_articles/info/api/WebTwain_IO.md#loadimage) or [`LoadImageEx()`](/_articles/info/api/WebTwain_IO.md#loadimageex).
2. In the failure callback, check whether `errorCode` is `-1119`.
3. Prompt the user for a password.
4. Call [`SetReaderOptions()`](/_articles/info/api/Addon_PDF.md#setreaderoptions) with that password.
5. Retry loading the same PDF.

```javascript
function loadProtectedPdf(path, password) {
    DWTObject.Addon.PDF.SetReaderOptions({ password: password || "" });
    DWTObject.LoadImageEx(
        path,
        Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF,
        function () {
            console.log("PDF loaded successfully.");
        },
        function (errorCode, errorString) {
            if (errorCode !== -1119) {
                console.error(errorCode, errorString);
                return;
            }

            var userPassword = window.prompt(
                "This PDF is password-protected. Please enter the password:",
                "",
            );
            if (!userPassword) return;

            loadProtectedPdf(path, userPassword);
        },
    );
}
```

### For drag-and-drop files

You can detect load failures in [`OnPostLoad`](/_articles/info/api/WebTwain_IO.md#onpostload) by checking `DWTObject.ErrorCode` and `DWTObject.ErrorString`.

```javascript
DWTObject.RegisterEvent("OnPostLoad", function (path, name, type) {
    if (DWTObject.ErrorCode === -1119) {
        console.log(DWTObject.ErrorString);
        // Add your own password prompt flow here.
    }
});
```

> [!NOTE]
> In `OnPostLoad`, `path` is empty for drag-and-drop files.
> If you need a retry flow after entering a password, prompt the user to select the file again
> (for example, by using [`ShowFileDialog()`](/_articles/info/api/WebTwain_IO.md#showfiledialog) + [`LoadImageEx()`](/_articles/info/api/WebTwain_IO.md#loadimageex)).

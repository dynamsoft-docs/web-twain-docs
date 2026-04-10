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
You need to handle the prompt and retry flow in your application code.

### Recommended workflow (`LoadImage()` / `LoadImageEx()`)

1. Call [`LoadImage()`](/_articles/info/api/WebTwain_IO.md#loadimage) or [`LoadImageEx()`](/_articles/info/api/WebTwain_IO.md#loadimageex).
2. In the failure callback, treat the error as "password required" only when either condition is true:
   - (`errorCode` is `-1119` and `errorString` contains  
     `"Failed to read the PDF file because it's encrypted and the correct password is not provided."`)
   - OR `errorCode` is `-1120`.
3. Prompt the user for a password.
4. Set the password via [`SetReaderOptions()`](/_articles/info/api/Addon_PDF.md#setreaderoptions).
5. Retry loading the same PDF.

### Helper function for password-required errors

Use this helper in both API-based loading and drag-and-drop handling:

```javascript
function isPasswordRequired(errorCode, errorString) {
    return (
        (errorCode === -1119 &&
            (errorString || "").includes(
                "Failed to read the PDF file because it's encrypted and the correct password is not provided.",
            )) ||
        errorCode === -1120
    );
}
```

### `LoadImage()` / `LoadImageEx()` example

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
            if (!isPasswordRequired(errorCode, errorString)) {
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

### Drag-and-drop workflow (`OnPostLoad`)

Use [`OnPostLoad`](/_articles/info/api/WebTwain_IO.md#onpostload) and check `DWTObject.ErrorCode` / `DWTObject.ErrorString`.

```javascript
DWTObject.RegisterEvent("OnPostLoad", function (path, name, type) {
    if (!isPasswordRequired(DWTObject.ErrorCode, DWTObject.ErrorString)) return;

    var userPassword = window.prompt(
        "This PDF is password-protected. Please enter the password:",
        "",
    );
    if (!userPassword) return;

    DWTObject.Addon.PDF.SetReaderOptions({ password: userPassword });

    if (!path) {
        alert("Password saved. Please drag and drop the file again.");
        return;
    }

    var fullPath = path + "\\" + name;
    loadProtectedPdf(fullPath, userPassword);
});
```

> [!NOTE]
> `-1119` can represent multiple PDF load issues, so do not use it alone.
> Starting in Dynamic Web TWAIN 19.4, encrypted-PDF load failures will use `-1120`.
>
> In `OnPostLoad`, `path` is empty for drag-and-drop files, so the code cannot directly retry with a file path.
> In this case, prompt for password, save it with `SetReaderOptions()`, and ask the user to drag and drop the file again.

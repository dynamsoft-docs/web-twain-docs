---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I generate/load an encrypted file in PDF format?
keywords: Dynamic Web TWAIN, Security, encrypt PDF
breadcrumbText: Can I generate/load an encrypted file in PDF format?
description: Can I generate/load an encrypted file in PDF format?
---

# Security

## Can I generate/load an encrypted file in PDF format?

Yes. In v18.5, Dynaimc Web TWAIN supports the function of [`encrypting the generated PDF files`](/_articles/extended-usage/pdf-processing.md#pdf-save-settings).

Moreover, loading password-protected PDFs has been supported by utilizing the [`ReaderOptions`](/_articles/info/api/interfaces.md#readeroptions) interface along with the [`SetReaderOptions()`](/_articles/info/api/Addon_PDF.md#setreaderoptions) method.

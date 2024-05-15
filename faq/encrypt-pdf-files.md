---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I generate/load an encrypted file in PDF format?
keywords: Dynamic Web TWAIN, Security, encrypt PDF
breadcrumbText: Can I generate/load an encrypted file in PDF format?
description: Can I generate/load an encrypted file in PDF format?
permalink: /faq/encrypt-pdf-files.html
---

# Security

## Can I generate/load an encrypted file in PDF format?

Yes. In v18.5, Dynaimc Web TWAIN supports the function of [`encrypting the generated PDF files`]({{site.indepth}}features/pdf.html#pdf-save-settings).

Moreover, loading password-protected PDFs has been supported by utilizing the [`ReaderOptions`]({{site.info}}api/Interfaces.html#readeroptions) interface along with the [`SetReaderOptions()`]({{site.info}}api/Addon_PDF.html#setreaderoptions) method.

---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I generate an encrypted file in PDF format?
keywords: Dynamic Web TWAIN, Security, encrypt PDF
breadcrumbText: Can I generate an encrypted file in PDF format?
description: Can I generate an encrypted file in PDF format?
permalink: /faq/encrypt-pdf-files.html
---

# Security

## Can I generate an encrypted file in PDF format?

No. Currently, Dynamic Web TWAIN does not support generating an encrypted file in PDF format. However, you can use other tools to generate encrypted PDF files.

Although Dynamic Web TWAIN does not support generating encrypted PDF files, loading password protected PDFs is supported through the use of the [`ReaderOptions`]({{site.info}}api/Interfaces.html#readeroptions) interface with [`SetReaderOptions()`]({{site.info}}api/Addon_PDF.html#setreaderoptions).

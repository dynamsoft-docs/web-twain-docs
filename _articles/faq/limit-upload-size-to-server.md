---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I limit the size of documents to be uploaded to my server?
keywords: Dynamic Web TWAIN, Security, limit upload size
breadcrumbText: Can I limit the size of documents to be uploaded to my server?
description: Can I limit the size of documents to be uploaded to my server?
---

# Security

## Can I limit the size of documents to be uploaded to my server?

Yes. You can use the API <a href="/web-twain/docs/info/api/WebTwain_IO.html#maxuploadimagesize" target="_blank">MaxUploadImageSize</a>.

Note that your web server may also impose maximum file upload size. For example, the default maximum file upload size in IIS6 is 4 MB and 28.6 MB for IIS7. You can change the maxAllowedContentLength value in web.config, IIS Manager, or ApplicationHost.config file.

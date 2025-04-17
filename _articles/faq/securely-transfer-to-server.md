---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I securely transfer scanned documents to my server?
keywords: Dynamic Web TWAIN, Security, securely transfer, server
breadcrumbText: How can I securely transfer scanned documents to my server?
description: How can I securely transfer scanned documents to my server?
---

# Security

## How can I securely transfer scanned documents to my server?

Dynamic Web TWAIN supports downloading/uploading documents via HTTPS.

To enable HTTPS,

- Set <a href="/web-twain/docs/info/api/WebTwain_IO.html#ifssl" target="_blank">IfSSL</a> to true to turn on SSL in HTTP requests

- Set the SSL port with the API <a href="/web-twain/docs/info/api/WebTwain_IO.html#httpport" target="_blank">HTTPPort</a>

- Call the API <a href="/web-twain/docs/info/api/WebTwain_IO.html#httpupload" target="_blank">HTTPUpload to upload the documents

To upload documents via HTTP/HTTPS, we recommend the API <a href="/web-twain/docs/general-usage/image-export/index.html#upload" target="_blank">here</a>.

> Note - that if you use this feature, you need to enable HTTPS on the server. For how to enable HTTPS, please check out the manual of your webserver.
